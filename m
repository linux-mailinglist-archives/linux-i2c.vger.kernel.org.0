Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6AB06A9C56
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 17:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbjCCQwM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 11:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbjCCQvq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 11:51:46 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E915CC13;
        Fri,  3 Mar 2023 08:51:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyRTTliWoihAy5gHRd00AIrywpoxqNRn5TiN+D0mZ1ULj/G8VZab+FI4RMC0uxwlPyHFZ56L7JZNaNEQLmF9vDFziDcbsQaQXM5edSeiCfcctLltMS+1l6ll3dAa4ayvbVvOlx1myvE/ntKW/BxX0GlF2viac+3jw2mwNC2c3zZnqYRqNTK3WZtG4LL6JPCGIi/H3mkQVWzbY6prFzKO9aPHOPRdFdgJIY/ovJ4fdhaZHrZ6hOvsksK1XtsQS3ty4d462pRFX3RA8v++a06rNkHQ4UuZx+cncKEvxQalCMZ64cYzFc0fxcrV0l75B9DdBnV6MdlD/tajSSqEzR+y5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGmH3q3qikbpfz+yIFYAZTiLQbWFJhdu5Wg4VxtKc08=;
 b=VGLZubcr1CZ72RHWsgr7QfjSkTULNu14ytHtwlDlj/6xfCOIoszKXwbjBKPu6yF0LXMLqLowMOZKhCRShtK1YgRnKHhG9HrjB3ulpwMK2CXPmEeZojmGbVqm8/v+dIfTLC2AE8AN0mvX6A+tbyPIzM0ysdc1gIPK8l0aqif+76Yp1DAoQLSsScJmc8BkHGIwux8aEwkWjdXdgw3WLCp+ylr+Vm0KEC3wyh2ShBOGLjzluv5Vx6MpqS9bwRCd3JD/GDglf/YfHfShkpz63bM3FmNHICSaEsQgQ5flnVdZDhS/BD40UigNjxR+zZbwLVaa9CHNfoYMFk03o+ljz/W/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGmH3q3qikbpfz+yIFYAZTiLQbWFJhdu5Wg4VxtKc08=;
 b=TDOedLSW8o1Nhql5976VFRwWdUVNpDIG1Eh8/L1ZaiuvEXmLCv4/V3VUgwtNCFisyskT2FyJVL2gSXOcHhAcO61juheLKCZvTCk2LT0WNyB20NhhI2BqnfOZ/bS6R/vHtbcA33x03UKN29IHXsloWMrv7Daa8O+SGHfRDXqm4jM=
Received: from MW3PR05CA0026.namprd05.prod.outlook.com (2603:10b6:303:2b::31)
 by MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 16:51:19 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::d2) by MW3PR05CA0026.outlook.office365.com
 (2603:10b6:303:2b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.8 via Frontend
 Transport; Fri, 3 Mar 2023 16:51:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.12 via Frontend Transport; Fri, 3 Mar 2023 16:51:19 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 10:51:17 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        <Rijo-john.Thomas@amd.com>, <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Mario Limonciello <mario.limonciello@amd.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 9/9] i2c: designware: Add support for AMDI0020 ACPI ID
Date:   Fri, 3 Mar 2023 10:50:47 -0600
Message-ID: <20230303165050.2918-10-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303165050.2918-1-mario.limonciello@amd.com>
References: <20230303165050.2918-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT061:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: d9dc94e3-e239-4442-4471-08db1c078319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y+LXzne1Qo2ffTELtdjocgw/WLUKsFakkNA9ooejv3jWkG0ZcMRYrhtnVR3bqYaPdxJJ0ns/zbwt9w7dnwPyzNHxxhhwpviuZ/TTk+ZSppIwPoRMboatJs0ynBQp3h5cQ0T9PEDLNdrotWt1Sd+1ODXtchj64pVXidDNt2XPtHfyznfxJRa/BBXWwoCuaiZgFLZf/OtkIuaFmBFCtx89DMH2s2ZZIDyAMgdPw3Dab9gsidYbZc1Rm3z614S12opeFvTFbXJBDAVLIh6UxgQNNggwM/LyOtfjISIRLi1yrGOkl1cGA9wjsNRfWv7zTE24PatTCj1u6ujqt8sthAE7EuvOx44nFDWKLrT9ATZnaYtlvGltb9QD3sEJK2z6VVyjB/7JpjqqGnzsHElS22GcfDSFOE5OIFQe69wYlMolS6j/aoi4eUYlw9qqJ3tuOs5LxDs3AsXcxewDF/Wjy0MmLHqyy0CaEejYAIOsuIhesUZ8o4pNwBYJoP6fDhjxV9Jk44qfk5lcg5EjFpqLUZYAZi4WUGfLGEVMhTIBRSf5WE1IBJtfiV7hMiy+m3a+Sa0Fcgpmsg0NkStOBP577apnJH1qxD06MAKTUbCmmzb3E8UfrrVdrOgbkVRoiNmuFUKJt8axIsp5mXw2JKG3kfM+xIEldWgZ+Bj7bZKRChII9rfKip9+VLJRgLnki5cUSOVWeZ9Hn3HzwvEcHuge5inaLeDo157eKTZaaXJfNARVpSI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199018)(36840700001)(46966006)(40470700004)(36756003)(40460700003)(6666004)(1076003)(2616005)(16526019)(26005)(186003)(336012)(70586007)(316002)(110136005)(54906003)(41300700001)(8676002)(70206006)(4326008)(44832011)(7696005)(8936002)(478600001)(5660300002)(81166007)(2906002)(82740400003)(86362001)(40480700001)(82310400005)(356005)(426003)(36860700001)(83380400001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 16:51:19.1314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9dc94e3-e239-4442-4471-08db1c078319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Cezanne and Skyrim have the same PSP hardware but use a different
protocol to negotiate I2C arbitration. To disambiguate this going
forward introduce a new ACPI ID to represent the protocol that utilizes
a doorbell.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * Split from earlier patch to standalone
---
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 5 +++--
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 2c671973010d..44b8432458b0 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -101,11 +101,12 @@ static int psp_send_i2c_req_amdi0019(enum psp_i2c_req_type i2c_req_type)
 
 static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 {
+	const char *hid = acpi_device_hid(ACPI_COMPANION(psp_i2c_dev));
 	unsigned long start = jiffies;
 	int ret;
 
-	/* Use doorbell for Skyrim and mailbox for Cezanne */
-	if (boot_cpu_data.x86 == 25 && boot_cpu_data.x86_model == 80)
+	/* Use doorbell for AMDI0020 and mailbox for AMDI0019 */
+	if (!strcmp(hid, "AMDI0019"))
 		ret = psp_send_i2c_req_amdi0019(i2c_req_type);
 	else
 		ret = psp_ring_platform_doorbell(i2c_req_type);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 89ad88c54754..5ca71bda9ac2 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -51,6 +51,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "AMD0010", ACCESS_INTR_MASK },
 	{ "AMDI0010", ACCESS_INTR_MASK },
 	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
+	{ "AMDI0020", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
 	{ "AMDI0510", 0 },
 	{ "APMC0D0F", 0 },
 	{ "HISI02A1", 0 },
-- 
2.34.1

