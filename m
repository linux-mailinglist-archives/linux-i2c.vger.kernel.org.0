Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE47A70564D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 20:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjEPStQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 14:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjEPStP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 14:49:15 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021B11FFA;
        Tue, 16 May 2023 11:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfb/EWB7mkjn+PL1JsQPuDEU6LTtIjFhfeFkp8nQk/k6eU9aykUhroyZNvwnDPyWX5RMC5h4UG07BalJxC92fCzVxP8BHPacz88dVqj1plsnxYV82r7Cg/BrMMI+WzHBnuoJv958iRA2RlHgAqFEOAX8Fb07jtJQIIQWs1BGCgPlJjriZe3duPp0oDt4u+1hdHbh+DxjQr/vYeArNi4ecmaka8Uzhk/uVM63UIAsVj6QLLsbyGFOjmZ47SNhQaGJtGeejLs1Byftv6SKhbwuy1vl/NNxjJ1+O0udge3b5qUNgb+THo9G/X59E49Poi4nnBb+NNoqSdyAl4MNNAVohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmiaGQAG6egn6hYOcEIqbsGniJ/QmhSTgbbPs59BfoY=;
 b=RAxZPiklROgalfJOlkI2Sk2xtQLeXrdkDvcagBnjNWh3u7jVD/qx8PFXgOYaIEBKGwWBxr4KatBdSORItpUD3aNJhjOSoah+AQlMplOsw4B4DiJWzQOP5HS91m3Y8j9TFkX4ER1QZg3lG+TsJdpY25E50Ot9nUioYJCAf99ql48Tm7VOzgrvjFCtqCdFKjMNtjA77N9T+gqv3Xkw5pjUa9eRaUtGRkJ+aqFHXXIKDfApVo42vah2BPLEtM5NXhv392l4Wx8q8RMaUT4kbk6tzEUe+gh8HsfeYAu8QNIgpn2ttiyt1aVHJBjTgNZfxoGS1598Gc8rOodWOpPru2k0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmiaGQAG6egn6hYOcEIqbsGniJ/QmhSTgbbPs59BfoY=;
 b=xmslN94NLpl01HEvSuKFSpWMhGBmqw8KIQBRktz22cuQrLXJR6hlHWTfNS7VlgQaFUAP+VGb2TpzOWJy14+OXVqD3LD0WBk4bRe7+5aB4jcfAvCImCWeCgAmseW2KswZ5SN7+fFrNhk5BRC+V5aDRB2p9MJNcMRCba1q9mx6gDA=
Received: from BN0PR02CA0004.namprd02.prod.outlook.com (2603:10b6:408:e4::9)
 by SA3PR12MB8024.namprd12.prod.outlook.com (2603:10b6:806:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 18:49:12 +0000
Received: from BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::de) by BN0PR02CA0004.outlook.office365.com
 (2603:10b6:408:e4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 18:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT108.mail.protection.outlook.com (10.13.176.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.17 via Frontend Transport; Tue, 16 May 2023 18:49:12 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 13:49:08 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <rafael@kernel.org>,
        <ajayg@nvidia.com>, <andriy.shevchenko@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <Evan.Quan@amd.com>, <Lijo.Lazar@amd.com>,
        <Sanket.Goswami@amd.com>,
        "Mario Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH 1/2] power: supply: Use the scope of power supplies to tell if power is system supplied
Date:   Tue, 16 May 2023 13:25:40 -0500
Message-ID: <20230516182541.5836-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516182541.5836-1-mario.limonciello@amd.com>
References: <20230516182541.5836-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT108:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ab9754-4ebc-415d-2dba-08db563e3d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYQKxJzp68hGuowaY1n0lRTWxcKSJ50XPDHJvopuzLs0ueGkVLKwnBqZ50ccoiDtjEazkywqFz136eco6ZbSt/G7DnWxlIRqPvxKk2dsMh7hrSiYdvWpkpwjcRp4c0n67H1dOeJZDd8P6VCIoK2iGiFn0FMG6I/Jx6JC71w1XZW5xHRMsplj/AofJIgOAPmHfZOCrM8QJhTtuDW6swe8Mo3obJ+c9UEB11ML0hDeTM3gF9i12z1twI6asjRaBNXbcEJgSNi6D4hLFaTA/2i+N+z3VlR6ghWRNdcekEXf2Gjg9IPviFhz8YjcMm+BC0wO1RefsGxpsTHp+kW2fqKQA20p0EImbuk+QzhTJD5Ceg+vV+zObyrm89Mfb74c7Qk3rEp2v2Dc3S+6PO1BV53uh0j5gT1jo275KaV6t3Etz407VV4tS7iWVy0HQ7cz2b868PalgkGqHGu0NRDJ0epgQbWJhoe2ucDu816A9q3r1uLZtTrObPv5KjGQyNifkfIe3hTYW+sMWzES1hXMdEcB0XSBURpGKfEAYX2lJJxURmEpzs41T4PdSGPA07n1x974/zT/z965HPZ9/3eDmW3J3DOX1w9LXdKUeaC9A66qsFqJEnNLa+QRIF6cwj1ky+s50WmBcgWtxj3spxrKSa5UgmVpMgZmLJx1Kc8oQlZDWzna7Ba1By0WlvGbNAhgjoPqaC5SN5EXvM0Ul3J3O2M1wMFu2BZH93TgJ1RQipqbyNZqdSY2cNpAqnjXVY/gBxGht2pYITIh1b1f5fG0NxYhKm7lfZBg+BaDMXsWJa+pFW4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(7696005)(6666004)(36756003)(47076005)(4326008)(478600001)(110136005)(54906003)(316002)(70586007)(70206006)(356005)(81166007)(5660300002)(2616005)(41300700001)(426003)(83380400001)(36860700001)(336012)(44832011)(82740400003)(16526019)(1076003)(8936002)(186003)(26005)(8676002)(40460700003)(2906002)(86362001)(40480700001)(82310400005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 18:49:12.1926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ab9754-4ebc-415d-2dba-08db563e3d77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The logic used for power_supply_is_system_supplied() counts all power
supplies and:
* If no power supplies found assumes AC
* If non-battery power supplies found uses online to determine AC/DC.
  - If any are onlined, assumes AC
  - Othewise DC.

This logic makes sense for desktop systems that don't export an ACPI
battery, but it fails once you include a dGPU that provides a UCSI
power supply on a desktop system without any other power supplies.

The dGPU by default doesn't have anything plugged in so it's 'offline'.
This makes power_supply_is_system_supplied() return 0 with a count of
1 meaning all drivers that use this get a wrong judgement.

To fix this case adjust the logic to also examine the scope of the
power supply. If the power supply is deemed a device power supply,
then don't count it.

Cc: Evan Quan <Evan.Quan@amd.com>
Suggested-by: Lijo Lazar <Lijo.Lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/power/supply/power_supply_core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index ab986dbace16..d57f420ba8c3 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -348,6 +348,10 @@ static int __power_supply_is_system_supplied(struct device *dev, void *data)
 	struct power_supply *psy = dev_get_drvdata(dev);
 	unsigned int *count = data;
 
+	if (!psy->desc->get_property(psy, POWER_SUPPLY_PROP_SCOPE, &ret))
+		if (ret.intval == POWER_SUPPLY_SCOPE_DEVICE)
+			return 0;
+
 	(*count)++;
 	if (psy->desc->type != POWER_SUPPLY_TYPE_BATTERY)
 		if (!psy->desc->get_property(psy, POWER_SUPPLY_PROP_ONLINE,
@@ -366,8 +370,8 @@ int power_supply_is_system_supplied(void)
 				      __power_supply_is_system_supplied);
 
 	/*
-	 * If no power class device was found at all, most probably we are
-	 * running on a desktop system, so assume we are on mains power.
+	 * If no system scope power class device was found at all, most probably we
+	 * are running on a desktop system, so assume we are on mains power.
 	 */
 	if (count == 0)
 		return 1;
-- 
2.34.1

