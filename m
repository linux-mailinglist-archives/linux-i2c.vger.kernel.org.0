Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E9975F3CF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 12:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbjGXKum (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 06:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbjGXKul (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 06:50:41 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2062.outbound.protection.outlook.com [40.107.104.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8D9E6;
        Mon, 24 Jul 2023 03:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZTtDTDXD2ovH7jHD+XsjVavE8tMtVie4+EcQNv5JVG60DVbjreiMYxld8sJJAPsar4dTt0J6RzEN6mfd1IjH/WJCWjRo4tL4pYcjItrj4Gvv+UAa+JVhzBJqj9CDp4kl0zCMNahFdnMGHQYqnQYo2iBor8tYEpjp3uhlUso2r5ou87k4QWb1VY1zTsKhjE6asHuBvIzgDnjkjDKz5Hf5k8uUYiHM6lKjQjGz26+ax23F7Pp4UrUkVHufWASKwRQ93D5rY6PmIMd/3x2Go2T2g986K27xn3lflHtDfDvpE/vxev+2g2xK7XnLKD4dJAJkLcSBVheIxaBiqzl/bA3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/oZxdegyP6Bix7XOEeyjmjmTJOK3UVznBd2X7eIgX4=;
 b=V5HstkRYpl/ByZU8bYdcfY/Y95BspBeVQyOrlBwo9S7XFL83GYJN9yAte1b6xCBpzLiqQohxpm0jwalsV/lYGpUBCVKdKJ0X7kZrlajXjHF/V0eJk6xvYDAgS+rBjGw23yQHxeMFYFo9wXXa1oFSCk3l0vkp8Bzr4cn6CmFowvJe4dlfMNTvXOyF3ZCvge+nXGLk/scJhbD0L/6kCLuB7vPmyoK2tA8BAM0o0KR9da69W9AiK5XTupMG9omIWMp5GTat4/6+LtJA74oIJzcOm3NVZrlPTVHxSRLUct8pBLqeW4M2ENkFauH056to+N7FW+lSj0NyXZVW621YF0yJkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/oZxdegyP6Bix7XOEeyjmjmTJOK3UVznBd2X7eIgX4=;
 b=cb1/baS6U3UdpSTxnE4hXohaOrNCUqiK9GkFGnLi4AuwxqJQexk34WJrz06wNE3RIPn1qFEKBS04twKhs9ieSPu+gcPsAl0Vg20oA5gxbRNZ/vcl4nrbwln8YcxwZvwZg6i5vKH6SzNZLkfJrZX/6mXmee0XL2N8x9ExJOJpVHk=
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by DBBPR04MB7995.eurprd04.prod.outlook.com (2603:10a6:10:1e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 10:50:32 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620%4]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 10:50:32 +0000
From:   Carlos Song <carlos.song@nxp.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Bough Chen <haibo.chen@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH] i2c: imx-lpi2c: directly return ISR when detect
 a NACK
Thread-Topic: [EXT] Re: [PATCH] i2c: imx-lpi2c: directly return ISR when
 detect a NACK
Thread-Index: AQHZjei3Li8kbFQBxkuT6KqRXBShKq+JjO6AgD+IAdA=
Date:   Mon, 24 Jul 2023 10:50:32 +0000
Message-ID: <VI1PR04MB50057EE88859695BF48A402EE802A@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20230524024002.1790405-1-carlos.song@nxp.com>
 <20230614000841.frvf4n5zgh5eihmq@intel.intel>
In-Reply-To: <20230614000841.frvf4n5zgh5eihmq@intel.intel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5005:EE_|DBBPR04MB7995:EE_
x-ms-office365-filtering-correlation-id: 69f89070-9442-4ff7-8757-08db8c33cdaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vTwywuCuYYUMxQuNvpdDEwCHZYmhlyS0t9KIEXkqEz8VjK1x/tPP24Jfa21eyasLBjV4acVxU7ciili5L9bjgnhKXGGWQPrCTnS32Y7ZP1tNfZ9qoXcWsHkQAsyk9XFyq8aMvQfVa3LiUz+6DhfRbhMPCgW2xA0Ahf5q3jb6DbhwWmVuommn6FOUpv57jDHeWSy8PX9uNcuH60Yx5GmgAfIF2j0Kb/IM6NtECSD53QWe+OmjKIX179Z7qo+wFG/S3jLgEumocjEAzfx4yoBJ61uIAVVqw8kGHvNDdzVqa5OlCI5ctCIaHZvaaHZ9hamXXLK7r57SIVBCxAuSK4gqd7lxcxTstWrOnI6cA/YCf7NoTVQsM6gP7Brxvk70i44Y0BFjZwEYMGz4ewK0TRLfWmSxcI/d7sQOohkoxldPmBN20HmGKxE7Mf5zAqc722a24VUPudaPS8HPaSY+S0unOBmzRfhtOirPbB7vu/QXpKjUHXQpcx49rpWoBPNtw++SE8ytDFCyzw7GeOWwuBiE66/00KaMUJ59h+9YA6DVB05XAP26Gwvy7CrpvrjuDop/Cm0dWO53f30+1f265Cm0/9j3X1wmTTXeUaO+tb6XM7nRsEQLY3rnvhN9LCepDnkl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199021)(2906002)(55016003)(478600001)(38100700002)(8676002)(83380400001)(122000001)(9686003)(186003)(6506007)(26005)(53546011)(86362001)(52536014)(8936002)(5660300002)(33656002)(44832011)(71200400001)(7696005)(6916009)(76116006)(38070700005)(66556008)(64756008)(66946007)(66476007)(66446008)(316002)(54906003)(41300700001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3rAXtv2ETuD39scxhKR157QBJMvIMqfw67+WC7bRjqiT2Q6L85AJxy6g6QmE?=
 =?us-ascii?Q?IGv+s9h9eI6sBZxmdewacjP7KVNR/ivU1E4QeN3AxiwHbN67ZVK5bLL5C5UY?=
 =?us-ascii?Q?3hSmNY8GuNWlvcDxaayp7ihxHHqsp5ipbpYb0DpC07BxPt8z/6f2mtxke5y5?=
 =?us-ascii?Q?1YpHH0e2bH7Y323nTQ9Gz590J7MHg3kb5bCNPK420BLfrtDGWP7KeybZCylL?=
 =?us-ascii?Q?J8cFbIXTU0ikk8M8JZ/uleDiJOREapH6b26V3wo1EC2KMfxYI5SDHOWTakkZ?=
 =?us-ascii?Q?BbMM9VzgOygWe3kNUEpgts5qN033iBJEGNmhJV5A8zeY4VKFws1ojdxkbDvU?=
 =?us-ascii?Q?Bt4DzbRp0ibB/eCBfDfBRN9EsWGICHpCvpW77IXHaF3WTrfdUwoY9+Z3o5jr?=
 =?us-ascii?Q?pYkjAkhYhPq9T3kCjT78Spn4waQiKj6bOSmXXhN/znZ4LAUOBiF3rgGV4QcR?=
 =?us-ascii?Q?pnIlKKkUVqLduO2Gkhzr2pSgIc2klkyGqG4fuAdQqod/FQQAnBh594SOLWcT?=
 =?us-ascii?Q?YiyyUA8L18OFbegZDXZJIIiC1qrHB4aM/AYofD6J/cunqhRDHznhHrfzZrmW?=
 =?us-ascii?Q?bO2awOBwY9s/1W/IZLFSVT8QzC3Crvv7EJHv/EDsnTtkSIHkHqT8zWcSG6z0?=
 =?us-ascii?Q?8cdUD7jEHbjaSzEgwd96SihGnKIWlX08+0AVv+MlPBlI6rH+tcjGOTaim9kv?=
 =?us-ascii?Q?JG+H9+t7G2vz9CLQXOSUzk5nsgTFXgx19fY/8z/nbuIcxN59ImvZe+k0tX14?=
 =?us-ascii?Q?vqP8Y5CgO4Hv1vC8HBR1O04H+5adNq4t2Atj2rDIQnC2eD7cs8nB9shVenQ4?=
 =?us-ascii?Q?fRmtE9JWqhKAn/P52U/VK2KjzFrhH3TZHnZBvmXafCaVDjInD+xVf5bX+8CP?=
 =?us-ascii?Q?+RPeB5YB8osLI+G0Wnfo+dOvuIBFex8BvvIOIgPuk6aA3W6ZGDmrMvFgvabV?=
 =?us-ascii?Q?twX1NKBNRLkeiqRTp32PzaOLJK9riHXGRmxaK8+2tNf4TjZbjg3LreUc6Enz?=
 =?us-ascii?Q?gLD+7XgF9zhMGTQiJ0j3x2ms8LjbPAWB0yZP7JbT2eZUtkBVQvjkxLFsoeVw?=
 =?us-ascii?Q?AUCbtwNRUxDiwKcIpeZ4c9h9RxQ4He/G+sGALq2gzuhH3uFu8vJrVirrWazW?=
 =?us-ascii?Q?XamAvUT4usDFPQEPUvKZiZMRICrU8n0RR6Sxi93KhAgIZv1WVFzF3lHvwrMY?=
 =?us-ascii?Q?sN/VER0cEkRKtzw8X8adBduWVrwlALoIUG4Be2WGzSd1hoyHxfKJZytQN/Y5?=
 =?us-ascii?Q?cBlIKEGQT3Z3EARJopEAr6N6mOHj958zXckh8Qm3I1UDDLaxpaGAL78paeoZ?=
 =?us-ascii?Q?uTl2gkXFQEbuUzB7oRRyzS6j2477kSt5TKTeBQTcp063oPbXlPc0/W4ChTcA?=
 =?us-ascii?Q?EV3uf4d9nL2OLaYX4v6XlOlKRbhXId++kL7YXI2xNwAsPiP0aH/25MhYT2Fs?=
 =?us-ascii?Q?/pcaxKL3NuuYvoeDa0O6UOEUHbJRbK5/kj6CmuwMbbdb7n5Ld70lnZGRM/a6?=
 =?us-ascii?Q?jZogUeJbCcHrb88UuSLf17mpZyLKSsUn7urQjqL+8OJ5O41eRO9YK3ZCkzf9?=
 =?us-ascii?Q?ZuiPybYPgT/jvXmYK95CghJ3L8EEZE2GHGX36/fL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f89070-9442-4ff7-8757-08db8c33cdaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 10:50:32.5036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lr1kafaHarxYQWmWWq+3TYELExAHUI7uREe5y9U6x1hx5pytV7dnJIfWDTaU2CyUjmpLUwnJbsB62PusT2qvKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7995
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Andy

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Wednesday, June 14, 2023 8:09 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com; Clark
> Wang <xiaoning.wang@nxp.com>; Bough Chen <haibo.chen@nxp.com>;
> dl-linux-imx <linux-imx@nxp.com>; linux-i2c@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH] i2c: imx-lpi2c: directly return ISR when detec=
t a NACK
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi,
>=20
> On Wed, May 24, 2023 at 10:40:02AM +0800, carlos.song@nxp.com wrote:
> > From: Gao Pan <pandy.gao@nxp.com>
> >
> > A NACK flag in ISR means i2c bus error. In such codition, there is no
> > need to do read/write operation. It's better to return ISR directly
> > and then stop i2c transfer.
> >
> > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> > Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
>=20
> looks good to me, just a little note.
>=20
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 1af0a637d7f1..11240bf8e8e2 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -514,15 +514,17 @@ static irqreturn_t lpi2c_imx_isr(int irq, void
> *dev_id)
> >       temp =3D readl(lpi2c_imx->base + LPI2C_MSR);
> >       temp &=3D enabled;
> >
> > +     if (temp & MSR_NDF) {
> > +             complete(&lpi2c_imx->complete);
> > +             goto ret;
> > +     }
> > +
> >       if (temp & MSR_RDF)
>=20
> else if () and remove goto and brackets. You have used the "else if" belo=
w and
> we can keep it consistent.
>=20
> This way the commit log should be a bit different as we decide to check
> exclusively using else if's for the active bits.
> This way we also stop processing the MSR register if a NACK is received.
>=20
Carlos: I will use if else and remove goto in V2 patch.
> With the above I can give you a conditional r-b: are you able to pull Don=
g into
> this review as Wolfram asked?
>=20
Carlos: I have notified Aisheng. He will add review by.
> Thank you,
> Andi
>=20
> >               lpi2c_imx_read_rxfifo(lpi2c_imx);
> > -
> > -     if (temp & MSR_TDF)
> > +     else if (temp & MSR_TDF)
> >               lpi2c_imx_write_txfifo(lpi2c_imx);
> >
> > -     if (temp & MSR_NDF)
> > -             complete(&lpi2c_imx->complete);
> > -
> > +ret:
> >       return IRQ_HANDLED;
> >  }
> >
> > --
> > 2.34.1
> >
