Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F38A642600
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 10:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiLEJqY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 04:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbiLEJqW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 04:46:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9696BE39;
        Mon,  5 Dec 2022 01:46:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A8691B80CAC;
        Mon,  5 Dec 2022 09:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58A2C433D6;
        Mon,  5 Dec 2022 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670233579;
        bh=0YjvjMAnNv7s1I0om4H4oTt2LREvILW1JxecagiIFq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g35rVn3IyApPV1ACg8yq6IusfHaby2iYe6xL/LDwWYfJJp3aZV9j0DpNCD3Nx2oj9
         ZVoH7i/D2D+mPvcyPUPgz4RR6gXKsVKKe63s1nb/jYpkUMQ3cz0BKegpySLX3c8u1z
         NSeXYHEMWPJV04354YVycJuUkPc5C1UzWXFK2Fs3MDPD//BKLYNzkok9Ke782wpIQm
         P/9oQ9/3YNq8AQyuTckso3kxOrAvfU+fO6oxa8h2pHktAYZGgN7m/eKuggc6FvzmdV
         mPZxvYlTd9dwCGsqs9KZvgdDMtljXpHIRWAKeqhnd0X7OmFB3RyH26OL6MJ8w/EwT/
         jRDxrSaylnGbw==
Date:   Mon, 5 Dec 2022 10:46:16 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 047/606] i2c: mux: pca9541: Convert to i2c's .probe_new()
Message-ID: <Y4296PEnzgtNyAo6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-48-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XJx8u3EcQvX1eaUF"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-48-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XJx8u3EcQvX1eaUF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 11:36:21PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Found an older patch doing the same, but still thanks!


--XJx8u3EcQvX1eaUF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONvegACgkQFA3kzBSg
KbasKA//ben0upJnQObZCSEwaSJ33ysgv9XFm/KCe+kkWqMlz3gNSiN315An7ODj
JLoYmRL23YmxJyHu1vlmN5bBH81bEf5ShQr6LJe4QnovAQzw0E416WK7SWZv4TZn
pJe+Ku9/FZeM/xNkbDj0diI12Px1RyWgnDtpNPrHr4nAvZbD5qorJC4/GGun3/0K
mjSCMlmt87MZpH0x/nYUBQWZ6Jw6w8QvL7S6HPFYF0Uez/HAQM9RFBjEU1srbcG4
lU95CnFAhqQVf1IDLYXTpAdLW9ZvJ1fM84dVs6GCnwlr6JiBhU2mWDAZMTmIexrp
RzBik3j9h/lKR8LntzapvMDZAKv7huo8tGtBqI+9QyuyxMe9o/K08blkM3fR5v6n
x0L5dUCaI1W2nQlNwJl96NwD6VcRAtQgyiJ/Ha3XkuU6Ro40VLPIaRVnOYB1kD/u
Gi4AO+SadQrqlgGiXFH9rXQVbn4bdc4aZqqQI/+8FzB6l9YY89AQsBg4pRvopy4T
UeP1/xagQv1ZS6xRnAnyxL/YMSKPozpzJl2eQp4HwRsS+wHSpxqZRZUvmaH0V8pY
pz1MFtK09rh0dU7S+vUAhOJ8tBesPUiym/6+eqXTwA7gUDS+1AsCraeGZTutoXxj
j4Fuui94fqWqfe9+TSScrBMEgnSVL+hsxPjD2+mFBB2jvmNOtU4=
=7AOJ
-----END PGP SIGNATURE-----

--XJx8u3EcQvX1eaUF--
