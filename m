Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7CF25196E
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 15:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgHYNVA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 09:21:00 -0400
Received: from sauhun.de ([88.99.104.3]:47834 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgHYNU7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 09:20:59 -0400
Received: from localhost (p54b33ab6.dip0.t-ipconnect.de [84.179.58.182])
        by pokefinder.org (Postfix) with ESMTPSA id B33FD2C04D5;
        Tue, 25 Aug 2020 15:20:56 +0200 (CEST)
Date:   Tue, 25 Aug 2020 15:20:48 +0200
From:   wsa@the-dreams.de
To:     Jaakko Laine <ext-jaakko.laine@vaisala.com>
Cc:     shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] i2c: xiic: Change code alignment to 1 space only
Message-ID: <20200825132048.GA991@kunai>
Mail-Followup-To: wsa@the-dreams.de,
        Jaakko Laine <ext-jaakko.laine@vaisala.com>,
        shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
References: <20200820100241.96866-1-ext-jaakko.laine@vaisala.com>
 <20200820100241.96866-2-ext-jaakko.laine@vaisala.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <20200820100241.96866-2-ext-jaakko.laine@vaisala.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2020 at 01:02:40PM +0300, Jaakko Laine wrote:
> Alignment removed and replaced with 1 space only for to
> reduce need for future alignment changes affecting multiple
> lines, when new variables are added.
>=20
> Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>

I like it. Still, giving Michal and others time to review.


--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9FECwACgkQFA3kzBSg
KbYrExAAl9P4Wk73Ca0KQfvvUMC3cl0BYpCcZPCd3Y6sqjD5zAaNq19/FNl4d+BT
US67pgGrrNxRqvYxHsId/1AS0B9usMijTUGEe/INQRLsjzOpoImEGdccQjhMRqm3
j+F6UrUqt9czwortaLppCiZSZ0hsYvedTSyXE2X8qag2FH+mHB+q3Zaj0r2PYzhQ
AhY8zBg32xco7EfhIPAz5t46VfvWRj8aqyFF4CAfjK9JxaE/eAHMPk/DVz04NOax
EN7SQDi5NVwxq41FquOl93ouAFMHCNMAJR8Eyi53/W5BN+GNOZLatr54+1h92fyK
kcf55yPfYWQOJQ+7Qf5V4kMjYXEG8x7s9VrgRKgHwkiuA/vqX8kq9oDlH7w0ieAl
76B2TXdWChVluM+ZRHoJZ8WXH4fLdfiKq5O9e7YO/MR9GHGjMSYM3eHGk0s9vYL/
qP+Zr0ZM9pg9S5rq3i87/GQbokgBBIepB5CdX+lAfVIZtTzKv6UJYg/KZB5RienF
nLsEZ+ePReiH/CdYLnbCHJUuu4U0TcwLk9i52AQJbQhFyt1L+oJodbYexCHZ1nHM
LlrUjZOk7mNy19ZtFSB6R3T7x3LP++X9YWLgIFlJtAeWR+5fjKYQeq/qgEmkLnjr
YDLC4S1Mdk4LqeFwEQwj2TB2kdLIL5Fiw+mvbHC5VRb+d+hmFiU=
=nmC4
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
