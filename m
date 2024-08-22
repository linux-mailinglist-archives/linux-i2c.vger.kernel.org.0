Return-Path: <linux-i2c+bounces-5683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD8995B83E
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67EA7287183
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93401C9EC6;
	Thu, 22 Aug 2024 14:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bhwrFWXz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2076.outbound.protection.outlook.com [40.107.96.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F7A1EB5B
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336561; cv=fail; b=VOQKaHPBYM85FctbYT0eV1etakf8rU0FxJL/aPCmh5YbTrCSjLBpi68Txjak6DNFWy/9WcZuXuE2dNEx/Vu6yfeyrSioPo6d459fdnhg2Z42cXZj+NHNKAJfEopBjzfDUW6zAF0zn7+Y0AvEYz2Wq3e8dE0hVs4cIWsLkexhtEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336561; c=relaxed/simple;
	bh=1/YliLRoCRTNNunsAauU7Fl9Ub8lt+lUzgR3F/my7PM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CeBwtcblEpAsrzOUS7BRdIX/A33YwKNYZqGwMl0WHlFJ6ObG1VYPj2h/7qYl4iNc4vhfn0fSVJSSPJBX9sDmJ596GgS57ODFznQMA6ODih/Ny7C+EMegumUWjl14JoM3uMYe1htDDIAf3/92cRFLO6dMTz/o7Gp029sfaktdcNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bhwrFWXz; arc=fail smtp.client-ip=40.107.96.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlkV45NJf9ptnVBdpG8lyMztBWlBtAWwtiL6NajXVUROzL8T6eJMHEFKdrVOCmOwUptnD1nN/Fxkn4+jjBKDjoXqekr0Ya4Mut+f/FWR1KA4yL5vONFh4SzMXDSLEIKW6hQXseodjlnGskRTilwqy9DTOAhUoV5IoClju56I3LV1AYzejq+82x8nwfvZgsfes/jpEclWTLrheijPB9Prpbp0+l6PpUrS37/TWWacUHidO76YaOvCqu/WM52ODgniJoohGdAIGfocTyjzT8QxhMwE4GfNclW3fD5RM+5bk+vEQLW9ZZ9Ge8zl2lvNeongJfgXLTJbb82Xvg59YgprMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaEWQLs+Tu55xTO4xSketbSHUIvLZnPyJs9bg25uD+8=;
 b=m+n0s/Xl9/syXomt6o+xTjpEWAkyxSD+LuJfE93IIBthVHXnFHB/0H9C+KJZMMJ1X0rP3VmBexqzIsehh+zRxWpdG3QmZoFsKCaxmeG6KT2b4+0D/P4WZv5SzhDJhj//S+mSyu+zWcMKVg3hXSBYBjlFos8DHiz2VIGCKzRoymiCWgo8eQr0fU6PtEkdrI5+Fj0b7MCO45YS9QulDLnhaY1mf0F3wiWm77mypAd7B2ah11FRbaiGZiuztJRW4NqgOJlX/KFDL1jreMLs/T7wUcG3IKhdHHg6wQyWl3X8FLxZ+Z9v4mxCbN0MIWiC+SdFxmGLJQUzdGVjk6VGq6bzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaEWQLs+Tu55xTO4xSketbSHUIvLZnPyJs9bg25uD+8=;
 b=bhwrFWXz55xy4/2bSglDs2K7O9bbDlok0eyGSyS3/63eOBIANX1Vw4zSA6Z6J3Z2v95iBwvVfkTIzkvIU6YVkRnccu9pMRu7jyvfsRfyhjEBCLoQpekB7kfdqtXBggccdbcEXXAoqkSAcSGZjJ0slNcb//88mWZAQ5wetihAuzM=
Received: from DM6PR06CA0056.namprd06.prod.outlook.com (2603:10b6:5:54::33) by
 MN2PR12MB4078.namprd12.prod.outlook.com (2603:10b6:208:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 14:22:35 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:5:54:cafe::e3) by DM6PR06CA0056.outlook.office365.com
 (2603:10b6:5:54::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Thu, 22 Aug 2024 14:22:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Thu, 22 Aug 2024 14:22:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 09:22:32 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/5] i2c: piix4: Add i2c_algorithm operations to support AMD ASF with SMBus
Date: Thu, 22 Aug 2024 19:51:57 +0530
Message-ID: <20240822142200.686842-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
References: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|MN2PR12MB4078:EE_
X-MS-Office365-Filtering-Correlation-Id: 97324e6a-5311-4232-3cac-08dcc2b5ddce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DiQOTAI8svQWLIK0V97mtcjNRQJ8jKiAwDSUNvz89UxI1rDdmX2oxyG4znYB?=
 =?us-ascii?Q?tf470K63xbQMyshatWa/4Q3ojPYHeTymy/tOv5QESXU6zWm3x9SMOa33FKlV?=
 =?us-ascii?Q?CuKS2qZvV6ioUKMrUo1x2/CQQd6vvwOgL+aIEglSdfPFvD/iYgJkmZTvGkig?=
 =?us-ascii?Q?Hvvbl24W97rnSayAcc6p1mywnG3BAn61vpedMCUKPHfD1Ep7hAO5B7b3XP6C?=
 =?us-ascii?Q?qBlnzCKe8ufuRQcROuVDx/ZKh6EV1ht/7Iqa9bO0wI1gZTrdcyGckH+n31UW?=
 =?us-ascii?Q?b3hKJhGRN5Pl1cC7VQXlUwgVKT6bREY30bbjJolX/7N2m5HkeAxaRfkpK8tM?=
 =?us-ascii?Q?W26G+Jm/dirbxdi7tXssr+IIj5arhF81VoQPQcb+wUnX4YUxCrfpm/J+cIk+?=
 =?us-ascii?Q?JA6bFIdTMxLCeq5Ie3HfKdcNYKvDfvN/VkfDx9PZwh4TxwF2h5P1i+9cfCjQ?=
 =?us-ascii?Q?BT4AlYNMru6AFFoexZnveJIoqB8thYO6kPFdFyxV2Ew+lJ+sl5GGRO/eQcxH?=
 =?us-ascii?Q?4d6hWpwFb21YwGaCdXWLCyzK8JefjiSUVh0GUtuDxtk7gnxT9iKSgBrCD/45?=
 =?us-ascii?Q?KHU/ZsbW/xnuhZBkLjfdqOwCojyHf0fUNPvjE1hAuX54mPn3IL5bN610QzMw?=
 =?us-ascii?Q?qHfNXZbrSUMSVCcuZztnK++2OYcpu9v4f4Za68NF8PMJ/bslk+iJgUawCQt8?=
 =?us-ascii?Q?G+aoYIYlw3rv758GvES8yv+GLAaB9lDXoIqS6VbofUQDlF26dE/xIoaTHrb8?=
 =?us-ascii?Q?cxb1pMth2Gz1NGCoDWIat+ep402KYp9Qwf5Z9Vt2FlPP6dxfbos88RIWWovy?=
 =?us-ascii?Q?NyELU7j1de/RZkSxWq91f7x8gmC9GMseAD1EDhH4GbAB/EcUnZehkysf4e9v?=
 =?us-ascii?Q?4YKQXfKKo1FWsArqyFSFs4aOv3mdghOnIqWQNtrIfjVz40MYu3bTaqDUrt3e?=
 =?us-ascii?Q?TCSxBqjdhwzAadEQuoklDTfNycAypp1aktTT/MVqOuIHpggYM5Bvz0CKESK5?=
 =?us-ascii?Q?BNfZQRt+VrYZ1xx5FX22apu9mSiL220uq2DnUJMdfm9KWMJONBPn4PxP7dUb?=
 =?us-ascii?Q?uOI0t/JcMOGn7nUjABeJFhVOcCkX46j4A8gPnmfH18Wfeuh3jm1YjbcqtNkI?=
 =?us-ascii?Q?BBCroMWH5krcF1V5Q23d7ZZ70Vgm9ABMQ2N5z8uBJlyEb3fwfziH4gdwuCUx?=
 =?us-ascii?Q?n1fAUOM+lGLh8DoMEajpK9Xy3VT9exa/iVu0DYRkFH0fwFc9s9hs2e/9umO7?=
 =?us-ascii?Q?F5TaE+MsxXRokVIae5H05tn8hRqO5Pz1rM1ErBS06QsIzHPv86ZL41W9KF1U?=
 =?us-ascii?Q?5GS+Um/EJDDmmx+57NztYdM20ieXX8RSkItpsTQMkJ75ozlv8N663RqpVgV0?=
 =?us-ascii?Q?cbgxD7FnZ+4ofb9m8ikTLsJweSXiuWZuWhm6JkLMk7ElmROnpoptM+zNc7/L?=
 =?us-ascii?Q?65WvWZJNo7Plr/bOdThR/F3WrBwlbyqy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:22:34.5136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97324e6a-5311-4232-3cac-08dcc2b5ddce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078

Implement the i2c_algorithm operations to enable support for AMD ASF
(Alert Standard Format) with SMBus. This enhancement includes:

- Adding functionality to identify and select the supported ASF functions.
- Implementing mechanisms for registering and deregistering I2C slave
  devices.
- Providing support for data transfer operations over ASF.

These changes will extend the piix4 driver to accommodate the additional
capabilities provided by AMD's ASF Controller.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 187 +++++++++++++++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 2babe9a2291c..a44b53dd4dd7 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -50,6 +50,25 @@
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
+#define ASFINDEX		(7 + piix4_smba)
+#define ASFLISADDR		(9 + piix4_smba)
+#define ASFSTA			(0xA + piix4_smba)
+#define ASFSLVSTA		(0xD + piix4_smba)
+#define ASFDATARWPTR		(0x11 + piix4_smba)
+#define ASFSETDATARDPTR		(0x12 + piix4_smba)
+#define ASFDATABNKSEL		(0x13 + piix4_smba)
+#define ASFSLVEN		(0x15 + piix4_smba)
+
 /* count for request_region */
 #define SMBIOSIZE	9
 
@@ -101,6 +120,7 @@
 
 #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
 #define SB800_PIIX4_FCH_PM_SIZE			8
+#define SB800_ASF_BLOCK_MAX_BYTES		72
 
 /* insmod parameters */
 
@@ -168,6 +188,7 @@ struct sb800_mmio_cfg {
 enum piix4_algo {
 	SMBUS_SB800,
 	SMBUS_LEGACY,
+	SMBUS_ASF,
 };
 
 struct i2c_piix4_adapdata {
@@ -179,6 +200,7 @@ struct i2c_piix4_adapdata {
 	u8 port;		/* Port number, shifted */
 	struct sb800_mmio_cfg mmio_cfg;
 	u8 algo_select;
+	struct i2c_client *slave;
 };
 
 static int piix4_sb800_region_request(struct device *dev,
@@ -887,6 +909,168 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
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
@@ -959,6 +1143,9 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	case SMBUS_SB800:
 		adap->algo = &piix4_smbus_algorithm_sb800;
 		break;
+	case SMBUS_ASF:
+		adap->algo = &sb800_asf_smbus_algorithm;
+		break;
 	}
 
 	adapdata = kzalloc(sizeof(*adapdata), GFP_KERNEL);
-- 
2.25.1


