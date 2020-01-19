Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BA8141E72
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jan 2020 15:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgASOOR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Jan 2020 09:14:17 -0500
Received: from sauhun.de ([88.99.104.3]:35136 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726860AbgASOOR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 19 Jan 2020 09:14:17 -0500
Received: from localhost (p54B335BB.dip0.t-ipconnect.de [84.179.53.187])
        by pokefinder.org (Postfix) with ESMTPSA id 459CD2C018B;
        Sun, 19 Jan 2020 15:14:12 +0100 (CET)
Date:   Sun, 19 Jan 2020 15:14:09 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.5
Message-ID: <20200119141343.GA1191@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has some more driver bugfixes for 5.5, two RPM fixes and one leak fix.

Please pull.

Thanks,

   Wolfram


The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:

  Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to e64175776d06a8ceebbfd349d7e66a4a46ca39ef:

  i2c: iop3xx: Fix memory leak in probe error path (2020-01-15 20:31:27 +0100)

----------------------------------------------------------------
Dmitry Osipenko (2):
      i2c: tegra: Fix suspending in active runtime PM state
      i2c: tegra: Properly disable runtime PM on driver's probe error

Krzysztof Kozlowski (1):
      i2c: iop3xx: Fix memory leak in probe error path


with much appreciated quality assurance from
----------------------------------------------------------------
Thierry Reding (2):
      (Test) i2c: tegra: Properly disable runtime PM on driver's probe error
      (Test) i2c: tegra: Fix suspending in active runtime PM state

 drivers/i2c/busses/i2c-iop3xx.c | 12 ++++++++----
 drivers/i2c/busses/i2c-tegra.c  | 38 ++++++++++++++++++++++++++++----------
 2 files changed, 36 insertions(+), 14 deletions(-)

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4kZBMACgkQFA3kzBSg
KbbfcA//cPVBfn1Z/EkmqobVXOhclIarujUbV2dFcSEYB4J7Q2j4r0nXr0M7YX9y
Ok1dtO7WvlY1Yvf8NvXQTTvJfffPGbe3ikEWc+HyWYOfOQYEa4Jhficp4BXNE8Dr
MFxCUeH5iPgeq1SCt/jf829E4TpC8N4pObuhpmAUXBuD2PdPxZUQEsTkgV8QH9/W
ZxDM7SMg6vl97Y17ETAV678rmLjnqbfT5MXUwrJ8u6TMbBYqkbwBQq5CVFJnwCxV
gS1lmCr0vwuCeDeNUkToBoUw2HAN9P71B1GJeQZLFZ7KOcbolNe5tlEV6j89UWIy
bVhhuOjeAT3nDBJu9GTg9rJ0whkkPjDHOznvEjHwPBO1dB55FG0nImG/zmVLbHfg
JWel19CDFse2YzgsNSta7YlQKHtSIGPF4eG9j89UsMF0LwrYJiq3SXyJdaXDvcIW
SDRttdaaSP2wD9/3y8kTu80Ed6qeqpFP+SvgsOp5Kfcd9oR15fVLnDpCX0PrGMr8
y4hB75JOlUIUTYeFZ78xM4e/afd4f7BJuC/WRvaPXJ8hjnslsm2PpOmjscStXVmc
vC4mfdEa2CX4TSpR6T35CXUoL7ZVCOhc3SvZO3gVK8EdtloyNFxiPwiifxrMbjFp
Rex4jwa7plOoUUrGSVhBVo/Art2tMWo49LuddGpqSzx9JGGSnZc=
=Gcrl
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
