Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8EE43EF3B8
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 22:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235427AbhHQURh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 16:17:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:55996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236667AbhHQUQe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 16:16:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 662C5604D7;
        Tue, 17 Aug 2021 20:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629231361;
        bh=zorILhuwtRkohjMOqNyXe5oAg912sxgecgWxKPMvrNE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mcHQOCAaJRerngHd7sE14smkHooCYhmEwL8S/YmGVzwFA+G8FMYHxvzAYyg2QjcgD
         4YoWWn8r8OxktPb4J+0KbPDdhHpu3L24jDamd0ya2tkHk5hL9POww6XdFLauDDyh1V
         ffUlkvEYnDk/mDh2hJk8jW0x51FY/uNtpPW+tD95ouTjVqbRSRsVeM5x7oZcfBfBLl
         swciMwPq9ArzSPvM3qbpqaFrjEj97qswHxBpFL0oBTTWNIHQG9AygOHJls6IJu/nsF
         tRxt7quU81oOeuPY5YA5mCYRCm3Kof2O3UIiwPgD1Y0A1+YsXOz5/wWd7bsKmq5qf2
         RIaYPDBMD8nLA==
Date:   Tue, 17 Aug 2021 22:15:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 1/9] i2c: i801: Improve disabling runtime pm
Message-ID: <YRwY/q2y3eIjc/nr@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <10690555-2317-4916-70b8-870708858f9b@gmail.com>
 <YRPvtPid3EeMylSr@smile.fi.intel.com>
 <3f225422-b343-eaef-0a95-9d15a5a378f2@gmail.com>
 <YRTubuupevq0JMbW@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Oh3rbV91mSa3/9M1"
Content-Disposition: inline
In-Reply-To: <YRTubuupevq0JMbW@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Oh3rbV91mSa3/9M1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > I dunno if it's being discussed, but with this you effectively allow =
user to
> > > override the setting. It may screw things up AFAIU the comment above.
> > >=20
> > No, this hasn't been discussed. At least not now. Thanks for the hint.
> > This attribute is writable for the root user, so we could argue that
> > the root user has several options to break the system anyway.
>=20
> But it will mean the side effect on this driver and typical (root-run) sy=
stem
> application (systemd like?) should care now the knowledge about this
> side-effect. I do not think it is desired behaviour. But I'm not a mainta=
iner
> and I commented here just to make everybody understand the consequences o=
f the
> change.

Jean, are you still fine with this patch then?


--Oh3rbV91mSa3/9M1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcGP4ACgkQFA3kzBSg
KbZcMA/7BdswlFwh3SCJTr4CozNzN54iQY/MCjperEwvmhNf60mGouu52OjTq1iR
1UqcBJEMPmOmHI//nifOD98TDtFp8v9c8pit0VcUR85rUp3Qu7nNi7TpU88kOWo/
/bbMv+4PKFYVpTYHOyO3eTipkp1QuBXw7aLDEKhlLJmS+F7McgdEN5rQrI2vfoBP
z5HFEWcHnpvegq79o3tQA+oM3IPX6l+heUZnFiK+EwPgfzJAXMVacih0goh27PTo
rPc1mrcHU3iFrCZoLW+PpHgKZAkTf4vYK8y3ftmhUD1YzorPN38tGm0Nj+3wW984
97mSKT4p+OrZWAdGGnRxakNUCaAaTQt5bFcJ8fRaiw0nNY4hAX3B3HeWuXMC+Uml
qqQC/D5KtSZnc6QdqR91BLG/+As91qLySN8E3tyCfHzNlEm2LryJNNASdPl3gyfV
Kx1B0pLd+oWGscjue1dhwKIxtlvj9/YylnwR226oGydbYj/sWFLJZIF+gijzHq+w
/jYGKR/98flY1PQVQdyzsIuEJ/y/O7venm/uzGOTq1iCc0Ibc6aA7dSA6Sph2K3g
lMiJYTvKVCAtvautNmr3g0JoXpXhBmGqvYR0o2pb5lpJxh1i9hS7+vicBjy6D14X
6O09MX/igfyWgYBLwB1zDG/Oh4Zgvz4nKU7jSNAlXq53Alo3PYg=
=lAQl
-----END PGP SIGNATURE-----

--Oh3rbV91mSa3/9M1--
