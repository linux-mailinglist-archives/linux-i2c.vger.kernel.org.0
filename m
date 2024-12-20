Return-Path: <linux-i2c+bounces-8655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D6F9F8DB6
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 09:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F1571669A0
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 08:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEDC1A070E;
	Fri, 20 Dec 2024 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZkktVl9T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C2619F11B;
	Fri, 20 Dec 2024 08:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734681999; cv=fail; b=HTNI/nmCde0AWFBNbKqsGypqrpBwztWH1qLHj10El7LHva6o/2g3kxOT9k3G++jBOgMTDXu8WSchbnsaDXym8p4gFm4Lcj7Lo3WNVDcITdW/j9ZMjrfC6RgTiM+hAr77wKytfpPAp8L/WPAlh9fNZ4KPjKnJN12rI9ZXsx/Tgpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734681999; c=relaxed/simple;
	bh=fdX6B1b0ew4ReXw/vyxCglbVEvbyd9PhmoZ2r45mG20=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hfj7CAQHUZgUD+5yDcrLGhP8z7NkZmnY1UOfNYXABgtA64Db5BIrUyEkTrvSlR8PihG9Ulb6PE7yXeQ9GP3ETkUIAV461KKeMhnvc0VBXRVId57LDoMrU307oOb5lVGssSCBTco0Fv45bkktIqyQlshHHFz76ywBXyMIDWnLrfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZkktVl9T; arc=fail smtp.client-ip=40.107.21.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuTlCy7dsJ3Zgai2sseFzhq6Wwt2b34HauUWRJ+KC0xSfxmVgNk5SSdmJV0s+YATaGFdcuTxIBiWxrCtvxvxZpvohmMns3NhwvJT8KpXmH4QA/D0aqzRn15CaCkNtSrmtqvCwNgl7b8aRDYyR6H5xu1ywjH8udBBqJ8MOcvJCFOG3IEeeegn2H6N9mKs2OEsspbJywkupWMRq/MxIL2InIwhMFZTHTcUPxezsaoHeu87d4NG7emZzKQ5XwCuWzd6m/8Q7LdwE27XOd8vVFam8zK9BXKl9jQNV9KTLH3kB4dp2MeWcvFWtWQTohl+59mrV1wpuVDHItSojst81v1clQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yrhmSRM1EDiXKcRcXWRyiD6K32DmNHU0keOUX/0/rQ=;
 b=Z2bqU3XCIjz1GAzB0h9qvwdd9rXxrQUNp9kVyXZtN1RcEey1cOfyoWAZdAPzhRUAiKjmkvRXwQGBu3WfAVFaNWTBRBmFBPWehriRhrs04LYmLj2kycR4S1MNTxxM3Bmkehg1yOfCrrw8uj16D7/plR4UdGQrVY6UJh9zJWcJo1NOVOFGswUA8/aTkR/yc9G3imCRIa/gQtugdPETMUhpHxiVWGXKK93vg/tYWNPCcHJRa3Vv1R3uPWzv834OTlw9wPvpLcPkLvAX7F3yf7unTjUwlJy4WalUKYVCiNYeBP97Fx74uHDZ58abavJWVkFyv7VxmyvRZylLT6rY/R2GGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yrhmSRM1EDiXKcRcXWRyiD6K32DmNHU0keOUX/0/rQ=;
 b=ZkktVl9TwtLymaql6+gTiJyzgxR9bYhG1Egy26fdfq8abazL2SynEEHFX/zqmWEH1aF3HnDyTYtreMFcQPAp7R+zCv6ccJDCuzwUken65aAvAzVqrFjgsZoqspxpv/j4ifwtFAKNONazv0Rz/2GOYwmN1FHMQb7Qmd+nd1UsU4OvHEf1oo3dnP2qreNPrZ9HplZulAf4VQofFqGARoM/NtU5QFbyanrQWRjyLpw51o0ppb2z43CTPFPwF8i42mjiAG0pqnX+UCx2SF6vo1Sfd4442CwnhYH6ldTOXglF/EqdoV6NfuJOGlw7trtQCcqRlZ0HXxc7dL2tfMrjaR1omw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AS8PR04MB8787.eurprd04.prod.outlook.com (2603:10a6:20b:42e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 08:06:33 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 08:06:33 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Ahmad Fatoum <a.fatoum@pengutronix.de>, Andi Shyti
	<andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Index: AQHbUrYVhgzQt8jFEk22aVmIZK+jWQ==
Date: Fri, 20 Dec 2024 08:06:33 +0000
Message-ID:
 <AM0PR0402MB3937419BBB58B75FB8F8DE2DE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UK4rMxrtNsPw5V@pengutronix.de>
 <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
 <Z2UeKZcpeRUt2OQ4@pengutronix.de>
 <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2Ugt8NVued0_4c4@pengutronix.de>
In-Reply-To: <Z2Ugt8NVued0_4c4@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|AS8PR04MB8787:EE_
x-ms-office365-filtering-correlation-id: 18d052dc-104f-422a-8fd4-08dd20cd37ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ObCT4zxBUxea3jdL+oupzQ6HAFyAL3/knxykbGFLoKoGWu/Db7DkdfmSUvzk?=
 =?us-ascii?Q?1L63+27CjftfZLWG3oCmH6yJretYHNECkQq+nbxkaAgQtdfwzOyHcAOiH6pV?=
 =?us-ascii?Q?/ReZExr33ez1ULNHFwhRJfaWmLeltrW/f7W6nk8GH5NAeVsYqw0vgjiQ5NOZ?=
 =?us-ascii?Q?LSVkwrvdzEeWDgRZFs0VAf62vl8GZqqSxRyt4U842Xh8qmGzugmzZYyZ0D3N?=
 =?us-ascii?Q?EME3FO5pfoofz2wrO7dTrE2g+/CpqoZRIt8GVHU4vjPOn1NEUzGHFPmIKXyU?=
 =?us-ascii?Q?bPfnbqB5HsbY0YEw/qxqVinHvEtnCIggtk2v1e912GPWYd4WILXugW90xM+a?=
 =?us-ascii?Q?2bEIAMffioG1gTO1EU5AN/XibQ6Ef4Echcg+83isdS+5RiGA8dEv1ZWyvbHD?=
 =?us-ascii?Q?QASLqsc8rAjFr3EgVCjGKwg07RJZxXZX1bqLIDUcMJSFWQOwIZP9jJpb4mbi?=
 =?us-ascii?Q?fflL2hS6HC/gclbAVndUQES6/rgp8/V1SmVkGrl9MuGKyG6fnQ6fGM1d03eu?=
 =?us-ascii?Q?3uSp3caQs8wOH+3Su7odT8m0LYarFe1uxJyhj1UAucYf14pR1tgmhM6zlWR0?=
 =?us-ascii?Q?rk4ArC4xEr6vV6fkf6nFCSqNUbk4eNuksRLAifbruy86oo6x5RQ6e5hcDCys?=
 =?us-ascii?Q?Sp6w65Xx52vQj1uczU9lXmUSoysYr6TA7kYFm74Txu4E2TWBS8doh3XBUFKv?=
 =?us-ascii?Q?KuMKIj4GxGGKZALf1n4VWE/mdh66u1qln3ZwEPZshqvCJ+rk9d1ieo8gmIRu?=
 =?us-ascii?Q?hxrbOplNh0aXUYWtehV/Gf6/6oMsneRoeTs5QkLTF2jKrjkwvo9A3En4JjTc?=
 =?us-ascii?Q?vAMlnxhglIo6fFxaBgseV6vC7h7eTBjc7WjxmaOYJwer2aoi4wh5YaD8Dg7X?=
 =?us-ascii?Q?0shcgk4sRLhi2IQ7Gm5MnIkA/Gt7GLdLaufeWBUrC5bq3xIuEOqKBZBncV80?=
 =?us-ascii?Q?Iuxp3f3qPTyqrhmCKlegm8vhAJPoD/Xezpq+7tqCwdiCyWSFfNijErFTIEXH?=
 =?us-ascii?Q?t3jHHqu5sfcfnet1ooDIqgpwWDcnkUzIaEK7TVJDkymJW0WG0tcgibblCDes?=
 =?us-ascii?Q?aFlHTOqBbmePuU1sHP9YfyYcrKJSJHzFhHPcSP0dr/NGe+jjm5Rzfrtuafkc?=
 =?us-ascii?Q?gGL4W0arZsq1BftnmXFxaHYllZHPFPRYQpuoKjEty3hMSGRbI25I3OQE5akk?=
 =?us-ascii?Q?70ItBzvyk2Uuc4+nfUSIjy7ffbKAw3AOz87MYTmJ4uudJ0OF+fsMMibpt1zU?=
 =?us-ascii?Q?JmP2uAVj/7xxyrJIyO+3oNUSi3cZyNeYq9tbmnjJgKEa+wD6XtY7Bl1bDQmA?=
 =?us-ascii?Q?EfBL6TQrRCVhT31KLFfxFGh+VEye95yMz8FnPWkFiWAa8s7xMDE+5HhlmVla?=
 =?us-ascii?Q?HRjjRBH46MwOTsGseH6c4CqJT1x4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ekbHd7VtNa5BpPZ4y6vAv8eZwV8FxgnDvzXecPMPwYOpUv8tv50yvquVYJvd?=
 =?us-ascii?Q?mZFJZoXcZ845nRfMOknfcmtu7WJjyAXhXZRixUmrRKUlYSMo5ADhAxDM+DH3?=
 =?us-ascii?Q?jSxubmomZYwBpdF7a8/TxhsGUYKXD4m7zO/yFRnjy9/Ii8KFRbpRTBtjaFvg?=
 =?us-ascii?Q?pkGc43z9n+/IxDGFW3QXIx2v2uDqcQT3YMPkqH7tsqFhjoykP2/bDpNZ1i5h?=
 =?us-ascii?Q?140gUTAtVe94PTpFsKr6zPl/ILA/gibmhj/Vfcv8E5dxxCSwu+Upfzq95Q7e?=
 =?us-ascii?Q?Y5R7Wp9mAispPe8unceC6QOt/xucLJxSkksrdMm3gaOzvHce2Fp0SMNBCXej?=
 =?us-ascii?Q?c94SKZpbwvoaYep7Zl4ApMj+l9q2Un514FTelxFPHMKltpkWsujh72YTE2Vr?=
 =?us-ascii?Q?LFOPzsJsRaSNBXgqsIihs0O+eFcL1hJbxyinw9vyEiKwbCz+YPPtA1qA0ClF?=
 =?us-ascii?Q?vpuT+aSXlsEW9Di8T8UdBHuGAZVlzP9H2uM+mMGoeJRi4iEdMrdfm6vGtJXE?=
 =?us-ascii?Q?/TkLXVje1ErxLyskawiykwP3py4GoQb57jHVsOf+6CON35hRz53SNb/pT93L?=
 =?us-ascii?Q?FH7zDYEB9NP278JiDGJIZ+a20BEYN6Ec24Ngoih8qwzfb+hEgkM7K/CE1Rve?=
 =?us-ascii?Q?xlBHTuvuCblzly7p/QyULQwayH5McOORvCHZi87hYLAx0ImW/awtLj0K46cr?=
 =?us-ascii?Q?+vr4GOhW5r6xI4Imyba0pdlGopa9jrr5g+YkNqG6NPDsjcg5Q4K7RcL9lTO9?=
 =?us-ascii?Q?je65VodcINDAuSHE7ZLd62/TUNlmz4XKFtEDKnVg5DVL6hTPqs5t5RaPlG21?=
 =?us-ascii?Q?uaH1yPX1QMfLJZ4QTCDyAgBlbeMT0RIxhl1u0p6kM88XKoXO+lHqsfTHmdnE?=
 =?us-ascii?Q?nKsW8B06sPxXIWLKOPm+QxTqzwixBx0A0kcTcoK1ndd+qBtbOufAK8t1MNs/?=
 =?us-ascii?Q?0yk8Kh+v8jGWBqI8wfENUeeqDLctB3/Bt6mFTGttifUq/XQslY9bxH+VMlsH?=
 =?us-ascii?Q?h+BJKlIuSbzf2YUwaMvEtrXA+Tm0O0QjBigQIAHzD5Y4IQtL70pH7ylaJhmc?=
 =?us-ascii?Q?kw2Ej620Zmj7HAf18ID5pJEC6N069LjhlTA7HuE8EcIXq51NYr+SR1RuGJp6?=
 =?us-ascii?Q?qD/376wr+l7HFGrHHR0IZShAqU+wuvUTm+lYDtj0Lvftd6UAkjtQduuib32A?=
 =?us-ascii?Q?zOJ3wr3fDIRqT5IbbLpSFM4An5tRp73BUP279tRhxW0kONT0rYwhmgYyqS8Q?=
 =?us-ascii?Q?1/0chGoE0vYTbGmr3Ypb2jPsRu+wYl9aRW92SFBnnGUlRAAgoKaIdmlK2L0K?=
 =?us-ascii?Q?gwtKZ6UM0DCsCBG0HodZIi02UPEYm/7WlIWqQLnYlUs81Wd3jsr42MJJdf8a?=
 =?us-ascii?Q?3ZIa2cVBdjJ6qMHZ0Mulmv6SFj5CG66hWV0Nhs5Kp1r1u7mbFpscVzINoLum?=
 =?us-ascii?Q?JPlbwx8f8qwlj34nWNH9KEDEHn/UCqEKVDHf4fFEaMm5717fuMsPfoMudlw7?=
 =?us-ascii?Q?jwCgwlZZM3HV7u8tz/973HxaYaChf9sQ8YkYmn5pDXnt+lCA10XJVhVhMKgP?=
 =?us-ascii?Q?wG0LY9UiCHBLl/DiUSd3nAISeEu6Zq1Z9FmYYd7G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d052dc-104f-422a-8fd4-08dd20cd37ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 08:06:33.4697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7mOXvy2KBTKowzW1JzcEwRzkECvW0oMmOlJvbtvppCsVolzHf0duxQ8Va3daYfsZ9hMc+A0ldC+qaaxQE6WPng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8787



> -----Original Message-----
> From: Oleksij Rempel <o.rempel@pengutronix.de>
> Sent: Friday, December 20, 2024 3:46 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>; Andi Shyti
> <andi.shyti@kernel.org>; Frank Li <frank.li@nxp.com>; kernel@pengutronix.=
de;
> shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Clark=
 Wang
> <xiaoning.wang@nxp.com>
> Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
>
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>
>
> On Fri, Dec 20, 2024 at 07:38:47AM +0000, Carlos Song wrote:
> >
> >
> > > -----Original Message-----
> > > From: Oleksij Rempel <o.rempel@pengutronix.de>
> > > Sent: Friday, December 20, 2024 3:35 PM
> > > To: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > > Cc: Carlos Song <carlos.song@nxp.com>; Andi Shyti
> > > <andi.shyti@kernel.org>; Frank Li <frank.li@nxp.com>;
> > > kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> > > linux-arm-kernel@lists.infradead.org;
> > > linux-kernel@vger.kernel.org; Clark Wang <xiaoning.wang@nxp.com>
> > > Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
> > >
> > > Caution: This is an external email. Please take care when clicking
> > > links or opening attachments. When in doubt, report the message
> > > using the 'Report this email' button
> > >
> > >
> > > On Fri, Dec 20, 2024 at 08:06:25AM +0100, Ahmad Fatoum wrote:
> > > > Hello Carlos,
> > > >
> > > > On 20.12.24 07:58, Carlos Song wrote:
> > > > >
> > > > >
> > > > >> -----Original Message-----
> > > > >> From: Oleksij Rempel <o.rempel@pengutronix.de>
> > > > >> Sent: Friday, December 20, 2024 2:13 PM
> > > > >> To: Carlos Song <carlos.song@nxp.com>
> > > > >> Cc: Andi Shyti <andi.shyti@kernel.org>; Frank Li
> > > > >> <frank.li@nxp.com>; kernel@pengutronix.de; shawnguo@kernel.org;
> > > > >> s.hauer@pengutronix.de; festevam@gmail.com;
> > > > >> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> > > > >> linux-arm-kernel@lists.infradead.org;
> > > > >> linux-kernel@vger.kernel.org; Clark Wang
> > > > >> <xiaoning.wang@nxp.com>; Ahmad Fatoum
> <a.fatoum@pengutronix.de>
> > > > >> Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer
> > > > >> probing
> > > > >>
> > > > >> Caution: This is an external email. Please take care when
> > > > >> clicking links or opening attachments. When in doubt, report
> > > > >> the message using the 'Report this email' button
> > > > >>
> > > > >>
> > > > >> On Fri, Dec 20, 2024 at 05:59:38AM +0000, Carlos Song wrote:
> > > > >>>>> So we make this logic. Anyway we let the I2C controller
> > > > >>>>> registered whether
> > > > >>>> DMA is available or not(except defer probe).
> > > > >>>>> Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing
> > > > >>>>> happened if
> > > > >>>> DMA is defer probed or not enabled(This is an expected).
> > > > >>>>> However we still need i2c DMA status is known when meet an
> > > > >>>>> unexpected
> > > > >>>> error, so we use dev_err_probe() to print error.
> > > > >>>>
> > > > >>>> Why dev_err_probe() instead of dev_err()?
> > > > >>>>
> > > > >>> Hi,
> > > > >>> In patch V2 discussion, Marc suggested just return
> > > > >>> dev_err_probe(), but I don't accept it so I choose to use
> > > > >>> dev_err_probe() to print error in V3.[1]
> > > > >> In this case, the two APIs have the same function, do you mean
> > > > >> dev_err() is more suitable?
> > > > >>
> > > > >> Yes, dev_err_probe() should be used in combination with return.
> > > > >> For
> > > > >> example:
> > > > >>   return dev_err_probe(...);
> > > > >>
> > > > >> It will pass the return value on exit of the function and
> > > > >> optionally print of the error message if it is not EPROBE_DEFER.
> > > > >> Practically it replace commonly used coding pattern:
> > > > >>   if (ret =3D=3D -EPROBE_DEFER) {
> > > > >>     return ret;
> > > > >>   } else if (ret) {
> > > > >>     dev_err(..);
> > > > >>     return ret;
> > > > >>   }
> > > > >>
> > > > > Hi,
> > > > >
> > > > > Get your good point. I will change my code in V6:
> > > > > +       ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > > > +       if (ret) {
> > > > > +               if (ret =3D=3D -EPROBE_DEFER)
> > > > > +                       goto clk_notifier_unregister;
> > > > > +               else if (ret =3D=3D -ENODEV)
> > > > > +                       dev_dbg(&pdev->dev, "Only use PIO
> > > mode\n");
> > > > > +               else
> > > > > +                       dev_err(&pdev->dev, "Failed to setup
> > > > > + DMA,
> > > only use PIO mode\n");
> > > > > +       }
> > > > >
> > > > > I think this is what you want to see, right?
> > > >
> > > > This loses the information why the error happens (ret). Using
> > > > dev_err_probe even if no probe deferral is expected in that branch
> > > > is perfectly fine and the kernel-doc even points it out:
> > > >
> > > >   Using this helper in your probe function is totally fine even if =
@err
> > > >   is known to never be -EPROBE_DEFER.
> > >
> > > Thank you for the feedback. While I recognize the benefits of
> > > dev_err_probe() for compact and standardized error handling, using
> > > it without returning its result raises a red flag.
> > >
> > > The function's primary purpose is to combine error logging with
> > > returning the error code. If the return value is not used, it can
> > > create confusion and suggests potential oversight or unintended
> > > behavior. This misuse might mislead readers into thinking that the
> > > function always returns at that point, which is not the case here.
> > >
> > > In this scenario, using dev_err() directly is more explicit and
> > > avoids any ambiguity about the control flow or error handling
> > > intent. It keeps the code clear and aligned with its actual behavior.
> > >
> >
> > how about this?
> >
> > +       ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > +       if (ret) {
> > +               if (ret =3D=3D -EPROBE_DEFER)
> > +                       goto clk_notifier_unregister;
> > +               else if (ret =3D=3D -ENODEV)
> > +                       dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > +               else
> > +                       dev_err(&pdev->dev, "Failed to setup DMA (%d),
> only use PIO mode\n", ret);
> > +       }
>
> Please use human readable version of error value. In this case it will
> be:
>   dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
> ERR_PTR(ret));
>

Hi, the ret is from i2c_imx_dma_request() and look like that ret has been c=
onverted by PTR_ERR,
So the ret error has been human readable version?

static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx, dma_addr_t p=
hy_addr)
{
...
        dma =3D devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
        if (!dma)
---->           return -ENOMEM;

        dma->chan_tx =3D dma_request_chan(dev, "tx");
        if (IS_ERR(dma->chan_tx)) {
---->           ret =3D PTR_ERR(dma->chan_tx);
                if (ret !=3D -ENODEV && ret !=3D -EPROBE_DEFER)
                        dev_err(dev, "can't request DMA tx channel (%d)\n",=
 ret);
                goto fail_al;
        }

        dma_sconfig.dst_addr =3D phy_addr +
                                (IMX_I2C_I2DR << i2c_imx->hwdata->regshift)=
;
        dma_sconfig.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_1_BYTE;
        dma_sconfig.dst_maxburst =3D 1;
        dma_sconfig.direction =3D DMA_MEM_TO_DEV;
---->   ret =3D dmaengine_slave_config(dma->chan_tx, &dma_sconfig);
        if (ret < 0) {
                dev_err(dev, "can't configure tx channel (%d)\n", ret);
                goto fail_tx;
        }

        dma->chan_rx =3D dma_request_chan(dev, "rx");
        if (IS_ERR(dma->chan_rx)) {
---->           ret =3D PTR_ERR(dma->chan_rx);
                if (ret !=3D -ENODEV && ret !=3D -EPROBE_DEFER)
                        dev_err(dev, "can't request DMA rx channel (%d)\n",=
 ret);
                goto fail_tx;
        }

        dma_sconfig.src_addr =3D phy_addr +
                                (IMX_I2C_I2DR << i2c_imx->hwdata->regshift)=
;
        dma_sconfig.src_addr_width =3D DMA_SLAVE_BUSWIDTH_1_BYTE;
        dma_sconfig.src_maxburst =3D 1;
        dma_sconfig.direction =3D DMA_DEV_TO_MEM;
        ret =3D dmaengine_slave_config(dma->chan_rx, &dma_sconfig);
        if (ret < 0) {
                dev_err(dev, "can't configure rx channel (%d)\n", ret);
                goto fail_rx;
        }

        i2c_imx->dma =3D dma;
        init_completion(&dma->cmd_complete);
        dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
                dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));

        return 0;

fail_rx:
        dma_release_channel(dma->chan_rx);
fail_tx:
        dma_release_channel(dma->chan_tx);
fail_al:
        devm_kfree(dev, dma);

        return ret;
}
>
> --
> Pengutronix e.K.                           |
> |
> Steuerwalder Str. 21                       |
> http://www.pen/
> gutronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7Cd77fb08d389a
> 46773df008dd20ca5fdc%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C638702775737161676%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO
> nRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%
> 3D%3D%7C0%7C%7C%7C&sdata=3DB%2BR4YbexNiAlDpf5xTf%2BWp2GbmwtfG4
> yKaW8FBvaTRI%3D&reserved=3D0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |


