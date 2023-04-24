Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2356EC9F0
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 12:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbjDXKOD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 06:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjDXKOC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 06:14:02 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2066.outbound.protection.outlook.com [40.107.255.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A3C1712;
        Mon, 24 Apr 2023 03:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEUFrTPrYo96Valzq+7E7XmBsptn2reFaCz15BGHTemZFS58BHj5Y+XqErW7yVzcpmoC47bKvLOVYkIYV3nYWe5PBHhwpoYPGAs9n0uzI8alBVnfVG8yqBDmtXuJOuyrNy83N1+wk+ghLTw+kBcj7+W7pQQsqQ1HszXkLjRZK1ocBNVZoHJfG6r0+epPtljQutnWbEm+hBGXOjLaRQAqZDxntoFko7ZJnO3l2luvRzkprspw63H0Duwb//+VOS1xcwFvD1VPaErOzGzRcFELR+i56Ll5+bHt78YotQXAR54WAAprOjP4JuCM/RMSwEuAYKULCJIckH3FAH+NAi5IWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPZAi9klJgtm9XgdikT3BwYW/nUHjcshae3VA2gFuoM=;
 b=Xo2lHTXhQB7a/2LIN4uU8USQ0PNP2mVNMlLSDEx7ZA8P8BQ+LkBmbujTrGbg9wliDMFsgfMDBbd+ZMJl2B6i7kDbYoTsWPUEh4eAeGdCD/rIPcSapZlyl6LRsEfabyplosRGPVcxJnxNms5saCXrfQuN85XhK9NKk29CrOFsYFCrQRqvGeZQNKNXVj45xsaeWBfjWl5JCbdRucoToWSVlaxu2NAYjkCDu7unVRFUf/i1JZaS+8KrrHFyKmacJRvyyZVa508R5tTFGHSsSf1oGU8n34qG4miC5Vb1QxX1LGvKrbZEczoOpuEZKxhRhUY6GMVI3zrb90nrud2Wn590Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPZAi9klJgtm9XgdikT3BwYW/nUHjcshae3VA2gFuoM=;
 b=Am5h4mYd0NplpPAa//yHKM6M4N0/7GuJRW3xJdLzLTnulItrIvLkc4rscxUkfs0ENRutIv3/C0qzhSrqd2etzkHxWdXN2dMe8UKLUkevUcg6p4GzpaYdsMSbh42dJhSPE9h2Vdn2p3uG4tcdEGLac4R062vrYts5ck/upOMSUv1Q6rW1V0/a6D2Qpe2AKVXqKbH58OXUMQJgAu4wLbM0n/7JxWVVvRl/OkDuPQ53OjGNa1dRfpgTLFF/G3WJvAJ4Fj7EhONsUA7xOrl4lgJtIaQ3qKICVvtGtk7B0x3IzMpLRrNa+iiUQe5g+SdU9yekFdH7grl7RZHSfkqP/dFe2w==
Received: from PS2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::18) by TYZPR04MB4302.apcprd04.prod.outlook.com
 (2603:1096:400:27::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 24 Apr
 2023 10:13:56 +0000
Received: from PSAAPC01FT059.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:2d:cafe::e3) by PS2PR01CA0006.outlook.office365.com
 (2603:1096:300:2d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 10:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 PSAAPC01FT059.mail.protection.outlook.com (10.13.38.139) with Microsoft SMTP
 Server id 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 10:13:55
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz
Cc:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] LTC4286 and LTC4287 driver support
Date:   Mon, 24 Apr 2023 18:13:48 +0800
Message-Id: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT059:EE_|TYZPR04MB4302:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e9d0cf26-08b7-4131-1130-08db44ac9ce7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8XrBV5giKAc6sDFayHnUJnRUPV6U6I8Cv75GkRalCes3KDDPUDiMTw3baAA/Zzka4Eo5k4XugVtYWN9/jzFM7mesdTM2oy5jIP5r1T+jdqGwyoakpmeicV9UtsD4G5loWoWOi/hY1OQ1hxIwB9Ngd7E4PBaZLltKQWHgarlmpllBLEf3bc+SK5G2BBr7ZWFyf6VqnZVoWCLz4sWzu2naKC/3XD1A2lefShEPLa7SCQLJO/VCOvVdrltbqHIQZUBNMYBtU7iendxpfx0nX/WT8XXZZ9TvH582yecIhI7xkKbVEjsThdX9oHtTfSlBobg8RkXrhKp60ci3zBHxb3MN8S5BSi3CV3NXTxky8pEAihqYGxVVY0DBW/KwYK6KRB5KU7vI1WiEY/iK/hDNa1IK2hqgY0E2WIWUwI42Fwq8MS/VM2M7SXq78owDO6uU5YmlFVSMNZCahQh5H+7S8rOLfysb653nH76FBhDeAEW9YzIIzyoX9HGJ33x+H6sKRhAXmmffA2mFPVYTRN5fB9eL/2pUtOLamUXwQybyJkstco+BxUoED7Iw5kvn+feGSRXgsF+gt3GV+M7Tx9PZDsfxRRI7pxMLGBYz+V20DNxTJU03PqQiVJAc/Fbsmqkajm6tqmiptphcaxl3j1038tCEWfM7Q0/luX96u0Sz32bGlg=
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(396003)(39850400004)(376002)(346002)(136003)(451199021)(36840700001)(46966006)(2616005)(6666004)(336012)(956004)(6486002)(86362001)(478600001)(26005)(36860700001)(40480700001)(1076003)(6512007)(186003)(9316004)(6506007)(82740400003)(70206006)(2906002)(356005)(70586007)(36736006)(5660300002)(4744005)(316002)(4326008)(81166007)(6916009)(36756003)(8936002)(47076005)(8676002)(41300700001)(82310400005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 10:13:55.4260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d0cf26-08b7-4131-1130-08db44ac9ce7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT059.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4302
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v1 - Add LTC4286 and LTC4287 binding document
   - Add LTC4286 and LTC4287 driver

Delphine CC Chiu (2):
  dt-bindings: hwmon: Add lltc ltc4286 driver bindings
  hwmon: pmbus: Add ltc4286 driver

 .../bindings/hwmon/lltc,ltc4286.yaml          |  47 ++++++
 MAINTAINERS                                   |   9 ++
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ltc4286.c                 | 142 ++++++++++++++++++
 5 files changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

-- 
2.17.1

