Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB126D5099
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 20:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbjDCSdD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 14:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbjDCScu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 14:32:50 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3252712;
        Mon,  3 Apr 2023 11:32:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGE7lPRykYgazZFk8sOEFnAa0Ba838WKmMTkLeaRn/7qsxvhZAL4BeOl6DOgpXz0x/G4ipaRjlAPIsafg/4DC5ai1AlnaUNLxvp3HsePuzSx+JQX7g0gLvnhHBRgS2jZikaPcKh/+U/D4U9yhUt3o0VCc02EhTFgd3s9g+aCBcOsnP/bcsh/UxYG58/+84oykWMwRHQJUfzLUeLq9sv/aShAytS0Lrf9SUc3VuyGvgFbjo+Myjww2v2RGxGaz4s6YcJ/8qOe8g+EYdjXCv2Tuea3M4/v0wxJWqKbTLMfnWir2XquwGntFLXMSV3KarYv2TrDPwyrLVje3WXM9TusRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkxFWb995FakkLZLGJMKL8bJ2c/SSXP7hY31fmTC85o=;
 b=kwWRNDvlmscqz1457wZIQaMDOiVHB97rqpeDprFtx5u63+qy5UhtR0gz1VtMEIFRqE1Qq5n8Dpytp6I0r0Q54qxrYwEx29CQy7p8g0zwJnwOuzUyVbDX0q1Ph0r/GWuxgSu2qsESt7AhVnxv3+Awqp2Z0S4gUVvRHk+0WK5oSydXm8q2BTldiUvb6yTrneGUhmxA1+5dwnClU962/H/y+ZqZOOHX2Scsxk9EUcsUSgV4FpZtNMIxiaJD/L5fhQHFDVRhlM5cjpbVN1xsVeDe0cUl+KwSMq5MLM9G8Qnc2U3Cz/1k8VFldoY9BJE2ZMgQX/zcgmS7Td3RbztCqFd/dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkxFWb995FakkLZLGJMKL8bJ2c/SSXP7hY31fmTC85o=;
 b=f+qFETinAwYydm82bg+u+G13odUrpWVTDSCiZckvtbnYxlknBsUpEEI9FsK06EpQNWGiim6NSeLOIzmL87U09LlgBskGkm2qBDqrzfNHxgX6jN6FmawytEWUxVhzp9+gLihvxu/w/F69WqWkPgYdaKaOPCEAC1Lqc1wWwqD9sxY=
Received: from BL1PR13CA0189.namprd13.prod.outlook.com (2603:10b6:208:2be::14)
 by SJ1PR12MB6049.namprd12.prod.outlook.com (2603:10b6:a03:48c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 18:32:43 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::24) by BL1PR13CA0189.outlook.office365.com
 (2603:10b6:208:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.26 via Frontend
 Transport; Mon, 3 Apr 2023 18:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 3 Apr 2023 18:32:43 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 3 Apr
 2023 13:32:35 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        John Allen <john.allen@amd.com>
CC:     Held Felix <Felix.Held@amd.com>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Mark Hasemeyer <markhas@chromium.org>,
        "Grzegorz Bernacki" <gjb@semihalf.com>,
        =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        "David S. Miller" <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
Subject: [PATCH v8 4/6] crypto: ccp: Use lower 8 bytes to communicate with doorbell command register
Date:   Mon, 3 Apr 2023 13:32:13 -0500
Message-ID: <20230403183216.3493-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230403183216.3493-1-mario.limonciello@amd.com>
References: <20230403183216.3493-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|SJ1PR12MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: 97cfa801-aa18-41c5-90f5-08db3471d043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GYBWChJZBpHqtAbf1zQVOvOXOvpeCED52uhRjg+KJJsAa4wZu7QMDvn1an6JELN/M8gmWB9e8dQhYu3oViDlTPZXEuDlCI1Tt/v72F9K93NX4hvVYDhwF7tg7cMGL+mfodMQOIuI377cCQwQligegv5bOSdogd5nW6Tg9ARTS+/pjRBEPvpiPk0jx4jsTHs0UadB/7IslALaurKFuX4TpH+XdW8ropBdCne7C39aidauU83eHgalZSSbEq6YWS4bREjsgPSZJeGv0ObkyZzyM/bxdnQSFVZmsmR+lT6bpaKKGpOCsSGJoNiXthZunXk5hHwfg2Pw+dfUooEo6jdp1iXqrXDrRdvgz/gVTZXOvRVEg6gRMHFBv0ET1S2sTvgl+Rjs5YlydDzKTzlveEct4lpuWz9aNGBWb9du7dG2n7nK2yYoiIr/UJfCtv9O5/hwbY5MoZM4GB2GuLOIzOkHaGuDN/PIucFSIp19ljR8JlXgu2k5ywVRTdNw9FEhAeivvmGfABbnpUfyGsWAH2XPayINpbg3L9MjoOfLrkmm6+HnoxMdYg3Z5VtvpKVTv9oZtE1uTrxjQBk23UAdbwuWgUos91zOwvQP3O1SNhnmhnxp6cuBzmAB+MvAvULx+9UWUd7bYa1vFM5C9PFDcy8GNTDhzz3XvyvheCLUvsCwKLl2HrbSRb5MsjNBqjXDK8YqknAM5mddMSW2Q/MBFc8yUz7XZNmwfiT7dT3h8+/SRSk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(81166007)(356005)(86362001)(82740400003)(40460700003)(6636002)(316002)(54906003)(2906002)(110136005)(478600001)(6666004)(36756003)(40480700001)(41300700001)(5660300002)(7696005)(26005)(47076005)(1076003)(83380400001)(4326008)(44832011)(70206006)(70586007)(8936002)(36860700001)(8676002)(336012)(186003)(2616005)(426003)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 18:32:43.2626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cfa801-aa18-41c5-90f5-08db3471d043
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6049
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Unlike other command registers used by the PSP, only the lower 8 bytes are
used for communication for both command and status of the command.

Suggested-by: Mark Hasemeyer <markhas@chromium.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Mark Hasemeyer <markhas@chromium.org>
Tested-by: Mark Hasemeyer <markhas@chromium.org>
---
 drivers/crypto/ccp/platform-access.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/ccp/platform-access.c b/drivers/crypto/ccp/platform-access.c
index 48f59ae91692..939c924fc383 100644
--- a/drivers/crypto/ccp/platform-access.c
+++ b/drivers/crypto/ccp/platform-access.c
@@ -19,6 +19,7 @@
 #include "platform-access.h"
 
 #define PSP_CMD_TIMEOUT_US	(500 * USEC_PER_MSEC)
+#define DOORBELL_CMDRESP_STS	GENMASK(7, 0)
 
 /* Recovery field should be equal 0 to start sending commands */
 static int check_recovery(u32 __iomem *cmd)
@@ -154,7 +155,7 @@ int psp_ring_platform_doorbell(int msg, u32 *result)
 		goto unlock;
 	}
 
-	iowrite32(FIELD_PREP(PSP_DRBL_MSG, msg), cmd);
+	iowrite32(FIELD_PREP(DOORBELL_CMDRESP_STS, msg), cmd);
 	iowrite32(PSP_DRBL_RING, button);
 
 	if (wait_cmd(cmd)) {
@@ -162,7 +163,7 @@ int psp_ring_platform_doorbell(int msg, u32 *result)
 		goto unlock;
 	}
 
-	val = FIELD_GET(PSP_CMDRESP_STS, ioread32(cmd));
+	val = FIELD_GET(DOORBELL_CMDRESP_STS, ioread32(cmd));
 	if (val) {
 		if (result)
 			*result = val;
-- 
2.34.1

