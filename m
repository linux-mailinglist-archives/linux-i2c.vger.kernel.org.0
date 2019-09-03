Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54AECA71E6
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 19:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbfICRoC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 13:44:02 -0400
Received: from sauhun.de ([88.99.104.3]:56198 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727352AbfICRoC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 13:44:02 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id 585D02C4F2F;
        Tue,  3 Sep 2019 19:44:00 +0200 (CEST)
Date:   Tue, 3 Sep 2019 19:44:00 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>
Subject: Re: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
Message-ID: <20190903174359.GB2171@ninjato>
References: <1567497091-18270-1-git-send-email-bjorn.ardo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline
In-Reply-To: <1567497091-18270-1-git-send-email-bjorn.ardo@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bj=C3=B6rn,

please add versioning to your patch updates. git-format-patch makes it
easy using the '-v' parameter.


On Tue, Sep 03, 2019 at 09:51:31AM +0200, Bj=C3=B6rn Ard=C3=B6 wrote:
> Add a 32 and a 64 kbit memory. These needs 16 bit address
> so added support for that as well.
>=20
> Signed-off-by: Bj=C3=B6rn Ard=C3=B6 <bjorn.ardo@axis.com>
> ---

And also please provide a short changelog here. What did you change
since last version. There are so many patches, I can't remember every
patch.

> @@ -19,14 +20,21 @@
>  #include <linux/spinlock.h>
>  #include <linux/sysfs.h>
> =20
> +

Unrelated change. If you use 'checkpatch --strict', it will warn about
it.

> +		if (eeprom->idx_write_cnt < eeprom->num_address_bytes) {
> +			if (eeprom->idx_write_cnt =3D=3D 0)
> +				eeprom->buffer_idx =3D 0;

Yes, I think the code is nicely readable now.

Rest of the code looks good!

Did you have a chance to test the real EEPROM yet (not mandatory for the
acceptance of this patch, of course)

Happy hacking,

   Wolfram


--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1upl8ACgkQFA3kzBSg
KbbqIg//YPfTUH3earsDU/RdsHjRTG6HQ92lbV2SmoW+V9G/BKdg75aWbSlwAuqY
cClvMBRsfyaUZpB/XwMtEjyRYwpi47aczFX5lHLinytt4dvEb+6+6qM1DmjfqJYe
4zy1dRXX1eUg/98v5koWhkSCbozOMfJNz/Q1VmSbbz5Pxx5eEpTfW39P6DBIu/V+
Z4m7pY0cmF18q1tEp9uvtiF7FVc2iU86cQPpSyEt/J9Rh9B/1gcyWiOqpGMBp/gE
evP3QKwRy/yc3yayJkMRiahYN6P2SCuUnBxTjAazcE3Tv9GXj/srhsWf4A4dBTSJ
R8UVy8wcVB7gWnWHvZRaFRGX8Cx87Xwq873QDa32Fxa/oX9bb9T2YDfyI0OvEeZO
mjpFJeqLg1yX2TldZGLlpFKY1/kUEx9bTWMmVaOnE2raT20Yh/wNq9GPkYTlX4sM
Sz6yWs6a6+l50l1VzGX9k6ln+S97bEAf2FTFCPRHMzjJ1nVm8rjKczhG2yt3bg4c
PqwL2kvk8MLUGyqtyMCLn9eilVg5HL/CzxGqZNN/NR9x3I2maBPrsw4PZKy3IIRK
OkfUrP+0o3wWLnHwiW51MaqpxVoX52Sa7At73O6a4uaki3DLsJ7nKWfaFRDNWpBx
sCpxY00xGPjNXWcBL1Pi1SIl6aOgFnJtgIke43hdCtw4yNk43Ac=
=Ry4X
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
