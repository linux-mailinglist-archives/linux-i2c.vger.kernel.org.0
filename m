Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A264473ABB
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Dec 2021 03:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241525AbhLNC03 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 21:26:29 -0500
Received: from mga11.intel.com ([192.55.52.93]:42190 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229616AbhLNC02 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Dec 2021 21:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639448788; x=1670984788;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hreW8ASGtRkcNJhJ/rbEMR5UaEvwtM6kN/hoYzhI6p8=;
  b=O5WT52YcQEczuOGoCh533Bmf4YiPfoL29dMKWGdzs19T973XuMIeRtwz
   qE/KDOr8pv1NS/HNgVhfF0urtVXv6mDd5AGlt2YQHXLnqeGe2AsIrggI1
   4t099YMvqs65bxijqJXi41NHJebvPc/H9V8RSgvGVXqsUEu1nYZ82wSxh
   ahbVIKm4GgcmJGLn1lWkn1gPR6+K601htjucjseo7Wg0bHKGqeqy3BSCg
   eH/+vtH1T648dgr6jP2Zwn36LyugiW7cCFcaBTWNOs25zfTtNxdBUer97
   gewVjSrMBx33QKyVFsMkkhdx4kOtyq7QcVRxMBlMpp7pP6kfmSHRPaKOC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="236410943"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="236410943"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 18:26:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="518026900"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga008.jf.intel.com with ESMTP; 13 Dec 2021 18:26:27 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 18:26:27 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 18:26:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 18:26:27 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 18:26:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSsZqfL6ODDdtsK0iQPMgDVxz2C9bbpKDX0pAyBpmK33SWn6qvX4UEESDBD6hTWdXX9/3M8Hc3jZnw5iY/X7UnbZ72SgCZ0xc76af2wsGJp4rXFWWczpumdnnPZdkZcsR0m1S9EmHutwW0SnB+rinXn/AGRCckd4YBc/qbuifQQQDmE5de66KZwkIAMtFpCmA1PPH6cCegs7Jt5DLDZ7alzNnFiPdppMl5po/xwB9jA0rCboqVTrQyAIYpUSjq4JD/ga7zp+Dm9zKsdVcgevcXVQ/WXrJLxQzmoSboxGHa5pyrsHETgsX6U/yeg4Xe9I/Ao+Wmclky7E02yJ1zCZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK5EA8tUsA/SKPgoRE2SKnin2pEQiNhwbYLfF0v/9YE=;
 b=Yxa2hqr2g13Hbe+IXWohKSuodHk04tWR4XvuXl8t70w5lhmuTDbio5cfLXeUI825RK1EtKJrC062CZPF9F6Nd++jjsCUTFdI2r+u+tIdaGD3Kz5/PYrsidfM5KORfg9btAB9E5ykEE/AwjiWSkGzPCUQxIyxVi0sGUk6mT3/sD4NyIE7BaPf3LveQ3U9D28zld4U+wfbt6kwkV40yvA8/6RWKXjC/bzPDrDk8E/AZv7mqjmanrJHb4HmMNye1jxaXTFhQy+xMgelxS+QPjoV8dnG03QjQNbeuQq5qdGMoy1yoPzWGzSU6+zkXWfW26nZ5KuVd3Wp58xDEfarafDrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK5EA8tUsA/SKPgoRE2SKnin2pEQiNhwbYLfF0v/9YE=;
 b=A+10XaV8CBzqkjXnA4A786H7pbnrnIOpN9EE85iqsQZmKAz+gPWkLolE93nC0sWkUU4Fcyl2Gt/1nkqDzu7nB597m3hHHu0wBh9sHI/wEUJC2DUsWt75XnYqWWqzmD4XIAuaBtVSJx1g4klAD7tskfFKbBH9DaImy37mCfUzovo=
Received: from CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19)
 by CH2PR11MB4405.namprd11.prod.outlook.com (2603:10b6:610:49::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 02:26:20 +0000
Received: from CH0PR11MB5265.namprd11.prod.outlook.com
 ([fe80::688f:bcfa:d4b7:b112]) by CH0PR11MB5265.namprd11.prod.outlook.com
 ([fe80::688f:bcfa:d4b7:b112%6]) with mapi id 15.20.4755.021; Tue, 14 Dec 2021
 02:26:20 +0000
From:   "Saha, Tamal" <tamal.saha@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Senthil, Bala" <bala.senthil@intel.com>
Subject: RE: [PATCH v1] i2c: designware: Do not complete i2c read without
 RX_FULL interrupt
Thread-Topic: [PATCH v1] i2c: designware: Do not complete i2c read without
 RX_FULL interrupt
Thread-Index: AQHX7kXuFHFFErlQL0W2KLcyt7bvbKwwUMoAgAD2GXA=
Date:   Tue, 14 Dec 2021 02:26:19 +0000
Message-ID: <CH0PR11MB5265C61C265C34EB34AC2AE58F759@CH0PR11MB5265.namprd11.prod.outlook.com>
References: <20211211041643.21543-1-tamal.saha@intel.com>
 <Ybcx6vWEMLE2XlYL@smile.fi.intel.com>
In-Reply-To: <Ybcx6vWEMLE2XlYL@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e9c0862-04ba-48d5-f082-08d9bea91d72
x-ms-traffictypediagnostic: CH2PR11MB4405:EE_
x-microsoft-antispam-prvs: <CH2PR11MB440534799459051A5EC3BF978F759@CH2PR11MB4405.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9OkOM3CuYvIYfyLn3RdecQ3q806X/BwH7siHbSBFZgjSoW+frPLtEjvH/UmqOq+OKqQ4a/ckuTd+wXDsV+NwKe6TuAEdvRDgh/QQmm2lWpl4A4eyxjg8k3LRQDkRB/PTeXOQbiY7WLaxIY7mSQdaqLoL3Zo7tfwHFkDMqLtl7yqAPlLj8SRaFdRjx5f84GbNxK7CfdqSapkcEY3K9htu+2I0dYHHtmp985kRWUBPD2nsGp1BqaLgfdQK0K1iJGpyfbUAd0Uz2T0T73I5BRlCyTAeXf0HmWcct/OyDozsCYorIwBnCPOBL4+2EGgDpazm0xo2GWfBJnlWQITEi35rjCqBNS90U8qLa3Qq6szLlh780iJTk6zwWTN3l0UfEyj8aQPp8i0gqbk992kIAK0T3HjmXQSALZ6itVWY+j2jGwIOt+juILFWZrfONZNoQdMuwwPFXhh96sy4QdwjAa3b1dTt2trdngh+V0BBduceiMLoT3sLbNuR8ckHUbfINlh/C1MNelZ/eJg1fCue3ac3Nzfxnqhzx6igvqSmPpvyvWG3xzPpQrVL0o4NtQ4Op9rzUXV/OpPwzEQm9IznNr1JkQBwXFiK8kemv6w5DWen00+npctEsJKUHp/1ezMrsc5qvQD4ZW9us1/GK+By/I7iWsUsOMcp6Iicm9Vy6udcpxzNLy2XnxEculqJIEpAGiCwrBtqGliRhLMX1/HgK47PgA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5265.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7696005)(53546011)(2906002)(6506007)(8676002)(83380400001)(122000001)(38100700002)(66476007)(66556008)(316002)(82960400001)(38070700005)(9686003)(33656002)(4326008)(66946007)(54906003)(76116006)(71200400001)(6916009)(86362001)(508600001)(64756008)(55016003)(5660300002)(66446008)(26005)(8936002)(52536014)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xX2aCyH2Hm01sjt8Jf4hUdYe4010BLL6z65F5VkOG202LoT+Q0dpTsUMEkVC?=
 =?us-ascii?Q?q/Vw8FFvTyS9LErWIwROCRnyqe1pqYTFi48/T8U0vdKfE2RxlXJxNX7vXzVD?=
 =?us-ascii?Q?m8C2gAYXMQICrJU8xzct4dg2L8VRKmNjxWwW4zLFOpM0mxtosNO6s4YtRpmJ?=
 =?us-ascii?Q?NULl5IwUJH0vVvXcDIjxP+wXR8x5aICSgx2toq8EhfpV5InLVoxJG1Mq+S/h?=
 =?us-ascii?Q?/zaWI2BV7CDWamgIln7cnbX1I1E6/+T9R7eM/Lsm+i95pdsBOyr6jH0viSkz?=
 =?us-ascii?Q?YyZ7hCxaRuLC2Id3DAvpPxA15tHkPtCUpr5f8tXoK3UcYgIVILa9kY8lhS3p?=
 =?us-ascii?Q?bOwZ8JJ5sfWv5B5wxaxxy8s9FcbaR7PyJhEsT2IIhtGTwTfxitI1FyQ0+FlB?=
 =?us-ascii?Q?cEgJApnEa+tuIe1SCgcboG7i59WgTNbuECWSUIEvxEy3mNWWM68kNeoodSK5?=
 =?us-ascii?Q?Ai7+t655qwnIBtpzxi8EJc6JyF42wWfc5JJD6CAdyreeFM/RwdzRtYBhjtYb?=
 =?us-ascii?Q?0vpNpfra9d2H7fyS/SFq18gAWlGepRSBt0KZiu7KJRa4rhjg3TzOOgNoFm/2?=
 =?us-ascii?Q?mfgdwZgaMK8UrqDUj6r/SMjThGSEr7Ghb2K7PSomSc0HiSdVIVSdzaG84vaX?=
 =?us-ascii?Q?qY/llgQrPgXKImKa/csSvuz/9bxV8oEQyYWEOaOqq4A3oqcrwxSyYW5T4FNQ?=
 =?us-ascii?Q?xnrgqUGVjgX9EVkk1PIbCn8B0nhktFK/D0m93FFJd6KqOzNgZYTsUn3WEhhQ?=
 =?us-ascii?Q?E5FwHW0GWOEzx/GgSlru33t15Zoc4P6ALDuRpFb+mtkCGs3qU2CxMRabgu8S?=
 =?us-ascii?Q?yuQnhf/QR0nH+uVWWUKhnopiV8P739bNZ7DqKH0g+CpBzUkAF7I/I2Sa9XFV?=
 =?us-ascii?Q?cersrO36htJi3Jj+0FhiHf325GkeMsjhTf5GbYJTHobzVnI3kLvor40Ez3JS?=
 =?us-ascii?Q?NzHonnEz4BcWnIodbQ+IJidSf2Ryndg4tQyVAsXFIRq0JQ38Ob9RtJa0oMBH?=
 =?us-ascii?Q?LZHJmV/rdY7R5odDslVm7bvS+bSSg5VxWQT230BG9JmDXd2UEZuOLvcWciIT?=
 =?us-ascii?Q?vZO78p7mAVnMRGNYolWg1t61LfHIwWr4IHUIu08IZX+UnhX3Ki+YBCNdq0vj?=
 =?us-ascii?Q?0imcGSj/TeQfY+HC5B8B06kcWIPDHeCUuS1FJGmRFk8WYwP0s0+F0kRUQS9u?=
 =?us-ascii?Q?R6jtykiEdXxuGU2MSGO6K5leEBGTdFNstuAIqKkngjYpEBtiw4X/dtIhayrs?=
 =?us-ascii?Q?v5ESgTcPV4NMUmVnF22d2NeyEepENLQjYqWbN4gI3sSpdcfpAuP0K94U8HJP?=
 =?us-ascii?Q?yFV/3dJGxJM3AsFmwked+sqU0zLnxjVhochbg7QVsDVI0HyFdoTaWaOBU8Dh?=
 =?us-ascii?Q?gygAuzZqZCkxVkmpY25IAfRyDVUuBtOypEJ0tHANW4cgUAniRNiKQDSZmIHq?=
 =?us-ascii?Q?QJteaMBupUrSjllP46ZuvGKiuXvWxKyl5+8Md+mUpNN8mNTA63FGT8ayJfAr?=
 =?us-ascii?Q?qsa5a4OLA7jrRefFJa/B+4TqE1OOVSc51YWJI6lIc6Vyo2cDKWw7n/xnjtYg?=
 =?us-ascii?Q?uQwYfE7cM3hYJh2UlLCIdGscnYwYwILzoNM3iKHUrf6IOa0QFABwHbzHTdPN?=
 =?us-ascii?Q?Bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5265.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9c0862-04ba-48d5-f082-08d9bea91d72
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 02:26:20.1074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ErdBENJBICXk06jNVokcTqh+OQ2VOBpuIB+0SFJjWvnk2z5+7vKQnHPlWop9PmsNbWaHqYg1qO/8ddefEMsJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4405
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks Andy. Will incorporate these findings and share next version patch.

-----Original Message-----
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>=20
Sent: Monday, 13 December, 2021 5:14 PM
To: Saha, Tamal <tamal.saha@intel.com>
Cc: wsa@kernel.org; jarkko.nikula@linux.intel.com; linux-i2c@vger.kernel.or=
g; Senthil, Bala <bala.senthil@intel.com>
Subject: Re: [PATCH v1] i2c: designware: Do not complete i2c read without R=
X_FULL interrupt

On Sat, Dec 11, 2021 at 09:46:43AM +0530, tamal.saha@intel.com wrote:
> From: Tamal Saha <tamal.saha@intel.com>
>=20
> Intel Keem Bay platform supports multimaster operations over same i2c=20
> bus using Synopsis i2c designware IP. When multi masters initiate i2c

Synopsys

DesignWare (and everywhere else in the text and comments).

> operation simultaneously in a loop, SCL line is stucked low forever=20
> after few i2c operations. Following interrupt sequences are observed
> in:
>   working case: TX_EMPTY, RX_FULL and STOP_DET
>   non working case: TX_EMPTY, STOP_DET, RX_FULL.
>=20
> DW_apb_i2c stretches the SCL line when the TX FIFO is empty or when RX=20
> FIFO is full. The DW_apb_i2c master will continue to hold the SCL line=20
> LOW until RX FIFO is read.
>=20
> Linux kernel i2c designware software does not handle above non working

software --> driver ?

> sequence. TX_EMPTY, RX_FULL and STOP_DET routine execution are=20
> required in sequence although RX_FULL interrupt is raised after=20
> STOP_DET by hardware. Clear STOP_DET for following conditions

the following

(and seems the colon is missed at the end of line)

>   (STOP_DET ,RX_FULL, rx_outstanding)
>     Write Operation: (1, 0, 0)
>     Read Operation:
>       RX_FULL followed by STOP_DET: (0, 1, 1) -> (1, 0, 0)
>       STOP_DET followed by RX_FULL: (1, 0, 1) -> (1, 1, 0)
>       RX_FULL and STOP_DET together: (1, 1, 1)
>=20
> Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-designware-master.c=20
> b/drivers/i2c/busses/i2c-designware-master.c
> index 9b08bb5df38d..9177463c2cbb 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -701,7 +701,8 @@ static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_d=
ev *dev)
>  		regmap_read(dev->map, DW_IC_CLR_RX_DONE, &dummy);
>  	if (stat & DW_IC_INTR_ACTIVITY)
>  		regmap_read(dev->map, DW_IC_CLR_ACTIVITY, &dummy);
> -	if (stat & DW_IC_INTR_STOP_DET)
> +	if ((stat & DW_IC_INTR_STOP_DET) &&
> +	    ((dev->rx_outstanding =3D=3D 0) || (stat & DW_IC_INTR_RX_FULL)))
>  		regmap_read(dev->map, DW_IC_CLR_STOP_DET, &dummy);
>  	if (stat & DW_IC_INTR_START_DET)
>  		regmap_read(dev->map, DW_IC_CLR_START_DET, &dummy); @@ -723,6=20
> +724,7 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
>  	if (stat & DW_IC_INTR_TX_ABRT) {
>  		dev->cmd_err |=3D DW_IC_ERR_TX_ABRT;
>  		dev->status =3D STATUS_IDLE;
> +		dev->rx_outstanding =3D 0;
> =20
>  		/*
>  		 * Anytime TX_ABRT is set, the contents of the tx/rx @@ -745,7=20
> +747,8 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
>  	 */
> =20
>  tx_aborted:
> -	if ((stat & (DW_IC_INTR_TX_ABRT | DW_IC_INTR_STOP_DET)) || dev->msg_err=
)
> +	if (((stat & (DW_IC_INTR_TX_ABRT | DW_IC_INTR_STOP_DET)) || dev->msg_er=
r) &&
> +	     (dev->rx_outstanding =3D=3D 0))
>  		complete(&dev->cmd_complete);
>  	else if (unlikely(dev->flags & ACCESS_INTR_MASK)) {
>  		/* Workaround to trigger pending interrupt */
> --
> 2.17.1
>=20

--=20
With Best Regards,
Andy Shevchenko


