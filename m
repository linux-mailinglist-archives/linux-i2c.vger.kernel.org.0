Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F297C492F43
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 21:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349150AbiARUW6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 15:22:58 -0500
Received: from mail-bn8nam12on2052.outbound.protection.outlook.com ([40.107.237.52]:46866
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233125AbiARUW6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 15:22:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kx0tTQaFmmFSNiTjYZLiO1YCoZf3KwnhIi2gDGnsTtYM8WgrkBSt8+u6d2zhHfpzzo+sgPCQOTL65V9zrVf+VwZaLIywgUOIMzrLZYRxbOzmaSHuZYmoJnUYCTKxdzW6r4het38cGn9eSIM+ICjeqZxZeV3pDfHTfOcKR5YzHBvYAdr9sf/YgWoXs6+JF2zUUWxvtjVDsgfW5VuVyMGt1ouUZwFLwngDCkuFV4741ru8JUrbrIkK0onJ++TX8E/7svWKjwKP7tCt970tqrl84tLbxTJafA7l5eX/ER4OJ3FiObbWxYzm9TtuXwSbypMHY4rCYikLKm5BglsCPmYM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u+9Y9m8fSv6D25aUl7S7KP60Wbqdphuh1JnIPNaDFA=;
 b=GHhqmzrxfbuCOjCdd2Xk4NRvRM4AoekIIHPdL2vpIXm8XqcoBycNFpF+WtAkgnJgTS4ptrVJhBnlfwN3r43OB8zugXkQXxQkDchquPT+PCk32RdYYGAOGn41jqykjOzd8bCaa3grW10DVtmoBRBt6jXK3tMnSJH793gs4BnA36PZxurvaoMufbVlyMrtAgMqUatt72ON7B1AIFvN4COLh98+2WF6HvNxwt9bvD7UZ8HFjvJ9oIGRc6LcPg5UFzFOnhb28fHTphZQZAPD8L8yOTUiShZRsJnol4E+Adw1FfjJWHhCELzMmxGYwQhKaLC5Oc2+7t/l7dKx9alTH+JX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u+9Y9m8fSv6D25aUl7S7KP60Wbqdphuh1JnIPNaDFA=;
 b=UIxn6miGFwXKmsvxqqlqK8FYWxu+4+fZk2/MDhU5VyuB27q1gzwS4hj2QpajNieV6r6UNBowKGCrZAqhFmdGnozQNLR6nb4K+GiLzQew0dvR1RpbQjXGd5iF9Id0kMeLAtT8aZpCQJlt9iJrk6BXT5kOD1RRzoVJLZgEsvagaKU=
Received: from MWHPR02CA0019.namprd02.prod.outlook.com (2603:10b6:300:4b::29)
 by BN6PR12MB1345.namprd12.prod.outlook.com (2603:10b6:404:18::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 20:22:55 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:4b:cafe::33) by MWHPR02CA0019.outlook.office365.com
 (2603:10b6:300:4b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Tue, 18 Jan 2022 20:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 20:22:52 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 14:22:50 -0600
From:   Terry Bowman <terry.bowman@amd.com>
To:     <terry.bowman@amd.com>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <jdelvare@suse.com>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <Nehal-bakulchandra.Shah@amd.com>, <Basavaraj.Natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <Mario.Limonciello@amd.com>
Subject: [PATCH v3 1/4] Watchdog: sp5100_tco: Move timer initialization into function
Date:   Tue, 18 Jan 2022 14:22:31 -0600
Message-ID: <20220118202234.410555-2-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118202234.410555-1-terry.bowman@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b9f66f6-6b75-44f4-15da-08d9dac04df9
X-MS-TrafficTypeDiagnostic: BN6PR12MB1345:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1345503DB0AB0625BD5B346783589@BN6PR12MB1345.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YD+PUaVbkLb8gD8j0nctc5ch1EQtr1P8G/uoWCtPqFQ5SseiVG2E5ve6wqdnIs+/36svpd1LzWteJde6WDb1l6loOPLAk1GBi8ugLWX1dXgzs13/4azDMqJGFn/anqgIFfZkQhF/RHw+/b8CUGfq5HZWTA5vcOvnh5OLw7mJ571o/6p8VtE8JQnnDd9McLKSj8WVb19sPdrQXihR494v9FM0Cd43puLe6l3MGl09QV5uWSp13c5kRRY3tdU6ogNLAA3nDQutp67KdcdRGqH8OYPNm6QFXW6cJNrMvABv05NgtIuzadCkIRlKjBcDD939uMMof/PhVtBcOU2N9BPsR/5sajXtQJBZVh8hzpS06oYLQG/H6/ke0xTYT8rPZxqssK6VLEOYcT727/RzZodmkPrBfjOQvkpu3aZY0XMYKrXc9ttxmis5ZmNvwln41JG63dWkhcXrluscCkx3MF356jiHAwPq4dLMikGWyHL+gKWPj7jsYbie+B5BQ2VOXn5Z1V7RRz7LYX+rnzGln1mVieyOibC0+rBi/fOAeWqo/XL3EAZEFp4fif80lg0AXMiP7CyiS0Km9fnECGvy2F6Q6obW1h+Np5FymAO5LvGTaCJ+x/mVFu9yyfAcST8RfN8x7RmU1vt912b4D05DtUG2QQHkay3EywF5EbBRSyMWoT7VvTdvfRq4W/Kz+I+AodVCqxirRb/OpbZ7Xu/QyHo4bAqlxdcqtry+bNz9SuL4VWgko+Z3tVyMOYbc/8ACj9mppXwe/XQTQWK9STcPd57IsAyNDqeqXRNzQfUCn9wwZdUsT9KXR66BfG/mvERfbb7u
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(83380400001)(70206006)(4326008)(2906002)(86362001)(7696005)(356005)(36756003)(81166007)(70586007)(5660300002)(16526019)(186003)(47076005)(2616005)(26005)(44832011)(1076003)(8936002)(336012)(6666004)(426003)(54906003)(316002)(110136005)(40460700001)(8676002)(36860700001)(82310400004)(508600001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 20:22:52.4819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9f66f6-6b75-44f4-15da-08d9dac04df9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1345
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Refactor driver's timer initialization into new function. This is needed
inorder to support adding new device layouts while using common timer
initialization.

Co-developed-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
To: Guenter Roeck <linux@roeck-us.net>
To: linux-watchdog@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>
To: linux-i2c@vger.kernel.org
To: Wolfram Sang <wsa@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Robert Richter <rrichter@amd.com>
Cc: Thomas Lendacky <thomas.lendacky@amd.com>
---
 drivers/watchdog/sp5100_tco.c | 65 +++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index dd9a744f82f8..ecc273b9b17f 100644
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
+		return(-ENODEV);
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

