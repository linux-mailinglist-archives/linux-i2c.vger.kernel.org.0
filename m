Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A804828B1
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jan 2022 23:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbiAAWGF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jan 2022 17:06:05 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:55042 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiAAWGE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Jan 2022 17:06:04 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6BDF3B80ABF;
        Sat,  1 Jan 2022 22:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4BDC36AE9;
        Sat,  1 Jan 2022 22:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641074762;
        bh=NA2vVEiwfFBZoDxqthTyVBIwwY7BDy7VHK/c+r9PyDg=;
        h=Date:From:To:Cc:Subject:From;
        b=n4UOUCjjss33WEIqzQr+K4JCGGR4Cb4YeEsCfvIQm11EnixR+CoRMbRt7cjQPLn12
         cySK6wmdOSnqJ9lJavh1LsJgXbssdFWfeUAuv5tX+ehlb6wKYTRI9pAbfqocPM4shU
         v2JST+zzV96t2WdlLo2z8q+xfhWrjlDkx/QErEcqNMKjdSllcNJvFPexdzCllGL6eG
         ACXxbZvb92dHxfWC95WqG1U0q5Q/BzRvQINCOGezN5bJH1KY+uwD6cl//QhnXJokOH
         YtVGayZ4elIL4/7LhtVxfZfHr4JYaf70lVVIFdzeNIOmYYcj3zb+YTWn+T201ueT/e
         INmTe5XnGRGLg==
Date:   Sat, 1 Jan 2022 23:05:53 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.16
Message-ID: <YdDQQRos0o8i9nFF@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="btrY147HGwHQCQQg"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--btrY147HGwHQCQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has a better input validation for compat ioctls and a documentation
bugfix for 5.16.

Please pull.

Thanks,

   Wolfram


The following changes since commit fc74e0a40e4f9fd0468e34045b0c45bba11dcbb2:

  Linux 5.16-rc7 (2021-12-26 13:17:17 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to c116fe1e1883ad3eda0a1938a9e3275a98aa51a5:

  Docs: Fixes link to I2C specification (2021-12-31 14:39:28 +0100)

----------------------------------------------------------------
Deep Majumder (1):
      Docs: Fixes link to I2C specification

Pavel Skripkin (1):
      i2c: validate user data in compat ioctl

 Documentation/i2c/summary.rst | 8 +++++---
 drivers/i2c/i2c-dev.c         | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)

--btrY147HGwHQCQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHQ0D0ACgkQFA3kzBSg
KbZTZRAAnwdI6e8x4MNJbsfVFQOrDpUzw+kXRjE2KOLpCp24rGMFOAQ9eubhv9NJ
vmimb9PnqwahJ19CCGIYMwJlsadg6MHpYR8fX8aR2AlLelug6T1aSnx0J07y2wDH
dsNHrY3YHhk+aPvnkvmYLopK9yGccmdJTp4Gja95a9p2OTZBB6wf7705ZlGk3jOw
4XaNO3qMGZNKtNcMCO8TLeJojfnessrymxVj9T03CSiashx9lSAnb7eLfy0GiNYP
iz6DQBRS3kpYziSt+v4Ktqybmqz/q9cSBSd+1Fc2xAIymWVnvu8in/AZTf1x2MVi
fFKME5WOkZtNzoqUwy67I5eTFb3jG47cIFv4CuDeyPP/BSTtJDk9FKPvNmllbn0X
zgZG7IdEns8y2xXgExYJyW7p60dNjpdWXpsU5WWQAppPs+IB3awFC/8DTJImvmj6
11/75OdPnDPd948uMXMFP8nLLS2jGfGBvTxPs7dsy/+jtZilp/rNsrAc062ob8CS
9tufAhTyRD4+pqsN+Qe2Z8z6/YZwrWf2Aej/kKyn+sk/AUDQWY9OTViuANSzXDuW
wBFaCZyIwK69CDjfTBJc+07rtcL49mhVh5wiiP3K2prs6LOnCTxt5cKSFfNmqXNG
ECGSDij+tsOcVilUFkAiAQlWByF4oD77JJpdt1+pGR4dSiq2aWU=
=7H5j
-----END PGP SIGNATURE-----

--btrY147HGwHQCQQg--
