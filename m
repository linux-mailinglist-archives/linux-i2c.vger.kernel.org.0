Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C72E372C463
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 14:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233394AbjFLMgA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 08:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233344AbjFLMf7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 08:35:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3EB98;
        Mon, 12 Jun 2023 05:35:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20559628E5;
        Mon, 12 Jun 2023 12:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FCAC433EF;
        Mon, 12 Jun 2023 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686573357;
        bh=E8SWGfhhO/WTyCRCg7ef75v0psa+Fv8WNgcRCRVbE7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uYjHdO0mxHJnqti3qcAbIIOa4e5mzhY2LIybVENo6oDDQQhGYJ/FwC7mqNWunocOO
         K+KNn9P38gX1X1tq6EmsrFnN76pnszevVLnvV5XP85zAf7ZVWTptB5tXb9lp5G7oPW
         ma3yshqCLxTQbwIljfvU8oXxR6R44+DvVqnNStALeQDgdUaMem/f2zcrxuadpxq2HK
         3zD3cyhMyRxvw3Ki4EPK4k2gViL78vqIXTPTuDD7IstybwQYbQATsmD4zvG/x2XSyE
         aKBaUJQHut/rTov1XOoGgZh9kU/aB2sQ9bYOHh4BowcF9oBGkO67Tr+ELYMhK3d5UW
         MhVy5ypGbgpZg==
Date:   Mon, 12 Jun 2023 14:35:54 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <ZIcRKl3PDy0+yZS9@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f0x63eWuLaTHiCTt"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--f0x63eWuLaTHiCTt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Biju,

> DT-Maintainers suggestion:
> [1]
> raa215300: pmic@12 {
> 	compatible =3D "renesas,raa215300";
> 	reg =3D <0x12>, <0x6f>;
> 	reg-names =3D "main", "rtc";
>=20
> 	clocks =3D <&x2>;
> 	clock-names =3D "xin";
> 	/* Add Optional shared IRQ resource and share it to child and handle it =
both in parent and child */
> };

Would this binding allow to not use the RTC if the second reg is
missing? What are the advantages of not enabling RTC? Saving power?

>=20
> Laurent/Wolfram suggestion to split it into two nodes and get rid of this=
 patch:
> [2]
> 	raa215300: pmic @12 {
> 		compatible =3D "renesas,raa215300";
> 		reg =3D <0x12>;
> 	=09
> 		/* Add Optional shared IRQ */
> 		renesas,raa215300-rtc =3D <&rtc_raa215300>; /* Parse the handle and Ena=
ble RTC , if present.*/

Thinking more about this: DT is hardware description, so the RTC should
always be described in DT. If the RTC is actually activated is more a
configuration thing, or? Brainstorming: maybe the PMIC driver could try
to find the node with reg =3D=3D 0x6f and see if firmware has enabled it or
not?

> 	};
>=20
> 	rtc_raa215300: rtc@6f {
> 		compatible =3D "renesas,raa215300-isl1208";
> 		reg =3D <0x6f>;
>=20
> 		/* Add Optional shared IRQ */
> 		clocks =3D <&x2>;
> 		clock-names =3D "xin";
> 		renesas,raa215300-pmic =3D <&pmic>; /* Parse the handle to get PMIC ver=
sion to check Oscillator bit is inverted or not */
> 	};

I have been scratching my head around this and wondered about one thing.
The RTC driver needs to know if the oscillator bit is inverted. AFAIU
this depends on the version of the PMIC (which includes the RTC). So,
can't we simply encode the version in the compatible string?

> 		compatible =3D "renesas,raa215300-isl1208-01";
> 		compatible =3D "renesas,raa215300-isl1208-a0";

I dunno the exact versions, but you probably get the idea.

Happy hacking,

   Wolfram


--f0x63eWuLaTHiCTt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSHESoACgkQFA3kzBSg
Kbbizg/9EyCvB6UWNWtdYTQm38cVu9D6N4BufNeSiQKz3aZIJSLNkiZE0HRcswKt
1VolBkD1cc9UhdRwqDdQ3qqSgQuNRpAzRDt7An+KTGvHvDGMEkHanUYbeMQtQ+qo
e5lMvvkgsEOfYPPbQNbIbxgEeqIpgxjjF/WWOOhgDfhOHA+9Eovo0zCZDonMCZyR
tOVop5peN9Y2YZ/NNVaf1itzyvOIoHA7k9p2N30tccxB9lC2DnPb6OBHi42N75sX
aPVivdOgOTIKvxzDbNpQkPD3aQZi58C6aanlxl7q6+9U7JV9s2kgsn+6vTHtj8/V
up4jXMJKnJ2ysL/pxGSa1kSoK0k3R3ue2TuffFin+HkzeCvxd9Vu1iLS6+6ayYZc
cFpymAjLBAnzCj8cMzX8dppuh8n5CyBfU8Aa1kYo8YYuQOIhWafe6vR4u9GsEMEC
4W+atOq+FAS/AYDXyt5bFJlAmEVVhidyBwiKMAfFTZXPYi50SxbjkIJG+BIujG82
TJYR9/9EwGmKfctXV8mOqLENpuxStM5vClPe4pIOh3o4jwhG6wV7AMf1SzdORdHc
0IpvcfhZDQ8Wr3pY2RNleFdriB1H2ztzfjj+e+tOqo1avi7396MWo96evPD+c5Q4
3LFaOs0FclTFOs8qBa6SL6uwj5sGI0sMKd21hUwGKgn0mgpdKlc=
=qQlV
-----END PGP SIGNATURE-----

--f0x63eWuLaTHiCTt--
