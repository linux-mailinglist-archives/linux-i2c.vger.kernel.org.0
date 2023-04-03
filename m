Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEE16D50B0
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 20:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233191AbjDCSfH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 14:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbjDCSfG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 14:35:06 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::61e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4886E448A;
        Mon,  3 Apr 2023 11:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InUY9G2ReyTqRks6KRfvXB2yinED/yNCV/phk+rGcBhLrGDIWri40HnD7KkhFVhVe3ihpNfJpUD+PZEeFvPV3zAgahHKgO+fMx88AvraDWokAArBGNDJ/Q2Go7QWtSIiOIUbVDSFuNK95zD9g/GJhnq91U6TVfga2Kto+6JRjmom8f8dknqtXwRH7yxn5eas6hWo2sT9DeS08JXw2DFOtczLklGz8tMjHMSvWhDtYOHdYP9ngHIa6SgFMRKm5l3SkxFFeJ61EWNgMen9N5CwzOgem8IIWscPMW9iT4DyFTG4vIH+fa4JeXmws39zRvIg+tFE+R3jFWmWNHet0dYk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JG8ZQbgcdWCm1NNm1RDFSg43s1mjeApJXMO1CEXoVs=;
 b=jFVCgfZlPFvcZsiQ7c4EWGws/H0J7ULg/J6lAoQDssfS6Wlj22132p+CDQmdpOecIZLVQTzADy3AG0X+wblUc9Hpu2DwfKzJsWfui1Ob8QprPUnFD+D8zwBCLsFTv+SQD9AVkpNtnZT+FHf+VkgdBqLaARAWgLSXG86UQlHQD851o3whYUtf8mJQfTXN2nrghKFL5IUlcTZO7aegLMFzmDXHIOpAQwR0fAryTdkiIvzKhfjJT8VpBockEPhSfWK5RIy4t6seBEVcF7PWnyn6rxzSlMAxrFfB8xsJlBAjhcORgcgLM9+C1FdCvUDcM4/RJ8aJavF9yhG52Sy2noGwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JG8ZQbgcdWCm1NNm1RDFSg43s1mjeApJXMO1CEXoVs=;
 b=Xp/nOzZZm/bQRhdqvRJP7aAI2nP6WWT3S3xcy7nxZsCHzleAF4DPmX/jqK5rkEHk/LQmqMjbLwbvmicDxP7Imy4KNTqxLlsvmavL1ARouQDsxrPwzf/dyX0EPD7YNiquiz8HGptzNLwnMtMqBsotUrq+B2xEa47FNTmIOqd0ipA=
Received: from BL1PR13CA0334.namprd13.prod.outlook.com (2603:10b6:208:2c6::9)
 by SJ2PR12MB8928.namprd12.prod.outlook.com (2603:10b6:a03:53e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 18:34:03 +0000
Received: from BL02EPF000108EB.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::d2) by BL1PR13CA0334.outlook.office365.com
 (2603:10b6:208:2c6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.26 via Frontend
 Transport; Mon, 3 Apr 2023 18:34:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108EB.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 3 Apr 2023 18:32:50 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 3 Apr
 2023 13:32:34 -0500
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
Subject: [PATCH v8 3/6] crypto: ccp: Return doorbell status code as an argument
Date:   Mon, 3 Apr 2023 13:32:12 -0500
Message-ID: <20230403183216.3493-4-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF000108EB:EE_|SJ2PR12MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: d560c404-ac4c-461b-a680-08db3471fda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wUIiIm2QUlL/ordE2+jHT5jdWeati8XQEn6EOTBH7TG7aiNXJSKjdciEcOj6XjfADbkeCBmkTS2WTpaeRtFenx8N3Iy2rJN0ujMWf8RJ9m5bxwKDoMlcCqRPzX73auZpYRV7+6aeCVGLwN5rT3xhTVKPoguv7Ko3BY3WOQQ/OpqDx8BgTNBWXL35yMMKrVEq4PrTMt95uycsp5FeywOwWHmtnZWBxaiiL188H7RAhEIsWHDp5p84OKM7VQRhFeRhNUdhtNNaw+NszCGPip0a7DddNxeHDEIssOlWvr29fejU1oj049gwctbQktP5Qadncyl+mECnG07Qc6TsrTC4sZm+5sQlRddzzPEbhOHlclJ1a9/LoaBN+zSCk8LXi4WEyUCycH3cCqZTm8UAYQCGo6R2IdKTLIu291BaPq3P4MkczZHGX/YFGRaRrVN79un+1k/D33T9e7b772qouUE9ozBq6zV3VYO1r9o7WV0ZaWsNP+PUimS4zil50kA6ZM6xrhcSDYU0gFveYhcuoiUOSng0uV4/svz4JjqgXcVeMP8cmm0SUkC8iYyDxU3f5MArgoOOHCl5uv+1TXLbW2cA6UHQl1UbqWkwGHNGDGS9Fk1rny0RhYqo9PHWPgP+ph4KhlQz/ge0JOu/cfspbqKGRSlTaGlj2PmHzsyQvLQwZKJn7HulfaYYyILVDyZxTW9SSuBIKYxeRiiikRteq3saueMCOryyHTB/fqGReKmVdE2C7AEjrlDgIOsWWLo3JBd4s9AubjKOgLxN38NaXKwQ2A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(356005)(5660300002)(81166007)(44832011)(2616005)(82310400005)(47076005)(83380400001)(336012)(110136005)(426003)(54906003)(6636002)(316002)(7696005)(40480700001)(16526019)(186003)(478600001)(6666004)(86362001)(1076003)(26005)(36756003)(82740400003)(40460700003)(36860700001)(4326008)(41300700001)(8676002)(8936002)(70206006)(70586007)(2906002)(36900700001)(134885004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 18:32:50.7810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d560c404-ac4c-461b-a680-08db3471fda8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8928
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If the doorbell failed to ring we return -EIO, but the caller can't
determine why it failed.  Pass the reason for the failure in an
argument for caller to investigate.

Suggested-by: Mark Hasemeyer <markhas@chromium.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Mark Hasemeyer <markhas@chromium.org>
Tested-by: Mark Hasemeyer <markhas@chromium.org>
---
 drivers/crypto/ccp/platform-access.c | 4 +++-
 include/linux/psp-platform-access.h  | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/ccp/platform-access.c b/drivers/crypto/ccp/platform-access.c
index 1cc154a1c6ab..48f59ae91692 100644
--- a/drivers/crypto/ccp/platform-access.c
+++ b/drivers/crypto/ccp/platform-access.c
@@ -132,7 +132,7 @@ int psp_send_platform_access_msg(enum psp_platform_access_msg msg,
 }
 EXPORT_SYMBOL_GPL(psp_send_platform_access_msg);
 
-int psp_ring_platform_doorbell(int msg)
+int psp_ring_platform_doorbell(int msg, u32 *result)
 {
 	struct psp_device *psp = psp_get_master_device();
 	struct psp_platform_access_device *pa_dev;
@@ -164,6 +164,8 @@ int psp_ring_platform_doorbell(int msg)
 
 	val = FIELD_GET(PSP_CMDRESP_STS, ioread32(cmd));
 	if (val) {
+		if (result)
+			*result = val;
 		ret = -EIO;
 		goto unlock;
 	}
diff --git a/include/linux/psp-platform-access.h b/include/linux/psp-platform-access.h
index 89df4549fada..1b661341d8f3 100644
--- a/include/linux/psp-platform-access.h
+++ b/include/linux/psp-platform-access.h
@@ -45,9 +45,9 @@ int psp_send_platform_access_msg(enum psp_platform_access_msg, struct psp_reques
  *  -%EBUSY:     mailbox in recovery or in use
  *  -%ENODEV:    driver not bound with PSP device
  *  -%ETIMEDOUT: request timed out
- *  -%EIO:       unknown error (see kernel log)
+ *  -%EIO:       error will be stored in result argument
  */
-int psp_ring_platform_doorbell(int msg);
+int psp_ring_platform_doorbell(int msg, u32 *result);
 
 /**
  * psp_check_platform_access_status() - Checks whether platform features is ready
-- 
2.34.1

