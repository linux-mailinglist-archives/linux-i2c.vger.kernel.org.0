Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870817C7E76
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Oct 2023 09:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjJMHR3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Oct 2023 03:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjJMHR2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Oct 2023 03:17:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9DDBC;
        Fri, 13 Oct 2023 00:17:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0115FC433CB;
        Fri, 13 Oct 2023 07:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697181446;
        bh=mZzYynmfJ2/pdsSnnLB7cuavYnApPnZfzHGYj9nCAeA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IVoeRbExMYaVYqOlZ0E8lBzZCXXY1JbAget/P8s277Z4fb0gx7WIb1qebIwGCY1IJ
         h9+RlBxTjpMHU+QGDK+xK0cIE4HpVPEjn3DX8RpRLBXFLTD9DmNZ8Y2xHQAVYmMjxV
         zytHQGwaKWn4P5a2325k49h7ZiBI2s+N2XYzMt6wM/rVgKre84QrYF0DViIU1ytMd7
         VfArELQIqtToaHjPtoTAvY8n3GcR/eoFQMbjTHu1l699yX99pLwFNg9UhFxkHIysst
         0uOq71xzAiyIVBIG853S3Os9ftzvPGv/woCU5U6WfkrFesxc9ATonOrZGcWYEdd4GO
         aK2T7umF31aTQ==
Date:   Fri, 13 Oct 2023 09:17:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stefan Lengfeld <stefan@lengfeld.xyz>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org
Subject: Re: Sony IMX290/462 image sensors I2C xfer peculiarity
Message-ID: <ZSjvA3QpY1T9McjN@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stefan Lengfeld <stefan@lengfeld.xyz>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org
References: <m3y1gpw8ri.fsf@t19.piap.pl>
 <CAPY8ntASwh3AcRqE+2zF4Df=u+=wJ5K9icAeOrXTMJGDd1+caw@mail.gmail.com>
 <m3o7hfx3ob.fsf@t19.piap.pl>
 <m37cnuvmhn.fsf@t19.piap.pl>
 <m3o7h5tthf.fsf@t19.piap.pl>
 <m3jzrttrmz.fsf@t19.piap.pl>
 <20231011101553.we3r73xejvqdql5j@porty>
 <m3fs2htn7g.fsf@t19.piap.pl>
 <20231012220127.GB27838@stcim.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u/l8M5o0YMZg682I"
Content-Disposition: inline
In-Reply-To: <20231012220127.GB27838@stcim.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u/l8M5o0YMZg682I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Do you know the I2C repeated start feature [1]? This allows to batch together
> multiple I2C read/writes in a single transfer. And in the best case, this
> transfer is executed in one go without a delay in between. At least in the
> kernel it's guaranteed that no other driver can go in between with another
> transfer.

If the HW does rep_start properly, it is even guaranteed on the bus
because the bus is never seen as free by other participants. Check
"START and STOP" conditions in the I2C specs.


--u/l8M5o0YMZg682I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUo7wMACgkQFA3kzBSg
KbZs4xAAiGla3VYW4LK+tWuDufXr/zrNHbwb0pU1zty0q+93Yp9riCln24vQ8VdN
QbtOpwcHb+aZOh5wfz8IqL8DTgAtC1Z5h2qxUXv2vYA/V6t5jirybkOg/iR+moG4
61V8ov437G4iAaL4xcObmtW6F6Gse/dlm8Q2JGg2eVIZqNr7mgcgJeyPTR38pWjS
1FjP9NYoY1Xu/JhFEwar2LbLLYQqNtrT1AuPXAll2GlfDrBtfxSWZAG6ywDIXU34
oEaMuAZDVIzhltMLgXzBQhMgef9l0naVuo/myB+htVwA7oAn45ImyDc1fGyAUMlC
x2E7zL54CYGpon4FclA74Sgp0AjlWa3RWCkPZ+oQzL7HyjKYwM62cb3aPWkMCaV7
57KkLtKwUb5SmTRGryNYivEXta7adBo7HvIrYeuO0paGDw65NpzeKP4rMSQHo+XX
LWTirx18kOKA4T+r9xKvIdKiDly+R26dBln6nK5cbM2bkmIn6TIo7i2fITPbTInA
Y94MFb/0Ifa97tNRD0VQbv89dnzogx0HP8BkVqwdpshIoIifmYSm9X33n5Nb0cT1
YifunACQYgdt3vxnJjFPiUB3KE8Px/Wp/vvkWEacvbgnxfrID8zVMAhhsvinCrhQ
hHh/id1kvsXrsrs8POeU0KrsQDarFZUAf42lJtPcXoY2rd9FoBU=
=pVqj
-----END PGP SIGNATURE-----

--u/l8M5o0YMZg682I--
