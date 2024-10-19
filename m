Return-Path: <linux-i2c+bounces-7482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 654E19A4CEF
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Oct 2024 13:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D47DB1F227B7
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Oct 2024 11:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1F71DE4FE;
	Sat, 19 Oct 2024 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="Sii4DyA3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17171474DA;
	Sat, 19 Oct 2024 11:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729336188; cv=fail; b=QiHgpG3MaFQFN3Jd6iXrd3t10blhX8CUZojHZ76vgzeqJkIM0D8tmniSlz9RMK5eivYxHr6rn7LSrE45sLZRkxgnkaSJiqua8+WJue1AmdsETHkuB6gTufa2M9wP3C1tLsiAa2HVdWCgsHBktgq7aorlhWbFlKgHTROW0Y/5cr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729336188; c=relaxed/simple;
	bh=8purmoCzIwRA5DttaGeJOd7A0PWZWWx1y0ZUgOSvfi0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=izJS2daXU0RF/t0IQSuYI8YVGHmV5zrwCLd7CNQaydY57Ce2/4635+sZCTgLVMSx/dWoMVI944N54SlNFsgeWcxAcy+jqH3YWfDl7hC5CaTDOvCo6O0XFdqjGSzt7IZ3dqAHVerXiPhiyd5j36TnH/YS6RZ7z+SW30e5rZOIEX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=Sii4DyA3; arc=fail smtp.client-ip=40.107.21.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZdi3MJ1G6NTekavBjdbh1BmlscT0CTPesbHhUbLVjogrv52wEIH6hSFU7YYT44SYaawcioRzRZK2Rd9kDPJGKo9OlHfGMtXeO0AFkjtrKEMSi1DHlzvlWF0JnNheUfXUiWd90gBQmFARQKqRCEdhIerfTScAsZnPXGwhNLat/1L2ub3C7VXXUtx4FDy2Lcs3zDNNBdyIsEk6ud9l0hsNgrDP+fQREEXNLPfGOSNTkh3POyXiA0ie8lVpLLZtMszETmtLvIaYOv4C4Yn8vSyXAfbZgt8LTmTJyrv4z9/ASDIzUYTMoQtwMrEF5KDiHt0ifUSYEkq4e9AAYEuD4mjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8purmoCzIwRA5DttaGeJOd7A0PWZWWx1y0ZUgOSvfi0=;
 b=kFfaSHms50YDkURGwpI3uG3bs+ykQHzNK4uIp9Qq9TDvk5MBwVu+Zzoo2dBLMCmE2R1vzk0bYMZlxKIBVPHupvQcLmLZKX9RLNQsBjKrTo47+PqpkkyiYapUInqxv5zuq4rR/9hc8EXX7HpWmLnMkLYRJHTnL+h+sZKAVZXRSU17oSKZVW+RL6tykn/dFlgATa6afZmKnaJWEUyo3/XmdEexOYRKAAiSzBL0nV7K6O1pFOs7VaEfOBqpafcqIoQOOVBTWJX8WpFXcp/+cen2rEazm2t/Km1FfUjNU06De9XaV1XuORuACTpq+xA91xRISuTwQMbcw6/H8B/j5GVwVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8purmoCzIwRA5DttaGeJOd7A0PWZWWx1y0ZUgOSvfi0=;
 b=Sii4DyA3goJgjvlnc5fYD30CXvnvgsCN+rDxGKZMuhimKMki+lI6Tz6+lJFPOAxD3S3xQGJ7ohvU/Kh4HCB4VBqYZ81AnOX7Ujokbtk7tpFleF8jCqwfS9B1MyyB9zeG2CnFHe68VSrs1rRN1dN8evVLHbpYKdu7WAL+EsCJhhXDnIRSp5cQjUPiaVi1/DYstUogkHnRp5chqNI+/3ZrtQP9LrLPddIuo36jDOKA7XefZoJsILWpOFo4I7myqOTtG8WV06/n99mVPoDxeOtAiITMIGsXM35zlBXY5wbZmIQWpUQMC3HTwTBkhmyS5K22hXrAhHRWO3a0kWnzxM5sdQ==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 DBBPR07MB7401.eurprd07.prod.outlook.com (2603:10a6:10:1e2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.18; Sat, 19 Oct 2024 11:09:43 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%4]) with mapi id 15.20.8069.016; Sat, 19 Oct 2024
 11:09:43 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: Rob Herring <robh@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "peda@axentia.se"
	<peda@axentia.se>
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: pca954x: Add timeout reset
 property
Thread-Topic: [PATCH v5 1/2] dt-bindings: i2c: pca954x: Add timeout reset
 property
Thread-Index: AQHbIUUFrG6WthXGGkih0sA3DyggLLKMh5wAgAFjS98=
Date: Sat, 19 Oct 2024 11:09:43 +0000
Message-ID:
 <DB6PR07MB35091425FE5CBCD782B465A69D412@DB6PR07MB3509.eurprd07.prod.outlook.com>
References: <20241018100338.19420-1-wojciech.siudy@nokia.com>
 <20241018100338.19420-2-wojciech.siudy@nokia.com>
 <20241018135314.GA91900-robh@kernel.org>
In-Reply-To: <20241018135314.GA91900-robh@kernel.org>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|DBBPR07MB7401:EE_
x-ms-office365-filtering-correlation-id: d69c8270-10f1-41f2-e35d-08dcf02e88f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?/RZZGGJ9KKXjP5EpYFKEEeeOFyrNLGpIUTVQ8N5tN7s/xXBIVvHrCykO6a?=
 =?iso-8859-2?Q?MRGtWPjgH1dDSb+vMfPJwxoEcDWZTG2xF0LmbuEpUqBS5sPz92Qccs3LEI?=
 =?iso-8859-2?Q?IBI+g8cQpADfpIgwHK9rY7vVxkmfH+ZUBjXkh57ITVyPvwGPTrhTIZSd7t?=
 =?iso-8859-2?Q?A8CzfQZC9aDkACcjs5baDHHBJwUUq2kG35HSx1AkQw8AEL+cRTBXZ5io3L?=
 =?iso-8859-2?Q?KjhIQyT7FPDnr8mzIVWkZx9Tk1123+CDuhyhEqGDVqANguldC35JLnJc+e?=
 =?iso-8859-2?Q?AmfmgePcjgbLBe4xltIMGCEpB4ZWSFEuU1s+OJJx2n6gh3JDRg5C42s3fs?=
 =?iso-8859-2?Q?YOLWFortzp83j1jnpDuFWWsjamVBTMesB58BykfMTuWH7DygpAWP3XqSTq?=
 =?iso-8859-2?Q?ijuZekkGJWqv+JBgDQqGVdU8IJHA7+MksVWHSbnfvUX8vcoadXSJve1jaP?=
 =?iso-8859-2?Q?dQGtP22IeNCZf1QmqjwYjeMDP2WESxdKveruVr1Xyuj+eHOLw6y8V6YQV3?=
 =?iso-8859-2?Q?Rh9PxOsB7TcaDkUqmO1jOozlvNvdD4GyqLMf6cbTEBtYQP+Hep02UmNkBe?=
 =?iso-8859-2?Q?I7GYzVcElTkOh2Xd71pPI5WdoM3AoLu2z/VlvS9vlJBwomK6+cuyV5rXxa?=
 =?iso-8859-2?Q?ZxgC0Lc9ssL4UPgqwkHqkuwclUHbwnE6YO0rrfUxrJRmIULTfwwPSTOJWP?=
 =?iso-8859-2?Q?8ei3Ybj2z01R3oADoSfUiJNsc7/jF2LqN0IqAY435XAk0SxpkGMS6jAqyF?=
 =?iso-8859-2?Q?rD7q5hKc3zwNTeSaqGfL77wcm8cDW7/cHadWQ7dQq1D/TczWnjMYfi9wf7?=
 =?iso-8859-2?Q?bR/OtQOFY2hFErjw7D8mGv+uAYF9WFy0FzKqepAduibg6EvFBABcaqBYxH?=
 =?iso-8859-2?Q?DiDQDn5fEHBUyRocPk2J2Ind5QhoxNDtJgjzaG/79pqrY1KqTGuMKAASiy?=
 =?iso-8859-2?Q?vaemIhKMqwlw0FtmDSfbQpeUXAZ2YPvE4Rm1RWVvY7BTwuVJ/+NOA547RS?=
 =?iso-8859-2?Q?Aj+ElGRRKY0rz1mtT836Ig5zAGreNWGoSHle8S3frBSarUE/p//NnVGshW?=
 =?iso-8859-2?Q?qyO6ne/hW5u5DwkswhHZ1Hostk30Nospdt6Q81/JL3LwQvaK6nOYzmfleV?=
 =?iso-8859-2?Q?xl6r6X0+6pSafbr9QR/VC5MGbp2yJVnqv7Gr5XB81KCZH1lSdoWvKm7nAu?=
 =?iso-8859-2?Q?rPujsp+5kV1ltQgTqVqw5wnp5oDKGB0nBqGUQL8GAtN+ZDJLX8P4FKdHeo?=
 =?iso-8859-2?Q?Cpo7gf50tBxS0pyppiegF6p/r26N9z6oPvocU+6fpMcUxVNb4a0/dFFjLB?=
 =?iso-8859-2?Q?RqTe5N1Fv0UC9wVtGVHre28jwUxa6KouQtHL4NJbc6vSAXnZBk9ezGAeal?=
 =?iso-8859-2?Q?Zqnj+XCeu80aG2HO7c8tl5pmxM/j8j6iE+PNQw5VpP5GhCbj0hDUM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?u6IdP30lrohe6e5pvkqFs+mOcEWl1odxliG0wnrDcyflyieJ1i45fQQxDq?=
 =?iso-8859-2?Q?nc4EKIhNIA+Y5ifsiBNVG6IN8KKudEizzqXSG7jiJimUssXIqcQGe//yzI?=
 =?iso-8859-2?Q?6WmRrZZ0NPhCYbNIfZDllzPOrvSkUPpf2v0H9nMhOprwIWaFIf74cxMqFq?=
 =?iso-8859-2?Q?qRjDfn6i10cVD84VX1zI2DfSden7WDn7hWmkJHet8sDWfe8dGNLHAVOR8+?=
 =?iso-8859-2?Q?pWLausvac0SxuZ96mZNz8cpXaHVOQJuhe830/B6jcszndiNPHAYbcYkdCc?=
 =?iso-8859-2?Q?GqYvY+o0ymAftUmdvLRM62YCL0vtNGF+Y7GvlEVNnSU41VSA6AoPgGCT2v?=
 =?iso-8859-2?Q?I8pwDdBxWsiGfthlSdqc2egNipYDGxrdQFvpElAX4vEFHAvGqvPjqnYvzf?=
 =?iso-8859-2?Q?UbulGlIxndMaTZoiAjgl6yDxcF6Zmr9S1Hd6zOuLg/gkUp3fxwTzyXBTI2?=
 =?iso-8859-2?Q?WRpnDQeDYSyZIUtKolLUJgZgpbkCT/JEz2KRhFTatEtFJotnLva18tth89?=
 =?iso-8859-2?Q?oBIJbqHrcgr81sqc8F5BX0B/KbNf9r6Cc1e6pC6Hv09ybKpaShvmLGDz2f?=
 =?iso-8859-2?Q?khMxX4ePAcZtJWqAyVNn7gl+DNYLjvlnQUn+/qS10JJmIE1fp+y+s4kc9p?=
 =?iso-8859-2?Q?Qb52ZN0yAN+tmcUbqsU5beBtCegiaZwmPRk5GI7wr8JPbcmnQSsEnW/BIg?=
 =?iso-8859-2?Q?ntzdZu2pbQ90RAy5l7gHNVYfwRjb5vyaeN9N7wLpCFAJS0DCt+nXhDTNAQ?=
 =?iso-8859-2?Q?FfNL7rVPfBFsN+iwRQSYMUBFUmxoa7MwHxGbqS5nJoqhulPiEPwQ1hmyyo?=
 =?iso-8859-2?Q?M8jER5xmoCHJAlrngWLZY0VTSQ5WuLB3CM/S3Nzn1J3AgyoZmfbJJURxCm?=
 =?iso-8859-2?Q?j/2ylswOsRQGKDEZuGtDJRZt27CaGmvlpcIoUWULHkbnDrijBWJb9t76r1?=
 =?iso-8859-2?Q?1fYLaTWs9rYtFCuKQvUEy8sQJPBSqihxWFW65sPFEe5GL5ibQrZGQZ5n4b?=
 =?iso-8859-2?Q?KJRaP32CUR5wBcrAC1RyjI6NadjoCl0bXSJkS1L8bnqYo8LbkpP5rGnQD2?=
 =?iso-8859-2?Q?IXqvrHSWXiuYte/SXGph4qWxdIQYTEuQvpfM/TG3AImyKL243p7ySkZ/bR?=
 =?iso-8859-2?Q?iKHFHruGL9mpWnZrdP7DRvxT+D9Owou4t8vpqLvB07dnMX1BCPqUJ0LXEw?=
 =?iso-8859-2?Q?WakGdx8Y2bDM6Sb9qAr5QgVOel2QMojCKIrvl20ATvnB5l/XOL/2SC7k4X?=
 =?iso-8859-2?Q?S0Fr7JFA/z4z51qBiDXisDvY5oA0myECIy2Om/RX79RFH3Ae1e2BAi46i+?=
 =?iso-8859-2?Q?4aFs9BxWa3WOFTolSoavEhIhhKj01YmvERmNcE3kRAI72+W7A+fXSVnqr/?=
 =?iso-8859-2?Q?9fn0ktEUJRW2M1pSGe2fgIBxawYs8TwXIZvAY5PsUcEL989QR75+6NWsbv?=
 =?iso-8859-2?Q?tFqfxk+Z60zAx1zLk7z0CtCpYE8BHXZ60vjxMcfM3xOBY8J9SwtPrWKfwI?=
 =?iso-8859-2?Q?WxfJasSsy9dXzSASpVkxefBVcNE1lD9aicYDjCnuwOCjsh0wA6kUNUGFgj?=
 =?iso-8859-2?Q?mJ+/1ry7lpoZOpu3gaJy5OPhYoTCt37o/YjGmBuAdOCFP4XY8qjfOgmQVS?=
 =?iso-8859-2?Q?gT1mOnAA8/OrTRjGosBMH/5gk/K4UNZDK+?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR07MB3509.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69c8270-10f1-41f2-e35d-08dcf02e88f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2024 11:09:43.5816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+K+AK+qRCeAq5Cej96ajOOILazPpcF7a/hgBebXSxoLj2dtmVwsdwPnozISfu13gpBPe/S5gWapPMCljzxw2xDdU6qU2Cs+8H0cM0uRG6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7401

Hi!=0A=
=0A=
> If you have a reset GPIO for the mux, then why wouldn't just use it=0A=
> on timeout?=0A=
=0A=
Because we cannot do that on every board. The reset GPIO is provided to=0A=
ensure, that we have reset signal de-asserted during initialisation.=0A=
You might have connected other devices to the same reset line so this=0A=
must be a configurable option.=0A=
=0A=
> What happens if you timeout and don't have this property? Just =0A=
give up?=0A=
=0A=
This would be the case just like before introducting this change. Some=0A=
aplications might do other attempt, the bus driver can try recovery.=0A=
Unfortunately common reset line for multiple chips is not a rare=0A=
situation.=0A=
=0A=
> Does the timeout time need to be configurable?=0A=
=0A=
The timeout we are talking about is error code returned from function=0A=
pca954x_reg_write(), which calls smbus xfer that is out of this driver=0A=
scope so there is nothing we can configure.=0A=
=0A=
Regards,=0A=
Wojciech=0A=

