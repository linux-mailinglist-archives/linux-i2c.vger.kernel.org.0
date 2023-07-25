Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3378760CE2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 10:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbjGYIYa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 04:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjGYIY3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 04:24:29 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2055.outbound.protection.outlook.com [40.107.15.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146EBE66;
        Tue, 25 Jul 2023 01:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AN92UHzQTXjIBN8QX1mvWr9ShmEshDQQSqqi/cULdGij/kYV5EwAU66LubONfDjZmc7q1I3ND+HXQGqjE4XH169/LXAu4dKXsHGeI99kKq4ZgcTaP6nIj1Ae3ipQWdl1KcvCgPA3WfJiI8b9MAax2AFeDAeN7h2lyRbsnus1dGICnT08OVRxS7XRevifyYAG9hh1eH/DUPybIfrOGjF8Y146Z/x/rKpXjQU98+4i0ufjJ1glpix9fImZ+1uIjDyxivBdWXisW/fhFPHW7syr2oV1P5kAgKfByZD1wKpyaMuL+6+50JNe9J0VAWS6jsA7Iltbgisi1lkBRdgXaxCPJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XunXLFLUyKRlnDiq25Wd5fVf9AmTD08zPktBuOFELE=;
 b=VZRhEROgBUosBTsKpTgKNfCTUBmIFACX8UFQReqvkR23V2P20XQpRzGNj+dt3cmRR9+BU6tKoMcjewoKLvnXqVzL07pCp91Hzj90Lh8ZNQyHBMGXSNZZMIx8NSruA2gHNetww7o65wOOiMTIxEM6lZYih8YPm/0i3oyr8HIujXATV+xP5b/t9ZPXI8sPwcQiXGcU8azFCo/FFWlLlr9vpgNKkBtgjfo6U+N9d97+Fboj0V0NZY2EQQUIyxHWwk/qKyy5Mo8HsibEGeplT7BADqR3RUQ2Pu+Nta9aWoxugzK46s0UXgJgUN8VxCvjWPNNjHxvCReknQ5Yb3JOym+7Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XunXLFLUyKRlnDiq25Wd5fVf9AmTD08zPktBuOFELE=;
 b=UbsGlHOsH17GmqV5hgMcJv/E1igr89TOSL578QrnJbyuPq6a3ISgLKinzZNyZXoLGe/O0en+FqFmfw39LYf2hDIQMfjy5NUXASrwZuaKMiEFqJDfPI9t3Lvm1An8xf1YBB0qxtwTpa1+afRi8+knewfj3EzuwpUjpv8ITy5qn5k=
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AS8PR04MB8562.eurprd04.prod.outlook.com (2603:10a6:20b:421::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 08:24:25 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4%3]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 08:24:25 +0000
From:   Carlos Song <carlos.song@nxp.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Bough Chen <haibo.chen@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH v3] i2c: imx-lpi2c: add error message when i2c
 peripheral clk doesn't work
Thread-Topic: [EXT] Re: [PATCH v3] i2c: imx-lpi2c: add error message when i2c
 peripheral clk doesn't work
Thread-Index: AQHZvpzCEhXw709NyE6D1CfKwLq1CK/KCdGAgAAR+BA=
Date:   Tue, 25 Jul 2023 08:24:24 +0000
Message-ID: <VI1PR04MB50052C30E9D8F6108C0D0B91E803A@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20230725021108.1977494-1-carlos.song@nxp.com>
 <20230725064455.i5oq5y2jvjatxesc@pengutronix.de>
In-Reply-To: <20230725064455.i5oq5y2jvjatxesc@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5005:EE_|AS8PR04MB8562:EE_
x-ms-office365-filtering-correlation-id: f1ce3556-48f4-45e9-c724-08db8ce88e2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5QDrlMfSqulbMCJxOfYj/lT6hyEBXSNxfWs19k/5Tw9dWnqE+S/V4RR8vIAsui6cHLIXQ25xZbXCD2gxXOjs8Y3dBWHowj+HW5ScWfVDJbQeMupgqdGVn+h63qygrh5IYpOlIPZEAru1zVckcfM+7+7656wdNTZxv3qqGWQay0bJkEPofUzCf1O0CijbqsXsi7y6xE+pM+cHNMOglZx4kOb0vc0yOIz8JKLcAcjSxI+Xr6hfGhtRvIHZ3iy16tbZrrQb7WgNMTk3xu8BCxO5gnmUM9BZsA8Z31viWdWbLpLdKdOPEtP47SSmNNXmUMiT0F+AJdJbxcBGQHJg7Wg0J9mtevbu7b2O+tOwQuhwLtyxBgDLf2ktvx9Moo1REYuA9/IuSKndcWqqp6Z3Y/JGDh5TmwivfqF+9cVqCUjI4q2bUcer1lekjhknbYIhVgQByLtPvaIKKXZJrkePr0p8P+RcL5Jfggvye6h+FKr0JRHAD/kRxQkipgaJnwMzaz5t8U6zgXM7WpENis00zUXiVcMLRZURXNQD4sr5BPPtlSYWWw0HpcnYr/UQeDvp6aMWCacxQQlnCPd8GZ3Ke3vAnDqMLKhsYp8By7FVkIkDfLE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(15650500001)(2906002)(71200400001)(26005)(6506007)(186003)(4326008)(38100700002)(122000001)(66574015)(53546011)(83380400001)(41300700001)(5660300002)(52536014)(76116006)(44832011)(66946007)(33656002)(316002)(66476007)(66556008)(64756008)(6916009)(8676002)(8936002)(38070700005)(86362001)(55016003)(66446008)(54906003)(478600001)(966005)(7696005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0wmIqvDggTYYOKnqHGBf1h4DAZ+QpwxlNuTFKwUUalkKWoskjApftLVyqL?=
 =?iso-8859-1?Q?o6wfBnUUEYuYxSuvza+s0BCAUopRS30cNiKwos+zw5RJ+JJOC9nLLHlDKH?=
 =?iso-8859-1?Q?moxrtwIwSb1HYcmNqC0M3rM/Fp9n1I07LZtKCCYMMT2PmTqK/Uz1Ro/vOC?=
 =?iso-8859-1?Q?QcD6jxmX5T/pP2tDMdMH0acVY+SQLXsRIFdmfGsM2o/SRuDaiPnNR8bKJL?=
 =?iso-8859-1?Q?3Z29w1lTkOsUq/dOlipWQQEOLnajwoikNAIQI4cbegY/dn/pBc7nWpwgLO?=
 =?iso-8859-1?Q?VSidrajRQEmK8x1ILazxo7+nsM9KFypcAXBPqQo6SMwmfUWJpxsR7FNZs6?=
 =?iso-8859-1?Q?pTO65oMabYG2VbFikXg+Kp0E4DrCF0qJogXnOB/+0W2/9g8LsvJXFHIJxr?=
 =?iso-8859-1?Q?R1DRW9eN7m0oZjei8dnl8DahZ1ALQkeeWakbqeeHGLvRhYN52PgF3T7+TI?=
 =?iso-8859-1?Q?L23N/gFMC7J0IyrqBG49p9yCE3OI8Z76ZnlgYpxDtpxBESspfk6nWR+BP+?=
 =?iso-8859-1?Q?o4sOBmlhAxzrUDPBOhV3YCk4fq9Ph2Q8BhlhvumW8BQq6SLzr6qVqHcTQd?=
 =?iso-8859-1?Q?sxvdgl2kKZQz5Ot8ofWCdQUHLzmB5Ucun56ui+GxMsIWrtS9fSityFo5wL?=
 =?iso-8859-1?Q?ZTsA6UrWUmVbOMFj5CQT2i2qLWsPeOoJq1obeIwGEdgPwhpiZSWhWUc6hU?=
 =?iso-8859-1?Q?SR7HHfYN4cIjejUqC7IGQAe0xJVVj6CzUImaojGNQ8muZdMMe48kZ2Olvy?=
 =?iso-8859-1?Q?HN+/MX98bmdT6XniQ8RdajfcN4bRKf8Joq/eDYi9Tv4apsCVrKB9JQjwao?=
 =?iso-8859-1?Q?wj790X0yZSm/HI9tA9ZNcyagskNG2POKJp29sY8GV0E8OHKfbhYRMLcpQI?=
 =?iso-8859-1?Q?A7aGzcPlHzCZ3KeTgenzIytRCfau7Qfg+jbadTRfXspV4ww+G2dCXRPnJ0?=
 =?iso-8859-1?Q?DLb3d2afARpaS8Cvkwmio/9l8qyrUBeAw1qfYd2s8CBr+rksdgIxQ4Fls3?=
 =?iso-8859-1?Q?S7ocNsNfJ8SfPiqg7XIRfskNpBjTH3vcNvTV6tyGsN1GxO/iVrNsSrmCI6?=
 =?iso-8859-1?Q?ZNDV629P8Wf8pfhjlRk5eNgFBadQkoNcPw3QMqWCCv8cJGUOpz6fbLvUlL?=
 =?iso-8859-1?Q?HHFbHkO7Iwml16x7M4CJpc6x5Q6fwpEHOkHFtVOo6u5gzz5Y4jBv4oRkCk?=
 =?iso-8859-1?Q?ftyI1wQo6gnjgNL1IlqdjReWY4+e4hZ54HFeU87ziPALxk1SST20he2VOY?=
 =?iso-8859-1?Q?2wQS3rTNU3Zvp+YG3CxfG4fBdZGyx6wC7IpCOlknoX5C7Rp2UVSb23yxNH?=
 =?iso-8859-1?Q?o1IwK1Hw24nhKw4EFFWvWvnChD56UkxbjBgdlr811yvfwZjr6C6aaN5Clg?=
 =?iso-8859-1?Q?ABe+5QTP087rfG3LCdabYCJVHv8PaqY6emSXzx2A92CfP0HKrJTuocFS60?=
 =?iso-8859-1?Q?vonPWbLeqfG2OiWUH0tRIeESs0avv3jrRvSO1xZy5sG/qQyhD91ozm6YrP?=
 =?iso-8859-1?Q?pRu7gVjmmRdfRgEMrGZNohilJyrZVoHB/6+C9Eb5s+v4PNy2m2ePJYrcRJ?=
 =?iso-8859-1?Q?pruap/6YvYcCrs2MDekxv0XeWIp8av09T+Ct1v1/x25C3CfHJDGEFxIm98?=
 =?iso-8859-1?Q?0WDm2bqikHdIc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ce3556-48f4-45e9-c724-08db8ce88e2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 08:24:24.8149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hsteosfI/J9jIZTmvmphyRUcq34WNF6BOxOhfrG2ns2Is0eHr1Q+Fb//zrttEH0pVooDQ+/byEV7Dvqk+j8J4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

> -----Original Message-----
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Sent: Tuesday, July 25, 2023 2:45 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: festevam@gmail.com; andi.shyti@kernel.org; Aisheng Dong
> <aisheng.dong@nxp.com>; shawnguo@kernel.org; s.hauer@pengutronix.de;
> kernel@pengutronix.de; Bough Chen <haibo.chen@nxp.com>;
> linux-kernel@vger.kernel.org; Clark Wang <xiaoning.wang@nxp.com>;
> linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org; dl-linux=
-imx
> <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v3] i2c: imx-lpi2c: add error message when i2c
> peripheral clk doesn't work
>=20
> On Tue, Jul 25, 2023 at 10:11:08AM +0800, carlos.song@nxp.com wrote:
> > From: Gao Pan <pandy.gao@nxp.com>
> >
> > Output error log when i2c peripheral clk rate is 0, then directly
> > return -EINVAL.
> >
> > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> > Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > ---
> > Changes for V2:
> > - adjust the Subject from "debug message" to "error message"
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index e93ff3b5373c..12b4f2a89343 100644
>=20
> I wonder which tree you based this on. The object e93ff3b5373c is neither=
 in
> v6.5-rc1 nor next nor in Wolfram's tree. (Probably not critical for this =
patch. But
> if you base your patch on a public tree, you're making things easier for =
the build
> bots. Related to that I recommend git format-patch --base=3D...)
>=20

I make the patch on linux-next master branch at:
commit 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36 (tag: next-20230724, origin=
/master, origin/HEAD)
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Mon Jul 24 14:07:27 2023 +1000

Just now I git fetch and rebase on the linux-next, now I am on master branc=
h at:
commit 1e25dd7772483f477f79986d956028e9f47f990a (tag: next-20230725, origin=
/master, origin/HEAD)
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Tue Jul 25 14:08:59 2023 +1000

    Add linux-next specific files for 20230725

    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
I can still git am the patch.

> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -214,6 +214,11 @@ static int lpi2c_imx_config(struct lpi2c_imx_struc=
t
> *lpi2c_imx)
> >  	lpi2c_imx_set_mode(lpi2c_imx);
> >
> >  	clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> > +	if (!clk_rate) {
> > +		dev_err(&lpi2c_imx->adapter.dev, "clk_per rate is 0\n");
> > +		return -EINVAL;
> > +	}
>=20
> I'm not sure this is a good idea. In my book error messages in functions =
that
> might be called often (and triggered by user space) do more harm than goo=
d as
> they flood the kernel log buffer and so might make it hard to find the or=
iginal
> cause of the problem. I'd say returning an error code should be enough he=
re.
>=20
> Having said that I wonder if you're fixing a real issue? (i.e. did it hap=
pen to you
> that clk_rate was 0? Did this result in a div-by-zero? Or a hardware hang=
? Or a
> too fast (or too slow) bus speed?) Or is this just addressing a warning b=
y some
> static checker?
>=20

Thanks for you suggestion. I will rm the line " dev_err(&lpi2c_imx->adapter=
.dev, "clk_per rate is 0\n");"
And resend the patch.

The per_clk is a critical i2c function clk. If it is 0, it will cause lpi2c=
 can't work. This is a double check for lpi2c clk before configing clk regi=
ster. It can improve the stability of the driver, even though it rarely tri=
ggers.
> Best regards
> Uwe
>=20
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig
> |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
