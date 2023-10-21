Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDF477D1ECD
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Oct 2023 19:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbjJUR6C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Oct 2023 13:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbjJUR6A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Oct 2023 13:58:00 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C5ED63
        for <linux-i2c@vger.kernel.org>; Sat, 21 Oct 2023 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=hyrU
        saBfs9U+VgT7gUElro9ixkZH4rjrsyfqitWvIdw=; b=csL4l/aoVzts/2DOHK1b
        FCKLcTp9UeMnS4tjCfqQPCD0JDn6EUgFw9wnMt3wuwDbbn6PQpuSsD0ZyCTs3Dqp
        vaXrtDvEFcXUq9hozJh+M3i4F4Ry4wsCigLkm42r+2eqaZebA0Mcjfq9hU2l6ZQO
        SI3dtZY0A9Mba8QCDqrIX2YT5uO1wmZfHBsJQtyzqPRHB9vECpIliZ1m4uO7TZtf
        ZfiRMZztRKhjrvuLQGNfxGjF42A6ww3cEQC1V3Q7l2Zon8fsRHRpJEzIrlJ/DEVx
        9uxcg8f4uh6IWu3tT8LP/BLOGTPuhnkQZUMlCCXE0Aox/360gKAYod7Rvf/ubmGv
        sQ==
Received: (qmail 1472704 invoked from network); 21 Oct 2023 19:57:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Oct 2023 19:57:47 +0200
X-UD-Smtp-Session: l3s3148p1@s/EMuj0ILN4gAQnoAGobAPDYRw1R6KxZ
Date:   Sat, 21 Oct 2023 19:57:47 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Peter Rosin <peda@axentia.se>, Stephen Warren <swarren@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        stable@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 1/3] i2c: muxes: i2c-mux-pinctrl: Use
 of_get_i2c_adapter_by_node()
Message-ID: <ZTQRG81wfrLYJo74@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Peter Rosin <peda@axentia.se>, Stephen Warren <swarren@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        stable@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20231020153017.759926-1-herve.codina@bootlin.com>
 <20231020153017.759926-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e+2AHZSc7n833TFr"
Content-Disposition: inline
In-Reply-To: <20231020153017.759926-2-herve.codina@bootlin.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--e+2AHZSc7n833TFr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 05:30:11PM +0200, Herve Codina wrote:
> i2c-mux-pinctrl uses the pair of_find_i2c_adapter_by_node() /
> i2c_put_adapter(). These pair alone is not correct to properly lock the
> I2C parent adapter.
>=20
> Indeed, i2c_put_adapter() decrements the module refcount while
> of_find_i2c_adapter_by_node() does not increment it. This leads to an
> underflow of the parent module refcount.
>=20
> Use the dedicated function, of_get_i2c_adapter_by_node(), to handle
> correctly the module refcount.
>=20
> Fixes: c4aee3e1b0de ("i2c: mux: pinctrl: remove platform_data")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Cc: stable@vger.kernel.org
> Acked-by: Peter Rosin <peda@axentia.se>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Applied to for-current, thanks!


--e+2AHZSc7n833TFr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU0ERcACgkQFA3kzBSg
KbZceA//SLD4wYCVZ4MeysN0/8ZkjP3dT3AsTf6bqABvSTS23dQpmI/NDpPpy7D1
x8hpP1RtzvXgUUjTMJAhhd7/mG5zUlrKwCqLtNHEtVNuUNhwBhgULl7uRcUh7Bve
6cHP4GTLMOhttXvksLr0iUGsNB4ijlPnDi5NcPWbuXIjmhuPTU6SOFHij4xHlQ/Q
AyNt3AQE2+qNY5xUjMW5s4qa+U9tViMEy5WkjfsYneIU7LcXyJrvWdp612x1CRW7
IEuFmHzk3sQ6EEDnMfcByshPAD6FEtp3RI4QeaRPDnluraCrwtfcoyDfIHanZ8sw
MaHWbINyZxpM4tSDbpHm6ZVai0N7T4syTFXLqf7Miv26PSYxekhDmu6SOHv3Fv/E
axP7noVssPBXbwu14PYgI7OyZ9v5CRTjYsYwiPp3WVeli91y3bE7tV3Z7m1Braj9
f9bKFOYpYPmXd5suD9gf+MqOSHSAZ2uQSP7osn0ZNIZG8QrFwJi4V0AjeOU+/Lbj
lNRj4N6pfegsiHzW/06tUbAcs9Jba2UfHDTJFqzVlFb+tFxyT9jygVWFfDs6DEHV
jnAwEC8GSbltCl1PdKpUkoOwMUMHDjjFLaODFc+kDM1rVvO4PSgf6+C1UsE2T+zs
lEF5cQ1Di1zUbHiKM79sbAKT0Oaedhh7K1ITsY+gQOhkvaMN0eg=
=cyp0
-----END PGP SIGNATURE-----

--e+2AHZSc7n833TFr--
