Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3884C734D60
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 10:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjFSIRe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 04:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjFSIRc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 04:17:32 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667F5FA;
        Mon, 19 Jun 2023 01:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgkXPvRrA+kv4cqmUMOmdz/ww0imtvbj+OQUNZ8CWhm7cu1iFwCF5fFSm2ClMdHgFAiLD7wS7eOIEK/ACiG+5tNObopvpI1IejFAkP+nOreLx/zX/u3iwA+lEGvdly66kyAJryBcJZCorcHqamSLYXrMr2VChBH7KDbOhVGJ73dx2f4A+nMsSoBxditk+afEmf5WrBYwJiaPNZoX1Gk0w+lDkSj7y2EUiqpv+ruwcrRNHWb0PDZiADXqnyvoBe6Bovmmi6qc+WAujgV0RpVJUutOw9ZrRy2w8Jhb4+utLS1jstYQZcFXMlEKeqD4iK8VOfDzO/ON4RQFVsmhyJ1/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDKtBw8h71bhw9LxduPWXaRTGOWlDNqWhYaK4n4pvWE=;
 b=aF2oLtuseV4xuP7DFTml6vlnsmLpOzLnck7gTOzRCT3bztCshmUWdsNmiKvxis71uGwkotFqLk5e1BywB2RgnhOaoajWsgtMdMrd3QAFPCIeBYeD8aN/3zx5qlQr2l5SnKjwy9PR/v0mNx+YEoQCQb5TGeTfG7Pszn2mVlBN+CJJfsVuOqt3U/62GDxmjCAAEEjL0TjdzGc/oQNhyVLiOxi0Cbrl1K9Ou579ihgPU6yqtXN/COI46/zrE/nW+QdB6Gj03sfaBudvJWQ/CEL++X5m+MmG3BKftcUYxlOh00E3JDaN2rbpq/CrT904HNO2ORFzQyGpAvLsFn+IO2dzng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDKtBw8h71bhw9LxduPWXaRTGOWlDNqWhYaK4n4pvWE=;
 b=jBctXn6AlAAhNRqQHUtG2kaaIG+lWr3F7B9srCIRgG/kOiXRPxJVSl+LNUdf3p67AlViArwHkXOVSlMKFEk3UV702radR8+PUbEuG35qmq6US4l5P6uGqBewMSPyAaHPZmuP+AZTWlYUdDlFnMJP0ZDY+SakmhgPJ+LnIT/zmHg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5782.jpnprd01.prod.outlook.com (2603:1096:604:c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 08:17:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 08:17:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        =?iso-8859-1?Q?Marek_Beh=FAn?= <kabel@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAADgjKAAAM7gIAAgX6AgACzT4CAABEtEIAAa5IAgAARedCAAQvgAIABlmqAgAAVHACAAWKtAIAE0w+w
Date:   Mon, 19 Jun 2023 08:17:27 +0000
Message-ID: <OS0PR01MB59229E02F4EF0FDBD5EF5BED865FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
 <OS0PR01MB59225195B4F2C771F302F7EE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com>
 <OS0PR01MB59224D7C95B9B0037046FCF78655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUhaSKiuVkmoYt1sm87emFZu7HSSCK-e95-Yy=g8Sgo4w@mail.gmail.com>
 <CAMuHMdX4QxmFJi3q61ByOFG38KgcGMxPQMeXyPA3r1D9098BMg@mail.gmail.com>
 <20230615092312.GF741@pendragon.ideasonboard.com> <ZIwCBlb5xcLZ70w4@ninjato>
In-Reply-To: <ZIwCBlb5xcLZ70w4@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5782:EE_
x-ms-office365-filtering-correlation-id: 2dfde37e-e11c-4c49-1ca9-08db709d9ea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i2ehO3/3vdx5FLbruHL1ze1/cRzF05GyaB6Z3LkB1S5nrfAuxOhHMtuzbPj3YAr1SYkJBXPKJSKvpZkTwAfQ3NJaK9EzEOI2WBbETAv+epiHLWNLJ0W7DStVkUdV69Qf20Tz9peurUJ/rulzF0iQT+bDk+aG0iXnh9J4HavtH00vB3EW2Ehk7956NfPeSTEvoT2aa0IGJTEQYX9Sim6BhHXBY8614wr5V3Q9RqN5GuxNZKUo6MLVEML4MtLr2SxyeqLHiwjOcDqGxPOL+Vz8C60oTlRiGM0KL95EpyPQ+K6bFf/v3Rg1IlZWqO7ebU12p2+HDrQdjGtoRoJhb+22QqcWsBbPrzEvLRd+36QENzdfgBZRdHWPVPwBn2CijX1HSj+1zH327NAOASaXaq2RtRBDYhe+Vc5qZ0ybOQUa2IBLNBpOV1/ysqQFxI3DGiUKQZhJyWkeDMU5CoBh2/JpHulxjA2qaq4vvAAfpG1kl/Dm2zIkISkD/RGZn6E/5ThLC/IoVuw1z0gQc90BgaL9Fd+eXTsfJbqQ6idZ/jsmxzaEZjOD1Wc0vu+I85c2JYAChOIN++Un668xxok60+dBV9bD92xc2XmjoF6SQgVkV9m67y9dWV/54mKN03gGaVOE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199021)(478600001)(2906002)(4744005)(54906003)(7696005)(55016003)(110136005)(86362001)(33656002)(71200400001)(122000001)(38070700005)(9686003)(26005)(186003)(6506007)(8936002)(8676002)(76116006)(66446008)(66476007)(64756008)(66556008)(66946007)(7416002)(7406005)(5660300002)(38100700002)(52536014)(316002)(4326008)(83380400001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HQBdWGna2YoV8uOOZSmhjToIdVCRzxV39X8t/f9B+qHuKOxQaAlN3mxo+3?=
 =?iso-8859-1?Q?tl3ZOuLoX64Gv2TNeKbVeQDPNb/tqBrOBPJf31F9+H7z8rHLllGm+E1wmL?=
 =?iso-8859-1?Q?bRB6Pcfd/QT3VnOjfM+vQk+w69NmdLpdu6vcyKxr5r2pjyLTG0Wy5vMBze?=
 =?iso-8859-1?Q?6omBfn65k7RbXmTkVzEp7X7X3rsvmXmahQxrxxZfwMFO4kanu2sYsXiBxr?=
 =?iso-8859-1?Q?Gasaa/nreqrzwDukWlVa2YwQOgmhzt9SkQLvVUkaubph4r/esd+9zlnlq2?=
 =?iso-8859-1?Q?E5ByHRzHWzEjcCgyIJ6Xz2kv61h8Wl2W7sKuTiQv6RCobelZpAoHI4IJg9?=
 =?iso-8859-1?Q?6GTsmeDLHNFwXg94seOwYz2RBMEMWa5sKZXkBUteZdLZpWvex7g4cIXzS7?=
 =?iso-8859-1?Q?31ifjbIZI6VIHpGv3FVe5aCGzt6ExuQs268lmJy4arfKx4Dj4niSRPLDa0?=
 =?iso-8859-1?Q?dFUEieZWxFdar2jZXbYdZCzwmB0gbUawrdoC3iWVeF5tx2ojNBl450HzSA?=
 =?iso-8859-1?Q?TiA6OyUvBdZBLJMyy38js+vN/izezqj/gkz9fuBxbv61eI+e+TEz5NKQCO?=
 =?iso-8859-1?Q?bUzVCbQwUX8GDAqZFGFqzgHTDbO8MBQUCe6Jfj3TDEczTqzrot3xE35Fv9?=
 =?iso-8859-1?Q?kCG7cWXxcgzMlP9GNwXgwMndTO0oYeoulxTV/tRARhUPC4uy7DW4Nqpg/k?=
 =?iso-8859-1?Q?LFy0Hxy5ms2IrvujUySQigCY8eype1YTeHvRg24jTNuMJX8At6seh/RudX?=
 =?iso-8859-1?Q?TVAZDri5KRPPUT9yJk0jR436krKr7tLJEEHbJ+si9fINQY2X2NHer5Kx9f?=
 =?iso-8859-1?Q?0nrB84VLjAj8Q5NphVahz13vvJr+5YvBxjKamFRgLowCAtinfmfa4OEMXU?=
 =?iso-8859-1?Q?wxs3KIbbqe8qebC5Rf2v1vPGMh04f+jh9bLG8mqT3t3uVVlD3fZku3e+VB?=
 =?iso-8859-1?Q?WXPobJTBWk/ESuHHaN3hD0GHac/ab/Ax1MszwNYZL0keo7Yy4BwHzAHbh1?=
 =?iso-8859-1?Q?0YWfXXz/g+nwi1A3rJ6ub3TLFASUSjm6DnmcHiPRTCG02W8KE9n5kvchti?=
 =?iso-8859-1?Q?MyTZT5+pJ33lFCT49CuhPMyoI5PX4SHmkSPEeK9dPhga6aQtLD3fU4y8wB?=
 =?iso-8859-1?Q?S1PvbBJkRf8sIIloltuuUz7nJDUndDileyoaxMsOrFhcXuLNjtB3PY3KFV?=
 =?iso-8859-1?Q?YC9ApXvEkcem+/7J1+D/EhYQq7+OiHk++xNkXUhrnk0plHWeZY1pb8OThN?=
 =?iso-8859-1?Q?WaXTlFdHFdFP2kDS6vWLWdi4RgJ460WR5/DezfGF3IdYbXrQFS2bVSWdir?=
 =?iso-8859-1?Q?95q88kKedVbiS9cwTCyxQbWHX1UrQFyYPLKfNLfFqYwNogyyKjH9zcwOZz?=
 =?iso-8859-1?Q?h0d3oerW9jgAeVLzqDXsU+nwDZJrVQgsi/WuXrBh5bYZ11Kaj0H5sGhTdZ?=
 =?iso-8859-1?Q?1+Q30Ywj6ikIfu1kcFr9REJsUc2DZ4U3bcbhmFuCC1QXgBPf3Jo31xw+0G?=
 =?iso-8859-1?Q?sq/5meMgSi2wy14W4nHfFOC/EeU87Nqmz8dFHFWqxizWMQuhg5V3Zmjk9U?=
 =?iso-8859-1?Q?ANMYaZ7NdxKrl0/M9u4rIlPE0gvoVJapb1wT6LoawiwpStdhfJvYHkbw2o?=
 =?iso-8859-1?Q?oxEc58OUz+tfvgjxiU7EgHQeO1ncF17BiX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfde37e-e11c-4c49-1ca9-08db709d9ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 08:17:27.6032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X8ASFc8rwvTnY+YQDUjRP+AXhBcUz4NLp4ILaf1ZPE1fhD023E3qCUa4//uBRayoUS5u0GGbowHJ1aV5hCFYVHhiVmFg1bn5NXo+Jjtj98c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5782
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

> Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
>=20
>=20
> > > Without of_node, devm_clk_get() and friends falls back to registered
> > > clkdevs. So you could call clk_register_clkdev() from within the
> > > PMIC driver, and can keep on using devm_clk_get_optional() in the
> > > ISL1208 driver.
> >
> > Seriously, how many hacks are we piling ? :-)
>=20
> For this particular case, why do you consider this a hack? I previously
> suggested the solution that the PMIC driver exposes a clock to be consume=
d
> for the RTC driver even for the "two DT node solution". Because it then
> avoids a custom property with a phandle to the other node with regular DT
> clock bindings. I'd think we need sth like that in any case.

OK, Will use clk_register_clkdev() in PMIC driver, so that there is no code
change needed in RTC driver for clk handling.

Cheers,
Biju

