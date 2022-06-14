Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A34454A978
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 08:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352164AbiFNGbW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 02:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352443AbiFNGbL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 02:31:11 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6067A38BF5
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jun 2022 23:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAOQzbd2Bk/dHEASEQ2rK+fzgfovf9tY8pOhoge7AvRLgcD6m9rNgdxIAl8V9CndEdQ6uwL5tzrYty0ZsWzH3R3XENLGSHabR4p+Dlso74k+RYmhFlnLD76ywRgsg9F2TsDjNEJY73tBCpC09/cUKuV6NsO15KnUpC+nPBF6GwZsm/vhcZVH23RK+KF2uXpKNVVlqN5Xmg1EXUU4PhLt9ySirYgdPw0zCFF2QaUaxq7zA9TCfyw6at2sPl3cy8MmK3IBpUac0pzB12Cs1I4cXvFz4C1ZU8TGbC1IJQXQyFRU3NyTAORbt4Ns1wcljnnTECkaGoLEiRFZfV5SveU8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrPLGDLj7kHK/jqGgxARlo5ZLvVQUej3vE+TC2Q+VJk=;
 b=cibgnFSmHFBTmoa3K6+9nczkgCSVbdrGBMYuvrPEnSXRNoAsEW2YWUlGB4LShaLF6l5hc7dkFY4c7XOgqwKBNe5oLVzOLRHjrgg3M52voLVhJ03c6b9VlRzGiTvBGt8JTi96f6W227HY4wGxY4CK1HB8BwzLMN/iKn2/MY77NOO8doAsuPz70itTVInNvZjGjrNzq+ZN5WwdQSK7Al5TnhzszzxDvKhUMS/TaVOc8nOEPLWfGhQQLgniVcgX81goo12CWaYBPA0PbuhGdUVIXcbILcZbBFLFUENjI0tN5Vq/dZMhvNKmMXDvh8/0kA6TeBzWsONXob3MwLXb/iAr4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrPLGDLj7kHK/jqGgxARlo5ZLvVQUej3vE+TC2Q+VJk=;
 b=mQyFo2t5cEIG/AFjriczhOq+g6soYcDwnxw98Fo6YUAHPByU2NswLu79jgM6riwLUAunqQCs9hnZ0K/U5KHZVj8usczn1prBxj/tTCLsNZ9ovppHdt/0SrPRh6S79wbIfyPX9HXqclCyZnRiYaWaFwd9+SVjnyy9TqP1rHxcdUw=
Received: from DM6PR02MB6635.namprd02.prod.outlook.com (2603:10b6:5:221::18)
 by SN4PR0201MB3501.namprd02.prod.outlook.com (2603:10b6:803:4d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 06:30:51 +0000
Received: from DM6PR02MB6635.namprd02.prod.outlook.com
 ([fe80::914b:e95d:6a:8044]) by DM6PR02MB6635.namprd02.prod.outlook.com
 ([fe80::914b:e95d:6a:8044%3]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 06:30:51 +0000
From:   Shubhrajyoti Datta <shubhraj@xilinx.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Michal Simek <michals@xilinx.com>, git <git@xilinx.com>
Subject: RE: [PATCH v2] i2c-xiic: Fix the type check for xiic_wakeup
Thread-Topic: [PATCH v2] i2c-xiic: Fix the type check for xiic_wakeup
Thread-Index: AQHYft5b7g3Oe6DOtEqQcRLMGkdrIq1NbU2AgAEFP4A=
Date:   Tue, 14 Jun 2022 06:30:51 +0000
Message-ID: <DM6PR02MB6635152D3874D40B3395808CAAAA9@DM6PR02MB6635.namprd02.prod.outlook.com>
References: <20220613043002.28152-1-shubhrajyoti.datta@xilinx.com>
 <YqdPtexPiukMlUcG@shikoro>
In-Reply-To: <YqdPtexPiukMlUcG@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-14T06:30:47Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=936f657e-cf9c-4331-a235-100f62222ef7;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa2b65bf-9a70-46f4-1eb3-08da4dcf6d5d
x-ms-traffictypediagnostic: SN4PR0201MB3501:EE_
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtFwd,ExtAddr
x-microsoft-antispam-prvs: <SN4PR0201MB35014F3EB81393B08D4F4354AAAA9@SN4PR0201MB3501.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3u9CZH/o9cZ5rITU/fWWszJrlMBu6bbCvzriFXJnkK490dsSJZcrkdUAUDKxa+JmW7xaRt0cjfvUiZD3+F4BqBgKTeZuojIxBaFa2c7oO45JYKPNRg2/+iSNmLAk6R2jHBdPf/8yXDz3u9a39Ej61C2T+RDwR+bcm2ML00gmUYdP4zoER0MdN0qYsCShuQitLIv8exnnJ2TsbiOrXINiJWOARSmLiNDHQjoNUsZKunn0ZHhWLNnIkDg8b+A5Hyhfli4VsJKU5EmSOVAM/96Pkf7cNNQa8L28eJdA4Zp64t8TWCB3YaU1saP73NfOx+mn+0YjU0S1zKchFgURVn3brZ7P994i06ZT7sHUL7THs22QeFk8XuhF7Nw6tHExbJ5Rp+eo8kXJIJJ7ngv4JifMpz3aMgVme0QOoGxJU9mfHLVlralC0qWxftgktDzB8ZloE3TIC5av7A1rOqTzW5FNitq26+143pOLJpXnfXfCem+9W8xNTwkGFLs2vsaMhhgeVHnBQlF3eV+4t9MlQfpMkoEs7XQWw8oC0EZRHfBQQ/L4IGoH/u7gNIFyzAKaPLq8ZnjLnI/7xmYHiNIWoMdO9GOHz8g5CEuV4PzSmRCbu3cnJjYozrKPh92sjpFNqRtqDvwx2eXRyiPL8seO4Wma/oHbDDMTQeqFDJcZ7qP8/hxHWFrevpe1hR39YZIt0jJJBwWbS5TjZGimTDuuUJyAkQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB6635.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6506007)(26005)(9686003)(6916009)(53546011)(5660300002)(55016003)(33656002)(4744005)(508600001)(122000001)(107886003)(52536014)(66946007)(186003)(83380400001)(7696005)(66476007)(66556008)(8676002)(71200400001)(38070700005)(4326008)(54906003)(8936002)(66446008)(316002)(64756008)(38100700002)(76116006)(86362001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w/Gc8ivVQ1cqaRnqB3Up6hXi6xSGlI8MSdgM7J50F4BJABPEmqhtkLXdXe9p?=
 =?us-ascii?Q?IKBToKQ6Tws/HVos7FYeYHpoZGkGyGH4XE7WoiV+mtHN+PRH/TL6av7O2gV1?=
 =?us-ascii?Q?QwxHKivLUJjSRT3rFNMgFHO7fwVXZsiNayb2oVQmBq+73W5sKgeYKLtN8lmy?=
 =?us-ascii?Q?OWi/EvIazHkeII/s1zEGte94oUb+Ulg+beQeWNXlYpVVUDCIYBmofm29mvJy?=
 =?us-ascii?Q?5Pdyb/Bja5wHXNld3sYeuyDm/4m4elCfFfkgSwf1Cb0465NvUOmXgeHms3aJ?=
 =?us-ascii?Q?GMZ/Sv/g3KFiBjDRMzAxUQAA7LW1fJDtMBjuQRGBr4uMOtoiijz9b60CiiJr?=
 =?us-ascii?Q?SqvMI+AWK4KR8thbVuXUrVPihM1gATZNApZ46/jdM5jnvnLxw4Ho+J+gyLgu?=
 =?us-ascii?Q?7spUlJIZlj1AfwIuTffWnDiYwmja+iLN6ahnzsyG/bsOLrDGlJcqPIjfZCgF?=
 =?us-ascii?Q?GDWhsclfsWIB38U/LWQFeo9t3J1mF0N0qfKSGd8xPdy4MSMYQx2xpQKtqttU?=
 =?us-ascii?Q?ySXbmuHoR+VSAp+YcHfylrtFoLx6DcfMHcgHaDLSPbpVXSY0lxxcYHVxiRR/?=
 =?us-ascii?Q?DbgDM/ntBdE4KqUTLpiQ/ftHiZ3JHEkri9GziqFlHcLa/tTaZHZjZjSvC97p?=
 =?us-ascii?Q?qLhRnPl6K2PEdfkWQfpI5VUpcSLsqUzhrnhxlGsxmUeSoVFwmzRewUaVucr2?=
 =?us-ascii?Q?ir8PCB6u95ZPp/rgkWa1Z7qUHIdn4sfVUGRzo1bBp4wF+3m2Tthojk7+MC2f?=
 =?us-ascii?Q?Vhu5A1HoEag5108ckvt3tOKGw5fj8TXd9ZNzHkkqkC6yede+XpAfN6t6BFK0?=
 =?us-ascii?Q?OE2sCIPD9Z0scMv7gMMGxYOIJZMjOJCI8Gv6P4R33nE9FR/+5znjTb8jLaIf?=
 =?us-ascii?Q?Wci3BIhzgUcWUxsCBVcSt9XhAOSzkV4BqtPxAkf/BK3p0yLUW9SCuREwx3lX?=
 =?us-ascii?Q?WIVpImUfvkRD/J0I9cshYt1+6jlLZZSRJsQWAyfm+ycwpm65CCVM7+X48WiG?=
 =?us-ascii?Q?qEiBV4hfACMxdquCEha12MySOGt9VX4UzZxDgTL8ST7Ug8p+edyCnBbUUcI8?=
 =?us-ascii?Q?LFSBxZ6nJyHyDCieX/99h1Z5QVqEaWjF0k2twf/of+WDq2l1uRYkl93xTm0z?=
 =?us-ascii?Q?I3XOqpauZshsh3rI68eLJOcRjNc7LRPYnoBtR0W4JVptgDMHFWqg+s3G/aMN?=
 =?us-ascii?Q?f5s7LW6cMuKP2xxdU/1hlTynzQcmxjRq90uUKxnVX/sLsAdaTYb16eUVUSV7?=
 =?us-ascii?Q?Btiup65xo/qYxLRufbHJZgT1SyiBnihwp/WjP2vfXSoqFw3sRtz3qLTbgQ2U?=
 =?us-ascii?Q?QgChkpypjf1UZpab4iu9PrNWnAN+fB+m5Xp8yrA/kwgL+NFmtJfiLasC2xUe?=
 =?us-ascii?Q?dH2eOe1n0YYcAIX3o4I0VvSfFFEQM8Pgn3Zz0diLlKvj8XvIbP4p0fXFcpXQ?=
 =?us-ascii?Q?5kDlICEuCDadWCneA1QQUiWSNVqYA8LDqw8QNQNGmzX9UAhFNXiUouqIGxtE?=
 =?us-ascii?Q?+Vb2lkv54tVZKPjOmVQOOQqgUlHNeO3w1gxnyOCPo04Fxi0nIPkr37ybTjm+?=
 =?us-ascii?Q?XbNs1aa4BnfBAjJ0IGtwSYVznr5yWNBwRzGDTYqPasNVrO8+hS+d3A9NRQf2?=
 =?us-ascii?Q?M1kTIZdh9fRbYU52rN9HqULN8Q7RSSp30KOd7hkx7SJCkocPwVCy29VOGMs6?=
 =?us-ascii?Q?IzgOt7gpAlakChxrMwNbMljtxcV/V4oNcM8hM7Q1mjAAcBNBROs8labUJzht?=
 =?us-ascii?Q?pmuFwU5kSg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB6635.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2b65bf-9a70-46f4-1eb3-08da4dcf6d5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 06:30:51.4422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TnPzxu4YXt/2TR/RAVXkpYUTwmgWRKERE76fQbXS2oVHAsRIG44tol6TiaCd32KUomTfpYS/FV+UqtC8N1WGKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3501
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[AMD Official Use Only - General]


Hi ,
Thanks for the review=20

> -----Original Message-----
> From: Wolfram Sang <wsa@kernel.org>
> Sent: Monday, June 13, 2022 8:25 PM
> To: Shubhrajyoti Datta <shubhraj@xilinx.com>
> Cc: linux-i2c@vger.kernel.org; Michal Simek <michals@xilinx.com>; git=20
> <git@xilinx.com>
> Subject: Re: [PATCH v2] i2c-xiic: Fix the type check for xiic_wakeup
>=20
> On Mon, Jun 13, 2022 at 10:00:02AM +0530, Shubhrajyoti Datta wrote:
> > Fix the coverity warning
> > mixed_enum_type: enumerated type mixed with another type
> >
> > We are passing an enum in the xiic_wakeup lets change the function=20
> > parameters to reflect that.
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>=20
> What is the difference to the V2 you sent 4 days earlier?

Some issue with my mailer was not able to see that mail.
>=20
> >  enum xilinx_i2c_state {
> > -	STATE_DONE,
> > -	STATE_ERROR,
> > -	STATE_START
> > +	STATE_DONE =3D 0,
> > +	STATE_ERROR =3D 1,
> > +	STATE_START =3D 2
>=20
> No need for initializers.
Fixed it in v3.

