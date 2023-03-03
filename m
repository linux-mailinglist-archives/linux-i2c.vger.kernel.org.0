Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7299B6A9C58
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 17:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbjCCQwI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 11:52:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbjCCQvq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 11:51:46 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A9D5CC12;
        Fri,  3 Mar 2023 08:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVte3TGl+oYtUShtYTQLW9e2WNL5VdD9p+ysYY5+7OzBEvKpKEqMuCasVrU4IFZYeYq7uEjrITefL77frYk/9GYLCArZYoJHDowhhLjOuQRIrLhpLR4LP/W5jyVCTu/WMAZQQ0qMEMEe/j+lENfOCiBPeAWYAzV0YJQT9z4gRxUHY0tcTMVInSbAp7jXGpD3ge/SoIGaCzwfj54XsSlJ2g//yiLiTzQ4CaBSxhb4va3cNkVfZ0a+CiwDJakQcr0vzpmGrAO2jhkfTHp4l59MRyRSRdQuHvEEuERN9mxcIeu5qygoErg6kN2kELRVyc3/Pk3ojfLYUiHGUTfnGZ9CPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUNuu61kamh09xYI65bh3ShkwGG7gupy1g2lj14EkyQ=;
 b=DVjDqE8kk/p1HhTBibfrl6DtVHU8IUnhzEnsIo/5J7qojxYfNsNgPjnFQXyntd/0dSiJ49fnM87A3R4HIPW9DUjO32lc05VkAie71NTWdKnShgxjP5Kyteqm1RJAR5oOaTfPJn+bNiBtZaTHqphpO7wGIAe+oGEx7ejqZ+Iosulh4o4ksYm7jiUh+R5s3EI0HvBnfOTxvr+Lv3+a7PmjSMHnFBthF2GgDI2CuJXWst3yx7OUymrkloWP1Vw0N084Rir9Ev5cIGNIZPeYUtuVyPQWVgAW9K91KQ2ShBW3b2YmxB3IcWGWFpa2L1pFFyu+XqrHOKSzt/KEhXV3QS0QDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUNuu61kamh09xYI65bh3ShkwGG7gupy1g2lj14EkyQ=;
 b=h1TXyKSKEJT446ZVDP+oO+iLgKM8cRkgC/ILrPEG5eeiex5z2UTtr6i8xuGKUvq9xEwMv2w4KXXg8b5tUnME6YwTEqYpzWPyoagjfv0IjB1BI1GFkKhtlYN0+u1C9FfCtff5ieeHMbkjoxnskFtaY2OC1kZeo6MkrSTk0weZGV8=
Received: from MW4P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::11)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 16:51:18 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::63) by MW4P220CA0006.outlook.office365.com
 (2603:10b6:303:115::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22 via Frontend
 Transport; Fri, 3 Mar 2023 16:51:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.10 via Frontend Transport; Fri, 3 Mar 2023 16:51:17 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 10:51:16 -0600
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
Subject: [PATCH v3 8/9] i2c: designware: Add doorbell support for Skyrim
Date:   Fri, 3 Mar 2023 10:50:46 -0600
Message-ID: <20230303165050.2918-9-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT010:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c1d3b4-0cc0-4bd0-66ee-08db1c078222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yMVIdK37s46jSnFCPvbqG6B/KrCwGtartJIwuVTc/wss3ckFXCIQAcTvdxRDayzJjzK+gPDpThtLnRyJ8BsUdPWbKIbCh1cqZW2nfkMRJYg9wiZuw5aSYZhdB5dHL3QtepXQnZ1+Qp/rbhxdfKXpz4hxb4sS3PwV1+sW6LIYRUDDYJmkMZ3IFPBaW4KGz5Qle75ZFmJavwI/nyIPrMkfHccRkUYMZ5Z4uDjBshN63ZejTxa6DRIvTqweqvcqLjmNrsqHco2z+h6NW05siUhEGOGMAiAtcSowAIczTnppcLFZszPkTt3U9+Bos9lhDnZxjiOb/sQf8MDDBxTggFwjmO/JUpwceTzV0dUbb9U8upq5inW63rJroEX5ka8itK2fVqEpeP85H4+DDq8tj/ZpSOcASPvgQQQ06UH/s7xNVQ43h8Iv/Yhwj5TBAeStKsedhTvWbF4p6a58XanIhrYWt92wdJhodO1pkASXfxQld91XKiKucV0MeWbhtGJHB+vQC1HbLUbcock9ZbiHtDdHB/0NDaDArs4gDBQcMuxYjftpM0a/ZGMi1gajOeppW/vSy8xTVdS8suYxt0EOdomdO/sEJOqYPcvzldtf3M281qAkFtspz6c78C/b4wZhDoLywn2wXftt7tpoKqAMjZ85fyjqgF1WkuMRn8LA1jaRtfii283qZcLazObn+nlNLSz0csoc8iR0HjzAErNFj8fQP3VqWNWgSomXX77KmfbS+Ag=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199018)(40470700004)(36840700001)(46966006)(36756003)(40460700003)(426003)(1076003)(966005)(2616005)(186003)(336012)(16526019)(26005)(316002)(41300700001)(110136005)(54906003)(70206006)(70586007)(8676002)(4326008)(44832011)(7696005)(82740400003)(8936002)(478600001)(81166007)(5660300002)(6666004)(356005)(40480700001)(86362001)(82310400005)(2906002)(36860700001)(83380400001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 16:51:17.5136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c1d3b4-0cc0-4bd0-66ee-08db1c078222
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
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

Link: https://lore.kernel.org/linux-i2c/20220916131854.687371-3-jsd@semihalf.com/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * Use CPU ID rather than ACPI ID, this will be pushed to a later patch
v1->v2:
 * New patch

doorbell; get status field
---
 drivers/i2c/busses/i2c-designware-amdpsp.c | 28 ++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 105584abcf8f..2c671973010d 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -73,34 +73,43 @@ static int psp_send_check_i2c_req(struct psp_i2c_req *req)
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
+	unsigned long start = jiffies;
+	int ret;
+
+	/* Use doorbell for Skyrim and mailbox for Cezanne */
+	if (boot_cpu_data.x86 == 25 && boot_cpu_data.x86_model == 80)
+		ret = psp_send_i2c_req_amdi0019(i2c_req_type);
+	else
+		ret = psp_ring_platform_doorbell(i2c_req_type);
+
 	if (ret) {
 		dev_err(psp_i2c_dev, "PSP communication error\n");
 		goto cleanup;
@@ -115,7 +124,6 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 		psp_i2c_mbox_fail = true;
 	}
 
-	kfree(req);
 	return ret;
 }
 
-- 
2.34.1

