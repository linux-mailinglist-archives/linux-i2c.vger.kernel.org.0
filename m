Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB1F729E2D
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 17:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbjFIPUB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 11:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241463AbjFIPTs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 11:19:48 -0400
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F00411FF3
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 08:19:45 -0700 (PDT)
Received: from localhost (120-123-142-46.pool.kielnet.net [46.142.123.120])
        by pokefinder.org (Postfix) with ESMTPSA id DE73AA41FE8;
        Fri,  9 Jun 2023 17:19:44 +0200 (CEST)
Date:   Fri, 9 Jun 2023 17:19:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] at24: fixes for v6.4-rc6
Message-ID: <ZINDEPbIpthKfiH0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230609082300.32524-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7M36fdeHSkQXs9ip"
Content-Disposition: inline
In-Reply-To: <20230609082300.32524-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7M36fdeHSkQXs9ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Please pull the following Kconfig fix for at24 for this release cycle.

Pulled into for-current, thanks!


--7M36fdeHSkQXs9ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSDQwwACgkQFA3kzBSg
KbZFNA/+PUwt9ePAWjSV7r3T0Gqqmui5w0LQF+7/Z1Uyupym3SOiQYRby1fbBpMR
/wk7WDKm5WGckPCWmaWBnkTfbFZpRULY1iVvtdiYKKxNoJx5wHvZ8WZySbjHWoaj
gQdF19QQIOoE0luz4f68voTscjM7MKgOIORaQ4//IZvqZHqp0qCIYYQPG0VIPbZ0
VKKyUiO/TgQzzwXlWMN/Cmw9qL5sw/7ZBJDaiW4gKUY7GQlKWbfFu7X/Bw+B7sRY
gNS7vqs8M8EipK7dthYdO+z48iNc0DlbO8u/B8KTKimRmKLNSRgKsqnYYIR7SgJx
K/rEun4FgForPTWXm5r4VKYYxcyj6olHRGhzDXd0EwBjObptnVYhV8eP4UGGEuw0
Jnb270IJ2KUZzFBmH2QnX+3FnaZSyj4Y4G4Opj1O5FI9cTBQCZp4wdRl7ThB5PbI
Fdp2o2Sf0kK6gEh8bdCYEtfQBMCQq/1e3EEak0NkI36Y6UIJCUpTBs2Hyt4YtmyR
tmnXDyUoyiJPfLkf8wsdEYSateiF1CkUd2hOaVVz/rMWq+LDbHvZbFT+TDJU2Fvd
VFQ0EMzpnMEY9Q+CatV3yMf/ElbEA/V5N6sCmdbKgEBSOT3HpY4r/6eo7o/N2nZN
oeE1f5PNOH/MxYOwGdbod5e6HXJnlDTzAvSEjqWB5VGWytNJSpg=
=vYCB
-----END PGP SIGNATURE-----

--7M36fdeHSkQXs9ip--
