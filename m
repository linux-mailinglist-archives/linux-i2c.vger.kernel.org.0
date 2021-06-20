Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34B23AE07D
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 22:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFTU6f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 16:58:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229845AbhFTU6f (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 16:58:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7E5F60FD8;
        Sun, 20 Jun 2021 20:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624222582;
        bh=7JkHbkKiDCtK/Umx8fMmteeeI7kYXvj2Qq4PUm848qk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WGfU2W61vW7aDTbLaxz1BwW4gHdrrbFRC5KZAC+4HA2O41eMn6mYMfT7JuOz41cgd
         1zXGC0RO1r+e8XaYbHqOauVUjzFxYsNBt9Nkj5IbBx2NnOjwzrzmck1SKqiwJdJ88v
         vMk/fwBE4n42p7d/SgW3ZoHFi6BiwjoBzpKMgE+XXgrVDZ9Yd+Qs4z6tgKHcxZ+30w
         i+QPbLY0XME1fPy0EGC1gUCRYarYLc0998vcMEjSIp6SwxPvYNRxkpeoFBRWyI+37y
         /P8ZBKjgiNMEI9M4dJfjL9djLWe7XWmRp5WVRO0auKBAckkjan8nX+16wFzAoE9wKn
         ifGR9LGzrFdxA==
Date:   Sun, 20 Jun 2021 22:56:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Improve i801_setup_hstcfg
Message-ID: <YM+rci2DsswSLl5i@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <d5ec9de2-dd54-6ee2-a791-13ca510bcd43@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nHDjHHPKg8kD9b7v"
Content-Disposition: inline
In-Reply-To: <d5ec9de2-dd54-6ee2-a791-13ca510bcd43@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nHDjHHPKg8kD9b7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 10:07:17PM +0200, Heiner Kallweit wrote:
> i801_setup_hstcfg() leaves the bits in priv->original_hstcfg that
> we're interested in intact. Therefore we can remove the return value
> from the function and use priv->original_hstcfg directly.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--nHDjHHPKg8kD9b7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPq3IACgkQFA3kzBSg
KbaMNg/+KlmFaxca5NKF2STNZZU5F7SAiu2JibudxbXKAiNSBcYyTsYyt1P0/Y1d
v4Lsxa9T/48oJVFQZQUxurG2+Pv66qtc6R2rIoFHFWKNV39cpwnOvHnTGghSwZls
CDzX9GFnd6tZNSxG8FzcS1n5X+azNY/u5kfJwV7r994rCK3RVoGOqMpzy5bEpnMm
fkVOA90gyGqfjm8yD7YVLMqz6FFwafxuSlWMwNfC1BEcFczqW6+0hMeK17wsF1di
5UzIa3pEL42+gW+zueEp6jaUUgi4vrgqzYvkO9IwOeXV5rgAFU1gqKNeUWKZyOh8
LwGM+GgRbBB/x+1gTN4mEf1lSKVLIE6rtubphms+A6f+GndqbwfOPf3aeNf7AUlb
DKlA0EwpN2wX9E9VFO0eg9SMZvN+gLxod11bMSpVr4kEFz7U/MBE0vrSn48paRUT
KS3KcwpGMudi6++uJuJikr2okoNzzBzVK9N1zF2iSSwLNoiEgC+mAep7BaIlLtR4
JB34KKwjzLLOc7da4uSuMx5vJhS1HGFqF7QK/O2+57jHYtmD1EKx4sSoCVdyVtPy
0u7t5ubLiCEp7GUssflQYhDYjCJnjos1mpr/5jPoMaAOimJKeqTYuxMo6PPVgPij
vf8hBtt1EsuMPgvcVjc1UZWfPLl9GN02KblPO053Ytidi0Ri9ec=
=Zb2f
-----END PGP SIGNATURE-----

--nHDjHHPKg8kD9b7v--
