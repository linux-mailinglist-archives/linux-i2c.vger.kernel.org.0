Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC79F36135A
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 22:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235245AbhDOUNz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 16:13:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:36964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235169AbhDOUNy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 16:13:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5311D6102A;
        Thu, 15 Apr 2021 20:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618517611;
        bh=94WZR1LHxahR8QKXAmKrFgoKjdP49hcJPqTuA3CfEAA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dVXIDgpVyKsk63P9FDIRwXbdJAKp/E5W0zdiNWxAM7ACNomOIsmVnbtwjxesJGOzQ
         vhorok07zcJoOsGe8OW/TyMzCn7V3EnMu4nH5diFcqh4D94/jv37ZW7fEi+ofnEG0J
         ysSDEmAmQam5YrmooBHY+V0Fjytzl47wzDSi62OW6hZWEtcSaMcYKhM0EiAW3NHG+e
         hJTRyOm21I4PE4/1P5O3c19Ew7S5vt9LX1BIJM39wSQm5aCHJfpsRUMA3OSmdRKZUJ
         anVZEdinqaRhWaC6LMLnoUb+uVQG9AHgGW0R5RiEinrXImu9lzQkitklhfcIfn7U2v
         XlF0U3hUxC1Pw==
Date:   Thu, 15 Apr 2021 22:13:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH] i2c: mv64xxx: Fix random system lock caused by runtime PM
Message-ID: <20210415201327.GD2360@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-i2c@vger.kernel.org,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>
References: <20210408020000.21914-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Content-Disposition: inline
In-Reply-To: <20210408020000.21914-1-kabel@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 04:00:00AM +0200, Marek Beh=C3=BAn wrote:
> I noticed a weird bug with this driver on Marvell CN9130 Customer
> Reference Board.
>=20
> Sometime after boot, the system locks with the following message:
>  [104.071363] i2c i2c-0: mv64xxx: I2C bus locked, block: 1, time_left: 0
>=20
> The system does not respond afterwards, only warns about RCU stalls.
>=20
> This first appeared with commit e5c02cf54154 ("i2c: mv64xxx: Add runtime
> PM support").
>=20
> With further experimentation I discovered that adding a delay into
> mv64xxx_i2c_hw_init() fixes this issue. This function is called before
> every xfer, due to how runtime PM works in this driver. It seems that in
> order to work correctly, a delay is needed after the bus is reset in
> this function.
>=20
> Since there already is a known erratum with this controller needing a
> delay, I assume that this is just another place this needs to be
> applied. Therefore I apply the delay only if errata_delay is true.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

Applied to for-current, thanks!


--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB4nmcACgkQFA3kzBSg
KbbVLA//Q1Nk9/+tQcpibycDe3U7EQ+KusF4W2lpVst4/bGMLxpbqp0CEFv8XhWP
xpdjX8YUnq5vy0lXklt4HYtaGo7zRg92AGFLo5SSGw8DRnDp6+nVYMd68di/A/6G
k/0wYG2pZUqxAv8B3AiJeBl4XKbXlwuaxPL8tRJOgbecAh7BUGYMO4CEIP7daHLT
xSEVUntP66itg2n7l9MbSoT2yEN2HI0rTfDMDAWaYwBQWs7xh7Qd3zUyYsY2Miq+
H+OkcLTTfVik2s6boBW+UWa1A6CfnFPneBH4WNVs42BlfZM4yxVTXix6EJ0fxi5T
q1khpqPezDa+15rCAyPi6a2+1YLzZnA/AhP15yH3ppjWCuTApdok90ZRvyordPaL
a8cfPbEPxz93FjW59Cor0xXir2B3yPyrT/npQUlmDi6EXxNxtRcR+TTAVU3Yapnb
Sv2/c+yU9+bNPrB9X0Pa8hFZpAitRSm/owI8ctnPlqecG23hpkIR+lmjzC0FBQLu
M0NvP/c07fWCzsNd9uFg0nn07VrKxlyyXEkxOPdEB3Zo7iTn9GaQcG35LxUfWeP1
dzBrAhVKoAVB7PeMw6kSQz8C/W13gaW0vE9m/U4CrozaxU5FPCm4MbDd8/rxSt+i
OQCsXb5aYOnMikf+QVymVuTYHtdFFhKD2Xrx9H11SCjFNVvYWpI=
=FEu1
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--
