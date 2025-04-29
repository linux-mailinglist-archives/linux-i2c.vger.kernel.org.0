Return-Path: <linux-i2c+bounces-10675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08156AA05B6
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 10:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A87B7A78AA
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 08:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51070296D05;
	Tue, 29 Apr 2025 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="McR7zXV4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA602949F7;
	Tue, 29 Apr 2025 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915154; cv=fail; b=QPcNfzWR/qJOBO+suHOOPmvQMXeDspjCGu3mrmD0pkiKluDvLIMVEpzIEtRvqjzI3WBmze2IouqIlLkt3b8q4OwrXukCHqNx5yjohcC1yJZKdCCxrnWDEJhdZ9avLK5YjoXCZsr0u3gezNDNEfU8PhML31Y9UzEL3ubvEmqfbOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915154; c=relaxed/simple;
	bh=vt5kQSK4u0umkEyEjEa3tXHmt45y06Jj4V/i/PNwFSk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=huGh5PcW9c4c7tvAQ5vG+ndXk5jcBZJ+djJ0ah5yikT7ZNJpH69dZ0dXcpk7s5y8YTHMe41CsJ48tW6OBJosXPa7zzRI09QpiO9j+5QAeTKM8FZNXt0S3CsM0jGGM7EiJaAxyqTc/1Dlr9X362X4YmMnIP5ntxemRkQBheH98oE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=McR7zXV4; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0hkYY8BRmEEcfW8QzPhwxPs6dxK2LWcQXU/Ykp/tehD4/DHSDcop0/6zSGl42fJGPxo7bkTA5Juki1W7ePnJLQBIBEPs3msfu8imjSYek8LTDHXzYMtg4k8IKhcXoaKCmb2HEUrY/ULYtZAp3bqL6qMb9zpSyt8tzlNlKpq4eD39v7NvZWMrhzJIR60WL3SNCJirJeGdlGaaWwn0tGtm7ceWYYAbHXGocNtaGwdG9oiodz/jG0PUdvaiNlBac42AXfYzdt74ojKTnRIzUuqz3Ne6UtcBzMw07G5OXrWdyPhSfDv0QBkGyQXxAn0Nm5f+54gxysBb9xkHlQg2D+8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt5kQSK4u0umkEyEjEa3tXHmt45y06Jj4V/i/PNwFSk=;
 b=SXMMI2VVMQwLLo5+BNWMyBnpfUKho6JeOqelKN7l/ga44PIiEZRZ4qbe0MOMH2dT/BQZtGzMXqxoN2YBRj1hFbksasb+A4pv5JzEbY5s5UZ6reMiiUJQOKnyk3cZUq6MCIzM1bcnaRzzoMapoPMnKfZ3bkAUVYP51S5CmTCeVw8El1bbTwxbac7efUSIVdqteaMKplE0PpJxC7L8gZsnOSDxIhAlWB2P0YzwZ0SAJrQmzMIUnTxJkYspAf4Z0sYtpdkSMkCRPEkXbih2jA7CS/s9qtH15CmdjM1yY/tZp27gkgui4N70euCCxEpS/UzdJLl5h3L7xF/qUlxNfAgHHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vt5kQSK4u0umkEyEjEa3tXHmt45y06Jj4V/i/PNwFSk=;
 b=McR7zXV4Xk/JFUgc0RghP2FGAE0UkSyfhA2x2k30k2EkfMoQWZBy72kjTMGvZwy1v+/Smqi2NNcsTWaWFSesvxKEBgnZ3acWO2CshmkseaToGkwJTD6p2GTZshUO+M0WPwoetsEYtvWcLd/lMPyBiadVXiw9Qc29w/t+h5XAaAH7IBgkN7jC8I7dzBb+YvD6N+aYxd0kCbFutn5vGnO0HqtpthJJxaNFAoZlq7AFpNuVKF7hkLiAAsUFC6twa3+6qWuMCHjCVeevjSLfJeqQvPSU/fIWFoyConZjKuRO8NqCj1kpK9+jnFv6POCzrIsjEpoQujLllfbSVXZCJLNJHQ==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB9269.eurprd04.prod.outlook.com
 (2603:10a6:102:2a4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 08:25:47 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 08:25:47 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Thread-Topic: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Thread-Index: AQHbuOBPK7wvQPUQv0W+RHQ863q5GQ==
Date: Tue, 29 Apr 2025 08:25:47 +0000
Message-ID:
 <VI2PR04MB11147A01165E7505FE44BD1BAE8802@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250421062341.2471922-1-carlos.song@nxp.com>
 <ujjbteer3ripubpgmv5qsvhcoki5ibcp4im7vpnna56mbckacl@xxx52nayhw7e>
In-Reply-To: <ujjbteer3ripubpgmv5qsvhcoki5ibcp4im7vpnna56mbckacl@xxx52nayhw7e>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|PA4PR04MB9269:EE_
x-ms-office365-filtering-correlation-id: 9bd53f56-a0cb-43c7-f57f-08dd86f77188
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sYfNDTJs9k3kD7OjK38Zt6uDZuzpW4VGvEzmbEhrF/TsQZ72xPv/Z99ewjZl?=
 =?us-ascii?Q?j1h/W/17s38IGyi5UY7r9iLy/HuD/UHCumvP8IR1fixkLKo1+CyEIG/4Oa4y?=
 =?us-ascii?Q?r4eJDRRuSlvghoHknzY5CTF2tg8lP/jkqrWXbTS2fOO4Lx2nq7LPutqC+0C6?=
 =?us-ascii?Q?vJEBn28pc6dqTZEXy3O0wUzdtJs3T/IZwm3fSuzeVnIlrxAEjdRKGqRGBiAF?=
 =?us-ascii?Q?OvKMHrPUYlKOd9bQA+Z4UaVN8p0AUpvEe/jcQ81ZaPilo8nzme+DVo9b6AB9?=
 =?us-ascii?Q?MtlRz81iG2waPccDtdrkGijnn9PDBeQfMawXQDTrcyCElsPvVgA6iFRajnY2?=
 =?us-ascii?Q?gw8yZrBjnYkY+W0vBpl26t9enUUdiEtz3VSfuIqXo7g9MwCB8m+gfvX9q2zq?=
 =?us-ascii?Q?h8MWYOml8zNR68temZ0oZ/ajreQT0ykPxgZgkTbfqb32opuveJZItcJC/9pt?=
 =?us-ascii?Q?nManxdzcoJv2DayJGvcJM/URkwHMZ8PpGvdqpZt8wI2mBtiUR9uwNriRbtfi?=
 =?us-ascii?Q?S4zlh2rvI1COlaaGFCXkUZT3Efr+5g1tPX+jk4vMPaMY0EtiK5Kg4iGKJadz?=
 =?us-ascii?Q?I850k/H4XKtv6eekTomIotoeAjvTpJWNFPfrV/Yfr8cxsmx8Y2UvfbSSXHQu?=
 =?us-ascii?Q?W884GjYVfHvrQ1RyzKaJfhuPHsplniyhmXoAh88HZlgLecrRRkakKbYOByuR?=
 =?us-ascii?Q?esicCuS1jb7iQ2tGKXWPxnENBT3B/gSQbY2fiYNsZJIVFned1pWMwtuWR9qf?=
 =?us-ascii?Q?N3yf6nL++Hu8ulN//l/u0kacaE/lxZESJKvgiJjmID0+ZX7rEOssPrqLbWFn?=
 =?us-ascii?Q?hO9hfwpJk+YA430gjztI7kowvsbPZ/Z6Uw/J2V4vFGoMuPaNXVfHOo6Lx713?=
 =?us-ascii?Q?6jYxn8IziNdW3wL+Y2bsWcdn2XZb4gC1HaV7ORUgPVEBI1O/LIugCIOeOKPj?=
 =?us-ascii?Q?uBS7ehXVJOEMEfevl1OhuJ7DM4g01o3zlcFkEmYEQbHg2r2iTU3Zt2OGQCS+?=
 =?us-ascii?Q?uk8vKU0IOPA8vOC3/V6dNuHa+eqlN/gJ4hjpcCHQz/NNyFrFf3YSWAx+2gD4?=
 =?us-ascii?Q?qt99J96s0ZiMMRkbAE7Y0Z9bxLdQQgJZvqPPZ10wGX63E26vUvTxQyLWZzsm?=
 =?us-ascii?Q?zWe7NJMEDjqDvEZOrcYcZCmzxQgxenzEN639fhtdUx8VKdjEpZDTnkOjYLis?=
 =?us-ascii?Q?BpuDlD8wTLNdaLzq7rPer2jYCZherOnzb4TCZ1sG81uJw3WYbpTShaBOpBgt?=
 =?us-ascii?Q?z+M5+ubn11WSrc2GrpUustyLpnM3DqKDg/HHMafbLkGDpPB9mPZJrEdxMw0A?=
 =?us-ascii?Q?Nv0+3EcJm0b6TJ3V9MUHp8buvgFcB2tY9k+u/g9H7J8DPhFKuA9mWofpmM0X?=
 =?us-ascii?Q?MLnz4aNp47ksyhahScQQ8yFrOZrZ4hsYfOZIwMtPRwm4QforTicgOolJCaAH?=
 =?us-ascii?Q?F2aI3J6fzP7x7TUgXIVqi2Nga8YZ+ndHujod54RvImwHXEvIrcOMl2RfCavX?=
 =?us-ascii?Q?UhkbLENX7eUCyjc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?M+3kSKmiqowFSgjdo13zb/tKdk063OPEVh2S+N1Jf+VFbDbQRe+JRVp0oTuQ?=
 =?us-ascii?Q?IArhzJ+UHHdUUcHrdY225s+l5AkZQ6FpU8nmKjoFss168S0PBFzdkENEvtGd?=
 =?us-ascii?Q?HD3Yo5aMG/HgOCF8cpJpRYzVQmOdjfiX3qdqUe0a6JCk3gma3LCJ6ASUbcrX?=
 =?us-ascii?Q?B9RQqf5N5WULfwE7xFinJhwcN04sSe9zCnH0QrZ8l+6xbgzRpI1dufSUCUnQ?=
 =?us-ascii?Q?ogIdKOqdL89ayjUc1ggVrjyQjGRmhoPyt3Pgd/QID50RTcKnYcAb1E7A2n81?=
 =?us-ascii?Q?KsvfXTC8tuKUweMnevO11fozKOd/syKZiFxi5CrPPT8iD98z3GdNRbjhrlt7?=
 =?us-ascii?Q?+WFm3cYiXqBLelsPDtP5w5CiqQ9n+BQ7HLGwx+O6EXZtl3JZcVtN6lgfb0Ew?=
 =?us-ascii?Q?XDf4TgAtahpyR/5RDgGHKu0cwVnFbS9p3p/OMIzDuYXrZX7BnQ81gE85nR2s?=
 =?us-ascii?Q?rksHqZ0JcMCXnet7InrB1aNmQMqSBV/sT2bzQSJvtccHr+2jmHUz5WKpFnQX?=
 =?us-ascii?Q?j9MbFmruBaxGcJ5+i1tqc+FthFgcaPGKwPbVjnMLLEw+QaAB72IZTzaIl9Ao?=
 =?us-ascii?Q?BRmWXH12e9rzxSlLZU3U9kFXsfbSFuHWO7QlmEDvRoWqI7bMWaj9wFAp5MP7?=
 =?us-ascii?Q?xsVv9X5D8+fUTOdfXplHgI7iJxEApSDtTqVS3n94iZ+GFed2rj0xT76UTL7+?=
 =?us-ascii?Q?CGccKvK3mbbJQWFCPYjmmEWDN9xjId6+AiNOHLwWitpCodR98BKxZlbf3EVI?=
 =?us-ascii?Q?oEd9VC/3yZf4lvas+8BpIyd3JOv9rz/QxYBAAwLyT835n4Kp7rHa4/qes9n7?=
 =?us-ascii?Q?iN/VE0YWAbei6gHqO/YW9erHkg2OeuddJiqBeYS52q0VLTdsu4wg05sVtvXM?=
 =?us-ascii?Q?Ntdm2w9QGnPkatqVoWrhm/cVWMW0Y2OiteCsoA5Z7OXjk1Nq+3/d2MN1QqBc?=
 =?us-ascii?Q?tpgJr22W4HokePempqBnJiL46cGZQJAvSHmPCPCH0btyFHICWqlfNP0N2ZAQ?=
 =?us-ascii?Q?sTw3xJ0eh0KwhDWmfY94MTLii6gjerDlCqiMpG6KtNvYvzs5361QIgH1aBCE?=
 =?us-ascii?Q?fL1z5bvTtGkjOrugrhxm8ZJPFsAGW1FDANMoWCgoxbt7NLJ3mDls76TmfxVK?=
 =?us-ascii?Q?Zp+Po1Yl8y+jNiR7cKO8MaVJTnvyn9VYK6mmgvFOo1Rg83+fuPbRGWYQvWNv?=
 =?us-ascii?Q?08JD4L7k3MpLoD9gmyqLawKXx+yb3xcy9USoJlRTKZic5MOgoMptnBrdNFnp?=
 =?us-ascii?Q?HSL/lPazMStss2w5Np64IPf5XtD7zvZXemM8Tp5yIko7XU79tDw9qL/dix4I?=
 =?us-ascii?Q?p/WPMAi7SUmYXNoqCaYii+C6pK6wcwbGpZA3WjS7eC3nEDenT4S57MSuez1u?=
 =?us-ascii?Q?VepypMJW6GN61dKHb/A4TEaR61rUZf8PEx0GAj/jcbYe/moqvUezQQYilBnw?=
 =?us-ascii?Q?QQOUZPF6ZGJS3/WSkHXDv4pmqS6dnrC0Y/iL/tXAYWD9fWg6AFg2p8IWuxcB?=
 =?us-ascii?Q?zfT2pTilC6xwmac/fOKKvJ6od02v9o6CUECbnWNOtHjjzy8tXTJS4EAPTtX/?=
 =?us-ascii?Q?+l9L8toEvLqCcJnHO7Q=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd53f56-a0cb-43c7-f57f-08dd86f77188
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 08:25:47.5877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ttI1VfH4cwK51VYfdhNMUE0M4OgRkFhwlF2NuVu3O+F20bZ8S6D9Nd0+Fu9Bk/6XEr2SbXf13jVGrua8p8C3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9269



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Tuesday, April 29, 2025 4:21 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; Frank Li <frank.li@nxp.com>;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe def=
ers
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Carlos,
>=20
> On Mon, Apr 21, 2025 at 02:23:41PM +0800, carlos.song@nxp.com wrote:
> > From: Clark Wang <xiaoning.wang@nxp.com>
> >
> > Deferred probe with pm_runtime_put() may delay clock disable, causing
> > incorrect clock usage count. Use pm_runtime_put_sync() to ensure the
> > clock is disabled immediately.
> >
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > Signed-off-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>=20
> merged to i2c/i2c-host-fixes with all the changes I suggested.
>=20

That's good! Thank you very much!

> Thanks,
> Andi

