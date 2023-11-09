Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6165E7E61DB
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 02:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbjKIBuB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 20:50:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjKIBuA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 20:50:00 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2077.outbound.protection.outlook.com [40.107.215.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1E825BB;
        Wed,  8 Nov 2023 17:49:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbaWEIoCh/qRwwcLUP4xvgpU9RLuPkdkC5dOc/pLeZ+sYhiOofMvwHg8aaH8QgybHlgKoH0eC42ZdU1YVNLVvE//kKGhCXfyby73AQtvnLEViaZgPjFp96+qjUHzAs+XO2hRGLm/I+OKkWWGG/6UkYGrmdi1lXpXVCqTgnrSy1QEr6KdKnBbOBqiaXw0vMZnAGEfQz+P8D2jQuKOIwi+LJuKCYSUCYdS07wQc5N7YXQvNMBC62Q3l0KVt9PmasaJqGyRXI1VnvPmRLpOQ8jM+F2zZ4jivr0Zm4RUDPUwGulGDvm0hKRdzAe/PoYUJiG97xqIhvE8tFXdl+Vnqc1XLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2pRIdWBF5flFg4ac2FXqX+9BfXpv1nBuypFYcAi2iQ=;
 b=nYNHheWKTUlhDq13u5L0SFkvRp3wZD/xcrey/2Xu36KgEgW/S8uoXB2utDHLh1RDYujfwXheePLfYhaggVFhmIgQPP+DnIiiMnLD0MT+Nb+IIc++ljyy5u0LG4NkHsEHLz3UxjMMyV0WkpKPCn8ucGp1maOWN3SIy/8K0ypCaSFKSmkaTUKONMhDbrHmxGBzzNa+GLEsWoj6rwkWm/nEc83XakObCn+1b/77bDmYMVJZkzrD4NMmrQidMkCcXnt9ouBMOC/Eb4oxQH41AA29KrL829/hTI9IfbG+ITobYWMLDAWKEO4eqA4N9VriCSDhCLRwM1RpD1FouValdVlrZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2pRIdWBF5flFg4ac2FXqX+9BfXpv1nBuypFYcAi2iQ=;
 b=Gn0rEbPIBwObwOUjp8ArIN9PW4QoBgRm5gjlrhR1Y13Uay5EJEtGBgbGixg2YdPvlGYooFt0AhZESvpQahXq7oNgeLxLh0hlRWu25kEDLbDWQKrkHc+hJPgEAHHyyMgyyW1M5PpXjDtiXhfkgoEauHmQmUENS8Mp89wSQGpQ4pX/APF+b5FuPYqASrgGCcAh4cy2gq/vKCPpl0812VIrnXu05HoS+vLSaz9swqM4Mnw3mSnkIdJ2vhjxlpOqQRulhlZr8e4O5ckByI4ux5pZFvGYLUjzix0GkWEslsl9es6ludWkKzxnFo/Ba5oWYIxG4sTMlHkPDuGK7o2WfhmDZQ==
Received: from PS2PR02CA0067.apcprd02.prod.outlook.com (2603:1096:300:5a::31)
 by SG2PR04MB3946.apcprd04.prod.outlook.com (2603:1096:0:e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.27; Thu, 9 Nov 2023 01:49:52 +0000
Received: from HK3PEPF0000021A.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::d8) by PS2PR02CA0067.outlook.office365.com
 (2603:1096:300:5a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Thu, 9 Nov 2023 01:49:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021A.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server id 15.20.6977.18 via Frontend Transport; Thu, 9 Nov 2023 01:49:51
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
Subject: [PATCH v4 0/2] LTC4286 and LTC4287 driver support
Date:   Thu,  9 Nov 2023 09:49:44 +0800
Message-Id: <20231109014948.2334465-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021A:EE_|SG2PR04MB3946:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7a25bfa2-5877-4da8-45a6-08dbe0c629f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h8fxUJgvnLxBD8KO1zgxMXUfZ3c0PNyLsmfE/VKJdSgfbGg6cEN9b6CVvbyn7+Shqwxl90ImBTGNNXbh+KgGK0fsrmr4WdazXKK57PmvBG6x5SjVOOU0vltr/LHL4xo+v3aff1IxqnnwBRZgE6dTqxKDYxo3t2TVmR1J9yfBiG6gheCqqDF67YyNRJKMTI5+2ledc8K8a3/j78hh/6OVrxe/NTo1Pr7wSIywP2iRnjUg09JMMyOhmgbHRHQ6LZdUFZJmL0usQ3JI1912/qiLp9BK3BTUi7Kp3eA85H4UOVVUczBqxu+vpfDBmgXxyd6SSs8yfCqU/Ml31W593UtHvKNuRHQGqn9y8DEDBgtSjoQVU/rf2j0S9Q+W0CegQY+42RXzwwDPMzr4/KL1ASnVdd1A5hmqCKhWXqWC7ebzUYj6vCyfUQ+quo49pKwVbI2FTl6JHto1kZrS/vL9c+C39A5ow4/CO9wQap+STpW7DQZaWbSY6BS7hhA7nTatg2ofwEtgjacDKWqAxhw7gOBPulcTkaDzFnJRSkw9HiPAFyFFXXrccwnBt162HSgRXALu0FjdFmyNyJ1w4M0/ENMcEmwKr9Y4s4lSC1bNFjkh4CKGyW5xCTs2R5NkgbWZWA0RTN+lgZWkUspAlagSHywrZi4enhci3jvIYrFv4KC9xlVBLTCWBw5nVtsKfYsW5OcSvAjnW3W+fxaRBFAUGkSDuw==
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(451199024)(82310400011)(64100799003)(1800799009)(186009)(46966006)(36840700001)(6666004)(36860700001)(6506007)(9316004)(356005)(81166007)(47076005)(40480700001)(336012)(6512007)(1076003)(4326008)(5660300002)(2616005)(956004)(36756003)(41300700001)(4744005)(86362001)(8936002)(2906002)(36736006)(70586007)(70206006)(6486002)(6916009)(7416002)(54906003)(316002)(82740400003)(26005)(478600001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 01:49:51.2487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a25bfa2-5877-4da8-45a6-08dbe0c629f5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3946
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v4 - Add LTC4286 and LTC4287 binding document
   - Add LTC4286 and LTC4287 driver

Delphine CC Chiu (2):
  dt-bindings: hwmon: Add lltc ltc4286 driver bindings
  hwmon: pmbus: Add ltc4286 driver

 .../bindings/hwmon/lltc,ltc4286.yaml          |  51 +++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/ltc4286.rst               |  95 ++++++++++
 MAINTAINERS                                   |  10 +
 drivers/hwmon/pmbus/Kconfig                   |  10 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ltc4286.c                 | 177 ++++++++++++++++++
 7 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

-- 
2.25.1

