Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD7A2D774A
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Dec 2020 15:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395391AbgLKOBp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Dec 2020 09:01:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:40100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395159AbgLKOBk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Dec 2020 09:01:40 -0500
Date:   Fri, 11 Dec 2020 15:00:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607695259;
        bh=T2RIGK3bWoEyOGazj/lmXQPrzE1RiP8NSh+ymy5Cnko=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=L1OnLhL/Lwk8H9i/UtiOk/+UrHL2LKXvTB+6ydIzMRez/X6k8UmPsQxVbhXHR6L4R
         BY+PYuhB3niOSEQ7dmguXE7NZNyWIf7WzzmtmcUJ/8+SQNOJCXkFdXVD3XtkNxcnxX
         hUn1gRSbZgZuwzzKrTwXvGDQsnw/tit/qmFD7UnjDXs62OlWdB+SwP3f+A3gHUbcml
         YaiwRJ4aUoQZ3MayWN1i7GCCn5QYGEomGiF3Be9TU46TRHe5ddrPgP2wNRhqnpBW9q
         hZN3MD821Kh9HcU/x6PXZxm5thwwg9aIEV01Hp13+O0jVMjezrmDE1lql4JXOl1Br1
         B9SCw3t2R+pXA==
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/2] i2c: Warn when device removing fails
Message-ID: <20201211140053.GA2755@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
References: <20201126072331.1737632-1-u.kleine-koenig@pengutronix.de>
 <20201210201044.GB11120@kunai>
 <20201211104328.3h5of6kegwcbhob2@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <20201211104328.3h5of6kegwcbhob2@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Uwe,


> Yes, I'm not paid for it, but it serves as an idle cleanup task for me.

You have idle time? ;)

> > No need to initialize to 0, or?
>=20
> Right, this comes straight from:
> -	int status =3D 0;
>=20
> from the current version of i2c_device_remove, where it was still
> relevant. I don't feel strong here, and if you do I can resend or you
> can fixup while applying.

I will fix it. Also, I will add a comment mentioning this as cleanup
preparation.

Thanks and have a nice weekend!

   Wolfram


--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/Te5EACgkQFA3kzBSg
KbZnNRAAhMaSHfyipKDud+KmrUcS3PzdZCTu61Fj2Fz7av38i43lY4DCzRm82Ozy
5Sou2762UidH5EWGp1D9B8J5tHB8c1ucPdF2VZui5A/YF7Mw0g/Si9eUz5xpOxe/
aDyGuO+2HaQgV547FguNLoyegDdBiF6W/+wuRMSSnyXaNsvJOegiOegefsxm6l4k
KSXtZXppHRg7R07vtioWmJ8Oe5W9Vos6RPMymRO8J41xQB1dScm0EOSQlg+1sy/c
/4NOfp6w1y46Wp2hTiVwCicKdzhf/CfTHU5lP6K3cXP6CVNoTLyg1nlWle7+nssm
BruNyqBb6noiOv7Uyfz1/4dITUVEagGXE4xzVfY2SXBurN/6FmaKEtVhsuwswHDw
IZhqhJgofZgabqwrp7prEBbrDheLMBsBMmWmIaj/hubpnJ2YHLlvWg21GGfy/qsG
ABu8YvkuC1lizdCS4m+8jU0NN/6H5KDn/h3ghjwuC1PiGZuafg4f8XtGKKBzK5XC
4yhmoS5opAHQ3GGMJ9r9JaW8FUhlZS56lo8Eqm6/urQexYbUwhWnEQnknHkr5TIO
erHE1SUQA1SDvKyYFn59l6fpNXKdpP3CUewOk3y+cYI8gqv2CDBS0h2WnxM0+uMl
iiBQdbJZ79QCXlXasuMCIepnPRa1gYJpl3KBPoEaZGJKVkVzeJU=
=puQg
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
