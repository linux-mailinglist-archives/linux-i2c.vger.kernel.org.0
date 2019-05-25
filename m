Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 419562A6DC
	for <lists+linux-i2c@lfdr.de>; Sat, 25 May 2019 21:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfEYT6z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 May 2019 15:58:55 -0400
Received: from sauhun.de ([88.99.104.3]:46558 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbfEYT6z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 May 2019 15:58:55 -0400
Received: from localhost (p5486CB33.dip0.t-ipconnect.de [84.134.203.51])
        by pokefinder.org (Postfix) with ESMTPSA id 2E7D22C016F;
        Sat, 25 May 2019 21:58:53 +0200 (CEST)
Date:   Sat, 25 May 2019 21:58:52 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v3 4/5] i2c: nvidia-gpu: resume ccgx i2c client
Message-ID: <20190525195852.GC12538@kunai>
References: <20190522183142.11061-1-ajayg@nvidia.com>
 <20190522183142.11061-5-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline
In-Reply-To: <20190522183142.11061-5-ajayg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 11:31:41AM -0700, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
>=20
> Cypress USB Type-C CCGx controller firmware version 3.1.10
> (which is being used in many NVIDIA GPU cards) has known issue of
> not triggering interrupt when a USB device is hot plugged to runtime
> resume the controller. If any GPU card gets latest kernel with runtime
> pm support but does not get latest fixed firmware then also it should
> continue to work and therefore a workaround is required to check for
> any connector change event
>=20
> The workaround is to request runtime resume of i2c client
> which is UCSI Cypress CCGx driver. CCG driver will call the ISR
> for any connector change event only if NVIDIA GPU has old
> CCG firmware with the known issue.
>=20
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>

Can't say if this is a valid workaround but here is my ack for modifying
the I2C realm:

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzpnnwACgkQFA3kzBSg
Kbb4xBAAr0Jk4qrB9mRCfyYB50te6dejjLWIrKpP/ZnQax2vXjNy0EvbdPGbcykN
a3btkeFJz96xUAEEWilTBznj2V6mgPO78h69s6+ZVgMY0ggC/43pY8cGZ5CAQqu6
M7sL5nox2ga/auhCshL5QZZNd0cHijtzYoMnRA+iJKr5PkqPVNMxIGhLUPBmLPJ1
56Z3snzgfsOrRkOAjeKj8+/oPH1D+Tbu1kVmOHl5UGiQbzI3LN16bWepZZa4kMJ8
DGcAYFc2Nqm2XC8UeoekW0pqzT4HYGlwSbXRmZpSvEgE0ToA6p5hyZK2K8ZBzmkP
vEzX6Ma8JqzZzUJgeckxCr0osfdAUnLQaA/swZyKVrNBcU8my6ABFy64a+F591hZ
Ya+re6jfVWU68+fLBxBVXnQ4/GCUb6KoXv0b07UZCkTid/Nl/DMtdGX4YEpDu8ho
ZBNp6C7w7kb8UFxIDhbNvKxHVkCfVD9iMfkDet9lOlsAkVtYacDKcfSaAqDLKOWp
U8/hX+qfgxCq8uniwifC8/3tYpVi/uiFkqsj/MMdHq8B9VhtKZw+djybk4GF4AeB
XZ6JFWiqf3MkJ2GhkQ7w0lrBRxGtIi7WrtP5gcQ6aCYQ2eTSi4XTlCX3HY4D+WdH
ArGJHBZbEVwZgbLZJkRMwKd9wZrKwHbztLGUfQNmzhYbpdbaBIY=
=LmJF
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
