Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D9F3755D6
	for <lists+linux-i2c@lfdr.de>; Thu,  6 May 2021 16:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234836AbhEFOqE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 10:46:04 -0400
Received: from mail-eopbgr1400133.outbound.protection.outlook.com ([40.107.140.133]:53169
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234759AbhEFOqD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 May 2021 10:46:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxLJMGjtkK8ZnQDwYxrsPRFb4/Pppi/jf3pwnBASiQnCSv8ayYHU8lwMPAs7+in4mw3sEvqE/LhvEEyAskwBCXEAcqvloklDGp8rnFEJmLewud5z3pNszBQrLd/h491cseiD80p8884ixczKCqSacLZ1A8v+kioSwMGWFnGq/yrvNdzJ6TzYSJphy2uHtQ2doZHmTkd+DfEKnrNDHGEdNfAzJXlp66MYbBlJIhtb5C+8ny2vDRZ0Qu/4Mgq6/oGWRnaZhJtm6gmo2hQPUdd0etXQcTZxGEgFvsnlWs9nW984f+2MKSVmXitkk2R09GWRNGLMbLFXdnrptGOdX3R2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9/jiNs706GHU+cp3jGOPgmPJb+Uycs8czQS99NBqko=;
 b=empMwKyF/LYDcRjNSANdeKEQRkdgNbO5gc4HpOG7xlL9lI+gFczl7V8xicR33Cx9ad1kgfCxlHgAnLuJyG82y+grGfaQg5IfTz2zj2Sy/gSI1/ACixVxDZC10gN5KLveMpQEsKG+77RtBZ/8mK4w73GUQ75Nu76gH/1s96TTlQSzMbKVHjyG90AUucPcodBPsuuRvRLs7nHbWl/AEzogw6gy6mt48FodiJC6aWCeCxMT3hUqerCQoS10knTODLFe7boxGFXGkFlV0UZ7RkwayYMmj0/ugF0Ergchg3PvGGh5BYTOvk2lk2hwpdaDTKw2WVwX7iwmuyuVPkpMArnteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9/jiNs706GHU+cp3jGOPgmPJb+Uycs8czQS99NBqko=;
 b=az054DIfaFHk8kXIlLLMEZ/77K1V6eLcIjb1WaHksyIZhvZltw1uFCNSHtJJnHltkONkZfwmf+TCbncWqoeUofK89fjqJ5zKm6QndSOCGlbCXcIxApijp1Vz8D6FgwCz6w1nKjmf2w6K4X9cJMMhxhAW2QVcX1ypPazgx30GHPA=
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com (2603:1096:603:38::21)
 by OS3PR01MB6965.jpnprd01.prod.outlook.com (2603:1096:604:12c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 14:45:02 +0000
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::48dd:a7cb:a2b2:8d46]) by OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::48dd:a7cb:a2b2:8d46%6]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 14:45:02 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] i2c: sh_mobile: Use new clock calculation formulas for
 RZ/G2E
Thread-Topic: [PATCH] i2c: sh_mobile: Use new clock calculation formulas for
 RZ/G2E
Thread-Index: AQHXQny+CmaGbafUCkKKp/PRnXjehqrWh2/Q
Date:   Thu, 6 May 2021 14:45:02 +0000
Message-ID: <OSAPR01MB2737C9544C17BD64E479203BC2589@OSAPR01MB2737.jpnprd01.prod.outlook.com>
References: <2a1f0271cc00bf2821aa8b6609c452a9823980f6.1620299581.git.geert+renesas@glider.be>
In-Reply-To: <2a1f0271cc00bf2821aa8b6609c452a9823980f6.1620299581.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [2.28.163.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d98f98e7-a036-4bcd-9033-08d9109d87e6
x-ms-traffictypediagnostic: OS3PR01MB6965:
x-microsoft-antispam-prvs: <OS3PR01MB6965953EDBF380077397821FC2589@OS3PR01MB6965.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RxPqolVdvEUiRdfIJElCcDrz73BtqOozyCI25QAe+tmNFQ5W6R2b8abV9honjCaI54sMQ+0tOo3dIGpg1CLRLA3ZqJ4LSECkHPe76xHyPHkqPtQbRK8dhSL+CdxUo+dmuIYkdcw0u4ANj1ZrkQXNsVYqK2cAepfeqYPV4gvcndehtIIX5JgcH2wCtr0a2JKwEovYuVbCqFDDMgi/z20yTJuhAQO3VRwFvBb7YFleYU4G9a0mZNmTuW0xJppRR3ZYRIzYLfBjEW0EvyztkyhSk+0nxqV5DbM+p62Y+k7hG3e1hWUB+5H8AeV2XeUCLQSaWuLxMUweCfCZ2XqNvjpPI8RSu112zLr0ZCoV/ytrraki1ECiZ+lDY2s5Gedns8pLE7NWPp8Rp5Hyabuv15kQGhmOrzfIBe8YXW5k5WqH2w0jeO8xQksfJprJ7gR8V0cE6lhYKLPgGS/slHxmmOc2ZZ1Q1k5kJqMZ5q04FZVaA98dE2mga2/3sqqna3uMDEUuJKfJfm6DasC93BGOSjSmZMYnDx3MVFZSLZallksqMRhJBG+71q7KDBTesswOj6Zu5nQW3t7uJbeSOrmNAoSlLQtrrFP8IAGpp2tvtF05v9M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2737.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39850400004)(366004)(52536014)(38100700002)(122000001)(83380400001)(33656002)(26005)(55016002)(7696005)(186003)(86362001)(66476007)(64756008)(8676002)(66946007)(66556008)(4326008)(110136005)(316002)(54906003)(76116006)(66446008)(8936002)(478600001)(6506007)(2906002)(71200400001)(5660300002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?6rjkjcFS2RiMtdzfEuGut61v3cSmiHkVquF6B3s2AOTUWBmADtSoVMbdyHFX?=
 =?us-ascii?Q?Cn8bKSl65doHjqMAy5AFI34v5wXZqmRpZo4k3LnNq5lSNy9pdsaFA3Tj9sYv?=
 =?us-ascii?Q?8i/ivBDyjC5Vb+GYbgDLkmqNdEyoo+k6sRzdd+wwy2On++gwX/kF6qmz5h5Q?=
 =?us-ascii?Q?pzx7obNHRCKC+3ZgqI8P/4V+B/lT3heign5T2zgkI8uELVzdkqcP0q83Wt06?=
 =?us-ascii?Q?lo57W9WUAxviGheyaQXjKpMMvJ5sWJdTV398vVTpW/xq99mjWD0DLHuGMbvv?=
 =?us-ascii?Q?xbkkHD8i/oDiq4eiIpor3GmEFunalLdwsVN9RSW1bZdG4DGe/Td/zT33akjV?=
 =?us-ascii?Q?DJMy5W9Aoh3zS3JaIi2J3I/NT8SaQwLObyPUTGtTP8ur/QajFX/4FdV7nwFu?=
 =?us-ascii?Q?N/GJAbj53G3tuFqSyPjmT/Uiw/xqPYFpUwEagPZbbkWP4nn2ajgd+YxvpRTP?=
 =?us-ascii?Q?9ZAlHdHTVH+WKDtjcLhZNlm0udDVX6YGiUVFWQ22efr/a3GN+IQJprqBcOxh?=
 =?us-ascii?Q?75fUFAbUVnDfFg+yk4fqK0+Isku1ch5OFjIMjNusEkjLX1jTGy9RQhN5dFVx?=
 =?us-ascii?Q?9WQXxLXR4U+ti4OWcB053Hsqp0WgiezN/9V6G6L4g73DKbc4ftxp15hZyL1y?=
 =?us-ascii?Q?oSIEott5xCKHSluNKE7q/TZR9ZvMuosnGqw6UqVTRh+RZs8YLitYMCCYAkCg?=
 =?us-ascii?Q?6R5FKKeHGkB6Zcug7/JQsnouR5xEkeZp9hf3CCwsuT6n2/et8mQueDyKjgGi?=
 =?us-ascii?Q?sBMbF+a3B2SQ/1hT/3NjPr/lVtCNRD4fj/b/4VY6vcPL2SWHAFtjQWBYTUPT?=
 =?us-ascii?Q?GOvgr7xRgiKoTC4OMyT2zIZkXgRjRXIEALsAMHSCQsnk+nH/Lv90bUvS5X/8?=
 =?us-ascii?Q?fz7B7PekT/tQMKpr0RVfkzpQcw8IcSbi5o0cBeHBzRhvZWEppkEVX5JEsV0J?=
 =?us-ascii?Q?PYZShC3hGbrT0+Jl/v20bDr9LSKu1VP86xduSoSA7i9oWNvP60qsxIKFTK/O?=
 =?us-ascii?Q?Dsr8GnLfWdhae+YBShXDsIxwE8xBd1Zpc15Vq/OF7HQYIXI4YfUEssFYLycV?=
 =?us-ascii?Q?KkpLTz4TZDm2y7Pcu+Wcx9qz+QZTKiGuopqZXznZD17QxGrKH1wOvK5gB5Ik?=
 =?us-ascii?Q?pjXiHDo0f2bXshgkcWrKi4Kg5gLb67FQnvA6pvp6/0YAa1DI2rKVcJF7Dv5M?=
 =?us-ascii?Q?0FieTJEbVLOxWq/uFgGOngYDpoG7ubvH9yAq+J9+zIOqsqIJLNT59sn5IB5k?=
 =?us-ascii?Q?DkXgjsjBUhCG5aJqOx9P5IPiaQceDgmtQjBuCAFZFB7u/7crt8K4Hot2Zbfv?=
 =?us-ascii?Q?6rg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2737.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98f98e7-a036-4bcd-9033-08d9109d87e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 14:45:02.4460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bc54OdGCmhmnFneuRCrFojnd+DzmwEH9lhgboEjX2vEd8mPC/1480l2ZoeXRk2RQRcVOZnZl23p11aZvYj0ZmkZScOvM79LZ/LmWi9rnQM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6965
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

Thank you for your patch!

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 06 May 2021 12:16
> Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH] i2c: sh_mobile: Use new clock calculation formulas for
> RZ/G2E
>=20
> When switching the Gen3 SoCs to the new clock calculation formulas, the
> match entry for RZ/G2E added in commit 51243b73455f2d12 ("i2c:
> sh_mobile: Add support for r8a774c0 (RZ/G2E)") was forgotten.
>=20
> Fixes: e8a27567509b2439 ("i2c: sh_mobile: use new clock calculation
> formulas for Gen3")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Cheers,
Fab

> ---
>  drivers/i2c/busses/i2c-sh_mobile.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-
> sh_mobile.c
> index 3ae6ca21a02c6b9f..2d2e630fd438712f 100644
> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> @@ -807,7 +807,7 @@ static const struct sh_mobile_dt_config
> r8a7740_dt_config =3D {
>  static const struct of_device_id sh_mobile_i2c_dt_ids[] =3D {
>  	{ .compatible =3D "renesas,iic-r8a73a4", .data =3D &fast_clock_dt_confi=
g
> },
>  	{ .compatible =3D "renesas,iic-r8a7740", .data =3D &r8a7740_dt_config }=
,
> -	{ .compatible =3D "renesas,iic-r8a774c0", .data =3D
> &fast_clock_dt_config },
> +	{ .compatible =3D "renesas,iic-r8a774c0", .data =3D
> &v2_freq_calc_dt_config },
>  	{ .compatible =3D "renesas,iic-r8a7790", .data =3D
> &v2_freq_calc_dt_config },
>  	{ .compatible =3D "renesas,iic-r8a7791", .data =3D
> &v2_freq_calc_dt_config },
>  	{ .compatible =3D "renesas,iic-r8a7792", .data =3D
> &v2_freq_calc_dt_config },
> --
> 2.25.1

