Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCA0427D2F
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Oct 2021 21:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhJITvp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Oct 2021 15:51:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:36596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229806AbhJITvp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Oct 2021 15:51:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93D7D60F9C;
        Sat,  9 Oct 2021 19:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633808987;
        bh=Gn+fpQMJ4sP6Ko1dbm4nkYgNMc2LrFs+OcFqGZa8zIg=;
        h=Date:From:To:Cc:Subject:From;
        b=EkBXw5Q/si6Rqb2r3acdEImKx7tjnA57hnemb9jho01YZd5o8isHSPd1J7/smK3Tw
         gc/bPcxsLl3JzfzwF4VfPBwsULG27gj8aGWKpoFmyTBqsbbhDqhjhnXcAD1dONm+H2
         ZMNIjufJSkoCWOcQrKXrTY/fRh32mxU5ZKEGxzsX611O2KhzwbUnjlIw0sPT7225Lh
         XJEqM7LJPnt6lu2l0ys1WFgRtarLIZrEfY91bLyNBniK644sxm9DiWSQQI+whbZN+w
         NYPsJmgOf6MaT4CQNnucghLQ+/+0gvVoB7afh7ynN35NAOcBbMByINmjGfcLlng2fl
         PG6quaMKLRy2Q==
Date:   Sat, 9 Oct 2021 21:49:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.15
Message-ID: <YWHyUMqxa5giAJTJ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7UYCnmqLw4HHnQWK"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7UYCnmqLw4HHnQWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has three driver bugfixes and one leak fix for the core this time.

Please pull.

Thanks,

   Wolfram


The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:

  Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

for you to fetch changes up to fa1049135c15b4930ce7ea757a81b1b78908f304:

  i2c: mlxcpld: Modify register setting for 400KHz frequency (2021-10-04 21:56:20 +0200)

----------------------------------------------------------------
Jamie Iles (1):
      i2c: acpi: fix resource leak in reconfiguration device addition

Kewei Xu (1):
      i2c: mediatek: Add OFFSET_EXT_CONF setting back

Vadim Pasternak (2):
      i2c: mlxcpld: Fix criteria for frequency setting
      i2c: mlxcpld: Modify register setting for 400KHz frequency


with much appreciated quality assurance from
----------------------------------------------------------------
Qii Wang (1):
      (Rev.) i2c: mediatek: Add OFFSET_EXT_CONF setting back

 drivers/i2c/busses/i2c-mlxcpld.c |  4 ++--
 drivers/i2c/busses/i2c-mt65xx.c  | 11 ++++++++++-
 drivers/i2c/i2c-core-acpi.c      |  1 +
 3 files changed, 13 insertions(+), 3 deletions(-)

--7UYCnmqLw4HHnQWK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFh8ksACgkQFA3kzBSg
KbYyCg/8DLOdHkhi57+Zq1RkQKQ8wABG6rDYhnN+Ts/1S6w6gJ/ywlH677dQ1Wr2
Hm1+4JxtCmF3T2OxoNUb2+VtR+QfVv/nVhX1JByEZtEYHjFz54Qe6o/mGvigUBBY
Gk9WROxSbqokWGeLbgnLfU5JKovF0PydIa9AtJ3lJfLTAyMcTT5VwCnUxbmLgkHx
/goe9GBWDMylv7I/+7/cV6RaPX+LugV+PbrdFIxj82TlrO8Z4DemU6vqCqemWPOT
oT7L5Ph//SRMMeK1F46DPaQXTUglei+bAmSzm+UwDT21kX9Lm+8HHJW2cddOyok5
uQpShGud4Qo0s5VTb4cT66be8I+RNCAd35cKVfGn4VQhsx4/sbEoQoC/6vXk0xgI
5FP2RzZj/pJR6Y49ShiXEfn6JrTasWR9+jbRph9cJIB5RZu2Zs5KuUJMbtYIQpYL
R9GsyGSRRy7Vn65umKB+QBd9lmwDumDoBkrl0g0Kcft/CxjGea64y4PcmR+wZovh
31uEkHBF3CBacoyLoqa+mNvoUeEyM0aC38gxRyebuBZ6A6LWgnVTV2HscReZf6+o
xKLRv8v70myWGAkeRWDuIptzSwQpKWZ1u5HkG/jgPPSAHeUMQwhYsyYDQ0f+wE16
N/tm9jMuKabbTck1sDgk96FuUlxeCaALubNcDCNAdHx4TgAuY6E=
=ctII
-----END PGP SIGNATURE-----

--7UYCnmqLw4HHnQWK--
