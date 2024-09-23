Return-Path: <linux-i2c+bounces-6928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA0A97E729
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 10:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15C0B1F20F33
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 08:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6CA5FBBA;
	Mon, 23 Sep 2024 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tjrMogpJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445AB2AE96
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078743; cv=fail; b=qBm6yoorJTxONql9JcawOwbq5bYtKUIhfEG3+HFHfCfKHRrEsfVNr9IRI1/h4BwRmZcT4euEhM0skIm9pUrruXN/P+Ey0Ov6h92O/XY+YhlpvV2SKd0mr4kbFXnBb/1t8P87Y5VLS0czxDtcgmnc/6wP8lB4CzMQSIcU58+m3Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078743; c=relaxed/simple;
	bh=FdXQ8xGtNzez4PNr/veR1I48iinOgzYmSShUYNSz9j0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jb+rQja74abRftbGscuxrmV99BXgSpXHIvJMCN8iVeQMQyXLvupdi4FfhVOvOCc4H5jTKV4IUd2N5ATspAUK00gi/L2m24lFh4m5vmm6zYczSr1URKjurgNslLOywas31Dj5MheFYIFfaZpMxVJb2oLxTCAQgIY8a06nTeoea6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tjrMogpJ; arc=fail smtp.client-ip=40.107.236.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDIGXXKKRFJAJeApNT/+eBvjWIbyF86hRrKJFPpmb+VaJobZr01My4Cl/VV5/rqtN3eQ16/EU7Ozr0e8wLqoeNg9YXchL1Il5n53xxZqmeow5UOyywMLJwoBvuZGUchFAd6OSbcpxoy0cbAzeiCNeLBKjRa+WfuR+QvxeHfS0lI5QzrdNE5Dam3pD7iyacEgvs2lS6eirsAFpTE7PxDlgyqRBQfcnYd1G8yodnsflR0OoyOE7WoW6EIkQTGGjxCVD7AEfij+zsYw4Y8pJKVenzgjr77HfMIG+eZ9KnrJG6IOUoRvc6J5C+4wpuXzqAeAcNPawFgYAjvDWinOufeuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eajFIDukOwiWMX21f4IkTRQC4c2eGYsVVIevBvTMBZQ=;
 b=MKL5z1P1q1P5D9SP1+VI8awBRgf4mCz6tyyXtWfwCk6+v5PCoXl9wCfxFxVeGJo0UJIp+bbCWdrzkGar9tJzFF75CRydaPT/xG3wW8mnMnA0Ihe6iok6D2uYcDH7Ty29+U/dlIkxDSdnVGYY9Y0a/yF++VSplygxXRWw0vHfW6mIv1GPJuSxnElzYlMMxedlxfAPxwL43G/C5NWV0VHDcn0O23BbKxrApjP1EPWNd4WvfOmCanjseNGTXnm2mfYAE/7S5WGkYIKr07M1nlbuUNCrgJYx7PwytdslxTJXSaLNlMZhfUB1Gqz5T1Yx3QF+u42cN/uYjKWecIxFBwz0RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eajFIDukOwiWMX21f4IkTRQC4c2eGYsVVIevBvTMBZQ=;
 b=tjrMogpJlJLsnrurlmDsM4KxN59UaDz+EzNwH9BcYbkM7Is8GoU1ofqhpwAyjIAm4Rx6PyesifUiYe1wKgIO4g3JBts0qJialfD1cteX0I3q1fLY9CEycDLJ7seJ215F060jM8bJhtIlQeIzhpXhD1OaZ9eqXLGdtJh59hGjJV8=
Received: from SJ0PR03CA0374.namprd03.prod.outlook.com (2603:10b6:a03:3a1::19)
 by MW3PR12MB4377.namprd12.prod.outlook.com (2603:10b6:303:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 08:05:37 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::83) by SJ0PR03CA0374.outlook.office365.com
 (2603:10b6:a03:3a1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Mon, 23 Sep 2024 08:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 08:05:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 03:05:32 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 6/8] i2c: amd-asf: Add routine to handle the ASF slave process
Date: Mon, 23 Sep 2024 13:33:59 +0530
Message-ID: <20240923080401.2167310-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
References: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|MW3PR12MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a138a2-e6c1-4aba-7694-08dcdba681e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WSYnJYDAH1iB4XZoMvjIDJ2YXDih5kXfV9AQfpjbw0QpsiX51+wxMMvkU9Gq?=
 =?us-ascii?Q?nrXDf0UFiN+iEJlz/wBdwWGe5X2BnHDDi5Q91lnhxlu/ZBOdPQgX2G8/rjOO?=
 =?us-ascii?Q?Lk4ob+/jzAoCJ2IUel5R++MDBiGujP7IF3UbsDk/5tpHDaXPpNT0JEcbMD9V?=
 =?us-ascii?Q?yImZpsQTe0vHZbP4aNpsZyHcOR+4DURgYjh42LPvBf+y0jo9sFQlMPuEuWu3?=
 =?us-ascii?Q?PXN4AYpkCDBzftyBQr3fa0piMzwe0vBWWxkK8hdHUMpYCunDt3eEe3OmzKNo?=
 =?us-ascii?Q?vp6+sIOFMKwi8m93SpxHoYfWkfq05kvz7FNoTPLyQauouBCLUVGNZZQ41cma?=
 =?us-ascii?Q?GyjPzZaVQ43YTBx9HEPwvzVT+ux/4Yx8RjbjZeVd2sKHftqSvutVGP4OD6xM?=
 =?us-ascii?Q?+9ngG1fIGeET0VRUtDwJ1xHt41SeVHfF0X7xohMq4MQPoLc/b6aF0D8BqKDc?=
 =?us-ascii?Q?Qnk2ed5bWnMKu47ZT4RX2RzO2E1k4cFjwEvOFk43KhHebgQYECAk85fNQYWv?=
 =?us-ascii?Q?dlqDF4dg11EEBmV0mDf959Fh98i0fBbNwgGns7EAZQ/Ga6XDmJzZDl6NDRiG?=
 =?us-ascii?Q?97Vsc1i16DWFPeGZfJncG7Ve78lC5afDvVkwoIWk6O41GkKeSpCc7KhnkHkS?=
 =?us-ascii?Q?X4z8ePJMPn4GPlF2HUU3DrV+hbQpniVfCCz/TW9B4tkDcZIGWzrtS5phiANV?=
 =?us-ascii?Q?e49u5rnGGhBLVsoYFNyn+J3RqtxmdDL9ZXN6BH0DYkI80LU9gLbNg9G1U1Dz?=
 =?us-ascii?Q?phfpqvYN/qXocuATS7qQG8lD+4qDG9XuxiClfbwivZnij1S2NdPFYtoxBG+f?=
 =?us-ascii?Q?nyatWGBS3vcIGM0aLWLoRoTpLf1fzwwezyJ2YsKqlptKrxL/jmFLNu76qCzJ?=
 =?us-ascii?Q?xW6VcGP8lGJhHHRuznaWgJ7+ZBwQVdLceAk8JscrhK7hr5l68T6LYkrYetKe?=
 =?us-ascii?Q?7AEQ+b8UnLamexHn7rQ15HruV6PgWkkV/J2sCK0PP0uVvGFiYjgE9mNdiFND?=
 =?us-ascii?Q?voRlOL2Sh2fqXKZBoh51rIXdGNLyTEBb24SArtElccf2jGhBmmuNz+bhGgnp?=
 =?us-ascii?Q?NOwIGAHS7L6SCE7qa1iKa+5FycmYpympO366hLDU97gnoWbjNTuezxjR71ll?=
 =?us-ascii?Q?GH/wat28kX9hVN3aGt+7N1EAU5EqgaQ9bzB9+evSAoDCSLzwVyJy9kfwAJ8/?=
 =?us-ascii?Q?SO2+WFNquFEAn8jFt8XmRat+0ImQWeIYjocRY9minKzpXRtNODLEHy/8Oex/?=
 =?us-ascii?Q?q/uqtJ288X1cvK9SndDA+YpChR43b64M1S1PgNockksvQu/yjyTKssNMbEIf?=
 =?us-ascii?Q?bow+OdegaBc5NIJjYvxkqMLV6aSVG+Xd7ui8r33iYywMRRE3YWqC5bFuhK83?=
 =?us-ascii?Q?RBz5km9D0vz4h7tmh6S19onDV8NN4x419O+0uM2VFty1I2VgSyNJt7Uf1P5F?=
 =?us-ascii?Q?Q6jssO9/zwpI8WdznF4EUVqzwJRfgJRS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:05:36.8649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a138a2-e6c1-4aba-7694-08dcdba681e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4377

Add support for handling ASF slave process events as described in the AMD
ASF databook. This involves implementing the correct programming sequence
to manage each ASF packet appropriately.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 101 ++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index 216b194202ba..fa6db99a8fe5 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -11,6 +11,7 @@
 
 #include <linux/bitops.h>
 #include <linux/device.h>
+#include <linux/devm-helpers.h>
 #include <linux/errno.h>
 #include <linux/gfp_types.h>
 #include <linux/i2c.h>
@@ -33,21 +34,90 @@
 #define ASF_CLK_EN	17
 
 /* ASF address offsets */
+#define ASFINDEX	(0x07 + piix4_smba)
 #define ASFLISADDR	(0x09 + piix4_smba)
 #define ASFSTA		(0x0A + piix4_smba)
 #define ASFSLVSTA	(0x0D + piix4_smba)
+#define ASFDATARWPTR	(0x11 + piix4_smba)
+#define ASFSETDATARDPTR	(0x12 + piix4_smba)
 #define ASFDATABNKSEL	(0x13 + piix4_smba)
 #define ASFSLVEN	(0x15 + piix4_smba)
 
 #define ASF_BLOCK_MAX_BYTES	72
+#define ASF_ERROR_STATUS	GENMASK(3, 1)
 
 struct amd_asf_dev {
 	struct i2c_adapter adap;
 	struct i2c_client *target;
+	struct delayed_work work_buf;
 	struct sb800_mmio_cfg mmio_cfg;
 	struct resource *port_addr;
 };
 
+static void amd_asf_process_target(struct work_struct *work)
+{
+	struct amd_asf_dev *dev = container_of(work, struct amd_asf_dev, work_buf.work);
+	unsigned short piix4_smba = dev->port_addr->start;
+	u8 data[ASF_BLOCK_MAX_BYTES];
+	u8 bank, reg, cmd;
+	u8 len, idx, val;
+
+	/* Read target status register */
+	reg = inb_p(ASFSLVSTA);
+
+	/* Check if no error bits are set in target status register */
+	if (reg & ASF_ERROR_STATUS) {
+		/* Set bank as full */
+		cmd = 0;
+		reg |= GENMASK(3, 2);
+		outb_p(reg, ASFDATABNKSEL);
+	} else {
+		/* Read data bank */
+		reg = inb_p(ASFDATABNKSEL);
+		bank = (reg & BIT(3)) ? 1 : 0;
+
+		/* Set read data bank */
+		if (bank) {
+			reg |= BIT(4);
+			reg &= ~BIT(3);
+		} else {
+			reg &= ~BIT(4);
+			reg &= ~BIT(2);
+		}
+
+		/* Read command register */
+		outb_p(reg, ASFDATABNKSEL);
+		cmd = inb_p(ASFINDEX);
+		len = inb_p(ASFDATARWPTR);
+		for (idx = 0; idx < len; idx++)
+			data[idx] = inb_p(ASFINDEX);
+
+		/* Clear data bank status */
+		if (bank) {
+			reg |= BIT(3);
+			outb_p(reg, ASFDATABNKSEL);
+		} else {
+			reg |= BIT(2);
+			outb_p(reg, ASFDATABNKSEL);
+		}
+	}
+
+	outb_p(0, ASFSETDATARDPTR);
+	if (cmd & BIT(0))
+		return;
+
+	/*
+	 * Although i2c_slave_event() returns an appropriate error code, we
+	 * don't check it here because we're operating in the workqueue context.
+	 */
+	i2c_slave_event(dev->target, I2C_SLAVE_WRITE_REQUESTED, &val);
+	for (idx = 0; idx < len; idx++) {
+		val = data[idx];
+		i2c_slave_event(dev->target, I2C_SLAVE_WRITE_RECEIVED, &val);
+	}
+	i2c_slave_event(dev->target, I2C_SLAVE_STOP, &val);
+}
+
 static void amd_asf_update_ioport_target(unsigned short piix4_smba, u8 bit,
 					 unsigned long offset, bool set)
 {
@@ -207,10 +277,29 @@ static const struct i2c_algorithm amd_asf_smbus_algorithm = {
 	.functionality = amd_asf_func,
 };
 
+static irqreturn_t amd_asf_irq_handler(int irq, void *ptr)
+{
+	struct amd_asf_dev *dev = ptr;
+	unsigned short piix4_smba = dev->port_addr->start;
+	u8 target_int = inb_p(ASFSTA);
+
+	if (target_int & BIT(6)) {
+		/* Target Interrupt */
+		outb_p(target_int | BIT(6), ASFSTA);
+		schedule_delayed_work(&dev->work_buf, HZ);
+	} else {
+		/* Controller Interrupt */
+		amd_asf_update_ioport_target(piix4_smba, ASF_SLV_INTR, SMBHSTSTS, true);
+	}
+
+	return IRQ_HANDLED;
+}
+
 static int amd_asf_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct amd_asf_dev *asf_dev;
+	int ret, irq;
 
 	asf_dev = devm_kzalloc(dev, sizeof(*asf_dev), GFP_KERNEL);
 	if (!asf_dev)
@@ -221,6 +310,18 @@ static int amd_asf_probe(struct platform_device *pdev)
 	if (!asf_dev->port_addr)
 		return dev_err_probe(dev, -EINVAL, "missing IO resources\n");
 
+	ret = devm_delayed_work_autocancel(dev, &asf_dev->work_buf, amd_asf_process_target);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to create work queue\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "missing IRQ resources\n");
+
+	ret = devm_request_irq(dev, irq, amd_asf_irq_handler, IRQF_SHARED, "amd_asf", asf_dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to request irq: %d for use\n", irq);
+
 	asf_dev->adap.owner = THIS_MODULE;
 	asf_dev->adap.algo = &amd_asf_smbus_algorithm;
 	asf_dev->adap.dev.parent = &pdev->dev;
-- 
2.25.1


