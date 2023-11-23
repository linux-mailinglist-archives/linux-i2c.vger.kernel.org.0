Return-Path: <linux-i2c+bounces-391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBD27F561F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 02:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D3D21C20C37
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 01:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70076440F;
	Thu, 23 Nov 2023 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="a9oJ6nNX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2064.outbound.protection.outlook.com [40.107.255.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8B0D47;
	Wed, 22 Nov 2023 17:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmSAGzoJteGcgbphwPjgvLdRAWfnGsQMD6anJzeTyWSo/3EIktC0dexJeZ5DNF1uWu4hYkwfdQ+PdsYThVeN3zWKc32vUJ3TONwIH7oRA+2ZpOOS8l+aoNtSq+Da37dC7uRK0R4ZKIT+QoWo4TOWp2eJIcvBPcd2Gkufz4gBvTBeZPhxpoRquTdbSXBFuu9rfsZdY1Dd2jZWMnaoS9UXDIp2t+tWc5o3p28+HcZL6xxvDFUmnAb/4EPdxDdF56shShf+tTa/KTODdnG9TDWsbS6wBQNWoRn0Wb7TGvYjmvw5pbIX4rhvNV2rMiDZV2p59+NQDow7yj23WTlnYWSbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqH/J1E4IbFLbTKPNjTOOEzyOKwo7GtTjZHamSGdTPQ=;
 b=RPLQEWd2FKDv79PIvJHqfhFjVZkmxoO40wyhbA/uu5EDvKyad9cdoCjtWRUkLDpGt+a9npHwv7PeyO3qHlpFkX1fPRoy2lDPnAgYjMTAT4OiyS3ZYdxRCtA2ex+m+BhteV3QT3a4gxzzHmak7XDM5Y1RII/9wnaErJlchufgIFJzV/rjK/yZdkwncj13xcaq/jgNLuzMar3UsZNmyV+gb+1srZJ7JgY55dqHu2mS+d50r/XCs4Ip/diF8qXtWxYPsEyCuVi6LT9wejY2W9Sy92kHRdexDwpnX4oBK1zoUyTJe+kWkuWGZrXtVa9gbYMmMdElILnSvTCY8uo+9EheEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqH/J1E4IbFLbTKPNjTOOEzyOKwo7GtTjZHamSGdTPQ=;
 b=a9oJ6nNXuIUmbuTAgWVEePB1/ZxxELn0XFlRcFfZkUb5ocpw+G19zGoSEdg2ToVXYFtMuPWCd3tiYRZvjxplgPG3dQFug5cMOUuowVmafMiQcXs4uhxo6yMQfS5Bn4QTbFsMpnEeXhHn/sS9p/n/xlHbIP1Dbmh/RQmPNPgURCWSOTp5jQITNbrtv3L6/yP0MaT52j4IGKwBwMdd53cgE9nFTrvG0laHyiIpSw+ctHWYOypvdMN4TdvTw/3902njgHbcL66QXPlqDz74+iVFwkL1H8fX4ODO22Dw1Qinnma1+PVMdYo8YaIh6F+lnAaDQEDLwwlNU5Wd3MTc2QqItw==
Received: from SG2PR02CA0024.apcprd02.prod.outlook.com (2603:1096:3:17::36) by
 SG2PR04MB5819.apcprd04.prod.outlook.com (2603:1096:4:1df::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.18; Thu, 23 Nov 2023 01:54:45 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:3:17:cafe::7b) by SG2PR02CA0024.outlook.office365.com
 (2603:1096:3:17::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Thu, 23 Nov 2023 01:54:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7025.12 via Frontend Transport; Thu, 23 Nov 2023
 01:54:43 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: patrick@stwcx.xyz
Cc: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 0/2] LTC4286 and LTC4287 driver support
Date: Thu, 23 Nov 2023 09:54:35 +0800
Message-Id: <20231123015440.199822-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SG2PR04MB5819:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b7d5d59c-6b55-42fb-2fb0-08dbebc72a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x0RH6nYeMvxrfcocIXrIshSWguK3Wh3byVKqpl/LvQTEd2auz4T+bYxEYEZ8/Tzv8+q2e/NhJ/++4GzpksR7R3n2HG8vzO96GSt7E+iH6fluZIPDGu7mHtfsRdh2b4RUT9+4kGfT0PdrV1f7bweChCDUkJ1BlfkiVNwoEWovMD+WkLgTy0ZYXSVsted3CnWgNW0S0BN7XgHlty5gI67chl6aEoBxvvOYN75VVg5q7GYJSviM21feInii51feTvwraCLCZHhRb9+numWjaXUfVpQlijmSjkpBlkPKh1+CK+5Lrv1vd/VScqym+BWEhdbfZFEGNfjfYB0NyMj3YL5epuEb4rI8j0TN4mY7RAk12+ifxYBJdRRAvQHMTS9ykhjnpQ2xdmQxb5N5yfe60J3FOAJ2deN7/sKfBAh5fY6Z+o2+ohbIs+UXEh/mQPoa+u0hVn4RuASB6GVliWTNv8iqkxjDEcW9/b7h/Kfu8vfgr3N7ssmu0aP7grqWdnaUNDu+FAm+OKSCeO3XcH1kcOuy49U87oczs678cPsh4uD9IRMsx9gwAP3N18iLTZBqNJBpnIrDo65xKX3YzSduFA6A7e59qHD0HJjYYRcIxuAJ664T94m0iTRFSdvBK1TRi2eYj+BsYGpTj4Qpn+sbkWdkaDuYFfWckmDDRO/rp6r63Zpiu7ukFNe+sQPoMg7MllIb3SUQEHijRv04uMhjfqnloQ==
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799012)(46966006)(36840700001)(1076003)(36860700001)(26005)(336012)(956004)(2616005)(6666004)(6506007)(478600001)(6512007)(7416002)(8676002)(47076005)(4326008)(8936002)(41300700001)(2906002)(5660300002)(6486002)(4744005)(316002)(6916009)(54906003)(70586007)(36736006)(70206006)(9316004)(86362001)(81166007)(82740400003)(36756003)(356005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 01:54:43.2068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d5d59c-6b55-42fb-2fb0-08dbebc72a27
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB5819

v7 - Add LTC4286 and LTC4287 binding document
   - Add LTC4286 and LTC4287 driver

Delphine CC Chiu (2):
  dt-bindings: hwmon: Add lltc ltc4286 driver bindings
  hwmon: pmbus: Add ltc4286 driver

 .../bindings/hwmon/lltc,ltc4286.yaml          |  50 +++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/ltc4286.rst               |  95 ++++++++++
 MAINTAINERS                                   |  10 +
 drivers/hwmon/pmbus/Kconfig                   |  10 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ltc4286.c                 | 176 ++++++++++++++++++
 7 files changed, 343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

-- 
2.25.1


