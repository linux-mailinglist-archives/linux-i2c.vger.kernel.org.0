Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 145E6691382
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 23:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbjBIWiv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 17:38:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbjBIWip (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 17:38:45 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FF15B76B;
        Thu,  9 Feb 2023 14:38:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAKkmOtpDE2EOxey+DbbvaH2A6CCjwqTHyUgjTUywXIAlH0DpgLTs7qgmbFSfcUSzjHJAY8nrf4PXK5KljNlZH0YXf/uBgn605XIPiVw7WwAFcNzxX1eJgiK6b17/ViDmVstoO2T5ffMhrONCJA/FqmtHKXdYOL7o1zj7flkwGdL8Wz3Nx5p+XaKfGCrb9oTn4lAlhAuwHIpZuYhA0m9PlZOxcFSAbkcesXhoVfkRtZw2DsECvTukOUa0DvPrPQ97Opf6i0oV2eKH1O/kmiOhUrC5POJ7dXc8VqyITJds2jkIkjp3bXEetoHpGu8TMT6qsRqOp3tDlrOpy8lbJv+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bkk/wuNciARPuAyND/3r43PXx14RrPhnuUbw93fbuGo=;
 b=bC0YrzAYMk8koCa81LvgeJEXfBjDqiXTxX+fHwc/ZeMX6Q+S1wWzMB75YLAqofitIlPfmmXdrwYn501y6ufGQiD/7Nf0/RZeJM9srZfjKQ6fB8iWly2yNuM8SZjtXJAhg2oWR4eHMUCbaykSZEfilKh8eFea+TiT+bB3I1gmb0KSU9sFbYOmWVv0X3ubbVuezvjYdzuElY1fdf49V6NeIrb/yor0Go8OrwDJ2ei1miJUHLetAXwvRUGJoC5v/WoM9fU6iQDth+pMmUhIBbBsiksO/4wux6Vc80WMUc2nQOqv1DVoo2YGLUHzrKzM6pcId1969czZNyphX+kz4c4BJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bkk/wuNciARPuAyND/3r43PXx14RrPhnuUbw93fbuGo=;
 b=tpn4WC+zvE2eP9aAUDMgKPJ8GrERE18YWix9CLxtVszv/BhstyQHuXUK+TdsxYj9CXiE2rA6mxAPpNyBnU+AhxTBhDA0Tempzf4fGitFh/mRQKH3vHLL4HT6/LcTDXrEV47jhUqyBH60LZ5Nz1l6Lfx+fJLaXeBGbz/Fa2oH+B0=
Received: from DM5PR07CA0118.namprd07.prod.outlook.com (2603:10b6:4:ae::47) by
 MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 22:38:37 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::16) by DM5PR07CA0118.outlook.office365.com
 (2603:10b6:4:ae::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Thu, 9 Feb 2023 22:38:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 22:38:37 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Feb
 2023 16:38:36 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        "Lendacky Thomas" <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        John Allen <john.allen@amd.com>
CC:     <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Mario Limonciello" <mario.limonciello@amd.com>,
        "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 5/6] crypto: ccp: Enable platform access interface on client PSP parts
Date:   Thu, 9 Feb 2023 16:38:07 -0600
Message-ID: <20230209223811.4993-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209223811.4993-1-mario.limonciello@amd.com>
References: <20230209223811.4993-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT018:EE_|MN2PR12MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: b541aed0-9ea0-4398-7366-08db0aee62ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A+w0yjXBHJD4yTthUrY2tOoEfd+QHp3KSMmYWiyiaPDI14uthikc6KB6bLu1v2ryqlt1mGOLXTIdIL0IC6Wchh19BB03X6AFVM1Q8K1ptYSZ1Sed4+euwMo8OJjiNx8mkyRo96uKokf2Nxwx1vG7jVaJPOyfurM0TC5H8ayCibKyPeqWc5DqeK5yuOoV7w7297R2Nqn1JjcVE4yee2eSkIaT4vvmV9/mlotNsoBccsDf3XnxGWlweNujEJKSVTr8T3NdIktammsNnE1Kw3s84iAF5HqdMmDrECKswhpYSx8VSZCZcTk12+0rh/WhGPna4h0925Cjb5ftsMGvzL8cR8P4HeT1zKtbVhqT2eI3BNUfLTXI0dmHig5Dx3FVpBk5YEI5+LUI/OUTfoU/ztEZFxfoxwnQYqsLPhoQnFSMHYqQjaUoGyRki34zlWGGi+AAylXElhp9Fwo8+jaiY+jSszk593KnXrMsK/gguKBahFB+Me+WzyZS3cA8EPHNVSpbhI4lPon0gFMS0qJDo7uXDjCI3cehzENbcQLoEoOleeg/KI/CNyWeXybMV31zicbH9YQcTl7L7OiVXvJmujpncVXPtHdTJ9HAUnWv4RJ619J0GjzbuJa/AvrDksczzY7CkTHtvSkn51BkcixyKEC1/53daq6jtQ+g/9NWKVFoTQGniEWm+lE5CGuJYzBJ0Vf6e/BB9UAS2KbeKLrSHvaZP0CaFagsYt/8KwSx1/2yAh4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199018)(40470700004)(36840700001)(46966006)(36756003)(82310400005)(40480700001)(83380400001)(356005)(40460700003)(81166007)(36860700001)(82740400003)(186003)(1076003)(6666004)(26005)(16526019)(54906003)(478600001)(2906002)(7696005)(316002)(6636002)(41300700001)(8936002)(5660300002)(86362001)(2616005)(426003)(47076005)(336012)(70586007)(4326008)(44832011)(110136005)(8676002)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 22:38:37.6173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b541aed0-9ea0-4398-7366-08db0aee62ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Client PSP parts support the platform access interface. Add
the register offsets so that client parts will initialize this
interface.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/crypto/ccp/sp-pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/crypto/ccp/sp-pci.c b/drivers/crypto/ccp/sp-pci.c
index cde33b2ac71b2..18aa902eb5ce9 100644
--- a/drivers/crypto/ccp/sp-pci.c
+++ b/drivers/crypto/ccp/sp-pci.c
@@ -361,6 +361,12 @@ static const struct tee_vdata teev1 = {
 	.ring_rptr_reg          = 0x10554,	/* C2PMSG_21 */
 };
 
+static const struct platform_access_vdata pa_v1 = {
+	.cmdresp_reg		= 0x10570,	/* C2PMSG_28 */
+	.cmdbuff_addr_lo_reg	= 0x10574,	/* C2PMSG_29 */
+	.cmdbuff_addr_hi_reg	= 0x10578,	/* C2PMSG_30 */
+};
+
 static const struct psp_vdata pspv1 = {
 	.sev			= &sevv1,
 	.feature_reg		= 0x105fc,	/* C2PMSG_63 */
@@ -377,6 +383,7 @@ static const struct psp_vdata pspv2 = {
 
 static const struct psp_vdata pspv3 = {
 	.tee			= &teev1,
+	.platform_access	= &pa_v1,
 	.feature_reg		= 0x109fc,	/* C2PMSG_63 */
 	.inten_reg		= 0x10690,	/* P2CMSG_INTEN */
 	.intsts_reg		= 0x10694,	/* P2CMSG_INTSTS */
-- 
2.34.1

