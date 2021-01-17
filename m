Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3DDF2F9224
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jan 2021 12:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbhAQLyW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 06:54:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:38226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728131AbhAQLyV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Jan 2021 06:54:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85F252080D;
        Sun, 17 Jan 2021 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610884421;
        bh=Eb4daXwLyW90LV1J5VBpoK9AsF8VVzB5wDF2WYuJoBw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V2ELbnS/OMr/xQHoNrQSfrtY2erVZAEMeTqQEE3TmBaFA3AZPCbcRpOyxpfS/r/hh
         836beG9rWfapXuVJRf1kOUclQuNtDs7k7bQzkugz4fyXpPNQm+jZX0dclXmPm30cl4
         yow8QqrExoqdZsBSGbI+ElW2LXoJF9ES0P0L8/UqaKjDAZd5GB07cCU261vRm1ruxA
         wq1tFKfUmXZF9+Ai+R8ydXlY8clhV+fp5nIHMzzRW4NBu9/WMZPB5gUEi+DI0fUhYt
         AzrLAjCyGExzLHJ2FNE9FJ/PC6ec2OX7EAve/rUcrf+vQ3S/+s50Bh3JW9ZgvCKXwo
         uF60AyQ1xeL2w==
Date:   Sun, 17 Jan 2021 12:53:38 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v3 1/2] i2c: i2c-mux-gpio: Factor out pdev->dev in
 _probe_dt()
Message-ID: <20210117115338.GG1983@ninjato>
References: <20201118234025.376412-1-evgreen@chromium.org>
 <20201118153951.RESEND.v3.1.Ia45846771c63de3f2418d2b9c767cd95938a164c@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5L6AZ1aJH5mDrqCQ"
Content-Disposition: inline
In-Reply-To: <20201118153951.RESEND.v3.1.Ia45846771c63de3f2418d2b9c767cd95938a164c@changeid>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5L6AZ1aJH5mDrqCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 03:40:24PM -0800, Evan Green wrote:
> Factor out &pdev->dev into a local variable in preparation for
> the ACPI enablement of this function, which will utilize the variable
> more.
>=20
> Signed-off-by: Evan Green <evgreen@chromium.org>

Applied to for-next, thanks!


--5L6AZ1aJH5mDrqCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAEJUIACgkQFA3kzBSg
KbbveQ//aGFZMCKlGf9QEsDNocPBmJ+aCrO2wUj2a0cHbnFl66fyZiUKK07s3cXt
IYvzDDzSOKiAHj5m7a/6khAyUfAxUAEGvSVfAfVUK/dE7s2xffzoM5GGDyfpTTew
oF5o1IAGJPskKOL9S+0WVRUdOT6/TmGz0ZyEm9o7MQMDj2Jyij8/T9ekkELmyDxU
ZtFqvqz20Tes4H/tzwDCXCy7dN44QYOY2emqjPpOWyLRyUrFJ+nv0acUQ5Lw1gbw
xonLMOtGS2tKkXYQ6+daqrHEIPCXxzZny7OpfAOLISAB2uCHX0ZWzj6vPWPpedAf
oBygfU1I4cGkN2jg26YwE2AoHW0bviQ+0G4vCzscUslTZiwJTT3kGLd8XksL07E0
b2A/OWnrZx/JRRCuejNzEBiQeevNgeCYM4VYKKro5xV34LGj/wSxxjKudFc7GUxa
AB8FezNnhlPkV/Qo/rUiHrstVHlagB9RMTUnLEQEE/2G1IDDG6Cbefe/hWjcce1j
+lIakLH2rvJsJtMF7ZzTwXn6vw+npQ9IqpFaYBQou7oE3jp4MgqfsrG0sk9pA7SS
cKdm4FJ9k6FpgHp6H5aDgyGRWdL0T5yhjBC3sQBBw8kisDFMzQq7CSR5t/ibzoUQ
pNRbzJC9Bk9OcXJB8SnT9cp1yg53a5D92OzEII5M0YqN0ngQcSI=
=3Eps
-----END PGP SIGNATURE-----

--5L6AZ1aJH5mDrqCQ--
