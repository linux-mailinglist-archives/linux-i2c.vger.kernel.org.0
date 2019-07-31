Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A287CD32
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2019 21:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbfGaTwE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Jul 2019 15:52:04 -0400
Received: from sauhun.de ([88.99.104.3]:44698 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbfGaTwD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Jul 2019 15:52:03 -0400
Received: from localhost (p54B33080.dip0.t-ipconnect.de [84.179.48.128])
        by pokefinder.org (Postfix) with ESMTPSA id 92D132C270A;
        Wed, 31 Jul 2019 21:52:01 +0200 (CEST)
Date:   Wed, 31 Jul 2019 21:52:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/6] media: i2c: et8ek8: Convert to new i2c device probe()
Message-ID: <20190731195201.GG4084@kunai>
References: <20190710215149.9208-1-kieran.bingham+renesas@ideasonboard.com>
 <20190710215149.9208-6-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nhYGnrYv1PEJ5gA2"
Content-Disposition: inline
In-Reply-To: <20190710215149.9208-6-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nhYGnrYv1PEJ5gA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 10:51:48PM +0100, Kieran Bingham wrote:
> The I2C core framework provides a simplified probe framework from commit
> b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type").
>=20
> This driver does not utilise the i2c_device_id table in the probe, so we =
can
> easily convert it to utilise the simplfied i2c driver registration.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--nhYGnrYv1PEJ5gA2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1B8WAACgkQFA3kzBSg
KbZUMg/6ApPbOXJgDgIRASqwrwy9gszjWtFGNPvfSId63qWlww4WvLxGqgmSmKdX
49vFU4v0VrT9/Kb6vUENQPLc0l4le6u8wXfTEERusn6uvvn4BIRrwt3KenFiVi4J
z9TbdJ8V2R+vLFEHxUOS50tyQ/lEIbggL4YXZz9Wiv+37UwSaPZffFHFYjBOgmtC
rSLxbWGqmsJEX2WowwGupsfjQ7yOjV0CHjXt2AYCXbcDxze5hQzgHQiINg+I2yPb
00K1uPhQLiKVmcVdfmNOcKG07t6lVIpREh7a+PjNaSlGfs+JR4GYA1cX6vldyhka
JAQOALPUJTavxKUndw9H6RWsjtIvGgwAXcWMyo34uKrqqBMlGGL+dkzCf389XsSy
dKyGew9Up6DEpT1ETKbkg0vvRPyzUqhCDlQwFk0DIstdHaeBSfim2aZ9GOrqK0oI
2ucajuGTFIPfostJpPnWtJ1OTDPQwNW9KvPeDy5SxUopTER0F65VUvV2CTRL1z0d
kJpd2wEeQwMIRlEYTObts8q8qicvcXiOcC6ASAnY6NhLXFET98hRh/vtGG/8xQhU
/sUG8OH4SPCkBclRGucBmdb49GBhd7DzEscr4rCc9Nx6M8pz2nTqnXFAaIEKSqwg
Pm0WmWwKJ+VkrLIAia8uW14A+GTwy1tdV+dAo5Gk4wEw69SJeoM=
=MzYO
-----END PGP SIGNATURE-----

--nhYGnrYv1PEJ5gA2--
