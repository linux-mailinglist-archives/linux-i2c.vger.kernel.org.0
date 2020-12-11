Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38FBC2D8208
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Dec 2020 23:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394358AbgLKW02 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Dec 2020 17:26:28 -0500
Received: from sauhun.de ([88.99.104.3]:58418 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406910AbgLKW0G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Dec 2020 17:26:06 -0500
Received: from localhost (p54b3322b.dip0.t-ipconnect.de [84.179.50.43])
        by pokefinder.org (Postfix) with ESMTPSA id A70572C0270;
        Fri, 11 Dec 2020 23:25:23 +0100 (CET)
Date:   Fri, 11 Dec 2020 23:25:20 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] at24: late fixes for v5.10
Message-ID: <20201211222520.GA1003@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20201211192551.2226-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20201211192551.2226-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm terribly sorry but I completely forgot that I had this fix in my tree.
> If you're still sending out fixes for v5.10 to Linus before Sunday, please
> include this one. Otherwise take it into your PR for v5.11 and I'll backport
> it to stable.

Pulled, thanks. I don't have any fixes pending, but I can send out a PR
just for this one. That's fine, too.


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/T8csACgkQFA3kzBSg
KbZDiQ/+OROT0MkFdV0m67W5+GB4jYZFAg4ZeWuFJ1UXBF4mkqnkqBaVHJAK9UXJ
szoJG07BBvWhkriYdRqaP4jWj9HTOSkeKMvXazNXVW70HoHKiNqhr3j1F0gfmEAc
WzhfC7iMPy7ZlM80q37CFjmRU6UDsDobjPfRX1aVQDlipyx4byxZTh+kOKRS6hhy
F8xmiTnHQmLkEHDbSWDwvPgFzeLxLfRX5qnJpM3opM9KSG94l5WpH1xs4lAy7SGH
7cfslQncs3BkrXv00r6kphZqxyJQmXMH5T2jYayLapZL5wejpNNVXN/pOQGcMGVW
4Kmv2AxiVX0tzuP81PGn5jCe4MkCq+x6zPECh+RxTsjcM1J7YbDhJQxajkpbMdFY
nNzfEyFZ2X//RowZ6Tj9eeg9+p4QTI1C85wk50YsHihV9pYpI79rthYSF5ieaIP3
hZDqWUC/X4ZElDmfrrs5xNk969RDPvw/thum1m6FlXwizBes1MPEi681Jxg9xKqZ
XZg+3Oe+Tk1Lc8Z/twhmE/0q+BziBUTNUP6J4MYsFZN2NMmuErFTxx+vqY+y9Hej
wJbaNIVyo1lu0Y2NP6UP7TBEIP2z4YGplg5c14VQI953i3Mln/oDf+D927pcYh7O
BCtbE+lEcnxrksJIjyLENVj/6e9GBPTn5JREnn8AyHzE/P75hGc=
=6/AV
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
