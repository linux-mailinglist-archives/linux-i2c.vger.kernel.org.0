Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 769C97CD2D
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2019 21:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729767AbfGaTvz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Jul 2019 15:51:55 -0400
Received: from sauhun.de ([88.99.104.3]:44688 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbfGaTvy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Jul 2019 15:51:54 -0400
Received: from localhost (p54B33080.dip0.t-ipconnect.de [84.179.48.128])
        by pokefinder.org (Postfix) with ESMTPSA id 886182C270A;
        Wed, 31 Jul 2019 21:51:52 +0200 (CEST)
Date:   Wed, 31 Jul 2019 21:51:52 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/6] media: i2c: s5c73m3: Convert to new i2c device
 probe()
Message-ID: <20190731195152.GF4084@kunai>
References: <20190710215149.9208-1-kieran.bingham+renesas@ideasonboard.com>
 <20190710215149.9208-5-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nYySOmuH/HDX6pKp"
Content-Disposition: inline
In-Reply-To: <20190710215149.9208-5-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nYySOmuH/HDX6pKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 10:51:47PM +0100, Kieran Bingham wrote:
> The I2C core framework provides a simplified probe framework from commit
> b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type").
>=20
> This driver does not utilise the i2c_device_id table in the probe, so we =
can
> easily convert it to utilise the simplfied i2c driver registration.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--nYySOmuH/HDX6pKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1B8VgACgkQFA3kzBSg
KbYkjBAApm8A1oTmg0zcZeR+bR6F/u5a0Gx5GjCOwpA/2F5cxcJ7KmycAb0Q4Aif
bwH9aWb3mINhKfwVjVl4/WnUeL+CiLbfONh2iVURAMXgRarPKGeDkEHpTA8W0fra
PJdJ0XgaotEyVrY3kUyOHtkMfVz6UUrWErfx3fNK2vtwVSB1Yn12xwraHspdX8h6
2FYRpvlcY+nSU9UJ8a9IJpf4W/O4xLGiZ9uj0LSFZk3bC/UOuCIEHz5u8+Lnz7+f
aPJDCsis5mGEVOYDt9+VmP0F1TDJVuJGL7+jjb3EVxBJv6Z7tJdjHkttZnx+CxQh
VCR4fq2a98Fjgb1NtSrwJQXv8gKBBeE8nL2Q6xZw+jQPvlg3wq0RdVBZ//Tj1HEc
rmdFOdRhbSZC7JxRZj0YADuJjx+GcvbC+4PVnWa6ag4vACiXQxR3xgYA4Qnw+GfO
IF+A/bm5HF6Z18ZJrwsaNcHbt6TroASRB4gnnNN3x90MUjNHwhctF+c/ckKWTOXr
S4ee9VBoKrbkwzi/Q2laSBGy+lO9dP3f4Hasl4taypQpnQUeXU2j6cBR0mgcTxby
Vm+m5ZVATNZ/NiKAy6TAOO3fk3jfdIXNdheOjy8dBwfOlkvZP1Kp9edFTWxyZWEs
RMBcpTBP6Noe7hDlf0eDeXFsbpfaIk4TWbIYMUEFqeCClkQlS/8=
=1BnI
-----END PGP SIGNATURE-----

--nYySOmuH/HDX6pKp--
