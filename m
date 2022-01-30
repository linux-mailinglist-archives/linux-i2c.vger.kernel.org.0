Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7984A386E
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 20:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355675AbiA3TMy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 14:12:54 -0500
Received: from mail-dm6nam10on2049.outbound.protection.outlook.com ([40.107.93.49]:30540
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355834AbiA3TMp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 14:12:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV+baaTNmrLvBAPvIgaMDYU7rCDl931bbmQrxlFOyuZWQb2KwDjSE0NygOfObRp/sMk+qAJQz7nKnTDRm61yqdUhEov43QzSM4wI++mzP2hpu2/eOHmVTCsOKUwLuQsutYWsOljcfBCrcdw0BymVKsslwVu2I5l8qsaMJ0fSBOLb27Vr/Z8q6+vHi2ppgxyAtLEdW5IJJadrcdeDLDzWdZGLFF3VJ8IDNowexLLQjgauntvr1QOASOcT/M2YEAbfs24FjnKpWyVM2jmZu2rRAJt/QJqhYz/N0gD+1Y5PcHev9Lew+74/YE5rxyTk5pOZECMFg6KfpgJtxe4KbYsJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5fQV3G+KAPhyTJUpb2BuUgBzXO8OTaQ5aaB0Jis1Mk=;
 b=imT4YZ3nM8yyne1t+ayzHw1DA8V669J0Yl265OncDMgSow8p2BsNYNAWRgpHrljliHcMc/oSZx/lORtHFAgiQYiw/zAkkVO2udNRuZds06dwCXyR0csSx/P3RE/Z5DPLjKut1pzSS273O41Cy5w3PROt3tgU41rXDac6Tu+ZzDTUaKJpjlfbq2PIwOQAHz1Ni+B+9MFvaWjvrEdcImUiKzWrLkxOKMZUXfIGwtoYgDkvP6NyVR9lPdNOjlxZpAQkbOQhaNgJJT4OV9DST4p86AIgLikEiLAglOYfTXEBxJ2GD3ofUjOGKOvSaVYL9NtqopAXPXzAjHFv6TO4YXvW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5fQV3G+KAPhyTJUpb2BuUgBzXO8OTaQ5aaB0Jis1Mk=;
 b=BihDOv0yTvwwPkrFyANgjDXZ5BDXg4e/BWE6+HDXfujQwqh/nLydB2Q0xfrkBzsoyjEBBHIJKi0jUHqdvDi85yYiJJFj0JNdUp/Gud+CU35CcHiRivUXc5BfRd4IWV4vparMYmuUgjtX0bFG0EAY3amOz1e1RNtWAFNm+SEAxn4=
Received: from DM6PR21CA0007.namprd21.prod.outlook.com (2603:10b6:5:174::17)
 by BY5PR12MB4323.namprd12.prod.outlook.com (2603:10b6:a03:211::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Sun, 30 Jan
 2022 19:12:43 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::3c) by DM6PR21CA0007.outlook.office365.com
 (2603:10b6:5:174::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.3 via Frontend
 Transport; Sun, 30 Jan 2022 19:12:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 19:12:42 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 13:12:41 -0600
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
Subject: [PATCH v4 1/4] Watchdog: sp5100_tco: Move timer initialization into function
Date:   Sun, 30 Jan 2022 13:12:22 -0600
Message-ID: <20220130191225.303115-2-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220130191225.303115-1-terry.bowman@amd.com>
References: <20220130191225.303115-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63dc721d-9ab9-4a84-53fd-08d9e4247dc8
X-MS-TrafficTypeDiagnostic: BY5PR12MB4323:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4323E7D3F6580BD4C405082683249@BY5PR12MB4323.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: da0mx0yuYC8b8s0IHhU6yaKuSxE3nqQjVj9SGFxRkwkZXInlgAaB2ktBbVPEXNpUTJo3Ji2Fot6MrK9Nz5/nHaVpTx7UTxYrCsf5F8uklGqkoNSfkB16PgGIROxtQonnR0tMSo/ZzfuxRtLQpSt4qh8JIgHcp+peTi9//KeokB+cDIDHKtNrlGNE+1c50SkOVaGFzOZJuZi4eb4AQ+XIP95J43disWC13IheE+AjDLp5kX1nrSfRlJFl8YwH0A5ZBPXZOXhaT+R4CNM3s3SSyJFzA+lTndSa2dXSE86zov9YmnBp6z62JVzV8LJrWLNoMG37u2MMVvNgNGdmt2PROF+LkTACVT+VDY+SsXXF+i4r+EN+vFFWtppxSTAnxx0RU7bkiVlxMYGv+0G79uIbr2d3wW14V8BuC61pQSFw1f1lt/1peFF7HCWtwqPVJCxBcStJIsmbmLUqze3QlL9Iy2h6axfsSCrXD3LpnAtKq90f7dPLhr5k+bkV/cUnb3zFqThK/Dw6JILyMrqKVK2tsg46PPMwRb6mOYDNO5BNxNcfbi8CqhVWOamHjBOxFC5Fk9/tiydho+Sijeh1fiTU9Gn/IZO4W4PS77x4PzSM8KkYMevQ4ke1vD7JUyklJimIqnSHMucE63OhSyMqIybczryddu1LVGLWF9GQLrYvhs2COIR23UX61gwSizvI06d9ODfR34miR40eWf51EguoZjyBMuaZrj3ORx1FVKUhpaQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2616005)(40460700003)(1076003)(336012)(426003)(186003)(16526019)(86362001)(26005)(82310400004)(47076005)(83380400001)(5660300002)(44832011)(70586007)(70206006)(36756003)(36860700001)(356005)(81166007)(8936002)(8676002)(508600001)(2906002)(6666004)(7696005)(54906003)(110136005)(316002)(4326008)(2101003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 19:12:42.8778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dc721d-9ab9-4a84-53fd-08d9e4247dc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4323
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

