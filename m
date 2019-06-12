Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D978B4232D
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 13:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbfFLK7o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 06:59:44 -0400
Received: from sauhun.de ([88.99.104.3]:58568 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727993AbfFLK7o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 06:59:44 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id 7391D2C54BC;
        Wed, 12 Jun 2019 12:59:42 +0200 (CEST)
Date:   Wed, 12 Jun 2019 12:59:42 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-i2c@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: s3c2410: Convert to use GPIO descriptors
Message-ID: <20190612105942.umcio34me542zthm@ninjato>
References: <20190530215013.17806-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ulrngfbntawifyiz"
Content-Disposition: inline
In-Reply-To: <20190530215013.17806-1-linus.walleij@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ulrngfbntawifyiz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2019 at 11:50:13PM +0200, Linus Walleij wrote:
> The S3C2410 does some funny dance around its pins:
> - First try to call back to the platform to get and control
>   some GPIO pins
> - If this doesn't work, it tries to get a pin control handle
> - If this doesn't work, it retrieves two GPIOs from the device
>   tree node and does nothing with them
>=20
> If we're gonna retrieve two GPIOs and do nothing with them, we
> might as well do it using the GPIO descriptor API. When we use
> the resource management API, the code gets smaller.
>=20
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to for-next, thanks!


--ulrngfbntawifyiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A2x0ACgkQFA3kzBSg
KbY1dg/+OxG/iLbfwcBQiE8qa5VqheJYG2OnenUXHpctl08bDL0lCuK5/ihdu3sf
erdq7Uvn+yU41f+D3wYaXKhbp2v53rOm39CEQeNjmKJ2+zVHUAXgrHRY0onAspnN
qTZBZnU7Xc+np9Gm2Dt6OzpdlUzh53vrcPMgfZcr/Z36jTxKtYkal1WI4rY+dQxI
nhmLotE6Myq5yFWdl78uddcGAeFdJqdkzC+d6cSRYYzYzSaSmxt4n4Yn4PAxJzkG
LKLTiCEkFkz50pv6IB9qYmGdr2NPfRJkVGMaLL7tWZEd8bGk7PeoXBeTPtMKSrYR
jBt6k6R36gMVhnHwMJqrSnscTpG1bgT1LWqGOmjeC33kxrUab5Jzh+fVt7UtdPCz
ssEEvS7cZQZKXfNAF/06SAOL/iF8G41IOVSnX83xgGC1qyqSD2KwHqOWXtWLTSIC
Y7c3yj+XNF61sKzMnwvuoptSHjWpi844Vi52JX/2m+Uk4ReDfQziEVOrVcehYayq
/soDbeJ5NqzWm6KQv1SV0WNwk2oeCKbj0QL5CITxXWkIAHx7nhaIjogKAroApIA4
Y3LoRS/g2KdR6aRlXQQazEMoRNSQ4FCUvW9+5HahtLdtvbWcL9AtV+GSZoTXxU3a
xTd9ilC4JZ2MuRL7G70t6r/gVfaFU+sC45Z8RJdAYssAAqNnTiQ=
=CxsI
-----END PGP SIGNATURE-----

--ulrngfbntawifyiz--
