Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D25EB7D7E33
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 10:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbjJZIPc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 04:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjJZIPb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 04:15:31 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2061.outbound.protection.outlook.com [40.107.117.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A266CE;
        Thu, 26 Oct 2023 01:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBfokeLiZoHOHlwnx3Ig/qtT2QpjyunjByTglqQB0gju0D8XReiJmMINt62JN5O0z28/jvCNt+f7LeaMCg6gJgoRPGmrQ6PZYxZqm3dDnZ+lE8ScF2NMyeJcUlTIcMqTolwX3TtH433ALQ3cn2IzK167seTNFwyqNlnDBjIulFy660PjYWQWiAqe8El9PTDLweJXR8yWHyEq4g+j1bsddWtf6hODDgIbHmyGvqvbsVtEscpQbE/TSk7meh4E7+v5GGHufKjbXd7m7/b+MYRh+yqXuN8wnQXn36USUWH19OCEDtKt3ToD08U1wExWXt8xbtWefrd8mSlJhfX/G0+Gvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41FOP7tGP3V4A+/Xspp259P7cwuIEzHK2Yug8mkoLow=;
 b=UfkrfqJYhR4E5b07W4i8NNdBVBNI9TIN1sdie568mD6CZbrAi8OvePrGCQzzmyWZzN140FDv1hCYZCvtJqs53q1bYDE0yoBDcDmuS01SLwaCUL5GjpzOxys6tIFgm3jleWQUsda9YBVVE6fnhpJW4fowtf2pt4LbIJyT+buJ1VZlnCHbzvv1EekakxZHa92/MnQjc81vnc0JyDIwim0roPN643bMbRfnBdPJRHQrZT04SB9OQ6p9Fewz1hTvYw1WcYgacBzwCq3u3oKRKtnsaPF8yA2bXJxzUPfqhnLfQR+pvYyOU6YHSzEN5cRjO4ZWPqvp5ZlnLEMGdwNytGUNQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41FOP7tGP3V4A+/Xspp259P7cwuIEzHK2Yug8mkoLow=;
 b=X0z3UkgQk5aDHVvNonWgSTStnDOdb30qDXluTFoLV+q4birwFw9LAlicj/KWdckufaG1V2ml6Vf1PZtXvksTZ57A1u7URcvRNeALZRVgxUQ96rvjHkEUrO/vqWvsUwFLHNB3utWOG4yAR37WR9/tw8tQpRUJT+o7PC71ZjX0eYy+NXt1BKrWfrnqQJkrR6AxvMw2msUpSAQREonqnzWCmfRrWTeXG4wTNfCELl3PWS1bNt7M507U7JawYIRVbVwLJwT94jcSIZZRFUwT2/v5osbhG9izs9DXNQvQsJ51YKH3dnPm740hbpSQF+RLdmMXfjNDm3eSmo4clVM9LyRWUA==
Received: from KL1PR0401CA0030.apcprd04.prod.outlook.com (2603:1096:820:e::17)
 by SEZPR04MB6355.apcprd04.prod.outlook.com (2603:1096:101:cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 08:15:20 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:820:e:cafe::d6) by KL1PR0401CA0030.outlook.office365.com
 (2603:1096:820:e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.34 via Frontend
 Transport; Thu, 26 Oct 2023 08:15:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Thu, 26 Oct 2023 08:15:19
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
Subject: [PATCH v2 0/2] LTC4286 and LTC4287 driver support
Date:   Thu, 26 Oct 2023 16:15:10 +0800
Message-Id: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|SEZPR04MB6355:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8de9bb05-959c-4e6d-2250-08dbd5fbb16a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d2L1iVrANtie0MzbUkzvFKTA26EfwqtcYANAaSX5Fp9eTethzuDReTXKNvZL4Nie7L6XmkuOquwJ4tNRVegRjH3NAxSnPWXKAvMHymvXn6gEE3xi+/YYjyPljDwuodwP5hNrU3reVeD+D0iEgEk2B+fg8mz1vNMa1Ctal6EvUj3O/3NxEifuSswQCBHTGosE2q56rUm7ssLI2ysYly3Y4sXzcV3n7lsR+y7zdDHlJ83pY/ihRk7gbDfwMeW5wk3XUmA2NSB4aLdr6R0MJr2l8xgzP+mSoa4z4t+vy0DRtvdpKexZv5nY9bhfo3wKT41c/UNU2gIQAeh9oasShBh2qCsGhmZWNXvDx79FaoEprYl5l2o+7i/CxNFVxczwhdGhw6LKjnOtZe5BjERuddY5d08Ib/5Ez8zJtfUvIkEuZMFY6Z3UZ339WH4/S74bpq+tY6dcPtxxvRszucOELvWvO8qKbkWOaSbAGEbfNRzn/rbeTjUpprlw/jprh89kXuZTK8fVc0kjFEjiSuHI0EmiIT/ByR0sxiXyuvwNMvawHLR/VO25/UPE5dgui0rRkxB/neFTGQmL4aCifFDRLtYcCQITXQnoGbVma+xIFyF4ugNaQEW1JA2ztIJDPMEuZuTWKcXRdmjixBNRzgdW54Pz1jNL1NRbCa4/ZhtduF9EXvZzz4W220Q+sHjtoT2PlP0jYHfrlT4SCmw1MH0Qkr7Anw==
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(376002)(136003)(346002)(396003)(186009)(1800799009)(451199024)(64100799003)(82310400011)(46966006)(36840700001)(40480700001)(6506007)(478600001)(54906003)(2616005)(70586007)(70206006)(956004)(6512007)(1076003)(6666004)(316002)(36756003)(6916009)(86362001)(9316004)(6486002)(47076005)(36860700001)(336012)(81166007)(82740400003)(26005)(356005)(8676002)(8936002)(4326008)(36736006)(7416002)(5660300002)(2906002)(4744005)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 08:15:19.0431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de9bb05-959c-4e6d-2250-08dbd5fbb16a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6355
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v2 - Add LTC4286 and LTC4287 binding document
   - Add LTC4286 and LTC4287 driver

Delphine CC Chiu (2):
  dt-bindings: hwmon: Add lltc ltc4286 driver bindings
  hwmon: pmbus: Add ltc4286 driver

 .../bindings/hwmon/lltc,ltc4286.yaml          |  50 ++++++
 Documentation/hwmon/ltc4286.rst               |  79 +++++++++
 MAINTAINERS                                   |  10 ++
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ltc4286.c                 | 160 ++++++++++++++++++
 6 files changed, 309 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

-- 
2.25.1

