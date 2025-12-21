Return-Path: <linux-i2c+bounces-14663-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD97CD3ED0
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Dec 2025 11:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EA27300BBB3
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Dec 2025 10:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC6E28A701;
	Sun, 21 Dec 2025 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="js6Tiqoz";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="js6Tiqoz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021080.outbound.protection.outlook.com [40.107.130.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561CE13B584;
	Sun, 21 Dec 2025 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.80
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766313943; cv=fail; b=C99MKMybvKwXi94RalKujzFD2lIi/uMOhmEMz0FhNYXgb4wVh4jDCm8Do4jpsJpuZfmkJsZkb9TjgbUqLRKjwL9d3ZL0qwC+nibBaZhdSNOplNLdpXSulUHgOe/xv2Y0ne3GhuI86TWXddpum2nu6xNlzbm+dk2U2tpQQ0nMumU=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766313943; c=relaxed/simple;
	bh=L19+0xKshxNxJWlv/RNK4/z5a66qkYOB2MLiVKh7CJg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U02GbdgLepHt3bPcWjnY6B7WNMxa9uzPKOrcdx7xMTq1pwJAHZXdKeRD1ODqkrufCeenaT0kipDrpCT+hbNs1/jsxsMWRvBXbnj4Zr2pdM5oSUeAj5RdDmvQDIWIi0kymRwmamAdtgYhh1e7oPZLhx7O3OMnR3hgB5voyAarIQ0=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=js6Tiqoz; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=js6Tiqoz; arc=fail smtp.client-ip=40.107.130.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ohmfatweVmducg0AwpyhXmk6sEk4br20EQc7wO2QZRBe3G0U87rRKimEFBXoS8gA3hbODcalg2PPM3e48jhUIVrM1hqVfYv/rDfENN4drP/udtpgfsumNbddeFFTsqOeqRnqYep0FbzhuXCVAR5KfknqCKZeIwtYMJvSyvQqbN4aH7qr/1m62TJwTAwxmlI1jnL6JwsqeaE11UGC23w2WebxfIeimVqPs1j2yE63bNRo031SJQdJTs0T/zg80D8V4NnKJKLFe8SO6l4miRmgn8/3GPFMKr5qX8mSzs3bRFpYv3VQJ7p1prfsQN8ZVWCgrQ8AhMSAbkBIu01KXoJ1Jg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L19+0xKshxNxJWlv/RNK4/z5a66qkYOB2MLiVKh7CJg=;
 b=resblnIdpBgYCVAFtP5QN65oai/2ph7z2t8ZMpJY4S6ZdZHIRZHMlxWmuYDGeuSTsxWLd4YWUJ8E+vqgLfr6HVKa8KMlNg/f8EV64QJwwA/2A6nyS3cnPuXKO/CRAgxYz+V61Zqnw4OI/Kp4gQh7QjMqjbVAgof/n7m64PJBOTZd0CIBiyLp9n/ZIeSGMA8/57HGPh5pmM1DUb3ev0eoPDPXI7tOQFCe/4bzm6urfph1+RJK0CUAWZIXnlwcdZcEv0dvG2Jr0oEz3AF4rZwFvLsGzKF2Q6bodsUTsqpdv58oVEasl5zJZuGu6yydKtXjCN/lsoQVzGcYqLi/9e7UNQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L19+0xKshxNxJWlv/RNK4/z5a66qkYOB2MLiVKh7CJg=;
 b=js6Tiqozg0K7xSpIv0M+CwetY6yF6pGb93cTo9ehrePTMtw24HQXHFb8lZseaIujz472RDPK3PVvgtTa5/xHcAV2Y4i2XaJ5IhzCOOD2TxgKiFxD6K0DUBcoFk2wtfD3ywWerDWsXsT3UDaqEowhvjYQJpTgrUtot5XIrXEB9BQ=
Received: from DU7P190CA0016.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::6) by
 VE1PR04MB7310.eurprd04.prod.outlook.com (2603:10a6:800:1a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.11; Sun, 21 Dec 2025 10:45:37 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::2d) by DU7P190CA0016.outlook.office365.com
 (2603:10a6:10:550::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Sun,
 21 Dec 2025 10:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Sun, 21 Dec 2025 10:45:37 +0000
Received: from emails-1489737-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-225.eu-west-1.compute.internal [10.20.6.225])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 07FDE7FFE9;
	Sun, 21 Dec 2025 10:45:37 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1766313937; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=L19+0xKshxNxJWlv/RNK4/z5a66qkYOB2MLiVKh7CJg=;
 b=KpKwU6QlEahq1J/6eVqgdmIIPH2/3CjMB4yHyY667dQC2tnadQf3eWSiX4UNu2LOVbUbR
 o2f5Aw39wbMsR8M4RqvJo60tfvwpiXXQmb4pj7qgx87HI1Dlvc+8g5Xxns6nIFv78mLp43Y
 WrFm5qYSST9rcDChJg74GZ/n+IKa/bs=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1766313937;
 b=ULcISwy6qBZTiWIab1+IWMr+rkr7zoeGXhSAeP60f0XZ/5aJn+KxeHLujjw2TactynsVM
 GLULV0ALIZnMgyyqUx6jtWobXgC0ufzfumEj/cgFav6rTIiG97w5AY/OwLDBsS4IN5MKnAp
 WHn81/rmthNtdkZKaIHyGdH9HhuG1YA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdF2qlUjM3FN2uMxTufZEm/yx+KW6pUZm1/41pWMiX2WFIxQczu6Uul68Dcnsert4Ll9GAYf/J+zjdz0zy56k+r7BcHHerhFWH4epcWNTWP6sYZjXFf5bNwuJgjuHsJipple6VrUI/Bd0ODC9VygA/Vlg/WAwYTveD0E/N3ev9ce5UqsTK2P7GRljNgN8WuDxtFLaPiExBmZjAbx/gXbPutomsK2EdCYjqc6nxKu4V0IXi93IpYcu+a+me9x6XC8gQYdZ4TFWHLM8DroaHaHz/2e04ZppkmUxjdaPC/jmEZ/oqoBHFgWhuTS2X86WTsOlPhrVlcmwhTf9ga8447QHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L19+0xKshxNxJWlv/RNK4/z5a66qkYOB2MLiVKh7CJg=;
 b=esIuJnIYW5tTdy7bKjr3xUU+HvGODVMluJyvxvhsQCF9CniOHNsyhWYE7mi7raZDSUckYKMZ5S/eaoER7B0pijpUMBkBW64jx7lBx32pnfi6wYQLbP7farfLnKCnbZdtaRpAw5TYqiYvR5E5VqP+soZ2lwRfOu1nXEnHNLfIFpYfk5jI7t46jpkDdSjmnbbw/3f9EE5RSuud1Sq0itEzwWPAGn1SGAxTBcPXADQaX8x/QDbps9LhBmnH4r6wcG+GaEaAIzSxULR38CIgt+ZiDup+IYdo5Bsh7zOo154Tr1ft+jstRfflr2ShH/Y5j+wyceDbWRflCnpbIOLMw7kG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L19+0xKshxNxJWlv/RNK4/z5a66qkYOB2MLiVKh7CJg=;
 b=js6Tiqozg0K7xSpIv0M+CwetY6yF6pGb93cTo9ehrePTMtw24HQXHFb8lZseaIujz472RDPK3PVvgtTa5/xHcAV2Y4i2XaJ5IhzCOOD2TxgKiFxD6K0DUBcoFk2wtfD3ywWerDWsXsT3UDaqEowhvjYQJpTgrUtot5XIrXEB9BQ=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AS8PR04MB9190.eurprd04.prod.outlook.com (2603:10a6:20b:44d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sun, 21 Dec
 2025 10:45:25 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 10:45:25 +0000
From: Josua Mayer <josua@solid-run.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony
 Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, Janusz Krzysztofik
	<jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-can@vger.kernel.org"
	<linux-can@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3 0/6] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Thread-Topic: [PATCH v3 0/6] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Thread-Index: AQHcafviT+YHxn+FTE2HrgB8SPWftbUl4feAgAYX4wA=
Date: Sun, 21 Dec 2025 10:45:25 +0000
Message-ID: <4f8606fd-2233-4de8-82e6-672ec597a635@solid-run.com>
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
 <CAPDyKFr7DCRs_E4VfrY9-NY8-bStT9oAZaYhUZDg_y3KEW9DWQ@mail.gmail.com>
In-Reply-To:
 <CAPDyKFr7DCRs_E4VfrY9-NY8-bStT9oAZaYhUZDg_y3KEW9DWQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|AS8PR04MB9190:EE_|DB1PEPF000509EF:EE_|VE1PR04MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: c999d82a-1017-4ed2-4f2f-08de407e139a
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YUo4Z2w2ekRHRGxkQUlVZjU0THFab3hoaXJGVlBWNDkveVdhamNSMFd4UkpB?=
 =?utf-8?B?WXhxT3RmTW16c0pCanNCcStmck54Z1NFOVFlNlRkWEt2RytpdnVnZUFVSzQ4?=
 =?utf-8?B?VEx6T2pJM2tLMTBXaUpPbnhpdUlHL3ZoUzYzM1dEMDRpRU4ycDN0VDdXU3dz?=
 =?utf-8?B?UmRnNE9PM1hGVFVFUnFzVU9RaFAwbjNxRmZleVdFT0ZQcW5GdVJsZnV5NzZt?=
 =?utf-8?B?OGY5cDJoV0o3VjJMM3JTMnh5ZzVFRjFlVVkraWNsUlU5OUd1NmtqUnVBWjhz?=
 =?utf-8?B?UkJrOVIrNXBNb2ljVm14eTMxZDN3aVByZk8venYvcVBYZFlqc0lVeVQwTGRh?=
 =?utf-8?B?RjVKNlc3K1JNN25CSTd2ZDR0RVpzcldJVWxlc1JINCsyTW1PR21QNXc3a2VJ?=
 =?utf-8?B?NVhpUXlIVmpUWU1XTkdYdENHSS9XdEl3Qm12dnp5R0w0aUtRV3AzOEVxMk1u?=
 =?utf-8?B?UU1BSWpRMzBySWttaFBkV3NlNm55N3lvRmJFd3JUaVlGMTBsOWx3d3lpVVIx?=
 =?utf-8?B?ZFZOejQ3dEt0U0dXWW1QdG9ESHNhb0JDMHp2aU1FTkZqb2hhR0hxMmVuUnll?=
 =?utf-8?B?UmhPQi9yTzhTOHJlSHNMNXR1dzZMbk9USThZMUJmQTRQOGlWR1VzWDh4UXhs?=
 =?utf-8?B?RGNjRVVpU3MvN2xyS0RCemRXT2pIb3ZTWHRVOUxZSUgyWENma044RmtEQnhh?=
 =?utf-8?B?VURuWE8xSklDZHZ0TGlKWGFMdFpzRG9kZGxrbXpaUEFSQy9nTW1ONmZXRHlq?=
 =?utf-8?B?S2N5Q2g1T2JkOTBxR3RrK1NYOHdKcjZiQUxTM2VzZjlzU3hQVDFJZFlWcTNJ?=
 =?utf-8?B?ekxpMmJtRk9oNk1ERWFUelZNZDN4UElQcmVjQXhqQkZEbGRYeGpBN1JscG5P?=
 =?utf-8?B?NGpPamxaSm9ZWEFpRWNEdTZybUdhU0JEQXZpSDNsZjdkOUZpb214aVc2WFFt?=
 =?utf-8?B?YmdlamF0QmVad0ZhNkREWkdWVzczaHFJRVBpRUI1d25IbCs5YllLTGVLWFQ4?=
 =?utf-8?B?S3lzRWljRFFoSzlPK0p4ZVJsQVpkZHJQY2p0QXIwZVZQeGZVeGU2eUwwS1Rq?=
 =?utf-8?B?TjNhWkRsbndscE9BNWlCb3h1OGRhTHJUcWd4TkEvZitOUThEL0hZeEpkeXVx?=
 =?utf-8?B?UXR2dXZOZElGWGNoR0RTWTQwZ0tSZGFpK1l1VnQ2MzhVYy83dldLbFZCcDV2?=
 =?utf-8?B?QmUxenFhWTRSbDZHWk5qbjVuaEszZmQzc2FwaWphaE1weGhsck9ERDRCN3BF?=
 =?utf-8?B?UGRmNW9FRWNTTmY1b2RDbm5LWUpISVIycVgyekZGZnVhZEpFcDNwTVhQajM5?=
 =?utf-8?B?MDRFQ1Q0K1dST1RiQmR0ZFpUUk0xUmtmUURjVGlnYjJVN3ltbENhOVNTUmN0?=
 =?utf-8?B?YlY2bEljcWFCcHFWenZKWkNRbzhkbGFKYW81bnhoeWdzaGZ6R3BJUHhNNDha?=
 =?utf-8?B?MVhFZlU3cTFhRnE3TFVyYzhMNGpNeTdPYzA3NitQblVUbEtBMWliZmFZaWd6?=
 =?utf-8?B?elBHVERjSWgyeUZCZDdpd2xaTEFQZ2t6NWR6WHU4cXUyTlVWMm9ERFEySzFx?=
 =?utf-8?B?U05xVys5WlRPVEZ5SitrRmhYK0VZQk9LSkRmNThyTjV5ejYyeDNpTVI3MTZF?=
 =?utf-8?B?blIxU2lqdGxYRUd4MU1OdUhFQmtGVGFXdlZ1SVkyaTJCeTFEN0pHc2FhczN0?=
 =?utf-8?B?TGFKK0FCMXJMcHNjRGlsMHovVTVTWnczbUtpZHB5cXljaHhQcmE1UzdkRUZo?=
 =?utf-8?B?RW82R0krQyt5ZTZXMEpuMzJObjI3MysrejNGTUJyajFjckdxRkFqMUNIeUpN?=
 =?utf-8?B?ZUU1OTFtaU1rTlJXMkU5d0FrbHhmYWFvYmgwcGRWUlhYaEJRaGQ1VDBDQ250?=
 =?utf-8?B?dERlQzdkelNtVGt1UC9rSTNHVzdtdzdVUWRjMTFpL21ldytVV2N1U1FLb0dB?=
 =?utf-8?B?L05UMHVmcnllZkxBUmppSlE0VklsQnJrV3BNRHBCTk9YWjV1T1F2bDNyOVEw?=
 =?utf-8?B?UVFleFM5RGQxME8zYmtObHMzYXBLU25Rd1BhdGhhK0ZrN0Q3VmVzZ3hDc2s0?=
 =?utf-8?Q?nLyGwx?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <157A6FE7A596394988ECE09517036166@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9190
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 813cb6d1e5c24777947f51c20e86cf6a:solidrun,office365_emails,sent,inline:c2fe958e95e40757cc4669b5a2af7fd6
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bfeff4da-fc17-48eb-37a6-08de407e0c89
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|35042699022|7416014|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTJoc0tFRVoxdWJDRm1PUU5JT2ZQMzJOek1JZFlBZytHaUpIcHlWRWUwaldv?=
 =?utf-8?B?em03YXpoN0xyVUJXY1Y2Z3VDU0RHZTJ4TW5uYXJzcjFzYUx6NG1xREhrQjVZ?=
 =?utf-8?B?QWN6V2tVQ28xUk1oc1lINEo1UHNWV3hpbkNIMnFiMzZVTFZrL2VXT3F5RDBF?=
 =?utf-8?B?bElSTldkU0NwR3Y2cmE3Sk5mUlpndG9vSnhHdlFzRDNpYlo0RmczNFdzRlA1?=
 =?utf-8?B?dFVwZXNkTk9rMXEreXNtVWRBNXZjTnJCWFNMMGNGWnRvOGhiWWRZSGVrc0Rq?=
 =?utf-8?B?Uk5OcmxSeGJqYU82SWV0VU11bnZ1YmswRWpxZUtlMURGcURYb2N6R2pGdmhZ?=
 =?utf-8?B?VktkRGpHcEdwall5UGZjZTYvUTB4ZjNJWnV0SVZsZU8vUWpMWHZKdFp6cW9F?=
 =?utf-8?B?eHk4eFdJTkJEdDAzOWhmVFltWmZQNkoveXU1YWZmNE01NjZ1bUNLNGZYTHlY?=
 =?utf-8?B?MnMwWm12UFdqbWdRbGlUMkd4dXMyU3phRjF2NC83WlBlbklHT1M5QWtnSWZU?=
 =?utf-8?B?RVN4SUxuWDN1MUJjMFh2TjVqR0NVWHdIckhJTWxmczVQa0ZmU3hyQnhPdkt1?=
 =?utf-8?B?THhoWVlITTNHM08va3R3RHI4clVWbW9LakFXcXAyN1RRemNaaHFHWVNIU0dx?=
 =?utf-8?B?NHdaL045akNSYndyUjRVT0E1Qmc4bEwxQVdhUG9hQnJaS2haZTVwSlZtMmly?=
 =?utf-8?B?UHhVdVFkNWJNMDBzMUluaVJDRUF4MVdvWGpmSTJKanQxWTlnTitIYm9udDZP?=
 =?utf-8?B?YVBnVVVtb1l6N2ZzVVpGY2RLS01GbWdiYUxFSmFuZHZQU3JNaHBxaFA4YThh?=
 =?utf-8?B?UnNRVjRhdnc4MWlEUFFYb1EyaW40Y0gwVEFxRjJJZlFqc0VDVGRscm1VWGtI?=
 =?utf-8?B?bFhJd0pTcnlzNWYyNmJUUjgrKzQ4eWRhdjBPUXZPWHZndElFZGlHODRRaDZm?=
 =?utf-8?B?WjdncUtJaUk5bVB0SkJTV0VxVjZNcng2Unl4QXBPMlFCbmpTUG5lcnhBU0NG?=
 =?utf-8?B?ZUJmMmhrN1lud0gzdmc0eXF6d2JUZmljNTJCY3hIeTRCQjQ4aE5EeGYzeW5t?=
 =?utf-8?B?cDNUek5WbDVCUU9mcFFJMDNPbHhITjQ4Q1VGNko2WDJzSVJna1E4RjdOV2Y5?=
 =?utf-8?B?WTN6Mks0ZkRqRm5XL2ZMQm0vNVIrbk54UlQremVqNUhmd1hsZVpiUEhxTk9j?=
 =?utf-8?B?OXRDR1pnTk1JTERUMmtYNGVkQUpobDRYRndvOVRQdXdGdmVjcXhWaXRpWDNj?=
 =?utf-8?B?cW8wR1FLV2dWNmFqTm9TOElTYTVnVTFYMXNjMkJiYUQrTVA5L2NXYzUxNXJG?=
 =?utf-8?B?eVk2VVJTN2ZVM2lyRmU1Tnk4L2VRd1FyV2FLTnlTaWpJeXRHOXpHM0N3T3JK?=
 =?utf-8?B?OHFDc0V6UDFIOHhNVzY0K3VmNWN5aUNvTEtHRGJoVjc4aW5YMk1YTHNORXA2?=
 =?utf-8?B?VTlBdGkrVmdPTnZKUVdKS3R3MTlUMFhua0lnb200eCtMZ0YyRFlESUVsV0l0?=
 =?utf-8?B?WDR3dUVFQWRiL2dIdHM0b3d3ZWNDN1ZmaTNEaTk3T0pYSjZGdEYvVVdjMExO?=
 =?utf-8?B?RW5Pa0VOb3h4eEs1VUNTcDZkdWtCcFBqdXIzYk9KaHBvaHJvYTlhd3ZQWVZ0?=
 =?utf-8?B?QkIzUXVKczZ3eWtEMmg3RFlIOThwWll3YzZvWm5ocWQ3WDZWUVdKcXpSR3ZG?=
 =?utf-8?B?OHhXQ1lSbHQ5VEZHelFqeUE3NzROUFYxbFBPLzBtdjUxVzdvcVJROUNPMjJ6?=
 =?utf-8?B?ajVsRkZlcEt4anpaUllvVEFpTTVwbVNkdFU5WGFta0orc1pPd2dyZ1A5cjlB?=
 =?utf-8?B?WUNZc2o4SVhpcG5WQVZ6Y0dURk5iQzdjOVc5MFdkWTE5dXBnaTFlVEFUeHZI?=
 =?utf-8?B?OGIxU0J1QWlKR090V2ZnSHgrSjEzK3hZVVJYTDluTC95NDhIcXExTHd1d0dB?=
 =?utf-8?B?L3lFM21UbkdqSk1mT3VuNGRJMmxzWlF1QmIraWptRFE1ZE5PWmgrMnV5RFEv?=
 =?utf-8?B?azBrSnVZYk5lK0hBc1RSVnpOUzAxZ200YWk1WW9ibG5qU3ZjQ2xIQ2dNTUVE?=
 =?utf-8?B?ZGU5QVZHNFZuOUdVUnNkOG5nak4yeGdzaGVkNmpEdHNCd3Q3aVpIU2J0eTFL?=
 =?utf-8?Q?rT+4=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(35042699022)(7416014)(1800799024)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 10:45:37.1695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c999d82a-1017-4ed2-4f2f-08de407e139a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310

QW0gMTcuMTIuMjUgdW0gMTQ6NDIgc2NocmllYiBVbGYgSGFuc3NvbjoNCj4gT24gV2VkLCAxMCBE
ZWMgMjAyNSBhdCAxODozOSwgSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+IHdyb3Rl
Og0KPj4gU29tZSBSZW5lc2FzIFNvQyBiYXNlZCBib2FyZHMgbXV4IFNEIGFuZCBlTU1DIG9uIGEg
c2luZ2xlIHNkaW8NCj4+IGNvbnRyb2xsZXIsIGV4cG9zaW5nIHVzZXIgY29udHJvbCBieSBkaXAg
c3dpdGNoIGFuZCBzb2Z0d2FyZSBjb250cm9sIGJ5DQo+PiBncGlvLg0KPj4NCj4+IFB1cnBvc2Ug
aXMgdG8gc2ltcGxpZnkgZGV2ZWxvcG1lbnQgYW5kIHByb3Zpc2lvbmluZyBieSBzZWxlY3Rpbmcg
Ym9vdA0KPj4gbWVkaWEgYXQgcG93ZXItb24sIGFuZCBhZ2FpbiBiZWZvcmUgc3RhcnRpbmcgbGlu
dXguDQo+Pg0KPj4gQWRkIGJpbmRpbmcgYW5kIGRyaXZlciBzdXBwb3J0IGZvciBsaW5raW5nIGEg
KGdwaW8pIG11eCB0byByZW5lc2FzIHNkaW8NCj4+IGNvbnRyb2xsZXIuDQo+Pg0KPj4gSW50cm9k
dWNlIGdlbmVyaWMgaGVscGVyIGZ1bmN0aW9ucyBmb3IgZ2V0dGluZyBtYW5hZ2VkIGFuZCBzZWxl
Y3RlZA0KPj4gbXV4LXN0YXRlIG9iamVjdHMsIGFuZCBzd2l0Y2ggaTJjLW9tYXAgYW5kIHBoeS1j
YW4tdHJhbnNjZWl2ZXIgZHJpdmVycy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKb3N1YSBNYXll
ciA8am9zdWFAc29saWQtcnVuLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2MzoNCj4+IC0g
dXBkYXRlZCBvbWFwLWkyYyBhbmQgcGh5LWNhbi10cmFuc2NlaXZlciB0byB1c2UgbmV3IGhlbHBl
cnMuDQo+PiAtIGNyZWF0ZWQgZ2VuZXJpYyBoZWxwZXIgZnVuY3Rpb25zIGZvciBnZXR0aW5nIG1h
bmFnZWQgb3B0aW9uYWwgbXV4LXN0YXRlLg0KPj4gICAoUmVwb3J0ZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+KQ0KPj4gLSBwaWNrZWQgdXAgYmluZGluZyBhY2sgYnkgUm9iIEhl
cnJpbmcuDQo+PiAtIHJlcGxhY2VkIHVzZSBvZiAiU0RJTyIgd2l0aCAiU0QvU0RJTy9lTU1DIiBp
biBiaW5kaW5nIGRvY3VtZW50IGFuZA0KPj4gICBjb21taXQgZGVzY3JpcHRpb25zLg0KPj4gICAo
UmVwb3J0ZWQtYnk6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPikNCj4+IC0g
TGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MTIwMS1yei1zZGlvLW11
eC12Mi0wLWJjYjU4MWI4OGRkN0Bzb2xpZC1ydW4uY29tDQo+Pg0KPj4gQ2hhbmdlcyBpbiB2MjoN
Cj4+IC0gZHJvcHBlZCBtdXgtY29udHJvbGxlciBub2RlIGZyb20gZHQgYmluZGluZyBleGFtcGxl
DQo+PiAgIChSZXBvcnRlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPg0KPj4g
ICAgUmVwb3J0ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4pDQo+
PiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTExMjgtcnotc2Rp
by1tdXgtdjEtMC0xZWRlMzE4ZDE2MGZAc29saWQtcnVuLmNvbQ0KPj4NCj4+IC0tLQ0KPj4gSm9z
dWEgTWF5ZXIgKDYpOg0KPj4gICAgICAgcGh5OiBjYW4tdHJhbnNjZWl2ZXI6IHJlbmFtZSB0ZW1w
b3JhcnkgaGVscGVyIGZ1bmN0aW9uIHRvIGF2b2lkIGNvbmZsaWN0DQo+PiAgICAgICBtdXg6IEFk
ZCBoZWxwZXIgZnVuY3Rpb25zIGZvciBnZXR0aW5nIG9wdGlvbmFsIGFuZCBzZWxlY3RlZCBtdXgt
c3RhdGUNCj4+ICAgICAgIHBoeTogY2FuLXRyYW5zY2VpdmVyOiBkcm9wIHRlbXBvcmFyeSBoZWxw
ZXIgZ2V0dGluZyBvcHRpb25hbCBtdXgtc3RhdGUNCj4+ICAgICAgIGkyYzogb21hcDogc3dpdGNo
IHRvIG5ldyBnZW5lcmljIGhlbHBlciBmb3IgZ2V0dGluZyBzZWxlY3RlZCBtdXgtc3RhdGUNCj4+
ICAgICAgIGR0LWJpbmRpbmdzOiBtbWM6IHJlbmVzYXMsc2RoaTogQWRkIG11eC1zdGF0ZXMgcHJv
cGVydHkNCj4+ICAgICAgIG1tYzogaG9zdDogcmVuZXNhc19zZGhpX2NvcmU6IHN1cHBvcnQgc2Vs
ZWN0aW5nIGFuIG9wdGlvbmFsIG11eA0KPj4NCj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9t
bWMvcmVuZXNhcyxzZGhpLnlhbWwgICAgICB8ICA2ICsrDQo+PiAgZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1vbWFwLmMgICAgICAgICAgICAgICAgICAgICAgfCAxOSArKy0tLS0NCj4+ICBkcml2ZXJz
L21tYy9ob3N0L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4+ICBk
cml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaS5oICAgICAgICAgICAgICAgICAgICB8ICAxICsN
Cj4+ICBkcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9jb3JlLmMgICAgICAgICAgICAgICB8
IDE2ICsrKysrLQ0KPj4gIGRyaXZlcnMvbXV4L2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKy0tLQ0KPj4gIGRyaXZlcnMvcGh5L3Bo
eS1jYW4tdHJhbnNjZWl2ZXIuYyAgICAgICAgICAgICAgICAgIHwgMTAgLS0tLQ0KPj4gIGluY2x1
ZGUvbGludXgvbXV4L2NvbnN1bWVyLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysNCj4+
ICA4IGZpbGVzIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQ0KPj4g
LS0tDQo+PiBiYXNlLWNvbW1pdDogM2E4NjYwODc4ODM5ZmFhZGI0ZjFhNmRkNzJjMzE3OWMxZGY1
Njc4Nw0KPj4gY2hhbmdlLWlkOiAyMDI1MTEyOC1yei1zZGlvLW11eC1hY2M1MTM3ZjE2MTgNCj4+
DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiAtLQ0KPj4gSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1
bi5jb20+DQo+IExvb2tzIGxpa2UgdGhpcyBuZWVkcyB0byBnbyB0b2dldGhlciBvciBpZiBzb21l
b25lIGNhbiBob3N0IHRoZSBjb21tb24NCj4gcGFydHMgdmlhIGFuIGltbXV0YWJsZSBicmFuY2gu
DQpZZXMuIFBhdGNoIDEgaXMgY3JpdGljYWwgYW5kIG11c3QgYmUgYXBwbGllZCBiZWZvcmUgMi4g
UGF0Y2hlcyAzLTUgcmVxdWlyZSAyLg0KPg0KPiBBbnl3YXksIEkgYW0gZXhwZWN0aW5nIHNvbWUg
ZGlzY3Vzc2lvbiBvciB1cGRhdGUgZm9yIHBhdGNoMiBmaXJzdC4NCj4NCj4gS2luZCByZWdhcmRz
DQo+IFVmZmUNCj4=


