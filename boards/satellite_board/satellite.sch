<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.1">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="yes" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="2X05">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-2.54" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-2.54" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-1.905" x2="-6.35" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="1.905" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="2.54" x2="3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.54" x2="-4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-2.54" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="2.54" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="2.54" x2="6.35" y2="1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-5.08" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-2.54" y="1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="0" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="0" y="1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="2.54" y="1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="5.08" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="5.08" y="1.27" drill="1.016" shape="octagon"/>
<text x="-6.35" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.35" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-5.334" y1="-1.524" x2="-4.826" y2="-1.016" layer="51"/>
<rectangle x1="-5.334" y1="1.016" x2="-4.826" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="1.016" x2="-2.286" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.016" layer="51"/>
<rectangle x1="-0.254" y1="1.016" x2="0.254" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-1.016" layer="51"/>
<rectangle x1="2.286" y1="1.016" x2="2.794" y2="1.524" layer="51"/>
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-1.016" layer="51"/>
<rectangle x1="4.826" y1="1.016" x2="5.334" y2="1.524" layer="51"/>
<rectangle x1="4.826" y1="-1.524" x2="5.334" y2="-1.016" layer="51"/>
</package>
<package name="2X05/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.985" x2="-5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.985" x2="5.08" y2="1.27" width="0.762" layer="21"/>
<pad name="2" x="-5.08" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="4" x="-2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="6" x="0" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="8" x="2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="10" x="5.08" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="1" x="-5.08" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="3" x="-2.54" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="5" x="0" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="7" x="2.54" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="9" x="5.08" y="-6.35" drill="1.016" shape="octagon"/>
<text x="-6.985" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="8.255" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-5.461" y1="0.635" x2="-4.699" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="4.699" y1="0.635" x2="5.461" y2="1.143" layer="21"/>
<rectangle x1="-5.461" y1="-2.921" x2="-4.699" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-5.461" y1="-5.461" x2="-4.699" y2="-4.699" layer="21"/>
<rectangle x1="-5.461" y1="-4.699" x2="-4.699" y2="-2.921" layer="51"/>
<rectangle x1="-2.921" y1="-4.699" x2="-2.159" y2="-2.921" layer="51"/>
<rectangle x1="-2.921" y1="-5.461" x2="-2.159" y2="-4.699" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-5.461" x2="0.381" y2="-4.699" layer="21"/>
<rectangle x1="-0.381" y1="-4.699" x2="0.381" y2="-2.921" layer="51"/>
<rectangle x1="2.159" y1="-4.699" x2="2.921" y2="-2.921" layer="51"/>
<rectangle x1="2.159" y1="-5.461" x2="2.921" y2="-4.699" layer="21"/>
<rectangle x1="4.699" y1="-2.921" x2="5.461" y2="-1.905" layer="21"/>
<rectangle x1="4.699" y1="-5.461" x2="5.461" y2="-4.699" layer="21"/>
<rectangle x1="4.699" y1="-4.699" x2="5.461" y2="-2.921" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="PINH2X5">
<wire x1="-6.35" y1="-7.62" x2="8.89" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="8.89" y1="-7.62" x2="8.89" y2="7.62" width="0.4064" layer="94"/>
<wire x1="8.89" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="5.08" y="5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="5" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="5.08" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="7" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="9" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="5.08" y="-5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-2X5" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="2X05">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="2X05/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-thomas-betts">
<description>&lt;b&gt;Thomas &amp; Betts Connectors&lt;/b&gt;&lt;p&gt;
Based on Thomas &amp; Betts Catalog &lt;i&gt;Electronioc Interconnects European Edition 1998&lt;/i&gt;.&lt;p&gt;
Created 10.06.1999&lt;br&gt;
Packages changed/corrected 22.02.2006 librarian@cadsoft.de&lt;br&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="9090-4R">
<description>&lt;b&gt;THOMAS&amp;BETTS&lt;/b&gt; Disk Drive Power Horizontal&lt;p&gt;</description>
<wire x1="-11.45" y1="-5.45" x2="-11.45" y2="6.675" width="0.2032" layer="21"/>
<wire x1="-11.45" y1="6.675" x2="11.45" y2="6.675" width="0.2032" layer="21"/>
<wire x1="11.45" y1="6.675" x2="11.45" y2="-5.45" width="0.2032" layer="21"/>
<wire x1="11.45" y1="-5.45" x2="9.325" y2="-5.45" width="0.2032" layer="21"/>
<wire x1="9.325" y1="-5.45" x2="-9.5" y2="-5.45" width="0.2032" layer="51"/>
<wire x1="-9.5" y1="-5.45" x2="-11.45" y2="-5.45" width="0.2032" layer="21"/>
<pad name="1" x="-7.62" y="-6.35" drill="1.6" diameter="2.6" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="-6.35" drill="1.6" diameter="2.6" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-6.35" drill="1.6" diameter="2.6" shape="long" rot="R90"/>
<pad name="4" x="7.62" y="-6.35" drill="1.6" diameter="2.6" shape="long" rot="R90"/>
<text x="-12.7" y="-5.08" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="-6.35" y="-1.27" size="1.27" layer="27">&gt;VALUE</text>
<hole x="-5.08" y="3.81" drill="4"/>
<hole x="5.08" y="3.81" drill="4"/>
<hole x="-10.16" y="-3.81" drill="2.5"/>
<hole x="10.16" y="-3.81" drill="2.5"/>
</package>
<package name="9090-4V">
<description>&lt;b&gt;THOMAS&amp;BETTS&lt;/b&gt; Disk Drive Power Vertical&lt;p&gt;</description>
<wire x1="11.45" y1="-4.03" x2="-11.45" y2="-4.03" width="0.2032" layer="21"/>
<wire x1="-11.45" y1="-4.03" x2="-11.45" y2="2.03" width="0.2032" layer="21"/>
<wire x1="-11.45" y1="2.03" x2="-9.45" y2="4.03" width="0.2032" layer="21"/>
<wire x1="-9.45" y1="4.03" x2="9.45" y2="4.03" width="0.2032" layer="21"/>
<wire x1="9.45" y1="4.03" x2="11.45" y2="2.03" width="0.2032" layer="21"/>
<wire x1="11.45" y1="2.03" x2="11.45" y2="-4.03" width="0.2032" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="1.6" diameter="2.6" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="0" drill="1.6" diameter="2.6" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.6" diameter="2.6" shape="long" rot="R90"/>
<pad name="4" x="7.62" y="0" drill="1.6" diameter="2.6" shape="long" rot="R90"/>
<text x="-12.7" y="-3.81" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="-7.62" y="5.08" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="DISKDRIVE">
<wire x1="0" y1="6.35" x2="0" y2="-3.81" width="0.254" layer="94"/>
<wire x1="0" y1="-3.81" x2="3.81" y2="-3.81" width="0.254" layer="94"/>
<wire x1="3.81" y1="-3.81" x2="5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="3.81" y2="6.35" width="0.254" layer="94"/>
<wire x1="3.81" y1="6.35" x2="0" y2="6.35" width="0.254" layer="94"/>
<text x="0" y="8.89" size="1.778" layer="95">&gt;NAME</text>
<text x="0" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pin" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="-2.54" y="2.54" visible="pin" length="short" direction="pas" swaplevel="1"/>
<pin name="3" x="-2.54" y="0" visible="pin" length="short" direction="pas" swaplevel="1"/>
<pin name="4" x="-2.54" y="-2.54" visible="pin" length="short" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="9090-4" prefix="X">
<description>&lt;b&gt;Disk Drive Power&lt;/b&gt; four position&lt;p&gt;
Source: Thomas &amp; Betts Electronic Interconnects Eiropean Edition 1998</description>
<gates>
<gate name="G$1" symbol="DISKDRIVE" x="0" y="0" swaplevel="1"/>
</gates>
<devices>
<device name="R" package="9090-4R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="V" package="9090-4V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pcie1x">
<packages>
<package name="PCIE1X">
<hole x="9.15" y="0" drill="2.35"/>
<hole x="0" y="0" drill="2.35"/>
<pad name="A12" x="1.35" y="3.25" drill="0.7"/>
<pad name="A14" x="3.35" y="3.25" drill="0.7"/>
<pad name="A16" x="5.35" y="3.25" drill="0.7"/>
<pad name="A18" x="7.35" y="3.25" drill="0.7"/>
<pad name="A13" x="2.35" y="1.25" drill="0.7"/>
<pad name="A15" x="4.35" y="1.25" drill="0.7"/>
<pad name="A17" x="6.35" y="1.25" drill="0.7"/>
<pad name="B18" x="7.4" y="-3.25" drill="0.7" rot="R180"/>
<pad name="B16" x="5.4" y="-3.25" drill="0.7" rot="R180"/>
<pad name="B14" x="3.4" y="-3.25" drill="0.7" rot="R180"/>
<pad name="B12" x="1.4" y="-3.25" drill="0.7" rot="R180"/>
<pad name="B17" x="6.4" y="-1.25" drill="0.7" rot="R180"/>
<pad name="B15" x="4.4" y="-1.25" drill="0.7" rot="R180"/>
<pad name="B13" x="2.4" y="-1.25" drill="0.7" rot="R180"/>
<pad name="A5" x="-7.65" y="1.25" drill="0.7"/>
<pad name="A7" x="-5.65" y="1.25" drill="0.7"/>
<pad name="A9" x="-3.65" y="1.25" drill="0.7"/>
<pad name="A11" x="-1.65" y="1.25" drill="0.7"/>
<pad name="A3" x="-9.65" y="1.25" drill="0.7"/>
<pad name="A1" x="-11.65" y="1.25" drill="0.7" shape="square"/>
<pad name="A10" x="-2.65" y="3.25" drill="0.7"/>
<pad name="A8" x="-4.65" y="3.25" drill="0.7"/>
<pad name="A6" x="-6.65" y="3.25" drill="0.7"/>
<pad name="A4" x="-8.65" y="3.25" drill="0.7"/>
<pad name="A2" x="-10.65" y="3.25" drill="0.7"/>
<pad name="B11" x="-1.65" y="-1.25" drill="0.7"/>
<pad name="B9" x="-3.65" y="-1.25" drill="0.7"/>
<pad name="B7" x="-5.65" y="-1.25" drill="0.7"/>
<pad name="B5" x="-7.65" y="-1.25" drill="0.7"/>
<pad name="B3" x="-9.65" y="-1.25" drill="0.7"/>
<pad name="B1" x="-11.65" y="-1.25" drill="0.7"/>
<pad name="B2" x="-10.65" y="-3.25" drill="0.7"/>
<pad name="B4" x="-8.65" y="-3.25" drill="0.7"/>
<pad name="B6" x="-6.65" y="-3.25" drill="0.7"/>
<pad name="B8" x="-4.65" y="-3.25" drill="0.7"/>
<pad name="B10" x="-2.65" y="-3.25" drill="0.7"/>
</package>
</packages>
<symbols>
<symbol name="PCIE1X">
<pin name="A1" x="5.08" y="22.86" length="middle"/>
<pin name="A2" x="5.08" y="20.32" length="middle"/>
<pin name="A3" x="5.08" y="17.78" length="middle"/>
<pin name="A4" x="5.08" y="15.24" length="middle"/>
<pin name="A5" x="5.08" y="12.7" length="middle"/>
<pin name="A6" x="5.08" y="10.16" length="middle"/>
<pin name="A7" x="5.08" y="7.62" length="middle"/>
<pin name="A8" x="5.08" y="2.54" length="middle"/>
<pin name="A9" x="5.08" y="0" length="middle"/>
<pin name="A10" x="5.08" y="-2.54" length="middle"/>
<pin name="A11" x="5.08" y="-5.08" length="middle"/>
<pin name="A12" x="5.08" y="-7.62" length="middle"/>
<pin name="A13" x="5.08" y="-10.16" length="middle"/>
<pin name="A14" x="5.08" y="-12.7" length="middle"/>
<pin name="A15" x="5.08" y="-15.24" length="middle"/>
<pin name="A16" x="5.08" y="-17.78" length="middle"/>
<pin name="A17" x="5.08" y="-20.32" length="middle"/>
<pin name="A18" x="5.08" y="-22.86" length="middle"/>
<pin name="B1" x="-5.08" y="22.86" length="middle" rot="R180"/>
<pin name="B2" x="-5.08" y="20.32" length="middle" rot="R180"/>
<pin name="B3" x="-5.08" y="17.78" length="middle" rot="R180"/>
<pin name="B4" x="-5.08" y="15.24" length="middle" rot="R180"/>
<pin name="B5" x="-5.08" y="12.7" length="middle" rot="R180"/>
<pin name="B6" x="-5.08" y="10.16" length="middle" rot="R180"/>
<pin name="B7" x="-5.08" y="7.62" length="middle" rot="R180"/>
<pin name="B8" x="-5.08" y="2.54" length="middle" rot="R180"/>
<pin name="B9" x="-5.08" y="0" length="middle" rot="R180"/>
<pin name="B10" x="-5.08" y="-2.54" length="middle" rot="R180"/>
<pin name="B11" x="-5.08" y="-5.08" length="middle" rot="R180"/>
<pin name="B12" x="-5.08" y="-7.62" length="middle" rot="R180"/>
<pin name="B13" x="-5.08" y="-10.16" length="middle" rot="R180"/>
<pin name="B14" x="-5.08" y="-12.7" length="middle" rot="R180"/>
<pin name="B15" x="-5.08" y="-15.24" length="middle" rot="R180"/>
<pin name="B16" x="-5.08" y="-17.78" length="middle" rot="R180"/>
<pin name="B17" x="-5.08" y="-20.32" length="middle" rot="R180"/>
<pin name="B18" x="-5.08" y="-22.86" length="middle" rot="R180"/>
<wire x1="-7.62" y1="25.4" x2="-7.62" y2="-25.4" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-25.4" x2="7.62" y2="-25.4" width="0.254" layer="94"/>
<wire x1="7.62" y1="-25.4" x2="7.62" y2="25.4" width="0.254" layer="94"/>
<wire x1="7.62" y1="25.4" x2="-7.62" y2="25.4" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PCIE1X">
<gates>
<gate name="G$1" symbol="PCIE1X" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PCIE1X">
<connects>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A10" pad="A10"/>
<connect gate="G$1" pin="A11" pad="A11"/>
<connect gate="G$1" pin="A12" pad="A12"/>
<connect gate="G$1" pin="A13" pad="A13"/>
<connect gate="G$1" pin="A14" pad="A14"/>
<connect gate="G$1" pin="A15" pad="A15"/>
<connect gate="G$1" pin="A16" pad="A16"/>
<connect gate="G$1" pin="A17" pad="A17"/>
<connect gate="G$1" pin="A18" pad="A18"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="A3" pad="A3"/>
<connect gate="G$1" pin="A4" pad="A4"/>
<connect gate="G$1" pin="A5" pad="A5"/>
<connect gate="G$1" pin="A6" pad="A6"/>
<connect gate="G$1" pin="A7" pad="A7"/>
<connect gate="G$1" pin="A8" pad="A8"/>
<connect gate="G$1" pin="A9" pad="A9"/>
<connect gate="G$1" pin="B1" pad="B1"/>
<connect gate="G$1" pin="B10" pad="B10"/>
<connect gate="G$1" pin="B11" pad="B11"/>
<connect gate="G$1" pin="B12" pad="B12"/>
<connect gate="G$1" pin="B13" pad="B13"/>
<connect gate="G$1" pin="B14" pad="B14"/>
<connect gate="G$1" pin="B15" pad="B15"/>
<connect gate="G$1" pin="B16" pad="B16"/>
<connect gate="G$1" pin="B17" pad="B17"/>
<connect gate="G$1" pin="B18" pad="B18"/>
<connect gate="G$1" pin="B2" pad="B2"/>
<connect gate="G$1" pin="B3" pad="B3"/>
<connect gate="G$1" pin="B4" pad="B4"/>
<connect gate="G$1" pin="B5" pad="B5"/>
<connect gate="G$1" pin="B6" pad="B6"/>
<connect gate="G$1" pin="B7" pad="B7"/>
<connect gate="G$1" pin="B8" pad="B8"/>
<connect gate="G$1" pin="B9" pad="B9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0.2032" drill="0.2032">
<clearance class="0" value="0.2032"/>
</class>
</classes>
<parts>
<part name="JP1" library="pinhead" deviceset="PINHD-2X5" device=""/>
<part name="JP2" library="pinhead" deviceset="PINHD-2X5" device=""/>
<part name="X1" library="con-thomas-betts" deviceset="9090-4" device="R"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="U$1" library="pcie1x" deviceset="PCIE1X" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="JP1" gate="A" x="5.08" y="60.96" rot="R90"/>
<instance part="JP2" gate="A" x="5.08" y="22.86" rot="R90"/>
<instance part="X1" gate="G$1" x="152.4" y="60.96"/>
<instance part="GND3" gate="1" x="25.4" y="58.42" rot="R90"/>
<instance part="U$1" gate="G$1" x="83.82" y="40.64" rot="MR270"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="JP2" gate="A" pin="10"/>
<wire x1="10.16" y1="27.94" x2="15.24" y2="27.94" width="0.1524" layer="91"/>
<wire x1="15.24" y1="27.94" x2="15.24" y2="55.88" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="10"/>
<wire x1="15.24" y1="55.88" x2="15.24" y2="58.42" width="0.1524" layer="91"/>
<wire x1="15.24" y1="58.42" x2="15.24" y2="66.04" width="0.1524" layer="91"/>
<wire x1="15.24" y1="66.04" x2="10.16" y2="66.04" width="0.1524" layer="91"/>
<label x="12.7" y="66.04" size="1.778" layer="95"/>
<pinref part="JP2" gate="A" pin="9"/>
<wire x1="10.16" y1="20.32" x2="22.86" y2="20.32" width="0.1524" layer="91"/>
<wire x1="22.86" y1="20.32" x2="22.86" y2="58.42" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="9"/>
<wire x1="22.86" y1="58.42" x2="15.24" y2="58.42" width="0.1524" layer="91"/>
<label x="17.78" y="58.42" size="1.778" layer="95"/>
<junction x="15.24" y="58.42"/>
<wire x1="15.24" y1="58.42" x2="10.16" y2="58.42" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="7"/>
<wire x1="7.62" y1="20.32" x2="7.62" y2="22.86" width="0.1524" layer="91"/>
<wire x1="7.62" y1="22.86" x2="20.32" y2="22.86" width="0.1524" layer="91"/>
<wire x1="20.32" y1="22.86" x2="20.32" y2="55.88" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="7"/>
<wire x1="20.32" y1="55.88" x2="15.24" y2="55.88" width="0.1524" layer="91"/>
<wire x1="15.24" y1="55.88" x2="7.62" y2="55.88" width="0.1524" layer="91"/>
<wire x1="7.62" y1="55.88" x2="7.62" y2="58.42" width="0.1524" layer="91"/>
<label x="17.78" y="55.88" size="1.778" layer="95"/>
<junction x="15.24" y="55.88"/>
<pinref part="GND3" gate="1" pin="GND"/>
<junction x="22.86" y="58.42"/>
<junction x="7.62" y="20.32"/>
<junction x="10.16" y="20.32"/>
<junction x="10.16" y="27.94"/>
<junction x="10.16" y="66.04"/>
<junction x="10.16" y="58.42"/>
<junction x="7.62" y="58.42"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="2"/>
<wire x1="149.86" y1="63.5" x2="132.08" y2="63.5" width="0.1524" layer="91"/>
<label x="142.24" y="63.5" size="1.778" layer="95"/>
<junction x="149.86" y="63.5"/>
<pinref part="U$1" gate="G$1" pin="B4"/>
<wire x1="68.58" y1="35.56" x2="68.58" y2="40.64" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A4"/>
<pinref part="U$1" gate="G$1" pin="A5"/>
<wire x1="68.58" y1="40.64" x2="68.58" y2="45.72" width="0.1524" layer="91"/>
<wire x1="71.12" y1="35.56" x2="68.58" y2="35.56" width="0.1524" layer="91"/>
<junction x="68.58" y="35.56"/>
<pinref part="U$1" gate="G$1" pin="B5"/>
<wire x1="68.58" y1="45.72" x2="71.12" y2="45.72" width="0.1524" layer="91"/>
<junction x="68.58" y="45.72"/>
<junction x="71.12" y="35.56"/>
<junction x="71.12" y="45.72"/>
<pinref part="U$1" gate="G$1" pin="B7"/>
<wire x1="76.2" y1="45.72" x2="76.2" y2="40.64" width="0.1524" layer="91"/>
<wire x1="76.2" y1="40.64" x2="68.58" y2="40.64" width="0.1524" layer="91"/>
<junction x="68.58" y="40.64"/>
<junction x="76.2" y="45.72"/>
<wire x1="76.2" y1="40.64" x2="78.74" y2="40.64" width="0.1524" layer="91"/>
<junction x="76.2" y="40.64"/>
<pinref part="U$1" gate="G$1" pin="B9"/>
<wire x1="78.74" y1="40.64" x2="83.82" y2="40.64" width="0.1524" layer="91"/>
<wire x1="83.82" y1="40.64" x2="86.36" y2="40.64" width="0.1524" layer="91"/>
<wire x1="86.36" y1="40.64" x2="91.44" y2="40.64" width="0.1524" layer="91"/>
<wire x1="83.82" y1="40.64" x2="83.82" y2="45.72" width="0.1524" layer="91"/>
<junction x="83.82" y="40.64"/>
<pinref part="U$1" gate="G$1" pin="B18"/>
<wire x1="83.82" y1="45.72" x2="86.36" y2="45.72" width="0.1524" layer="91"/>
<junction x="83.82" y="45.72"/>
<pinref part="U$1" gate="G$1" pin="B10"/>
<junction x="86.36" y="45.72"/>
<wire x1="86.36" y1="45.72" x2="88.9" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="B11"/>
<junction x="88.9" y="45.72"/>
<wire x1="88.9" y1="45.72" x2="91.44" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="B12"/>
<junction x="91.44" y="45.72"/>
<wire x1="91.44" y1="45.72" x2="93.98" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="B13"/>
<junction x="93.98" y="45.72"/>
<wire x1="93.98" y1="45.72" x2="96.52" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="B14"/>
<junction x="96.52" y="45.72"/>
<wire x1="96.52" y1="45.72" x2="99.06" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="B15"/>
<junction x="99.06" y="45.72"/>
<wire x1="99.06" y1="45.72" x2="101.6" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="B16"/>
<junction x="101.6" y="45.72"/>
<wire x1="101.6" y1="45.72" x2="104.14" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="B17"/>
<junction x="104.14" y="45.72"/>
<wire x1="104.14" y1="45.72" x2="106.68" y2="45.72" width="0.1524" layer="91"/>
<junction x="106.68" y="45.72"/>
<pinref part="U$1" gate="G$1" pin="A10"/>
<wire x1="86.36" y1="35.56" x2="86.36" y2="40.64" width="0.1524" layer="91"/>
<junction x="86.36" y="40.64"/>
<pinref part="U$1" gate="G$1" pin="A12"/>
<wire x1="91.44" y1="40.64" x2="91.44" y2="35.56" width="0.1524" layer="91"/>
<junction x="91.44" y="40.64"/>
<pinref part="U$1" gate="G$1" pin="A18"/>
<wire x1="106.68" y1="35.56" x2="104.14" y2="35.56" width="0.1524" layer="91"/>
<junction x="91.44" y="35.56"/>
<pinref part="U$1" gate="G$1" pin="A13"/>
<junction x="93.98" y="35.56"/>
<wire x1="104.14" y1="35.56" x2="101.6" y2="35.56" width="0.1524" layer="91"/>
<wire x1="101.6" y1="35.56" x2="99.06" y2="35.56" width="0.1524" layer="91"/>
<wire x1="99.06" y1="35.56" x2="96.52" y2="35.56" width="0.1524" layer="91"/>
<wire x1="96.52" y1="35.56" x2="93.98" y2="35.56" width="0.1524" layer="91"/>
<wire x1="93.98" y1="35.56" x2="91.44" y2="35.56" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A14"/>
<junction x="96.52" y="35.56"/>
<pinref part="U$1" gate="G$1" pin="A15"/>
<junction x="99.06" y="35.56"/>
<pinref part="U$1" gate="G$1" pin="A16"/>
<junction x="101.6" y="35.56"/>
<pinref part="U$1" gate="G$1" pin="A17"/>
<junction x="104.14" y="35.56"/>
<junction x="106.68" y="35.56"/>
<junction x="86.36" y="35.56"/>
<wire x1="91.44" y1="40.64" x2="132.08" y2="40.64" width="0.1524" layer="91"/>
<wire x1="132.08" y1="40.64" x2="132.08" y2="63.5" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A7"/>
<junction x="76.2" y="35.56"/>
<wire x1="76.2" y1="35.56" x2="76.2" y2="40.64" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="A8"/>
<wire x1="76.2" y1="35.56" x2="78.74" y2="35.56" width="0.1524" layer="91"/>
<junction x="81.28" y="35.56"/>
<wire x1="78.74" y1="35.56" x2="81.28" y2="35.56" width="0.1524" layer="91"/>
<wire x1="78.74" y1="35.56" x2="78.74" y2="40.64" width="0.1524" layer="91"/>
<junction x="78.74" y="35.56"/>
<junction x="78.74" y="40.64"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="3"/>
<wire x1="149.86" y1="60.96" x2="139.7" y2="60.96" width="0.1524" layer="91"/>
<label x="142.24" y="60.96" size="1.778" layer="95"/>
<junction x="149.86" y="60.96"/>
</segment>
</net>
<net name="3V3" class="0">
<segment>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="0" y1="27.94" x2="-7.62" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="27.94" x2="-15.24" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="27.94" x2="-15.24" y2="66.04" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="-15.24" y1="66.04" x2="0" y2="66.04" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="1"/>
<wire x1="0" y1="20.32" x2="-7.62" y2="20.32" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="20.32" x2="-7.62" y2="27.94" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="1"/>
<wire x1="-7.62" y1="27.94" x2="-7.62" y2="58.42" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="58.42" x2="0" y2="58.42" width="0.1524" layer="91"/>
<junction x="-7.62" y="27.94"/>
<label x="-15.24" y="66.04" size="1.778" layer="95"/>
<label x="-7.62" y="58.42" size="1.778" layer="95"/>
<junction x="0" y="20.32"/>
<junction x="0" y="27.94"/>
<junction x="0" y="66.04"/>
<junction x="0" y="58.42"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A1"/>
<pinref part="U$1" gate="G$1" pin="B1"/>
<wire x1="60.96" y1="35.56" x2="60.96" y2="45.72" width="0.1524" layer="91"/>
<wire x1="60.96" y1="45.72" x2="60.96" y2="68.58" width="0.1524" layer="91"/>
<junction x="60.96" y="45.72"/>
<label x="60.96" y="60.96" size="1.778" layer="95" rot="R90"/>
<junction x="60.96" y="35.56"/>
</segment>
</net>
<net name="SCL1" class="0">
<segment>
<pinref part="JP2" gate="A" pin="4"/>
<junction x="2.54" y="27.94"/>
<wire x1="2.54" y1="27.94" x2="2.54" y2="30.48" width="0.1524" layer="91"/>
<wire x1="2.54" y1="30.48" x2="-12.7" y2="30.48" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="30.48" x2="-12.7" y2="63.5" width="0.1524" layer="91"/>
<label x="-12.7" y="63.5" size="1.778" layer="95"/>
<pinref part="JP1" gate="A" pin="4"/>
<junction x="2.54" y="66.04"/>
<wire x1="2.54" y1="63.5" x2="2.54" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="63.5" x2="2.54" y2="63.5" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="B6"/>
<wire x1="73.66" y1="45.72" x2="73.66" y2="68.58" width="0.1524" layer="91"/>
<junction x="73.66" y="45.72"/>
<label x="73.66" y="60.96" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="ERROR" class="0">
<segment>
<pinref part="JP2" gate="A" pin="8"/>
<wire x1="7.62" y1="27.94" x2="7.62" y2="30.48" width="0.1524" layer="91"/>
<wire x1="7.62" y1="30.48" x2="12.7" y2="30.48" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="8"/>
<wire x1="12.7" y1="30.48" x2="12.7" y2="63.5" width="0.1524" layer="91"/>
<wire x1="12.7" y1="63.5" x2="7.62" y2="63.5" width="0.1524" layer="91"/>
<wire x1="7.62" y1="63.5" x2="7.62" y2="66.04" width="0.1524" layer="91"/>
<label x="7.62" y="60.96" size="1.778" layer="95"/>
<junction x="7.62" y="27.94"/>
<junction x="7.62" y="66.04"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A6"/>
<junction x="73.66" y="35.56"/>
<wire x1="73.66" y1="35.56" x2="73.66" y2="12.7" width="0.1524" layer="91"/>
<label x="73.66" y="15.24" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="SDA2" class="0">
<segment>
<pinref part="JP2" gate="A" pin="3"/>
<wire x1="2.54" y1="20.32" x2="2.54" y2="22.86" width="0.1524" layer="91"/>
<wire x1="2.54" y1="22.86" x2="-5.08" y2="22.86" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="22.86" x2="-5.08" y2="55.88" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="3"/>
<wire x1="-5.08" y1="55.88" x2="2.54" y2="55.88" width="0.1524" layer="91"/>
<wire x1="2.54" y1="55.88" x2="2.54" y2="58.42" width="0.1524" layer="91"/>
<label x="-5.08" y="48.26" size="1.778" layer="95"/>
<junction x="2.54" y="58.42"/>
<junction x="2.54" y="20.32"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A11"/>
<wire x1="88.9" y1="35.56" x2="88.9" y2="12.7" width="0.1524" layer="91"/>
<junction x="88.9" y="35.56"/>
<label x="88.9" y="17.78" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="SCL2" class="0">
<segment>
<pinref part="JP2" gate="A" pin="5"/>
<wire x1="5.08" y1="20.32" x2="5.08" y2="25.4" width="0.1524" layer="91"/>
<wire x1="5.08" y1="25.4" x2="17.78" y2="25.4" width="0.1524" layer="91"/>
<wire x1="17.78" y1="25.4" x2="17.78" y2="53.34" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="5"/>
<wire x1="17.78" y1="53.34" x2="5.08" y2="53.34" width="0.1524" layer="91"/>
<wire x1="5.08" y1="53.34" x2="5.08" y2="58.42" width="0.1524" layer="91"/>
<label x="7.62" y="50.8" size="1.778" layer="95"/>
<junction x="5.08" y="20.32"/>
<junction x="5.08" y="58.42"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A9"/>
<wire x1="83.82" y1="35.56" x2="83.82" y2="12.7" width="0.1524" layer="91"/>
<junction x="83.82" y="35.56"/>
<label x="83.82" y="17.78" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="5V" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A2"/>
<pinref part="U$1" gate="G$1" pin="B2"/>
<wire x1="63.5" y1="35.56" x2="63.5" y2="45.72" width="0.1524" layer="91"/>
<label x="63.5" y="38.1" size="1.778" layer="95" rot="R90"/>
<junction x="63.5" y="45.72"/>
<junction x="63.5" y="35.56"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="4"/>
<wire x1="149.86" y1="58.42" x2="139.7" y2="58.42" width="0.1524" layer="91"/>
<label x="142.24" y="58.42" size="1.778" layer="95"/>
<junction x="149.86" y="58.42"/>
</segment>
</net>
<net name="12V" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A3"/>
<pinref part="U$1" gate="G$1" pin="B3"/>
<wire x1="66.04" y1="35.56" x2="66.04" y2="45.72" width="0.1524" layer="91"/>
<label x="66.04" y="38.1" size="1.778" layer="95" rot="R90"/>
<junction x="66.04" y="45.72"/>
<junction x="66.04" y="35.56"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="1"/>
<wire x1="149.86" y1="66.04" x2="139.7" y2="66.04" width="0.1524" layer="91"/>
<label x="142.24" y="66.04" size="1.778" layer="95"/>
<junction x="149.86" y="66.04"/>
</segment>
</net>
<net name="SDA1" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="B8"/>
<wire x1="81.28" y1="45.72" x2="81.28" y2="68.58" width="0.1524" layer="91"/>
<label x="81.28" y="60.96" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="JP2" gate="A" pin="6"/>
<wire x1="5.08" y1="27.94" x2="5.08" y2="40.64" width="0.1524" layer="91"/>
<wire x1="5.08" y1="40.64" x2="-10.16" y2="40.64" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="40.64" x2="-10.16" y2="60.96" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="6"/>
<wire x1="-10.16" y1="60.96" x2="5.08" y2="60.96" width="0.1524" layer="91"/>
<wire x1="5.08" y1="60.96" x2="5.08" y2="66.04" width="0.1524" layer="91"/>
<label x="-10.16" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
