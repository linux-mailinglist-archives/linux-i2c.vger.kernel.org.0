Return-Path: <linux-i2c+bounces-3966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E43903871
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 12:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB61F1C2363B
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 10:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F4B178375;
	Tue, 11 Jun 2024 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qTC4hI/i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2098.outbound.protection.outlook.com [40.92.107.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F6BE57E;
	Tue, 11 Jun 2024 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.107.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718100630; cv=fail; b=P1NixjZHgeDdRbAJY/iMwv2xFBqp/24+8P19gV/Y8+fbBuT2A3X58pHl2UDOnVlTlZ35ctVHDr+Ey2Ct/jo6XEN+4OfhF0sct6qmB2qg+viMKbCy3cFkILxzvlEKFKFpZnrr4LorrD88a/fqjsGNY0o+lPmjNynrODcF5YGvAN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718100630; c=relaxed/simple;
	bh=v3z+yl0/8RG/qR+fpQ53KEXYcUF0MZT14FPj2D9chLI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hEPqQxiq+zWuucdbq57M/7QseZIgvfT2RMX838sFBc7zsfl0gTNwE7DtHsI5r2M32WrVBZTVMDR/LfRfS7SPGhuC8bySvF8395XdACKbf8uAxdNDmU+9EyQST9c6p8Df3G5VWiOmwChlmwnIpOWGNZuomD2fgzXPpMSbu48cZv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qTC4hI/i; arc=fail smtp.client-ip=40.92.107.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkPaSjM0gVMUIu8jcO6qMWjps6mvvm2TcrqYXKAi5FBEhHL9doHdIxEmkJ/Op5evsURCTQufabJ9P0q9l3WZjdlEcGaHIgjz+NwIzCqfDc/I5ZzYJ6o9/cTyIOl1TSlflEtOLsh3Gn7/C2TgDJjmRyUM/QT+v3C3KfcqBX+kzIObUgWf0UFZgdAt62PzaJxszy7NjgXVGzHK064zQ7HVQOe2Cy1r/RZXNHiFh3XdTUODqPfmT0tzZdI5o1HcWoq34Drn0HzBWB14wKlqSmxQ0KpROwzPVzLfOagtKLZj6Q2Px0yeGE2XTtRhY4HH0OnoE4jQ7Mch/xWhZhkTlXQKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlTC0MmEqUPF1Xw7+pgYaDiwDi/HOhKbMMZyttZyx7Y=;
 b=gIc3Xf0sEUlUKACgqezcKQha7YtIPV+WrqWYuOgXYo2Ko7duJho5l4ocBnzZlqjbg55pT5cxpOArA7yX8dayIbFUyfAP4SjGfG5K2LVFKQGBL8jzBGMSgODPROCwf5wMrhfTb6KU7lQy8hYriAPlvD18j/RnDHEXa/STqs/HPDcyAhF3N+PfsggRX3oCZmCpj8c+MyJxq63B7FbfsqamuU6RuXV9bE1Qjz+qeIsMeipywkI23QgoVrm+2nrjgSGI7HS5eTnG9sgsipAvfC+Rq+/kpYxGSpKmzOvzNfR9gV8PbQoLwipGhIWcKKipak5vOdNNuJxMqppt9PkEUaz0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlTC0MmEqUPF1Xw7+pgYaDiwDi/HOhKbMMZyttZyx7Y=;
 b=qTC4hI/imiXwyZTOu9tqDmlHY3RL1QNi5MLfWWWGWfFZM4oRkukjvSh4ty63/PUnRMTKUTanAYb2o9/IJKOFPaQTmAyoU3iMFx1LnXvYaOmiwnbZvmeKJZXMOMIUjyYPwXcDE5e7nxdbyniyt4yw8kJ1oeoNqz18Vu28vVTVLJnWcuMws0emcxuhc0+xGEVA0NTrJtcmHugu70B0Z8d8VrcoLvtw9/qT/cocXVifu5VOua5ztF8vIWcs3+MxPcQxZfS50dJwHy9xkrLTs2nvmw4cP1X66Oe88dSXkJ9T0aHtI2VNrf0Y0eHS8KNGmtlMwE3jYj5B/lt9aFSWE1cAKA==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by TY0PR04MB6255.apcprd04.prod.outlook.com (2603:1096:400:328::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:10:23 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 10:10:17 +0000
From: Noah Wang <noahwang.wang@outlook.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	linux@roeck-us.net,
	conor+dt@kernel.org,
	jdelvare@suse.com
Cc: corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	peteryin.openbmc@gmail.com,
	javier.carrasco.cruz@gmail.com,
	patrick.rudolph@9elements.com,
	bhelgaas@google.com,
	lukas@wunner.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Noah Wang <noahwang.wang@outlook.com>
Subject: [PATCH v2 0/4] hwmon: Add support for MPS mp2993,mp9941 chip
Date: Tue, 11 Jun 2024 18:09:59 +0800
Message-ID:
 <SEYPR04MB6482721F71C0527767A149DEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [jcbAmZ4/zojxLzvi+3QccIyef+OQScRm]
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240611101000.75593-1-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|TY0PR04MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 567e8d97-381b-4fc3-21b0-08dc89feb128
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	3ZOxf9RFatiexFt+A7dZ4H6O3PFOm6aQtJM9iiLq9R/NoXKT46epW+KrCy7Re1zANK36dby5w7rRTAr7y4x5dLN8pO6vPY92NP474dN1/bjnOcpic7wA9i9oFKAgWKNGwyw97pw8S473d9Q7L3TCTG3N9Rgu2wE34yFN/+lRuMHPHh7E9mr+DOcIB5Wj/lgkDqeCr/TqgGC/yTDBJGG2eIF4/XQeF4bBLB9JGC2v40FXfQ+4+rgGdTc2McBXaCUHqRQzwcBHBgiv9rfA5IZqotAP/4E5UYGWN5T/6ebmAhiasSh0CsTb60f3bZ+7u7RdydtijPsZbKZghAxHyA3paNbDVBO1ThuA/yNLb5PcoJn7lk3YOjViA+u8salko7wA6Pm14cf7iBu2VqHBqqecmsgyr4T4MdpeLPRiEdpuoklzKKZ+DuhW3XDOTsA1l+AHEDxzLJcUqcFPlJeTanjaN/1lEr5picdbx7zagZLmGCToKnpCeaFhP4fK7SK529W5tqs3y8b3H1YJyR/qoBbrMzkGKO4NJ8UziyJ0ZL4+ykA2bWL/cL+if84AwdmDu7EGyH+oYuvwvQLhTEWoJd1Y0fcrD9NqAfwazM8lsluYwFomstOrpcXsAnuhQ0sVtL11
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?thNI4O4cn1BtMay3ORTbOyZ3QbidVSWBfRT5SZEH1hGTAZZHxyA8OEx7srjc?=
 =?us-ascii?Q?pqYjSeEMcHUymI4lXKb6P37D8fS7+h76/YEfBZnRGFX/Je2rUqMoXH2+o420?=
 =?us-ascii?Q?SswD/8Yg71dtPPU/EzCzDOjW2qqkrb8zcvzN4l5JDBYMuAq2eu7P5qo1j8Zq?=
 =?us-ascii?Q?l89eMSm0vm8Uu398HIsOwUwufuDQehLL4SZIVXA7vqOCRWseqkPvPfF2xtLf?=
 =?us-ascii?Q?X7jPkPsuEeRDmBQCIKbroXdrHHNBvpPpiC0dHjagOLIjmT1Xy4Cu8eF0zHU+?=
 =?us-ascii?Q?vUkd2lvTzSgEwyLCZtGtkoJOnJ/76w6xa0lbZiewmhrGnmofYwYNd2XQ6HmZ?=
 =?us-ascii?Q?23foKKLUO3z3wqLHLTGBqmdFMsAhDNdSQ4lJdTHNkD/8wAXekybGIhgLyeFl?=
 =?us-ascii?Q?i4DZe0dNmQG1xU+qVm1uUxM++SyNzLlJ807DXI3PSE3qmn+TjCmK7PlRyc2Y?=
 =?us-ascii?Q?oojMrKkB0gkZryN/e3JzB6aWT0XSB2T3wBYnRYv7vU+FpttNjFXYA406odwx?=
 =?us-ascii?Q?DIkm99G0XmQJWaQnSTpPKERmpJpdVnEfN5MrLEYpw64Qa2gvHLyCTLSHUlBh?=
 =?us-ascii?Q?A/miJFF0P2XMBenEtXsgTDs6+QtP04mEoXkzNUSsAvnJRBojeABLQ+dXI4+0?=
 =?us-ascii?Q?afjwkPLT1boq2+2oGCURzms1xDW3g615t+dwXa8yG7WcmWunWsi8hpJtwt0I?=
 =?us-ascii?Q?0BFvgpnvsXvtvTFtzb2GGBxSALst+2ms4+ZbMhSoq+Ebv0aT4/ZZj5Jy+YJ1?=
 =?us-ascii?Q?ugDXbhVXHwZVEQCM7ClqjJVnj9ftJLkzgwkwuqjUgMNDz+X9251g/KwyG0t0?=
 =?us-ascii?Q?BWaOeNj8HTEWOYxm2tz1gSemOi5fQyzgkZX5Ri3GpY/eDVETgrcwOyGeLccn?=
 =?us-ascii?Q?8c+3mLIYM+qPqYRFoH5zaKO4jTKMk08v9wXowAP5Qr2H5BToXCubvkd3RNmP?=
 =?us-ascii?Q?40kmqET3KC7aYQZIXBlkSBCWzWM/QOXZuQdUBxv0JIzwAtogsJSzeK6LtPOV?=
 =?us-ascii?Q?dkd9MwZTvd158iffFIWObui0fWBN+vTfTpoxQIeGIGd8mf1w7uwyQ7jy8sDy?=
 =?us-ascii?Q?OhNb2fGJrLHM3J0rRux4f1GTOJGUCDr0zy5PCuESxo/H1i3jLHdX9wcfLdx9?=
 =?us-ascii?Q?Av2AKSQltK5JbZzjY5lVhfkRk8obd6SIZY60dcktY9XAyEQEBcr5EUWQbRFh?=
 =?us-ascii?Q?VjJNlnwrB6Z6AzrQuNAT2XfI/OpO4ev3DVql+PEa+AJe9m6DYiyCPlceJkd8?=
 =?us-ascii?Q?9w6SGuz4Lr/Bb4CuBJ46?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567e8d97-381b-4fc3-21b0-08dc89feb128
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 10:10:17.0722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6255

Add mp2993,mp9941 driver in hwmon and add dt-bindings for them.

v1 -> v2:
    1. add Krzysztof's Acked-by
    2. remove useless code in mp2993.c and mp9941.c

Noah Wang (4):
  dt-bindings: hwmon: Add MPS mp2993
  hwmon: add MP2993 driver
  dt-bindings: hwmon: Add MPS mp9941
  hwmon: add MP9941 driver

 .../devicetree/bindings/trivial-devices.yaml  |   4 +
 Documentation/hwmon/index.rst                 |   2 +
 Documentation/hwmon/mp2993.rst                | 150 +++++++++
 Documentation/hwmon/mp9941.rst                |  92 +++++
 MAINTAINERS                                   |  14 +
 drivers/hwmon/pmbus/Kconfig                   |  18 +
 drivers/hwmon/pmbus/Makefile                  |   2 +
 drivers/hwmon/pmbus/mp2993.c                  | 261 ++++++++++++++
 drivers/hwmon/pmbus/mp9941.c                  | 317 ++++++++++++++++++
 9 files changed, 860 insertions(+)
 create mode 100644 Documentation/hwmon/mp2993.rst
 create mode 100644 Documentation/hwmon/mp9941.rst
 create mode 100644 drivers/hwmon/pmbus/mp2993.c
 create mode 100644 drivers/hwmon/pmbus/mp9941.c

-- 
2.25.1


