Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E92B75F30B
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 12:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbjGXKZW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 06:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbjGXKZH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 06:25:07 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2073.outbound.protection.outlook.com [40.107.13.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631E955A6;
        Mon, 24 Jul 2023 03:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n20Gn97eILoSkcbOWWV9rTzAvvIvUCgOtxIDhWnaSyNLR3r73xHM3X8SJJpjyN0n5mD5nXIOEihhrwHYnKDkGJQvQnGcfP181EeZdvIUb9EIjyeQR1dvrV9SJify1aglVjUNGvmbt2UUHEj2RvpUeS8PrxzXygLA+RkMpNh6qm9QlV5EySQdTqOrZmWtqJJH65Y8S9ZGMMDlSeREpNuO6BUcUHvridjOC0+3vxxGvupv6lT+7bUneDIaueCF2eErRKEwDBMlw7bdmbAosV/6z1Q5gLgZdarBvFCAAE4s5NbWSh3LlVC2OH1cDoc93hDUdz1OqeuphoogWpjIVIHutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSEHluESptW40Sh0zq8kibsH8845Eblb2O8n41x5AGk=;
 b=YX25XOJy8mhhgiqQ8t8VhLd3RaaypPVYf0m9r92QCxQO50WKk2HUzeccDxBys3lUGFcVDDvCeaj+DmpJCcJAvan8WdFa1Qxkmre+aqhKe9lbOLI88ne8zopTXy8+0nBm3uAJ4Hwm9me9Qkasz08csClw2MPCfzUOu7bwHgqFL3K0h6tIHcNrjQbFSmITSnU2IctbpVWKm/KI6tpqc2sVZcdVi+M4kB6CEfmjhRqh3oVIsdUw+Txo2+IRnyzZ/U+vOJ5agWMWCEWObIsITaYjdrOBb7+NGNPtrZIGyks7dA30bJPNvbtXD0i6BkKlkulx1KUtA1oDdfTuDwgkkFGV5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSEHluESptW40Sh0zq8kibsH8845Eblb2O8n41x5AGk=;
 b=PwNbmJKQrsCa8KS2MjIvKVk6IKjlkh9iUFUbz2wE/cLgRW4sBwVT4/SPpZ/RVMxo9fOLvjRkrEM0HfOaEF/9ELd+63dGNRDM1AJmsBW7M5ejfY+naTbvljTWx7/zTkv4aOwOiGGtro0IPgemhaQ5QM3d0/Oaej82G60mHpVAMEo=
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by DU2PR04MB8776.eurprd04.prod.outlook.com (2603:10a6:10:2e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 10:19:48 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620%4]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 10:19:48 +0000
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
Subject: RE: [EXT] Re: [PATCH] i2c: imx-lpi2c: add debug message when i2c
 peripheral clk doesn't work
Thread-Topic: [EXT] Re: [PATCH] i2c: imx-lpi2c: add debug message when i2c
 peripheral clk doesn't work
Thread-Index: AQHZkf4EMwNjG9kys0GQYjQZG+GhNq+JfK0AgD+PLXA=
Date:   Mon, 24 Jul 2023 10:19:48 +0000
Message-ID: <VI1PR04MB5005DC14A78D364FABEF6E3EE802A@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20230529072316.3605989-1-carlos.song@nxp.com>
 <20230613233944.673syh3cjykvygfl@intel.intel>
In-Reply-To: <20230613233944.673syh3cjykvygfl@intel.intel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5005:EE_|DU2PR04MB8776:EE_
x-ms-office365-filtering-correlation-id: 9ea14470-f843-4986-0c9a-08db8c2f8292
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fd1jejJFG78QQrKFXlJUFCcWSQG/x8fdeYlPFglWXqzvgBcmd8osIyVVCJFo2pJnNHruEh05AhvGMoT0UvfuE/B3rMSArw7+UbU1sWDEgZFvf0rm5EV6s8vV2JhmAv5rtGXVWka5yusQg33vfTEkRp7dq7HXBp7y1U1mZ3TzepgQy3+WKVpBGQPNSClSR0TOsH9npmdyfs8P/5zKC+gg73/+cLvqfaOZec7LV4zBoNR4WxTchLwxL/ACM132Qv8eOpegyWOlh2lQzw5Vt5kVF8C50kKyfBIknFoHR9H/UmRaQFVR7i2ftwXZyauyiMh1EOUHCTuzTF9Txb39Y4NlxDnKvOKYbWHDaX0EFYIP99pBiI2AMe7ehVRumraVitP/n67qbql5x9HyxxLGkJQpl1XZfVidUMzRcm8rzgBeIPRDcKIFuKMO/fzH7R+sa6SEORR5lmaMFHwZJCPnnJfnWIx0CKVdLgmXAgSDMEdsCAa5uGAHA33Wt8cgNJBk+QcehLJaklS5mjGqSaScmcBhMXDMXHvhH6qy6rg22P4Z/di6XicHO/0CCe3waO5Ca2Fg41YovUC734sXdmCzzpaZDj3sclTfA2Z0kav+gNqO1ZTLJOR4wiUXVOc6fBFQAhsF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(71200400001)(9686003)(7696005)(54906003)(478600001)(53546011)(6506007)(26005)(44832011)(15650500001)(2906002)(41300700001)(316002)(6916009)(66946007)(66476007)(64756008)(76116006)(4326008)(66446008)(8676002)(8936002)(52536014)(5660300002)(66556008)(122000001)(38100700002)(38070700005)(86362001)(83380400001)(33656002)(55016003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qlNV8dKQj7XcXISKtpC915UERhmvpt9F6VHg0RI2EfnbedPDh2/kt+VviWRz?=
 =?us-ascii?Q?W1F3dSJkMNcWCNN5U67mvn54gBAyVUyIZPiSONqlXglryUp1JYF8sKSWlvmK?=
 =?us-ascii?Q?GN7igZX0qHwmBp0Gqy69nasRAFjjWHo/GBNSdWoTllx85Ez1J3JVJb3fC7L7?=
 =?us-ascii?Q?8JnCah1pvmnunpTfBC51SMC3cLb/KmjT+I4cjRBF4LAGNjAZ+eeJOIRl2Hyf?=
 =?us-ascii?Q?tL+ksYCwx1C3KDAQ2+9LZGTA/qq4PNwkTikBaENihkX61JaSCL9Q/3oU8LWd?=
 =?us-ascii?Q?5lunPOTV0MoG2UTI094s/VoHfW55YHG9lb4ZnkLpScXfE075yTd5YcmVJFXG?=
 =?us-ascii?Q?c2BFPLkt1JPa01kA22MxgxhWMPAkpuNpWQ0I0LYy4WPf0tTopN7foXov/At0?=
 =?us-ascii?Q?SeA9CP2Vv/Ba1NUw0Eb+XF7J/JEPwDTXauUV4lVwCBevCu3FCkjMx8+FWHd3?=
 =?us-ascii?Q?V1kEoHKOPgmguDajitvU4oMrvmjT6K8AgM9gdHT4ZZV9NdJ7eh1tcBxIJ1sf?=
 =?us-ascii?Q?KoaWXd0deeEq2v5Duzyc6CRB5ptQMp8fkFuQfQp9pNIXMukNvTqqeQxNY0qd?=
 =?us-ascii?Q?xb63O4+ZnNBzwYncm46cSnOSfSYToBSc0J38c8SeJDgVHjd7NBVDwlyRyI3k?=
 =?us-ascii?Q?y8tsCZcf2o13MFn8IBLrQpPDRAvhpJw/JIRmctKFGvIi7hTDidcGI6FwQ3K6?=
 =?us-ascii?Q?x+SIHe3PMpnphoFl+J24g77VW6/BLkYqiRedVjhSbp+YmlDm6UMkTZbatB/J?=
 =?us-ascii?Q?2D8cuycb9KXBOel4Gy5f5dVUR/J09qZbHgQVXIMJc56R5YD4WjSu0cJivXHu?=
 =?us-ascii?Q?1yaE8xSQkWMOVszC637Z/Y31fuswQ1yQVABPD3Mt9tziGS1jxKBkpmtJWsaH?=
 =?us-ascii?Q?pPZMVgP2c+pfcIeQI4oaBHjOZ1Hw9i718XxaHeUzirsuubBvRSHGoi7XM8/d?=
 =?us-ascii?Q?bds6TnUBs8BvbzytlgKIsGnRvPPIg50Hrb4nUNUo9mOwUJyEw2//GpsYnFGa?=
 =?us-ascii?Q?yp9p+xpIq73c2dNl82Vds8T9293JTRaP95Z9cwyBZ0y6fCHuRI9dynLGMSx1?=
 =?us-ascii?Q?PGfUc33j/JporQEoQIMn5IDgdjDLR/W+/+732ATRTtVZnuhS4HCnfhZrEsH7?=
 =?us-ascii?Q?97F9w+Vxf5WzXO+8a4bDN/pHhT2id/93UfKqweBqOeKhRVBTK9etTFik3BWL?=
 =?us-ascii?Q?Xx0VLexHPairALMcN6KvQiB/PySlhTfJgUKw09CgUZnGuy/Unb9unglkK0fA?=
 =?us-ascii?Q?QS2/fSfTYDHX+6zpU/S7WbqxugazehFhTTwKQSClEbqzO3Co/sStlD5UZLsr?=
 =?us-ascii?Q?4lb8N4lEVlsNHd+bZJ+vNZ3e6DR9AW54c5qqcGn0WmPgM4jx8//JfT0UEODQ?=
 =?us-ascii?Q?axOVIKkFuE5WLy/eLuHfNGiR3JOOuauFIpzWP/wtwFI37aU4duBcAAN2YtkN?=
 =?us-ascii?Q?D+LVNPk1nVdFKQSDr1vsPbXHMpduxfFqbtpVad0oaDDF5YnygbV9fwjR82ID?=
 =?us-ascii?Q?Vv34fd8Ijg+fbUNedYJastDL6wb7cW0/n//6ihSkQEIG2P11EPiAawzMQcxq?=
 =?us-ascii?Q?rp0Tv7xyxdNPLzGeUNxL6i/RkLtguoD4E5d38x4x?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea14470-f843-4986-0c9a-08db8c2f8292
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 10:19:48.4703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aYS0PnycUzrn07FWNFKatpsxR1bGGCdz7Whi8y9HRYvN7yDNiKGCOpb2NYlxN6/bX6xyONNxAPlxUX2JGY724A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8776
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Andi

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Wednesday, June 14, 2023 7:40 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com; Clark
> Wang <xiaoning.wang@nxp.com>; Bough Chen <haibo.chen@nxp.com>;
> dl-linux-imx <linux-imx@nxp.com>; linux-i2c@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH] i2c: imx-lpi2c: add debug message when i2c
> peripheral clk doesn't work
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
> On Mon, May 29, 2023 at 03:23:16PM +0800, carlos.song@nxp.com wrote:
> > From: Gao Pan <pandy.gao@nxp.com>
> >
> > Add debug message when i2c peripheral clk rate is 0, then directly
> > return -EINVAL.
> >
> > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> > Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 11240bf8e8e2..62111fe9f207 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -209,6 +209,11 @@ static int lpi2c_imx_config(struct lpi2c_imx_struc=
t
> *lpi2c_imx)
> >       lpi2c_imx_set_mode(lpi2c_imx);
> >
> >       clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> > +     if (!clk_rate) {
> > +             dev_dbg(&lpi2c_imx->adapter.dev, "clk_per rate is 0\n");
> > +             return -EINVAL;
> > +     }
>=20
> should this rather be a dev_err?
>=20
Carlos: Yes, I will fix it.
> And, BTW, did you actually hit this?
>=20
Carlos: No, not frequently. But I think it will be safer maybe.
> Andi
>=20
> > +
> >       if (lpi2c_imx->mode =3D=3D HS || lpi2c_imx->mode =3D=3D ULTRA_FAS=
T)
> >               filt =3D 0;
> >       else
> > --
> > 2.34.1
> >
