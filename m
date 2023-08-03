Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04CF176E130
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 09:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbjHCHXp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 03:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233788AbjHCHXo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 03:23:44 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD172728;
        Thu,  3 Aug 2023 00:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JU1u+QOrFUT7TfBq74UA6bwjEIn0WMrL0FvA7/EgvhhI82MjazgOsQZYRalJSJang99eNfXnK3O/hA98d3DmUkD3apQroR71demhVSMwgqukjzLzqqTeThmuwuKLZAGmJLpwX9eqIJDQA0epF2pOYTmCgMTGLR0fPufndxOgrLwTHkDJ0EZ0aVDFlzj3rOHcDRcSvCP33M2bNocmJuZadlcrENEmueiztlul5PLUU9w3X0VQ2hbSL3tiX+RFY/I125JQRxkmdoRwjEiFjUDQyQ0ogCXhG27Hy+Upbt1/Ji77PSY8rbWWY09c8PJnQ2+aQYieQL6sDZX3KXkLy+I7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubHlTH18pIadeD3d0EQbMeOVCL+IqSkJJpjW4uljIXg=;
 b=VmWwE0HkmWgLRYc7tmEBqYtDGvkOz9/NttcEcl8Nce8ks6BZALrweoqiDyAZpe5CDUgrmp0eXMlTyB+pl/LbzweXBPJTsNxubvtKlRtfmkRhk1Rxcz+RFscemaCPeOo8uhMD/13zZ5ODOx8Dp/Lwh/okF4JSuZg2khrj2fHHrcHoAbT03PtedMMPHk3XkrxDeICxePyRVII2lm+yxgvZN0b6X6c9jMG4FNzeK36/tE5Jb+LnMOfko3+SsR9BkWRh8AtbYmBaBNIRWpvIEXAnm/pF20bDTh4G/hKgLGB16Wn75TsY45JQaMiqcnsUPDmLeyyg4TTo5N5aLh7lfHPzwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubHlTH18pIadeD3d0EQbMeOVCL+IqSkJJpjW4uljIXg=;
 b=jC4SB5cZmqsQ3/G5BQSSIDI1VTutVXOEGDWHjrMqpe44SRtUk8GmthXQkLHowH4Wl1pUqKac73u+EODVNGJRqNLPTlkDFeISahDMk5BYAmkBajJeqyeaxCnJh3FhqEvyxA1UzvP7qnBlxtjFPLrtF/YJn37+X6eNuqGm5Z95EDk=
Received: from SJ0PR03CA0164.namprd03.prod.outlook.com (2603:10b6:a03:338::19)
 by IA1PR12MB6386.namprd12.prod.outlook.com (2603:10b6:208:38a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 07:23:38 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::de) by SJ0PR03CA0164.outlook.office365.com
 (2603:10b6:a03:338::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Thu, 3 Aug 2023 07:23:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Thu, 3 Aug 2023 07:23:37 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 02:23:34 -0500
From:   Michal Simek <michal.simek@amd.com>
To:     <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
        <michal.simek@xilinx.com>, <git@xilinx.com>
CC:     Andi Shyti <andi.shyti@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH] dt-bindings: i2c: cadence: Describe power-domains property
Date:   Thu, 3 Aug 2023 09:23:31 +0200
Message-ID: <8774dba53cae5508f9f7aa173fbaf814d97898b1.1691047405.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=751; i=michal.simek@amd.com; h=from:subject:message-id; bh=vN2gtM/b6l7g9l8+BURSm7DLzzHstL7T5cfH4bqIyVw=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhpTToe8kpx7SKEktSov5LK5kYqz49sk+sabtT+YwecRo3 GQRm2XbEcvCIMjEICumyCJtc+XM3soZU4QvHpaDmcPKBDKEgYtTACYyM4thfm7oTJnvdjyf1JXS 3x6Z/mypx7TG9Qzz7IN1vZWmhRqlKnt/n3R59vetR3u/AQA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|IA1PR12MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: d29cc75f-97e4-4f7e-e743-08db93f28dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fpeNnRpEaAci9l77hK3EJ7aauQL4p7LS0HZvM+sJXlrCmrPmnXYVDec6OOxQq+SqWrUpVN8SdMDFFUUUYa2t3i1fQKtR45STEXJuLWhkpKvZovTZRlxY8NS83ddjaUD51AdA6OEAw7MEQej7p0MpbUuTrqdvkc8rd0OP7OCJxAQb3BfJYC/VclCcpTxH2EAbU2HqlulcRL5azsYmQGe/oB6x3CxcNcIbBb/bMQI85T9POIEK0HTBGPO8a04OygcwKg3W4wIkzOKVNdXvJYTehHlN25Uyd9hL/IFp43+XsLVNd/+NEDQgmz57Zk10TrHuKPM2o4ciOKVEiou0NijNgnqf65Uyms1VpgAou2/yvusRUcjSNUp37aoDwzODdwg2rDJ+UZhSxUDMT52M5WGeWYdWa9LNOe1Pr615Phop0Eg96922WIAOnwKMok/aRTdQHqiemssi7my8UCCyArK1rfyGd+6s9PG02LL6czqTq1Apfapp0HGyDWkIHkhHIrf3vL3UBKDen7prRwrvHaNiIN/gE74WWYTFr8K69VWgY4NBPRrg0szro8A7ysIwbBxqBSi7TzD/xkKH8jeGbH8RTFmrmjmlMVLN6y+k369B+Gd+EgeEBL2ajgJjMXbp+Ms6WsTL7OcmKImGBHZBjSEgrIz60rHDq/i2RdGur4PQmt56BqXk5wh4vJ+/ki+5ySQtTzWR0MKQZ8DOxvFgiD+vvxDt81tcmDkRILDAgKan3HBdpasAlwr9P10r837Op8k6TEydtnqNzasHuvEkg6mIwX9qwAJ4fH4zBYjpvMHMIEs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(36756003)(86362001)(82740400003)(16526019)(40460700003)(40480700001)(54906003)(478600001)(110136005)(356005)(81166007)(47076005)(336012)(426003)(2616005)(186003)(26005)(41300700001)(8676002)(8936002)(7416002)(44832011)(6666004)(316002)(36860700001)(4744005)(5660300002)(4326008)(70206006)(70586007)(2906002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 07:23:37.4001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29cc75f-97e4-4f7e-e743-08db93f28dea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6386
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ZynqMP Cadence I2c IP core has own power domain that's why describe it as
optional property.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
index ff57c5416ebc..9f1d35ce1fe8 100644
--- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -48,6 +48,9 @@ properties:
     default: 16
     enum: [2, 4, 8, 16, 32, 64, 128, 256]
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.36.1

