Return-Path: <linux-i2c+bounces-11147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19008AC4E26
	for <lists+linux-i2c@lfdr.de>; Tue, 27 May 2025 14:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237641BA11FE
	for <lists+linux-i2c@lfdr.de>; Tue, 27 May 2025 12:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB1F25DB13;
	Tue, 27 May 2025 12:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="aPpPtdwO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837219CD16;
	Tue, 27 May 2025 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347364; cv=fail; b=o94F2iGspPykDfdeRKv2MQbNr3Exb17DxkVcNmJzQBtKrhMvubeH+bo21x7MBipmgsRbhALPTTGWba9ppsHj9HHQ6ZiVsEPcelrGsuCfNx/eutqiktGVFmK0P0EQ01mnz3LhwZEU+RATbuXIwUWgaGif0J7/f/qs8Nui9Pi5ClQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347364; c=relaxed/simple;
	bh=7JrC0udIghWjc4KyVO/uAkNGsjK3Pkq056eKyg75CSI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=trBskB4/xsVbW7JGa8E8ghOdIOu0vE8myeWKSYqIFjXKo6qXt+3unT8EPfmUC61cu1n+GPl6Aog7HmgqiOKIJ1S8NK2bR+OE9NvxpTse8C9GyOn0hM6Q/DXlds27XdSK7nNtPxmV+ycmTGKZr950J+hveaiqBT1HBKU5eXv/0aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=aPpPtdwO; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKVyzkzTCt91hGcjAXbOoUxBM+pzl3M2rCXSt0tAvE2p+UAoxVK3syW4HAx1GlHk/mJfUJMm7pOr234NvXdByTDKizEltTxciYIwThaUKRSw97HJkI0e/YfHmqbXikkVn48lwvp0PksZwnkUhwb1+UD+CouDavHlqqT1P45BAPlyRXSl6i9bkonxa2M+HOgDpGc42UjHK7Vy2RvbOeM+Y/9JFDnFWTmW9yBT5bLJ0ICrMXnr7wjZa//EHnDAudG0biTow284H+9L/ve5Zly+lDEXLPrpCG8WxY9Voyg8TC2/NkEoOxKF3qQ99uuREYbGleOzqO0gq3OV4KhiPkH+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JrC0udIghWjc4KyVO/uAkNGsjK3Pkq056eKyg75CSI=;
 b=h/lm/iAR8Njo8yU4UD0p9ceL26bsq2HQ4ZxPumGua6OUCLgqdWXRwVlrODF4eYVnwNptRZQ9PBoDdpSSiupNS2aWYIAhh6+KrTdqK+EUAAeVeu3fxHbdXj3Ldicb+uMdadethh/kt+iTsB8Km1/Sq5/x7pmTqizMF8reLylElMRg3qQuM9eyO+S3S6VabLNAEMZmM1faICbdRtiZ4q5yvjG1vMgcm+GQ4dd9cwNgwPgD32Q6Rb+68nM4zR+RAchNQF/kLHr3+3cM1IZ3wY5DuaN6L4refhyC/I7L11KCyo6lbLnN/fBJB7LcVXgk/gOYgR4iRO8TFgOv7x4Iy8eXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JrC0udIghWjc4KyVO/uAkNGsjK3Pkq056eKyg75CSI=;
 b=aPpPtdwOWpnskrlYc7xv8XKUYwRLxzcqO/cAdkmi1T9hV+lYQI+wCD4aF5hVibt9GYUyYRo7JIrVLOpgMMwmG+R1+/bSYaHhJ6yPROe1MbVRAGQrtopoDEBoxd8+ALI2QLpvSoOcuoTAnip6G6TZonhGBkVkOnjc1NPScHGUV5c=
Received: from VI1PR06MB8616.eurprd06.prod.outlook.com (2603:10a6:800:1df::8)
 by PA1PR06MB10065.eurprd06.prod.outlook.com (2603:10a6:102:4f6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 12:02:39 +0000
Received: from VI1PR06MB8616.eurprd06.prod.outlook.com
 ([fe80::fac:a279:d192:7cbb]) by VI1PR06MB8616.eurprd06.prod.outlook.com
 ([fe80::fac:a279:d192:7cbb%6]) with mapi id 15.20.8769.021; Tue, 27 May 2025
 12:02:39 +0000
From: KUCHARCZYK Lukasz <lukasz.kucharczyk@leica-geosystems.com>
To: Carlos Song <carlos.song@nxp.com>, Oleksij Rempel
	<o.rempel@pengutronix.de>, "stefan.eichenberger@toradex.com"
	<stefan.eichenberger@toradex.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Andi Shyti <andi.shyti@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: "open list:FREESCALE IMX I2C DRIVER" <linux-i2c@vger.kernel.org>, "open
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>,
	"customers.leicageo@pengutronix.de" <customers.leicageo@pengutronix.de>
Subject: RE: [PATCH] i2c: imx: fix emulated smbus block read
Thread-Topic: [PATCH] i2c: imx: fix emulated smbus block read
Thread-Index: AQHbyYH8Q0P//Q72iU2s4gRgqH2X3LPmVgqAgAAUlxA=
Date: Tue, 27 May 2025 12:02:39 +0000
Message-ID:
 <VI1PR06MB8616FBEE8A355BF5A314D504D864A@VI1PR06MB8616.eurprd06.prod.outlook.com>
References: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
 <VI2PR04MB11147245BA69A4C19B0DD037EE864A@VI2PR04MB11147.eurprd04.prod.outlook.com>
In-Reply-To:
 <VI2PR04MB11147245BA69A4C19B0DD037EE864A@VI2PR04MB11147.eurprd04.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR06MB8616:EE_|PA1PR06MB10065:EE_
x-ms-office365-filtering-correlation-id: 471b8b89-f587-43a1-fca6-08dd9d16609d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VDcxRUp2L0FkNTl3eks5YnRoVyszS2E0bG91UjJGR0Q3MjgyMTBtUWhpZ0Jw?=
 =?utf-8?B?Z2VKbDVIeTVqdkpSUkFYM0ZZRy9Qc0pidjZNZmNEVzNyWlhmbHpDWmJoUGtM?=
 =?utf-8?B?YWh1bjJlcGlkWFYrVmdwYkpxT0lMTEt1OStPMHNpVDQxWHkzWWRvSXZEQ0ZM?=
 =?utf-8?B?MEppL3piQ3QveisvdlJzZ1JJaFlTTW1pMzlGR2kvblkweC9ya2RuMno2cmZ6?=
 =?utf-8?B?R2c5b1ZSTXM1ODBScTlDemxFcDNtOEhVNGJCMzkySG5JU3BwcW5jMjFqN2lL?=
 =?utf-8?B?cFc0eE5pakJmZHpVRFNrK29SeWNhUHpvM2pVaUxvODRvemtYalZ0aHBpVmVv?=
 =?utf-8?B?dlZKY2V0eWNhMWdhOGFEZmdicktPdGdROFlDRUllWDFXWE4rc2M5bnJabC8w?=
 =?utf-8?B?aEJaK2FJTnhIZzZRRHlKSjk2SExSUFlPUkkrU3Z1b3BaOXJYaXplTHpadnZj?=
 =?utf-8?B?Q2JEV1l6aXlxaGt3R0xNVGVqUTR3KzZ4eWhRbW9JOVJGNnk4NWc5Q2tQUjV2?=
 =?utf-8?B?MkNKME12alAyYkhBYmlLQWMzR1E1YVJVZWI1WFBPRC8zT0pNVmYxcHpaSGFa?=
 =?utf-8?B?UHd0T0NlMlhnNkRRc3lXaFpSdS9SSWRPeDdBaEZaYlU4UGRucXhtZ1k5UTBH?=
 =?utf-8?B?allla3JuUXJIaG93aUVIaHMwdmxmWnBmTGd0NnFkVUE1Z2hwYzNNT1NiaFkr?=
 =?utf-8?B?SHVvV2Zwb0E4cExCVUZuNExEQ1hKMThnTkF2R2laUWtqTDA5VElrRFJXSjFh?=
 =?utf-8?B?NmtPVTdTQjBlWlhFZ3QvdXBTdHlCQnA1NmR0M1dBa01VdmtNZmV3ZFhXTitP?=
 =?utf-8?B?NkVlSFN5RDRXTmI4WmovbnFRQ3RoN1htc3grbkxKT25ta044QWhlcHFacmJj?=
 =?utf-8?B?SWZRRGdHcVRZQmw1YVBjUEx0eUNLUW1JWE9KemFzQndTK09vSm9GK05CMEYy?=
 =?utf-8?B?T3drcXZkbldRZUVESDlZWDVPVVk0bkh6THNTNzBzM3dqdldZNzVBcGxIMXhn?=
 =?utf-8?B?U2ZlOTBwM3dFTmpBdi9FbXlEQmZkQXQrS2ZqRkJ4TkJMQm1IVGpaSGhtckJM?=
 =?utf-8?B?aGRPZ2RkUE9jbTZkTVhQUURrcHRGeXUvOXlGVGh4RWxEMkFka21CeWpzUG9p?=
 =?utf-8?B?cGlFcHNWTmdDQ0VnYmxsdkRYNUhsdzRacnFxLzhreFdENmNkT0dGSHVaejgz?=
 =?utf-8?B?aW50RHI5ZktMOUpWUWR6NGlhRVh6YU9aa2xqRjcwVld3MWpIUk8yVkR0UUlp?=
 =?utf-8?B?TUsyNUxTMVo1cnh1UGNhREFkZy9LMzM2VFJWOHRsaUJENXVTZWZxS282Qldq?=
 =?utf-8?B?Z05GR056Ry9PaVdUS2FSbEY5MUZ6bklnbGNmL200cVplbTljanMzUVVRcjBT?=
 =?utf-8?B?N0dpT2ZhVXJVZk5YeGFBQUk3cEFLUW9hQklkazd2bE9VWHJwWmV3ZU0yUlZj?=
 =?utf-8?B?YWhhZ2JpSENzS3o2QVQyb1pMMUFXRU5Sekk5Qmp3SEtkMThLV1NUdHNFZ0hF?=
 =?utf-8?B?VytIUlZIT3Z2WHpVTDl6aUNhOW80cDVBdkl3WjIrenZMeTJsQllvUXpHcnZN?=
 =?utf-8?B?bk5OV0c5VjJzUE9LSkpGTk0wKzFMUytDdWtFREZ1TkU1TkFYUWw5ditGME9S?=
 =?utf-8?B?RTJYV0FmUU1kZ05tVkRxN1VTb2gxYVhXOGI2OXl5MlhZOTRoOFNCdjRjQjln?=
 =?utf-8?B?YndiUXRnVDRkaHdqMXJkNENxYldDNC93TkJiZ0EvUVFIa2dxRHpudERlcnBO?=
 =?utf-8?B?dThUSW8vekpnS2NFYjExVEQzTFp6K0xIM3h3SkMxenllU3Z4NFJHZ3UxZjY3?=
 =?utf-8?B?WExNTDd4UFhpUU5Rck9tTm9LTEpOMW90akV4aUt1WFNrREZvTHhTNnU0TTVi?=
 =?utf-8?B?LzFUbUlFMkJUTTliWHJFeXRUUkVRQ3A4QzBYSG81L1dHazYyeUk1NzJ3RStk?=
 =?utf-8?B?eVhMdmF0dUpVUVNoMVBrMDJHS2xrY1BETk5OaXY5ZzlHUUM4TDdFZ3ZzRW9Z?=
 =?utf-8?B?Y1RlNVdoMWxnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR06MB8616.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TVhJKzNDbWUrWXdsSmZtMEYveWdmcEhYTGkvUWZNVTNlSWcweTFtMmJsanZP?=
 =?utf-8?B?RWRLTEo4emlCd2tXa3V5Sjk4bnVhaUdlenk2Y0RQSDdqVmIvMUZlMkZOM3l1?=
 =?utf-8?B?cWhIWVBQMEFkK3ByYmwwMEhrMkU2bmRzMUJXcytXdzlObkhJZjE5blZ3OUMx?=
 =?utf-8?B?QWt1TFBCa25sTU5jM0ovdEYydXRGSzRvRWFVdXlZYVg3a3BFSHhPUnVnWjhX?=
 =?utf-8?B?bVhodXRyS3VHaFVWU09FYnBOcTViajVRWVJUWTJndThWRnFLZ0NueWt0T3Fs?=
 =?utf-8?B?RUhiNkNpMWxGaGkwU3RsNS85eWFnazNKeExjbm02aGRVazAxaExFbzM3UFZy?=
 =?utf-8?B?SlY4NjA3Q09kN0xRWGVlOExVNzN6NFBGOGxmVXFzTWREbTQzNExtenMzU3Jo?=
 =?utf-8?B?NVN4SGYrN1NvK2xoUHNYcmlNUmhHL3R1LzF1bjJud2dpM3pKZVpaNFpWNmhl?=
 =?utf-8?B?ZWQrZENmYWk3TEFYd3ZOaW5sM3RFL3U0aExrWGwxeVhwNXB3SEYzeDhzSmhR?=
 =?utf-8?B?ajdCUFNocGxnV0xSaXBkYUhuL2xFbXJ4T0l2T2M0QW84ZGFFZWJBU1JWTkIy?=
 =?utf-8?B?Z1RlY29nZVl1QitmNXg0WGJUZ2ZuK3pYblY5cUpFaFlPTkFqalFGZnZuVWdr?=
 =?utf-8?B?bVFYb09qMVRIMFBZcDhSQ2lFcE9sQkpXd0lYNlFidXA4akVkczY2aU9YS3F4?=
 =?utf-8?B?VWVuai9UQkp6YmV2VUJnY2Q5UDNrd1JJemlkaHErR0h5WnJNaEJEbkVBbmlu?=
 =?utf-8?B?LzRJa1ZkZVNuQXJub1NnUFdONDhiWEhTSlJjRW8vbFFVTDY1SVhTYlBuWlFn?=
 =?utf-8?B?Ym40cUFIcm55TjhqUVBlOWNleFBoVEhpbVFPK0FjL1N0djlmM3YxK0ZJQmhj?=
 =?utf-8?B?YXNmMWN5Q0REaTVYb3NXTnI4a3lITFhjS3RPOWwyWUtLMnVjSkVzcHF0R0lM?=
 =?utf-8?B?UEpQN0NWeFlhQnhUYWVNVUNPZ0NQd1UxbE1JS3JRL3RyUzVGbkh2a0NqZ1JT?=
 =?utf-8?B?ejkreVdJcXBxWDdveVVtOE41TkhXTGZvS1lyUVovbkZCQy9wNjEyenVTQnZt?=
 =?utf-8?B?T1hnUGtlUVRmVnlvK2xjVzBKZm8vSzVoZ2I0U2tQaE8zTFFSUDd0YjM5bUMx?=
 =?utf-8?B?SjBPdG1MSWhNWkQ1OXh2eWN1MTg0bU8yUjNjNi9qWTJaTG1SamluMkZjTEVK?=
 =?utf-8?B?R2ozTWFyemt3MmZINWVuZzY4S2l1TmNyaFpnS1p3OW41YnErTzhiL3oyOFh6?=
 =?utf-8?B?eGtqMXlEUGRCdnpLS2JQWnRyelhhV29JSkoxbFgwb2xsRFhUV0w4WkhsT0hH?=
 =?utf-8?B?M3hGYjZZaFE4NlJuMnJtLyt5enVGZkVqa2NucmZDNTZkWUtVOUd4OWxCb0Iz?=
 =?utf-8?B?ZkIwRTdob0d4ZXdjWS83MjM4cUhoaWVxWm80TG5XZmMrRTVxOTF3bzRneGsy?=
 =?utf-8?B?eWJVb25HdGVIaWIzMDdDU2w3dUE2alZKZm5XMGc1NnVnZHVtZFVSYVNoaUJx?=
 =?utf-8?B?ejJCZWVCRnhQZk9FWHl1Q2JZaFBic2lwL0hYMzVjMUJvTnBianJkVExGZjhP?=
 =?utf-8?B?TFFxbG0xMEF0SExWclpoeVkrb29Rb3VzZnY0N3MrVHcvMDh1Zk8rbFNYcmtM?=
 =?utf-8?B?ZEdhUHBhTmxObHRFaXB5Y3c1WnlxeE8wVktnVEkwdmhzMG1Pd0t0c1dyR1d6?=
 =?utf-8?B?QVNORWNmZGZCYjN6di9BYUhIWmthUWxzYnFGVW4zaS9uRnNjREJQYkViS0Zs?=
 =?utf-8?B?WXZzN3FaUEdLamEvZUpjYk9lbGJlc3VDS0xUekgrSTFZbDM2RHFGYlk4MDBa?=
 =?utf-8?B?Y1lReVVJN3FTMWlPc0hmWlBIdkF4TlNta3pCTzhWL1BnZC9qYzdEQ3pmZHRC?=
 =?utf-8?B?SSs4SFFFNk5iTTNZc3VNVGdTeStjbWVYdytWYUR3TzE4WUFpcWZjS1gwY3cy?=
 =?utf-8?B?SFJGbnphbVVOR2xRbjdlbmJnRnV2Wm4zdHVFQ1FWckxzVTdhV0NLRWNiMWhC?=
 =?utf-8?B?K001Z25UeFBGTGhNMk92RVQ0T1J6QThUM0QrUmVvay9ubkZEL2VnYStMcWI1?=
 =?utf-8?B?NnBWdmsyckJPYXJiK0NrQ003cGFPejhMV1hPRVdwOWR0S2dFSnRQVmpVMDBy?=
 =?utf-8?B?UkZrb3RtdzkzNHBOQmxjUDlpcnBFTFpVbGtMZ1p4WktGVUJrTFJRZ0NZYm5R?=
 =?utf-8?Q?B3guO0A0qv4rSIUwqpVeHlI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB8616.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471b8b89-f587-43a1-fca6-08dd9d16609d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 12:02:39.2085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qW3KSX3hCSiKSpczrqaxtTtQHmE3wK4+A3kGVBYpPR2Qi1Nmc4k4rJph2b71mYceIEYUfj4XvPXd3PP6jApujmKvWcb2z/JbNmm/DPqFnlaj1bJBz0V4SbrvN5DiDSSC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB10065

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDYXJsb3MgU29uZyA8Y2FybG9z
LnNvbmdAbnhwLmNvbT4NCj4gU2VudDogMjcgTWF5IDIwMjUgMTI6NDYNCj4gU3ViamVjdDogUkU6
IFtQQVRDSF0gaTJjOiBpbXg6IGZpeCBlbXVsYXRlZCBzbWJ1cyBibG9jayByZWFkDQo+IA0KPiBJ
MkMgU01CVVMgYmxvY2sgcmVhZCBuZWVkIGZpcnN0IHJlYWQgb25lIGJ5dGUgZnJvbSBkYXRhIGxl
bmd0aCBvZmZzZXQgdGhlbg0KPiBJMkMgd2lsbCBrbm93IGhvdyBtYW55IGJ5dGVzIG5lZWQgdG8g
Y29udGludWUgcmVhZC4gRm9yIHRoaXMgaXNzdWUgeW91IGNhbg0KPiBtZWV0ICIgRXJyb3I6IFJl
YWQgZmFpbGVkICIgd2hlbiB1c2luZyBpMmNnZXQgLWYgLXkgYnVzIGFkZHJlc3Mgb2Zmc2V0IHMg
dG8gdGVzdC4NCj4gDQo+IFNvIHlvdSBhcHBseSB0aGlzIGNoYW5nZSB0byBtYWtlIGkyYy1pbXgg
Y29udHJvbGxlciBjYW4gYmVoYXZpb3IgbGlrZSB0aGlzOg0KPiANCj4gUyBBZGRyIFdyIFtBXSBD
b21tIFtBXSBTciBBZGRyIFJkIFtBXSBbQ291bnRdIEEgW0RhdGFdIEEgW0RhdGFdIEEgLi4uIEEN
Cj4gW0RhdGFdIE5BIFANCj4gDQo+IERvIEkgdW5kZXJzdGFuZCB0aGlzIHJpZ2h0Pw0KDQpoaSBD
YXJsb3M7IHRoYW5rcyBmb3IgdGhlIG1lc3NhZ2UhIFllcywgZXhhY3RseSwgdGhhdCdzIGNvcnJl
Y3QuDQoNCkkgcnVuIGludG8gdGhpcyBpc3N1ZSB3aGlsZSB0cnlpbmcgdG8gaW50ZWdyYXRlIGEg
c21hcnQgYmF0dGVyeSBpbnRvIGENCklNWDgtYmFzZWQgc3lzdGVtLiBGZXRjaGluZyBvZiBwcm9w
ZXJ0aWVzIHRoYXQgcmVseSBvbiBkYXRhIGJsb2NrIHJlYWQNCm9wZXJhdGlvbiAoaS5lLiwgTWFu
dWZhY3R1cmVyTmFtZSwgRGV2aWNlTmFtZSwgIERldmljZUNoZW1pc3RyeSBhbmQNCk1hbnVmYWN0
dXJlckRhdGEpIHdhcyBmYWlsaW5nLg0KDQpXaXRoIHRoZSBmaXggdGhlIGJsb2NrIHJlYWQgbG9v
a3MganVzdCBsaWtlIHlvdSBkZXNjcmliZWQuDQoNCg0KV2l0aG91dCB0aGUgZml4LCB0aGUgdHJh
bnNhY3Rpb24gb24gdGhlIGJ1cyBsb29rZWQgc29tZWhvdyBsaWtlOg0KUyBBZGRyIFdyIFtBXSBD
b21tIFtBXSBTciBBZGRyIFJkIFtBXSBbQ291bnRdIE5BIFsweGZmXSBOQSBbMHhmZl0gTkEgLi4u
IFsweGZmXSBOQSBQDQoNCihpLmUuLCB0aGUgQ291bnQgaXMgbm90IGFja25vd2xlZGdlZCBhbmQg
U0RBIHJlbWFpbnMgaGlnaCBhZnRlcndhcmRzKS4NCg0KTHVrYXN6DQoNCg==

