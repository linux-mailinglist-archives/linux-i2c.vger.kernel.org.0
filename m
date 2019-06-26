Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 083B756A24
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfFZNQQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:16:16 -0400
Received: from sauhun.de ([88.99.104.3]:55992 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbfFZNQQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:16:16 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id E4A753E607D;
        Wed, 26 Jun 2019 15:16:14 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:16:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Annaliese McDermond <nh6z@nh6z.net>
Cc:     eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com,
        swarren@wwwdotorg.org, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Subject: Re: [PATCH v2 2/2] i2c: bcm2835: Ensure clock exists when probing
Message-ID: <20190626131614.GE801@ninjato>
References: <20190621105250.19858-1-nh6z@nh6z.net>
 <20190621105250.19858-3-nh6z@nh6z.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline
In-Reply-To: <20190621105250.19858-3-nh6z@nh6z.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2019 at 03:52:50AM -0700, Annaliese McDermond wrote:
> Probe function fails to recognize that upstream clock actually
> doesn't yet exist because clock driver has not been initialized.
> Actually try to go get the clock and test for its existence
> before trying to set up a downstream clock based upon it.
>=20
> This fixes a bug that causes the i2c driver not to work with
> monolithic kernels.
>=20
> Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
>=20
> Signed-off-by: Annaliese McDermond <nh6z@nh6z.net>

Applied to for-next, thanks!


--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0TcB4ACgkQFA3kzBSg
Kbawow/+L5IabPpZdV/oJsEGm8QSPCLXmlOdMKHNRBtYDRf4pxOjuje2rxjnrj1U
yXvs48L/D9SgYjG3rBSjtIWe9QqcMF3pucXwos3JaJIG4SV7JPGqi0XH1U580qlM
wN0vbAaYxdAKadYMign2e/MBlcfmdi6qH79a7vez6WkfwhEt58zYc5HbKFWh4ULA
1TrzRlPJvz215mBzmw7fZzOi9wWRSwClt2/F7YUcWEpFvWZ+TZqq5pWRS2MGK8dH
mnpJyWlyR2hfmfxLzswdnaLEEa8H2tbMG+o6YZLhXAxN8jjC5evQi/aCFOyUyE+w
YIXNi00XY3KOJ0+wVCbqdfhYlC2q0lwuXe9lqUjmIDVeqtsahejEFdRtSO8qNTeV
LtQLpCnDBR15Ii/s++E7vSn1ANR20yQYcTjA4jVTUZmgNTsMfM+51+RiYQhqpn6e
9txSMKvhfjGTtzSo4Oqa+wTOaRWjc+5heksEqvtjrqE2VuRG8LOse8AzBER0ZHH4
YeZKR9PsZAdK+fup6m+21z5yNKHAb7PV3uuBz/7NxQocAFH9cHbDpfyM7B7oyIsI
YytbGb6IrJ35qVQahz1DW3EH/QVnWBIoBLSRCFWVJ8uHyzNK+U4zAdZB31fZCdZ+
ODi1HFSV084OxfDdd/T376QuJuvad2PFrf8xw3bHlYmA0JTrL84=
=nE+J
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--
