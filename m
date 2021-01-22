Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEEDA30033B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jan 2021 13:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbhAVJZ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jan 2021 04:25:27 -0500
Received: from www.zeus03.de ([194.117.254.33]:50342 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727320AbhAVJKH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Jan 2021 04:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=yYGvRI5vU3fWCM5zTsEM9UPJW0uU
        gsJKQhaglDaenrM=; b=kJqgN858MMfySUKcQZaPyYhlmhOPyH0C5Fa4MrjCB99y
        GEgZH833rd0HaPgDTAtvOR789ZFd5DCNOz3s8WzRbxkxhuI6ZxwuEug3uvIMZKYt
        Fcx84FSTMSAsvty5YUZIfvL3rvuIgSqbA+q7ELlR1Z21PYH3ja1PtSxVS/w6FTo=
Received: (qmail 2271039 invoked from network); 22 Jan 2021 10:02:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jan 2021 10:02:34 +0100
X-UD-Smtp-Session: l3s3148p1@Itjzcnm5iOkgAwDPXwqqAP3nWBA3ETDu
Date:   Fri, 22 Jan 2021 10:02:34 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/8] i2c: improve RECV_LEN documentation & usage
Message-ID: <20210122090234.GE858@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mR8QP4gmHujQHb1c"
Content-Disposition: inline
In-Reply-To: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mR8QP4gmHujQHb1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 09, 2021 at 01:43:04PM +0100, Wolfram Sang wrote:
> Because I want to clarify I2C_M_RECV len usage, this series updates the
> documentation and some of its users. Patch 1 refactors the whole
> documentation of 'i2c_msg', so all usage of I2C_M_* flags and their
> conditions hopefully become clearer. Patch 2+3 remove some obvious
> boilerplate in the UAPI headers while here. Patch 4 is a driver fix I
> found while working on this series. Patch 5 introduces a new convenience
> macro to enable SMBus transfers which need I2C_M_RECV_LEN. Then, some
> drivers use the new macro, sometimes to remove boilerplate, sometimes
> because these SMBus transfers have been forgotten before.
>=20
> This series is the first part of a larger work to extend I2C_M_RECV_LEN
> to allow larger transfer sizes (as specified in the SMBus 3.0 standard)
> and to enable this on Renesas R-Car hardware.
>=20
> Looking forward to comments and/or reviews; the driver patches are only
> build-tested.
>=20
> Happy hacking,
>=20
>    Wolfram
>=20
>=20
> Wolfram Sang (8):
>   i2c: refactor documentation of struct i2c_msg
>   i2c: remove licence boilerplate from main UAPI header
>   i2c: remove licence boilerplate from i2c-dev UAPI header
>   i2c: octeon: check correct size of maximum RECV_LEN packet
>   i2c: uapi: add macro to describe support for all SMBus transfers
>   i2c: algo: bit: use new macro to specifiy capabilities
>   i2c: qup: advertise SMBus transfers using RECV_LEN
>   i2c: s3c2410: advertise SMBus transfers using RECV_LEN
>=20
>  drivers/i2c/algos/i2c-algo-bit.c     |   4 +-
>  drivers/i2c/busses/i2c-octeon-core.c |   2 +-
>  drivers/i2c/busses/i2c-qup.c         |   2 +-
>  drivers/i2c/busses/i2c-s3c2410.c     |   2 +-

Applied to for-next, thanks!


--mR8QP4gmHujQHb1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAKlKoACgkQFA3kzBSg
KbadmxAAgAsFpg45B6cfikhrtCMoQ9WUcg8TTipybmy33IOSiLZCrJ8DpzxkuWr4
P4AirjpXtJuE/ibNXHGYhBr1AeXqL4jkKjkYkgNvXhvb77XEGwOThF/AVCOUS2Gf
r0mgLfwF0zs1DTPtFKhX6yrANTmjriMY5uyAaBCIgd5zmo72cH2k8ozasBwQztrc
rt39OTTt8ZDJonrCfVLUoj6p2YyuYQUNkBDtbQG/v/jxTw2G7CJErFUUXiu7W4R2
kIJh5pH/aK5NqrUAGS86hmDUoIM6XXyIU5ddtLVBySB558yIWXZ9lgXKnvsw1JGs
CyyV7x5almZQCSM8jVzSyz8aYpxJluACdJ4cdPojFODwG88cblfime/6olQGDWRF
cG1LYLFyPpWYQjHi2LMX3YojJZBPFSFhOJF1hM8NjZpqEpS+9ZBWgy3uB+plXcUB
Hlg9g0RrfufrDAzEomzASaQpYkbCxk6OAyXE50QieOJc5K6mYCSdANrdcQDgdTFR
q6bv0MaG0xKbbRmTX7idzpstAvdj5mh0aPC13WVY0P5W8qRTsuY8j8splZffaOad
4vcC3CWlHz/vfisQnCt4TwzqYYI4K0jYW7N+giOW9drP/hstaZXqFwYZnlo53ZV3
XoisBWQA9qkTrhbvQA+b7E7NJzm4q8ZX+xfi20VlaVZgxg4voEY=
=H1I2
-----END PGP SIGNATURE-----

--mR8QP4gmHujQHb1c--
