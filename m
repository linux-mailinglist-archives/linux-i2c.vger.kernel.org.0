Return-Path: <linux-i2c+bounces-9985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE44A6D37F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 05:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4249A3ACBE8
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 04:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A260E18A6AF;
	Mon, 24 Mar 2025 04:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NWVpVG5V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52DE53BE;
	Mon, 24 Mar 2025 04:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742789274; cv=fail; b=gLGlJ064xWWL0WKWsZNFutbrYcjTNRACspyWKEgk9FVRwhhFHpsG7C5wac+7mzkclKnzUQLSF7WYyM89z2WSoQggkbBFVZKQYte+VkrLwNrfZdV/xkDowiD8Jsz2CxEVOlTE+652ZQVD6c0NVEQdW+8iPmIA3Ru+FNw0yb6l6E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742789274; c=relaxed/simple;
	bh=zG3H8P/d2zHS8NTfQ74ZzIC7d4hh82C+fCgpGbSdmRA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aJTi5vGHLI9J82/gR6TzPOBRn9P235QTorkPIZmrSPmI1zQZPTd50jThhHiAql7+7/RZhpSQpqY6ywhsTx0GIEfiU4cRZ/+HOKZXVr/zsHnyofNwt/inV5Vn/VPtdTpML+SNyeWOWRVLtg3ny9KaXJNGxvCIGNqYc+0TAnnk1nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NWVpVG5V; arc=fail smtp.client-ip=40.107.244.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gwf6zMgeJZyASXb4Gk5LGxZng4pVSRJFUN0+Bw8smzbmmqstbwPGDj0SmWcj4/N6CHYQbQh7jNI8uB+L1sEG/SUmEeIpqN8WYnsiOa7dMLOV1SMjhTWra71RD0GUaw1qyrG+U9yeY8obrUzYV0tmXB2uQNOR071lYyqt+d9mtrZPLLZ5uAHBDHLo+KReYadUX//GQvoQsYYlpAaEdDJTgPX1wguS6QRdg/Deg5jsZY+VY+uEvM5x/IJ2xHfHbG/bjwE86NLK19fmCd2Y/CZPQQzEJVIXNTYYAFZR1kEOSycin+h6dOBWWAyyZSC/iDMLfkfSlBIBTcdg3qQWov729Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOjZ8kTsVC+gDs3sqGpp6Zql5OH8M1G2vey+YjwnAFI=;
 b=MtYxJZD1dSceAX/st7RPDl9nq+X6raglRBCeHHlBB/AxTV0W7qfBnTYE1EiaIQktQA5D7e+/Ffdp0Jrk9h6a20imOpRrHljBxZxBBM/PmDA09q/RRnTwh+iDU9UwMvkfsMPUHWloh3hdYMyHUAmLx4MRp6W39LaeLmZX7wi0mQxZql0494DjsspCj89ZnrVOa+R1mi1S7jgAIzUUgiNQIorO0blXx4QTCv/ngZ4yZ+XlbOSmexu0jxLIOq8aZHH4eCJIgq4PG59Gb0c9HmgtWJTRiW3XQQd4Bj2cG4IvMwz1qeqOzn37RzydFRlUx/PaldGMbM3gqdKAp6pPvtwL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOjZ8kTsVC+gDs3sqGpp6Zql5OH8M1G2vey+YjwnAFI=;
 b=NWVpVG5VBOnBy2H8UoflQjC4masM/fgsUNXQ+Ta0v9NszYD8iiIjUtpFisrUx12rvTNpMGAjuLz7VsoV3pgB9SsXa/pGS/3lsxNeD4YCRu0gojr6/wcqSDoTU/n3nc04qypgxB2Zrq11tEZRxRHCZLn1hPfl1L+gjWrQBDiulsCeWSap/QlkKVcReK89h9XYvD39562sO/qLsWzxWG1My+VSG+zILhXpi3JFvPkYHK0HRnkW6B+u1RCNJLef8d1GNDo6dSJT04ojEEap45165I7x8spUJx9olv275yTw6GNWtHP+A/RYUL0aoY3ovLR70fCuRV4bWJx2nubA1pFDIA==
Received: from PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 by CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 04:07:50 +0000
Received: from PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530]) by PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530%7]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 04:07:50 +0000
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
Thread-Index: AQHbmZsSu5QL/Zn+WkqVduI32ERdILN9hiuAgAAIzUCABB+C4A==
Date: Mon, 24 Mar 2025 04:07:50 +0000
Message-ID:
 <PH7PR12MB81781DAABA5BF502A4CEAD72C0A42@PH7PR12MB8178.namprd12.prod.outlook.com>
References: <20250320132144.34764-1-akhilrajeev@nvidia.com>
 <2rlnnjixgd65u6gbqxfuhzu5humehvjth7iysj23xvuv5fi2ft@i5su6kfrqnt5>
 <PH7PR12MB817882F6F4EEC820E22C092DC0DB2@PH7PR12MB8178.namprd12.prod.outlook.com>
In-Reply-To:
 <PH7PR12MB817882F6F4EEC820E22C092DC0DB2@PH7PR12MB8178.namprd12.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8178:EE_|CH2PR12MB4326:EE_
x-ms-office365-filtering-correlation-id: 9fd088d1-5b80-4a12-35ae-08dd6a89718d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?S0im1z6H6KXgAqXW3hcX3zObFxYax3KZXIuwUSwBIyETlVLfgDXCUqgbX8Qq?=
 =?us-ascii?Q?MAjS87EaUigOpgHw0nFHY2LjXx6xmhrZK69buZLuppeIzt8wYQpdvZS/0T5/?=
 =?us-ascii?Q?WLxlm9fK5KNpN3LZI9IgKQZ8CZF0S+I91aJgxys8DOnzDj1Xvu46dfTShsHp?=
 =?us-ascii?Q?f0+vYaN/d9UEfHBlZ9T70GoLzK4mBQFMdk1mY1Q3dJKuuh8AVZu7+HT9Uqgk?=
 =?us-ascii?Q?Pp+VCLSoDeRfQ8PzuFgqK3R4aodEEgwv/F2QdvZgmdJkj83p7XCRiGym2ebK?=
 =?us-ascii?Q?Y8Rp8i3Z4hstOurqha4c8rKymcB0DaHKI52ZwE5nYoXD3a++K40DA6oodKho?=
 =?us-ascii?Q?QoYun7LN538HBhggv6VqJSJA1R2EO3LXT3IX3W54oVKXNxPsCbszTgtlfuZ0?=
 =?us-ascii?Q?bejwb5LCsmbFLYoJtSiKo2EuKMnpeCVVi37aY207ltP/BDao0614J7u+6FHc?=
 =?us-ascii?Q?4FfVN0sK1WEInFzNuCEzMMWMOI4ywHDy3c069MRBRhJKi9A0/m2AIPrPjUCO?=
 =?us-ascii?Q?YUotLpbvow//8U+p1yX8lcMk6KPX8r5Ozxkv4IO3EFLNUnwsp5tpq6h/fxie?=
 =?us-ascii?Q?uBfnqN7VJpFogi0zZwAdWnIZsfkJfr3TxEja5aLXy4Cnh8DiY4nlMzsHTqpL?=
 =?us-ascii?Q?3KXBtYtdmMUTdhrUjGaZJ+ZMlvUWZbExuRe1rF18LM8rGQMzf3ZufTy/9QzL?=
 =?us-ascii?Q?vk+X0+SGf8uGhyZ/ClSbKdQ04c74dQD1x0WhIpZN6emmKloiju1WN96868LZ?=
 =?us-ascii?Q?4lG/tf27XC5Yg90+UfCBC4+cEMD+v6JTUIiP2psU/9g0ikM4jihHbSzzByFF?=
 =?us-ascii?Q?FmmDVi1tr18VksD/SRuG+MWlkmhaWHWr1GCioMXruFMqOktzSoyokGxveg+V?=
 =?us-ascii?Q?Xc3bLOCncwNxa9AjVK7NrdlvxcTjS2/JuStxJYvE+mNrBZbsY374KaBFccHY?=
 =?us-ascii?Q?nJplWgiMJn/DuduHHVvCoZxPBIQeb1al5Duj1LdpKJV+dP3qwLQL6RiE0VHH?=
 =?us-ascii?Q?flIg0e/E2z6aYDzKsE6+0RDr7hm1rrC8nsyvpZ6OxzIY6Wlnh3KX4nFLxgOz?=
 =?us-ascii?Q?DxIUU4zWtWuD12S0f7c635M1XhTATqpbLIr4xxF+7LQ8ULaeaD6gmD3IOhv9?=
 =?us-ascii?Q?hRllZkrvbqzmqgik8nRvMZBjSK+yy3iZSbNvykefLMYQAOL/o1NRdDeflvKn?=
 =?us-ascii?Q?zbAZd+Eejy3RDCsu7C4tIMv9HpefgXgTTdmSjShx+vNp/GBY1F/S18bUM4el?=
 =?us-ascii?Q?ZGYnjccIAolSFo97QE2to8YezdWOULRvL3MS6aKg8YqB6m+K/tmO3H2/1Cuk?=
 =?us-ascii?Q?awCAD1tXUezl25oQfkeA3D+jid54iJkxta4JmHgclX/HKBNSo0RVKRXgTmB6?=
 =?us-ascii?Q?kcnsZ+WR5Nq9bo3VwHbJNQbLJO998f+yaYlAQUm1LNZoz/8ibMl/WcqnarRz?=
 =?us-ascii?Q?2kfHXG106YmdCRFN5CmxadkMjvu0+s2G?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8178.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZHJPU6qWvKTOQ+InK4G+fNQDVVQ244KPWZywke+1jfRUfNH73jjxiUqyHjvs?=
 =?us-ascii?Q?mCZMeNA+W3xLrd3LtBpOpV5lKjTqpJLZwIB9vZp6BlgXYVW1nnjLBVIf+Thj?=
 =?us-ascii?Q?ypLm625TOaPwK/hbp+G+JYrHRqBbi8lR1FG6xfUB2FLt96U/V5XtpoBuQMuo?=
 =?us-ascii?Q?N8r0yvdoTeEiP/tDtu/+8iwLy8GnIBirISwhuijgzC6a9t5q3MP4hTvDvkhW?=
 =?us-ascii?Q?pTYGABO8QVzZNi5HqOzjmYVl5V7Sd+YpWvZQQktmELoVeicQc398i97ehx7I?=
 =?us-ascii?Q?9o2i7Ap3ZIUnml3FhvKnuFwll292LGmLdABXYV/j/V7MIG1cxBUOo/ang3jN?=
 =?us-ascii?Q?7kyLIrcuyLxNbalAXH3PQTcY8Y6iNU+km7YPFCoN7jCqqGMsBSBACasLnqir?=
 =?us-ascii?Q?4Dwpj72Arx50UtBmX78HzFJZb/lpLXSrWv5aboPw3hZnGhKT4/wyAlwfczS7?=
 =?us-ascii?Q?XZRO4MzWS7x6gX8BZRgCWIDUm7hep+fiAqGQ7g5Z511nmrDJCivtTgNAxIs3?=
 =?us-ascii?Q?0r+n13F9xJwiHiUWGMk/FgmPG/+1ONBU7lJ+wCR77wYuWMp3Bxkczlq4iKl4?=
 =?us-ascii?Q?WWjU4U91SizW34IS3lPczSeFB2XpN9Ydqlc2gVXW53LOKb9tQIGV6TaqGkJy?=
 =?us-ascii?Q?sDUfOsScMTFptpEnY1UYKmLAAgHJgYx8Cy3O/G1KT6cyutZxie2xE/165fAy?=
 =?us-ascii?Q?MKveU8y8qBC8nocrYMfb2yrUwZ/tiwzDiaUinWlByqzTDGGasu100HyfGrUY?=
 =?us-ascii?Q?CjzMbwhXQdOvbKRxSGkDW5GIkYJIWaeLHxFh5sRYT8xyBGlPPqh7rZ4hN5Kh?=
 =?us-ascii?Q?ARhbbqMvz8Dmwy0vzr22BBz6da+RgTP5liMZ0cSKHPeQ4OoxGUNPMDq6rFBF?=
 =?us-ascii?Q?wVyBtPeyqFhvsQeygUuF/fGHMxtvGBAKc2xzxCQbGDW+gOI2fxzWTG7d1ZL4?=
 =?us-ascii?Q?w63bRuNku0VWBPLIAqoJtSTQ6E1GCAnPpGDuB8Egr53cdqBL9Vz9rD2Z0l9I?=
 =?us-ascii?Q?46tMJ4InF7gpaFKKQzdJ/u7DFFtciV4CtBnm0/jFFr0NgjtKNA7bJLHvmt7w?=
 =?us-ascii?Q?tb5AK8V+BgcjvZ6CN4P3ResmyhGNMyov5Jsa8J3+LdGCK9X1LNEMvsRAATgc?=
 =?us-ascii?Q?CgAEaGyKQd0W+NZre/FKyX0lqCFgibFdYfPJvAq375GxoaCB4IzCbaZz6AeI?=
 =?us-ascii?Q?k1A3Ii+EOKKnbpWjNVQaStE/H8OkL/C5iNa3lkcoZ949Il3SCqn8jR9Ooice?=
 =?us-ascii?Q?4lPFBg24nC7iCumEJrRZ401k42u6J3Xhv14Ti+b633ti5tC07SBxFZDMOPnZ?=
 =?us-ascii?Q?84rCqYJRBRshCKJY1QpVYoHTf+ARvP8xvOQPbmzGcBBv8U710dlHe4DCBvSc?=
 =?us-ascii?Q?CmHF6LKd8ejfSMxuzWIsMZn7uK1xrKrt0WFFI/ESXsWnQeUSlmkOZyhLGvlO?=
 =?us-ascii?Q?IOKAuBG+dgSAab+fVqjnHniuyshKcba1iMiDkQiPspP2gRiiQTJxHngmLyIo?=
 =?us-ascii?Q?i119EKGqj6B7KH6yth4ahRAxNZ6XwuhHMLHrkoGuLbUs2b2HsQAXYFoFYC/f?=
 =?us-ascii?Q?cEoZLfMK0Um+5QKtZkAy+2g0hs176YDOyyyqBKan?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd088d1-5b80-4a12-35ae-08dd6a89718d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 04:07:50.4488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GGxQZ+NGysHULIn7UTXsnqnRjx9BhC7u66sOjUjpcAqZkU15xFXED9i0gkJg387Unkmu/yQE9BBbd7FNOWTnyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326

> > > For SMBUS block read, do not continue to read if the message length
> > > passed from the device is '0' or greater than the maximum allowed byt=
es.
> > >
> > > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > > ---
> > > v1->v2: Add check for the maximum data as well.
> > >
> > >  drivers/i2c/busses/i2c-tegra.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-=
tegra.c
> > > index 87976e99e6d0..049b4d154c23 100644
> > > --- a/drivers/i2c/busses/i2c-tegra.c
> > > +++ b/drivers/i2c/busses/i2c-tegra.c
> > > @@ -1395,6 +1395,11 @@ static int tegra_i2c_xfer(struct i2c_adapter
> *adap,
> > struct i2c_msg msgs[],
> > >  			ret =3D tegra_i2c_xfer_msg(i2c_dev, &msgs[i],
> > MSG_END_CONTINUE);
> > >  			if (ret)
> > >  				break;
> > > +
> > > +			/* Validate message length before proceeding */
> > > +			if (msgs[i].buf[0] =3D=3D 0 || msgs[i].buf[0] >
> > I2C_SMBUS_BLOCK_MAX)
> >
> > I wonder if this can ever happen. Looking at the implementation of the
> > i2c_smbus_{read,write}_i2c_block_data() functions, they already cap the
> > length at I2C_SMBUS_BLOCK_MAX.
> >
> > I suppose some user could be explicitly sending off messages with bad
> > lengths, but wouldn't it be better to return an error in that case
> > instead of just aborting silently?
>=20
> For SMBUS read, if I understood it correctly, the check happens after the=
 whole
> data is read. So, I believe it makes sense to abort the operation before =
an erroneous
> read. I have not verified this violation, but I think the error for I2C_S=
MBUS_BLOCK_MAX
> will also be printed at i2c_smbus_read_i2c_block_data() functions even th=
ough we
> return silently from the driver.
>=20
> The check for '0' is not printed anywhere, but it is probably, okay? Ther=
e is no data
> to be read anyway. Please let me know your thoughts.

For context, I was referring to the check in the function i2c_smbus_xfer_em=
ulated() at the
line 502. This gets called for i2c_smbus_read_block_data() as well.

Regards,
Akhil

