Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5BA39862
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 00:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730177AbfFGWQA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 18:16:00 -0400
Received: from sauhun.de ([88.99.104.3]:46426 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729127AbfFGWQA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 18:16:00 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id 95E123E43BA;
        Sat,  8 Jun 2019 00:15:58 +0200 (CEST)
Date:   Sat, 8 Jun 2019 00:15:58 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
        Steven Honeyman <stevenhoneyman@gmail.com>,
        Valdis.Kletnieks@vt.edu,
        Jochen Eisinger <jochen@penguin-breeder.org>,
        Gabriele Mazzotta <gabriele.mzt@gmail.com>,
        Andy Lutomirski <luto@kernel.org>, Mario_Limonciello@dell.com,
        Alex Hung <alex.hung@canonical.com>,
        Takashi Iwai <tiwai@suse.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5] i2c: i801: Register optional lis3lv02d I2C device on
 Dell machines
Message-ID: <20190607221558.GB869@kunai>
References: <20190606181845.14091-1-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline
In-Reply-To: <20190606181845.14091-1-pali.rohar@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 08:18:45PM +0200, Pali Roh=C3=A1r wrote:
> Dell platform team told us that some (DMI whitelisted) Dell Latitude
> machines have ST microelectronics accelerometer at I2C address 0x29.
>=20
> Presence of that ST microelectronics accelerometer is verified by existen=
ce
> of SMO88xx ACPI device which represent that accelerometer. Unfortunately
> ACPI device does not specify I2C address.
>=20
> This patch registers lis3lv02d device for selected Dell Latitude machines
> at I2C address 0x29 after detection. And for Dell Vostro V131 machine at
> I2C address 0x1d which was manually detected.
>=20
> Finally commit a7ae81952cda ("i2c: i801: Allow ACPI SystemIO OpRegion to
> conflict with PCI BAR") allowed to use i2c-i801 driver on Dell machines so
> lis3lv02d correctly initialize accelerometer.
>=20
> Tested on Dell Latitude E6440.
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>=20

Applied to for-next, thanks for keeping at it!


--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz64h4ACgkQFA3kzBSg
KbYD+g//aii1FojuiA4U0z0/JO99KdQT+W2HhcekFjKUQnnnsgLBw18QuP9AuaMC
NG9HPCOP5o+7Q4kp85NEEKtbtLjNavO7vnfKydPbijv/ekNapQ+ZghA85ZEKmdX2
b+D1vTQuHCcIueVJhJEnMCfWUo+MOKTyeXQL01piA8r8JvcQcbp3I9JWs4ul/ihN
ggNnS3uJreXwMyM/Aulbhj3Ql9CVYZuhOswSI1BnMEtPdN9j/Y27yceWUF6lB7jw
5QgBBmmFTvNTgQ2Rv7gZt+gr7jO+kYSkfMSXf0gMOzSFhjXsbHmSks7hNUuWVmkL
L6VB9Lg1Iyl0Km1atYD2q7nA/8WCQuE/8AyidUQV+HxvEebypCdlj3y+baT33nbr
VD16iosdzxGqNZpTalSzG/+QHvfrMQiem1tovZjhj/icW/o5khK53AGiLN1TFZVh
S/o9R1SqiV5eLrShMZJp9RJSsVvoFOw3HG8mWjTZltYLwwfefmmITGJ8TDsjH3oV
nyIQv2Ypo/6HCZGQ63x3TbK+OaQpdZJ1z3Rmbts6yKwJpE+nLPu6pZ0afFIYh39k
ur0RZbSnvjAtHLNgQ1nU/84T+O+Fxn7K1qw/KpLZJaQkQM/qpxTsYPJNwk1F718/
D30urkkl+PFQq68JZ3MU7wx3UxP+7V6wAd1B48Nvj9vFnPfif8E=
=Ntf9
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
