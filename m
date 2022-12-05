Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01550642618
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 10:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbiLEJuU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 04:50:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbiLEJuT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 04:50:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DEFBF40;
        Mon,  5 Dec 2022 01:50:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A6FBCB80DE6;
        Mon,  5 Dec 2022 09:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11036C433D6;
        Mon,  5 Dec 2022 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670233815;
        bh=9WVugRvgiCAb2M56mmvHvw8WVNwNUAzbpsbbRWQczic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PHdsfM9TMJ9Xeh5a49Xh0Sxh0ixytITk6itGHv7KwmVDr8v0W284373SzI27fE6K4
         M55L/UcfJuwbuVJLj5Q8sv9Cg6ciHtndheXDBMNuvHoUGTGoIm2bbEqxw+A/QxEqR3
         8lgKIh20S/UUIuZGv1xMgvkipdxAh0TNnUgMvLgghz0kYnRzTMfO7p7AhUsWuNsXMO
         hTXQnxY1XbRDFPydspiqksaXsr122ngfLZAf0sd5ERUpaZ0aeppRimF+sNoydji8K8
         0wy+xY2GP739q2d2Jqp7EZFQCVtQAy407zRE+fcyX0GUSiNC8LL+yhbw4MlgwCja6k
         6QhmOA/4KD1wg==
Date:   Mon, 5 Dec 2022 10:50:12 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 048/606] i2c: mux: pca954x: Convert to i2c's .probe_new()
Message-ID: <Y42+1JxGecTzidaf@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-49-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jiqhYSPI4Bf3zwEv"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-49-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jiqhYSPI4Bf3zwEv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 11:36:22PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Acked-by: Peter Rosin <peda@axentia.se>

Your patch is better than the old one :) Applied to for-next, thanks!


--jiqhYSPI4Bf3zwEv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONvtQACgkQFA3kzBSg
KbZXJA//ZmsZnwTr8Q9Uur++tAjaj0/iM8Bs7QtvmOgyZPX0BIHcixwuD81DVuw6
3S+gEnPGcGVN8SNUVeHGQGH0X7wpNBiRROPow2MzgYqWp9VS9W9VIvYW8w7UFfMn
v4AsBcCUmnWEy8net0lnjreJmgc41JWC8F5EMXzVgDlL89DQIh1lJUJPceZbGMKR
Apl3sIRYRGuetr+0bO2nwnuI1EVA0+IM7tacDhLk7n5OWysI8gdpehGGhYXgayJd
LlcTUcqeiUqGSlB3G9KxVZvN0I2IQVgt3RcYXVr+MmcwYo/yUJcerlb1fgeceiCD
7pkGA51LdsEJY8CiG9vy/rSCOcxq4HJ+X8xPM7zmEDyPHTXZgULv+VH6PRr5ChHM
psHfCaAvhi1Slx+gNyMZsRh+SMNNVNDQgjp2aOvEgjW51Is9Lh5CGVZjwVhR8SL8
1Y2RYlyZXfpL/W7zRkl6JW/FjPv7yH2UBh2C+Yv7EtoBMABGdBBmCyktkVMn+9IM
gN6STFny4Ve9aKw/XNJ9ZDXAsNnsBs40ZAIXZGCcVaqN5fzFnbwX04FhwOloNcvO
HIIYT6gUb04RY+QGYvP6G8s+olKaJFVW8XD9w92MWwO+YWZ4D5lZ2naChph+9pJj
bmMu0D+3UdvxqLLalOGLqgfoC/Z2BLASJg+o/m5CaQWOPNXPyqI=
=bqJ7
-----END PGP SIGNATURE-----

--jiqhYSPI4Bf3zwEv--
