Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E78FB4A74B7
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 16:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345494AbiBBPfv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 10:35:51 -0500
Received: from mail-co1nam11on2054.outbound.protection.outlook.com ([40.107.220.54]:23373
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345482AbiBBPfu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Feb 2022 10:35:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UReawUM4KcnS870tVpHqiIS7Z4I1n1RImVD87D1ksm/vUOtRUyeN0we9c+nQV56Abq4Q1vw9Sjq62fxWmZWEyU5xTjfw+59SCk7LWH/4A2zBhoLDxsgW1AUn1Xe+PZ2eCFVu1cdviiBSgCf7deNsKDPDWKV8CH695LbEVxkZOfUNc/rBMAphghq0uEhlIXfhdIruVKlPtNjCuYsuPM0I66QTi6psFkzlyVhe61AO7BTiuD9nNI46i/MlYWgWDIrabZl5QzjhOpTvnz0nZf3aaTCQX9RnU7EsN26lKpYpOx16gLq9raYHsMGJ+Gme/jTyNdr8CH1Zg6ws1C+DiBNwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5fQV3G+KAPhyTJUpb2BuUgBzXO8OTaQ5aaB0Jis1Mk=;
 b=dxFMw00ZYEyf3Xoe58qX77hWZLHxY/f4BDn6OUAnbNvZJVeJXbjsRCTp3zUO1jI4r9UO35mBr4R3RpERxz666NYiiDTXku5fAu4e0EYAySZmg/edUaYKRy977Arw3/KN1HEjMIaINaZoZ23Q7GSRHgotc4Ls9+XHqsArODRtq+mWtKHFwnHXCzq1fwnivEPU7zhKtR3WYPGU0U1Oz4uzPr/zhzB/dcsk9YwjvEfPBk1UbmxOkq/DjDlyiS3V4S16X4q/ChPonc8bWAPxjusrrISwFiVGCok2/zT2eUBfk4YtJrSXQD7x5utY2TU+9YacCLxpGt5z/wb2W4js/iMPbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5fQV3G+KAPhyTJUpb2BuUgBzXO8OTaQ5aaB0Jis1Mk=;
 b=r6cpXxftNQP9YKJyEHDzvyuOSUukm7znlQCZDevHqbpdoZMj0pHYfmxf+J4IxsrpYozi6eR7Mnz4ghWmmJGq/AyNmqWZZQ5Rd9HA3yyCAegzLRCzF6JaSG7jIC/foYoJ2ESHlxWayYJVtUcdojC3KN3ERrgTWkAwWTdl8uo98I8=
Received: from DM6PR13CA0002.namprd13.prod.outlook.com (2603:10b6:5:bc::15) by
 BN9PR12MB5035.namprd12.prod.outlook.com (2603:10b6:408:134::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Wed, 2 Feb 2022 15:35:48 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::b8) by DM6PR13CA0002.outlook.office365.com
 (2603:10b6:5:bc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.7 via Frontend
 Transport; Wed, 2 Feb 2022 15:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 15:35:43 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Feb
 2022 09:35:41 -0600
From:   Terry Bowman <terry.bowman@amd.com>
To:     <terry.bowman@amd.com>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <jdelvare@suse.com>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <sudheesh.mavila@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Basavaraj.Natikar@amd.com>, <Shyam-sundar.S-k@amd.com>,
        <Mario.Limonciello@amd.com>
Subject: [PATCH v5 1/4] Watchdog: sp5100_tco: Move timer initialization into function
Date:   Wed, 2 Feb 2022 09:35:22 -0600
Message-ID: <20220202153525.1693378-2-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202153525.1693378-1-terry.bowman@amd.com>
References: <20220202153525.1693378-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f5445f4-c7dc-4f89-32f4-08d9e661acb4
X-MS-TrafficTypeDiagnostic: BN9PR12MB5035:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5035B03DFD0419BA4E4F93B483279@BN9PR12MB5035.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K5xtjk/2vcUYoRFzbEdRvxlkGQBsxkyWjVFjQbXBRsjyEEiXqgFPUHMskah58lQsDjCl8CNgMZoNpMLvT0Qe6YANe+QZ40n+3E6rPHwNxpyXYc3DEC176v4iMMCYzmYCJKYLVB6FGoYn95EHhbVlWiDqrBrHVh3vnQayOWTscW7dhS5eavUcmSp9CQiqAjQxtrbl5xw5woCnC4YDPSOyRZBPo2N1nlA2KQNdfNvUdcSDkN2Ofu1EdQv3Jn04xJvOvz7TvpKZWJcXwf7qECEJXlgx7eTsGv/6iW8wD3+Xi7Ib0aGa/ROi9oeuaOC5ulNJTAhOUDnd4wnRkep4H2yZ9zSJ+9qazlLODKntgbxPx1sHggZAYzNqJr0k8GWBNJmjm7g2IF57Rq2tzc7qeiTot11N/RY9L++0/I0bbEHegCK3VJvL7GF8ekd3aUdoz7UseWDBxcva+jbUYJuKyRjYFGdV+r6Hjz0BS317aF2wVkF16URMkPy3c+qXUaHgehIX9D5t9dJW/zz1IbKp4JrBUYSnhfhPaiIUCVX9UeNd6RmHs7sJyNUAu09OLjbWpIemtuPQW8KXJcf2Kurbwyf1bMoJ5Svk1hngzSxa1bSdZmNtNfnJ5cWyUR6tRg5iudZTbiYwJh6y+5A1N5AeqUzw5906XtXkCiszJPgjSMj4TcoJTBK39Y7YOp90YQX3gNxQtx7FEMh6bb0wSNtOUWX/KB7ZQf8k8QM/XxFtR7QfzNE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2616005)(5660300002)(70586007)(4326008)(44832011)(8676002)(2906002)(70206006)(36860700001)(47076005)(7696005)(86362001)(82310400004)(8936002)(40460700003)(6666004)(336012)(508600001)(426003)(356005)(83380400001)(316002)(81166007)(110136005)(36756003)(1076003)(186003)(54906003)(26005)(16526019)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:35:43.2405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5445f4-c7dc-4f89-32f4-08d9e661acb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5035
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Refactor driver's timer initialization into new function. This is needed
inorder to support adding new device layouts while using common timer
initialization.

Co-developed-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
Tested-by: Jean Delvare <jdelvare@suse.de>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/watchdog/sp5100_tco.c | 65 +++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index dd9a744f82f8..b365bbc9ac36 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -223,6 +223,41 @@ static u32 sp5100_tco_read_pm_reg32(u8 index)
 	return val;
 }
 
+static int sp5100_tco_timer_init(struct sp5100_tco *tco)
+{
+	struct watchdog_device *wdd = &tco->wdd;
+	struct device *dev = wdd->parent;
+	u32 val;
+
+	val = readl(SP5100_WDT_CONTROL(tco->tcobase));
+	if (val & SP5100_WDT_DISABLED) {
+		dev_err(dev, "Watchdog hardware is disabled\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Save WatchDogFired status, because WatchDogFired flag is
+	 * cleared here.
+	 */
+	if (val & SP5100_WDT_FIRED)
+		wdd->bootstatus = WDIOF_CARDRESET;
+
+	/* Set watchdog action to reset the system */
+	val &= ~SP5100_WDT_ACTION_RESET;
+	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
+
+	/* Set a reasonable heartbeat before we stop the timer */
+	tco_timer_set_timeout(wdd, wdd->timeout);
+
+	/*
+	 * Stop the TCO before we change anything so we don't race with
+	 * a zeroed timer.
+	 */
+	tco_timer_stop(wdd);
+
+	return 0;
+}
+
 static int sp5100_tco_setupdevice(struct device *dev,
 				  struct watchdog_device *wdd)
 {
@@ -348,35 +383,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
 	/* Setup the watchdog timer */
 	tco_timer_enable(tco);
 
-	val = readl(SP5100_WDT_CONTROL(tco->tcobase));
-	if (val & SP5100_WDT_DISABLED) {
-		dev_err(dev, "Watchdog hardware is disabled\n");
-		ret = -ENODEV;
-		goto unreg_region;
-	}
-
-	/*
-	 * Save WatchDogFired status, because WatchDogFired flag is
-	 * cleared here.
-	 */
-	if (val & SP5100_WDT_FIRED)
-		wdd->bootstatus = WDIOF_CARDRESET;
-	/* Set watchdog action to reset the system */
-	val &= ~SP5100_WDT_ACTION_RESET;
-	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
-
-	/* Set a reasonable heartbeat before we stop the timer */
-	tco_timer_set_timeout(wdd, wdd->timeout);
-
-	/*
-	 * Stop the TCO before we change anything so we don't race with
-	 * a zeroed timer.
-	 */
-	tco_timer_stop(wdd);
-
-	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
-
-	return 0;
+	ret = sp5100_tco_timer_init(tco);
 
 unreg_region:
 	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
-- 
2.30.2

