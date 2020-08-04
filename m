Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE86E23B4FB
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Aug 2020 08:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728190AbgHDGZs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 4 Aug 2020 02:25:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:39832 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727076AbgHDGZs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Aug 2020 02:25:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9257CAC7D
        for <linux-i2c@vger.kernel.org>; Tue,  4 Aug 2020 06:26:00 +0000 (UTC)
Date:   Tue, 4 Aug 2020 08:25:43 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH] decode-dimms: Update the list of vendors to Jedec JEP106BB
Message-ID: <20200804082543.1d22b28f@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update the list of memory vendors as of June 2020, including 14
renames.

I also added a runtime sanity check on the number of vendors per
page, as it is very easy to get it wrong.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
As suggested by Paul Goyette.

 eeprom/decode-dimms |  111 ++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 95 insertions(+), 16 deletions(-)

--- i2c-tools.orig/eeprom/decode-dimms	2020-03-18 10:09:12.453623106 +0100
+++ i2c-tools/eeprom/decode-dimms	2020-08-03 18:19:49.826840344 +0200
@@ -5,7 +5,7 @@
 # Copyright 1998, 1999 Philip Edelbrock <phil@netroedge.com>
 # modified by Christian Zuckschwerdt <zany@triq.net>
 # modified by Burkart Lingner <burkart@bollchen.de>
-# Copyright (C) 2005-2019  Jean Delvare <jdelvare@suse.de>
+# Copyright (C) 2005-2020  Jean Delvare <jdelvare@suse.de>
 #
 #    This program is free software; you can redistribute it and/or modify
 #    it under the terms of the GNU General Public License as published by
@@ -58,7 +58,7 @@ use constant I2C_TOOLS_VER	=> "4.1";
  "Intel", "I.T.T.", "Intersil", "Monolithic Memories",
  "Mostek", "Freescale (former Motorola)", "National", "NEC",
  "RCA", "Raytheon", "Conexant (Rockwell)", "Seeq",
- "NXP (former Signetics, Philips Semi.)", "Synertek", "Texas Instruments", "Toshiba",
+ "NXP (former Signetics, Philips Semi.)", "Synertek", "Texas Instruments", "Kioxia Corporation (former Toshiba Memory Corporation)",
  "Xicor", "Zilog", "Eurotechnique", "Mitsubishi",
  "Lucent (AT&T)", "Exel", "Atmel", "STMicroelectronics (former SGS/Thomson)",
  "Lattice Semi.", "NCR", "Wafer Scale Integration", "IBM",
@@ -70,10 +70,10 @@ use constant I2C_TOOLS_VER	=> "4.1";
  "Thinking Machine", "Thomson CSF", "Integrated CMOS (Vertex)", "Honeywell",
  "Tektronix", "Oracle Corporation (former Sun Microsystems)", "Silicon Storage Technology", "ProMos/Mosel Vitelic",
  "Infineon (former Siemens)", "Macronix", "Xerox", "Plus Logic",
- "SunDisk", "Elan Circuit Tech.", "European Silicon Str.", "Apple Computer",
+ "Western Digital Technologies (former SanDisk Corporation)", "Elan Circuit Tech.", "European Silicon Str.", "Apple Computer",
  "Xilinx", "Compaq", "Protocol Engines", "SCI",
  "Seiko Instruments", "Samsung", "I3 Design System", "Klic",
- "Crosspoint Solutions", "Alliance Semiconductor", "Tandem", "Hewlett-Packard",
+ "Crosspoint Solutions", "Alliance Memory Inc", "Tandem", "Hewlett-Packard",
  "Integrated Silicon Solutions", "Brooktree", "New Media", "MHS Electronic",
  "Performance Semi.", "Winbond Electronic", "Kawasaki Steel", "Bright Micro",
  "TECMAR", "Exar", "PCMCIA", "LG Semi (former Goldstar)",
@@ -92,7 +92,7 @@ use constant I2C_TOOLS_VER	=> "4.1";
  "DATARAM", "United Microelec Corp.", "TCSI", "Smart Modular",
  "Hughes Aircraft", "Lanstar Semiconductor", "Qlogic", "Kingston",
  "Music Semi", "Ericsson Components", "SpaSE", "Eon Silicon Devices",
- "Programmable Micro Corp", "DoD", "Integ. Memories Tech.", "Corollary Inc.",
+ "Integrated Silicon Solution (ISSI) (former Programmable Micro Corp)", "DoD", "Integ. Memories Tech.", "Corollary Inc.",
  "Dallas Semiconductor", "Omnivision", "EIV(Switzerland)", "Novatel Wireless",
  "Zarlink (former Mitel)", "Clearpoint", "Cabletron", "STEC (former Silicon Technology)",
  "Vanguard", "Hagiwara Sys-Com", "Vantis", "Celestica",
@@ -273,9 +273,9 @@ use constant I2C_TOOLS_VER	=> "4.1";
  "PhotoFast Global Inc.", "InnoDisk Corporation", "Muscle Power", "Energy Micro", "Innofidei",
  "CopperGate Communications", "Holtek Semiconductor Inc.", "Myson Century, Inc.", "FIDELIX",
  "Red Digital Cinema", "Densbits Technology", "Zempro", "MoSys", "Provigent", "Triad Semiconductor, Inc."],
-["Siklu Communication Ltd.", "A Force Manufacturing Ltd.", "Strontium", "Abilis Systems", "Siglead, Inc.",
+["Siklu Communication Ltd.", "A Force Manufacturing Ltd.", "Strontium", "ALi Corp (former Abilis Systems)", "Siglead, Inc.",
  "Ubicom, Inc.", "Unifosa Corporation", "Stretch, Inc.", "Lantiq Deutschland GmbH", "Visipro",
- "EKMemory", "Microelectronics Institute ZTE", "Cognovo Ltd.", "Carry Technology Co. Ltd.", "Nokia",
+ "EKMemory", "Microelectronics Institute ZTE", "u-blox AG (former Cognovo Ltd)", "Carry Technology Co. Ltd.", "Nokia",
  "King Tiger Technology", "Sierra Wireless", "HT Micron", "Albatron Technology Co. Ltd.",
  "Leica Geosystems AG", "BroadLight", "AEXEA", "ClariPhy Communications, Inc.", "Green Plug",
  "Design Art Networks", "Mach Xtreme Technology Ltd.", "ATO Solutions Co. Ltd.", "Ramsta",
@@ -307,13 +307,13 @@ use constant I2C_TOOLS_VER	=> "4.1";
  "AcSiP Technology Corporation", "Idea! Electronic Systems", "Gowe Technology Co. Ltd",
  "Hermes Testing Solutions Inc.", "Positivo BGH", "Intelligence Silicon Technology"],
 ["3D PLUS", "Diehl Aerospace", "Fairchild", "Mercury Systems",
- "Sonics Inc.", "GE Intelligent Platforms GmbH & Co.", "Shenzhen Jinge Information Co. Ltd",
+ "Sonics Inc.", "Emerson Automation Solutions (former ICC/GE Intelligent Platforms)", "Shenzhen Jinge Information Co. Ltd",
  "SCWW", "Silicon Motion Inc.", "Anurag", "King Kong",
  "FROM30 Co. Ltd", "Gowin Semiconductor Corp", "Fremont Micro Devices Ltd",
  "Ericsson Modems", "Exelis", "Satixfy Ltd", "Galaxy Microsystems Ltd",
  "Gloway International Co. Ltd", "Lab", "Smart Energy Instruments",
- "Approved Memory Corporation", "Axell Corporation", "ISD Technology Limited",
- "Phytium", "Xi'an SinoChip Semiconductor", "Ambiq Micro", "eveRAM Technology Inc.",
+ "Approved Memory Corporation", "Axell Corporation", "Essencore Limited (former ISD Technology Limited)",
+ "Phytium", "Xi’an UniIC Semiconductors Co Ltd (former Xi'an SinoChip Semiconductor)", "Ambiq Micro", "eveRAM Technology Inc.",
  "Infomax", "Butterfly Network Inc.", "Shenzhen City Gcai Electronics",
  "Stack Devices Corporation", "ADK Media Group", "TSP Global Co. Ltd",
  "HighX", "Shenzhen Elicks Technology", "ISSI/Chingis", "Google Inc.",
@@ -323,14 +323,14 @@ use constant I2C_TOOLS_VER	=> "4.1";
  "Nuvoton", "Korea Uhbele International Group Ltd", "Ikegami Tsushinki Co. Ltd",
  "RelChip Inc.", "Baikal Electronics", "Nemostech Inc.",
  "Memorysolution GmbH", "Silicon Integrated Systems Corporation",
- "Xiede", "Multilaser Components", "Flash Chi", "Jone",
+ "Xiede", "BRC (former Multilaser Components)", "Flash Chi", "Jone",
  "GCT Semiconductor Inc.", "Hong Kong Zetta Device Technology",
  "Unimemory Technology(s) Pte Ltd", "Cuso", "Kuso",
  "Uniquify Inc.", "Skymedi Corporation", "Core Chance Co. Ltd",
  "Tekism Co. Ltd", "Seagate Technology PLC", "Hong Kong Gaia Group Co. Limited",
  "Gigacom Semiconductor LLC", "V2 Technologies", "TLi", "Neotion",
  "Lenovo", "Shenzhen Zhongteng Electronic Corp. Ltd", "Compound Photonics",
- "Cognimem Technologies Inc.", "Shenzhen Pango Microsystems Co. Ltd",
+ "In2H2 Inc (former Cognimem Technologies Inc)", "Shenzhen Pango Microsystems Co. Ltd",
  "Vasekey", "Cal-Comp Industria de Semicondutores", "Eyenix Co. Ltd",
  "Heoriady", "Accelerated Memory Production Inc.", "INVECAS Inc.",
  "AP Memory", "Douqi Technology", "Etron Technology Inc.",
@@ -371,7 +371,7 @@ use constant I2C_TOOLS_VER	=> "4.1";
  "Pegasus Semiconductor (Shanghai) Co", "Mythic Inc", "Elmos Semiconductor AG",
  "Kllisre", "Shenzhen Winconway Technology", "Shenzhen Xingmem Technology Corp",
  "Gold Key Technology Co Ltd", "Habana Labs Ltd", "Hoodisk Electronics Co Ltd",
- "SemsoTai (HK) Technology Co Ltd", "OM Nanotech Pvt. Ltd",
+ "SemsoTai (SZ) Technology Co Ltd", "OM Nanotech Pvt. Ltd",
  "Shenzhen Zhifeng Weiye Technology", "Xinshirui (Shenzhen) Electronics Co",
  "Guangzhou Zhong Hao Tian Electronic", "Shenzhen Longsys Electronics Co Ltd",
  "Deciso B.V.", "Puya Semiconductor (Shenzhen)", "Shenzhen Veineda Technology Co Ltd",
@@ -390,12 +390,12 @@ use constant I2C_TOOLS_VER	=> "4.1";
  "PsiKick", "Netac Technology Co Ltd", "PCCOOLER", "Jiangsu Huacun Electronic Technology",
  "Shenzhen Micro Innovation Industry", "Beijing Tongfang Microelectronics Co",
  "XZN Storage Technology", "ChipCraft Sp. z.o.o.", "ALLFLASH Technology Limited"],
-["Foerd Technology Co Ltd", "KingSpec", "Codasip Ltd", "SL Link Co Ltd",
+["Foerd Technology Co Ltd", "KingSpec", "Codasip GmbH", "SL Link Co Ltd",
  "Shenzhen Kefu Technology Co Limited", "Shenzhen ZST Electronics Technology",
  "Kyokuto Electronic Inc", "Warrior Technology", "TRINAMIC Motion Control GmbH & Co",
  "PixelDisplay Inc", "Shenzhen Futian District Bo Yueda Elec", "Richtek Power",
  "Shenzhen LianTeng Electronics Co Ltd", "AITC Memory", "UNIC Memory Technology Co Ltd",
- "Shenzhen Huafeng Science Technology", "Innotron Memory Co Ltd",
+ "Shenzhen Huafeng Science Technology", "CXMT (former Innotron Memory Co Ltd)",
  "Guangzhou Xinyi Heng Computer Trading Firm", "SambaNova Systems", "V-GEN",
  "Jump Trading", "Ampere Computing", "Shenzhen Zhongshi Technology Co Ltd",
  "Shenzhen Zhongtian Bozhong Technology", "Tri-Tech International",
@@ -415,9 +415,88 @@ use constant I2C_TOOLS_VER	=> "4.1";
  "Shenzhen Farasia Science Technology", "Efinix Inc", "Hua Nan San Xian Technology Co Ltd",
  "Goldtech Electronics Co Ltd", "Shanghai Han Rong Microelectronics Co",
  "Shenzhen Zhongguang Yunhe Trading", "Smart Shine(QingDao) Microelectronics",
- "Thermaltake Technology Co Ltd", "Shenzhen O'Yang Maile Technology Ltd", "UPMEM"]
+ "Thermaltake Technology Co Ltd", "Shenzhen O'Yang Maile Technology Ltd", "UPMEM",
+ "Chun Well Technology Holding Limited", "Astera Labs Inc", "Winconway",
+ "Advantech Co Ltd", "Chengdu Fengcai Electronic Technology", "The Boeing Company",
+ "Blaize Inc", "Ramonster Technology Co Ltd", "Wuhan Naonongmai Technology Co Ltd",
+ "Shenzhen Hui ShingTong Technology", "Yourlyon", "Fabu Technology",
+ "Shenzhen Yikesheng Technology Co Ltd", "NOR-MEM", "Cervoz Co Ltd",
+ "Bitmain Technologies Inc", "Facebook Inc", "Shenzhen Longsys Electronics Co Ltd",
+ "Guangzhou Siye Electronic Technology", "Silergy", "Adamway",
+ "PZG", "Shenzhen King Power Electronics", "Guangzhou ZiaoFu Tranding Co Ltd",
+ "Shenzhen SKIHOTAR Semiconductor", "PulseRain Technology", "Seeker Technology Limited",
+ "Shenzhen OSCOO Tech Co Ltd", "Shenzhen Yze Technology Co Ltd",
+ "Shenzhen Jieshuo Electronic Commerce", "Gazda", "Hua Wei Technology Co Ltd",
+ "Esperanto Technologies", "JinSheng Electronic (Shenzhen) Co Ltd",
+ "Shenzhen Shi Bolunshuai Technology", "Shanghai Rei Zuan Information Tech",
+ "Fraunhofer IIS", "Kandou Bus SA", "Acer", "Artmem Technology Co Ltd",
+ "Gstar Semiconductor Co Ltd", "ShineDisk", "Shenzhen CHN Technology Co Ltd",
+ "UnionChip Semiconductor Co Ltd", "Tanbassh", "Shenzhen Tianyu Jieyun Intl Logistics",
+ "MCLogic Inc", "Eorex Corporation", "Arm Technology (China) Co Ltd", "Lexar Co Limited",
+ "QinetiQ Group PLC", "Exascend", "Hong Kong Hyunion Electronics Co Ltd",
+ "Shenzhen Banghong Electronics Co Ltd", "MBit Wireless Inc", "Hex Five Security Inc",
+ "ShenZhen Juhor Precision Tech Co Ltd", "Shenzhen Reeinno Technology Co Ltd"],
+["ABIT Electronics (Shenzhen) Co Ltd", "Semidrive", "MyTek Electronics Corp",
+ "Wxilicon Technology Co Ltd", "Shenzhen Meixin Electronics Ltd", "Ghost Wolf",
+ "LiSion Technologies Inc", "Power Active Co Ltd", "Pioneer High Fidelity Taiwan Co. Ltd",
+ "LuoSilk", "Shenzhen Chuangshifeida Technology", "Black Sesame Technologies Inc",
+ "Jiangsu Xinsheng Intelligent Technology", "MLOONG", "Quadratica LLC",
+ "Anpec Electronics", "Xi’an Morebeck Semiconductor Tech Co", "Kingbank Technology Co Ltd",
+ "ITRenew Inc", "Shenzhen Eaget Innovation Tech Ltd", "Jazer",
+ "Xiamen Semiconductor Investment Group", "Guangzhou Longdao Network Tech Co",
+ "Shenzhen Futian SEC Electronic Market", "Allegro Microsystems LLC",
+ "Hunan RunCore Innovation Technology", "C-Corsa Technology",
+ "Zhuhai Chuangfeixin Technology Co Ltd", "Beijing InnoMem Technologies Co Ltd",
+ "YooTin", "Shenzhen Pengxiong Technology Co Ltd", "Dongguan Yingbang Commercial Trading Co",
+ "Shenzhen Ronisys Electronics Co Ltd", "Hongkong Xinlan Guangke Co Ltd",
+ "Apex Microelectronics Co Ltd", "Beijing Hongda Jinming Technology Co Ltd",
+ "Ling Rui Technology (Shenzhen) Co Ltd", "Hongkong Hyunion Electronics Co Ltd",
+ "Starsystems Inc", "Shenzhen Yingjiaxun Industrial Co Ltd",
+ "Dongguan Crown Code Electronic Commerce", "Monolithic Power Systems Inc",
+ "WuHan SenNaiBo E-Commerce Co Ltd", "Hangzhou Hikstorage Technology Co",
+ "Shenzhen Goodix Technology Co Ltd", "Aigo Electronic Technology Co Ltd",
+ "Hefei Konsemi Storage Technology Co Ltd", "Cactus Technologies Limited",
+ "DSIN", "Blu Wireless Technology", "Nanjing UCUN Technology Inc",
+ "Acacia Communications", "Beijinjinshengyihe Technology Co Ltd", "Zyzyx",
+ "T-HEAD Semiconductor Co Ltd", "Shenzhen Hystou Technology Co Ltd", "Syzexion",
+ "Kembona", "Qingdao Thunderobot Technology Co Ltd", "Morse Micro",
+ "Shenzhen Envida Technology Co Ltd", "UDStore Solution Limited", "Shunlie",
+ "Shenzhen Xin Hong Rui Tech Ltd", "Shenzhen Yze Technology Co Ltd",
+ "Shenzhen Huang Pu He Xin Technology", "Xiamen Pengpai Microelectronics Co Ltd",
+ "JISHUN", "Shenzhen WODPOSIT Technology Co", "Unistar", "UNICORE Electronic (Suzhou) Co Ltd",
+ "Axonne Inc", "Shenzhen SOVERECA Technology Co", "Dire Wolf", "Whampoa Core Technology Co Ltd",
+ "CSI Halbleiter GmbH", "ONE Semiconductor", "SimpleMachines Inc",
+ "Shenzhen Chengyi Qingdian Electronic", "Shenzhen Xinlianxin Network Technology",
+ "Vayyar Imaging Ltd", "Paisen Network Technology Co Ltd",
+ "Shenzhen Fengwensi Technology Co Ltd", "Caplink Technology Limited", "JJT Solution Co Ltd",
+ "HOSIN Global Electronics Co Ltd", "Shenzhen KingDisk Century Technology", "SOYO",
+ "DIT Technology Co Ltd", "iFound", "Aril Computer Company", "ASUS",
+ "Shenzhen Ruiyingtong Technology Co", "HANA Micron", "RANSOR", "Axiado Corporation",
+ "Tesla Corporation", "Pingtouge (Shanghai) Semiconductor Co", "S3Plus Technologies SA",
+ "Integrated Silicon Solution Israel Ltd", "GreenWaves Technologies", "NUVIA Inc",
+ "Guangzhou Shuvrwine Technology Co", "Shenzhen Hangshun Chip Technology",
+ "Chengboliwei Electronic Business", "Kowin Memory Technology Co Ltd", "Euronet Technology Inc",
+ "SCY", "Shenzhen Xinhongyusheng Electrical", "PICOCOM", "Shenzhen Toooogo Memory Technology",
+ "VLSI Solution", "Costar Electronics Inc", "Shenzhen Huatop Technology Co Ltd",
+ "Inspur Electronic Information Industry", "Shenzhen Boyuan Computer Technology",
+ "Beijing Welldisk Electronics Co Ltd", "Suzhou EP Semicon Co Ltd",
+ "Zhejiang Dahua Memory Technology", "Virtu Financial", "Datotek International Co Ltd",
+ "Telecom and Microelectronics Industries", "Echo Technology Ltd", "APEX-INFO",
+ "Yingpark", "Shenzhen Bigway Tech Co Ltd"],
+["Beijing Haawking Technology Co Ltd", "Open HW Group", "JHICC", "ncoder AG",
+ "ThinkTech Information Technology Co", "Shenzhen Chixingzhe Technology Co Ltd",
+ "Skywalker", "Shenzhen Kaizhuoyue Electronics Co Ltd",
+ "Shenzhen YC Storage Technology Co Ltd", "Shenzhen Chixingzhe Technology Co",
+ "Wink Semiconductor (Shenzhen) Co Ltd", "AISTOR", "Palma Ceia SemiDesign",
+ "EM Microelectronic-Marin SA", "Shenzhen Monarch Memory Technology"]
 );
 
+# Validate the vendors array, it's so easy to get wrong
+# All pages but the last should be full
+for (my $page = 0; $page < @vendors - 1; $page++) {
+	die "Unexpected number of vendor names in page $page" unless @{$vendors[$page]} == 126;
+}
+
 $use_sysfs = -d '/sys/bus';
 
 # We consider that no data was written to this area of the SPD EEPROM if


-- 
Jean Delvare
SUSE L3 Support
