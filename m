Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F01E06C1D55
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 18:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbjCTRIZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 13:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbjCTRIB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 13:08:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DEBBB81;
        Mon, 20 Mar 2023 10:02:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 79FFEB80FF1;
        Mon, 20 Mar 2023 17:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866FAC433EF;
        Mon, 20 Mar 2023 17:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679331645;
        bh=/djYoZe9ntFSOZv339dKdTqeE9XcpIw3rmFzL5xK5wM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D9J+jNnUyG8XvfRGVoKpZa9jOutVYyLOYQgDSFJCXyYata3ZIpPO0ZNtjJTxrlhBS
         rW8qMOpu6YoMNhwYidRGE3WH2XhzdcRlI8WafChZeGijpuFoc08FfDK5S8zOoKXka4
         1npTXPa/eHn8mFULIkGN67E1owEoGrazdQam3cBV74CswiK79vAf0JCfWT6VmdV2xf
         /mzpewb2X3E0w35to99OEREy0mDx2MMKVW8zQrF1J5g6wBZEXM9CwdtCebkh5ddEAm
         hlgZ/EORi0lXYcOvdwLMlXIzdWP+zmW4TvZe5vNn6Ql8f5/125K8uV1PSyeMqTj557
         v/TYt+IxRNZCg==
Date:   Mon, 20 Mar 2023 18:00:38 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v10 1/8] i2c: add I2C Address Translator (ATR) support
Message-ID: <ZBiRNpvITuOT03rE@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
 <20230222132907.594690-2-tomi.valkeinen@ideasonboard.com>
 <204f124a-1030-99bd-9c84-25ed067991b6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+tPumYvoRMdn+0LO"
Content-Disposition: inline
In-Reply-To: <204f124a-1030-99bd-9c84-25ed067991b6@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+tPumYvoRMdn+0LO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tomi,

> Wolfram, do you have any comments on this?

Not yet. I need to dive into the previous discussions again to
understand what we agreed on and what potential problems we had to face.
However, holiday season is near, it could be that I won't have really
time for this until Mid-April or so. I'll try earlier but no promises :/

> Things have been calming down, I think, and I'd like to merge the series
> soon if nothing major comes up. The easiest way would be to merge the whole
> series via linux-media, as most of the patches are for media. If this looks
> good, can you ack it and I'll send a pull request to linux-media
> maintainers?

I'd think this is a too elemental (is this a word?) change for someone
else to pull it. But no worries, I would offer an immutable branch right
when I am done with reviewing so other subsystems can pull it. Or are
there other technical reasons I missed?

Sorry for not having better news,

   Wolfram


--+tPumYvoRMdn+0LO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQYkTIACgkQFA3kzBSg
KbajBxAAkjZdWBWFPtrSxR/LahXMxyN95xYIZuGOYTIVmt6GWdN5oimajXGp72Kp
gn/PysIRZ6LRH6lruLwVNiLPV3OzvSs0K/seVwxE3CINFd1QnHajhXpjwajZmVy8
ZnDpbdl3aN6OSpuZuKlANJ/PNt2BN5Wm2iC+bOXKb30u+2u+3cfGoRkZ+MngUxmR
T5XSFXGMxokpHyIIaP47gerFh/aYwQ280kyRM/ZfBNVYhsfy2FnehHWfOtk1X+/h
ALwGntFezsferOQUB/qbzNg33sTkGu6rVMhlFZu/40QBgFhqozOuHousk9I66MmT
Or7sGgZ12EDsmdgAIn2Aik2hSvGXBdlpINBVr+lPE3Rxo4J2H7uTjSrsedBjGYwH
acU3dD6hqzTjL7Xth6hHE7HAft6nzso2EEB1EKZQtsw3MlYfRNQb35jdbcvPc8tc
U58KKbV3wBIJ/VnPbQ44j5S0B/LFhPwhhhhohBZ3NY0Yv1tw7ckMqzMiWxue2cVQ
1jPT5HCCD5mskzm9n56EQ9A5JE3Naic2/iaOHNP3K4TPYAhZ7lXGziuNuS5jRr84
8z3ffCgs/aSpPe1OPQdZwYAPewFe5TP332nDzTOLNaxDJSManIpyoyOgmuaEZdXH
LvY7DaRf2zW49i6gi05WhzUYL0Mb2sfv3Xm7gyxSH0ieFZ/0CX8=
=j1Ll
-----END PGP SIGNATURE-----

--+tPumYvoRMdn+0LO--
