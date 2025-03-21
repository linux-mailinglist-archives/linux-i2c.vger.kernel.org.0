Return-Path: <linux-i2c+bounces-9969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AF2A6BB76
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 14:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45708179484
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 13:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A891C228CBE;
	Fri, 21 Mar 2025 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IY90k3lw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B4C1F8F09;
	Fri, 21 Mar 2025 13:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742562579; cv=fail; b=anwSPrfNmGRU5HaRpHg3p1CeRblIEmQsr/xGVdzPNrBcnvNM12urANYmOAuu0QQbUATj/EPmAP96DX4Lx1ek3A8MfCZFpu2C4IdHro8w+b6K05SouXTJkTTV+nM3ZtZXcBmV1rXsYwOS1FkuPE22ZLEoIJU2pt8XmZKQctmE7fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742562579; c=relaxed/simple;
	bh=wFPzC4kz6Cb8Qei0XPvitQ9NEVGKk2aJQ2O5R2ZQizw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NoaKva7qDJc5+nnvyDO36R5Nzg0cgUzS9M0P4vuI1cNDNRrUsnjVMrHFMQgj98LMeoz3U7pZBE8M3PsfBMcNYMw3mSrDxZ30D/kE6Juvv5qvCgE8PKTXt+8602JKIFcBKB14HFUxWoXNUJUAk6gpDh4PVf049qmQsH/KfH46R4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IY90k3lw; arc=fail smtp.client-ip=40.107.236.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rW9yyt3p5TmXflxh5fCYWppIp0a0qBsWMZ9uC5RIZCIxhZiRsw4Byu1CyJaUxnJn7Jli0poCn10oiwmEL0iLogOFQDUJVXq5ehoQrsRjWlaoFlBCbVRFvLEKZtwjIJMHbEqlUBQgSuRS0iaUtYwY3rzJ59OztQ3peQcOWDvisOXMII9J3ordiBIOZvcBy6Vk+CUgBpvQ8aC366oDXYl0l7PKy9Z8jqNxjW3Z9XQCNZ8chdrRRVQFBBp6qdY/IRND6nyzu7ZCnri9q2MlghOKWfrd3KiTP8/8d43JiD8P3f87T0QsoZhOsvBYPmUY16amSe/f6yp2RePxeE8/yGmqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3pPGL8Jr2me+L0z2AqLZ2Wqr7/xFmWuy32Fj7isdQQ=;
 b=HvuYVHJSHfnB+k5OcwTz5dnWrGhbQPXqQMKokTCcF1ZdaordnVVJCbAEF1Qxhf2ZZzyJjgJbLvT+Qv2WvPiYMsCLeo61EjgSHLV73VR0gySt8tQc0ZDnMZr0mHhO1lmuUxFZjhxQxmV7AUMfpc7bH+PLUIQp2RyLDYmiUGSFzd1DzzQO7nMqSyzfWzj3t0dop8+ePVlWX0CIHoLHuvNhTZS+RBPqHXYiZPQc6i02FHJFmEFaqKsQriyB7q4rqmKldOiYa9eggeaE0SQLT++D3JhbmQz8ibOdBiwVvq/GiVCDafbFVz8Og8jp9tz3GuwKYHj7WKvwcEYuGlE6p25umA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3pPGL8Jr2me+L0z2AqLZ2Wqr7/xFmWuy32Fj7isdQQ=;
 b=IY90k3lwxBeGx4KZlXjGVv14pVpNfNYhCykGiziztOkizcpQbnYRgQbuJOEvcBIgYFCWwhYEvkUz7tsxcHxthsuK/UMBP98pJhF1b/vWnnRTgKR7BGgZf07abQwkDBOkOnb31FaxCQq1CWYVHI5rCxajF/pIzUnibvTmHSZVElSXZ1bkQnN/UV3jFvlunHIXQOtYkWd8mY/AT/j7JnNgiR6CVF3lunSEQMwXbwR2gU8NI5XB3gAHgquGF5fPQOcMEGDdmH5WmfEO8vUGqYkayl1nYOOOCpzK+n4yxL0p0QUarqzah70yHbJfLOLHHydfxOpIBvlm9a40zWc1F28IHw==
Received: from PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 by MN0PR12MB6176.namprd12.prod.outlook.com (2603:10b6:208:3c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 13:09:32 +0000
Received: from PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530]) by PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530%7]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 13:09:32 +0000
From: Akhil R <akhilrajeev@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: Laxman Dewangan <ldewangan@nvidia.com>, "digetx@gmail.com"
	<digetx@gmail.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, Jon
 Hunter <jonathanh@nvidia.com>, "wsa@kernel.org" <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] i2c: tegra: check msg length in SMBUS block read
Thread-Topic: [PATCH v2] i2c: tegra: check msg length in SMBUS block read
Thread-Index: AQHbmZsSu5QL/Zn+WkqVduI32ERdILN9hiuAgAAIzUA=
Date: Fri, 21 Mar 2025 13:09:32 +0000
Message-ID:
 <PH7PR12MB817882F6F4EEC820E22C092DC0DB2@PH7PR12MB8178.namprd12.prod.outlook.com>
References: <20250320132144.34764-1-akhilrajeev@nvidia.com>
 <2rlnnjixgd65u6gbqxfuhzu5humehvjth7iysj23xvuv5fi2ft@i5su6kfrqnt5>
In-Reply-To: <2rlnnjixgd65u6gbqxfuhzu5humehvjth7iysj23xvuv5fi2ft@i5su6kfrqnt5>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8178:EE_|MN0PR12MB6176:EE_
x-ms-office365-filtering-correlation-id: d821f81a-972f-45fb-6065-08dd68799f3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?X9yuej/DHZsz0fvJ2bhnGAzSoknG3uLGmj1mbUEt8GjUQjdJX9EDRIvZbv5M?=
 =?us-ascii?Q?YE3UloSdfJVSfQjDoP2ZKuy3oA7zhgRBt/Q2rgXXBy9dScWynnxhT+BY9fU3?=
 =?us-ascii?Q?EP+xl2si4S1aFb778Hl8kXY1UTKRmrE2aHJ+Pvu/5VSH7y+D+rJq0mTvFuEM?=
 =?us-ascii?Q?pDNWR0ov+l43ogwBERykWYKBD2vkb110XKDANt6Ra4WtfolyMoDEK4VJGPO0?=
 =?us-ascii?Q?XgAVwj6Yd6I1HbCIBHDk3/6eBaFWtDqWSkJY5HRpaC2CDlvo+rFCCdOuK8px?=
 =?us-ascii?Q?8OIYlHlF6DnBVPfiElq0O8NujBONYPebPye+WnuLJeGB5rYow/kh/lF9IzuW?=
 =?us-ascii?Q?DMSNm6Xyz4alm0+MtXbAqnLiUVhCKkGMxYDttMvLEwDVlIBiWYcK7LTP4Rsc?=
 =?us-ascii?Q?GnvfvmsybwyZW8AtLkeMXXHyb1E8jqfeHkHTA8EWQkL02zi51TNULzED0EsX?=
 =?us-ascii?Q?kbFCQ88T5FLolUIatalN5FmKNPknxEfS5SV1V9cpqHKYs1/RaIhC7o3xp4kQ?=
 =?us-ascii?Q?8LIchW33xkR5zK1kjY2NPoCkeweZzmxkKBKmRj2jpavjQdh/fgxSGpzCJ/w1?=
 =?us-ascii?Q?1N2ZmLUi7/GIMOajRt/R286nE8A3cOCFpent69Knt6aknTz9cCkYEOBS84Eo?=
 =?us-ascii?Q?S7Z4OMT+zaZUUlEs8t+SA8ngKlVXTSsDO4V+TxXq/9hNk3xqj5BECTcaoKYg?=
 =?us-ascii?Q?fUhDfsyjDXcugAikE1gdxbSkcmjRhX7ntTbS1rVutJnRp+5xwDdCP/UQ5DIp?=
 =?us-ascii?Q?k4NFBT8GZP1e2bcdX3gGMwDXnOQKj61TpzM7GU736Z61QmAgX2XxpHy+QyzI?=
 =?us-ascii?Q?1TC1ptnDnK2oGSHnVfrzpN6tgy5mGAHAj6/LS6eEVjluj9HJbT/h/0aXjUPf?=
 =?us-ascii?Q?IY65iv3Pld+WxpUp+/ohRCinQB1BhxMfAhOxnXcYTrTWvAvoDPKLgCWD/NQQ?=
 =?us-ascii?Q?tpV925AA15xcCmz+D1Y02Egp3fOvf0gvDjUYpt2nMhmSYUkv5F+F5OVn5zFQ?=
 =?us-ascii?Q?BL+gRx+1s+ijDrOnymRpu7cHIhEf8GJmCld8d7+EpXzumcE08QcNk/hYswr/?=
 =?us-ascii?Q?42AhmUCwPd14KsWjcBhnZ67frDXPxbBNfZCDVICNdCj+CRN1wiJDGkWgrp/x?=
 =?us-ascii?Q?4G63i7Gletwsr/NYvrX4te/jXSoHucn8aGkfaYEPYob0enpTO9vdSQJZ++VS?=
 =?us-ascii?Q?Y2q6N5bxOnQG7MdQbVY9KZZPfz6yXrqxl9hUjF+XpetXTj2sJ6diBfSFs8St?=
 =?us-ascii?Q?GQda1wOMokcHyWwAl9gzmhOZWrc3YSTVEvpjRfmj+Y9uM6TrlgKHar7aa5xZ?=
 =?us-ascii?Q?nGzv6mmwuukLVA85RuFTCyUdDd3jPu/+Fbt4HPdsQnwmoSbrcoI07Z1DcvvO?=
 =?us-ascii?Q?4W9twFAb5NyHFM3B7Uy9M9n9N52V4fHkm6GETH5h0Gzda8MNHhdj1M/t+ZpI?=
 =?us-ascii?Q?n6XmatYaFNIi9MxzBpkthou68bFQi9hk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8178.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hwHirM0CtKbllhDWziZfddeRex4zNFgLeQLFRS7tvci+iBXO7I5ccc1lRr80?=
 =?us-ascii?Q?4cHr8BnfM+jqEsSEQv6CRN+Us8PrGPNWxTvQcKZDPE5GMD31MT0P8i8ZLjUM?=
 =?us-ascii?Q?8EbdtEZiSpSDg4BYwkuMEM62MCGmcrfFbv3B1lK13kuTnXinsroj+3Z7GqPm?=
 =?us-ascii?Q?xZwALt4EzSN/8mG7xuAdkCa0l06YtiIvrL/kQ19Lx3j7to0nx8xqFZB1Pcjn?=
 =?us-ascii?Q?ywGHvX14msLdCQJAkLq14Oyr7zLiLUALVPmZdqrKMVK8UR3r31fzhrzU79Iz?=
 =?us-ascii?Q?cAgEAEZtoib6/jQPNkVnat7Gu91dizXz30TQxRlNdeZsN2mwvoC7+EVVRglJ?=
 =?us-ascii?Q?BUEI5U4avn2UbtBvIr0hGS7jehuX+7IvPqh+SstvEl5LlbB3YNQUVvDdU6ZJ?=
 =?us-ascii?Q?K4/JbUe1n0e+L2iWwQw1fuT3p8N8hDU5C8Fwid/H4hghZXW3VhWaOAy+3BpS?=
 =?us-ascii?Q?pN6jNIZOT2xqYqXZukFfy6v/gTWIauAmYRln7JW955KPS7VfVaUWv9XatBJQ?=
 =?us-ascii?Q?5EqPy7EBkzKzjVuSd5YYIM6KCYmoDUPvx0+4tsT9xmZI9MJd09AE1KPXuMWO?=
 =?us-ascii?Q?k0vzjEIvpPHMyjoCzHKYxdekpwpXNpR1BQ2Z3yQbVQo1pcIwJEWnO6IB8/Ty?=
 =?us-ascii?Q?osiLktd3aOMGngUgus9DM4M7kFLFGVFntlkxGLz+8Rgvgq63BKDtoIr9RBnB?=
 =?us-ascii?Q?zFYOSP2iRv51aggpm32bAamnAzLhj4W7WAViqvr3AZrkmCnS1efN4zhl/74B?=
 =?us-ascii?Q?Tcytd+X8qkmTAL0KaliXpnkgJNOuDHNhVvYB/oT2bVWKSXN2Q7VQLFZBhn5r?=
 =?us-ascii?Q?P2/o32dasZUEzo3Vxm/byeucXQIJ2hWkGkPX4TBfQC2dO9QzuIQeeWF301FK?=
 =?us-ascii?Q?l7ycEXSyPvWTL+94xnD1Z3BtvhFQ2gKeUdhcyIHV88Zpu5+/8jvICPXOdAM4?=
 =?us-ascii?Q?jMQhL1MxQxUr9X4IuI6RaUsxDrMf3z6P/QQFyD3FT6E3ZHYIN3jQLAggKv4v?=
 =?us-ascii?Q?wo2SYWEMVE5YEYrkBKjx4J7OZad/Wlm5ImtGSs3/rzXeVpzuv3ItyQEg9C8X?=
 =?us-ascii?Q?E3QMKC6L/o7UPdKJiLUGmyvNaI/2h2wBdk3TVOI1egSzL+At94HMzACXKhxA?=
 =?us-ascii?Q?cpCJg1focV5Xa3af1HE7HhoAen2pGyS/6gR2K43pax4YM2wlMthGlAPpYbuO?=
 =?us-ascii?Q?s86ofw6L711KWwHraWlRkBTtmDx3iu1kmccivVZsMOnLy+ppXjW3ZQ2CN9HT?=
 =?us-ascii?Q?MZ/URY5Ilnnu4s/dTWeJuyPuEhCVfOpn3cyGSh0Tnq2qB6mVcQc6pwXAR3z4?=
 =?us-ascii?Q?cw9kZOcQ7ta07RPj8B14RNXCd7Dk72JY7gLh3H+odOpxEJlVfyTg+3BKenuH?=
 =?us-ascii?Q?mIeinCJnsSh1je6r+j9L8pbogJzcSmdt5MtPJXWSObla3y8uIfPOYhsGE0m5?=
 =?us-ascii?Q?+qLGCjM0ih7lvqb/Um1R5lvcH8QWadwoXcGaEeG2I4HVYd/pLFUYFW732/+c?=
 =?us-ascii?Q?ZIBueyLbHs1EeXqz1g8o/UBaeRBla7PIDhfF7NUu0Oxo54JPk6B9TvKGtdOM?=
 =?us-ascii?Q?a7CM+06NM+Lp0GAwWXNa3ic+pR8oX+gGQamZk1SP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8178.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d821f81a-972f-45fb-6065-08dd68799f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 13:09:32.7706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jAaPPrUy6v/ZaNm/enmSXfHdR6toM0T67w6tf1OqajS/WU+IrXGikM7srbQbAtC61UAVkFwY9u/Yj0SaPsh4ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6176

> > For SMBUS block read, do not continue to read if the message length
> > passed from the device is '0' or greater than the maximum allowed bytes=
.
> >
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > ---
> > v1->v2: Add check for the maximum data as well.
> >
> >  drivers/i2c/busses/i2c-tegra.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
> > index 87976e99e6d0..049b4d154c23 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -1395,6 +1395,11 @@ static int tegra_i2c_xfer(struct i2c_adapter *ad=
ap,
> struct i2c_msg msgs[],
> >  			ret =3D tegra_i2c_xfer_msg(i2c_dev, &msgs[i],
> MSG_END_CONTINUE);
> >  			if (ret)
> >  				break;
> > +
> > +			/* Validate message length before proceeding */
> > +			if (msgs[i].buf[0] =3D=3D 0 || msgs[i].buf[0] >
> I2C_SMBUS_BLOCK_MAX)
>=20
> I wonder if this can ever happen. Looking at the implementation of the
> i2c_smbus_{read,write}_i2c_block_data() functions, they already cap the
> length at I2C_SMBUS_BLOCK_MAX.
>=20
> I suppose some user could be explicitly sending off messages with bad
> lengths, but wouldn't it be better to return an error in that case
> instead of just aborting silently?

For SMBUS read, if I understood it correctly, the check happens after the w=
hole data
is read. So, I believe it makes sense to abort the operation before an erro=
neous read.

I have not verified this violation, but I think the error for I2C_SMBUS_BLO=
CK_MAX will
also be printed at i2c_smbus_read_i2c_block_data() functions even though we=
 return
silently from the driver.

The check for '0' is not printed anywhere, but it is probably, okay? There =
is no data to
be read anyway. Please let me know your thoughts.

Regards,
Akhil

