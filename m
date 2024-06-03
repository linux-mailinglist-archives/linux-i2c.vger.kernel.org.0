Return-Path: <linux-i2c+bounces-3752-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A20AC8D805F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 12:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF9EB1C21757
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 10:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDFC84D15;
	Mon,  3 Jun 2024 10:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="UDt72DqO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2105.outbound.protection.outlook.com [40.92.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C01684A52;
	Mon,  3 Jun 2024 10:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717412019; cv=fail; b=YsW7ds5jFytTbKZbPfbOrYV8ULG0YiiISMxOPZVds9KZUxRI/mKU0vDx4Nubt09QMkZxVAM9Pxym1hXoF2YEoC/wr4YNFm7I9sPyuZnkHaxpvA9fe6TZWuUOi+6N5+jnaYb4gJbI+fKEviLhRTU4z7PZ6JGHQUDggdP78O5NO6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717412019; c=relaxed/simple;
	bh=gKAQy4eyQToSJVkahniDel+kP5XuF7Cg1aVdVSWs3Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=M87KdKpsbsWktLdJh6hWLocPJ8ct/1NS2CbRWquJY+H3A7gw9ZdC0rTOq3VVJb7Xp0tIH5HaeegFgxqLudFPL1wtm1RAJY7YEjlEP2Q39Gsj2WZ0h5NQOucyCukrsl8yoaUx72m++X67/ug5wC1RYR7BGQ7LfeFTZ8+rzKW3/wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=UDt72DqO; arc=fail smtp.client-ip=40.92.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jb8GBbuZbmwq/4P2Vhrh2I5aWtpkloJK3VOp+MMs97V3QJi8TD9uKQY6dvu10frtbmwIJOwUKPTwxqtB9xk/CkdjTkrjy7Bc6k+wNqTE+M1F7HFR5DZzjZZSaCv2hD1plnn8WTAxapQn4eG+SWpx4eC6Q4BLIj+dHLEWmyJCiWSEELdZxESMLBw47cbsRvi5+YAYtDnvmrCehgU2pbWlMnuCOmziWRpvgWsR1DbYCUvOju5pqCFpg8cSKKbxP7B8t71YlSqLnn5b0ddEkfEjTbSYEWsnaMCYKtLjm9qItRi9nTWqat36vWNROYTmF3i/2KjWzBFNueoC7FoGOeW6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJ8Ro3dufx/9Dpeqm4zoVoQIl2AUK+MN/JAXgu9+2iQ=;
 b=AWe7yjySs0/ecSQfsEwVrH9DUUOb/pYhnGW13c8G0njp8mx8eOYk3sASkS88aoquMMz0Oc1T+QTDgRSkyt65h0GY7eTPTzvoGlTERymuuK8PP+iBvqaKnkpHLUI0uVJFDm34YceGrice7LzObAiI8Ifx6YCXXv+ZDTub+kkuXZIXFrHNJ4C0svxI4YYYAA40IBM9JbzPIWNjUSrl95AxmgiNQ8qP1VU7IarXsjW8qn/EsmNsUJEjnYhYOopoQAE4S2UomCmLMakvkSk7JUhNJSbkyWyPqsjzrWOWL6b/Xx5aJ1KrHrdgkUwnr4dx74c4kDPvN5ULxdt30ARxc1GwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJ8Ro3dufx/9Dpeqm4zoVoQIl2AUK+MN/JAXgu9+2iQ=;
 b=UDt72DqODIGWRfokEQIagep3T0BDoqUVv0dHgzmI3UV8UrjfGWgxjKyr9GYiHpXFPEw24q7khWVDFYCLYWX3RLsItgwWqvdtmK4P21iU8DROj+q2U3NX7nplpxn8GlzZeqz9vAcMYIsLUCCHlCMczea9bra07GDjAwsxT7pgTcpnObPYryNfq22+YhkZyvbohp9BjRWveBv4uloJHMamYRGSa0rZW1h4+rK1NdhnMImW6qBIw9JzOrfwFedTmmgj4qbCfXemsnW8ftu3+a/RDD7UIk4ckSZ6ZUIufUIY69dHCaBv+WlHF36JHBo+VqJbr0qOxjerBZjLa0qW8pLDmA==
Received: from KL1PR0401MB6491.apcprd04.prod.outlook.com
 (2603:1096:820:b9::14) by TYSPR04MB7967.apcprd04.prod.outlook.com
 (2603:1096:405:88::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 10:53:31 +0000
Received: from KL1PR0401MB6491.apcprd04.prod.outlook.com
 ([fe80::d4b1:6b60:841e:2190]) by KL1PR0401MB6491.apcprd04.prod.outlook.com
 ([fe80::d4b1:6b60:841e:2190%5]) with mapi id 15.20.7611.025; Mon, 3 Jun 2024
 10:53:30 +0000
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
	luca.ceresoli@bootlin.com,
	chou.cosmo@gmail.com,
	bhelgaas@google.com,
	lukas@wunner.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Noah Wang <noahwang.wang@outlook.com>
Subject: [v4,0/2] hwmon: Add support for MPS mp2891 chip
Date: Mon,  3 Jun 2024 18:53:04 +0800
Message-ID:
 <KL1PR0401MB649116238A245597849D9269FAFF2@KL1PR0401MB6491.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [FL7V6KzVqSvl31S5/eMOd6FvxmabfdnU]
X-ClientProxiedBy: TYXPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:403:a::14) To KL1PR0401MB6491.apcprd04.prod.outlook.com
 (2603:1096:820:b9::14)
X-Microsoft-Original-Message-ID:
 <20240603105306.180874-1-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0401MB6491:EE_|TYSPR04MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bc112f-cde4-4841-4714-08dc83bb672f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	aA7uRGlvubx/EqfzQpGABIYiPT2CZIWJdnxkwrtUP46jNgccIFC3HOYxbLAxb3YXHP4BYAZXY3RyGz7IOwlNaLTSfjxFoaI4QQsrAuUUVAJEyybu1bEx3FV4poBsFtO5k/YGR//w9BgPdxBbNZQTQPbBKdKnrNlnizkPULn/4Jn/d6s2H0C1olvxbr0Xm2tcPb7YZ2ZoQVqCQeZY0/3+1yF+ZxmecehV2GI21iY+KI9pLDG7cLtO/EFg83NTitfY3eSZJvptUyGGU6u4gRp39VZVNONvJJ3ifx9gIosBnxwZUVx61zovUeWJNjr9M3XjP4fo3UeD3Qbt/BxiCi0MOWTz96HbiLSX+xAKg9N1wKBM4/l7zrb1SybvtNUNP4fevsWBZyIjhj+G5tkINFciRlFSnCEL4Iaakzq0wxqnUjvh7TcdTY2jE/vOkvjU2j2DjBC8Yevck1WfLzvHpsVltNK90J7ATbJfRiIKKM6CQuqtRiFHcbfnPGjG3nKEwAaZWDHDiX0KR6nTHDVmcQg7NLA5qJFmmEorWPO4PPKJEeCBdaglzxqNJ/aYSWCT+11Y1BM6zhwzxNFIUfd+VrTuayRbYVoo+uSd44xp37seMERiw6xRCwkHJjS92SuYhhjz
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jscMfqrdsJ4UzLB2Yc39b9rojisGNF2TP7HbZ9xd5AReWj/Ongf1BpPm0nMB?=
 =?us-ascii?Q?hkRY1su/iRFeO+qVJeRfQwhh3TAFTCcPAHcpEe/RSO/TL6OCEgSo6UikDA4m?=
 =?us-ascii?Q?rSFLPsxYN7MY8khVSymtMFOOOKPbuY0P4aCYwv94aAiFyQUCaCHBXbWsHA7x?=
 =?us-ascii?Q?2o88EPJDgN7yBpQUdvVv8dKvbAaydNk9+QggwxNbhlBag8F+lsdTNChdEzY8?=
 =?us-ascii?Q?0M2jUXmYUvPxgOcR0cLlPLGdRpYd06drNCey4HFwaKQkmrE3NbP8hFVeghCp?=
 =?us-ascii?Q?OQbWgK48epedZPMsjJWt2cYV2p0f0wJLHDvHSjf0Rg2faWAvfw96M9Q6TPwI?=
 =?us-ascii?Q?+ktWTqT5r+TmE800YpS4YEuSUpB7DJVVFXA/a/x9qIyqNJ1d7WPA2rJeKZg4?=
 =?us-ascii?Q?CpiuZJEnXG7gsA8Ru0kUPV8SU6eRvkAFLwTTlJ1RNB25cm7jRVho82QCD8pu?=
 =?us-ascii?Q?7nZJ0bJfPkwTYrgJ5tGDHQwWG59vo3yuloNJhg/iO9VU+v3KKn8b282mclC2?=
 =?us-ascii?Q?GcIt/sAZw4azPvhMOn30yZeWydqPgro6DecL8tBm53NoofxicYXgCy3oifYz?=
 =?us-ascii?Q?Ndd/8IUj8/+rKgkSe+1aIAPGNJKdozCd4F5geW6fEhlxNTVn7Nlj9Kkk1ctf?=
 =?us-ascii?Q?YBLGXV7Rcv3TR2+5F90gMzXtlwJwMpzg9qt+/GwpN+SY2NHNxDVVSyS8UH3u?=
 =?us-ascii?Q?elg+Jh/LufSr2mr0GP0MvKkEOeWA0Fc/M6vXsbdGPbIrD6baT0uALiR9on9i?=
 =?us-ascii?Q?mnyvl9JiYEV3bKGlE6Kd9owIMg3Ny9PYItUALz6IbZm9GPdL6/WkYVqBsqDG?=
 =?us-ascii?Q?pXbPhjqQLY9Zi6hNUxNp0uPs/HGLSHCaz6Rh7KtJuy5wxc2yow4spqSvG2B4?=
 =?us-ascii?Q?+c22MxE4H1/oCSq/dzunoHKhI/gMSrMyzAZlkmJfDPGb+dAxRz5gGrXG8z3E?=
 =?us-ascii?Q?dJtJnPIDBqd4/AzCpeGLbQHF8YxHLe5a4fuhWGIqWQdHL0QGssD/Jk3j/NhR?=
 =?us-ascii?Q?YYvqAL0OxeV+3XfE6e3yVHznDwxeqbtRrgdWMEs58bo/VJYx1OX9aGCCQLly?=
 =?us-ascii?Q?jqtwuxd6HFMtxuytwQWXJpDN7Rvy+XcXaocYasecCAw8vibjuGQcY4STCebQ?=
 =?us-ascii?Q?1NdgJF6gBf1hWEM1fsLu6+jKZBKJlm5+TSIqxdWBofQZr8CtFf0t4WhFLMXM?=
 =?us-ascii?Q?xPi1Z2PesaBfcddje+GTejeDUNBv88vINQ8w+QD3GUMP7MkK6wZiEzqdWcEl?=
 =?us-ascii?Q?WAbsFRP4NrTwFSu3zaNX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bc112f-cde4-4841-4714-08dc83bb672f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6491.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 10:53:30.0777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7967

Add mp2891 driver in hwmon and add dt-bindings for it.

Noah Wang (2):
  dt-bindings: hwmon: Add MPS mp2891
  hwmon: add MP2891 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp2891.rst                | 179 ++++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp2891.c                  | 603 ++++++++++++++++++
 7 files changed, 802 insertions(+)
 create mode 100644 Documentation/hwmon/mp2891.rst
 create mode 100644 drivers/hwmon/pmbus/mp2891.c

-- 
2.25.1


