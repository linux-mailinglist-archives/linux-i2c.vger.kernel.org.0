Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6691B72C54E
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 15:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234821AbjFLNBA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 09:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235807AbjFLNAy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 09:00:54 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E4BE71;
        Mon, 12 Jun 2023 06:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+QIBF5nSJklDBsOANmkWlnSkOSx65VlsviACD2Xd52Tps+tbafGT/MvBkpGUB1FwVBXb223nUQt6keyEsTEu+SDtMbXl31FBxEstUOEoXdsiO82cJvwAIJ++3o5OIzm1MB+SkWfXm/H1taK6n2DJbDbXo2S0ufNmZQy1fB8jgyAvzKi5RVVIwCkQ2Y0uMrjGmvtdYJZ5LrMG151dDwO3mVOT5pP3R9SxM4J+K4VKKTGwlZeuPwIOtN7E78ARg5gUkvGJDKicgTkprie//H+7uJPC17wjEq+4+ExygCS1jUucUfrtHUVLGKH5KjkkXGAj4IRa5V2+ApQNKMyO37geg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4ipnCH7jWuCWtF789P3GlPH+DxCIT/OJEPIgEHvNE8=;
 b=dQ48sw7j+yT85nhSVp82IyZv9krU3Af+bXcrw74BlyjwH8EFiKJtw8Y5ditnm4pwoXvFjYex9WkZSLPuakWArN5wWtGgspJKqGDfHEven6i8Hsg7wiZ9PY9+YDZWPzi7/hIEzKAjIJnFseGfDTXOOkzkBXlEEja6obSZey0W2Yv7OB9CVUoOJ67nj0+0m8OtX2waZ5liNNjwlAc+syLVbSw87kGyvo2wmKGdSf8VLi1zV1pisuA5u4jf3sKqm3fSrFE6/vhwlMx2gfiKeuLmkoumWz+bwdZlgIGlpCEcvD+Hus9fSbRacv/cgcOwTsNkPsQvQua/dWUrxREe7hUXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4ipnCH7jWuCWtF789P3GlPH+DxCIT/OJEPIgEHvNE8=;
 b=Xnp6Rg8R8fj1SfyKZ602A42kE8nv8RGsw+QnYe4E+hmcKulvJ5iwP/VXRaJs3xPK0oRifRHS4pmb1h/Q5sqBRr5mh+mmZ6vmoL29MPiUDY5u7bXe2rVl+vbtHvsiKSRe337fzVfgw6i2o4JjEb58SbwI9hmKsL1HmIfrxKBk0Yo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9406.jpnprd01.prod.outlook.com (2603:1096:400:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 13:00:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.045; Mon, 12 Jun 2023
 13:00:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
        Trent Piepho <tpiepho@gmail.com>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Trent Piepho <tpiepho@gmail.com>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAAB5sA=
Date:   Mon, 12 Jun 2023 13:00:48 +0000
Message-ID: <OS0PR01MB5922BD9C92425E12729D0FFB8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
In-Reply-To: <ZIcRKl3PDy0+yZS9@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9406:EE_
x-ms-office365-filtering-correlation-id: a726b36d-b0a6-4838-fd55-08db6b450b4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sw7jZ3J4a2d+kZwctz0E7B4iwByxPSKJ29Ed7nSpgFcXgKIUqvxw+zYs6gwsmeCEXBCiEB3+UcX40StuJZXZUhkQ1kXzc9VsGPmXsu28cqRxNxpDTrhfCQEabHCi5CpGxFg3IvPBqXFZt2GOXNLLtUZu2nTaQ+UvmveXiakFhs5mTKcnzMo0+ssbjtm0kBR+hosbqBUB8bPmUMSAdj8JfbWLqC/WjCwSYfAsPMNGwIbWS1vrlTMQz62qfH6gw5decjmGLxPpQJSTNH4XgxZwBfyZytEo1eDHpjZiwnSjwpcySOGcFOwwCKqgL4vlh8tH3NT++93iz/5U3wYslsKYvIJAezWxaKUwLwudaapGUjsrQEyPQnUDKm6SClW+UWgnjcRKaoTktRK6ZAGgCK6G2cNpkW6XHBSu5jYLCvlQ6wACmwxvFA7cDYnvdgmQUJxQVI/Wii3VXheRigSszHYa0VCRogOmt9ZZWQuPHION1/jy3g63IikZMrqNans+YFfS/sqW95rtyJFzgA+IirhDMB5feT9XOcOcqoGNDeHfAsU4CxIpLtEdR3ccICtmgbt4D4zQZ1ujcf+pyfn6r9HhMnhm24So09vp15EjDOSf8jAZZ27lQz/BWpBjYG9iJrfX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199021)(66946007)(66556008)(66476007)(76116006)(54906003)(478600001)(8676002)(5660300002)(8936002)(52536014)(6916009)(64756008)(66446008)(71200400001)(4326008)(41300700001)(7696005)(316002)(38100700002)(55016003)(122000001)(186003)(38070700005)(9686003)(6506007)(26005)(2906002)(7416002)(7406005)(83380400001)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5RAlef4BebkulhGGBsFgMueJ58lCd34BaLB+YktkoZ67YXpe2pBqnRzkDj?=
 =?iso-8859-1?Q?ASG9cehGpZd5E97v69lczwOqZMrrF4Rw8wQXlB4RQbRHPorX5nfr3a3hkV?=
 =?iso-8859-1?Q?RTOh8HRZ7A0kFdYWS5GirmmY7xM+Yb0HCIE8w0UIelswnWOubxr85FRiI7?=
 =?iso-8859-1?Q?PJv32UWKuZa+2PbDN5Ja2RlpDepym7sp0pdhzf/vHcR4w/m9brk6x767Vc?=
 =?iso-8859-1?Q?amybvjG0SMgW/4s7tHOpo+Db62DdUNyfeRo21vqOokMrnaK1ClGxtVbDCa?=
 =?iso-8859-1?Q?fv5ZOUR09hOiZRr3g18FLFela0NZgCzuT6vHGb7nksjZ9v3wSqPfBWfmgH?=
 =?iso-8859-1?Q?vrcOoVzgzokdwT/SzpUl5xKezaiRBhaKFOnZmW5ht4cG78e1KvPMrWYA+V?=
 =?iso-8859-1?Q?suuwoI0/QgUfD59ATGqJ2RalFOFub1+h73ANW/5KmM4tasu25xp6Z+S9d6?=
 =?iso-8859-1?Q?iy5Lik+/mXCUww6fBQeJw77hpj++AnamrO4hKW5GdgpOXFOgJH07vegrGp?=
 =?iso-8859-1?Q?0AQAJNnGdUYPmmHWlfKOWYe6I0rhlVGWLLwlpByedy71kvpVWtGN7nfE+n?=
 =?iso-8859-1?Q?IrfZtUSNdPB+G1WMcFFuOueSk9gu3+nYT4TS1Sd6PUxJbhU+0C4ZG5Ha5N?=
 =?iso-8859-1?Q?rHaRQ9R3tdZoyzFLibds8PLY2fuLsMcBQD3BN7h5MrUsZKlxhkSSSzzlSC?=
 =?iso-8859-1?Q?/kOLEwyMXIlo08mozSrW/EoMGjG0hLkghMjNyNmfq8IU1HR1o0VT0f0EtZ?=
 =?iso-8859-1?Q?dELv6WwzMLlyGJClp2Ix7fxQUs195UmzAJVmYr1cqiuxUItunWUTXJNl0+?=
 =?iso-8859-1?Q?zoVwFIDQpZns+Bx4l/b2+9ve2XDwemW2N/BZB1zRJjzmxBMOVmTotyWwbD?=
 =?iso-8859-1?Q?/tCpexd5lDZi9E3sjlisNiare/llBAA1WsDbI6ugfhUXrFBP4DDpLzg91Q?=
 =?iso-8859-1?Q?SW6cATtnCm3TRcSeG/TJiyTe9msMzOThONGiJ3OnNrAQuwX/JeTc/HHW8p?=
 =?iso-8859-1?Q?vzh9/tqjajBq+2Rs9bg+XY8HNT9ADLcmYUUTBvxMGbGnmC71/dbK1iL7mA?=
 =?iso-8859-1?Q?C88IpPjkGHogpb1wHRhc8V+prQZtCZEmJC+pvIxl0ETu/TI+gHxmfn9rMC?=
 =?iso-8859-1?Q?HOtgxaQdsi+6FF9I7lVn1q9k7JC0SxC2g/+9rWIuKdWvXB+OIf1B2jJbbb?=
 =?iso-8859-1?Q?DhjxUezv7ZIwsB8HI0jx/Ojetrpx6gwRdFC4ZY1A94x9UXk8zbOLBtHL4T?=
 =?iso-8859-1?Q?ol11ET+i7414AJxvWVy5eZ1GNH/TBmOw+4qZMSyBTAFZcPeW96VyEAHVc/?=
 =?iso-8859-1?Q?7mI/NQLyKIy7lWOKkZL+bOmQVQ7scGcz6K5mynnFUJEDAg4Z6OyPZHBwsu?=
 =?iso-8859-1?Q?L2F9DsoAVKcTNQ05iGK7qWYYZ/0tOunmwG40efuMmhASRvQnrG6N4UluEA?=
 =?iso-8859-1?Q?IKPEq2yfgJB3xbBgv99+Po0/6uUt+5rOtfyHD8ayiAL2jHtfibSIMzxWBO?=
 =?iso-8859-1?Q?bSH6TQl2daDYDuI6S+6S60KmtsKJksXCUGHcUIvS8EnJd76m5h+xapagFy?=
 =?iso-8859-1?Q?+m6zpW6cx3elbD75mOxk/cNrvhBmW/mfJPLfccjJ1KExoBU0mln2ibDmRp?=
 =?iso-8859-1?Q?wo1Ee74DzRwnHBuAsyQ3HOpUOoQWts6XzQ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a726b36d-b0a6-4838-fd55-08db6b450b4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 13:00:48.9083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HlL7NCRIXaJAtzx2xXjyVXUiwuwjhT9rG+BQhzklshHTpvtOk0hFbTYFXiqQ5RH4+GFqd3BaMy2t4OqEBxEgwUyAnAF1u90hOHJdsKGiJrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9406
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thanks for the feedback.

> Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
>=20
> Hi Biju,
>=20
> > DT-Maintainers suggestion:
> > [1]
> > raa215300: pmic@12 {
> > 	compatible =3D "renesas,raa215300";
> > 	reg =3D <0x12>, <0x6f>;
> > 	reg-names =3D "main", "rtc";
> >
> > 	clocks =3D <&x2>;
> > 	clock-names =3D "xin";
> > 	/* Add Optional shared IRQ resource and share it to child and handle
> > it both in parent and child */ };
>=20
> Would this binding allow to not use the RTC if the second reg is missing?
> What are the advantages of not enabling RTC? Saving power?

Some use case, just use PMIC for regulators, reset and STR(suspend to RAM) =
as it may have
RTC support in SoC. for eg: RZ/N1.

>=20
> >
> > Laurent/Wolfram suggestion to split it into two nodes and get rid of
> this patch:
> > [2]
> > 	raa215300: pmic @12 {
> > 		compatible =3D "renesas,raa215300";
> > 		reg =3D <0x12>;
> >
> > 		/* Add Optional shared IRQ */
> > 		renesas,raa215300-rtc =3D <&rtc_raa215300>; /* Parse the handle
> and
> > Enable RTC , if present.*/
>=20
> Thinking more about this: DT is hardware description, so the RTC should
> always be described in DT. If the RTC is actually activated is more a
> configuration thing, or? Brainstorming: maybe the PMIC driver could try t=
o
> find the node with reg =3D=3D 0x6f and see if firmware has enabled it or =
not?

In-built RTC is always present on the PMIC chips.=20

But RTC is enabled or not disabled is based on system design.=20

If X1N/XOUT both grounded means you cannot use RTC.

If XIN connected to external clock source means internal oscillator is disa=
bled.

If XIN/XOUT connected to external crystal means internal oscillator is enab=
led.

>=20
> > 	};
> >
> > 	rtc_raa215300: rtc@6f {
> > 		compatible =3D "renesas,raa215300-isl1208";
> > 		reg =3D <0x6f>;
> >
> > 		/* Add Optional shared IRQ */
> > 		clocks =3D <&x2>;
> > 		clock-names =3D "xin";
> > 		renesas,raa215300-pmic =3D <&pmic>; /* Parse the handle to get
> PMIC version to check Oscillator bit is inverted or not */
> > 	};
>=20
> I have been scratching my head around this and wondered about one thing.
> The RTC driver needs to know if the oscillator bit is inverted. AFAIU thi=
s
> depends on the version of the PMIC (which includes the RTC). So, can't we
> simply encode the version in the compatible string?

PMIC is a component on the SoM module. So SoM's may have different PMIC ver=
sions.
I need to support all PMIC version with single image.

If we encode the version in the compatible string means, we need to detect =
PMIC version in bootloader and update the rtc compatible and merge with ker=
nel device tree by bootloader.

Again, we need to define 1 extra compatible "renesas,raa215300-isl1208-a0"
in DT documentation for describing A0 chip that has inverted oscillator bit=
.

Cheers,
Biju

>=20
> > 		compatible =3D "renesas,raa215300-isl1208-01";
> > 		compatible =3D "renesas,raa215300-isl1208-a0";
>=20
> I dunno the exact versions, but you probably get the idea.
>=20
> Happy hacking,
>=20
>    Wolfram

