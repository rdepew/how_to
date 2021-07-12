# How to install and run Ignition Edge on Windows

## Network setup

You need to make sure that:
1. The PC with Ignition installed can see your MQTT broker.
2. Your ZumEdge can see your MQTT broker.
3. The PC you will be using can see the PC with Ignition
  installed.

## Download and install

This assumes you're installing on a Windows 10 system. The process will 
be similar for Linux, and instructions for Linux are on the Inductive
Automation website.

1. Go to https://www.inductiveautomation.com/ .
2. Click on the Download button in the upper right corner.
3. Click on the Download for Windows (or Linux) link.
4. Fill out the online form and click Download at the bottom.
5. Eventually you will end up with an installer file in your Downloads 
  folder.
6. Execute the installer, accepting all of the defaults.

## Open Ignition in a browser window.

1. Open a browser window.
  a. If you installed Ignition on your PC, you should be able to open it with
    the url http://localhost:8088 .
  b. If you installed Ignition on a different computer, you should be able 
    to open it with the URL http://the-other-computer-ip-address:8088 .
2. You will probably have to click through a License Agreement the first time.
3. If Ignition asks you for a username and password, username is `admin` and 
  password is `password`. No kidding.
4. If you see "Trial Expired" in an orange banner acros the top, click on
  the button that says "Login to Reset Trial". That's where you'll need
  to enter the username and password. THEN, click on the button in orange
  banner that says "Reset Trial". This is a free 2-hour trial license.
  Anytime that banner turns orange, click "Reset Trial" again to get another
  2 hours. Inductive Automation does not care how many times you click
  "Reset Trial".

## Configure Ignition

1. You will need to add a Module called "MQTT Engine". CirrusLink and 
  Ignition make it very difficult to find this module for download. To save
  you the trouble of searching for it, module, I have put it on the H: drive,
  at this location:
    H:\rdepew\MQTT-Engine-signed.modl
  Copy this module to your PC, or see the next step.
2. Or download it from this link. Go to 
  https://inductiveautomation.com/downloads/third-party-modules/
  Select your Ignition version (probably 8.0.14 or later), and scroll down
  to "MQTT Engine Module". Fill in the online form, if it asks for it, and
  then click Download.
3. To install the module, on the Ignition webpage select Config > Modules.
  Scroll to the bottom of the page, and select "Install or Upgrade a Module".
  Click Browse, select the .modl file, and then click Install.
4. Now when you select Config > Modules, and scroll to the bottom, you 
  should see MQTT Engine at the bottom of the list.
5. Select Config again, but not Modules. Scroll down to the bottom of the
  page, where you can see these two lines:
    MQTT ENGINE
    Settings
6. Click Settings.
7. Here is a list of parameters.
  General Tab
    Main
      Enabled yes
      Primary Host ID leave blank
      Group ID fFilters leave blank
    Miscellaneous
      Block Node Commands yes
      Block Device Commands yes
      Block Property Changes no
      File Policy Ignore
      File Location leave blank
      Store Historical Events yes
      Show advanced properties yes
      Enable tag Latching no
      Latch Timeout doesn't matter
      Latch Tags leave blank
      Filtered Properties whatever it says
      Enable BD Sequence Validation yes
      Custom Properties leave blank
    Save Changes
  Servers Tab
    Settings
      Chariot SCADA leave this there, do not delete, it's a fallback server
      (Or deleted it. Bob deleted it, and his setup works 100%.)
      Create new MQTT Server Setting
        Name Choose a name for the Mosquitto server you are currently using.
          Any name will do.
        Enabled yes
        URL If the IP address for your Mosquitto server is 192.168.1.30, then
          this will be tcp://192.168.1.30:1883 . The "tcp" and "1883" are
          important.
        Username If your Mosquitto server requires a username for MQTT 
          transactions, put it here. (It probably does not.)
        Change Password? If your Mosquitto server requires a password, 
          then yes. Otherwise, no.
        Password If your Mosquitto server requires a password for MQTT 
          transactions, put it here. (It probably does not.)
        TLS leave all of this alone for now
        Show Advanced Properties yes
          Client ID this is a name for the computer that is running Ignition.
            You can use its hostname, or make one up. All one word, with
            underscores (_).
          Keep Alive 30 or 60 are good values.
        Filtered Namespaces leave blank for now
    Save Changes
    Your MQTT broker should now be listed on the Servers page
    Certificates
      I think you can keep this blank
    Namespaces
      Default
        SparkplugB SparkplugB true
        Ignore the rest ...

## Start Ignition Designer

This is what you will use to test the MQTT Sparkplug B.

1. Click "Get Designer" in the upper right corner.
2. Click Download for Windows.
3. Follow the instructions to download and install Designer Launcher.
4. Now you should have an icon on your Windows desktop called 
  "Designer Launcher". 
5. Open "Designer Launcher". If it asks you for a username and password,
  try `admin` and `password`. If that doesn't work, contact me. There's
  another one somewhere in the instructions at inductiveautomation.com.
6. If Ignition is installed on your PC, you will need to Add Gateway,
  and the URL is http://localhost:8088. If Ignition is installed on
  another computer, you will need to Add Gateway, and the URL is
  http://the-other-computer-IP-address:8088.
7. On the Ignition Designer Launcher, select the gateway and click Launch.
8. Now you're on the "Open/Create Project" page.

## Create a Project.

1. If "New Project Setup" isn't showing, then click Create New > New Project.
2. Settings:
  Name and Title are up to you. 
    The Name is a word or two, the Title can be many words.
  User Source default
  Default Database DB
  Default Tag Provider default
  leave the rest blank, click Create New Project.
3. Open the project.

## How to use it

1. The project window includes several tabs. The one you need to concentrate on
  is the Tag Browser. This is where the MQTT nodes and devices show up.
2. But the Tag Browser is organized into folders. These are the "folders" that
   the customer refers to. Ignition Designer does not understand terms like
   "group name", "edge node id", or "device id". Ignition Designer does not
   understand "sensor" or "units". Ignition Designer understands "folders" and
   "tags".
3. So in the Tag Browser, you will see the following folder hierarchy.
  Tags
  System
  Vision Client Tags
  All Providers
  - default
  - MQTT Engine
  - - Data Types
  - - Edge Nodes <-- This is where the SparkplugB stuff will appear.

4. * REBOOT THE ZUM EDGE. *

5. If your ZumEdge is named "Curly", then the folders will look like this 
  after NBIRTH:
  Tags
  System
  Vision Client Tags
  All Providers
  - default
  - MQTT Engine
  - - Data Types
  - - Edge Nodes
  - - - FreeWaveEdge <-- This is the Group id
  - - - - Curly <-- This is the Edge Node id
  - - - - - Node Info
  - - - - - - bdseq 0 <-- This "tag" is the node birth/death sequence number.
6. Sensor data appears under the Node Info folder after DBIRTH and DDATA:
  Tags
  System
  Vision Client Tags
  All Providers
  - default
  - MQTT Engine
  - - Data Types
  - - Edge Nodes
  - - - FreeWaveEdge <-- This is the Group id
  - - - - Curly <-- This is the Edge Node id
  - - - - - Node Info
  - - - - - Sensor1 <-- This is the DeviceID in DBIRTH and DDATA
  - - - - - - Sensor Data <-- This "tag" is the Bierstadt sensor "units" field.
              If the Bierstadt sensor "units" is blank, then this tag is
              "Sensor Data". 
  - - - - - Sensor2
  - - - - - Sensor3
  - - - - - Sensor4

These are the folders and tags you should expect to see changing whenever
FreeWave Edge (or your MQTT publishing device)  publishes an MQTT message.
