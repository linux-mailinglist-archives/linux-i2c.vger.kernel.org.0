Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403351BCFBD
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 00:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgD1WSd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 18:18:33 -0400
Received: from sauhun.de ([88.99.104.3]:47732 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725934AbgD1WSd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Apr 2020 18:18:33 -0400
Received: from localhost (p5486CA03.dip0.t-ipconnect.de [84.134.202.3])
        by pokefinder.org (Postfix) with ESMTPSA id 908812C0710;
        Wed, 29 Apr 2020 00:18:31 +0200 (CEST)
Date:   Wed, 29 Apr 2020 00:18:31 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 5/5] i2c: designware: Allow slave mode for PCI
 enumerated devices
Message-ID: <20200428221831.GC7698@kunai>
References: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
 <20200425134448.28514-5-andriy.shevchenko@linux.intel.com>
 <9f6213e9-e14c-a4b2-eb10-d5463dbe2c19@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline
In-Reply-To: <9f6213e9-e14c-a4b2-eb10-d5463dbe2c19@linux.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 05:05:35PM +0300, Jarkko Nikula wrote:
> On 4/25/20 4:44 PM, Andy Shevchenko wrote:
> > Allow slave mode for PCI enumerated devices by calling a common i2c_dw_=
probe()
> > instead of i2c_dw_probe_master().
> >=20
> > While dropping dependency to platform driver in slave module, move its
> > configuration section above, closer to core.
> >=20
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v2: new patch
> >   drivers/i2c/busses/Kconfig                 | 21 ++++++++++-----------
> >   drivers/i2c/busses/i2c-designware-pcidrv.c |  4 ++--
> >   2 files changed, 12 insertions(+), 13 deletions(-)
> >=20
> To all 5 patches
>=20
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

And all applied to for-next, thanks!


--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6oq7cACgkQFA3kzBSg
KbZJKA/9FwYdwyqDpMWQ7gh7nT46LV8wwf6+0tV2kjGaB2KzeRg5dtnJBIzVM7V6
O1VFav5K9Qnzm68X61a3c5lq4JXLuFSIbnfEVFI7KvRhUTMnvn/f+dNAFmSCuri9
Wbs/chg7pR1D0DijU0Tv97O3k+siALkRXepJ95fjFnHg/J1XPffg68mwgcSAzf7U
UvD+lW6obl0/vq6D4d1SYAIwMsyu5017r5Uo5BGBhflOj9hUBFaXFgv0T9q5I3KI
5rPVNpBi2xH9+P7hTnxUbb+v63n+NEM2GNOUtxnyRNgMnM2j+0kcJKiGjBNE6Lj9
fFDf7hVc3Z5VE2LoFmwdA8SdLNOucq4C1wO40DU6r82VveFtJD8w9vYOsENS/5/L
YZJBaC6nPZYhaNlitdJuHH6YwX6DYwUbfhmmyUlOVq09+rh7Q0fp6dGnSDQbTcjy
/HtuEmUSud57kHhlTJY3MKtUBZa98pQbjqfzbpQNS6j7pS3zSiRcd2mX3JpXEhaW
9hBFcjp0TKIoJfSnNqXZwZl+S1Z8npsdCYMqf5l9pVyvOIqL9OcHYXD2UKKSlxhc
SOR62YRRWaCq/Pbs+rhKlEDMWaQfqwGKhHHta/tQSd6Bj/HdFp23oUJ7WMGeS5Nt
d3e+PmAE5h4z4iTZUNWoWRay7zwlEhQowmRW/HNU/deLxYloLs0=
=wqUK
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
