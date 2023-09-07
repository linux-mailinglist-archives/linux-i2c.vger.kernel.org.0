Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE4287973F4
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Sep 2023 17:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbjIGPdN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Sep 2023 11:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbjIGPWS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 11:22:18 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6F8135;
        Thu,  7 Sep 2023 08:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/m5wMs+K2fSy76j6SbPL0T0/LU445SYZ2zzBTA/Y1+cgytOspfy0RJZD40bGPzvdODJpe3EsyYo3L5jlmg2MKd8doEwmCyVNQDX9l5DzuwMYjfWvS0M903CA5yjyUBwJ1dTu9d4XuJ6JCIqxO8aw5RJDIFvmUh1hY7DXtQMVlmiaMdQqAwirIKR9p7MMAFznGOTanUkSTy7Chp3DX/kxnonK/Y2p2ehpLy5XD33tFzsaDrl6jgJs0NGx+sfM7a6RUUtukl1dj3FE67ii/RVIJAQ+yFLGT10kmCxVIyq46GlO/w2fYEPGvIZ/t5EJ84VkgTYxQDD+q7vMLoLs3mjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYt/9PHU1sO2yiCs7nnHnyUGkas7ZpO2XBYVOCALZOg=;
 b=KVGRbbanXr6vfrXjDlukCNDbYwetF4CBdCp0RkyN+rxVkm1vkNUcHWbuPWlN8jsUh6EAp38QN9A37nYtJe8a0QQ+dki8P0y4gVAIG0ljNxRK/3XI8ZAfP8TR5JFJlFSOa3M+x8OoYT0l7nVOAF/wIqbZsIAKUdV50yhaDBt+2dyKyjy8NNuENV5L2SlgGXqqcUeTsGiR7u/K820ykmaHmbCDA/7iY2XsgKxmMlm6mg5Z3SOeO74LhlHyu4WrI/ArEc3JlI/I1HKsZe0JX8QqgPdE3af9IxXP8k28IbMNHXbx3ZyLlc0F/ppQhsuSVVpjRn7qPeGx7hAnUS5KbQ3OOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYt/9PHU1sO2yiCs7nnHnyUGkas7ZpO2XBYVOCALZOg=;
 b=TP09dULcOKVQERepqNl4sCjrdhV6001eoLOKOqrXUSIQ4fq9cwxKZjUFg+Y/iK8nUasUiSoU9Ud7cJpTNl980Qg+tnjNByneO3eHTBnu2q9S41/s+QtoPysATJvFG5SLzxe/D/cZhOGZvMZf93u92/nsI/QGnpQXOOvm94xdoD4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB11031.jpnprd01.prod.outlook.com (2603:1096:400:398::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 06:42:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.035; Thu, 7 Sep 2023
 06:42:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Chris Brandt <Chris.Brandt@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 5/5] i2c: riic: avoid potential division by zero
Thread-Topic: [PATCH 5/5] i2c: riic: avoid potential division by zero
Thread-Index: AQHZ4Pzpegqncf7PEU+giQkC/rdzgrAO6hPQ
Date:   Thu, 7 Sep 2023 06:42:38 +0000
Message-ID: <OS0PR01MB59221A1F4614F30669F3448D86EEA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230906200024.5305-1-wsa+renesas@sang-engineering.com>
 <20230906200024.5305-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230906200024.5305-6-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB11031:EE_
x-ms-office365-filtering-correlation-id: d795bf34-def0-42dc-3593-08dbaf6da0a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lcgXaV5yYb1as+0FNfisIIY8ua+ZEq1r9dljYZCF4rWPGm20jledhFGUbRkBA9DyYLDQM4rYD2yqcSskQnEYdH7aNMXpOqsGOmjvkHWP55Y3Y/oAaMvQnFKrDzr0/vus2Zzv/2Y3SHrALARl6H/uw5eJ8KqolmedIjpKjKOmU518tcLo4D9w0hhU1XxbHaM8Vqto2wGGPrIdjqIAfenWbp5pATR1iVN6G7fBRXqcBHuROdEZ6pzz0Fdk9QpSqEFS7PfoIoUBqvgHXI7qAyTiuuP2vGlI7XSy/eUNU5P8HeCtpaEymi1J2kIeP78yZ44sQt8jLIw7w3dFSBkM2Rjr/T/3TkbdHdf6JHR77i/c3j3Rvhm+BR482f7jHkQiOkQEJf15qO901A/mg15CeILYyCz1qiNMR72rnpyjOMrLCo4+S26PSYbAhqWXy8gseEgqr/hkPiaGWUaneSxYc7gAb28JaEOc8zOmkEdDhVr+83jZ6TVkp2agIeVpdlAqRCDE0BZoCyMZ4JlkJv0kyKfnKuJji265rHMyeTN2Vuj/bgnWbevwSOpEZs9VuHeGBwAiwT13gKh5ZwawOITPbGyoh01AAVVkm0MhU253k8WdrP3PPK3OMRio7zexlUJlUn5E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(186009)(451199024)(1800799009)(122000001)(6506007)(7696005)(9686003)(8936002)(71200400001)(86362001)(38070700005)(55016003)(38100700002)(478600001)(4744005)(26005)(2906002)(83380400001)(52536014)(110136005)(33656002)(4326008)(41300700001)(54906003)(316002)(8676002)(5660300002)(66476007)(76116006)(64756008)(66556008)(66446008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yoXTSJSgo2qMHMdKPEOwZvj7gpRD3UFTmZIpw2pKzZY1hy4WPHOAmNy8Ye+o?=
 =?us-ascii?Q?cMjWXaeSYfxKR+1U9oYDLnMUGIJ38jn3jkN9zZBV5EyqiQDV8r/AuDBxUWKS?=
 =?us-ascii?Q?jvcRd6bsZ3HWMplYvEyuUlNwstp0bkXAJUx4pYiyN8h8cRJls9P8ZDjeynT9?=
 =?us-ascii?Q?N3OliFPN44r/gv/QjLjsJRM/G2dwk+u7MwmjALwVMkM/Gl7ZCegNowhH8H8U?=
 =?us-ascii?Q?fm/rlJSibIrbdkDZbQYhzC8Uo1QcgFpL8bPzr4rzsp2QmdFgGs3JBrKLM9Xt?=
 =?us-ascii?Q?N0rnaPws+ARh/as6jMPwI+VTbl9ljunjjDDqEEf6JXIE+A8XBOALdTrw1Psi?=
 =?us-ascii?Q?3Zd4SVLBP8aCnU2VcgAVvUi5xP7ut/TkYXnAHGGkWjjUR6s2vmVp+x576olX?=
 =?us-ascii?Q?3XHEYdhSMCB0KCYeJz8pFQWRRrai8LB20/haJI00DIvC9cdvhDXCowSPoiSZ?=
 =?us-ascii?Q?LSpt56FUO0BI1BvLNSNtoJHft3mjo0+pTo2k1tzZFBb+KoUR35UF9lu08VgT?=
 =?us-ascii?Q?m+yoMoGMk59Er0Yr+QjhIwxXgWgqc01veBVeS/5Nub8SQQc1qnxdm4TAEib2?=
 =?us-ascii?Q?5oK7FztM4WyIFrAE+VIl5u7fD0TNWp1PlJUKsmVwHdDghvjTIl74zlNdSarR?=
 =?us-ascii?Q?5JWO9DtJLscDRMfy0lhPeG5MysXxLQm0jlpJhqJ8btRhfwbxDXv/do1/9tN1?=
 =?us-ascii?Q?kxUizq0FzVwVi5QNORjcVTOyk+LseGrqyQX+y4iqGYcvcVjSOcBEVqJQUtJe?=
 =?us-ascii?Q?Wd6+GQBo2a1BAAfIWy0quWc115Je1Ste3zfvTdmyQ/l6sBzUZV4BjSENvnuJ?=
 =?us-ascii?Q?22XGGY0UP7Puhpb4DGU9K1ewORUGoeDFgPaPmcYRqZYGWaHNlHdS+oTvVgpi?=
 =?us-ascii?Q?D7MI805IpiAcUKjw2iZ3dlGgVEQ/1F/CuXfEJtgpcMkI93ZLLjZ+Z/LJBJJa?=
 =?us-ascii?Q?XOhbUIDQkiX+TSLUOPwY9DzNTggFICEvsObT7mTsmZxDQIV/epF5LBBj0mZq?=
 =?us-ascii?Q?iyb3vuPsgshTxghgbXwQyqvzQNvjrjcSREMPzDfBmeA95SsoDkQXOn5l2A7e?=
 =?us-ascii?Q?+DTCT5cOCDklwzK4xVEPqwe/BKYHVKZbjaMjxrknBOCbTt3KHm8xgBt2iWN8?=
 =?us-ascii?Q?HHSbcvbVZpC+L1lTDoRUidffZscNVomNdsrmG5MKas7iZTbmyx3j1D74YMc/?=
 =?us-ascii?Q?XNk7S5B7uBKls5clbH3F0X09PCDc1P+JSjgdEWjx7ofh7RJl+sBGMM6dNfPp?=
 =?us-ascii?Q?tzLhle8zikEaf58Bx3pRGJN4y/r8J7aFHMy29muvNSVfHSfX+j2z8sLwCjKN?=
 =?us-ascii?Q?IswTfzogI5Gq81aoOufJcGdusdeQZE0Q+TzAstizca0taQzJbK6uBtpyUBXN?=
 =?us-ascii?Q?4sGeab2ANNOtdwf1bjQKblV12Q71OKafwuUoRQj+xpIQSHdghqi2BfiDrwrK?=
 =?us-ascii?Q?h13Er9yE2CLZE6JjIhOzb2iEIDi+m+VHiHHhLELUq51dCNWDpVGpohK6WNcP?=
 =?us-ascii?Q?iH52e8qcngwso1y63vk02xMgS/GuwezH5acSKp+rXmyAa6+ZMd6Ke5N/hPgO?=
 =?us-ascii?Q?kpLAm/PKavKcaaV0UPi1ld/zq6O+uGbxB2rxTbFrzDDBQ6R1Sjc+VhJW3HBt?=
 =?us-ascii?Q?Kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d795bf34-def0-42dc-3593-08dbaf6da0a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 06:42:38.4233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zi1da4ocFBBw1LTdiZNkLK+SB7+bQKsMALNMJu3p73ZTYBX2zlpeLZw4xhNeMZ4m9Y1snDowE0B2QDvG5aVcLKA49o56fdfz5iSFbXqI7i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11031
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram Sang,

> Subject: [PATCH 5/5] i2c: riic: avoid potential division by zero
>=20
> Value comes from DT, so it could be 0. Unlikely, but could be.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-riic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.=
c
> index f0ee8871d5ae..e43ff483c56e 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -313,7 +313,7 @@ static int riic_init_hw(struct riic_dev *riic, struct
> i2c_timings *t)
>  	 * frequency with only 62 clock ticks max (31 high, 31 low).
>  	 * Aim for a duty of 60% LOW, 40% HIGH.
>  	 */
> -	total_ticks =3D DIV_ROUND_UP(rate, t->bus_freq_hz);
> +	total_ticks =3D DIV_ROUND_UP(rate, t->bus_freq_hz ?: 1);

Not sure clamping function min_t/min(t->bus_freq_hz, 1)
Or ternary condition is good in this case for avoiding potential division b=
y 0?

Cheers,
Biju

>=20
>  	for (cks =3D 0; cks < 7; cks++) {
>  		/*
> --
> 2.35.1

