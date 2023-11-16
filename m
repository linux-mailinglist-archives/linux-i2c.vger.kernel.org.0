Return-Path: <linux-i2c+bounces-186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8337ED985
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 03:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA2D11C209CA
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 02:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F1B2F52;
	Thu, 16 Nov 2023 02:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="rPP/8Pqg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2057.outbound.protection.outlook.com [40.107.255.57])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA4F199;
	Wed, 15 Nov 2023 18:30:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZtwGZJwqELxwVItcQTJF4l+L2OjUT8pYi57u0e2si95W5vo4EfH+hZ4tb35R606KQBwqmgC/aSI1S++5Judq+wIjJ62JB/LqRvHP7KHQLRvXqJy+mxUq81PnSrCLYGh334LE8ATMzr+tlgJbx6gAI2ja4KQIJx4VIqMMx1mDOYxTG6Sg9lV81PTuVoxQanaCi1jXcIjo574zScPLAEO674kvbXcT0uW8o8ZoPpdiuKNAl8I4Q6oFSyYVqK6DsZJJlYV55hGv6CClRMRuLfclDOjKej1mCrlEuAw8wq6Q0L+NFkWFk33klotmlC0nLwsi4F3TPFswqgrYliaG2+bZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDwsTrDmJIq/t7JHJuotqQXIpjuKo2gdW8geUlgyyC4=;
 b=bF0sP9wxOfj8eUDpz1V3zWpvMxsdSv8UP1iAwJf7amIWxeOCaiQpSNjyJjnlVEQATd9e/nbEx6+goAHS5rdBTLt3QFI0hljiUyRulv2iSVdosnVgrqcwHF8anS/L70mVOn+eXud7bxBLCJEZQi42SPeOJU1DooBFxzbfTFGA/R6s2QpN5sYXgf3xB9gs62zXFcCykMNM11k9KCT26ChH9ymAmhxQGd5kSNveVA91/JMD3AUWnz2FrGp0Ckk6ZQE1dPtEuJEKGa+zXQP/3OaaoPDSajrHk2wbo2zrqvP9bUHGHwzsJUi1bVIaDygY+5bP1RCp9kL7hUQU3J7XxuSuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDwsTrDmJIq/t7JHJuotqQXIpjuKo2gdW8geUlgyyC4=;
 b=rPP/8PqgDxfnx189eoCKYeDH8o4gi74NISMNIEbrvNb9Nhd/sokeqLn7A0YueXIWtaSyVCNsPE+kl5Sfk1EjZca9O6dZK3Lh1MZR0pCjF9ubvSDcrYaemWlBBdQZILGgm8yukeWzNn2svR8+2TjRcWpPr7sZQQkOHRdQT1fcQb+O4LofzBWZgRkc6kWYJJXYuKV1oCgXYmuxF9oHNTheMX72Rm9XFB1CsfiFJi+2CESDNiAJ81O7IpjuZPCyP+WX5S72w/Viy8b3y6C7I+QD7QZhRuWpMR9zQwqEXCbsZLPSdoJW1wpLQtT/F4TIpcgWZYSgOxeKBWkOuhp7NntKeA==
Received: from PS2PR02CA0068.apcprd02.prod.outlook.com (2603:1096:300:5a::32)
 by PUZPR04MB6535.apcprd04.prod.outlook.com (2603:1096:301:f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 02:30:32 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:300:5a:cafe::3c) by PS2PR02CA0068.outlook.office365.com
 (2603:1096:300:5a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17 via Frontend
 Transport; Thu, 16 Nov 2023 02:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 02:30:30
 +0000
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
Subject: [PATCH v5 0/2] LTC4286 and LTC4287 driver support
Date: Thu, 16 Nov 2023 10:30:23 +0800
Message-Id: <20231116023027.24855-1-Delphine_CC_Chiu@Wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|PUZPR04MB6535:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 735d1a63-9225-4866-a090-08dbe64c00fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bRkHZkg8EEQhOWRN9skxlu7RvrKnw1mF9mRmWWWx5294LCrWnaGtF0+R1sA7vUN4kIkeGL1oRTd/Dq8pxSm3MXdbGle+NiGlM2Iff49T12ciVsMLgh2CeXaoeI3/woeozEdCGQlkPQd/BJLFzGR7sKGWj2dTaQAiBtc0qC3tGV+I9H2j5zXJmGkI/+IchSBX47pmuBlCyG/HHHS59vf93vGVKv3LRp+6UfAPfQluUN5gJJN7CsmE6Dt+wo6WroJlbRGOkpOiOVXwWHYnHLMeEGVUJ8e5IkOdXViyvUmDmep/tKyg3+INALSJICprrazlHl3zA6txE9xrqud3DTonKe86npEQa25bjjWWabzxuDBEQBPLaLVZUUwGfGjD0SYFIBKQDKNceraSrGK9gsLhLtERpeoEaoufrQfTckNsAWrfZAQBQYxC/a5u1Ep9U/iTP72l4cu9z3dFfHzqn5HUVG9/jlAkUtj6UIbQCBofjzcOwX6qjTqL7MPBO93OPvplX/vP8FuvuUY1f7sFCBsfHg/NlFflRaCTj+CkDpxDXyWnbBbBzUtHqFYRcBnkFcm2IibsanHT3rimuYujOvVTw+/RkiSKd0Ox8ZxMqeegOKlPxawOHnW854IZRbjuN7NR8502yrO10wFfjANJaf+P/cyZGpCRTkbrExLo/CZ5d4FxZP+l1sp5IAmYUQqR0Mqfk95yK7J6Ad+NuRnQWmRqGw==
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(82310400011)(1800799009)(64100799003)(46966006)(36840700001)(356005)(82740400003)(6512007)(81166007)(41300700001)(6666004)(47076005)(6506007)(9316004)(26005)(36860700001)(956004)(1076003)(336012)(2616005)(8676002)(8936002)(4744005)(4326008)(2906002)(36756003)(7416002)(86362001)(5660300002)(70586007)(316002)(70206006)(54906003)(6916009)(40480700001)(36736006)(6486002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 02:30:30.8702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 735d1a63-9225-4866-a090-08dbe64c00fc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6535

v5 - Add LTC4286 and LTC4287 binding document
   - Add LTC4286 and LTC4287 driver

Delphine CC Chiu (2):
  dt-bindings: hwmon: Add lltc ltc4286 driver bindings
  hwmon: pmbus: Add ltc4286 driver

 .../bindings/hwmon/lltc,ltc4286.yaml          |  51 ++++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/ltc4286.rst               |  95 ++++++++++
 MAINTAINERS                                   |  10 ++
 drivers/hwmon/pmbus/Kconfig                   |  10 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ltc4286.c                 | 169 ++++++++++++++++++
 7 files changed, 337 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

-- 
2.25.1


