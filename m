Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF3AD1D49A2
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 11:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgEOJbx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 05:31:53 -0400
Received: from sauhun.de ([88.99.104.3]:33746 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbgEOJbx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 05:31:53 -0400
Received: from localhost (p5486CC07.dip0.t-ipconnect.de [84.134.204.7])
        by pokefinder.org (Postfix) with ESMTPSA id 1DAA72C1F6B;
        Fri, 15 May 2020 11:31:51 +0200 (CEST)
Date:   Fri, 15 May 2020 11:31:50 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     =?utf-8?Q?Adamski=2C_Krzysztof_=28Nokia_-_PL=2FWroc=C5=82aw=29?= 
        <krzysztof.adamski@nokia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: Two separate i2c transfers
Message-ID: <20200515093150.GD2077@ninjato>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
 <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
 <20200515075303.GA1083@ninjato>
 <820e15e2-9267-1bbb-0809-4e9dc19d566d@nokia.com>
 <20200515092042.GA2077@ninjato>
 <ec8ed2fb-710e-29c0-8c27-340de0bacfa6@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0/kgSOzhNoDC5T3a"
Content-Disposition: inline
In-Reply-To: <ec8ed2fb-710e-29c0-8c27-340de0bacfa6@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0/kgSOzhNoDC5T3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I was assuming that once you have the lock from the arbitrator you can
> > be sure that the other master is not active and, thus, you maybe don't
> > need to read the status register at all? But I am probably wrong here.
>=20
> You are right in that when you have the lock from the arbtrator, you
> lock the other master(s) out, but the issue here is that the mux code
> releases the arbitrator lock after each xfer. Krzysztof needs to do
> two xfers with the arbitrator lock held over both so that another
> master cannot sneak in and change the world view.

Yes. My probably wrong assumption was that the first part of the
transfer (reading a status reg) was only to check if another master has
started the device and is running some operation. So, if we could avoid
that this happens by proper locking of the arbitrator, you could either
skip the first part of the transaction or just send both in one go.


--0/kgSOzhNoDC5T3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6+YYYACgkQFA3kzBSg
KbbLtRAAtL88MogKmM542pvMZ0+IzDlFz4JzGBu75AKhZLvFkzDOOPzIVN2504tP
uCnUaInM5Ugs1YO6UWvejexH5mnRrY3DdVR1rC9Q9fRJTR1EWxLl6h4omEDt7z9e
lwPyNZlcbydooq9dw6Kpg63keKxKQnjfgm3IVX5GleX4XpE4oX61SuxISFnePFOT
hzAap7r1o+TpDzJKAZf8NmshdYaLeMffiocna57xF/CsXwGF+TmsLaA7qw3J3XqQ
t4KSTwnLp7saRf6/vLqVVbiNaJ7sgAl3HewDcfvi7esqdgv/61rEgsslHgt9dT+W
GPoEmDmhwsfJcydolXOgvE8Z/CmmCCZ53mYcRAGnV/rGxEeCda0GfgUJ5cx4kQJ8
8pLI6LuA4rj2nEpQZx8indsza4Rlku1Yme8LFPS9HqDugiYjVKRxycDOeuOQ5QwJ
51Ab9DWAO3v/9J4peG6KIn030Nzd0C0s7/n6Y9iVOUn6/KZX8mV2ObJWiDPIpfKk
sEeg4/AWELbzzh70AtuJmuDZRAUj4288102sYk/qClYeS3luvMIFJnPamDiOL0aA
y52+0wfm7MRt9OrCoUa3dmcQMdt/y8y0Gb9p6C2CHIeQJHvzeRwp2uM66ulBEg1c
FPUbLPVYqUdsf1qVD8NUpGVcZwiqyZhxF3AX9xIlQlzn3mea6wQ=
=kWGC
-----END PGP SIGNATURE-----

--0/kgSOzhNoDC5T3a--
