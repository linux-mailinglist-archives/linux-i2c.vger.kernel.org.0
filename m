Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0648D6A89B4
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Mar 2023 20:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjCBToQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Mar 2023 14:44:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjCBToB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Mar 2023 14:44:01 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9BB584B8;
        Thu,  2 Mar 2023 11:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4HrOXTl0D8eihcw95PZIcwE23Rr1+i/B2JFbBXkvGcwAwmQo+zwm3xgx06JkYEzAe+eylF2TkBRzHykGBF1wfYL4a9AB1RSQ5M/2VFhXsJ4mLKNNh6/sbynNRzxrEdqIaMv6+B+Ffu1Uw8Fo5aAwtCDwxBtx/HhSRTinh9aPeOY5FJl5LxhQ7mmpbVQxVi4FaKxXQ0dgSg+yfpwOPz0k1Awa2sSIiKV3qI9oqzqdcWV3Hfzo2uT/K9SwkpG84dIOwuJb9LZbK0V1SBknWQd+o1pBBpnmPhTAHlZtRuWbNBOdgQUncNk8BdP5o4qoQTDe9PMTxzCT9O9NV7mXPOtog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mV6W8dCtl0WJCeAfW2OSslHKfOWhp8MIE/OqwaR2uB4=;
 b=AmXd0fZ2gRk0JlIzL2ASQ2jXux8h9zKtMhRGVkH8PFBKiJ0MClzfcS85T3xkm5R+9dY+p0Bq5/N333fdMUNoB1wefp/Aa+a2IT0eWiNpmueWrR7GRclZaDxfmv1Y1Ax7h+MOC+OXmC5sBgxPdTiytIMN8dm0fX/GMZ0+A1ceqZ0xrX4dmYC3cgrjIjpvBbDIcr+4NxWH0gR5S7grAeCafrVf/niSEbVM+yNopR1gUW77uDDmEvl5J7rZLb96DzfpOSTenAF6g8hb96WcSYIiwyP05DvEB6fp4/V3wY1liEpnz1GmtRvFCWmuk8Ga7lEN399wR5OWaEpOjCCh2YdUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mV6W8dCtl0WJCeAfW2OSslHKfOWhp8MIE/OqwaR2uB4=;
 b=WyaumRzD4lK6v9GkZGUJWCrheFL/w/iGIcb0rsRCOhvm6j56Idf8a2VBRcVG60FhUyxxkGs8PALS8nE1cFDa4QS9tLdNfo6hc+Emjn2W0kZoDWYTTaAdbOZ4WJl1XAA2ILxoZ6Q/flUU+gcoXCWoYI73YeDh23mKfJaxer7sQ1w=
Received: from BN9PR03CA0436.namprd03.prod.outlook.com (2603:10b6:408:113::21)
 by CH0PR12MB5106.namprd12.prod.outlook.com (2603:10b6:610:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 19:43:23 +0000
Received: from BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::96) by BN9PR03CA0436.outlook.office365.com
 (2603:10b6:408:113::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19 via Frontend
 Transport; Thu, 2 Mar 2023 19:43:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT069.mail.protection.outlook.com (10.13.176.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.20 via Frontend Transport; Thu, 2 Mar 2023 19:43:23 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Mar
 2023 13:43:22 -0600
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
Subject: [PATCH v2 8/9] i2c: designware: Add doorbell support for Skyrim
Date:   Thu, 2 Mar 2023 13:42:31 -0600
Message-ID: <20230302194235.1724-9-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302194235.1724-1-mario.limonciello@amd.com>
References: <20230302194235.1724-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT069:EE_|CH0PR12MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: f90d00c8-f778-413b-05dd-08db1b56628d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lpkD/MTIc10noIyEMUAWHXKdzv0EVtPgK+VAdkJuSCQpU8HuHXyicoBKl0mAwNWRLacqgHEck8gdzsa46w+CnsvHk+RBSEz8XDMOEJx6NM8PMaNMwhp+l30Fpwm7+tllcFV/Y2a0Vx00FFURF3Ymk7zYJqd5Urd4Kw97Hncn+b58CS35Kc8LGfvSvhik/QD9MePgESLzIR1BHUcQLOkwGYjqZTniu5VZ5X1wfdlP8JZXGfELlt6/RuvGBH918ZUi/tlh5JmEf1inlEHPkI/UjoNvyiGAqKdkg8Lqve4eZCS5N5eE3wvCytwQp1478Tmhtk6vnuCYO8KX99Z0noIH/u/Wx2DJmqqbX+p3DPCEWDB/4IibDJOczZnuKBR6BTeFICT3H8qA35TtdP6xefsxTiDbFhGDO6m/jUBDLyRvOQMXzOVVhMMZGgPhQwjdlyFUp3LnB+usfwecKC4shzsGRghOth0hOtN8obDRDaBkIWDGp3IjkBQ5i2zLBERCCGhvcltpu7Lt/6HPZiEGwUuK7CAsza4Jl0Io/W7XqBtLWsZRwRQBuI49wWljLJ5xkQ6DyGN6V88+WrN8Q0WmnaU0F+w9qTkITY/G8sHfOuclwPFp1NttzhBjl9+rirjnvjhX8Y6rGL1efcEDNS07AOPfgGF+vnbfKKSKdxxVKsJxJYWDrV5Bz94HPcuUSJdyYfOr8lsjwNqCpGOoDnSu1XNlTpGjv6UyL69UwCSrk8wY3nA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(36756003)(40480700001)(6666004)(7696005)(86362001)(8936002)(5660300002)(4326008)(8676002)(41300700001)(356005)(2906002)(36860700001)(82740400003)(81166007)(966005)(478600001)(316002)(54906003)(70586007)(70206006)(82310400005)(44832011)(110136005)(426003)(83380400001)(47076005)(336012)(2616005)(40460700003)(16526019)(186003)(26005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 19:43:23.7135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f90d00c8-f778-413b-05dd-08db1b56628d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5106
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Skyrim doesn't use the platform feature mailbox for communication
for I2C arbitration, it relies upon ringing a doorbell.

Add a new ACPI ID to use for Skyrim and when that ID is detected
use the doorbell instead.

Link: https://lore.kernel.org/linux-i2c/20220916131854.687371-3-jsd@semihalf.com/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * New patch
Note: This ACPI ID hasn't currently been reserved, but as Skyrim runs coreboot
it should be easy enough to modify the BIOS and test it out.
If this approach works and has general agreement it can be reserved.
---
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 29 ++++++++++++++-------
 drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 105584abcf8f..e1a4d3002c80 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -73,34 +73,44 @@ static int psp_send_check_i2c_req(struct psp_i2c_req *req)
 	return check_i2c_req_sts(req);
 }
 
-static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
+static int psp_send_i2c_req_amdi0019(enum psp_i2c_req_type i2c_req_type)
 {
 	struct psp_i2c_req *req;
-	unsigned long start;
 	int status, ret;
 
 	/* Allocate command-response buffer */
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
-
 	req->hdr.payload_size = sizeof(*req);
 	req->type = i2c_req_type;
-
-	start = jiffies;
 	ret = read_poll_timeout(psp_send_check_i2c_req, status,
 				(status != -EBUSY),
 				PSP_I2C_REQ_RETRY_DELAY_US,
 				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
 				0, req);
-	if (ret) {
+	kfree(req);
+
+	if (ret)
 		dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
 			(i2c_req_type == PSP_I2C_REQ_ACQUIRE) ?
 			"release" : "acquire");
-		goto cleanup;
-	}
 
-	ret = status;
+	return ret ? ret : status;
+}
+
+static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
+{
+	const char *hid = acpi_device_hid(ACPI_COMPANION(psp_i2c_dev));
+	unsigned long start = jiffies;
+	int ret;
+
+	/* Use doorbell for Skyrim and mailbox for Cezanne */
+	if (!strcmp(hid, "AMDI0020"))
+		ret = psp_ring_platform_doorbell(i2c_req_type);
+	else
+		ret = psp_send_i2c_req_amdi0019(i2c_req_type);
+
 	if (ret) {
 		dev_err(psp_i2c_dev, "PSP communication error\n");
 		goto cleanup;
@@ -115,7 +125,6 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 		psp_i2c_mbox_fail = true;
 	}
 
-	kfree(req);
 	return ret;
 }
 
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

