Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F01BA762F2C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 10:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbjGZIGs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 04:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbjGZIGS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 04:06:18 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D174491;
        Wed, 26 Jul 2023 00:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTJPxeJqRrdhnIH/bZtEgTvOm20oRhK9VjdDwQgsGs5IFQRUPY6gF1J+sjozR3Jabfgcd7imdG3s0eO+VvcLowVg+YSMP/I/hJN2T3wkM7jGFKuafeOBGIhzZxJJ5O3mC8uHRMfuX0bBVNbAhUh/OVSF/lcBVLVKhDv0mcE83Ry/PKqkrAh5mz9q1GtWjOtqCiy4oA1JIovCOAgpGoQP12oh6pHCPXMbKUKcmsKvFu4fdEkl5eAS/saPPfzkjwwapsJLSKaDFGZ48pETnlqKa9myY1e4elkVW9Hlq+dKU9OWg3uEpA1K9Q9y9xsnvKPeh3f+iF9U8CqF7/h7mDPaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwJBxfzGrTj9Rep7dh5Y7FXq5Piv43pC/JVsO/meBqM=;
 b=auPQ5tsFqvIXIp+JRHHuz3scAlPI3i+e36l0BI8SZF15l1r0Xp588YLsfzpDaoLjMQcl/D2krEFIihjvv7AY71pcFSyiP7+Ym//sLvw9kxWtlXzI57DZA0KFKgZ1RBhRHOzsOKo0k9g+qccIOAmglATI4UPIsADIKdDyarrP/5zLoEgkr5RV1stwZEMD7tSmIWC/0Z5F/hvttTglgVyJ1tQQ5mH3/lflcBbkGtj5Ton7Rs9axrktBUgLgmcjiAXa7y5gGcKF4d/pvngJOAKB3J433EfMthQ8PIBX+ksE6G60tp5X3jv1Lk5UbvlJqyHUi9YYrGt8ImWiHDIpJTvEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwJBxfzGrTj9Rep7dh5Y7FXq5Piv43pC/JVsO/meBqM=;
 b=S1HsNj2X0CD/rjDE7tYc0bNGqmaxGbckzNGzJ/L1yDKKZXR/BZdZH2gIqSeFdL2e97hh81RUXHGNAuMye4MJLWaEHBVNStX7S3sLfdNt/shX0Ed3wq0J4jitoEF14p1aI5vQuH9gIX0fxG51C2zIfP7ikKtHfu3Z2ABUmPeVbHw=
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 07:58:27 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4%3]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 07:58:27 +0000
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
Subject: RE: [EXT] Re: [PATCH v2 1/3] i2c: imx-lpi2c: directly return ISR when
 detect a NACK
Thread-Topic: [EXT] Re: [PATCH v2 1/3] i2c: imx-lpi2c: directly return ISR
 when detect a NACK
Thread-Index: AQHZvhzjv4jFIhXZaUCkfCS3EbjYo6/LKquAgACGlpA=
Date:   Wed, 26 Jul 2023 07:58:27 +0000
Message-ID: <VI1PR04MB5005569487D0E21574A90DF9E800A@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20230724105546.1964059-1-carlos.song@nxp.com>
 <20230725235511.lt62ubfw7geu5cfu@intel.intel>
In-Reply-To: <20230725235511.lt62ubfw7geu5cfu@intel.intel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5005:EE_|AM8PR04MB7346:EE_
x-ms-office365-filtering-correlation-id: 1fb01774-6921-4a03-009a-08db8dae181b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H5zpcweTERd7HfGLTcP++qwY+4zCTA4qmMCEK6efWLuAKFFNRZRSXXCh8WOUhFT5473WlCWHEKSJCWKCRHBbJh2VrrIlC+KpnXljr8vqfilTxwBSf10Yw4N4vC6oZOCw5DfCuc0nBtPkpeJycdyOh5NncU1miF3Lx5kgLFdO5APQzH6JWVtKpuI7Rc/Q6GmuLDg2O46+guV/6XpFFwWXtiWOypAQoFH/4j6CCby21L/vX6uPaxknciSiMsuXj8Qk6RCREnjnaIC1U2DKqN62B7LuGG+MFWpyi2g15Hthy+i63jODzkQrM70ZXzaYXMsYXg8pzJxClDCaWZF0EgEUdBsfSE6XNKEHhKdKWqaxlcZl6/wxgNKoyjivDog04T1/PafLVz/0UVN1ojHJs663AhKY81Fkn4ad4M2+oJeJeBuoLraV2qWnYC5mreVm9t1E30QPTFGdF+SRBn4JlUTg/VVOgiLO6YDDx0HdxZR3RklihBbPCwpeSjWUgwxXyevaZ4aeYPVse4CeLsqVlDKGY7nxn0z6mNSwRP+VJ0NK5Y5jOLXSURwyOZoB/uWAsJNT+i1K/no8THRT4je5wSoR84DVP0Rdnqv0y3rEFQgY2l2k+N1B7slFNP1Nn2ocrBxK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199021)(478600001)(54906003)(55016003)(38100700002)(86362001)(66946007)(76116006)(6916009)(4326008)(316002)(122000001)(64756008)(66556008)(66476007)(66446008)(6506007)(71200400001)(38070700005)(26005)(186003)(7696005)(9686003)(53546011)(52536014)(8676002)(44832011)(5660300002)(8936002)(33656002)(41300700001)(2906002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m4k3r9MrkEPTqazr8ZDXn5ncSEBuE8VPu7QWAVRl3HQ4Ux21K2AHtowN23QK?=
 =?us-ascii?Q?bHz3NKjWn5O9HLzwUV+TRNhNOrZGX+SQzGBMSCAQchagGMrvllidLNzuGn+e?=
 =?us-ascii?Q?CHJ34w5tWmJn/WbIkwQ0DIOt99TqBUrn9VOtBqLf+KvHQvV267CdkB4wDUYT?=
 =?us-ascii?Q?UshZfMxRhi64LD3BbKKUBBkZEuRtId3LB7wgJJu4llMZcWAMW9Cc87tpp3sE?=
 =?us-ascii?Q?EdQWIJgXvQi1peg5J1WHA2rYLpVZjG/cYfxs3XGfc7VpUh578q9Eio0okU6o?=
 =?us-ascii?Q?8N1/48Kbb3njnip64DFb4uGdZtaxHx+e7eTDmt4p5v2NNzd23cEC3GDxlDRW?=
 =?us-ascii?Q?fvZFYzeCtRQ3tQLVdqmjhy8jMILg6/5PlGk4KoNlz/gkInHsIDiqdeA7C2JA?=
 =?us-ascii?Q?G/qvxpaDDXeZlNPNEwIaGKjsa0tAQgNyse4vyuhq0afonvh/wRXRqm57cLVL?=
 =?us-ascii?Q?06/B63FBcxyCJHCuaRepng8oDsSaQHfW7i15ISp6b4UKUMI1grFuHv2HYkVQ?=
 =?us-ascii?Q?qKaizFq0fmnULpgjosIdfTl9UQrT3yfmPQygvRRMEzBsTTN5hLenXLzGaJvf?=
 =?us-ascii?Q?bQb8mYNEud2P4uApM+jsr0La/yZY2Yi+hen3+bBv+bIK2JnkiqVxbcKQ9481?=
 =?us-ascii?Q?t1L6Rfn44WDBHnBqvbdjmptmzGk+0nUOySFbIDrUhHD5CAdPwcug/PksD6AP?=
 =?us-ascii?Q?oOauMRRaXi2B3535ZcBfDLqfY788pIFJu299wgFoALz3H9SKlmr1SIGcDufk?=
 =?us-ascii?Q?dYqz6prG5qkRhPZKgg6sIKRm7mu5A08Q94AF9PL7Da+Jo7H3y2yfAiCZR0qn?=
 =?us-ascii?Q?GJKf2WYCXwvj10DTMb8b3gx+8WOsGbCEU+z0Bv0O30XaLoIBqmOXBZf2po5L?=
 =?us-ascii?Q?1vVfvhGweC/bsuV2dNzRc3KEsm0hboLt7aa1FyfxpiKdU01pJysVT6IYMmkw?=
 =?us-ascii?Q?4pByWEC/tDZCi6vwz3ZKABSoZ0oGeCSYymrmE3dhSK+OWg4ZRmOEeLjJU1eM?=
 =?us-ascii?Q?aopU1B/ZZbplG5KUWichocKNfF8OJZKO23UcOyba60DUXAKiynK3gqVez5n+?=
 =?us-ascii?Q?O8Ok5/AMZTO83fhBehTFNS5cy5ZpE1gAr3bDq481lpZsS1vOUmvYcDqHGnsR?=
 =?us-ascii?Q?faM8jdeUhNIJV3ebtcboP20TVwRMrDPk0GFlDQ97KTgnAqE+Z8H7IcOe2OAZ?=
 =?us-ascii?Q?z0mgSliyMdcGYiRPtGeOWBv3oud9rrzvyAzFo1CGDlKPRDQtaaL/xt+ziAlp?=
 =?us-ascii?Q?RAqZBjU6OrWDJqsAo/KErHfaH7Sir+zZuLfzN2f/oT6M2kkFfYfShUMEgc21?=
 =?us-ascii?Q?Lgjt6y7OhLRv5TYoebEq1cIQIJM8izTlHeuW0a4shLsbKDAnLhZtd4rdVSXx?=
 =?us-ascii?Q?WMTHh0ru3oLsxeK9UX2onHXC0GBf2McazzHG0JoDiT+UHS6ZkLugqeHag6yK?=
 =?us-ascii?Q?ALMUlT1i7FJa5Z/o0c3mRMD7XqmD7T3W8S1DJLJVQJLNrTzxXfCijMJiNZ4E?=
 =?us-ascii?Q?ujNYsrv/k+9yD4CTof+qF1vpGr9jNForzWyb0wl8XGhSs4cyOa+L7/nM90TC?=
 =?us-ascii?Q?+G5gRIUMb8U4J91U6V7Dx1TdJ/nj2dzg82BeK9WN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb01774-6921-4a03-009a-08db8dae181b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 07:58:27.1136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KkCSsGQ4QwyFldZTOz9v8SLS6+0FGigcQ6R5kOUZpBrfeNo5xEt3MQLjRdvBcD88Y/qYZV7XDCbrQ+qHdInPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Andi

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Wednesday, July 26, 2023 7:55 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com; Clark
> Wang <xiaoning.wang@nxp.com>; Bough Chen <haibo.chen@nxp.com>;
> dl-linux-imx <linux-imx@nxp.com>; linux-i2c@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH v2 1/3] i2c: imx-lpi2c: directly return ISR whe=
n detect
> a NACK
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Carlos,
>=20
> On Mon, Jul 24, 2023 at 06:55:44PM +0800, carlos.song@nxp.com wrote:
> > From: Gao Pan <pandy.gao@nxp.com>
> >
> > A NACK flag in ISR means i2c bus error. In such codition, there is no
> > need to do read/write operation. It's better to return ISR directly
> > and then stop i2c transfer.
> >
> > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> > Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index c3287c887c6f..158de0b7f030 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -514,15 +514,14 @@ static irqreturn_t lpi2c_imx_isr(int irq, void
> *dev_id)
> >       temp =3D readl(lpi2c_imx->base + LPI2C_MSR);
> >       temp &=3D enabled;
> >
> > -     if (temp & MSR_RDF)
> > +     if (temp & MSR_NDF) {
> > +             complete(&lpi2c_imx->complete);
> > +             return IRQ_HANDLED;
>=20
> you can actually remove the return here
>=20
>         if (temp & MSR_NDF)
>                 complete();
>         else if (temp & MSR_RDF)
>                 exfifo();
>         else if (temp & MSR_TDF)
>                 txfifo();
>=20
>         return IRQ_HANDLED;
>=20
>=20
> BTW, the logic here is changing, as well and it's not described in the co=
mmit log.
> This patch is not only stopping when a nack is received (MSR_NDF), but it=
's also
> making mutually exclusive read/write (which I guess are MSR_RDF and
> MSR_TDF).
>=20
> Is this what you want? If so, can you please describe it in the commit lo=
g or add
> a comment describing that the three states are all mutually exclusive.
>=20
Yes. That is ok. I will fix the commit log and send V3 patch.
> Thanks,
> Andi
>=20
>=20
> > +     } else if (temp & MSR_RDF)
> >               lpi2c_imx_read_rxfifo(lpi2c_imx);
> > -
> > -     if (temp & MSR_TDF)
> > +     else if (temp & MSR_TDF)
> >               lpi2c_imx_write_txfifo(lpi2c_imx);
> >
> > -     if (temp & MSR_NDF)
> > -             complete(&lpi2c_imx->complete);
> > -
> >       return IRQ_HANDLED;
> >  }
> >
> > --
> > 2.34.1
> >
