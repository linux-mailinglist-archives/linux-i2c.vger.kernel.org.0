Return-Path: <linux-i2c+bounces-6139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AF596B97F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 279CF1C21C97
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 10:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A381CF5CB;
	Wed,  4 Sep 2024 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pS413FFa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D03F1CEEAB
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 10:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447497; cv=fail; b=trSP14eX1Lka9eFnxjbMJwaOccWofjDKc7qVFC8Iw/P0mS7yYYDAMEUr/KNzKoVVsM0a094yYGyrQLlSeqdACCAYarfU1ALGTtPW6vNun8+Pr81efnmiUaY+QjhfjTD48rE0WfYKxIVbHBF8zxz7sZrw/hYq5EwnO3gPkQ43JBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447497; c=relaxed/simple;
	bh=pmMnWKKXonWbFOWwsCBt6xF+D/X3IGBvv5MgYodIo9w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gr7gzZMl3fCnFQ6qV8eRCJnXMWd3xo0KmV+q2z2sbWRWRbSEKOqyw0rV8RsIbXIp1HAC5U46NXf8XetM1uB0HdBC+Ivt2A9JYEtKkZhSjQDqKWXdtjAlAeY5SnHRt6DZONPg32IIgvD8qYnk7ZRMmJLm6m49kpu28mMoFIbMw40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pS413FFa; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfbiraCGPiF9rcZA2zyA7oZy1KafF3Ny2pj7CNxyt+vtJ+sbXN08zE+vKhcaAqe2EWOC+EdrW1vdC1ncbvi2QQcsTmYOfJmxPeRwFCT+qruqOGCnhSJBIDsPo1XK+6NyMXAcMkiZG4mEHceEpHjLU6jzSnUk0LKxR215Aqym7lO9NTMTOwm2EByPYIOxZTUQ8mg9Yw1xdRYIEirTHYurKktbQGhsAB53cXdQUIMo1ZNYMu9CLSzxSJj/9Gdom04KVxosjt6tmPBErswB83kgSOBxn07iT69EpTd5z5rogVb8qYnog53CVFYhzxmOmgMJ6qw2sYx8HfGBSpdCIp1/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vJBEuvfJu5mRKySbWPiUUYyrpOjn+viF9j74iU44eo=;
 b=GUbbKiamtj2JZ5ZZTnGZ/JBGxgLwE21iwA80lfCeGJ5jUF7jwpEdVy68QJoitOnSuOb4vdcqdmeHRY/5hALshsv75XOi2Hbn535BGTSI+N106GGWt627bG3/RqYUnWx4zJVl5tGhDQJ2yBzCS3AqgKSmP6zkgx9pHHiKiXqsSbGJ1rKAuWL0Rh57B3Wz+wgjFWGasQsvc3FQRlSjrpqmn8hrVAv+lcfwG7Q3uGG5uOxUIb9m/GDIX7zlyeO7UCd31sVwmKkWoJjYgMGkTNGLaV2T08YDmVN/ISxP82ezEVFU+TJr0i9xGhRr9in1uPRHhghPOoZTh68beLn+oRq+hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vJBEuvfJu5mRKySbWPiUUYyrpOjn+viF9j74iU44eo=;
 b=pS413FFa2zZhFIf2UZ1LTirwKkUKjRixVbUKWv/gT2C9rZ+aCpxWmvp6lYdF5DysbKknqYwMrHBZDaFX09jPCnEYd90OWRcCHDpenW56DpQbq5UoZFvbroZ4gh7hSHYkVjV2jcG7LykcfBja0rdfeYtEl1ATM4Uyrk+T+hXfDww=
Received: from BN9PR03CA0527.namprd03.prod.outlook.com (2603:10b6:408:131::22)
 by CY5PR12MB6057.namprd12.prod.outlook.com (2603:10b6:930:2e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 10:58:12 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::c6) by BN9PR03CA0527.outlook.office365.com
 (2603:10b6:408:131::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Wed, 4 Sep 2024 10:58:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 4 Sep 2024 10:58:11 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 05:58:09 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/5] i2c: piix4: Add i2c_algorithm operations to support AMD ASF with SMBus
Date: Wed, 4 Sep 2024 16:27:28 +0530
Message-ID: <20240904105731.2246235-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240904105731.2246235-1-Shyam-sundar.S-k@amd.com>
References: <20240904105731.2246235-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|CY5PR12MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2f2946-b2e7-43a8-9ff6-08dcccd07800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Ya29/ECt9pV/ufLUBjMXBtXLRekA0WrNK+5De2OaCORRavB6R+qb6Diu4Tl?=
 =?us-ascii?Q?NUhz2nwicxW5OYTiSDXOlZFrjuCnQoy3Rk/fBieAwwrCzu3tnY+e4yt/j/DZ?=
 =?us-ascii?Q?ChqYiy5F000ODEbZSQH/p8W1s2VUukWpRwMp7wjw94Phu3w3uR1xcikO/fLY?=
 =?us-ascii?Q?xOem2Ub4vUCK2S7KQdtgWSUvl62LAG5+MVL9KbWAJ73gVaK4UfxjhSm0YdV6?=
 =?us-ascii?Q?F9f3WwNhyx7/qUwHodg8y0oLwhUzfTpK4cPs4iiDbONc0lzU0S0BUQJB7plT?=
 =?us-ascii?Q?EgKYHZh3q5AJ85l5DYvsBbVLa0RLP7zb/e8z/jpZs80RL7NebpFRgJyvdCou?=
 =?us-ascii?Q?PcVKiRg/jIMsWIhB7V8xZuSfLNk2fBKAVoKllcDaiuT8Wny+ru5Ft5sHnvUo?=
 =?us-ascii?Q?vuWL8kORgXgqwGLXNC4XXDeFVHIjzLJnbA6oGGRkPsJdSidG24MrpXkD81v/?=
 =?us-ascii?Q?bEfArOjAZWzqvWAkhPqk0h3kHpiC+zi8mr674PIWk7ErQKoRKbch4Gqk9zbS?=
 =?us-ascii?Q?8tsO/P0Ps4TR4NthpQzwAa0q+zDc5cSuGFars0FUcPUrbaspZ4pxgsONgQt0?=
 =?us-ascii?Q?SXQTi7GxhVgdPEFw5P3YMdqN+qOu3LCXbDpOTWilRdDO2Bb1zql2/6IoHpde?=
 =?us-ascii?Q?rjPhkd7QhKXwgRiwyn6xX/oDVrSaMUiAugWOkN/oIGh6F/mSMqqgQN4G46bU?=
 =?us-ascii?Q?BFP+jhLO7Ca88Jea7XtjnchulskEY9Oc9xumSVMg43UtiUd+nfZ4saDZiLkf?=
 =?us-ascii?Q?fMDnO8P4Hlx0INAZmaeV40FVBJW9s2pRlg/VSTuZZ8/2VhKaOCbqNF0exNXF?=
 =?us-ascii?Q?oFrP99oTkGmC+f7RpTsMN4JhjNyCOlsc+lxbbTUSO7Ys+ewcXubXlImLlvfs?=
 =?us-ascii?Q?DTLpxhqEB65+3twl7ouIakpRDwsOInsX6Xg0x7ADem3/FXX7PvigzNrhtWvP?=
 =?us-ascii?Q?PmgBwCZbr+Ogyq4hZBwpWrGWoAAaPQ3zBuzjcf6Vq2i2nyB823upg2CKDQDx?=
 =?us-ascii?Q?sHfFwP8pyAwIGCQuLpeglL467lVc7L/Zh36k0iSgCRwyLvDs35nNiUMT4Bx5?=
 =?us-ascii?Q?5tdwhnkbbZPbgi9EnOYMa5nOZ08ndvOHFAchRyW4Zj1fWYxQXDJhiGSFZvB7?=
 =?us-ascii?Q?03g9VF8wxxjlRUD9fCi0k4dYNJNNXKRSN6Dpbda6vDAM2wvRhacdUhuxKeFB?=
 =?us-ascii?Q?1/wNVsISCv+cjAhDCqgIUuW3P/LTrkTgHaM877eWT8ALcK3CSEKqlF+52SoT?=
 =?us-ascii?Q?CSTKH+Wy1c22NCzpcj/aDgk8trXkenETWF6fPmHDBVdD+dOYR6BOUuwKUkLt?=
 =?us-ascii?Q?GolzWgtZLovKhs+aOn0pD94eSR1RB36tozSDN5LkqKYcQv0WB5P/l9ydru1y?=
 =?us-ascii?Q?NzGg86qVFFErPJXuUvYh22cudi+6fTtp372MKiEqe5igu7+YFh3e5mX3D1F6?=
 =?us-ascii?Q?x8evVIMrfT2GoVAG0D0CkyfbFcg/L0bY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 10:58:11.7713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2f2946-b2e7-43a8-9ff6-08dcccd07800
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6057

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


