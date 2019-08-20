Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8526A95CA7
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 12:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbfHTKxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Aug 2019 06:53:31 -0400
Received: from sauhun.de ([88.99.104.3]:35204 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729194AbfHTKxb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 20 Aug 2019 06:53:31 -0400
Received: from localhost (p54B333DC.dip0.t-ipconnect.de [84.179.51.220])
        by pokefinder.org (Postfix) with ESMTPSA id 474EB2C3014;
        Tue, 20 Aug 2019 12:53:29 +0200 (CEST)
Date:   Tue, 20 Aug 2019 12:53:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     acooks@rationali.st, Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        platypus-sw@opengear.com, "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: Re: [PATCH v5 0/3] Enable ACPI-defined peripherals on i2c-piix4 SMBus
Message-ID: <20190820105328.GD1007@ninjato>
References: <20190802145109.38dd4045@endymion>
 <b013c33b-da11-ce5e-08d4-0b24a8575109@metux.net>
 <db725a3b-7b6e-ac79-ef1c-e601ff45c0f2@rationali.st>
 <9019cce9-837f-97fc-0f3b-7503b8fc3717@metux.net>
 <20190819185334.GA9762@kunai>
 <82cd0682-91db-6afd-855c-2c2f4b329eda@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Content-Disposition: inline
In-Reply-To: <82cd0682-91db-6afd-855c-2c2f4b329eda@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Yes, I'm struggling to find out which devices are connected to the
> smbus, in case there're some already inside the SoC (instead of just
> entirely board specific).

I see.

>=20
> > but you are okay with Jean's patches? Or is this
> > discussion affecting patch 3? (/me knows not much about ACPI'n'stuff)
>=20
> I'm fine with them, just wondered whether BIOS needs to add some extra
> support for the probing, that is not already somehow coming w/ aegesa.

Ok, thanks for the heads up.

> Unfortunately, we cannot rely on board vendors to do that right and
> cope w/ old and incomplete firmware. (that's also the reason why I'm
> *not* using acpi gpio entries for the apu2+ board family).

Guess we all have been there :/ Good luck!


--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1b0SgACgkQFA3kzBSg
KbYnNg//TrGo0SAPX4AcR+zMkPXjXWcOskXX4skdPLgQb8ZujAxnlicBnD4szHRq
J6tfWgGZ3izUbPXfgpK33UgwO7y9Ml6SCz81XVkuanOklUw6rFtPmS9TRwlnmUSD
B9ih1Q/grImlCzv5P12NxYpUJvHVfEQubwDM+qguXgNJPwmI4fwWKI/lGUvfKEVm
jOVivjA7xjKf9KdjwzD3m6zYLTQ6kQss4y4CL0X+mWX+5FztMOeqeXl1Q0Bbb8OA
1CYonNRV5l2QwFTsIPNkjL0wGhjnA22GzHGq3D1GhJKlhN5X1TCQMlpjd1Nr0qtw
5LoOma/JXhunXcsDbBe9RpZUklQl2s7JVFUa57eaA5PKCr6098k1anlRAwXoS51S
BceA+e2okENXJfHjFLU/+lTGrYJhDW7vsCD2XweT3m6WzYAFT4jcuDyBcTkupipE
SnNLp4+lgk91T/t2C3+ctdfWYVPF0ofjKxeE6tpqFzlGICgmJGsyg0kl3+DTFWzo
rLSH21MgRx6ie7MWxMsuSKLfzoArTkYSoE+ZU/j/AX0zouy3/EtaunVZShNxeOBv
q2H5BmYbBt1Xd+f4mARI9Mvlbz3hYsi5Nz7vOi4P8uN80jU/QjCCCvETk6KMBQvJ
WyXzzAEjIODUhpaq1o6wqRjuKdWUv1K3DtEVLdLdIg7UqbhZMAY=
=xMp7
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--
