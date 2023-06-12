Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC58A72C4D8
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 14:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbjFLMsX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 08:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjFLMsW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 08:48:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E813E51;
        Mon, 12 Jun 2023 05:48:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BD267615DA;
        Mon, 12 Jun 2023 12:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBFBC433EF;
        Mon, 12 Jun 2023 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686574100;
        bh=v4Z8rlRMT58I5wgb/bRfwh8250zpxCQEUMup4PFg33E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N29rIO+VqXsARmgbLd3uP6mrezsJ7tzFZAFOS8qcDXJx0ldhFBigJPWeDZaclw4oj
         JUsBe0iSPz343rXXioDRPpmM5nQxeNqKjzABOZAfLwMqGspWPnPbMEt9RIy6bIgrnt
         SwhF5fhSuXRTflRjPywGKMrKIWZXU5jpXDw5sjhX2okApKVmDJ/J/h4lf+xXpOwJOq
         pLEgf5Bo4PrcsqIwru87FmIAAndIcVaKqZU7F1Sbor7RydUbz8hvwIaBfhH4c8ahVt
         2lfroueintxEV6u2vQzw/D6K6kJgCuqgyh7ZyAIAazz3qJsOeuInPlZshdQsSV/X22
         oUcYyLoj161aw==
Date:   Mon, 12 Jun 2023 14:48:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
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
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <ZIcUEdctlgRsGxJ3@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
References: <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WvJDwm/Hwewvo4Eu"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WvJDwm/Hwewvo4Eu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > Would this binding allow to not use the RTC if the second reg is
> > missing? What are the advantages of not enabling RTC? Saving power?
>=20
> It doesn't work if there is no clock?

Maybe I am confusing something now, but if the RTC _needs_ to be
enabled, then why we don't do it unconditionally?

> > Thinking more about this: DT is hardware description, so the RTC should
> > always be described in DT. If the RTC is actually activated is more a
> > configuration thing, or? Brainstorming: maybe the PMIC driver could try
> > to find the node with reg =3D=3D 0x6f and see if firmware has enabled i=
t or
> > not?
>=20
> I guess the RTC part would acknowledge anyway?
> It is always present, it is just part of the RAA215300.

I mean the driver should scan for the DT node. Not on the bus. But a
phandle is probably safer.

> Sure, you can put that in DT.  But it's a pity you have to do that,
> as the device (the PMIC part) does know the revision...
> That's why I suggested to let the PMIC part instantiate an i2c ancillary
> device...

I see. I'll let it sink in some more.

Happy hacking,

   Wolfram


--WvJDwm/Hwewvo4Eu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSHFAwACgkQFA3kzBSg
KbZwkw/9Gsje3G0GrpSg0bBAo/lCUg0W8jr/9SckwE+ZV+oyUifFj3f6UGBYOUh3
3lp01hw8HMpNx7UGEXeqtks0XJx/NvrQSrEo9evQFxbqD1bknR3/rVSazPYq2YVU
OIKnMgtDFwbNFTW4Z1XrWkTid0GiwMxjwPYOGpggHz/dCC0X7sbSYVjB5Mp8AtQq
QMbtztNNvpRK3myi3gXoydxt45elOyxYqNUzqA8LE0VSrngKkbJ9bfsjzFVzMmYs
JZyhMjKyKv37qTsLrOEDOK0+Af9ObWx+1eEmb6zuJiaxzVZiEI4EQC211aUgYW+i
WuaTobtQLvXPGdYqCZFj+a5TjIZM5a1zUos1yleeJPhA64x7ZL9KlwkwpMSEW8bq
5XvVFrbFtOLQmYMBY5u1DdPyLC/4oi7uMdX0MHm92Y1+7syj46fnxEiwjqTeVOu/
7DL1ubJ84p0uAyQXbBBeXMFh5FlTvPL/4a61irbaoHw9d7U2DUs83Xj3zEYXsXmG
Ni02dcZRUMuUKti8CYEhWtlCXbbkKOtvspFdTPGN0F9Q0v6+XW6WScBuivMTVy2E
zhp4luTeRE7bguizBbUSdjRYAVUa/ibYqRzfKaLsYmU7W34RHa5DI+aK4BqOU+sB
kEUSvcw5kVL33AwvwSzcvPF/qFMI+cYvxAORB6rvoMdOU+CkTYA=
=KA5H
-----END PGP SIGNATURE-----

--WvJDwm/Hwewvo4Eu--
