Return-Path: <linux-i2c+bounces-362-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B77F2505
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 06:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04A631C216C8
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 05:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A672717752;
	Tue, 21 Nov 2023 05:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="WjE+pQhm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2048.outbound.protection.outlook.com [40.107.117.48])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A61FC8;
	Mon, 20 Nov 2023 21:08:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzomnzXK4s9lpUve09wNixiYUs+Rfrds0w9KSUW5gRvMIagCKQyDhZMUDQew77+f4o7yXnmU2Tef44kFfeAaum7DEtCQOrVGo5G+rd9c4Jru1Xt2oWNIF5fgVTbvMzkxfCYirbifATEHNHZZjYkpEF+83Mhan5qJhaUrdiTBSxo6vfUsArQ5kStN1JwTBXU6YPSdYVI0xVa940ISHa8mZHWCdrOdxt6zIl1DrM8QuaeRTZeatSIb2N/nDQi+kEFh2B25SNlNvkHbs5P9Zj+MgOFGF8KZ+o2Kd077aL8/+ujkcYB7sAUnqI/8V4oUceAbkEN+jSNTqE9VkMOAhbtU+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cko7gleIL3yeWi8iBsGI1M2Fp3HUUBQnD5dun6i+ZQ=;
 b=eylpOpH+YZpzP1TfWdRFVQhZbFC0E08nR9iqKTMB0LCrTIpQeSe25AunT+gsRe7fw/5Zxj++gCQqr0U6IgtthBc8KjQblDz9pKJaahuBt4Peng8YPkL8iLVIkYHpZUILCf88bSP8goRbnj4LB5gHi2AF2jiXPGOuoweoKwc0q21q3G3spK+uEq3owNClEVLj4Ofv9lYxgyNIzaeRpOVFz6DfVsuwUBnQlEXIdd40FW0xB0DJs4dgSYdt7i17wKcCam5KhL/rDTPBqk7RzTQ4jCYMmn2j0RZGwACLI1dmC5/qhULTGWiyGV7T84XxTnrekDyrr51hpOopvKBD0fmNUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cko7gleIL3yeWi8iBsGI1M2Fp3HUUBQnD5dun6i+ZQ=;
 b=WjE+pQhmWXRImdtxjToYCdYWRmcyCRtRNLUXi4HoMmoibkHFE6M/Zu13AR0Cpp5sJjnvXAiLkcy/oqTRlO74J8QRWK0FQY68EUGMLkHhHzkIlB010AvSgjVYYbN8xWs8FIyqN692vccFEybepyrL0BumDZlfUuap6M45OgC6c+CIRuk7VFbE9kbRDzHQFTkTmVbVEn5rjWX7CbMndvHtLfaG/T6ONBrGepW1y7Gzc121e0RDzRYDb59VDAhlu7XjGCHtUzOoL7f/HlcSzTSdDwe+ZkHgPLxQPEmou2jUtqNbTC7TpnLa+yd4JO38KCgRc38+DBNhOfXf7D3ENWl6Cg==
Received: from SG2PR01CA0109.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::13) by PUZPR04MB6158.apcprd04.prod.outlook.com
 (2603:1096:301:e5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 05:08:02 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:40:cafe::de) by SG2PR01CA0109.outlook.office365.com
 (2603:1096:4:40::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 05:08:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server id 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023
 05:07:59 +0000
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
Subject: [PATCH v6 0/2] LTC4286 and LTC4287 driver support
Date: Tue, 21 Nov 2023 13:07:53 +0800
Message-Id: <20231121050757.2108786-1-Delphine_CC_Chiu@Wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|PUZPR04MB6158:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7fb05eb8-fe48-47c8-dca5-08dbea4fd583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SX/XLj9qesGDMn+iXa7Xd8rWK0PkMBnJDPH34dW+3cWHnkh88jTRuuVfqmDOqlnsEP7TbceeZAi6MVBayyb/X2m6BvNCgBraJgmJUUSgVokMH3JeCDZxSqqyHm6H4fQiDAKX4LpmP3BuY1GtZCjkLTY0hjFnsw/aPKbpY643VMbo51A9iW4YvS/sVYUpOM3meMa/yqSIusvrQ0zbOoxvPqx2zXk2YXL+OD3hl39wppNDF22bhBF1Ma9lNvZ9kqUIlcsWhm1yAY41/gcqGmQtFtNmPWogOdyVFKQteE2IWHj0uz6Twv5+AD5l+ngwVriVWIJATKLf7NFG7jjpEW93gNKl/FQztDgLqkXP9TeQEO64eFoOpiNgb+xOCF59JvE+JtSRdxNFhTB4I2+ziJb7E97NJvapz/PiCNkyfrj4TLvWUsvgEtoWqdOYgj1d2tZa8R6wa/FRIWCH4bN41TYM3MRpUxE/23tup5+Jn5xylDXS98zkSjg6Vhl40vW0kyqh/E/Mu05MfbTUGC17dU2jEQ58Q3DoDr/wDMIS4AmdqItp4x8mFq7ILpMM1TTvyH5xzMki9BeSylXw8dwOOQ0HTntYpsKF2Ulijl2n9hINvCJPiUyXUfRNQBsA79tanXOGQyS5Dt6+ZTnl3hQ5COzhXwTWkVVTzh+wlr2pj8tIr1U38VYnOX7wd70IJfQsbLZtrPXVflvVwe9WVQuJDB3gFQ==
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(82310400011)(46966006)(36840700001)(2906002)(4744005)(7416002)(5660300002)(4326008)(8936002)(8676002)(36860700001)(9316004)(82740400003)(86362001)(36756003)(41300700001)(81166007)(356005)(54906003)(36736006)(70586007)(70206006)(478600001)(6916009)(316002)(40480700001)(1076003)(956004)(336012)(26005)(2616005)(6486002)(47076005)(6666004)(6506007)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 05:07:59.9186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb05eb8-fe48-47c8-dca5-08dbea4fd583
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6158

v6 - Add LTC4286 and LTC4287 binding document
   - Add LTC4286 and LTC4287 driver

Delphine CC Chiu (2):
  dt-bindings: hwmon: Add lltc ltc4286 driver bindings
  hwmon: pmbus: Add ltc4286 driver

 .../bindings/hwmon/lltc,ltc4286.yaml          |  50 +++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/ltc4286.rst               |  95 +++++++++
 MAINTAINERS                                   |  10 +
 drivers/hwmon/pmbus/Kconfig                   |  10 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ltc4286.c                 | 183 ++++++++++++++++++
 7 files changed, 350 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

-- 
2.25.1


