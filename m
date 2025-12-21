Return-Path: <linux-i2c+bounces-14664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3816DCD443D
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Dec 2025 19:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 312233003BF5
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Dec 2025 18:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F036728B4FE;
	Sun, 21 Dec 2025 18:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ntm3e3uV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C60248F5A;
	Sun, 21 Dec 2025 18:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766343154; cv=none; b=COs8w6e15crdPM/pZHmB7yW2bCUASsJh1zcqxfPRnqoUDMVVXmWszPytorcXHV3i83CQivfMwOLq2wlLX2E+Be/nOePjJbblCzQyi9SnZV5EexZL8uman+GQUehjjawOSjQzNdu2s4N8iOlvfWj+6K8qh8NXJmop9YLjtK4Z3oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766343154; c=relaxed/simple;
	bh=ZkVzadWB/laoM4hdfNt2fMuyhznLmNPsYO9/YSsIgww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N0bdxx0EEOl7JK5fSGdj9eo9b9bP5/LICT8pk1xCuOWfG9xNbFKu8VqmksHYClitdw9aE2Yqsx6qbCpKF/V5YmhZGV74FJh+Hle6HLhDMAwtp0RDuTfUGmWPWL4c/r8gxSPXE8iA7FETZGtNlm/f80bdKtuTr097DQphTj7EyBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ntm3e3uV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC41C4CEFB;
	Sun, 21 Dec 2025 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766343154;
	bh=ZkVzadWB/laoM4hdfNt2fMuyhznLmNPsYO9/YSsIgww=;
	h=Date:From:To:Cc:Subject:From;
	b=Ntm3e3uVT+IjHW29JHbH2WQe7qZMFR8O+u6oThZVF71yXxhmDgOUoEnGP6xLpjY89
	 UlagsD+lWFA/0QkcKYs6FiVPasAXjKlxsQblK7xO3r7+eqk7YDOCReDJ78U4drsNpi
	 E3IIJdOquKaApzbzjC5JA5XHrwKL7h8I/sJ7zdIwaYqTtXZvq8kYQhJEONC5m0yZtC
	 0+nbkZaaBDwlyS5jQT/oCe8er9xrfxzcGvWWXXsWW0bltENThgVVs7uAMHyQvcEddP
	 su+UKX/QgSH+5G87ZGv40xOtMF03Ib1QNgQ0qZCMPgGzm7/oO5zsLXVEuVfsvsrjUg
	 z3rgOMI5jWDcw==
Date: Sun, 21 Dec 2025 19:52:30 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.19-rc2
Message-ID: <aUhB7hs0HnvmZ1Bv@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+s6cMRuPBtdf+RO9"
Content-Disposition: inline


--+s6cMRuPBtdf+RO9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

this pull request contains an after-rc1-cleanup from Krzysztof and some
new IDs which I wanted to send with a second pull request during the
merge window but that sadly fell through the cracks because of Plumbers
and travel.

Please pull.

   Wolfram

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.19-rc2

for you to fetch changes up to 880977fdc7f67923d1904ee23ca75fa1e375ea46:

  dt-bindings: i2c: qcom-cci: Document SM8750 compatible (2025-12-17 00:28:=
52 +0100)

----------------------------------------------------------------
i2c-for-6.19-rc2

- bcm, pxa, rcar: fix void-pointer-to-enum-cast warning
- new support for Intel Nova Lake-S
- new support for Mobileye
- new support for Qualcomm SM8750

----------------------------------------------------------------
Beno=C3=AEt Monin (1):
      dt-bindings: i2c: dw: Add Mobileye I2C controllers

Hangxiang Ma (1):
      dt-bindings: i2c: qcom-cci: Document SM8750 compatible

Jarkko Nikula (1):
      i2c: i801: Add support for Intel Nova Lake-S

Krzysztof Kozlowski (3):
      i2c: bcm-iproc: Fix Wvoid-pointer-to-enum-cast warning
      i2c: pxa: Fix Wvoid-pointer-to-enum-cast warning
      i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning


with much appreciated quality assurance from
----------------------------------------------------------------
Bryan O'Donoghue (1):
      (Rev.) dt-bindings: i2c: qcom-cci: Document SM8750 compatible

Geert Uytterhoeven (1):
      (Rev.) i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: qcom-cci: Document SM8750 compatible
      (Rev.) dt-bindings: i2c: dw: Add Mobileye I2C controllers

 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml        | 2 ++
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 7 +++++++
 Documentation/i2c/busses/i2c-i801.rst                          | 1 +
 drivers/i2c/busses/Kconfig                                     | 1 +
 drivers/i2c/busses/i2c-bcm-iproc.c                             | 3 +--
 drivers/i2c/busses/i2c-i801.c                                  | 3 +++
 drivers/i2c/busses/i2c-pxa.c                                   | 2 +-
 drivers/i2c/busses/i2c-rcar.c                                  | 2 +-
 8 files changed, 17 insertions(+), 4 deletions(-)

--+s6cMRuPBtdf+RO9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlIQe4ACgkQFA3kzBSg
KbY97hAAmheNzisFoNvUAEa+7zU8Pe9/o0U9661nwIAMToU5AAwkKtJfrEfLQD21
WhbJEpWga6mXABh6qBaxNM2S/WXzOJgjgVwiqrEQzVX5oN6ZlsHBb54YDNkKsPvk
FAc6OHMyKz3EpTkEQxbPloefd6UjdtyZcmci/XUfMtAlQNANeSqZ/oVTB2WHCLtF
6PNjnvYoAv9pM3WSlBmIc6pyQXQhDj4SOKbH50DdCSSilniztrfHv6vLgXysbxwq
r8r1m1qAc5qr21/P6Kl9v8DuKCUH/LwSmiC4IOq/NLoB3+b1W6e/Bb/76gMddjGB
zQabpLcRwu6o2KlzRni3VFm19vutSlwwniyjlsTZ2R+Wf7OjXV+x87+RSiHjexNY
XmnM6HdtlDzCgNQwfHHy0cXmhI/BQl9RCaAIo1lPIGw3V+DMTbevwqsx/IFj/ydy
mmv0sw0qL320hFS7qzUzPw//PQ4dlnDZmwI+rcmA5PmxS86ejJNezU/+yhDdoZFd
/qh7t9Byg+wWWN49OeGzhiQw+z7uvZljNqTwwSxqG43I8z0UDS/YEWDQnGXwmLZR
BW6upN+e6cAOHdDHf59zK80VOrMt5P9aJZWadmJkrU5/vmzjaHIl95FYruDtLLef
r8My44bnVrvUqZxcQqN+zqS+M5+chKhM/x1mJdtH5UMEWLkxic0=
=17T2
-----END PGP SIGNATURE-----

--+s6cMRuPBtdf+RO9--

