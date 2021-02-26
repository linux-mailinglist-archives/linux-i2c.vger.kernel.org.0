Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B707326134
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 11:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhBZKZg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 05:25:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:46120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230134AbhBZKZe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Feb 2021 05:25:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C2C364EE2;
        Fri, 26 Feb 2021 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614335094;
        bh=NaOU/g2FWQ4ZRhhM4Q0RUwE8fyn5QlXDk3E/OXSK98U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O9YUNAFlhyIgXsMHjs+2Oh/kjW05+T6vLbXUSRfLUiSZMYIWRRsROnj6I+fPCX5FP
         10Vw16CU/X88p8r2zI/dEAedwdmUYNxSulI3pJ8w4E5xzjTAfnQo2QX1TXn+hawVVR
         AIx95DWEBu4V4b7SNocWX7Hiv1hlsDQRPaCp7XM46/q+6zZTVDYF77BCgIUZcQw3Xd
         6m2KgN+LwsKBP+Xr1Mi1/nasP276ZNkGFCiK0nDJADLrgdeehT8uhjpwzuKJxIaLHB
         7l755egR/K7sYiFGI4I4IoUZqDpsEiK6MIUv50rIUkgY9q+U3ZA8K8Yh+ZtTv5tpR3
         534QFZM4DZd9Q==
Date:   Fri, 26 Feb 2021 11:24:50 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] i2c: brcmstb: Fix brcmstd_send_i2c_cmd condition
Message-ID: <20210226102450.GC1014@ninjato>
References: <20210225161101.1856192-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline
In-Reply-To: <20210225161101.1856192-1-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 05:11:01PM +0100, Maxime Ripard wrote:
> The brcmstb_send_i2c_cmd currently has a condition that is (CMD_RD ||
> CMD_WR) which always evaluates to true, while the obvious fix is to test
> whether the cmd variable passed as parameter holds one of these two
> values.
>=20
> Reported-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Applied to for-current, thanks!


--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA4zG0ACgkQFA3kzBSg
KbbxNA/9Ev3PB7SkCCwXSR92wkXWzo+CbOEIosyMnjxsXzHEMMwBxv/7Lrk3c7bi
Sxu1BklR/2u004PnaZOq/KDsqBa+ifxy5+J/qdKi6rEEbknmDOrCjYplQN1531+R
sm5GI66psTo9yHTjNjm6aNL3gzSj/e1ktaAbuuOqym1NQdkFLrowWr7D7WxdI4wn
J77Sceq7VHM0qLXETzwTbvlzz/36enRwG9eqfR8gVO7pRnw+/ViSsoHAcOwyNH5q
o/dF+U75L8OsGHnC+D29Ipcp9G8nL0xh56jTGo/Um2mbUt4Iv/Rf3kPLcdQT6JqQ
4SwOEUHUXBBERIhqCPLczQ6zYgaMOFLSNroKTVfvlXBVFrOFqqasWNtktKo1EhDL
XYh3HhKcOg1FcPrFtb02WbEN6D3pmI9MA/sokQs6UaMJyD5gGMPM/zuFp2ABqPii
bM7HvLBEu0J9Xiuw4HfdQuvR486cQ3GERyuh+qTtORoq1fhi26X4ljn637pb4JlV
uq4WPoAoPkSE2X5E5byu6XjWF5bbe50h/q5CnCxQKKujtNQ2B1Sxd4ujVrd04w+F
i+RltoDXunxnxIx6O3cLjCOA2VxgEt1rskg06FN52Ewv/w2O2jWhzf3sA3pAGs9Z
GqELjwawASu+Roj1b77Q9fIG/AlAAg0ZpHC7yGMXOsPNT6qI1B4=
=IYRU
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
