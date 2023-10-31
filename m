Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E067DC71D
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 08:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343602AbjJaHVi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 03:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343585AbjJaHVh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 03:21:37 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2071.outbound.protection.outlook.com [40.107.117.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82368F;
        Tue, 31 Oct 2023 00:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5NYjNbIUbwneTX7K2e8bVZ3X5Gaa2cq+DRUG9Gs0Du1kDOiB/ZgQ/zYyEjab7yPCrWxJsBWEvooFrVeCbSnvF8VxXZyGuoK/0qk6686aw6MnKEPs0iiDG1a3N5sKnC1UB2Z9v34k3GkYUfeYclXZwJFV3kEqYtFDlHrPiR7JBA21W9AUrQbIqsyOUYvilZJebrdK/h61rWxdgFanrKvAR5GQrneUj6JVkzfNtRXsyowJnISTunhEF5EgZtpQ9hwVDHUYMx/nj6ieFLM84SNqOXLckuKTOE0j8rRxbYsxPRpSeYL/veBlqUGyy6P+hiKtOF258Nm5bQFZYHS1noWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bt7PXAE/WeVXhukRg6lFGw9uNHQCoMuDUJ2Vetgbrdc=;
 b=Hc5b9Jlv/mAlX8gTca4DnWHvmzTblsP06QgQuWgYhQsiRWvHKAAudig/300RORiaX9OZKgFJds9QTbuMDthLasMR3ROU+eORboEsaTv/QSHQWRogNJH4cZGOXgD/1GUIF7iOpejkmPs5vZAzxmgxCaxDU7FEu4XyZPUMbxBnpRWskYu7QW6js/9L1D/gf7/8kX5yIcDaaSVTDSTwrCzeZmdBUl0sXx3mIAL/t/QSZ6UkLegyJBYLOiX/Wno29JWQAA0LL/8hMhmexcloCl+QAp8oxxQCjZMbegLCcHvWMfF1ARWZtKPL3aVNWFdR2O5iOvOz+6llUUdkUHa8r1yphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bt7PXAE/WeVXhukRg6lFGw9uNHQCoMuDUJ2Vetgbrdc=;
 b=T2clwvNSTY/eqBVHStfkw8QiIcpKxH9UqWsufhMP4Qtrbd8Jm/lDRwf4nRG3+BW01QC/Vvp9lxgZfXiDZN10BeXfkQ5tru0rSCtQPXggUaoNZpxBFjFpMHuCmPxNIRRUuakRL2bsu38eSmvMytMLlmFfEO2/95rdgrSOGOdNu2I528xz268xnqI7Pe3bmfPHlMOPsgxd9iFGr2M3RD+qyfMQ0mv/TCVCS99syCs9aHNLZ2zNwI8NvultXBnGuIJcyfgJKcmdJ9rkbcTEYCr9JZBXE4TNabUmB1HB6Eu0ni0X1Z4BQ7+yXEen/mynukrMIB+WbP9MjMyiVE3ywhSsQQ==
Received: from PU1PR04CA0016.apcprd04.prod.outlook.com (2603:1096:803:29::28)
 by TY2PR04MB3999.apcprd04.prod.outlook.com (2603:1096:404:8001::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 07:21:29 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:803:29:cafe::2c) by PU1PR04CA0016.outlook.office365.com
 (2603:1096:803:29::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 07:21:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Tue, 31 Oct 2023 07:21:28
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz
Cc:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v3 0/2] LTC4286 and LTC4287 driver support
Date:   Tue, 31 Oct 2023 15:21:20 +0800
Message-Id: <20231031072124.201181-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|TY2PR04MB3999:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ba5c06b8-25a4-410a-b94c-08dbd9e1ffe3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rR15NmUn6/pPXcnOC8Lc3PceauCXCwMTwLM3ir2PTDrTNifO47097BjKE9PZ3BARUDXXquC1wovvqPgmJgFglqqpioIkQ5RjkAJaEYegnE31Z907rQTzz2xC9QhPhs9+XRd0KcZgWyNdo78yLmLTGhDIyU1e5sXi89WKAJYDQrVuIpdIzXV1kOnHj9nRwGrbanSOickGuUsmkB0zuDqMpc/Fk9N0AicoRCQbB47W1+xqA1VtyYvbHq9Fsk+tcjxsgGb7uJ7mmJ+/+q/5QA7ajDhfwfSZIrBs1lb/nqQD5iIj0oc2adSxMNYAUE1SbEZULrk/1Qf4hg7a/Zorffqxf9/jTWuqU3kM136CuMLOfe5uBzX2qYgb5CRrlNg57xJjnoYRUjSnJaDXCEzXmDZvfs0QoL1ifpR739kziuC+lUMAnURuv7lqJyrDu7XqWyQgy1TmOyoI0S4jXqZ7RArN0F3b/y9oRKnMTdHAOno59mjOGtuVvaODalBMvu2ny66/WFkAe+g9Y3CkHyyPCFRI9/+EmOKcy6bPmlk8A+DjzoNmJFmD9EJfJ4jAJmd1+jwqy+chTqGChqKd/uj7lDusCL0WoIIAwu+jIBDLNVSSXp3UbBmncSrQzDEWjwlSxfQXbVYwrc/2lewZa0ApqxhV4bwFdC7H6AagL6CPz2jaVsdROuSKr/kjLG1gC0YKY1Ueayp81amcNxi1ZuqMRvJhZQ==
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199024)(82310400011)(64100799003)(186009)(1800799009)(46966006)(36840700001)(7416002)(1076003)(956004)(6512007)(26005)(6506007)(478600001)(6666004)(9316004)(47076005)(36860700001)(4744005)(2906002)(41300700001)(70206006)(5660300002)(2616005)(70586007)(6486002)(8676002)(4326008)(8936002)(6916009)(54906003)(36736006)(316002)(81166007)(82740400003)(356005)(86362001)(40480700001)(36756003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 07:21:28.4384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5c06b8-25a4-410a-b94c-08dbd9e1ffe3
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3999
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v3 - Add LTC4286 and LTC4287 binding document
   - Add LTC4286 and LTC4287 driver

Delphine CC Chiu (2):
  dt-bindings: hwmon: Add lltc ltc4286 driver bindings
  hwmon: pmbus: Add ltc4286 driver

 .../bindings/hwmon/lltc,ltc4286.yaml          |  52 +++++
 Documentation/hwmon/ltc4286.rst               |  95 ++++++++++
 MAINTAINERS                                   |  10 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ltc4286.c                 | 178 ++++++++++++++++++
 6 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

-- 
2.25.1

