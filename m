Return-Path: <linux-i2c+bounces-1953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CC3862015
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 23:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5AD31F26410
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 22:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5CF14CAC3;
	Fri, 23 Feb 2024 22:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAofBZiN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762E1145B1B;
	Fri, 23 Feb 2024 22:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708728830; cv=none; b=NouMQeNhHjQM2eQ8HnDqZ+kyQhy1+pnXkUD71UDpSaPkbJWzsj7AxE0cCO5WynK5Oi9Fh2tLCxp4+HxyTkHHsKE4R2VVLs6++thLmQfxzubO2f34QqAN57Jnfcs+nbMAItNDijQtoH/vEJT0y701nCK6a5DX20X3/sOw5YfA9kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708728830; c=relaxed/simple;
	bh=8fI90c/X8hnq40ZoYMZVuBQV6bfsiyXr3g1YwmXe9gA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WRqqxEb/DaLNoJoEI8PG8HKDsjqcwwDTixLrSoWEJt8IUe+i4j+HtDTBJ7FuMQDpwe4kgpuF5+PdpZZgFZ39Wzz+k2g5tjLBpxwCXqUMGQFtH3jtO+Ul4ZIwiQZUY+Uo7/kXd8BGrQYmbhPXaPb/N7ncfNeAk6i4VUOL7CzumOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAofBZiN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C8BC433F1;
	Fri, 23 Feb 2024 22:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708728830;
	bh=8fI90c/X8hnq40ZoYMZVuBQV6bfsiyXr3g1YwmXe9gA=;
	h=Date:From:To:Cc:Subject:From;
	b=gAofBZiN7cVAP4fKdDIZemGEMo13V0vKOsp4JmYY7W6TfmCJ3Fb1lnL3knaYqFNMA
	 L9/41+JTv2xGcvxTfDHF8N6X5K0H56AOwltAs34gAVBTQmZCDcxTeDe2oJW/uewVBn
	 cAaAxyFtY936OgNZXdy2ssSEZPkIR5dmqZlj3+nuf9QBo/1GnvVreqrV5wMgyVFjsK
	 c+5ofxMbDwdjWRI4wYvra/aNGCFht/Bv7U83bzbjBw26cRnLhuZY2TIW0IH53+WmQR
	 jiA3G/m9d8V3eIc3jolsenmmKdOebO+zdaEJhsKlBNtpWYi24hfyBViAgvDVigbpd7
	 wKlji5ZvK/K6w==
Date: Fri, 23 Feb 2024 23:53:47 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.8-rc6
Message-ID: <Zdkh-4-6G9UfkOIu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W+jNT0ni3h6BrAXc"
Content-Disposition: inline


--W+jNT0ni3h6BrAXc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b401b621758e46812da61fa58a67c3fd8d91de0d:

  Linux 6.8-rc5 (2024-02-18 12:56:25 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc6

for you to fetch changes up to 87aec499368d488c20292952d6d4be7cb9e49c5e:

  i2c: imx: when being a target, mark the last read as processed (2024-02-23 23:39:35 +0100)

----------------------------------------------------------------
Passing on a bugfix for host drivers

Andi's PR comment:

One fix in i2c-imx marks the last read as 'processed' to ensure
proper indexing of the transfers.

----------------------------------------------------------------
Corey Minyard (1):
      i2c: imx: when being a target, mark the last read as processed


with much appreciated quality assurance from
----------------------------------------------------------------
Andrew Manley (2):
      (Test) i2c: imx: when being a target, mark the last read as processed
      (Rev.) i2c: imx: when being a target, mark the last read as processed

Oleksij Rempel (1):
      (Rev.) i2c: imx: when being a target, mark the last read as processed

 drivers/i2c/busses/i2c-imx.c | 5 +++++
 1 file changed, 5 insertions(+)

--W+jNT0ni3h6BrAXc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXZIfoACgkQFA3kzBSg
KbYTcw/1EZrGvabgy1mEd1gWPl7QMhRG4Jw0nCv2xNMcmRP1KmnWWzbEsQf1h7pg
38VNldLVE6brjgmFCBsXW7jI073Zctb9UMeFmibiickI6JL1ES1YC0e7mwiRz2m2
GWZiVFmyLQFBZTcHWqi4MOk+2oKFXOAPv7+ifTs47k6JYve+Vzd9jaILc2M9sdMv
3FdAw8iCVRt8WvP5//qPDNJeoKyBa9M2wR9vK2Iy0J2yHsZu/s8SSIDoYOvRUhJC
vj1X09FrV8/9KcSzYYvQMOefGIfsvotF8qAx6FVQkQ6W8xRJ1VmKGcFNgK/yODyH
5mKWa/F8hJZQegFenQxrHUQ+fjBHYOwrUaIeEp3Ej9WHFzLtycFrIQzPRqCiwdeC
aLr952omuLIFdwVJj56eQDQLfFe6bLqEqq+yhNZkwuLc91r5SFhlIue2hV9nUPot
GsSZ2oLv8yB2zogQGi0UNlLpwcmToGfjnVRylA7jnTSS0igh3A+UUhv3oPCDQA1D
QukON2YxTAMPjiZAyjlYjUQ0wEKId7M6p5q6ssMIMisq+SfddjVtuWpqRGc5mHHb
O9K+2LGag3iB6MVNaGrEMTmiJ7xs1rY7UVlL+yOFv7y6M1yllC4ot25BFYyeB9Up
Y4Xob/50Oy0yr3UQFAgIklY0WHjhDElO8TRhFZ7PkQSiXY4ZNQ==
=OjSX
-----END PGP SIGNATURE-----

--W+jNT0ni3h6BrAXc--

