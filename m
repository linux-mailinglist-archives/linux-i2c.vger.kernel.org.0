Return-Path: <linux-i2c+bounces-2457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D07858815AB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 17:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12063B228BC
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 16:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930671F17B;
	Wed, 20 Mar 2024 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="mwjVuJSJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A04144C9B;
	Wed, 20 Mar 2024 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710952225; cv=fail; b=MJAa7ex6ZYkTeJXLP10JVtOLxqxp3UZy6V3kjEYcUtKPcM/dfJfBv5SWVYvhHMoySX9oTW15boCsZfH2iZazRfJSuI7LkMDDffVIG4uVWvNEBSif53NK3UDeMknleh2bxC64OdtF3UkAmqKTS/7PtE8ckt701XgN3L+WU2ECFok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710952225; c=relaxed/simple;
	bh=Agis6S6aHnC+Fsyt0P9gjsNHIlhLymeSk6x/myudDU4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PzW6LSyUKIO6AFbiqzjJb7/zPaIe1ViYA73r1UhJNiL5eRz88cE0/fikAb6LzNFTPBkD8d7dB0ZyzUfrt/bfycDQ/S+5TS4JTfMwvD10+AuGQczDNm8kbl+ZEQWt68X/Y+2D0eoGJdJmjq0xqABOiwfwE3dUaVYBuB7cQqrK/8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=mwjVuJSJ; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42K9ks55011417;
	Wed, 20 Mar 2024 09:30:09 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3wywfg9qsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 09:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=empQzfdqRldNAQ4Cr5mHU+g3hnDfAe7JeiZ4+owMPwCJNIp+HIo2vRfcb2QoUpLA3gXqcY4LIrDvkVM/gsEv25XxiV7h+EdhtSt3qebA4are1Ii6RVvNuFNiHzcGin7QPKAgZQCl7HhzaZEHhw62D/rsKTOA0HTGeCeBc7q64wAbR3nBGIAZJwAZhz76LB2kLVdqVwiePTHYrymKKStFkVZhKJ0CtN65oOtLR9qFPUtmywsumSeIg9S3KqrK980pCVLowKobHdKFJwL/k7OT2ypqw8rLoeF23TIGVytei9ZnmP9ep4R+8sO/2Ahae+tOFZdUdkz4X+CK7DNK5X7t7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNo5gXco5NHTYEboUUE62/jtVZ+a23Iv1lSh/IxxsIY=;
 b=bIetHWFHgfIk503A9ap1NYVTtqi2REerglI6nbto86cPzwjqokhYNJwFcdMtoCDpPyjp+KVw87wiqhc9cU+NoMG6S3hWRaDAQ2nVcZjBDw1tE99ADM5DhUlp4B87Twr0+efpIuHjgwBUYn0zBnycaxLKs5LNASC3fpGNaBooqL76qfct108i0412XYFT+f+6Yy8BHMe6Dt2FnYW4u0FkdTEgVaV0gHPE++OS771bUertrVMNerNKOtkkRYHEo9eUTa8EyALpe8qwfOYFZfOaPm4oVE6AFpD0fhdSeMVG475dvVo0kU/2NY8CrZ1gUBn/190/1EIOBMrYMId2uPJLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNo5gXco5NHTYEboUUE62/jtVZ+a23Iv1lSh/IxxsIY=;
 b=mwjVuJSJhxM3ImG1amPtTYdn/9Q81mkLyvW7B++RA3RRNX40i8SKTmlP/E71bcZKzQPWGpU1rsLyUA8RYs7wNYmJ4RKuIpzfe/+JZdee3OBJXlfoyAC4UsyNxxvwnIB6bJV13zAfExdFbSvFcrbVQq49q0Xp7dZjuILQID2XNMM=
Received: from DM4PR18MB4206.namprd18.prod.outlook.com (2603:10b6:5:391::5) by
 CO3PR18MB4942.namprd18.prod.outlook.com (2603:10b6:303:166::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.30; Wed, 20 Mar 2024 16:30:05 +0000
Received: from DM4PR18MB4206.namprd18.prod.outlook.com
 ([fe80::331b:498e:4bd3:ceaa]) by DM4PR18MB4206.namprd18.prod.outlook.com
 ([fe80::331b:498e:4bd3:ceaa%6]) with mapi id 15.20.7386.030; Wed, 20 Mar 2024
 16:30:04 +0000
From: Piyush Malgujar <pmalgujar@marvell.com>
To: Piyush Malgujar <pmalgujar@marvell.com>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>
CC: Suneel Garapati <sgarapati@marvell.com>,
        Chandrakala Chavva
	<cchavva@marvell.com>,
        Jayanthi Annadurai <jannadurai@marvell.com>
Subject: RE: [PATCH v4 1/4] i2c: thunderx: Clock divisor logic changes
Thread-Topic: [PATCH v4 1/4] i2c: thunderx: Clock divisor logic changes
Thread-Index: AQHaZlfmc6YAGLvrm0mRs01Qg8lnnLFA+ghg
Date: Wed, 20 Mar 2024 16:30:04 +0000
Message-ID: 
 <DM4PR18MB42064EF9B96551AB307DF38FA3332@DM4PR18MB4206.namprd18.prod.outlook.com>
References: <20240223125725.1709624-1-pmalgujar@marvell.com>
 <20240223125725.1709624-2-pmalgujar@marvell.com>
In-Reply-To: <20240223125725.1709624-2-pmalgujar@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR18MB4206:EE_|CO3PR18MB4942:EE_
x-ms-office365-filtering-correlation-id: bf55713f-b561-44d8-4434-08dc48faff7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 i5NuM16CQ3y8pz9pqux/2UtLqoYs/KBy6QGg/lAAMfn05HclrsNrNeTXdqiGFPWIFLqDTC0JfSv2oaGPTnyynBL4GCkpmGffzTMnwZ5Huk3Pqd6sLC7iiWi/1uUscXcdW+E04raAUX8TtwvjhPVhbaK/vQ4shQPX13FqJ8sxpY8P41ucIEMYt5vSUckvthjy2/2dbWc28XBDOxAgOPhclEM64DuKXCtkB/ypTLoY7z2rmO2HazsdB71dkeRDaUZckiB5+v+zmo86HoV5OPQYY/V87f+FS+hTVO3CdJvjicz6VAqodOZkrfl+Mj11pZ9WRkcc6Si0Ym7ut9B6AntfBMt4bBW3b/58sCNs1+ORxGNgOjEJsKclHr5I/8KG4huij3X/YK6Na3PWyD0epSYrjb7OCvumA9anSle4FR5yabeXdPmZE2GVf4/w2OPrl978fXKysX2NNvIPC+Gb/B8oS0MUbIBLOekyHPdoTns31SejNsUsJ/eaFpDem0xT22NcRkRPVZbfnfNLwCFgArTdqiH8OR+hdDp6DoR/wP91h7nIHdJwgrHPvBLW0ynxl7PoACQuwB9vkz7MF5qsVH2qntZCzI7ljzXfgZ+stENgsbzUHojBJ0eewpV4A5Zv3v3NwWm0vAe8p2bMjIiSywU3/879Y+nCKRrz7wp5abYilb7GVEtsW6/fD0UpIqxbwnDess1fxZdqmnbvOoRH/cT/Qw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4206.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SAJDQbcrwkHvSRuNCR7faZQ2HuIRv30+cBy4kENoLR4j7f6NRv2rNd52NABV?=
 =?us-ascii?Q?Tqw1DRpOMi+kIneSKTcIp3kYhkvM3W8XTCxG+ZJ+tQlh+xhZN5BhMQzW42pE?=
 =?us-ascii?Q?9C8FaDKaVJergiJC4dOWotl2pG5dng8dT5Iv9Q6RADqhAlzcksuREjM50or1?=
 =?us-ascii?Q?hzus+Wx0oqn7wQPeY1wN0ToojmKHtikESos+Y4UxMmCAEaB1dXXoER1XZIEc?=
 =?us-ascii?Q?5wJfOfZYneglo8ljxitbIK+Qu1NiOFFA1Inkm8iq7j7VDhgBqU5E1/ZNr2gs?=
 =?us-ascii?Q?HtipzR3XM4u7E1XHCFccA1SiR1vS+yzTza0i/mH4dbezRstXJvRKaTILxBm+?=
 =?us-ascii?Q?Rvi+yEOnctV0QviEqniKVRiyT9foH73gehq1rdAsWkFGC3IcQb2ijUbmLCvJ?=
 =?us-ascii?Q?TpvJjIvts7jkcrJvrC7A98K70EbHK7NBAnTwIOKCuWnQk9y51ZX5V0ClcdFD?=
 =?us-ascii?Q?uHSlQAGrSi4JKmGZsPTq0cF9KVVf9ZZixPhXWVJwn9KpCWTvivDhqzcX55e/?=
 =?us-ascii?Q?HRGqQsmhMGaVGTR4DS4uBWWdzASS0zM0GlhOLP+RK7K6gf4p/6Tghgk2TbG7?=
 =?us-ascii?Q?zPogPHJxdDrW4f0KSsI2uIPwb8Th0edJhC36swsmP6t8pl1zCx1pKgOH/2eH?=
 =?us-ascii?Q?+HgaGx9sQpypXS0EZmv8z0yWLml2aIOIqXuhwa0PfU28NOM5qyVcssh+WWQJ?=
 =?us-ascii?Q?pTY58boAK8rwqQX0cYevT7GftttpcUwc/KdmzYG9gISHlcPAeZbJ+J3UgLKI?=
 =?us-ascii?Q?efXmermqNH0OdVrOcHR/Fc7fqK99ieT4zdQwfKAHacTUGUFMOdBD9X53/RoR?=
 =?us-ascii?Q?rHvZkX6qtHB/JZAIXBb+eAhSoXWKweoueQ6jIbFaCLqZJotnPXsZJ9IjcgIV?=
 =?us-ascii?Q?r/aWDS1xEZ6J00+dUB665iH6FTN20Pi0ioGf74NWOmDxTZbvjaRgZ7G2i8yF?=
 =?us-ascii?Q?jXHOc+3s31TDcUlCwGIVn6b1C/en+W1YJgPudl5nrQ0UJY06PnY6d4/cKhe4?=
 =?us-ascii?Q?oUcUzh0uayKJTv23jHMsZM3unQSBzsJr2+23UJlOaIxRobl5Fx7K6jiFPbgc?=
 =?us-ascii?Q?EvMBXme3NTe+hnqBjqrbVme2fTBwslCjk29n3CYWctJCWZIicBfPSjNGSYFj?=
 =?us-ascii?Q?C4BsmQUl1mJkIKLkYc6PWZKk108M2qj110fcFfEtSgGL+njH9qDAa4slBqqZ?=
 =?us-ascii?Q?f9efPBKOYR9MgU19yZtd7Rpxey8Dwl6lW6gy0SdN0zSpvCZVGLe3s2PLhqgF?=
 =?us-ascii?Q?MzpB87fCwmCup7jIubSJM1MeQ/vo3xib4o94HHFXX1ECcHv4HNkiDSPkmsNF?=
 =?us-ascii?Q?NJK2Tmt711e2U0RYzsUDudGTDw48omdORJ2MA1qnrkEtAmTqVENMAzBNSKtE?=
 =?us-ascii?Q?r60MXq09GSeVh4O+WX4NOGoo6Zxp1FzOshZPv6bgbzrn7XSRdzkA8CMUTbkR?=
 =?us-ascii?Q?7kZvkUMWxZLg8vNnsTfFJGHWmpJmE8ftMWDxrJyMHcoRniSbC6txpgICMqsW?=
 =?us-ascii?Q?m4puE5yNQELBfvRtd7p2Ob3Eweu9lezQV5JtOntLdInHoOX8HfUhcfaummEy?=
 =?us-ascii?Q?w657KQ5E8yR4mkRkum+Z7mMZhKiMAWlGEujsc6SO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4206.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf55713f-b561-44d8-4434-08dc48faff7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 16:30:04.4708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZn6UJFqvFtOxJw8kG+Yg1AMII9/7X2fXc+3/3DsVIY9OLko3UTiuLWUkLLhWit8N5KpVF3so9ImcXyJw40Vvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR18MB4942
X-Proofpoint-ORIG-GUID: TCmWnrIxTquTDgedVejfm4UAZjhtKLoa
X-Proofpoint-GUID: TCmWnrIxTquTDgedVejfm4UAZjhtKLoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_10,2024-03-18_03,2023-05-22_02

Hi Andi,

We have updated these patches as per the comments. Can you
please review them.

Thanks,
Piyush

> -----Original Message-----
> From: Piyush Malgujar <pmalgujar@marvell.com>
> Sent: Friday, February 23, 2024 6:27 PM
> To: linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org;
> andi.shyti@kernel.org
> Cc: Suneel Garapati <sgarapati@marvell.com>; Chandrakala Chavva
> <cchavva@marvell.com>; Jayanthi Annadurai <jannadurai@marvell.com>;
> Piyush Malgujar <pmalgujar@marvell.com>
> Subject: [PATCH v4 1/4] i2c: thunderx: Clock divisor logic changes
>=20
> From: Suneel Garapati <sgarapati@marvell.com>
>=20
> Handle changes to clock divisor logic for OcteonTX2 SoC family using
> subsystem ID and using default reference clock source as 100MHz.
>=20
> Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
> Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>  drivers/i2c/busses/i2c-octeon-core.c     | 38 +++++++++++++++++++++---
>  drivers/i2c/busses/i2c-octeon-core.h     | 15 ++++++++++
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c |  7 +++++
>  3 files changed, 56 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2=
c-
> octeon-core.c
> index
> 845eda70b8cab52a0453c9f4cb545010fba4305d..10330ed3203f9fd99d5c04db
> af29a9bd49ad0f4a 100644
> --- a/drivers/i2c/busses/i2c-octeon-core.c
> +++ b/drivers/i2c/busses/i2c-octeon-core.c
> @@ -17,9 +17,14 @@
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>=20
>  #include "i2c-octeon-core.h"
>=20
> +#define INITIAL_DELTA_HZ	1000000
> +#define TWSI_MASTER_CLK_REG_DEF_VAL	0x18
> +#define TWSI_MASTER_CLK_REG_OTX2_VAL	0x3
> +
>  /* interrupt service routine */
>  irqreturn_t octeon_i2c_isr(int irq, void *dev_id)  { @@ -658,31 +663,56 =
@@
> int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int n=
um)
> void octeon_i2c_set_clock(struct octeon_i2c *i2c)  {
>  	int tclk, thp_base, inc, thp_idx, mdiv_idx, ndiv_idx, foscl, diff;
> -	int thp =3D 0x18, mdiv =3D 2, ndiv =3D 0, delta_hz =3D 1000000;
> +	unsigned int mdiv_min =3D 2;
> +	/*
> +	 * Find divisors to produce target frequency, start with large delta
> +	 * to cover wider range of divisors, note thp =3D TCLK half period.
> +	 */
> +	unsigned int thp =3D TWSI_MASTER_CLK_REG_DEF_VAL, mdiv =3D 2, ndiv =3D
> 0;
> +	unsigned int delta_hz =3D INITIAL_DELTA_HZ;
> +
> +	bool is_plat_otx2 =3D octeon_i2c_is_otx2(to_pci_dev(i2c->dev));
> +
> +	if (is_plat_otx2) {
> +		thp =3D TWSI_MASTER_CLK_REG_OTX2_VAL;
> +		mdiv_min =3D 0;
> +	}
>=20
>  	for (ndiv_idx =3D 0; ndiv_idx < 8 && delta_hz !=3D 0; ndiv_idx++) {
>  		/*
>  		 * An mdiv value of less than 2 seems to not work well
>  		 * with ds1337 RTCs, so we constrain it to larger values.
>  		 */
> -		for (mdiv_idx =3D 15; mdiv_idx >=3D 2 && delta_hz !=3D 0; mdiv_idx-
> -) {
> +		for (mdiv_idx =3D 15; mdiv_idx >=3D mdiv_min && delta_hz !=3D 0;
> +mdiv_idx--) {
>  			/*
>  			 * For given ndiv and mdiv values check the
>  			 * two closest thp values.
>  			 */
>  			tclk =3D i2c->twsi_freq * (mdiv_idx + 1) * 10;
>  			tclk *=3D (1 << ndiv_idx);
> -			thp_base =3D (i2c->sys_freq / (tclk * 2)) - 1;
> +			if (is_plat_otx2)
> +				thp_base =3D (i2c->sys_freq / tclk) - 2;
> +			else
> +				thp_base =3D (i2c->sys_freq / (tclk * 2)) - 1;
>=20
>  			for (inc =3D 0; inc <=3D 1; inc++) {
>  				thp_idx =3D thp_base + inc;
>  				if (thp_idx < 5 || thp_idx > 0xff)
>  					continue;
>=20
> -				foscl =3D i2c->sys_freq / (2 * (thp_idx + 1));
> +				if (is_plat_otx2)
> +					foscl =3D i2c->sys_freq / (thp_idx + 2);
> +				else
> +					foscl =3D i2c->sys_freq /
> +						(2 * (thp_idx + 1));
>  				foscl =3D foscl / (1 << ndiv_idx);
>  				foscl =3D foscl / (mdiv_idx + 1) / 10;
>  				diff =3D abs(foscl - i2c->twsi_freq);
> +				/*
> +				 * Diff holds difference between calculated
> frequency
> +				 * value vs desired frequency.
> +				 * Delta_hz is updated with last minimum diff.
> +				 */
>  				if (diff < delta_hz) {
>  					delta_hz =3D diff;
>  					thp =3D thp_idx;
> diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2=
c-
> octeon-core.h
> index
> 9bb9f64fdda0392364638ecbaafe3fab5612baf6..8a0033c94a8a291fb255b0da0
> 3858274035c46f4 100644
> --- a/drivers/i2c/busses/i2c-octeon-core.h
> +++ b/drivers/i2c/busses/i2c-octeon-core.h
> @@ -7,6 +7,7 @@
>  #include <linux/i2c-smbus.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/pci.h>
>=20
>  /* Controller command patterns */
>  #define SW_TWSI_V		BIT_ULL(63)	/* Valid bit */
> @@ -211,6 +212,20 @@ static inline void octeon_i2c_write_int(struct
> octeon_i2c *i2c, u64 data)
>  	octeon_i2c_writeq_flush(data, i2c->twsi_base + TWSI_INT(i2c));  }
>=20
> +#define PCI_SUBSYS_DEVID_9XXX 0xB
> +/**
> + * octeon_i2c_is_otx2 - check for chip ID
> + * @pdev: PCI dev structure
> + *
> + * Returns TRUE if OcteonTX2, FALSE otherwise.
> + */
> +static inline bool octeon_i2c_is_otx2(struct pci_dev *pdev) {
> +	u32 chip_id =3D (pdev->subsystem_device >> 12) & 0xF;
> +
> +	return (chip_id =3D=3D PCI_SUBSYS_DEVID_9XXX); }
> +
>  /* Prototypes */
>  irqreturn_t octeon_i2c_isr(int irq, void *dev_id);  int octeon_i2c_xfer(=
struct
> i2c_adapter *adap, struct i2c_msg *msgs, int num); diff --git
> a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thund=
erx-
> pcidrv.c
> index
> a77cd86fe75ed7401bc041b27c651b9fedf67285..75569774003857dc984e8540
> ef8f4d1bb084cfb0 100644
> --- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> @@ -28,6 +28,7 @@
>  #define PCI_DEVICE_ID_THUNDER_TWSI	0xa012
>=20
>  #define SYS_FREQ_DEFAULT		700000000
> +#define OTX2_REF_FREQ_DEFAULT		100000000
>=20
>  #define TWSI_INT_ENA_W1C		0x1028
>  #define TWSI_INT_ENA_W1S		0x1030
> @@ -205,6 +206,12 @@ static int thunder_i2c_probe_pci(struct pci_dev
> *pdev,
>  	if (ret)
>  		goto error;
>=20
> +	/*
> +	 * For OcteonTX2 chips, set reference frequency to 100MHz
> +	 * as refclk_src in TWSI_MODE register defaults to 100MHz.
> +	 */
> +	if (octeon_i2c_is_otx2(pdev))
> +		i2c->sys_freq =3D OTX2_REF_FREQ_DEFAULT;
>  	octeon_i2c_set_clock(i2c);
>=20
>  	i2c->adap =3D thunderx_i2c_ops;
> --
> 2.43.0


