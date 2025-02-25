Return-Path: <linux-i2c+bounces-9583-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 675EDA4433C
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 15:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AA0117C764
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 14:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEE126FD95;
	Tue, 25 Feb 2025 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dtQ5qLbk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11BA26FA6B;
	Tue, 25 Feb 2025 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494371; cv=fail; b=pHOePdY7lGh8uhOJHCq4sNYztGcsMX9GsKNVc6v90/n4r+T0BeGmQRNghTyB/rugKjjnF3ZYBZOglMF6yU52Ld+eSPR8Dg0KBu/Ka466a+j/sBs8hm2WsCfWSr0yJsfiNoFlk8R7iybkbMt1LwPRIaH4BoQviiQU6Hv/h6Bw5h8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494371; c=relaxed/simple;
	bh=8xtsWNXbqG3RiUaswri3NQWSGefqLPtX7b3eD5+u6qA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FzaPIMWVloySnh1c+JBGhjc4inr58kxj3HYdySbQrmyzRuupQgbBVAU98S0gg8pY6sebIvOo49laPsDBtHiLxX6NxR63fbWviHSG2afMXZDeViZ1UPGPF96qrjwAr3qtFgAgfby+oj/Z53RHwVzDCwasbeZJolkeZeFETTv6rEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dtQ5qLbk; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfPbmwfUNdtiWgdSjtA65Jh5FEbfcj/JsdAIUNfj4SGkYtpH5io6+g6NR1sKKxkwGntqG+ISNt3Zym0oCsMV9py9r/6GHFE/BPyeTrxrTQRt2ffxrkzEFqQV4aMFIZjBoLHS+z6ePd/1w0LCA53a3NgSa4Xa5inFdnB4GA0jPpL2J/nqhK99vkyT329GYfLNmiP7WzpazLYecG6YLvcIbgEa7KZ5vUS1HoYZXtnMAxRdaGNVrC7NEoC0zA+CWy7e78II7uHob+EY/Kd7FsI3NMDEDJS7WhfJ0PwPYKfIfm1dmaqjUwEEIgg0L8M2IXbOCaoauKAupKkVQekhnLWUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPTnJpd+RmjR7LZLKnuYzT+uTumKYday8+lpynfulj0=;
 b=x8gxpv0zREv9dq4SpMxxo41PRciRekPC3ptKgI7pRJTo/1bltyRjMZVtjD3iDkcG9sXP5GfgRw8RqUa9A0Q/PTEYfK9MHf8m/pKgZMVPM17aQ52zb4CCCguZmmu/bc1bx4bAPe4bZg5gvmX+GK+QWo6cHZBH3cURltM4OTKIjI6gZ5OX5wPMjW/JeSqayLPDc139DOsBxqJyf4WUcvFDYXKPS80BN1+FFOIYjcyBTfFfPuQhhlUk/P4UH9UN9F49HM2aKrY0WD7IyMq3M/sDzTUC9QHqviF31IfdDy9vl54RSyLcotsYkvGHWD5ulUYVagiwA5X0TGNDG7iRpusRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPTnJpd+RmjR7LZLKnuYzT+uTumKYday8+lpynfulj0=;
 b=dtQ5qLbk9X/1yHwyDxdaB0cBsBhnVQf67Tsp9HUCrCNMRj4QAn+Tf/dHL0gplam8tMuR42dTe0E84KBBkEMZUyivuMjr/BgIHU/9GkT31Dj+z6sCiV7A7wfdhYCl7U1o2DqLN2ZsLW49xL0fhn2Og1My9Ttbw7g92UfNx7V5ae8=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 14:39:25 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 14:39:24 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Chris Brandt
	<Chris.Brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v7] i2c: riic: Implement bus recovery
Thread-Topic: [PATCH v7] i2c: riic: Implement bus recovery
Thread-Index: AQHbdkjc7JdpLsk8wE2ZvD3XHuMb6rNYOU8Q
Date: Tue, 25 Feb 2025 14:39:24 +0000
Message-ID:
 <TYCPR01MB12093CF58B3C5B89BFFF68B4CC2C32@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB15651:EE_
x-ms-office365-filtering-correlation-id: 0b5c4b6b-53f2-407f-567d-08dd55aa3310
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rSZSmOFHBc9qmFV+RbVgw1ApTmhHEPuodV5bFPGQrgzNmYQrbdCFfk3A+thJ?=
 =?us-ascii?Q?eNLZLTdjCuUdLPKUaH2sbBnpJM0RTNLC327I12Cxr6b3ryxTg7ynI/G27SOu?=
 =?us-ascii?Q?evvle24tUKgZreGxhZaaYAQmWFMvsDI73tJXS5Sx5NHaJ1uVmxoP0uT8Auec?=
 =?us-ascii?Q?XD7tTN6vEWRMiNHjTC2VTKv34LkLLRpwS6m545tcvCFOXh2KntcfLiRZNlYi?=
 =?us-ascii?Q?8bZ21MIej2QqyyX6SHCAgKGNbFlNuD6dHAf7tOsU9PcpWUlPVuWBw1T2hCDr?=
 =?us-ascii?Q?lspVHKNH2OJTyQ+GOPeZF1qe1TZgnV80QuJGML7CKa90H3/7NHLc4bz22c3R?=
 =?us-ascii?Q?pj62Dyj47CsQWSeQFwjxKvj++2rjmvwqyPeEei9SeBLYFcNhc5AypoIM64Qc?=
 =?us-ascii?Q?Fu3LQBtmV+krNg+4ZZ0UlXERq/nyvuF6bb7GElcRCZt7cgwuY06rmqfF3/T5?=
 =?us-ascii?Q?eGkC/yHTvnzJU5Wpz/nxusQCa2FY2sVVJbz9ggYLJfdFq4R3Qjve8pf6D/yK?=
 =?us-ascii?Q?5I1EhfX6vksFMFDI+dArcWGeSN8d5DKzIgIyQRns7I43e0jJ4d5GGwlXNcZ4?=
 =?us-ascii?Q?GOgTPEP5awQ1/wLsLTd9GGe8UwgXGH1/wgTM08lhF3x4iZ3mVOMsqE2YdrfH?=
 =?us-ascii?Q?3QITeMV98hyBTjj1As39zYpMCcD5V2RRZ8B6jFw2VbWgMxH9qXKaCe7xOFfn?=
 =?us-ascii?Q?3+yMApS2m0/xTwyJzWwlnAVz+naNq1M9eFxQwiqjLopPbXK3tZ1ZuVZoTG+Q?=
 =?us-ascii?Q?jTwVK2jBAcqPxb6Y5s9T70oet6SAlSvpjphgb8fbkCKsIoGclTO7RJzUArSb?=
 =?us-ascii?Q?HThOp6fUmEyiJ7YTRGc5VehNKBibC8NPBhwtlBkAaFaK780+R9IcbFPOTD3d?=
 =?us-ascii?Q?/HNxs/qiH1PT37Em+IEJFnyBy89X5pFQERnmGXC7b9g9EWWVG6z8zaGxNlVJ?=
 =?us-ascii?Q?lmCwg45JPD2ucOU16o2plInOseGJPdX7Z5pOKJJxmFnVglLSJKOrD/Hn4nKx?=
 =?us-ascii?Q?YflQDs9l9OjIRLt5ebcuRcajwgxCNVK+oj7m5YGbfrxirse7DogigBkTB69y?=
 =?us-ascii?Q?t49rVBtop4banfh+kz17fFSuNhUA/bCVBCL97mQHtBEyvPoB2VQGC61HUlfF?=
 =?us-ascii?Q?ShpZSD/M1c4nWtUsefNkL4VC5wca28dDGpO+r3tntKYRUVCgnHedktt/5wjD?=
 =?us-ascii?Q?1UbJSkwP6WQCTCZqBwZDWaa2qJNO76SERhepQvMilQwEmMZ1pJ4MQxJl6+4p?=
 =?us-ascii?Q?spKWbxfjkPWVkXkhhrvacPb7JW0qSfK9lT1JjoqlXp/0PLzOghnccabAt/Qd?=
 =?us-ascii?Q?vA04fLxAGkViKKaO/vxto6iaS4TKgODzihGaLCjZY2sHZEUAwqf14qEih3VX?=
 =?us-ascii?Q?OX8g+9HNK8n4GJ+6lR3beqjscY2hW/hzJnVknz8F2QO+qOG10w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yuShHMBv3JEv/XcanoW2WN1NqDgRpz5ml1uKutmHHNoCQEi/sWl1XdIguZpy?=
 =?us-ascii?Q?K/Pfc5hiQj4s0ALau5W3LvN4qG5hprX7BqFSpgEyzOx2o00H8IVeLkclfv8q?=
 =?us-ascii?Q?I1XRE1alpmS83BrLQgL5zXca3o8OxRKo+zgSGz0VqPV9nYTlK+DV7HjaUvdd?=
 =?us-ascii?Q?QLSO/mMTEPcU/MU/Q6Mtw3Y8aZli53GTQPUo5MVbkzb6SMULbWPgaVdSHvd5?=
 =?us-ascii?Q?Pt139XX8HiFb3+boZATyGawmVO0v6LPRcSQUdcpyjrPJmD6SNryM8H9UGpgg?=
 =?us-ascii?Q?um1KPk+Abik+kVV/j69Fa7ervaPjJntdUotnRJxd/qm6uPJZTt1RCok1Ppsu?=
 =?us-ascii?Q?PRv4k4+hONAUYAUl2is9EBqDXW3UK5nsgp9pIPJheKmbIpOyT0+TEY6/MwjL?=
 =?us-ascii?Q?oc8w5+u79wZYHxfZ2N9/Eg8GnSmhYcS/x37/PAE98BmisthSKte/ktpBSmCK?=
 =?us-ascii?Q?3+RO1AtmkwzxYZ6wyHqNGpsmdMryhij8MDAqNfespJoflmSTgmORTaikNfdY?=
 =?us-ascii?Q?n6/pweYIS/YDOz2pijOhqNZaXOkatK79O4shKvEPXk9+0FWR0xodYDIVqDHB?=
 =?us-ascii?Q?qQ3ojX8ROJnEncjCtnZiWq/qx2oU8BOESN/RQHpf6KaIfPbMnijDDAWL77So?=
 =?us-ascii?Q?4PiSlTQ79CLLptWG2AM9jrOhW2hzQdL6wCpJXUHGl+mxZfbL2B1WjI1gDnW2?=
 =?us-ascii?Q?64q/PT08et/y2ndpHaZP9HZHOB0UzvU2KLESEkkggShnpoqYSEcN1NZSbmPU?=
 =?us-ascii?Q?s16GdYCHnsFOMSXk3fBcErpM95kX7OfN670lf1knUModkXaSquI5l/gXEmdH?=
 =?us-ascii?Q?29VGN8z86KJU4TWo3+Su9WmqN7DgoBEUJh+QFfJInP8XH8Z8ODgRzzOAawoj?=
 =?us-ascii?Q?oQaOsGIeqkXDrebb+aofRLzYzEuB4GEPs1vdFtQBtT2ybS5rOcmZF1FvUx/S?=
 =?us-ascii?Q?4H1ffOxTTPRKgGGKPKFrrrPo3Tny32edJ1oxFwONu4ADIGvX4epGG/6DaCfu?=
 =?us-ascii?Q?ijJUXb5GFqiiMTKFwySkXJG6XpI4L/AKvNfRs81SxgIU/IxyfpPgmjKs/1Pl?=
 =?us-ascii?Q?9MbRxB1IJlIikCguYVwXuDsaqza2csmTBHE/G0bGTcJhR9nL/DrCsV8C9BK7?=
 =?us-ascii?Q?Gu+gYEGKvHNIJHqIraKEuXEbIzMkEoTa7h1Buz40sYD87j8UIMMh2B/vaDPr?=
 =?us-ascii?Q?s7qq4gOgSyksWIiIu9hWi7hgZydXgptfh80HHhfatMMJTPDeBijRhAb3fQpm?=
 =?us-ascii?Q?Jcx79MpYp0/9ehc9RV2tjHwNvCqzX+xRY2dwvqLiBu+tYnDxFHyIoXfIkJRJ?=
 =?us-ascii?Q?G6m5f7c/uzfl1nalUaXfqbkp3UWpCb6EVewRh/Ip8hCXkM6jD5mZm8b82oyH?=
 =?us-ascii?Q?Y2WEJuCKmJUPcmqW0OUFq7a9I41DOgewjtCRw7+3DXh6LzQTxmxZvajrdd2y?=
 =?us-ascii?Q?m1/Qc0cQ8zCsFcm2q8FrfRM3u7Yq9hmghk1yu0IJ4ZWt+NE14O6SXoKYo9VN?=
 =?us-ascii?Q?EF8asO9pE7zY95f49+ui8LPf1c7x+ZpqogjQGNTTRIIMbAtD2HmUqtq0RnGJ?=
 =?us-ascii?Q?cv3Cl504C5m8fPQDtOhbSOE+/BL5/TKDJMY7HJF/vokZau608tc2G16uft6E?=
 =?us-ascii?Q?EA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5c4b6b-53f2-407f-567d-08dd55aa3310
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 14:39:24.5940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsoRBeOlSKuo/RVMKr77kEmxPHm9JCNuykY0rMOoGGid1d1w2i+wzHy2cWtqiMCiZ6eQL3d9gg7xHhkS2fDis2d74v0SsTplQSxsD+0lxGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 03 February 2025 14:35
> Subject: [PATCH v7] i2c: riic: Implement bus recovery
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Implement bus recovery by reinitializing the hardware to reset the bus
> state and generating 9 clock cycles (and a stop condition) to release
> the SDA line.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
> Resending this patch which was part of v6 [0] series.
>=20
> [0] https://lore.kernel.org/lkml/Z4ZCJYPgvS0Ke39g@shikoro/T/
>=20
> Hi Wolfram,
>=20
> Ive replied to your comments on v2 here [1] as to why the generic
> recovery algorithm was not used.
>=20
> [1] https://lore.kernel.org/all/CA+V-a8s4-g9vxyfYMgnKMK=3DOej9kDBwWsWehWL=
YTkxw-06w-2g@mail.gmail.com/
>=20
> Cheers,
> Prabhakar
>=20
> v6->v7
> - None
>=20
> v2->v6
> - Included RB and TB from Claudiu.
>=20
> v1->v2
> - Used single register read to check SDA/SCL lines
> ---
>  drivers/i2c/busses/i2c-riic.c | 100 ++++++++++++++++++++++++++++++----
>  1 file changed, 90 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.=
c
> index d7dddd6c296a..888825423d94 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -51,6 +51,7 @@
>=20
>  #define ICCR1_ICE	BIT(7)
>  #define ICCR1_IICRST	BIT(6)
> +#define ICCR1_CLO	BIT(5)
>  #define ICCR1_SOWP	BIT(4)
>  #define ICCR1_SCLI	BIT(1)
>  #define ICCR1_SDAI	BIT(0)
> @@ -69,6 +70,7 @@
>  #define ICMR3_ACKBT	BIT(3)
>=20
>  #define ICFER_FMPE	BIT(7)
> +#define ICFER_MALE	BIT(1)
>=20
>  #define ICIER_TIE	BIT(7)
>  #define ICIER_TEIE	BIT(6)
> @@ -82,6 +84,8 @@
>=20
>  #define RIIC_INIT_MSG	-1
>=20
> +#define RIIC_RECOVERY_CLK_CNT	9
> +
>  enum riic_reg_list {
>  	RIIC_ICCR1 =3D 0,
>  	RIIC_ICCR2,
> @@ -151,13 +155,16 @@ static int riic_bus_barrier(struct riic_dev *riic)
>  	ret =3D readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR2], v=
al,
>  				 !(val & ICCR2_BBSY), 10, riic->adapter.timeout);
>  	if (ret)
> -		return ret;
> +		goto i2c_recover;
>=20
>  	if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=3D
>  	     (ICCR1_SDAI | ICCR1_SCLI))
> -		return -EBUSY;
> +		goto i2c_recover;
>=20
>  	return 0;
> +
> +i2c_recover:
> +	return i2c_recover_bus(&riic->adapter);
>  }
>=20
>  static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], in=
t num)
> @@ -332,7 +339,7 @@ static const struct i2c_algorithm riic_algo =3D {
>  	.functionality =3D riic_func,
>  };
>=20
> -static int riic_init_hw(struct riic_dev *riic)
> +static int riic_init_hw(struct riic_dev *riic, bool recover)
>  {
>  	int ret;
>  	unsigned long rate;
> @@ -414,9 +421,11 @@ static int riic_init_hw(struct riic_dev *riic)
>  		 rate / total_ticks, ((brl + 3) * 100) / (brl + brh + 6),
>  		 t->scl_fall_ns / ns_per_tick, t->scl_rise_ns / ns_per_tick, cks, brl,=
 brh);
>=20
> -	ret =3D pm_runtime_resume_and_get(dev);
> -	if (ret)
> -		return ret;
> +	if (!recover) {
> +		ret =3D pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
> +	}
>=20
>  	/* Changing the order of accessing IICRST and ICE may break things! */
>  	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
> @@ -434,8 +443,74 @@ static int riic_init_hw(struct riic_dev *riic)
>=20
>  	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
>=20
> -	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_put_autosuspend(dev);
> +	if (!recover) {
> +		pm_runtime_mark_last_busy(dev);
> +		pm_runtime_put_autosuspend(dev);
> +	}
> +	return 0;
> +}
> +
> +static int riic_recover_bus(struct i2c_adapter *adap)
> +{
> +	struct riic_dev *riic =3D i2c_get_adapdata(adap);
> +	struct device *dev =3D riic->adapter.dev.parent;
> +	int ret;
> +	u8 val;
> +
> +	ret =3D riic_init_hw(riic, true);
> +	if (ret)
> +		return ret;
> +
> +	/* output extra SCL clock cycles with master arbitration-lost detection=
 disabled */
> +	riic_clear_set_bit(riic, ICFER_MALE, 0, RIIC_ICFER);
> +
> +	for (unsigned int i =3D 0; i < RIIC_RECOVERY_CLK_CNT; i++) {
> +		riic_clear_set_bit(riic, 0, ICCR1_CLO, RIIC_ICCR1);
> +		ret =3D readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR1], =
val,
> +					 !(val & ICCR1_CLO), 0, 100);
> +		if (ret) {
> +			dev_err(dev, "SCL clock cycle timeout\n");
> +			return ret;
> +		}
> +	}
> +
> +	/*
> +	 * The last clock cycle may have driven the SDA line high, so add a
> +	 * short delay to allow the line to stabilize before checking the statu=
s.
> +	 */
> +	udelay(5);
> +
> +	/*
> +	 * If an incomplete byte write occurs, the SDA line may remain low
> +	 * even after 9 clock pulses, indicating the bus is not released.
> +	 * To resolve this, send an additional clock pulse to simulate a STOP
> +	 * condition and ensure proper bus release.
> +	 */
> +	if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=3D
> +	    (ICCR1_SDAI | ICCR1_SCLI)) {
> +		riic_clear_set_bit(riic, 0, ICCR1_CLO, RIIC_ICCR1);
> +		ret =3D readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR1], =
val,
> +					 !(val & ICCR1_CLO), 0, 100);
> +		if (ret) {
> +			dev_err(dev, "SCL clock cycle timeout occurred while issuing the STOP=
 condition\n");
> +			return ret;
> +		}
> +		/* delay to make sure SDA line goes back HIGH again */
> +		udelay(5);
> +	}
> +
> +	/* clear any flags set */
> +	riic_writeb(riic, 0, RIIC_ICSR2);
> +	/* read back register to confirm writes */
> +	riic_readb(riic, RIIC_ICSR2);
> +
> +	/* restore back ICFER_MALE */
> +	riic_clear_set_bit(riic, 0, ICFER_MALE, RIIC_ICFER);
> +
> +	if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=3D
> +	    (ICCR1_SDAI | ICCR1_SCLI))
> +		return -EINVAL;
> +
>  	return 0;
>  }
>=20
> @@ -447,6 +522,10 @@ static const struct riic_irq_desc riic_irqs[] =3D {
>  	{ .res_num =3D 5, .isr =3D riic_tend_isr, .name =3D "riic-nack" },
>  };
>=20
> +static struct i2c_bus_recovery_info riic_bri =3D {
> +	.recover_bus =3D riic_recover_bus,
> +};
> +
>  static int riic_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -493,6 +572,7 @@ static int riic_i2c_probe(struct platform_device *pde=
v)
>  	strscpy(adap->name, "Renesas RIIC adapter", sizeof(adap->name));
>  	adap->owner =3D THIS_MODULE;
>  	adap->algo =3D &riic_algo;
> +	adap->bus_recovery_info =3D &riic_bri;
>  	adap->dev.parent =3D dev;
>  	adap->dev.of_node =3D dev->of_node;
>=20
> @@ -505,7 +585,7 @@ static int riic_i2c_probe(struct platform_device *pde=
v)
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_enable(dev);
>=20
> -	ret =3D riic_init_hw(riic);
> +	ret =3D riic_init_hw(riic, false);
>  	if (ret)
>  		goto out;
>=20
> @@ -613,7 +693,7 @@ static int riic_i2c_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>=20
> -	ret =3D riic_init_hw(riic);
> +	ret =3D riic_init_hw(riic, false);
>  	if (ret) {
>  		/*
>  		 * In case this happens there is no way to recover from this
> --
> 2.43.0


