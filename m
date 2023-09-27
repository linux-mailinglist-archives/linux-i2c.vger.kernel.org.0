Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4902A7B0CFA
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 21:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjI0TzJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 15:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjI0TzJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 15:55:09 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83EC610A
        for <linux-i2c@vger.kernel.org>; Wed, 27 Sep 2023 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=/hPS
        uQ2NRUAu1MtmSEqw5S0lNV0lO0QlN8GLk370his=; b=XOiPE246PKdjaE/6qIiH
        uOCkrfpbEdsnjiRwkuadk+B+EHrffSp8PKtmiTMNdQiq91oaPc20aQhOx7CjglmS
        A5iykt26jeK++A4KNR0UInFayB8ZzuYsQjrbxOvpPicf92O9ZY5sGIdJ7L51PwZP
        OgXmXmtAuNHxNrYUwqvnaLRFs5BS6d1SnE4UsEeCtc+PJzYpEztjjUnDUX/vw7oc
        /h/lgyRoV9UrfbQ3sBNkwHfDyYSQLc2ocst3SFJ0mRG+4WH0gNm83j2M6EZBhLOW
        LLTzNpfuALZV1biLxhb0n5jzal5GFQHhA6uZHgsgNoFrX+5HGQbcCv9xrKtve+zb
        vA==
Received: (qmail 3184996 invoked from network); 27 Sep 2023 21:55:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2023 21:55:03 +0200
X-UD-Smtp-Session: l3s3148p1@zKsykVwGQqwgAQnoAF+HAOhQXz46dAsh
Date:   Wed, 27 Sep 2023 21:55:02 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: fix error code in probe()
Message-ID: <ZRSIlgWhDIz3pbh+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <06d4de31-dfe5-432d-acab-600b01422155@moroto.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KqCQv6EJAFfntN6O"
Content-Disposition: inline
In-Reply-To: <06d4de31-dfe5-432d-acab-600b01422155@moroto.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KqCQv6EJAFfntN6O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 03:38:36PM +0300, Dan Carpenter wrote:
> Return an error code if devm_reset_control_get_exclusive() fails.
> The current code returns success.
>=20
> Fixes: 0e864b552b23 ("i2c: rcar: reset controller is mandatory for Gen3+")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied to for-next, thanks!


--KqCQv6EJAFfntN6O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUUiJYACgkQFA3kzBSg
KbZs1A//TOmDoDRhG66rSNLMeTXX3iCyJjGg+vuMugfXruz8YuQJVCVHPPtPpFSc
trU5w7jhUPtDqpJJCdbsqAq6Z1Y63E+Cc5gTuAGmbBcAPyAt+cycRaw54+SwNd//
0z5yR3ebf9V42xtoOAgLLfck+d4YKzRaHbEOyzbnpziCvVYhUWG7DwWikZv1oLwj
PrQzSlNk/lMEzRYAlgIkknxlkRjbzK+Kx9AlnjcXJg3uPK6Me31kPWkDjR0Y88oA
4mJlNdCxHYyIy+bULEpDvXRMcRCCol7LzZEY6+P9M59IdeVgdxp9ncUHzRH3+xxo
NbjNNDyuRZluhiVVkDga+RsEExdvgcOOy1HX+P3QqzC6kuzwldBxo1AFwT548Xj/
ut7NUIMI+mVfHb62wBXfDZUCwnS/9j2LV0V/NT5VHdVqoen/oqNBofO/vq/L0l/o
RnUFCgjUsI/H/xnC/6AKrYzVq5RYYUk1uIEbOzB3XTP/37MD5Aaq8ZFU1nuhYEEm
Nfg8Emp4V+amr5yEHf9gsMjLEv6EXG+WvfwMeIJrUhEPKXO/LAmrVg7tZnNSOsDm
xj+uPOzE1/CPXy4QZrr2i+joshBRB+i+IBbQ7y9YxInbH+qP5TCmR37PzoE3nN+t
eaAreurIdi1Dy8ZSlhMCZOt3KZLB6NkyKBVEhT6/86h2zBkt7lc=
=Oh/z
-----END PGP SIGNATURE-----

--KqCQv6EJAFfntN6O--
