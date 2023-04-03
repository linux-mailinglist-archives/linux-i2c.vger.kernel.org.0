Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2C2B6D5090
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 20:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbjDCSc6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 14:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233225AbjDCSct (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 14:32:49 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46DED212D;
        Mon,  3 Apr 2023 11:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbyfaT7S4l4ECuDLMRxWrqBT6loFym+iIUV9htQtdbmm5+aiI0xrgbJOFxgX9lRg7pO/PBR6/PT1euPf3gaNdufGYBcML4p+LXnGoxEZllsuWqFhqEvt3SORiovqr6qMfwYV2HDbeND3itYq3S2eAB8wLcWRv3caTU3GLnKHGcl7fBsss1iqSh3zG3bFtBuLC2GhJJpP9kkxAefzeC424f3WwFeSEtguZnIZXZ+MdovziqG8tTWgniNrnSpqG62HWZvuVn5ppkY8ev6fPbDr9y2f0lh3+hAMTkwaKU204BAxvYFqisWIzTIl6UHwhkXDSKBhYyeD2Grj5fMIMEQaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYhIZWbNYqFVNDpfO931gMMWdMwqo+/KUWdkInLKCoE=;
 b=UJS7AwD3BufCONXRS+925Ml/CNxSl6fhFpTDvhQfe4uC0BXMD8sONa5y6UYnqk5qHpltYI4jxeNzF9bZ1jQfuE+Y9dNwWv4nUc5V6D6sx+sCcA4EvYN4OXC6jdyJTEciDtO5RQ3TtIiLtTnWIuBpwCO2Z6as68yH96WBCK1/6RMKG/C8FawJX6pdmOdjcPIKQc4Juuk7HhAmuUL3qv68fi9Ltw2DhpnU7bXNnXW7vVzkAGh5S8fNmsJWQI0s7ayjDul4QKE8EIfdTvvGUQkssJuleW7Nj/gmZy7SkwOt1RnHvLdaGWF0XWBHn4nbsrcAcSc5+Q8W+VmLs/M8GFzUGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYhIZWbNYqFVNDpfO931gMMWdMwqo+/KUWdkInLKCoE=;
 b=kS32UR7IP3RBjsjk0TuW1vOHEpCMjR3H6nw0y2aene7F74v2u4SRPHbqwjeYnrKSR+sp3LpB3bguPFftLKScVcpnh4Iycdt2OTK/NIrEGic7W+2d0SBmH5OAZ0x2ffZRjjsmuwf77Ki0Ovkpaj/duCBS6iJ89Veir/nB3ySnPpA=
Received: from BL1PR13CA0200.namprd13.prod.outlook.com (2603:10b6:208:2be::25)
 by PH7PR12MB6612.namprd12.prod.outlook.com (2603:10b6:510:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 18:32:42 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::be) by BL1PR13CA0200.outlook.office365.com
 (2603:10b6:208:2be::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.26 via Frontend
 Transport; Mon, 3 Apr 2023 18:32:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 3 Apr 2023 18:32:42 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 3 Apr
 2023 13:32:33 -0500
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
Subject: [PATCH v8 2/6] crypto: ccp: Bump up doorbell debug message to error
Date:   Mon, 3 Apr 2023 13:32:11 -0500
Message-ID: <20230403183216.3493-3-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|PH7PR12MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec6830a-b1fd-435f-4552-08db3471cff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rvKsKyWC/jW/akMtAqCYGVvWQx3SuXp9cyv6kSoetadLOcihTd9UD9SnHXJQkWU439to768kmr4zfnO3uOiIHNOLuonjojNkbJNGf+doziSLjfOBQ+DNaeRclM7QT6K/d/R72PCvL1lewnIxAzXz2wncxlnFckGDteFYAOTD2NitV2tgFkZ5GjXlPDExYwGjyjPv3KpZtZsT/luHlWnlRP+EDRnpOOpX+AShdlk3ohwoLbDWnMlhRCpSS/mAUDCM/e0N+Op7Pk1JLwgv7SO5Gyn/mXseWoBR4+uv+vtIZPTeuGIJ0Fydbd4fyEUn8mtcSzVe1oScibsch8X9iWK9B2mJCli36Xv2Bqkx22JDRK8GLR6KvliV4vnItB3vJWQsavnIIRVqpeobt540dMglnBDEtHIuZSQ0oKMOdFBXTuoINMXqhodysjU1+HQvssbS9mWC71f/nJmvAr9AyfkGNv5zz8zY3b7/tYdqL0mQzdSL4YYWuxnH5slHwxVNSlEgCGrrz3FI59gGZAX4xApXUYdi0xwMmMXVXpzcejiMO5hfNhry77AMe/JZcmMk6x7w00Y1enrgPL8WtX8xE1jESbPZO2APXYJADoXBaKm5Evg04elbmpEy1HGudtuPPQ6U+kzRehj58iaDToCfi8340ay1JSEVi8msTv914tsH6hX+uz0cwPCApjz2aSMbpe2J89OrgAg2UzFF8N75K2hbAt3Pd/gl11zNdcvSAIeGO90=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(47076005)(478600001)(2906002)(2616005)(40480700001)(186003)(16526019)(1076003)(6666004)(36756003)(336012)(426003)(83380400001)(7696005)(40460700003)(26005)(356005)(81166007)(4744005)(86362001)(110136005)(316002)(5660300002)(41300700001)(82310400005)(8936002)(4326008)(82740400003)(8676002)(70586007)(70206006)(36860700001)(54906003)(6636002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 18:32:42.7626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec6830a-b1fd-435f-4552-08db3471cff7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6612
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is helpful not just for debugging problems, but also for investigating
captured logs later on.

Suggested-by: Grzegorz Bernacki <gjb@semihalf.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Tested-by: Mark Hasemeyer <markhas@chromium.org>
---
 drivers/crypto/ccp/platform-access.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/ccp/platform-access.c b/drivers/crypto/ccp/platform-access.c
index 1ad3a0a512b1..1cc154a1c6ab 100644
--- a/drivers/crypto/ccp/platform-access.c
+++ b/drivers/crypto/ccp/platform-access.c
@@ -149,7 +149,7 @@ int psp_ring_platform_doorbell(int msg)
 	mutex_lock(&pa_dev->doorbell_mutex);
 
 	if (wait_cmd(cmd)) {
-		dev_dbg(psp->dev, "doorbell command not done processing\n");
+		dev_err(psp->dev, "doorbell command not done processing\n");
 		ret = -EBUSY;
 		goto unlock;
 	}
-- 
2.34.1

