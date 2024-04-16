Return-Path: <linux-i2c+bounces-2962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D2D8A6BE4
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 15:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83661B20CF5
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 13:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E5712BF38;
	Tue, 16 Apr 2024 13:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="PnI3pgBL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0674612882C;
	Tue, 16 Apr 2024 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713272932; cv=fail; b=tPxT8RLTkcQpBqDtwhZHoYwLSXnzieF/90lJ7u3qEII97bBFzir2hLKM9XD8+VXOB3o/gJ/bCGCyfmn5mWjxRhlt/K2tYtVMorV8Uwv+Yn6+Jdf4RwicZYDJS4OtOg9wGj9WHPYI7NAmT773kdh0DWOzAs0zEe2JesDvFevAf2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713272932; c=relaxed/simple;
	bh=MxDZS9U2qHOgj0XIfXm7yW+gwtnZewHUqcHhQyh95Ag=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BcAulA6sa2DqmisIFyGVuiKrdvVc4C9tou5dVXTceUCx2vnqnX1YrzB+SW+GrNTz1z/psDG6CST35S/jNKY7QGeIgr1VVtrFiG+2gg2cdoPmR7bX+TS7XLRvDytm4nCKhr+mPQ3nFHBnEPwtomS0M423s+FNvHxHH98OM6reXks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=PnI3pgBL; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43G9kCn2032152;
	Tue, 16 Apr 2024 06:08:31 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3xhfdn20xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 06:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzzFBGxu6t+H/DPP1lzU2z7bYyTb66s62O19AcjJL2wIOguS7bd1wQTSNk5f4lTDTEJoreq08RZLvUowUeAxQoOUuPgExeGlF6RjkavrUBCrhBL7v3+V+g3frY5ecfMAgJs9hcqEKXX07SG0VkG1WjxfmtrwnLCPUD+qJnCFt9KVArVqpyUYwTG8Xygup4FBTzwLZMWBbYJHOQWI1kWh35LcSRaG/NmujluoZRgCn+uR17a31VlgEgs5qc4PFJM2YcnQhVxjvS0AfmkoL5qCkLX5XBA1CARiXxJelJUsJxTmzFTCrGg8gIvtJ8TsQ1MwTyeV8yPTRw18mrWSMVJDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9QZhJ50LKoQoSIIZBGPIYnIUyTDJe4e1LoG5nFZ6jo=;
 b=ODGB9TC9mN2q9CLevtA70aZqdWTH7N/4GzJ0iiM2LnOfDJggF8yt3o8Byfs6YymWGVhIB3Uhv2i1BeiHLWsoO/m5Cu9b9Quepj9qZtYAmqtFHLmobbuboLBarhsFaF6nVEMOHDt04PCgjNx7a9G8+ipx6hrfswVOR1XKD5jxs1O2e5x7lkz9GqUiXkVz+08/qFhzZVcGHjbUuCltn3VTdWnu69ZO7wt/pdHo9QdH1sE/clC3gegFjphkjmbnK1qHvFskNhISapApA/piY7K1kg5iQtEw6D8RFQqWKmomxStr5tf1TIZRSSeFYndxTDbsbommaSglHn9nj8ruovAvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9QZhJ50LKoQoSIIZBGPIYnIUyTDJe4e1LoG5nFZ6jo=;
 b=PnI3pgBLxuBoCoKzr3nsD07/KsRkm7q7KlIdDRjGTqvnRjAgyL0ZaHUkyFIh0FOqX7q31asi8s51uL6ZaXIZnpmtkjntHK4OUWZmBNPMiTThnN8dw8LTXSijThWHvAS+sHOPpdq5k8W02RdExVmC1HIko2li8h6MwklvHsKrBHI=
Received: from DM4PR18MB4206.namprd18.prod.outlook.com (2603:10b6:5:391::5) by
 PH0PR18MB4542.namprd18.prod.outlook.com (2603:10b6:510:a7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 13:08:25 +0000
Received: from DM4PR18MB4206.namprd18.prod.outlook.com
 ([fe80::331b:498e:4bd3:ceaa]) by DM4PR18MB4206.namprd18.prod.outlook.com
 ([fe80::331b:498e:4bd3:ceaa%6]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 13:08:25 +0000
From: Piyush Malgujar <pmalgujar@marvell.com>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Suneel Garapati <sgarapati@marvell.com>,
        Chandrakala Chavva
	<cchavva@marvell.com>,
        Jayanthi Annadurai <jannadurai@marvell.com>
Subject: RE: [PATCH v6 1/4] i2c: thunderx: Clock divisor logic changes
Thread-Topic: [PATCH v6 1/4] i2c: thunderx: Clock divisor logic changes
Thread-Index: AQHahQNVsvEitJX2OEOHfCrhukXtPrFq8kBg
Date: Tue, 16 Apr 2024 13:08:25 +0000
Message-ID: 
 <DM4PR18MB42069B6DDD0316FACC436D2EA3082@DM4PR18MB4206.namprd18.prod.outlook.com>
References: <20240402134018.2686919-1-pmalgujar@marvell.com>
 <20240402134018.2686919-2-pmalgujar@marvell.com>
In-Reply-To: <20240402134018.2686919-2-pmalgujar@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR18MB4206:EE_|PH0PR18MB4542:EE_
x-ms-office365-filtering-correlation-id: acb2d1ab-4c59-4f36-449c-08dc5e164d36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yH/1pczW4cazzWMCVX3u9lO5krM+Xq5nlexeliFHUtTNNCFm2OSuXcEAUcOlpk4IHu0ueHWS8lD11xA6BxDVPvavw6ieVOLP1zlgr8aFcyQpC4DkOdKDxzWc7JhbW9lp+m9wrQB02c+eK/8JzI0ryFNxtNtBvagQRK3rMvpaGdQhF6DmHHry4YzWfUV9ddMgt4wRPDrewhU1TgaDYBu69q4iws+rBiw+ERI+Cj+c+OQPIshJGesFU5+RovhWZvspNd+vbmWCCNGtMBcO8b1lCbqLxSKIdHzwGld9HC1qhAcoiGf+KmTBFNcjtpkMkOBL2w4C/2+HPwFZh++EING2xls2hSFYXMBd/ju+aFyZRU+ElRYVy4tgxJ4Ghez5Qn/QtsHOz8ZwZECAJSoQJAxXX8hLlBFCNfgz5AHj471D07B481L/j97BaBxUTShJpsLyE00Ygy0IKijV7PGjtdP7Iyn6coO7ApyuBmaT7TTDGjOlcruuFGACRSAu9xFUfuxqMUvMnOfisye/Bl/MH4SD2PoC5YnN0bgC6bPuArazc9Mej45UtsSNEN9RIOakmff4wxf0YrjMI0gWyLxmhZ5VChPwXAZ5OBWM3bMm2nSq/MC+oTnHW/FXwrCy0ZxdJGYgK3Cwe8IWuzN34R4oFtMt/e546MU61RaNZCcLew3uEAz3++9BpWNmr9Vubt/1Z9goiklUJfyWCkyh0fvL7ahKqg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4206.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0OsFivIhaOWj7JIEG1OlIaPh7KNbcoL6gPrviBBhQclyugWle3GhQ2sx81M5?=
 =?us-ascii?Q?iWX/b78sG+rntP81DNceYXUqkOjRGDw5DV7rHk4fxtN21Hq7aWgQeDJn+PXR?=
 =?us-ascii?Q?2oHlkIpfEObtqrK6AzrgtqR3asRsftEm5nNS1+mgiWWan8b78lxpT9FHr6lI?=
 =?us-ascii?Q?MzoGShWvBr5KKaa8nD/ANQnaEusZ3JpvoR/bR4TA+VHGirsPK55lx91rZxmR?=
 =?us-ascii?Q?HKU5VApSf73UnwIXlYhUfehMTKH7if1QvMb6uFTqLwngiltKDPbaT5LtQ/Pw?=
 =?us-ascii?Q?KrGyMnobJ541xGGtqHP6Uny68hGre56Z+xRK4Qh8djAmHzyftOW8amhfuh/X?=
 =?us-ascii?Q?5UaUjIdGTDMvr+qMto6x/1Qus/gvD539sLbqEJ/NIhqmqLh0CMHsqn/sJFAg?=
 =?us-ascii?Q?+ddq8yf9kX9JvuAqnilwuKoqG3WX60QrJAQMkWoygGWQCs2vRfLTva7Mn08t?=
 =?us-ascii?Q?SHqSoHIw/3sMkSYTS74UN7CSN6JSG1uCry9AiaQ3gle2ggqqg1cke02Q0lyH?=
 =?us-ascii?Q?lUWwdXXtVkob3K3b5FCqP4FaUPMwPTMI7PRG9SFoetw9amXvKjgn3yQn1y7W?=
 =?us-ascii?Q?WOfMFGQCT5MQIAJ5a/4A24i5rnP4OouiKZhD3HCoQw0eJ3k2LgXcXSUCWPDA?=
 =?us-ascii?Q?I9f2wqj7NrR0grTfQY7Nxzio/TR9c4lxCYf14q88Qubjp6aMH82b1b6NOkPD?=
 =?us-ascii?Q?XbUZtVITiCEiNSBZJkfcOJH5ijB+Xh/ComyoJIxCjXIZ8jFpr8nmwkURHMf3?=
 =?us-ascii?Q?7fsaxT0UXQdhIAFWsZOAZPzSdhop9hQJ6ZeIqPx8SPEpz+N6Zseu1VU6qYuw?=
 =?us-ascii?Q?ZTrxKyBZRcikV3d5HaHYDo5mxNJ5ZJq+QLkn0om42B/zBPnG4NbyAIBADd5k?=
 =?us-ascii?Q?dArOCNGqijgG8I6y7B0P+S7XnONxapGdbb5ksozSgsyG8NXb+OXqRLcRS+Zy?=
 =?us-ascii?Q?djkRFrZAtkZpak8jA8yJv2n88CvsiM320Lbd6uz7PMplea84WWm+fOuEOGCJ?=
 =?us-ascii?Q?zI0o8VwGOLdCb5xCuD8qDt59lvs/Twk+btu22B9E9VWvK0a/H4pSzx+9QD/h?=
 =?us-ascii?Q?bqum3UzrgQ/8vLMaZ+5iSccwrY2oxFVq7pxG+kC3NM1tkPatQ86lQvhOCCGj?=
 =?us-ascii?Q?5smaHtllU87Y3IuuScYMq1v8147JOcrRui/tRcziG/IRdqG6KYbbp0HLWDnJ?=
 =?us-ascii?Q?FnsUcmuTRTT3+Y1xirTLNew6jEWvlUV60U4UVYVGo3h8yUCqWpR2R5QeX43a?=
 =?us-ascii?Q?VmVAhNvp7CORcYh16KC4cZT/U+EILcTqhnETzArU4vDQ3cQOKE4E4EYui/j3?=
 =?us-ascii?Q?/KzoAzfER28VgWyjlKi0X9dXjhKtdpSFbocx47rlmogFp7Z3io0aWxNoevCh?=
 =?us-ascii?Q?/CMClGkHo+bK35T9qHKx3uys+J8pTl44p9O3Rdy/R1/RgCst4D7ZCd55R7Vz?=
 =?us-ascii?Q?xPJ5WE+/yfIOqAk9bwYDqlgszZPXifI0/bkjnDxrIrbf/PEKoUvfQLZDVa5q?=
 =?us-ascii?Q?EV2rn+36fMdTDBRHT5Vm0DjUceG2RN1ubjEAfmFxznGClt2UjujDV9Uxu4qt?=
 =?us-ascii?Q?4f2hV0d2X52BWMdnqyCp6vPm5yjpAQs03ZruS4gL?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: acb2d1ab-4c59-4f36-449c-08dc5e164d36
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 13:08:25.7080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /+9MuaG2zxADO6Xpe44QZ2Ri+SJ7nQXQTdaE2LiUvoDoHXwBoHB3UUnaTzPIrDiMkKJ1lTT/D1mNTg+/jMBxQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4542
X-Proofpoint-GUID: FL2MrU1CBOog8moVF34-3lgQhrrlhurl
X-Proofpoint-ORIG-GUID: FL2MrU1CBOog8moVF34-3lgQhrrlhurl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_09,2024-04-16_01,2023-05-22_02

Hi Andi,

We have updated these patches as per the comments, hoping
you could review them.

Thanks,
Piyush

> -----Original Message-----
> From: Piyush Malgujar <pmalgujar@marvell.com>
> Sent: Tuesday, April 2, 2024 7:10 PM
> To: andi.shyti@kernel.org; linux-i2c@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Suneel Garapati <sgarapati@marvell.com>; Chandrakala Chavva
> <cchavva@marvell.com>; Jayanthi Annadurai <jannadurai@marvell.com>;
> Piyush Malgujar <pmalgujar@marvell.com>
> Subject: [PATCH v6 1/4] i2c: thunderx: Clock divisor logic changes
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
>  drivers/i2c/busses/i2c-octeon-core.c     | 39 +++++++++++++++++++++---
>  drivers/i2c/busses/i2c-octeon-core.h     | 17 +++++++++++
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c |  7 +++++
>  3 files changed, 59 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2=
c-
> octeon-core.c
> index
> 845eda70b8cab52a0453c9f4cb545010fba4305d..75efb375d8e49479267e2147
> 72d4df48352be358 100644
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
> +#define INITIAL_DELTA_HZ		1000000
> +#define TWSI_MASTER_CLK_REG_DEF_VAL	0x18
> +#define TWSI_MASTER_CLK_REG_OTX2_VAL	0x3
> +
>  /* interrupt service routine */
>  irqreturn_t octeon_i2c_isr(int irq, void *dev_id)  { @@ -658,31 +663,57 =
@@
> int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int n=
um)
> void octeon_i2c_set_clock(struct octeon_i2c *i2c)  {
>  	int tclk, thp_base, inc, thp_idx, mdiv_idx, ndiv_idx, foscl, diff;
> -	int thp =3D 0x18, mdiv =3D 2, ndiv =3D 0, delta_hz =3D 1000000;
> +	bool is_plat_otx2;
> +	unsigned int mdiv_min =3D 2;
> +	/*
> +	 * Find divisors to produce target frequency, start with large delta
> +	 * to cover wider range of divisors, note thp =3D TCLK half period.
> +	 */
> +	unsigned int thp =3D TWSI_MASTER_CLK_REG_DEF_VAL, mdiv =3D 2, ndiv =3D
> 0;
> +	unsigned int delta_hz =3D INITIAL_DELTA_HZ;
> +
> +	is_plat_otx2 =3D octeon_i2c_is_otx2(to_pci_dev(i2c->dev));
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
> 9bb9f64fdda0392364638ecbaafe3fab5612baf6..69bd62940f99eb7868770263
> 80cd1d02a4eaadb9 100644
> --- a/drivers/i2c/busses/i2c-octeon-core.h
> +++ b/drivers/i2c/busses/i2c-octeon-core.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  #include <linux/atomic.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -7,6 +8,7 @@
>  #include <linux/i2c-smbus.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/pci.h>
>=20
>  /* Controller command patterns */
>  #define SW_TWSI_V		BIT_ULL(63)	/* Valid bit */
> @@ -211,6 +213,21 @@ static inline void octeon_i2c_write_int(struct
> octeon_i2c *i2c, u64 data)
>  	octeon_i2c_writeq_flush(data, i2c->twsi_base + TWSI_INT(i2c));  }
>=20
> +#define PCI_SUBSYS_DEVID_9XXX	0xB
> +#define PCI_SUBSYS_MASK		GENMASK(15, 12)
> +/**
> + * octeon_i2c_is_otx2 - check for chip ID
> + * @pdev: PCI dev structure
> + *
> + * Returns true if the device is an OcteonTX2, false otherwise.
> + */
> +static inline bool octeon_i2c_is_otx2(struct pci_dev *pdev) {
> +	u32 chip_id =3D FIELD_GET(PCI_SUBSYS_MASK, pdev-
> >subsystem_device);
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


