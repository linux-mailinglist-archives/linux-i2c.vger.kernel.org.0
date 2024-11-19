Return-Path: <linux-i2c+bounces-8069-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46C9D3112
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 00:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 903F21F2178D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 23:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126B51C1F1A;
	Tue, 19 Nov 2024 23:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="IW5hN6Rc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021125.outbound.protection.outlook.com [52.101.129.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE114AD24;
	Tue, 19 Nov 2024 23:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060311; cv=fail; b=TrPYRMh0SttJvnBXed8wHH+FlnZIxckSOl4odHLgdlbq9OBEp8mrz7GcN2y/wFKXx14vF9wbpup0YMGbHSCcedOIY2PheGzONS/ee/06lOalwNcSs20NUf0355Bg75xU9rsaZucIJ9q8Tx9fIX49YWnWGmAx2FmKdf4vdZMVQWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060311; c=relaxed/simple;
	bh=lgRBN7fe4Ts6d8Ke+WogUXdfadv0STVLtQhLsxqxOFc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J0KNCADNYGzHDynYAnx53GHT4Vhkci9b1SENQNymoGTzjITf3MgmFGnjD6qx/nAfzBqSnCSdj5oZ8iZt1MSNHTm3dKlqEUvc1443l8aWwyjW5sEW37GvoEnwATK2XGNA+Vg7WDYGi/2HakdMEQp2PS3gtxrxRajR/aIZw4b8W3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=IW5hN6Rc; arc=fail smtp.client-ip=52.101.129.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A14Vi4KItRYfJMUPCnJ4K/urFJm3TjGm/c3aF0ks4o0d/3rCVoY3BGsmpOIAiFaSzPEq7fVEa7a7OOBg+awXrnkltidtA23p3GLWAXyLOdiJOVY2Ux7SdZXZ49Tnzmt1bZ5M3TDzkGR9GINzYlgO+2AKErgUvVTUycAZCAQhgpr4mA7Cwd3w3xwiC1BOo1eQe2Ew23IzH/3Puq01rDbOHbTpGCoH2fHSW69jLCjqbT7BrzsneCa/o6vTXNQSoHUoEya4u9TkTcRJpSz2KkQgTcdCCFav51bHUP8auiQrp8k00gU7rd+WWDSLTyHC1cNUuc2IKj4VrB/0SoyIBCoMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgRBN7fe4Ts6d8Ke+WogUXdfadv0STVLtQhLsxqxOFc=;
 b=BFkBvMcguAW/6Mmrla1eTKaKkJ+rUBKUSUZ0mb3cyN80AVXAc4/xmC8fnMNbqLZz592wwiqEiF4abh+SSM4gM2N5LHJmDBL2bnQtI96gxBqzdZKxfDSkgYY3oKIS/wVpDL/vo+25ABhWDoGueuqBYn3D5XhDACU+tFW1kxLY20eKWFbMh9ektdzfQIDUHFZQbWRT+r4ulsQI8Nov3HTtM6HINLs/zE7K86cM4a8kSY2B3mSgLv/kvMvGtnGlQsJIk74UdG6S2YrWhIjni8Ds2wPFSs9gOo3EoB71v9Ue8aR8+ozc2oSCQoC4yBdW3Nhj++q19eElkqflpZoKpBt02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgRBN7fe4Ts6d8Ke+WogUXdfadv0STVLtQhLsxqxOFc=;
 b=IW5hN6Rcl68264uWpb+J8FXHAhkFoBEiLb9xWj6LQRemUDFNKKx6ncPfyfC9THdmXVJqEjzPbS0k1lxlj9RCCTdjXViIEbxREtxzo6GxWg19R7dVm9D6E7K8/3AmgIqSNBs5ao9nDnWVATbYyk6KtnlbgLpJh0LCDMch0lo/0r7OTRwTCQZ/N4GQ8cXVF5/ZQdv0y51UA9Y8La6V0AdeZYypx+0N2bv5al1DrckvQJ2euR9LEvcX+Eib/JJsnM1abbGSvvBU3/stkA9G1IW0OFi+rX/0jSUWRE7NqOHlxiaGi+VJ0rlk1Caxu94NqWTwoOA3psL92rqsJTMF3O0I1A==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by KL1PR06MB5943.apcprd06.prod.outlook.com (2603:1096:820:c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.12; Tue, 19 Nov
 2024 23:51:41 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%6]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 23:51:40 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>, Brendan Higgins
	<brendanhiggins@google.com>, Tommy Huang <tommy_huang@aspeedtech.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "wsa@kernel.org" <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, BMC-SW
	<BMC-SW@aspeedtech.com>, "brendan.higgins@linux.dev"
	<brendan.higgins@linux.dev>
Subject: RE: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
 Brendan to Ryan
Thread-Topic: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
 Brendan to Ryan
Thread-Index: AQHbNxjuAA4NcQwuWk6L3G8oF+autbK4DTOAgAQlLkCAAm9PAIAAq7kA
Date: Tue, 19 Nov 2024 23:51:40 +0000
Message-ID:
 <OS8PR06MB754190CEF8763CCF5CE89899F2202@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241115044303.50877-1-brendanhiggins@google.com>
 <ZzcPJ9sweqxLZOGf@ninjato>
 <OS8PR06MB75413EC87F76AD0B1BBA0FEFF2272@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <x2rt6k5hw2km2vm4wjnqihop3xcy3uirhxs5wvhnesxc2athgb@c2ra7a62mfve>
In-Reply-To: <x2rt6k5hw2km2vm4wjnqihop3xcy3uirhxs5wvhnesxc2athgb@c2ra7a62mfve>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|KL1PR06MB5943:EE_
x-ms-office365-filtering-correlation-id: 34719ae2-0e19-456e-35ce-08dd08f51d51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bRG+l/yJN52j5/S1so06pvjqQ6thMmHOch9PZ+at7zT+sdcpojelz9GXT+9B?=
 =?us-ascii?Q?zeNo1pvHq6D/QmR35Bsfhc94+laxoIS9XNAcZf7LMRBNPTHmLl6qE+xkjDHH?=
 =?us-ascii?Q?Xzwsc/JUbQudCGWc51uR/J6U2DAsuN2KzRD4AP5qqSpct8VTU+4kX3pM3UFn?=
 =?us-ascii?Q?2X/RGi30YMZTwZ1hbNi8apZ92HwQ2yGCyFcz9p+Ge3c+U/n7Wp4/NUHQJv3v?=
 =?us-ascii?Q?60Tx8f4A+64Z1vlPLIMb5qHA8jafrTmZ3rcVT5pMnr9LGzAOe/TN3xhHGnZl?=
 =?us-ascii?Q?AfkuRrSfxGJQJ/w+9ZBNEjKpr11ddErJ3vLvs4hwA48J1TPJbQHjPIqmdgmL?=
 =?us-ascii?Q?yICNypLxBrXSLdCqpZgMYJedFyX/VuNR32pU6lVDCuxjA4u6YXg4ND5WmGfU?=
 =?us-ascii?Q?oyxqL11Yh5KFrqmHt0K3Hm4huQ7SQSY91aBaCMvUGi8u2pRBGVNXgAC/XwtF?=
 =?us-ascii?Q?3L/F3IF056NB0sb9ZT4mlKI+cega8QAGbfmUoBwz+TMRY2RdK/2BxrHoPwr/?=
 =?us-ascii?Q?lw2nXp6G+5YD+uSdxUrzNv7ykgb2bmEM9J4WltOq1rkxYJiW3ZiNTCv/ZxEF?=
 =?us-ascii?Q?q1YBpaqvxitMX0tyMFvayrx+IefyicSdxp3Wz7ID42fZ1d+LOHk0jNR9puDS?=
 =?us-ascii?Q?5KfkF7mFBKhHHBdzwA/fL2mQGLyXL6lRzcwszhNIjE+8TwR8S13rk9Obr24Q?=
 =?us-ascii?Q?T/Mec1lAW7SmC316prEvRzjcSS57dugkgvIGVK/lfqHRqdzGqh7qEwIN6urr?=
 =?us-ascii?Q?aL+nZRVspOwC1CyZd85trPjpmsmiznsffW/a5zPlHNkOzVNxdxmmv1FsfrFr?=
 =?us-ascii?Q?+ovk5yqznJPXwSY8wAbfEs064hd5SOJR3HMgpL+sejHXJgJ75cyv/85hmu1B?=
 =?us-ascii?Q?cVgsTnqzc97Or/e0FaixyZCVHdLrOzXlegI55YrkQjNK8Gsy7LJTKkKm2t8H?=
 =?us-ascii?Q?lx5cvFGfBJbgypo810QFSKi9twGM+gNb1/6klM5vWnE1Y4QJR18nLl2HC/v8?=
 =?us-ascii?Q?9LqmksDQDrUB38UzIJ0AYTqnUoETBkWl1ESVZAgOr3Femcr5eUS3GXwL7Q50?=
 =?us-ascii?Q?2x7ML1/JgJlVKA6mGpxqUaI9EI41LWkHTDRK3BeM9cTpULsDm48g/swdq2Vu?=
 =?us-ascii?Q?AILU+qGJ5DegG1c9AzlhwATYKHQrnjvV/IHXYrjQtzNN7LMaBJfzACH0Nrb/?=
 =?us-ascii?Q?CzF0rWtlM3/5HjaoLvFMrxz5GIBaiQ8zScnxK5pp7eTfyHhZy75KnC4B6HZ6?=
 =?us-ascii?Q?2NR5qDG1D3sGi68QEFs+0p692euaOcgyZjMm4isJcWXSXulmNURNmjtv3iNr?=
 =?us-ascii?Q?IIwrWHGPuhAu9vkujnw75OQnE6RNn/UzUsJW3Mf6OCGZ0QTx/M2qTVjTxKG3?=
 =?us-ascii?Q?xKLrJUA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2/A004HQcgmJUnOw4ol8Crdij+ChtHHNjple0xabOqsjrmMDw5F1BmNdbA6d?=
 =?us-ascii?Q?r8HdTzdlVkL3vhTVplNft2t1AuxWcmfbvWeoeev4U/GpGBBptZexOm1KOuHd?=
 =?us-ascii?Q?70T26gQLMmBB7nEyBF8qZax2KVoF62eO4cIGCd95VEeLwDyx4r8GNZjOsxEA?=
 =?us-ascii?Q?I9K3OPDCq9Cid/nPXTsscZkkkQL87ppE9CHACV3dtM0bALohJMwYLCwgm37R?=
 =?us-ascii?Q?qygnE/wSDzaMS6pDLKe2I6KJFBJSqY/6kka6g0BFfCEnFL7Lp9M2qHxfqhSw?=
 =?us-ascii?Q?aLzyolcBuCJRvzi6iSszdt2jfKreMrADTYxihiMq3T9pEJIE/OOYE/vHQOaF?=
 =?us-ascii?Q?jUh1sroImt6a5OpuQ1tsed+QDfCMDktAkosUHN6fHcyQtQMvjslLsVyq9rrP?=
 =?us-ascii?Q?h2iz5utDQUFHbYqT5tJsODekNHRKJidC6NjW9e/ToBz/6YnxmE1tab7YsNu5?=
 =?us-ascii?Q?KznxF08PdoeV2DJFi/fP+FR+Dp2R0+Jdbc6boUcxvpVbFeJGZQ8aQmcyNF+K?=
 =?us-ascii?Q?WxnC5f4n7npXs42uueSrr7xhVRkrel2uC77j6plNWGWelhxGbh1wvKll85TR?=
 =?us-ascii?Q?gswZPtOkbK21qIG0/ykAebxqUazGFvsPmfpeEaF2MgeeBpZ62v7rhyne/301?=
 =?us-ascii?Q?3mPTFPPOE6zBrkr+HebEeA/n5dKIMaohjuX+TRSmT6ADQ90qNmR7TBF2gHeJ?=
 =?us-ascii?Q?Ewwjxk+9TLKlHbFCGHZ68zZbSpFscA08CcSKqNXwGCefXmrOd3KB1G2wqMKo?=
 =?us-ascii?Q?Sz46UpzrvnYhnL8joBvWeAlV/+SY+D4ag/73fA7cz1lhBC0NSSEG4/YDB/rs?=
 =?us-ascii?Q?LImcWS7+wBCO2uFu0fU5mI/IIshrWd3oIQf83nNTnlcKq9SZHtUzLWu4PtGg?=
 =?us-ascii?Q?aIUGSjXZ3ow3VbU3IBotSd/GlkUhbTbNVejwfJkQjZfNNJQbCG3Ko1dWUmBs?=
 =?us-ascii?Q?XP4ADZiSW+syt0EU8425rekK70z+C8viWtNITim4Vb/giNZzehE4y5L8W/sJ?=
 =?us-ascii?Q?cR9oC5/M2Xs/rGALbiFEszFiLbOjp+MEOM8zW5ujJ3fbJtmflrgo61UZKja3?=
 =?us-ascii?Q?2BiWArxfDoH11jIqqjBSpACipduqzAo43ShWhDcvlS80JRNNDVZXg/NKl6Lt?=
 =?us-ascii?Q?DIwnG/i9HOULjQSbFLC+4v1Ux12dqN+ZCI0duN46DwD12YVe3TLUOwh4i+GK?=
 =?us-ascii?Q?M9zUZnDJtYDeSmat7CAJMKdE3ZaKvmJCOq+//DLRzbtOHf0C3YdJLdiiYEN0?=
 =?us-ascii?Q?Rq5mydPn/JRS7B1QmNrceqllFIVAyN1qnm5LRgVNmUSwa1UehpYd+QKkBExC?=
 =?us-ascii?Q?0PRG1zdwLDcRtXyDmNaoyxi9bhU9pmVKhfALfMm9JuVugQ/wqBqpESTk9oeA?=
 =?us-ascii?Q?SeCpbD3cO6HWaLFFwq60O9LuWg0wAtyCjV9eOINpyn/6JxToRuIwb5gP1oUa?=
 =?us-ascii?Q?yVWcjjt9N3jqeopA8v8Rpej9ClU0hu5qD6CR9E2kLASjRnEbGjc3skhrtf9w?=
 =?us-ascii?Q?LA726e8oVGEpQYFK/PUVu8QWyBNZNI2AzRHjx1IpC3P0GLeJZ4PLX0uojVNI?=
 =?us-ascii?Q?p/4pb+a6Oru4q9noGPJpPsqNwzaxGux2L1wCtrJI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34719ae2-0e19-456e-35ce-08dd08f51d51
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 23:51:40.8281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hw/y+uXcEDAsqyQcMC/tPXsAl/uFCJsCnZQvWLusVp4Sxc8Nz9/Kv6/8MjYOCIgXy+VE5cxvMOb7hNWCuJczNx94ERdSDpPrCP4PUpuziys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5943

> Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership fro=
m
> Brendan to Ryan
>=20
> Hi Ryan,
>=20
> On Mon, Nov 18, 2024 at 12:25:56AM +0000, Ryan Chen wrote:
> > > Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed
> > > maintainership from Brendan to Ryan
> > >
> > > On Fri, Nov 15, 2024 at 04:43:03AM +0000, Brendan Higgins wrote:
> > > > Remove Brendan Higgins <brendanhiggins@google.com> from
> i2c-aspeed
> > > > entry and replace with Ryan Chen <ryan_chen@aspeedtech.com>.
> > > >
> > > > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > > > ---
> > > > I am leaving Google and am going through and cleaning up my
> > > > @google.com
> > >
> > > Thanks for your work on this driver.
> > >
> > > > address in the relevant places. I was just going to remove myself
> > > > from the ASPEED I2C DRIVER since I haven't been paying attention
> > > > to it, but then I saw Ryan is adding a file for the I2C functions
> > > > on 2600, which made my think: Should I replace myself with Ryan as =
the
> maintainer?
> > > >
> > > > I see that I am the only person actually listed as the maintainer
> > > > at the moment, and I don't want to leave this in an unmaintained st=
ate.
> > > > What does everyone think? Are we cool with Ryan as the new
> maintainer?
> > >
> > > I am fine, depends on Ryan as far as I am concerned.
> > Thanks a lot, Brendan.
> > I am ok to be a maintainer.
>=20
> can I take this as an a-b by you?
>=20
Sorry, I don't know your "a-b" means.
If to be maintainer, Sure, I am willing to be.

> Andi

