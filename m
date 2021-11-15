Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B0C450189
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 10:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhKOJjL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 04:39:11 -0500
Received: from mail-vi1eur05on2105.outbound.protection.outlook.com ([40.107.21.105]:50465
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235130AbhKOJjA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Nov 2021 04:39:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RN58W7/BtJkP9ftT4976l7y9Mnim8u+vf06zFIRmZ1rWgWaG1Vvg/PVDJh2UD59QD69u+Gdk9TfhIV+aXe9dsLhRE62Ma583c5lVb7edhxeBokOZpP6qQJJqH4iPvgbF6p2Rihz3Daq6MAnB4iI417hBpRt95R+XODeLoqrqPK8X47WLXxw8+6jI0J8daIcQT6vwT/kHlz0vbsbzLOBn93j4f1xJ3ekL2NeOFB4DMv4+BidImHc7shj2IC0uGrRX6VnmB1jjBs3wXSI516yF2RqnAwaVwq2yyAEEUnkSZO4mGmca1EY8lr7qZuY1FzP96OyERpdnLG7PaRh8CiY8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yq0VBKqqlY30BS7vMtv3zaDBItUIIBGjQJd/zjN/zo8=;
 b=a97CFKOg+RJv0udLC39vI29EK5nIIy7S7f1MZchRqczgZCEvPRxlpW0bX1zpDNsffSD+JWbxo5qDSO5GmKTAor+xAreJz4LJFGsmkuwQ1HbVDNdQTOVARoRcB6yAzqa/yS8OdC+f/bHGdt9WqUr/gt6KQi+XpxqFCiIcSOujKY6XbXtrJ4/8jqdHYrpXfiMhDc+nciUCxsxotq6nfr7QBC5EgMTRuwWdEqqNIoSFnYqhFWhdMIkdtrdVq6ZI0V/kFfWCqL5JIf9qp+JWBFJvGY6FF9WtNqXddL3CTfIPYtZCz0znRs+reCG/s54HE7jV9JuBm2ZWbjjBFDR1+W+RBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.100) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=nokia-sbell.com; dmarc=pass (p=none sp=none pct=100)
 action=none header.from=nokia-sbell.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq0VBKqqlY30BS7vMtv3zaDBItUIIBGjQJd/zjN/zo8=;
 b=HiGOLjCTMBITvQyeRtyy61nG5kdEwDVrt4X5fcKiULY51RS+J3sS2p26HxJXxltYZgai2F4lgVD4+aYvHiG68urOLi3NVOMl02cQYsXedpm3pOx+CT4nMyCL1ScYMcK9tiMv60m2pdXeGuykv2RO0TgDfWLXvJp/8CqV2/iC2L4=
Received: from DB6PR07CA0017.eurprd07.prod.outlook.com (2603:10a6:6:2d::27) by
 VI1PR07MB6256.eurprd07.prod.outlook.com (2603:10a6:800:133::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.17; Mon, 15 Nov 2021 09:36:03 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::8e) by DB6PR07CA0017.outlook.office365.com
 (2603:10a6:6:2d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.15 via Frontend
 Transport; Mon, 15 Nov 2021 09:36:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.100)
 smtp.mailfrom=nokia-sbell.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-sbell.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-sbell.com
 designates 131.228.6.100 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.100;
 helo=fr711usmtp2.zeu.alcatel-lucent.com;
Received: from fr711usmtp2.zeu.alcatel-lucent.com (131.228.6.100) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 09:36:02 +0000
Received: from wrlinb193.emea.nsn-net.net (wrlinb193.emea.nsn-net.net [10.159.93.138])
        by fr711usmtp2.zeu.alcatel-lucent.com (GMO) with ESMTP id 1AF9ZwEm015680;
        Mon, 15 Nov 2021 09:35:58 GMT
Received: by wrlinb193.emea.nsn-net.net (Postfix, from userid 69176145)
        id 27B711191; Mon, 15 Nov 2021 10:35:58 +0100 (CET)
From:   "Lawrence,Wang" <lawrence.wang@nokia-sbell.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Wang, Lawrence" <lawrence.wang@nokia-sbell.com>,
        Wang@wrlinb193.emea.nsn-net.net
Subject: [PATCH] i2c: designware: Get HCNT/LCNT values from dts
Date:   Mon, 15 Nov 2021 10:35:55 +0100
Message-Id: <20211115093556.7154-1-lawrence.wang@nokia-sbell.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2a61890a-4645-4b00-4c8e-08d9a81b56ad
X-MS-TrafficTypeDiagnostic: VI1PR07MB6256:
X-Microsoft-Antispam-PRVS: <VI1PR07MB6256AC5DCA731A5FFA080B21BA989@VI1PR07MB6256.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A+u3qL19XVa1g1+Ma6Ov9uYb1a1Nx4q6cR4RRbqW5oezfagmJaRne5FTU4xRYp4f2+FhcVQLzqXR2B43eLLwdpa+PJpwialRt2LddrYWdlxGsKrxYxuxiB7LEqwJHr0jP+o+FMnffec2uEvNT+MEQ8Hc96JFTUGSGekilEg/UDPmvztVw9zTrKB7fc9D06boRq74rWQ2ro0y/UR6w+G0q7JRl2iFnCPnasS/6/It8D05VjaP06wGmK8MnS1jzHrLZgy2ajZhw4BGopvSOXyyA4ViELp0xNzPajOpXU7JaGHAriZsPqw433F507o9KKQALQX5vKkLOlEwpmPYjWiz5wufgNSyhgKXLQZFk02RpzVaFgQ4n0jKJ2ldMPKi2PsyASeImw1TtG5UQs5cIwbsyKyC5lot+sRpHGBEjRiu+rFu4PGPFUx4dJHGxkVbdjKWe1kWY2DLBqlkdyaaOJ3wFpT8DrN4X2u3TroBXsHb5C5l4V+QTxCeD0LnPLRj1QVkQ27tbksZh6rnbUACH3nmY1a4pg3m9OZM2aBjfRu0BFbTqksO9jPub5IytR+J012wytz0ZSKOQLshtnI6+YPXbUrCspZzaQhOuP3isVIC8YlzMsYHbn2AAkOMRLB54HVe7U5+TkhzuuuQDTqlV80MonMWWcvOjLpd0EQ3sgPz7UASBFvKCs/KH31pJ5MG6N9SGBbgVIGPKT9MYntfJYvodlCTSukSd6nZyGbCPTU3xNg=
X-Forefront-Antispam-Report: CIP:131.228.6.100;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:fr711usmtp2.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(8936002)(4326008)(1076003)(6666004)(42186006)(8676002)(2616005)(70206006)(70586007)(316002)(2906002)(5660300002)(36756003)(508600001)(26005)(336012)(82310400003)(86362001)(356005)(81166007)(82960400001)(107886003)(47076005)(6266002)(36860700001)(83380400001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia-sbell.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 09:36:02.0417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a61890a-4645-4b00-4c8e-08d9a81b56ad
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.100];Helo=[fr711usmtp2.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6256
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: "Wang, Lawrence" <lawrence.wang@nokia-sbell.com>

Current code support config the HCNT/LCNT only via ACPI method. for those
platform that not support ACPI, will get the HCNT/LCNT value based on input
clock. But it is not always accuracy. for example in some platform will get
lower speed(320khz) in fast mode, and get faster speed(105khz/even more) in
standard mode.

This patch makes it possible for the non-ACPI platform to pass more optimal
HCNT/LCNT values to the core driver via dts if they are known beforehand.
If these are not set we use the calculated values.

Signed-off-by: Wang, Lawrence <lawrence.wang@nokia-sbell.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 37 +++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h    |  1 +
 drivers/i2c/busses/i2c-designware-platdrv.c |  3 ++
 3 files changed, 41 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index bf2a4920638a..7cdceeaa9741 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -314,6 +314,43 @@ static inline u32 i2c_dw_acpi_round_bus_speed(struct device *device) { return 0;
 
 #endif	/* CONFIG_ACPI */
 
+struct dw_scl_cfg {
+	u16 ss_hcnt;
+	u16 ss_lcnt;
+	u16 fs_hcnt;
+	u16 fs_lcnt;
+	u16 fp_hcnt;
+	u16 fp_lcnt;
+	u16 hs_hcnt;
+	u16 hs_lcnt;
+};
+
+/*
+ * The HCNT/LCNT information calculated based on the input clock are not always
+ * accurate for some given platform. In some systems get it more higher SCL speed.
+ * On such systems we better get results from dts config.
+ */
+void i2c_dw_scl_timing_configure(struct dw_i2c_dev *dev)
+{
+	int ret;
+	struct dw_scl_cfg i2c_scl_timing;
+
+	ret = device_property_read_u16_array(dev->dev, "dw-i2c-scl-timing",
+					(u16 *)&i2c_scl_timing, sizeof(i2c_scl_timing)/sizeof(u16));
+	if (ret)
+		return;
+
+	dev->ss_hcnt = i2c_scl_timing.ss_hcnt;
+	dev->ss_lcnt = i2c_scl_timing.ss_lcnt;
+	dev->fs_hcnt = i2c_scl_timing.fs_hcnt;
+	dev->fs_lcnt = i2c_scl_timing.fs_lcnt;
+	dev->fp_hcnt = i2c_scl_timing.fp_hcnt;
+	dev->fp_lcnt = i2c_scl_timing.fp_lcnt;
+	dev->hs_hcnt = i2c_scl_timing.hs_hcnt;
+	dev->hs_lcnt = i2c_scl_timing.hs_lcnt;
+}
+EXPORT_SYMBOL_GPL(i2c_dw_scl_timing_configure);
+
 void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
 {
 	u32 acpi_speed = i2c_dw_acpi_round_bus_speed(dev->dev);
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 60a2e750cee9..536b30ea723b 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -372,6 +372,7 @@ static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0;
 
 int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
 void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev);
+void i2c_dw_scl_timing_configure(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_ACPI)
 int i2c_dw_acpi_configure(struct device *device);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 21113665ddea..b08177edf1fc 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -237,6 +237,9 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	t = &dev->timings;
 	i2c_parse_fw_timings(&pdev->dev, t, false);
 
+	// Try to get HCNT/LCNT from dts
+	i2c_dw_scl_timing_configure(dev);
+
 	i2c_dw_adjust_bus_speed(dev);
 
 	if (pdev->dev.of_node)
-- 
2.25.1

