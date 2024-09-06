Return-Path: <linux-i2c+bounces-6301-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B596EBB6
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 09:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE9491F26D2C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 07:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C8E14A630;
	Fri,  6 Sep 2024 07:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hL4Z3LZF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BB913BC0D
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 07:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606792; cv=fail; b=lLJn3Oies+0N7itn4vxrHggLz+LbubjoXk/azXflD5vaDSxbQ65geDI8pBWqEHIZTablQGY9T/Car+dSj0R3tT0sk/7/7zRNogNEpo/jINjrWEZRdWhJA6Ghw0Borp8Fy73krmwTkFQrAL4yCSbHp2YWfdA+HfcL0fXH8u/54lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606792; c=relaxed/simple;
	bh=pmMnWKKXonWbFOWwsCBt6xF+D/X3IGBvv5MgYodIo9w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hAnVrQsByd+BBKnEk9PB/exNLJrjjuKkoCkFDmzsSIVYIMS/+OoCqVAEVMc30VhQpmwqBoa2RD4Xf5Cv2RriNIjpwCd5v/+CIjw1hw2hk445kjDuqDLXl7hHpc01gb3lK43RM60K/kKsKlAnDiRxVOSy9+bU6NYcs7AWHZOr3yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hL4Z3LZF; arc=fail smtp.client-ip=40.107.244.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRd1uT3SczxSFeCrdEELnK39i7q50OSX+CWB/dTMfjw+YUkKs4MFAy9hAy3SXKlB2RJOM5zqNI+Isb54jiQRTTwQUpCfIUNiWnTl3iqMVXgPLnw65THWNYLGbEtqvthC3pXi5fHUttDDEFbZxMHBoRucl9U4NWppUdk/z6G+PkwUSyl436AUm/F7v0ZcEUXK5CvFbhTxdy/+fxttLP5zwKoyBUGWj3l2zmmFNQvnjBZxGexDnugSs1xEU7hyw3y2xBXgsosd4m7JcuNUtPqJiac8A36E+4ef1U9hCWlJXYho69/672QrwFOrqmYbOvP7E2kUCXRTktIg5ddWWkMMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vJBEuvfJu5mRKySbWPiUUYyrpOjn+viF9j74iU44eo=;
 b=ErnJqnGLISbHpgD+SyC9oCzE0TPMU+moIQXoW4oZe270uA0qXCrz/NwVJKEKkwMCF3V3KDGCuCSRDP8kYr0l34g9ljVRjbJdJC1KPvW+Lng5pX1jfgGqvC8vY22S1n+CaCpmuDxWj3uvAdc2TR0CtNp7MlXDzSbyG67Q+RUQW46sprAW9npXj5DmhlsvU0tOFD4ZQHoGAZwfpE/WdK14qYqVC22H8vkX7KNi9hqQTLcdrKUwCUKcDI/l0q+w+CDCybg7eedCrivbrKVnNf2JCRUTKypfZc4Jotogk0PAVqtQ4ULiU+SU0VMG8q1uKPolCtiRc6nvrQT/XI0GpJGkKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vJBEuvfJu5mRKySbWPiUUYyrpOjn+viF9j74iU44eo=;
 b=hL4Z3LZFrfFVSck+LpXN4jSXq+Vw+KBYstSC5suQaulIbOMnB2Ra7emcc6gdJ4n4Nn8kXedQ6tRJjO3T0eEQagIu80asFy5PASW0EmUcmtzB3FS5HoBEvxrkcF4g2qdVFUyt9RF6ZyAgLyfimj8OWY7oplunOx+KXfLWG9dYJjk=
Received: from CY5PR20CA0007.namprd20.prod.outlook.com (2603:10b6:930:3::26)
 by CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 07:13:04 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:930:3:cafe::e) by CY5PR20CA0007.outlook.office365.com
 (2603:10b6:930:3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Fri, 6 Sep 2024 07:13:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 07:13:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 02:13:01 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/5] i2c: piix4: Add i2c_algorithm operations to support AMD ASF with SMBus
Date: Fri, 6 Sep 2024 12:41:58 +0530
Message-ID: <20240906071201.2254354-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
References: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|CY5PR12MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: 9578bb0d-ff96-49a6-1da6-08dcce4359cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/52IAv0hkDX3dTU2ZPWpHKUXp87IFKC0Z3VKVSd+JWjeOxURqnK2jrQLMGcC?=
 =?us-ascii?Q?Sw4Po5k1q3NtaVvIOI53Al0SXwQ4TgzaI8852pVO/MrB/fnCKl9O8LD/ieOa?=
 =?us-ascii?Q?Oqzhz1ko0VxHIOyJuDmouGVzZtxJwpuCgtzwxsY2Cvuz2VW66uw4qlm2oap6?=
 =?us-ascii?Q?CV+2I3vcap/7J2nJqzOi0G4kUTsIzWhq0oJqnE3K5FEX3WQZKd/XN6HZqh7C?=
 =?us-ascii?Q?69X4zRSnYx7U2Iqdh94t/YSuuPaUorquKyr+wQUfWQvCH7in7s9d1hu4lvoB?=
 =?us-ascii?Q?iDjZBwXvzoJ7Uk3l8wXZATPh2sXFiHN7v8bKPdcFm2aESUJOZHaZML2fTRy0?=
 =?us-ascii?Q?5GbbIQIxfTieSq2iRh6pv0sBxOSEvRbjKzj96AukpXrr9YC1wQ/7XuURNSOB?=
 =?us-ascii?Q?GU0Jm760NgmyJ2jwSrVrKLb/KKSJb/rjsYND0vrXeGStBnUpVNUPilmYgu+S?=
 =?us-ascii?Q?N5gbAfDRmwU2RZ4SQ0S7zwzGFYrdnckijRjqxinEb/k3DXQVx3So8uB03O1G?=
 =?us-ascii?Q?OdQrmHHmPl0nxSu+VxPaYq8nueMlHpe/c80/OrbWpcAv9QDegqdczsOz8fi/?=
 =?us-ascii?Q?+/CPBB0759kACKGpYIPJo4PiJmuSQVhIwwQsHLUtXf5ZRt8Wl0jVC2uCcsPJ?=
 =?us-ascii?Q?7RYVQOpqQNjs7DdtI62ZofEZwcYIXxyt9Ly4yHEFcMwuMB/zX+D3rHVWzJCG?=
 =?us-ascii?Q?am4ggmlgkA03x9EmWhZTGEMK4Fj1TCvtKKnmtpEYMw+LP6z0oVpdo0YnkIEX?=
 =?us-ascii?Q?ipGcrocrO8nBtwGToxjhHccyihwWVJzuI3wUl8ioWl8OZYzKfLYZCxkAt5eI?=
 =?us-ascii?Q?SjpK/slsslFSkFaHnbEwJEyP4r9EvaMLjjrtVyU1fVetq7doPrigw1lXpJcU?=
 =?us-ascii?Q?NDENEAWEDL28+PNW2qLfeOZC5yAw75U8mk9HqaHfHZUt06DUXKAwyUgEykak?=
 =?us-ascii?Q?IbGlHM6Y48Lge/ekBPnY4Lsv13EYTZXntDvAZsMvU+MkE6Q3qEw74EmMDPRr?=
 =?us-ascii?Q?cwU7duT+sYts6iZDds86mFE23XGR9ZrCh4Dch6EXtGkhoKF1eAf0g5BPunGK?=
 =?us-ascii?Q?sfyq/yjko1VJfJc006b9aEp2pjesk5InhJiFmftUBYIgbk7CinidQhUvb6iP?=
 =?us-ascii?Q?OhWLkMuRxeQGF/Ag+eneFIEIe+jjF7GL89VM2pWgGDtl3WlhZFtEKqK4Y/XB?=
 =?us-ascii?Q?urj1YH22F3gDH9UQk553dyTLUaEhQz4UK1pPulZyRyKpQwwsddx6vHhDsbR3?=
 =?us-ascii?Q?Mh8CfbkeJtUsFxiBWV5CzVY1awlD4rHrOuOw39ywD+IBQohJuXwbIBy1Tneu?=
 =?us-ascii?Q?nua9Vgt/i/VYe8QTvV/KCTbJhtOsKbedCTXmZjagOVZrrl31V3fgwjzpSjiW?=
 =?us-ascii?Q?kDr83hCHZfYpUVzoUBZoblf4/vFHaV6hgJY5BTulNF10um2g50uohjziEGFf?=
 =?us-ascii?Q?0qYadtTruaEPYK8B3uz4RiRXyZ6l6dSi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 07:13:04.2728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9578bb0d-ff96-49a6-1da6-08dcce4359cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6252

Implement the i2c_algorithm operations to enable support for AMD ASF
(Alert Standard Format) with SMBus. This enhancement includes:

- Adding functionality to identify and select the supported ASF functions.
- Implementing mechanisms for registering and deregistering I2C slave
  devices.
- Providing support for data transfer operations over ASF.

These changes will extend the piix4 driver to accommodate the additional
capabilities provided by AMD's ASF Controller.

Additionally, include a 'select' Kconfig entry for CONFIG_I2C_PIIX4, as
the current patch utilizes reg_slave and unreg_slave callbacks, which are
controlled by IS_ENABLED(CONFIG_I2C_SLAVE).

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/Kconfig     |   1 +
 drivers/i2c/busses/i2c-piix4.c | 184 +++++++++++++++++++++++++++++++++
 2 files changed, 185 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a22f9125322a..10ad839bf4a2 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -197,6 +197,7 @@ config I2C_PIIX4
 	tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
 	depends on PCI && HAS_IOPORT
 	select I2C_SMBUS
+	select I2C_SLAVE
 	help
 	  If you say yes to this option, support will be included for the Intel
 	  PIIX4 family of mainboard I2C interfaces.  Specifically, the following
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index d56083e58a2d..003cb04312cf 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -50,6 +50,22 @@
 #define SMBSLVEVT	(0xA + piix4_smba)
 #define SMBSLVDAT	(0xC + piix4_smba)
 
+/* SB800 ASF register bits */
+#define SB800_ASF_SLV_LISTN	0
+#define SB800_ASF_SLV_INTR	1
+#define SB800_ASF_SLV_RST	4
+#define SB800_ASF_PEC_SP	5
+#define SB800_ASF_DATA_EN	7
+#define SB800_ASF_MSTR_EN	16
+#define SB800_ASF_CLK_EN	17
+
+/* SB800 ASF address offsets */
+#define ASFLISADDR		(9 + piix4_smba)
+#define ASFSTA			(0xA + piix4_smba)
+#define ASFSLVSTA		(0xD + piix4_smba)
+#define ASFDATABNKSEL		(0x13 + piix4_smba)
+#define ASFSLVEN		(0x15 + piix4_smba)
+
 /* count for request_region */
 #define SMBIOSIZE	9
 
@@ -101,6 +117,7 @@
 
 #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
+#define SB800_ASF_BLOCK_MAX_BYTES		72
 
 /* insmod parameters */
 
@@ -168,6 +185,7 @@ struct sb800_mmio_cfg {
 enum piix4_algo {
 	PIIX4_SB800,
 	PIIX4_SMBUS,
+	SMBUS_ASF,
 };
 
 struct i2c_piix4_adapdata {
@@ -179,6 +197,7 @@ struct i2c_piix4_adapdata {
 	u8 port;		/* Port number, shifted */
 	struct sb800_mmio_cfg mmio_cfg;
 	u8 algo_select;
+	struct i2c_client *slave;
 };
 
 static int piix4_sb800_region_request(struct device *dev,
@@ -887,6 +906,168 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	return retval;
 }
 
+static void sb800_asf_update_bits(unsigned short piix4_smba, u8 bit, unsigned long offset, bool set)
+{
+	unsigned long reg;
+
+	reg = inb_p(offset);
+	if (set)
+		set_bit(bit, &reg);
+	else
+		clear_bit(bit, &reg);
+	outb_p(reg, offset);
+}
+
+static void sb800_asf_update_bytes(struct i2c_piix4_adapdata *adap, u8 bit, bool set)
+{
+	unsigned long reg;
+
+	reg = ioread32(adap->mmio_cfg.addr);
+	if (set)
+		set_bit(bit, &reg);
+	else
+		clear_bit(bit, &reg);
+	iowrite32(reg, adap->mmio_cfg.addr);
+}
+
+static void sb800_asf_setup_slave(struct i2c_piix4_adapdata *adap)
+{
+	unsigned short piix4_smba = adap->smba;
+
+	/* Reset both host and slave before setting up */
+	outb_p(0, SMBHSTSTS);
+	outb_p(0, ASFSLVSTA);
+	outb_p(0, ASFSTA);
+
+	/* Update slave address */
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_LISTN, ASFLISADDR, true);
+	/* Enable slave and set the clock */
+	sb800_asf_update_bytes(adap, SB800_ASF_MSTR_EN, false);
+	sb800_asf_update_bytes(adap, SB800_ASF_CLK_EN, true);
+	/* Enable slave interrupt */
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, ASFSLVEN, true);
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_RST, ASFSLVEN, false);
+	/* Enable PEC and PEC append */
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_DATA_EN, SMBHSTCNT, true);
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_PEC_SP, SMBHSTCNT, true);
+}
+
+static s32 sb800_asf_access(struct i2c_adapter *adap, u16 addr, u8 command, u8 *data)
+{
+	struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(adap);
+	unsigned short piix4_smba = adapdata->smba;
+	u8 len;
+	int i;
+
+	outb_p((addr << 1), SMBHSTADD);
+	outb_p(command, SMBHSTCMD);
+	len = data[0];
+	if (len == 0 || len > SB800_ASF_BLOCK_MAX_BYTES)
+		return -EINVAL;
+
+	outb_p(len, SMBHSTDAT0);
+	inb_p(SMBHSTCNT); /* Reset SMBBLKDAT */
+	for (i = 1; i <= len; i++)
+		outb_p(data[i], SMBBLKDAT);
+
+	outb_p(PIIX4_BLOCK_DATA, SMBHSTCNT);
+	/* Enable PEC and PEC append */
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_DATA_EN, SMBHSTCNT, true);
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_PEC_SP, SMBHSTCNT, true);
+
+	return piix4_transaction(adap);
+}
+
+static int sb800_asf_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(adap);
+	unsigned short piix4_smba = adapdata->smba;
+	u8 asf_data[SB800_ASF_BLOCK_MAX_BYTES];
+	struct i2c_msg *dev_msgs = msgs;
+	u8 prev_port;
+	int ret;
+
+	if (msgs->flags & I2C_M_RD) {
+		dev_err(&adap->dev, "Read not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	/* Exclude the receive header and PEC */
+	if (msgs->len > SB800_ASF_BLOCK_MAX_BYTES - 3) {
+		dev_err(&adap->dev, "ASF max message length exceeded\n");
+		return -EOPNOTSUPP;
+	}
+
+	asf_data[0] = dev_msgs->len;
+	memcpy(asf_data + 1, dev_msgs[0].buf, dev_msgs->len);
+
+	ret = piix4_sb800_region_request(&adap->dev, &adapdata->mmio_cfg);
+	if (ret)
+		return ret;
+
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_RST, ASFSLVEN, true);
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_LISTN, ASFLISADDR, false);
+	/* Clear ASF slave status */
+	outb_p(0, ASFSLVSTA);
+
+	/* Enable ASF SMBus master function */
+	sb800_asf_update_bytes(adapdata, SB800_ASF_MSTR_EN, true);
+	prev_port = piix4_sb800_port_sel(adapdata->port, &adapdata->mmio_cfg);
+	ret = sb800_asf_access(adap, msgs->addr, msgs[0].buf[0], asf_data);
+	piix4_sb800_port_sel(prev_port, &adapdata->mmio_cfg);
+	sb800_asf_setup_slave(adapdata);
+	piix4_sb800_region_release(&adap->dev, &adapdata->mmio_cfg);
+	return ret;
+}
+
+static int sb800_asf_reg_slave(struct i2c_client *slave)
+{
+	struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(slave->adapter);
+	unsigned short piix4_smba = adapdata->smba;
+	int ret;
+	u8 reg;
+
+	if (adapdata->slave)
+		return -EBUSY;
+
+	ret = piix4_sb800_region_request(&slave->dev, &adapdata->mmio_cfg);
+	if (ret)
+		return ret;
+
+	reg = (slave->addr << 1) | BIT(0);
+	outb_p(reg, ASFLISADDR);
+
+	sb800_asf_setup_slave(adapdata);
+	adapdata->slave = slave;
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_DATA_EN, ASFDATABNKSEL, false);
+	piix4_sb800_region_release(&slave->dev, &adapdata->mmio_cfg);
+	return 0;
+}
+
+static int sb800_asf_unreg_slave(struct i2c_client *slave)
+{
+	struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(slave->adapter);
+	unsigned short piix4_smba = adapdata->smba;
+
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, ASFSLVEN, false);
+	sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_RST, ASFSLVEN, true);
+	adapdata->slave = NULL;
+	return 0;
+}
+
+static u32 sb800_asf_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BYTE |
+		I2C_FUNC_SLAVE | I2C_FUNC_SMBUS_WRITE_BLOCK_DATA | I2C_FUNC_SMBUS_PEC;
+}
+
+static const struct i2c_algorithm sb800_asf_smbus_algorithm = {
+	.master_xfer = sb800_asf_xfer,
+	.reg_slave = sb800_asf_reg_slave,
+	.unreg_slave = sb800_asf_unreg_slave,
+	.functionality = sb800_asf_func,
+};
+
 static u32 piix4_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
@@ -959,6 +1140,9 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	case PIIX4_SB800:
 		adap->algo = &piix4_smbus_algorithm_sb800;
 		break;
+	case SMBUS_ASF:
+		adap->algo = &sb800_asf_smbus_algorithm;
+		break;
 	default:
 		dev_err(&dev->dev, "Unsupported SMBus algorithm\n");
 		return -EINVAL;
-- 
2.25.1


