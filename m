Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1C01CFA80
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 18:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgELQWx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 12:22:53 -0400
Received: from sauhun.de ([88.99.104.3]:59222 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgELQWx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 12:22:53 -0400
Received: from localhost (p54B332DE.dip0.t-ipconnect.de [84.179.50.222])
        by pokefinder.org (Postfix) with ESMTPSA id 765DF2C1F86;
        Tue, 12 May 2020 18:22:51 +0200 (CEST)
Date:   Tue, 12 May 2020 18:22:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 5/5] i2c: designware: Allow slave mode for PCI
 enumerated devices
Message-ID: <20200512162250.GF13516@ninjato>
References: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
 <20200425134448.28514-5-andriy.shevchenko@linux.intel.com>
 <9f6213e9-e14c-a4b2-eb10-d5463dbe2c19@linux.intel.com>
 <20200428221831.GC7698@kunai>
 <20200512161443.GA1491106@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Zs/RYxT/hKAHzkfQ"
Content-Disposition: inline
In-Reply-To: <20200512161443.GA1491106@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Zs/RYxT/hKAHzkfQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > And all applied to for-next, thanks!
>=20
> Wolfram, I do not see them in your tree.
> Neither Linux next has them. Something should I do?

Sorry, Andy. I lost them when I was not correctly syncing from my
secondary machine. Pushed them out now.


--Zs/RYxT/hKAHzkfQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66zVcACgkQFA3kzBSg
KbbQMQ//fk39aMhbsMa6g2HK4Wq5SAVJfni4aJkkoCouWygMkzMPI3dBAfQz9GrQ
3qoKVY3n4v7lTDanG3AYHW0aeQ7YOMpRdwly/h7Ad7oWsw0Fhe+pDyqwwFedOP/t
XTEsVy/OdoeJdMt5wX5mALjD5jqchM6eBqmQoc1ZO6NbBWf97BYkhnUqMnZcLY3f
acYFNps/m2390Dj0qBP8ySIGWCYhgJJ+7f1LVpZAHBl7mQlRmz0gI+l30J1Oup3R
WtixvzJogSs2+KrU4qdJBEW2g6546TXDwJypXZGfDJicZO7tMzx6YWMtg6si6s3r
dxgsfSgupOysMvGk0MspbzACyC+opIQknnOcEMUuFJyhUFWEPd8BErliUJKl46Ia
+4i7sIUxPrsywgSfUZyjyX4y3rHFH3Jh4w1cH3USpWqebVwOc0CQleCJHQLDe4ja
UGbpqTpR8AIxstRV1CtYdZEm/zF5ySALSimqIpfdABoHI5lsRQTIC4DG8DtUpnlK
l/QkbpJ118meEQK0cIEmrnV0zRH3HAQOdwFYRplSBmPWoon/km+VlwiYNZ8Xm+co
i8czJp2YwkrpKccfmynYqQPd5M0U9h0Sej5GTHE0oht0mFMVIVysWB2h3p+PE3zU
08nX5eYsXOnhh9Y+r73f2TjG++q+Y/8cAIakCvo/2sl0XmMG008=
=hj/Y
-----END PGP SIGNATURE-----

--Zs/RYxT/hKAHzkfQ--
