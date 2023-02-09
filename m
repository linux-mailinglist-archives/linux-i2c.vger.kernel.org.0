Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F8269137C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 23:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbjBIWiq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 17:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjBIWig (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 17:38:36 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A42B5B744;
        Thu,  9 Feb 2023 14:38:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsFnLrvItqfeVxDLruA7wgdse4AZVFDlvA3HsVmd2GW4OSRn33G6z8KY3slniQ9Z3F1B1DkW4SWsiRH5fqWW1VYWBaHNJX3T9vbDc+TDW0xvCiwROsZ9KQc8NvUvHAedcISkD2Up/lXzObta+7JKJ1BQKbtyRsTNzTRtb4MaGoDCPguFdTfG3BR8b9Q5M4UQq+/52d5l7VkYXtvBkucIvU0qRD7xjvQEAPB04LYwufG3b2ju7z3yijW3Hq23z5f94lSwaNaOfsDig4S2iH+w3smi3mKi2qMFy+ui39bhbdn+ZuvAi+6BTfWkZKl7AtD5QBcmrJqAWLas6M0PGi5NRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHuLD4QlkHgKsE5llqZ+r9BzXmY7xrJSm5HAliUaOlI=;
 b=kd0uK8xlJBt6eNobXg6UoVUtpGrfXS1Z7Cm5iB6Lcvo2HrY/uZz/LEQrtZBX/ecwq7r7EkevcjgLEGRPB6O80OnWzOnEmM3KnKR1ULK/TF3hsB33terUZ0TdXNnJl/Pp3DnoBtlEgXRPDzE0JSFj2jeR66uzpUgWBgGI1aakf35bv0aUNO2SLydszN+jQ0xzwLboym/RjR/4V0IrTmutW5mtJIjhtRgyKAIUAx2jgFuWNUdA8Xpf0PHKuvNyBzn+NAr21SogFnJyLusMqH1S69NNbB2wts1OenauERSKYw+6welHM+84jbB+oYIPd6w4tbM8jLqfpXbs0P5IxticXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHuLD4QlkHgKsE5llqZ+r9BzXmY7xrJSm5HAliUaOlI=;
 b=ytOmv1Hs37fX1cUU09mPPx7k5eXpyKIJ9d/K274gnC+I1mNQfILdRXqRx80YKroCCFH8g8SuGW26lY2MNxpSA1Fxc2wmAOCPbZ+/XUdlI89F/5dTwgMSU7/J2dNaQYGflDBKIo1KQPJGFIyVIc9sZoZlSHs3eqKlnaMGHBazzcY=
Received: from DS7PR03CA0283.namprd03.prod.outlook.com (2603:10b6:5:3ad::18)
 by DM4PR12MB7695.namprd12.prod.outlook.com (2603:10b6:8:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 22:38:30 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::a0) by DS7PR03CA0283.outlook.office365.com
 (2603:10b6:5:3ad::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Thu, 9 Feb 2023 22:38:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 22:38:29 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Feb
 2023 16:38:28 -0600
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
Subject: [PATCH 1/6] crypto: ccp: Drop TEE support for IRQ handler
Date:   Thu, 9 Feb 2023 16:38:03 -0600
Message-ID: <20230209223811.4993-2-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT020:EE_|DM4PR12MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7d6c42-6d6a-4f97-b9ea-08db0aee5e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Am58gQXs/HrIgMMrfdm1uG6wsH/sWfMrT2UebvFeMfxkGHbsMd1CNQMTWySmNAmpiSn90bQ+cXm4NByuKPPRackAwB08w31XrjYyfrgltYx15pxvYEdRQJCrQQDd3Ff659RXFEdVJIr42u2Hy2MAYQybxLufxWFjAV5I24SQCj75e4fJvOttgWiKFrl94nUf+X6oirFiROxPnMtcglUBvVUBkmy/aFB7/lynvnamv2h9KhCL2RHgt0gr3mpjqqXcT+OFOocgvH0+MDkO1Ow+13jWece8l1kg+d7uonlMVXTbczzdhGS1VXi5+d0Vhp73TzhP5XL835FWd0PIPk34o8FPaNZsMwnxcWQbOWc7YmklkABTrW/8zmMHGVhyKg9Ybfo9c9dkwv/gg+01xyDRYfhZu5x0woyWd4HPwdaAdyBgn7XTEdF3PXNIAXhCYR/qpkDZR2JMv9kV1DjAeiRH140O2RoUwEhaOGSqgr3xHzGB0eRSbbzvDlnuSkyE/rRjJHuxJc5OzoByKxPA0X6Bqp5n1VKzijZQoFrc/I3f0YDF3DpF8cJmp9ce/52U/TufTXHG5x6uVGHEhLqRXOjllsRWahf3+xy3DJZjRM3c7XvqZhcDzwzyavhEV8FiYykLOQIdH5P9gbSor5xgGGzghKKD0GpbKQGsQ9A1qDlsfwXbF6d3cb5JNfW1J//TKlrY9VKw4vDX+B9smHHWwhuGpRPOAzHL1K2v2PXYK1PSFqmexVstckpZVAAP4jLRrdXBxOgfNNcyiOxPDrwy8sSaDw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(26005)(186003)(8936002)(316002)(2906002)(1076003)(36860700001)(110136005)(5660300002)(356005)(6636002)(16526019)(54906003)(86362001)(6666004)(2616005)(83380400001)(82740400003)(40460700003)(336012)(47076005)(36756003)(70206006)(478600001)(426003)(82310400005)(70586007)(4326008)(43170500006)(44832011)(40480700001)(81166007)(7696005)(41300700001)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 22:38:29.7876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7d6c42-6d6a-4f97-b9ea-08db0aee5e00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7695
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The only PSP mailbox that currently supports interrupt on completion
is the SEV mailbox.  Drop the dead code for the TEE subdriver to
potentially call it.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/crypto/ccp/psp-dev.c | 15 ---------------
 drivers/crypto/ccp/psp-dev.h |  7 -------
 2 files changed, 22 deletions(-)

diff --git a/drivers/crypto/ccp/psp-dev.c b/drivers/crypto/ccp/psp-dev.c
index c9c741ac84421..cd8d1974726a8 100644
--- a/drivers/crypto/ccp/psp-dev.c
+++ b/drivers/crypto/ccp/psp-dev.c
@@ -46,9 +46,6 @@ static irqreturn_t psp_irq_handler(int irq, void *data)
 	if (status) {
 		if (psp->sev_irq_handler)
 			psp->sev_irq_handler(irq, psp->sev_irq_data, status);
-
-		if (psp->tee_irq_handler)
-			psp->tee_irq_handler(irq, psp->tee_irq_data, status);
 	}
 
 	/* Clear the interrupt status by writing the same value we read. */
@@ -219,18 +216,6 @@ void psp_clear_sev_irq_handler(struct psp_device *psp)
 	psp_set_sev_irq_handler(psp, NULL, NULL);
 }
 
-void psp_set_tee_irq_handler(struct psp_device *psp, psp_irq_handler_t handler,
-			     void *data)
-{
-	psp->tee_irq_data = data;
-	psp->tee_irq_handler = handler;
-}
-
-void psp_clear_tee_irq_handler(struct psp_device *psp)
-{
-	psp_set_tee_irq_handler(psp, NULL, NULL);
-}
-
 struct psp_device *psp_get_master_device(void)
 {
 	struct sp_device *sp = sp_get_psp_master_device();
diff --git a/drivers/crypto/ccp/psp-dev.h b/drivers/crypto/ccp/psp-dev.h
index d528eb04c3ef6..06e1f317216d2 100644
--- a/drivers/crypto/ccp/psp-dev.h
+++ b/drivers/crypto/ccp/psp-dev.h
@@ -40,9 +40,6 @@ struct psp_device {
 	psp_irq_handler_t sev_irq_handler;
 	void *sev_irq_data;
 
-	psp_irq_handler_t tee_irq_handler;
-	void *tee_irq_data;
-
 	void *sev_data;
 	void *tee_data;
 
@@ -53,10 +50,6 @@ void psp_set_sev_irq_handler(struct psp_device *psp, psp_irq_handler_t handler,
 			     void *data);
 void psp_clear_sev_irq_handler(struct psp_device *psp);
 
-void psp_set_tee_irq_handler(struct psp_device *psp, psp_irq_handler_t handler,
-			     void *data);
-void psp_clear_tee_irq_handler(struct psp_device *psp);
-
 struct psp_device *psp_get_master_device(void);
 
 #define PSP_CAPABILITY_SEV			BIT(0)
-- 
2.34.1

