Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1781675F2D0
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 12:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjGXKTs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 06:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbjGXKTM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 06:19:12 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2056.outbound.protection.outlook.com [40.107.6.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DC91716;
        Mon, 24 Jul 2023 03:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqE5vNyWRV+zOlobrjXnych0TQ+UsIYYnn3023ln48mTi76/gb9PTwLvf41Zy+XqWxHk2Y57vMyG0buR+Bojs1UOH3KtlrPWl33XZtzcRWZ8f8jZEnWTDAUpCJ7Mn6DdYpJey9oRIXka0F7ig5etoSv0TuidJZvZsldwOMMpXbDZdA/A6nHrUlGYZhbVxbmCXj7K+OUADnYlK0ct0NtHUYX7+T7JkKfgHhpoYOafR03IeCYAwbyEFAuIp6x/qqI84AnECe9yRu5QDtzH5kiJ78PhbbYyJ90sDg57/bgmD+gXuW7K5ScAyhfoUpNvyr7trpsMwAjjXk8c2r3oYWxeDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MgVrYc4+pJOokviVI+8cPDsDxmqlB5mHprn2qGawP4=;
 b=RuGkULnxLZn95nQ/EF2/6ns9Mia2q89UxocmkqEX3Tb6Tg4v+Hzdfq8yyZ4K0lzDUSlj9Iu9R5vOi+hWFosmUXb9ni4vtIDQEnpY8UzA3rXGJbVF/yUQZ2FUy4/t5JEg4oXj0Tvt14LBMjk5W5Hpda7HKCL1blRPZ/t5L+TaIu7x6NlcfjZ1hboq+59eRooPSqDJEbi+Km6iBxVTXjf76+lbCgjapFGgnz3HCs1CK8iz91Wq4Nsql1fYYH0dnzDrJp1Q35vwS3bnWfAHlLuN2qY+tmf7sOaZ+Pwx9283dENm8lkztW54MhiSeZE/0kK+U6HvgZQhaeYl9W252t9YWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MgVrYc4+pJOokviVI+8cPDsDxmqlB5mHprn2qGawP4=;
 b=i4C9697zfvrlwfhcP4H7fk029CNAk9K90EHZ6J3ycfOs+fsi5e0nz6zZoR7QpYX+6sw+LrHCa8TL8+aqMo9fi4gnknw5WZzmp1qP3NQcTsh4hn6ZJ5dmLAsuJ0xkeWU5NA1rUvZPPb/WntV59mCJ5OIQWIJqA9uPHnGgjm3WZaU=
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by DBAPR04MB7448.eurprd04.prod.outlook.com (2603:10a6:10:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 10:11:47 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620%4]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 10:11:46 +0000
From:   Carlos Song <carlos.song@nxp.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Anson.Huang@nxp.com" <Anson.Huang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Bough Chen <haibo.chen@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 1/2] i2c: imx-lpi2c: add bus recovery feature
Thread-Topic: [EXT] Re: [PATCH 1/2] i2c: imx-lpi2c: add bus recovery feature
Thread-Index: AQHZkgDH5/Zn1FPUhESYir+xnLlZhq+JdxYAgD+M+2A=
Date:   Mon, 24 Jul 2023 10:11:46 +0000
Message-ID: <VI1PR04MB500517614935B4E769A27F3EE802A@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20230529074302.3612294-1-carlos.song@nxp.com>
 <20230613231948.bsxuou4nnwbg2ui5@intel.intel>
In-Reply-To: <20230613231948.bsxuou4nnwbg2ui5@intel.intel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5005:EE_|DBAPR04MB7448:EE_
x-ms-office365-filtering-correlation-id: bb4974f2-cd20-47f9-f1e4-08db8c2e632c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pz4QwIkd0zNBnpROopKEDJI/mxzGBy5okWosjv8AqDrJqzy/sM1fhXxTlQuC1srzSGoLzyX8B7ds/ZJfgBz6eTaBvvnLxmH6xnQYP923Mh3oZrexJcVwYsjiZY87A0XfKnvSk0vIsNz3+Alhtnx0mVX0Vq5VljbV9HIzL0ZAq+n1vTF6lKhn0q2g02QUrILKBeDGP21ZTug6h7jp4KMuRTghiArkCwortl3fQvzmEe2x/h0UcDomBq7Lc3vwPNr6blnZZiWLyOvtKHcpsnByMr7BoBwE+sTdTOiGbAlf4M9gAGGI/SBWpPq4CdTpH+n2hoCBcAKp8FYAl7Ig0SpyJCWEUe48EHohsQvKHf2UVfCjBD0f2A0p6OZLH8ynw/VXGpWThJiIA4cHesnf3Z9Ltvyzs1G7Hh6bp2EmMtBYUEM2bsiqzMGPn2vdf9akmLMPWyZQf7zqerRfK5JAg/A3E5Qml3aaMd9pYI+VZEgsNb7AnvXkClIo+OQnNWix+2nbpp/Glfo5wge03P+T1VsaDbtnf/v1DsnSDG6O2GaIZvzB/Fc0+IrLuTT3xHVX4Jm9cEtOUF+vrw076fAJhcsh/OEvwxv/Mp5TaOZ1birYx1Un6/KnKKnEceMjSiWTMnPo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(2906002)(64756008)(66946007)(76116006)(66446008)(66476007)(66556008)(4326008)(6916009)(7696005)(33656002)(71200400001)(478600001)(86362001)(9686003)(54906003)(83380400001)(186003)(122000001)(38070700005)(53546011)(6506007)(38100700002)(26005)(55016003)(41300700001)(7416002)(8936002)(8676002)(52536014)(5660300002)(316002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3kSimHvQH4mAyeaAoLLjge9A7fTWGkTCsCD+KXteFcN4sZzUSkbYbGIZpkZq?=
 =?us-ascii?Q?olwsBEjNkhb8EJslUYCoaVj3IU+PJ07v48TBKf7PT4O0EJhMD+dJRDu8hyf6?=
 =?us-ascii?Q?ZF7+TYx5l9RJy0DSThNAlOmt6rYvcwTet2NU/xKbSJ3T8Gn6l/PhtvGUSlwj?=
 =?us-ascii?Q?MRV9I8c8dupPp5m8u/D20R+xAwErbm6fV4lbxfURG3mSa3Mt1sR3xkvAN51C?=
 =?us-ascii?Q?sLGyt33Am1r3GZmn0sUAQ2gPmzeawpuu8XyqQeOxisY9iPZttBzCD6UvlOLG?=
 =?us-ascii?Q?6aRgmWzzxwaE/Vo/VRshkjwBsVhIMpvswqk2roHBotZ57x18gcvOvAxquVYQ?=
 =?us-ascii?Q?l13EJ+RJu4ZSw9Q68h2KaqxI+uQXO1KdrQYATqRkPw//+a+bXitJwsoqyuuS?=
 =?us-ascii?Q?ublsXsznGrmzDXjFuh7Yf+GuNikfSrRUfzgqmwMvWK8pxZFrhfKvHZYAd52n?=
 =?us-ascii?Q?rBpVGSqnWeeBhYSdZO+2eFsSnHURQx51AVUSmh7xIJ5aaDFFXlPnzzN8Cz/U?=
 =?us-ascii?Q?j2GN71rBgppETQFpGZA+LwlO2EgRQU5nCexZJeCCcw644i8ZO0RvSpLpY9o2?=
 =?us-ascii?Q?bPkhLje09UsS6shZmQcT3R3crvP9ORozSZvBjrUVICzMKNVyEutE2fyB+M9s?=
 =?us-ascii?Q?vKUOL0SqcfyVYaXH/Q6vb/pMPrYXjPrWneCrswoQ66lH5oAmA+7IBVfFq67v?=
 =?us-ascii?Q?jT4+f7pP4VV6MDqpbBCx3CH67AIu8UpJ0wC3FA6CldJVrM5bmY8ZcRZ6Un+J?=
 =?us-ascii?Q?76rKus13GoF7pwbdfrme0jT/UAKU2Xcas3aOQHphiIS5cp4Y0SL5E8UWLMhH?=
 =?us-ascii?Q?ULLjur2GhhO+ElTIx04vBbFeXeLkNXwjtCVKpVO+j8wXZC4NmHG9i5O50xR1?=
 =?us-ascii?Q?r/bbKkeyhNLXkYJ4X1siaiLR9C4lWu26k8p3d4PASljXlnvgY1RsS/HLLhxe?=
 =?us-ascii?Q?m+ddnCUrNjU0CH5arXJneNL8V2apZ+fND1g73McFegUACwrP5PvyZ26VnSCZ?=
 =?us-ascii?Q?3nveKa2z9eLzEY7talitIdi2OQrm+DY+3/SwRCv45TFmZ2uHUHj03dbMB9Gq?=
 =?us-ascii?Q?tBgjcdrwMM8rI6UcBL/2is/11n7oGHttZswQ2Vmf4Pzh/LDkhtQn5i5+5nse?=
 =?us-ascii?Q?kZ5CLkPDPgBCxNsOt0PtgQobDu5QDRBLPpQxdss5Rsvl2ERYV8v28k643TFe?=
 =?us-ascii?Q?8C4ZW7BdgbXL9VgulZonYCgeWPvMHei6NuVCZrU4TArTm+QZJiEqOoa6ej5g?=
 =?us-ascii?Q?9kY7rItAP1AX8NJbZRkk6PrM3mNMzVjgK0+Yfwq63P4ztDQHQg6oVLA2kVch?=
 =?us-ascii?Q?K8jQVSdb78Zb6cx8+t1V1LUJYjo19+S+KgEppoQmU8lRrciAb8ndBNVXMbbo?=
 =?us-ascii?Q?OK5AxrxWxmTwm1f4MLwYeMydlbhlG+qT2ScT4wf2aDw7LMNK4d51metJLeKW?=
 =?us-ascii?Q?9EuENfwA7dhsIWnQ/onlfXV/Lxp6BheIYdqhx8eNvE6MJVqHSDkCmLnlrjx0?=
 =?us-ascii?Q?LaJF/c4cVcxHb9g4eNELkKLDWDoodElbPXbcSuqr3OznlxZL+gzjaT1r4OZp?=
 =?us-ascii?Q?Dlz5zaYker7DmgUoA+zutdYIBFtz/NPoDX8NcWuf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4974f2-cd20-47f9-f1e4-08db8c2e632c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 10:11:46.2719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TsrNCBPtKRZWCI1Y/aR3Ks83jjaW59DavzQR29QHxd9IEJtmr5XiZcij7rNzvS3LtfCgcjJoKPui9V1nvonMnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7448
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

Sorry for the long time to reply. According to your advice, I found the pat=
ch is too redundant!
so I will send V2 patch.=20
I find gpio and pinctrl assignement from the default i2c_init_recovery() ha=
ve been defined very well.
Lpi2c have special initialization conditions for i2c recovery and I have ad=
ded a comment in V2.

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Wednesday, June 14, 2023 7:20 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.or=
g;
> Anson.Huang@nxp.com; Clark Wang <xiaoning.wang@nxp.com>; Bough Chen
> <haibo.chen@nxp.com>; dl-linux-imx <linux-imx@nxp.com>;
> linux-i2c@vger.kernel.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH 1/2] i2c: imx-lpi2c: add bus recovery feature
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
> On Mon, May 29, 2023 at 03:43:01PM +0800, carlos.song@nxp.com wrote:
> > From: Clark Wang <xiaoning.wang@nxp.com>
> >
> > Add bus recovery feature for LPI2C.
> > Need add gpio pinctrl, scl-gpios and sda-gpios configuration in dts.
>=20
> please update the commit message according to the dts changes, as well.
>=20
Carlos: There is still a need to add gpio pinctrl to set i2c sda/scl pin to=
 gpio
> [...]
>=20
> > +static void lpi2c_imx_prepare_recovery(struct i2c_adapter *adap) {
> > +     struct lpi2c_imx_struct *lpi2c_imx;
> > +
> > +     lpi2c_imx =3D container_of(adap, struct lpi2c_imx_struct,
> > + adapter);
> > +
> > +     pinctrl_select_state(lpi2c_imx->pinctrl,
> > +lpi2c_imx->pinctrl_pins_gpio); }
> > +
> > +static void lpi2c_imx_unprepare_recovery(struct i2c_adapter *adap) {
> > +     struct lpi2c_imx_struct *lpi2c_imx;
> > +
> > +     lpi2c_imx =3D container_of(adap, struct lpi2c_imx_struct,
> > + adapter);
> > +
> > +     pinctrl_select_state(lpi2c_imx->pinctrl,
> > +lpi2c_imx->pinctrl_pins_default); }
> > +
> > +/*
> > + * We switch SCL and SDA to their GPIO function and do some
> > +bitbanging
> > + * for bus recovery. These alternative pinmux settings can be
> > + * described in the device tree by a separate pinctrl state "gpio".
> > +If
>=20
> is this still true?
>=20

Carlos: Yes it is true.

> > + * this is missing this is not a big problem, the only implication is
> > + * that we can't do bus recovery.
> > + */
> > +static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c=
_imx,
> > +             struct platform_device *pdev) {
> > +     struct i2c_bus_recovery_info *rinfo =3D &lpi2c_imx->rinfo;
> > +
> > +     lpi2c_imx->pinctrl =3D devm_pinctrl_get(&pdev->dev);
> > +     if (!lpi2c_imx->pinctrl || IS_ERR(lpi2c_imx->pinctrl)) {
> > +             dev_info(&pdev->dev, "can't get pinctrl, bus recovery not
> supported\n");
> > +             return PTR_ERR(lpi2c_imx->pinctrl);
> > +     }
> > +
> > +     lpi2c_imx->pinctrl_pins_default =3D
> pinctrl_lookup_state(lpi2c_imx->pinctrl,
> > +                     PINCTRL_STATE_DEFAULT);
> > +     lpi2c_imx->pinctrl_pins_gpio =3D pinctrl_lookup_state(lpi2c_imx->=
pinctrl,
> > +                     "gpio");
> > +     rinfo->sda_gpiod =3D devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
> > +     rinfo->scl_gpiod =3D devm_gpiod_get(&pdev->dev, "scl",
> > + GPIOD_OUT_HIGH_OPEN_DRAIN);
> > +
> > +     if (PTR_ERR(rinfo->sda_gpiod) =3D=3D -EPROBE_DEFER ||
> > +         PTR_ERR(rinfo->scl_gpiod) =3D=3D -EPROBE_DEFER) {
> > +             return -EPROBE_DEFER;
> > +     } else if (IS_ERR(rinfo->sda_gpiod) ||
> > +                IS_ERR(rinfo->scl_gpiod) ||
> > +                IS_ERR(lpi2c_imx->pinctrl_pins_default) ||
> > +                IS_ERR(lpi2c_imx->pinctrl_pins_gpio)) {
> > +             dev_dbg(&pdev->dev, "recovery information incomplete\n");
> > +             return 0;
> > +     }
>=20
> Why not use these assignement from the default i2c_init_recovery()? Is th=
ere
> anything you are doing I am not seeing?
>=20

Carlos: these assignements are too redundant and I will fix it in V2 patch.

> > +
> > +     dev_info(&pdev->dev, "using scl%s for recovery\n",
> > +              rinfo->sda_gpiod ? ",sda" : "");
>=20
> is there any case when sda_gpiod is NULL?
>=20
Carlos: I will delete it in V2.
> > +
> > +     rinfo->prepare_recovery =3D lpi2c_imx_prepare_recovery;
> > +     rinfo->unprepare_recovery =3D lpi2c_imx_unprepare_recovery;
> > +     rinfo->recover_bus =3D i2c_generic_scl_recovery;
> > +     lpi2c_imx->adapter.bus_recovery_info =3D rinfo;
>=20
> do you need also the set_scl() function? It should be mandatory.
>=20
Carlos: I will use the default setting in V2 patch.
> > +
> > +     return 0;
> > +}
>=20
> Besides, this is a copy/paste from i2c-imx.c, any chance to put the two t=
hings
> together?
>=20
Carlos: I hope to apply the new recovery patch for lpi2c.
> Andi
