Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F9272DAB4
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jun 2023 09:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235167AbjFMHYm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 03:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbjFMHYl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 03:24:41 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3CAAA;
        Tue, 13 Jun 2023 00:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6i2MAOOe5dCDEnmr5aY+9Lzhn5itAmVc9xoHtbSA9r1iWuvCYbpCjHuJT5ISG85Vgw4DUKzov+uzCLkW8ZJC80zRQhIO3CYBHn1ofJEi54S6Y6e0ktZMH/f2vejLIeJ3uJkR5tdvAs8TKWnhBiXXd5CiaA/DaQTuya82RNknLMK4F+ZvK4/j1bVt+xLkH1yZh/CDNpwKbyRPnpYUnCxQVLhd3eWe9dVDRt50gweHM2j65WKvTUpVvOLHeAC7qFuWgefBcgvvoVaQ9M3AbxH/hVutv+tnkLOmsNLWSnlGpr7WdtObHNcCDAYkI7O9ycjnVTTCR3dtXAFzZsTZHRp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZpH2S62QA3P3jjK+FH+Rrj48pf3R+q2D0af6mmgi5M=;
 b=K8mX6jxwckoM6THaICaF7MxJPFu/cEvWyG/hplhvk6D3p5q5KuoERVonqZXjO9DiM7rChfalTwYIkEuZamh4PY4uRaGo95B835O6DLrMzfO6SCo8Nl000N+Pi+w6tv2LnEydja+3NPLDivL+3TzyB6ikTXrQQ6CimEyXImLGu3Ep+Kyf9YOok/4vljDzlumQDwoU3Ai0TwaE3Dix3aymepkOnVisQiYv+wf1Sn6N369j3b8vf2R9kGYEIvgf07irOKNxIDTJr2G/PTqd9P0nWw6C180fBHso8OOq4JQS47bjUEkBeRB9O/Gl6lb8Jjo7Ls+6RVO56fAV1fuzdjCVcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZpH2S62QA3P3jjK+FH+Rrj48pf3R+q2D0af6mmgi5M=;
 b=D5sryvhdJs1y1Cr8zCMKqooKNxv8KOlZP0+8Xs90vzh/KtvMdo2zVBU9PVlkKRx0Gl31y8Q9BpxAPiM0HUUjL1GTT3T+HwZ3czlgpmXP55kVPz3A3/PlS1VKqE12g6duC8bDRVazYUzEq1mMeGkE1dQZvlinXlTZvkJYrOLdWQY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8143.jpnprd01.prod.outlook.com (2603:1096:400:104::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Tue, 13 Jun
 2023 07:24:36 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 07:24:36 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAADgjKAAAM7gIAAgX6AgACwEcA=
Date:   Tue, 13 Jun 2023 07:24:36 +0000
Message-ID: <OS0PR01MB592220CCA081848A711D75328655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
In-Reply-To: <ZIeDcVcfxfcMx/BP@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8143:EE_
x-ms-office365-filtering-correlation-id: 891b5748-fb96-4908-59f2-08db6bdf3dcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZLNXplwkBpI5LQ+67+V0dJEAv615kYOVYKiC4YV/ZPWATJErV9z4w+/cgbf7rbHbxz32Y7ZD4bT/WrqXvXYmf3MRpc2od0n7l6rfIhcGF26MwjwRzzZdHfXWZTkz0ADjC0VasIH6WRkSvbocofZCYJf7WGDavQLBno/4ywG6xjqR62Qa4Xr1QIkzVGABTRxf5PqYcMG0cX31q5rNYJhQf9ttmFCvCgUHXPo2uqDUuSa4SxrDld4TtUPHjcuMhZbQzT0hoLRMVRh12iMfoKo/hItxub7VLCFP0kLQNXeTV1VSBHkE5n2zOG0PjgWNV3mtaw9ZLnHAk5nG3A9m1M8/X5K1T/cv8PbKXlmUScQmJatUuML/Xj1MZLeUdzJjgVX0i/b4HOSbYfI7Wt2cqeLWGwmzIT/727112daHsqBaRz01IozQQbj3ET2etmATqi1ob1I1rS6ZLrVtcqVzR+VmwVAg9XK4gQGZ/0WEwFoFeqSE3B+4LF0dLR7GLwLO8y9t/YiwVSjZ4U3MFoLQA/9vWgkoQ/XKwiEwYfjZdJhTaCq/zPWaK6Rz9NNMjuxi32KOjWROm8T9OUPYvluThiX12K5FyJv4AK5rhLUFRFVKJPwWULp1ZwTIdHJAJlJmwuV2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(5660300002)(66556008)(7696005)(55016003)(86362001)(110136005)(66446008)(66476007)(122000001)(76116006)(66946007)(2906002)(52536014)(7416002)(54906003)(4326008)(64756008)(7406005)(71200400001)(38070700005)(38100700002)(8676002)(316002)(8936002)(41300700001)(33656002)(478600001)(186003)(6506007)(9686003)(83380400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bMIWq/VUONK9i7Im5Qo7Ckouca3cpPbLR3K2g4TwjgtLOgXK9UoXwztZIk?=
 =?iso-8859-1?Q?s0m2QkAgc2cAJAA9u99WwkWQguPd3feA5KkkAgJceFV5OSn+uoMTGwFLeo?=
 =?iso-8859-1?Q?4hCLNC2QYOTADmuOwtRKzfsiWsV+XBCmcneVVEzsU7SHNMGbj8+eiwFnvI?=
 =?iso-8859-1?Q?OOl7Ugq1Ndeyecqh8leUMvfXK/ySxqj6gGPS8GlCV9FToLOMFIIQV24EGs?=
 =?iso-8859-1?Q?2omvTBvLonwwhx/6PPk9X5ew08ppIUfSCZpS4jIHksUm7uiB986dfKMoJs?=
 =?iso-8859-1?Q?rsHf3lRg2GR7+k+swvZheeqKc1RI9xppSek9w/jOzl/NNe77upQriuLDN/?=
 =?iso-8859-1?Q?xAtbLX9/veqWEc75teZr6iFjVatK8vrb+6Fk2chXLRxjXe6EGU+DMP9d01?=
 =?iso-8859-1?Q?KdkzijcMqrvqyrHzcOAL8K1tUVD2f41EX/k836zxInJWIly32gGVc1J21B?=
 =?iso-8859-1?Q?JAKOXJpkozM7VIBC8vX2CYPAjb/ODynJgwbq+lPKeCgE300z7hJtAiDW4U?=
 =?iso-8859-1?Q?SF2lT/WY49VR8zSoNLcYoqOglbNFYPpj3iFeyWPKda2onME6IopM2/lJfo?=
 =?iso-8859-1?Q?bqNLKcv1kplg4uRymCUcm1r/kVf1FMj6mHhZtWd63JQzV/zUbax9nLOsjb?=
 =?iso-8859-1?Q?wt0b2wPA9mo5l6MNbEtT9+aKm4MgoMe1ifTxKBiKMQuCwnBbQRCYUqzkUz?=
 =?iso-8859-1?Q?8bZvP44Dvka73SbHjcuys6sf0bew0kiuJ3kyw0BxqVZi5P55U3t4zDeG+7?=
 =?iso-8859-1?Q?HYVMVDWYl1iA38aGbazAPHLx/3VI93uX3BLVOFjbthNUj1BDl1Q/uW0ajH?=
 =?iso-8859-1?Q?Bik5SPYgBm7u5Q5IkvN/hRLnzhU125ZQHQ9xM2aZOrZ9hIP9d7ExHX+a19?=
 =?iso-8859-1?Q?ZBwRtlKFRS9vFyhPiBk0NLmBgl8MRZBExtzEj/fahJ5PFitTDt2rYX1Egv?=
 =?iso-8859-1?Q?VcE0KekPHxbDEUhsY3iK6AFQTlYQ0lD91a0zJ0uHU1vvMVrpWPwH3Gq27R?=
 =?iso-8859-1?Q?q39/JKnC6swdUlYrKsiP4SBuNJPaukcPVyQk423mOAaMB91AEHwCd7SJgC?=
 =?iso-8859-1?Q?vDmgUXjVI6QIZzPZxVzI+FV+0mdefbeoXWX8UT62MUJbV39GApwKfhlIS9?=
 =?iso-8859-1?Q?3yTzsJsB6i/+IaEyA4Joge+33ael7J3jGfj9K0ST52lP8xbG+ds6/yqJn4?=
 =?iso-8859-1?Q?lAtyBYcKWzIoIe9rWI5+0BPv0BaSDPg61k+LloTW9uEOljqtzPJ28Pw87b?=
 =?iso-8859-1?Q?JKdBJy9iZc/dMi8hOdJM+jsBXJHHn61prTcZWYT7atGl4ZZYFh2xmEP8XO?=
 =?iso-8859-1?Q?VuDHcb3r+Yw/Ru/gsPUnfFyKdP4/M95vmDVzgq3K6N86uwfCdg7o31Jcy4?=
 =?iso-8859-1?Q?hSTnHs5aHNTVbKKfIKPs5Fr8wcPPL3Q4gPsp8QGXlfqhwbqSYshTqk6cBz?=
 =?iso-8859-1?Q?lRY+17xjpNsXt9U3r6qr+yDV7DRpDdR+ePYX9wM790tgNYfhTtvpmNj8Yc?=
 =?iso-8859-1?Q?jYj4EsgCvVsNlWS93l10d9lHo4ZQHmxgfVN42r/f1tJ9oIPupjBR6P0+dq?=
 =?iso-8859-1?Q?4BbEQw3LOc/Uv7HJunGKjRxukw5BM4Is5J7dz8ufsmve4sWn5yovsMu6vZ?=
 =?iso-8859-1?Q?Rnp2Ts/h0UdSSKvpefdMgk3TRKfCjXrkv+fG7HD2v3AjhG9BqSvEvugg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891b5748-fb96-4908-59f2-08db6bdf3dcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 07:24:36.1179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LNH2nYZ4QukjdH9ZNkjB4kU+auviSx7pyvR5evDH9ezs9cW8zoZvObggo+qh+Q1duIngDYvDrA8Mddzi/4F7dCiqNYnirqRSDmfWPac7rwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8143
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thanks for the feedback.

> Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
>=20
> Hi everyone,
>=20
> > Perhaps we should first think through what an ancillary device really
> > is.  My understanding is that it is used to talk to secondary
> > addresses of a multi-address I2C slave device.
>=20
> As I mentioned somewhere before, this is not the case. Ancillary devices
> are when one *driver* handles more than one address. Everything else has
> been handled differently in the past (for  all the uses I am aware of).
>=20
> Yet, I have another idea which is so simple that I wonder if it maybe has
> already been discussed so far?
>=20
> * have two regs in the bindings

OK, it is inline with DT maintainers expectation as it is matching with rea=
l hw
as single device node having two regs.

> * use the second reg with i2c_new_client_device to instantiate the
>   RTC sibling. 'struct i2c_board_info', which is one parameter, should
>   have enough options to pass data, e.g it has a software_node.

OK, I can see the below can be passed from PMIC to new client device.

	client->addr =3D info->addr;

	client->init_irq =3D info->irq;

>=20
> Should work or did I miss something here?

I guess it will work. We instantiate appropriate device based
On PMIC revision and slave address and IRQ resource passed through
'struct i2c_board_info'

Will check this and update you.

Cheers,
Biju
