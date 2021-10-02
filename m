Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D2841FA26
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Oct 2021 08:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbhJBGpr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Oct 2021 02:45:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:48252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231941AbhJBGpr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Oct 2021 02:45:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99FC761881;
        Sat,  2 Oct 2021 06:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633157042;
        bh=xTpVjdh5zUvNVSK/OYnuTjM4b7HNhunT7p7eBPQJO8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q+FhDeBUsy1lZeyc0r4ehf0mMwyl3Xqf7yP3Uya/Bve6ZJivyIpFJU33Xf/Z3zH/v
         IksCJ4zADaRG0RpDyVC2AZokJV+tBQykUbsbt9TY32S+MaSKd0x+A+zVA4d0FmKAjy
         p9FxY1QZ9Zc7oplT6hC5DeYkuAjrhtBoLXNn7pnxhLZkPJWSWA+PgStR/Q0WlVmuVs
         fsDVLA81tQcfYnqFqn5320BUx9qbMh2CBSs7QpSAXN10yNqVPpY0s1+ZlRz/SibzRi
         T2bUccj8juZVCWaMs0Pf0Derk4/j0hUDGB2VUXmu0I4OQnoQQxR3tS5BhlCCikwntq
         vobGE/1UQj7ZQ==
Date:   Sat, 2 Oct 2021 08:43:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Morten Linderud <morten@linderud.pw>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] py-smbus/Module.mk: Install with PREFIX defined
Message-ID: <YVf/r7SQlBQI2g39@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Morten Linderud <morten@linderud.pw>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
References: <20210919100851.2890107-1-morten@linderud.pw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2xQs5OTpsVeHrXE+"
Content-Disposition: inline
In-Reply-To: <20210919100851.2890107-1-morten@linderud.pw>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2xQs5OTpsVeHrXE+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 19, 2021 at 12:08:51PM +0200, Morten Linderud wrote:
> If we are building to a defined destdir py-smbus is going to ignore this
> and try install to the actual root. This breaks packaging setups as the
> install section would fail.
>=20
> Signed-off-by: Morten Linderud <morten@linderud.pw>

Looks good to me, adding Jean.

> ---
>  py-smbus/Module.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/py-smbus/Module.mk b/py-smbus/Module.mk
> index 04ceb64..1e2ded1 100644
> --- a/py-smbus/Module.mk
> +++ b/py-smbus/Module.mk
> @@ -22,7 +22,7 @@ clean-python:
>  	rm -rf py-smbus/build
> =20
>  install-python:
> -	$(DISTUTILS) install
> +	$(DISTUTILS) install --prefix=3D"$(PREFIX)"
> =20
>  all: all-python
> =20
> --=20
> 2.33.0

--2xQs5OTpsVeHrXE+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFX/68ACgkQFA3kzBSg
Kbb3YA//eaOOYlQb2e9Cs2zWkezYABKkdY57ySwFS3bvJckCWzK7RegH5J5UdUy1
W/2TNNzaBFJwxJ0E+Wp6wYoW5O/uht2dk6XsKjw1opeNTmSO2mlRiH6mw7hs0oYi
emCyvzpVxZ6zY4TM9SILXp6XeAFcguM1apNMCZoD9mjrqqt5vQx/HLDM6e2MtoaI
iMIS5XciD/5IzMidxAZab2FYjSiThlDcCLNgIOJcqlIrvgYXtnie6zKHa1AoX16Y
HFlAy69A/LW4/XxYqpFTszqYGxE0jUPrxy2Dn6Sf8ezF/I8npONNcFaTL18LPc2y
D99uN969XSSx+L4dbR5eIWDLKgg+T12ivcMv2cdmkBUFavshz7sarcr70lzWeuH/
adBQ3m0JkVS2jptChzC4rEEFcS6KZXFRV1wTgfG4aLv3cR2MtuMnrLdhKBjZcb6F
JmSLYzb7vSyKYetngcyeW8nySvHU6WjCR5LPH1+1BKtyIjlw4yTWYR3+TLKfqizU
ccP17ZXE7sZQpEbNyRbRpAQwn8Yo8vh4NGzBBEIP6+9uMRoH6LsYDWiQnMuYxv1i
WBItp7ARzDnoaEOce2tm491fHbvim0LfZ7wwjvEGA/ikC0Rnw1n1jVoyBskH9viP
8XPpctFc5cwJKNCFg49U3aqtliqW7/oewohaDdkjJgwCguwxEIw=
=7xfD
-----END PGP SIGNATURE-----

--2xQs5OTpsVeHrXE+--
