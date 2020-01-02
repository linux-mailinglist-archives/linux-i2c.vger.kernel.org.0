Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5F3C12EB0C
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2020 22:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgABVNa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jan 2020 16:13:30 -0500
Received: from sauhun.de ([88.99.104.3]:50000 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgABVNa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Jan 2020 16:13:30 -0500
Received: from localhost (x4dbfb270.dyn.telefonica.de [77.191.178.112])
        by pokefinder.org (Postfix) with ESMTPSA id 0694E2C0162;
        Thu,  2 Jan 2020 22:13:27 +0100 (CET)
Date:   Thu, 2 Jan 2020 22:13:27 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200102211327.GB1030@kunai>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline
In-Reply-To: <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Luca,

> > This looks quite inefficient, especially if the beginning of the range
> > is populated with devices. Furthermore, I think there's a high risk of
> > false negatives, as acquiring a free address and reprogramming the
> > client to make use of it are separate operations.
>=20
> Right. Applying the alias could raise other errors, thus one would need
> i2c_new_alias_device() to keep the alias locked until programming it has
> either failed or has been successfully programmed.

Please see my reply to Laurent, I don't think it is racy. But please
elaborate if you think I am wrong.

> > What happened to the idea of reporting busy address ranges in the
> > firmware (DT, ACPI, ...) ?
>=20
> Indeed that's how I remember it as well, and I'm a bit suspicious about
> sending out probe messages that might have side effects (even if the
> false negative issue mentioned by Laurent were solved). You know, I've
> been taught to "expect the worse" :) so I'd like to better understand
> what are the strong reasons in favor of probing, as well as the
> potential side effects.

As I said to Laurent, too, I think the risk that a bus is not fully
described is higher than a device which does not respond to a read_byte.
In both cases, we would wrongly use an address in use.

Also, all the best for you in 2020!

   Wolfram


--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4OXPcACgkQFA3kzBSg
KbZxRw//YHEcEWbTuhwt3Cq3XI305L3vMkgMBmKl6YIPwJkASlA+JsKFJeskatPx
4vzx3BemXe29Mt+GcQ6J8Isi3d8dqB5u+gsZlR8/2jL08hFmB++bnGqWHYzzyFye
ppXYuX9xhXNzEnK2Bd24SoguRATKifW++ZySwTPFoqKy4rJ4hE2tijBkJ8uPlKsP
nudkVwDxuFEH4DcIh9n/XeRYy95dFuqpM70FYWSqSYEyjMeT4OpNHb7hb6pusTqZ
qklOxZc8wLf35I4GrBDMs9OUtFzobPRRDmOzBYmkAN7MGkPLSfohpvYvWKhlUi3T
X1RIb7+m3Jp1lPgo4ZIbAWzYFzZdHv9EWNZNKkwioNRFKJQ/D4tnKwBKxGRSXqhQ
Fbf9mdBj+XO5ZwsN3Mz8vzHwwYUFerGKpe07u2GJ4hegoA36ZfC6AAg890W6oVQA
SUHq/Z8HwDyEd8MKOu7B49PrywEJVu+bg9tgDgAMOsLxsaKo+OcOkAavaT2ITCAO
sT/cb978WChsE7aE3cn6tLL4BLgOIWYyuK73y8WPFZdO9t4jCURhsPFKpJQdcwOb
Xs8peXBcTp0npcN9YX7tjdTwpJ2UjIGNsgcMARzfyGfCfSBIU4nWB8TTA4maAqF0
AWNyts+QzOXOewoTX1CRTDrH/kVAI4LYPw66NIqIZ8ExDbtNy74=
=Cy7J
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
