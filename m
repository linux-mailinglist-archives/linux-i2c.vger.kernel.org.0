Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190A74712F4
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Dec 2021 09:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhLKIvG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Dec 2021 03:51:06 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:47144 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbhLKIvG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Dec 2021 03:51:06 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 04DC0CE2F2C;
        Sat, 11 Dec 2021 08:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834F5C004DD;
        Sat, 11 Dec 2021 08:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639212663;
        bh=oJGUsMuzhDiLopzzrBe771arSsE8B8iNDaGa8ER+kHk=;
        h=Date:From:To:Cc:Subject:From;
        b=t9MzsQVDBlKb3rzfv8QZQAqPiDAe49brqUFusMBOaHlscPLr6zb/SaLMjQoxQEHoT
         irTVxdVFvP8sq5EmbKSgvTnDLW2DOwF5wMHbDA/fxSrmVts1SLrpgyEOK3ZImosvDW
         LO8QVDViPtpNW6dZsoqsiGvVvu/KtNfyC1LQWPcEBUKJQ1gzTxJDAc3pZYr2XooSYE
         Wt4LJlebZrugmfV5VnkGU3tIRMM/ryEO9FtaB/XgF+jbGSzLkuUS6Bp0cVm3uOFFYq
         2dmhfFotzfyYoiraek/nFGwmbYA1b4BE6HLd9nqQZZpdiw9bXWRFwDP1t1JUUYA8CO
         N3NzbZPZDptgA==
Date:   Sat, 11 Dec 2021 09:50:55 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.16
Message-ID: <YbRmbxcM9crWkl0y@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EuK4WBe/E+JOtAly"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EuK4WBe/E+JOtAly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here are two more I2C driver bugfixes.

Please pull.

Thanks,

   Wolfram


The following changes since commit 0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1:

  Linux 5.16-rc4 (2021-12-05 14:08:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to a74c313aca266fab0d1d1a72becbb8b7b5286b6e:

  i2c: mpc: Use atomic read and fix break condition (2021-12-10 22:27:30 +0100)

----------------------------------------------------------------
Chris Packham (1):
      i2c: mpc: Use atomic read and fix break condition

Vincent Whitchurch (1):
      i2c: virtio: fix completion handling


with much appreciated quality assurance from
----------------------------------------------------------------
Maxime Bizon (1):
      (Test) i2c: mpc: Use atomic read and fix break condition

 drivers/i2c/busses/i2c-mpc.c    |  2 +-
 drivers/i2c/busses/i2c-virtio.c | 32 ++++++++++++--------------------
 2 files changed, 13 insertions(+), 21 deletions(-)

--EuK4WBe/E+JOtAly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG0ZmsACgkQFA3kzBSg
KbapWw//czmYCkD+ynvwRHX6KJfA82y5Z0k8uo63Y0V8daFIPBmWFW2ueCYWFtLk
vdRytH2fUvFezUPy/9rtd3eTJfb38MfFjyfg28ZLJSlxAFJlUSufVpVbE17KY8bB
dPItyl7NZPJxKnJbC/q/hMkVmSjtdY/3hB0SkXVJOBSKk4VrIT2T3LTzXYTyRn0K
VlMcS7/DY19++aOXr2UFl4/7YYIb1BQJ7aJVNBOXsNuodkLDaHkvEjzYhRFgupas
rncoku6nesPpWqIdj5UBEh51NKdvINPYGquJO/HYjDJ/nyJpdBFB5s2WH5PSxHZw
0Js8mel5sFvoTq+iPQ6CUi78sRqgG6TkoD0Fy4OKqQa+jERcuUoJbhl/u6h4PBnP
/oJ29+2Bt30V2m+mmvvUkEq+PJD8xxNBhFad4eGW7xmyOXSqXrlGKv74cOYx1hP6
BYUKDrHUfJ1vgT05FaQlhFNkG/qrNjL6aef0PRNkVB3ASUC29JW0ypVidEuEYwpU
qZK5EpypqaGhIgaedIFZLs0k9YoE97CYiXruNmvisbEQeAE8ZEdrIoLkkhpj98z5
kH52WilLv1tWq75NxaPigjFH1T+TR/rsv+IbI22kbraEhBbhYhvbDRIv9m8bgGFb
ea+zDkvpSXmGf+qbig6FSWW1ivt4tWodlJKVsGpdC5z+wLwcyiw=
=z+LA
-----END PGP SIGNATURE-----

--EuK4WBe/E+JOtAly--
