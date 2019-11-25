Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6D0E1090F6
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 16:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbfKYPYO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 10:24:14 -0500
Received: from sauhun.de ([88.99.104.3]:55338 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727785AbfKYPYO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 Nov 2019 10:24:14 -0500
Received: from localhost (x4e37056e.dyn.telefonica.de [78.55.5.110])
        by pokefinder.org (Postfix) with ESMTPSA id 37F072C0456;
        Mon, 25 Nov 2019 16:24:12 +0100 (CET)
Date:   Mon, 25 Nov 2019 16:24:11 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Corey Minyard <cminyard@mvista.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] i2c: i2c-smbus: Don't filter out duplicate alerts
Message-ID: <20191125152411.GF2412@kunai>
References: <20191121101051.71859534@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OzxllxdKGCiKxUZM"
Content-Disposition: inline
In-Reply-To: <20191121101051.71859534@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OzxllxdKGCiKxUZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 10:10:51AM +0100, Jean Delvare wrote:
> From: Corey Minyard <cminyard@mvista.com>
>=20
> Getting the same alert twice in a row is legal and normal,
> especially on a fast device (like running in qemu).  Kind of
> like interrupts.  So don't report duplicate alerts, and deliver
> them normally.
>=20
> [JD: Fixed subject]
>=20
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next (i.e. for 5.5.), thanks!


--OzxllxdKGCiKxUZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3b8hcACgkQFA3kzBSg
KbYE9Q//RLcePPIpVwA0Bj4DjDHBf4iZ/hw0se/VSrmUc4odacoKrGVLxzhl8HHS
rL04+lvyGlAk2JejS5KAXlbkWMeKBbuDhYWPs3BwEP8n+bLcIJ9kV5L7qWqTFLiN
LWtX3kSKjH5DA/3xqbJKbkdr92PZLUU0dGPsZjZ/T2IP9XNl4pwjA84It+7BOGyd
JEK39OjhSRdx5mnyp9p6R2tvcmT0jqdJKCpW8wHPNqV8HXIhVBAuifTGUO2SxhbI
KrHwzrJ0AQlAaWhESQRmU/3D6oAS5BPNsOyem9p2EaCHo66wpcoDeUmT5Le+QhGO
AiateRr6wxRhfzrUGryq1CGRMmbqXiSF2v7u/7hnNLzssv6If+u/PsySG0VzT4hT
PZuOsfKCxh8BkmbepjDwuYpOuqFCLct5ht0hYx95YdywL26/kQuhvcg5ylWYtKA/
qpBJOrVCTigR5utvTEjIW6FKCwWqB6kI157s24CujvEKI00IJf4rVHIcd/42hTP3
yfbR79xDDBy07mOnaHfjkyA1cFLQoheso3M/M5R1ZYeMS6DYLMxreItH2+8faOoy
4yuDUA2fRIDnu9ZuvD/ftL+Pv0ayT6lNKjWJzluVjuNux8vhuWQ14FGWSKgy8TEv
cdXikMAEeJa05pvmkaxUuduVPiXBrmyPD7g/v2Wg0sSDDuZElUQ=
=kEOZ
-----END PGP SIGNATURE-----

--OzxllxdKGCiKxUZM--
