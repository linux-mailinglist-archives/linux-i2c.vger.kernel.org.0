Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196934612B8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 11:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349924AbhK2Kp4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 05:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbhK2Knx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 05:43:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100BCC061396;
        Mon, 29 Nov 2021 02:06:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6748EB80E79;
        Mon, 29 Nov 2021 10:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C17C004E1;
        Mon, 29 Nov 2021 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638180413;
        bh=uitWIyNTXwwm6OoKWtXuF9nygCgs3sTMxZAODgrYAfU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IKKoAc9a1ic9NcZI4k1mpaYfaDltZw2XNo2118zFf7SKo+s3k4/pm6ZfmFHeAoniU
         SwSC3oPI+cy6wJh3uaBmWEP9ZB7MCPJE/B1CAgoD9o9HYWiw7qXMz/nYpHjUNhPu8Q
         n8TCCf0/7olBiJZRnMv/rUppn9OV83rNePMCvDawKXYqdy/1AobP7hgqt6zAJoIwEN
         ZIKpJBng0OpeKGlPDr7RkCCahxvtulOxV37bVVl1mVrRId9fTOmXhXFHjfNIAJalnX
         KhjARqoo72iGt53sFrGLs05clJdxDPrdChpMlPj00Z55VBDQc2lnLX6kOfoh5yvAB5
         Cz8i3RRdZTHLA==
Date:   Mon, 29 Nov 2021 11:06:50 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Horatiu Vultur - M31836 <Horatiu.Vultur@microchip.com>
Cc:     Codrin Ciubotariu - M19940 <Codrin.Ciubotariu@microchip.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Ludovic Desroches - M43218 <Ludovic.Desroches@microchip.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] i2c: at91: Add support for programmable clock source
Message-ID: <YaSmOgH9MP0Kag0s@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Horatiu Vultur - M31836 <Horatiu.Vultur@microchip.com>,
        Codrin Ciubotariu - M19940 <Codrin.Ciubotariu@microchip.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Ludovic Desroches - M43218 <Ludovic.Desroches@microchip.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
 <8a775c67-00a3-1dbe-daa3-09a537f482d8@microchip.com>
 <20211013114144.7j4scdaq2rjfmiwn@soft-dev3-1.localhost>
 <YYWmZMc8eVq5SZYj@kunai>
 <eb2120c3-540e-64db-8b70-c2b29f23e3cc@microchip.com>
 <20211108092942.uulvtqoi36wnbisg@soft-dev3-1.localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kYzvNRaC+UDmnAMR"
Content-Disposition: inline
In-Reply-To: <20211108092942.uulvtqoi36wnbisg@soft-dev3-1.localhost>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kYzvNRaC+UDmnAMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Not even patch 1/2?
> >=20
> > we can keep the new compatible, but patch 2/2 needs to be split.
>=20
> For me it is OK to use the compatible string 'microchip,sam9x60-i2c'

I'll drop this patch for now. If anyone is still interested in it,
please resend.


--kYzvNRaC+UDmnAMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkpjoACgkQFA3kzBSg
KbYgag//bafEUOij4Wvxhxw39Z6jv2XeGguyQkh5gVuO3B54PNNqSSpOPjzHhWat
Kiqt1hZSer7cQIaIM7WApLkMDjwNl70w2k0t+UsfnEwFp4WH67J6k+xOGs7VOanF
c9ncopG6YzhlsEFegaYOyXKgHihGF7FYUxmZus8BMpWv4ihRCBotdnR5+nPP6emH
8DeB6J6sLkW6Jw/c8wgARhGxAhA9UqJItIQNExOPh34QSY3fK86EnJIwyr6zLLQV
aWT9Vv3ZIEnVc4QTa59O9MI0Miq7sN7mU3Q/GKGQhcP9BNXYheDIiIa8Ra8FXxwZ
fibnPzQqHfhPbb0uIM77ygeWOFH8CpS+Sql5PotMmHs4/xK5l6o+HU5o7oLJko8M
X0xWhWX1GRctascxVvIiXpdfZhVhv0kJUeYyTVcuiw+nJmt0IJAxzpxMFbWMiHVC
hoFyOSRDNr/wy2DMSLo9hxAgdOXl2gkk2MDliDgm+PSO1lgXPrMLQZD5k9h2hc29
8wE95a6ITv3mGzK2V+FclgAMjANqpORCe15WQcCd2fibWoWq8UyTEG43kV6MWIgn
3Bc8Uo9hNwuC9xvlNLLUomL7oc+Vuv1bIG7WBOaU17oFFPDr4PPIzvD02cCW/B/r
C1uPi5hZcN7e2ovsyOtev/QxEvt2lJie/8Lqw1PBLVsAdOH71+w=
=Aykl
-----END PGP SIGNATURE-----

--kYzvNRaC+UDmnAMR--
