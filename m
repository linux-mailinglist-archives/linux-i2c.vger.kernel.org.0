Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E6C66DA3E
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 10:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235912AbjAQJqV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 04:46:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235848AbjAQJpo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 04:45:44 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072.outbound.protection.outlook.com [40.107.255.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2370055B1;
        Tue, 17 Jan 2023 01:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FD6NgX9SPSkp3inj099a92j9KOPtruu8dSCs3uOCX8Lj+hbC0ZYQ2mFXeMa7ThO+D1j3+u/srANcPGKLmj3iz7yg1rDoL47Dw+bv/g3q8RSrZD0BL6W0+GtdiYMHTjHnc6DiVN4QOBC/y6T4O6hr1sIyDlmH3/t03Tq8mjkkCew/o80Vg3aq564fjX9JxZsiUD0+7vqUENdlBruNNOJNnKP4bF95JnoWpGBSgWn8O8buGP3tOKLqbUwZ0rnZ7ItTBx6xrjFXJ4MolhaG7uXOFFxa1DNS5DY4DD4jLBb1Iu2J7GP5BbuRNYyUm/52I/Dqaimk8mkx6Aun2OxFEiz3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22jF36dC4AQ2nJLJYMo7uAuFgMgz99xaJ52CTdGZKpI=;
 b=aQ2GLr616MmP93Us7rm+/rFNL7iUoxxkk+1cgv4cBOkDBsoWGeUBP7iVLzppNdYpDqa8DynXx+tisLwU3Y1PhS2SjCO6KFWqZ8bwFJtIuSqp7BBM1SsaswDC30NPY1+o4mM2heyweyX8BmxTvpFadrzAxiuysdxyqVzKpePy4AuTKhQ4FxJfYDuWmsl/1qFXZu+Dp3xQfnNMIh6ezs4R7xQMOCy8deOniyM3i/ZJXqn/z2j+HFGt7Nx29V6vQYxj/IZpnJHysdT0SI2Jq3Kz0w28ZZO/l62kStpRSGRNgl/7QWcYCpkVMJCrgELQPz2vG/8I4VAGaw19aciYuSMEEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22jF36dC4AQ2nJLJYMo7uAuFgMgz99xaJ52CTdGZKpI=;
 b=SwSVzbwaBavWP2s1jqWExza6SESWdnRIJM/ly3SwN1WxPrWRxTC6U90gJGOiLzUkOjX5LZliCSPVy96BlvBQu+lubeEorM2ksA2yJmop0MQa07yTdlAfCBc0nsoq7gCzac6Nhv3Ttpf+25OxH6/P8/odm+tzMCY0EnECjNYPBJpUFzusd9dAS70It9Vezo8lpktAWpoSkSRSiEzCq+gZqdHGLvOeDYJW1/gDpa5qzt2qy2lpH8H4JryUuaGhLC6zfgI4CEQFFA8Wo3PL8EXKacnFpigIjrk/5EWwEnjkOaeFRaRtuM4RNHNEdYfAn6lZvn7G3AuC+AG6Qe4TddT4/A==
Received: from SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13) by
 KL1PR0401MB4323.apcprd04.prod.outlook.com (2603:1096:820:20::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Tue, 17 Jan
 2023 09:45:37 +0000
Received: from SG2APC01FT0004.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b6:cafe::69) by SGAP274CA0001.outlook.office365.com
 (2603:1096:4:b6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 09:45:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2APC01FT0004.mail.protection.outlook.com (10.13.37.116) with Microsoft SMTP
 Server id 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 09:45:36
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     garnermic@fb.com, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add an entry for Meta
Date:   Tue, 17 Jan 2023 17:44:20 +0800
Message-Id: <20230117094425.19004-2-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0004:EE_|KL1PR0401MB4323:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f3d1fed3-785b-405e-71ee-08daf86f9643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N/4/hki9GG3g+sniNOzRDCP3RW98UWQsixOS1fk0uNQm3lCFCKb9yTDerWcuZ3yqzMALd4wVGqRPcXUSAHdiJUqtL8QE92ca4XC1CAb1ZIdHiMsdB62x6V/iAc6fjOhu/DSl1cMeuYXpgXHaFIcn77HUmo/mEWbqmTDsXEAbOwxbZ2mePv26NsjMf31HHiGN74fPRkAfKpn5NofcyKOVteptooK0QFA2d79FcG6jmz7Ye0cKvLNmJ8w5KIq4Ym7NhDXmp9Ei/qsCWCUFqMr4ZMGeGB9QDFEtV0Lchn/k4uIij/CmHfBJMq+K9UnpIsGsRXVMx8re7r7jVfGxJ4Og/5LqzVF9/yVTDVUNUvotDiMCGv3L3GrZOOfjWDDZ/HXs3xSnL1eEhweQNYhzqBamjsgXgMaKVuMC/5U0d5FT8snUhNr5WusqsC9tlP/HkVBZSdVRi+06TfKIwStlHFGdBA2cG4nB7Y9nLA2gtdqQyn+4wgjUVZ4VwVocw7s+qsD43puqvYRdBcsnTU2sv9+fKvgV8RMsgLjFcDm7mCU5USPcPEE6RkV8mpOu16a3yVUZqUjhfrSJTih4Uf0drZJ4djXLu9SVf7EkzHigr5opAk0nsLZnotAz9LAf1wxzK6RrqdX2TOTBehduDp3d2m2slLojRG6RFWwx8Mbq7WFVkfE=
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230022)(6069001)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(36840700001)(46966006)(9316004)(82740400003)(82310400005)(5660300002)(81166007)(6486002)(7416002)(8936002)(36860700001)(356005)(26005)(36736006)(110136005)(4326008)(6666004)(70586007)(36906005)(2616005)(40480700001)(1076003)(956004)(47076005)(4744005)(70206006)(54906003)(478600001)(6512007)(86362001)(336012)(316002)(41300700001)(2906002)(186003)(6506007)(36756003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 09:45:36.4126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d1fed3-785b-405e-71ee-08daf86f9643
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0004.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4323
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add "meta" entry for Meta Inc.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6e323a380294..8de562e61ff6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -793,6 +793,8 @@ patternProperties:
     description: Cisco Meraki, LLC
   "^merrii,.*":
     description: Merrii Technology Co., Ltd.
+  "^meta,.*":
+    description: Meta Inc.
   "^methode,.*":
     description: Methode Electronics, Inc.
   "^micrel,.*":
-- 
2.17.1

