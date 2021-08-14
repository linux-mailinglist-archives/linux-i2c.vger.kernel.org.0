Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F063EC3D7
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Aug 2021 18:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237275AbhHNQ3N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 Aug 2021 12:29:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:60832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236588AbhHNQ3M (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 14 Aug 2021 12:29:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02CD160EFE;
        Sat, 14 Aug 2021 16:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628958523;
        bh=G5As9gYoPdSeMowI+upXJT9B+lTARlh/ll0iGbq2lEA=;
        h=Date:From:To:Cc:Subject:From;
        b=njNDxLg3zcQytt+ZJTAGr6hlskswVfaAPES2uSKhMlce5OrDeAktcrUuo4aD1SuDR
         beJ0OFwa3nLgOr/rWrH3YXXw1BBlaxiDozW9GsU31oiv6CtYBKRkC2MR02b3noEwB8
         PPVF3LEGumVMINbxCqk3dIfjlyzmV2khZV4KHBiR+8QbniZp7EasuuzfdKy/7KCeYo
         7W/kqXxLrvNCoMGNVu0f+c0A1uJ3aPoPCCvnLKYLbSVzbcxqWADZE5ABTyZpAaFUbG
         kpWyUj6NBEoxnSMx0E/rMRUtJLj5TmM4/gI/RhD4ce4jxCM7PM2iq/Tb/KqOWJzSG8
         JtWzHYvi9fhMw==
Date:   Sat, 14 Aug 2021 18:28:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.14
Message-ID: <YRfvMnQHHRN/6REq@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HdwLfQVIuJ7fsrbV"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HdwLfQVIuJ7fsrbV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has one driver bugfix, a documentation bugfix, and an "uninitialized
data" leak fix for the core.

Please pull.

Thanks,

   Wolfram


The following changes since commit 36a21d51725af2ce0700c6ebcb6b9594aac658a6:

  Linux 5.14-rc5 (2021-08-08 13:49:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 3f12cc4bb0a4d7b542af43b6f1b7175f13015629:

  Documentation: i2c: add i2c-sysfs into index (2021-08-10 22:58:32 +0200)

----------------------------------------------------------------
Dhananjay Phadke (1):
      i2c: iproc: fix race between client unreg and tasklet

Greg Kroah-Hartman (1):
      i2c: dev: zero out array used for i2c reads from userspace

Hu Haowen (1):
      Documentation: i2c: add i2c-sysfs into index

 Documentation/i2c/index.rst        | 1 +
 drivers/i2c/busses/i2c-bcm-iproc.c | 4 ++--
 drivers/i2c/i2c-dev.c              | 5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

--HdwLfQVIuJ7fsrbV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEX7y4ACgkQFA3kzBSg
KbakNQ/9FDsStvJkyd/Q/w1lc8bvD6VT2Mc0me1QXlkg5LZn5AleEiOg/Oo3RokL
s4vF8Lc5biDdya2he7dvDnJH0ORCveo9lByR1ybFXMB3dw3wPk+DZkuXvTa3zhLp
dGw3IVEalIYDzI17Hay3tuz6R1SXSmkUq2zEctZ+k+RmspxSHHNEPjnydq4z4yUb
GoZgO1o7yKw4MWYTmowAOW1Xfx4iQ9MKUoswKqKcaWRgtss3OSYFPQZHL3BEQRsx
gI+vgNAxKHtuwIPqO6g3qxVnUryoM8B+1DQzPtS3NFRKJwu5C+sF0sfUJH4vb/qv
FaBWyKVfCMriQPOGoVR9WtwIO2quXLCEQ44yGwDn+ZkbavBrYyRsyHV1iRy5710i
DvAZ/WknoGk8NAePVsZwxz3jdxAvE990qRDFEK4gz7Q7S+RUHTtvBTCJP8U60iNW
0UheMWG+sCP9MJCOd6XC3C5AW0r1GE2IXMCTaZWM+8r1Ni6/hBY4RZfkNHwofDxP
19XP205RnENS3zfi8oaeGJV9Ba+edXECvXPEh7HmNkRSwGIKZLLhoDurxRn8pFUz
y8b8bKNVxYyQERqSn0E7zT9cKcENqzJYWiJnOGEUeQdi0Hh38XrnoCR9cQLvUd2r
tI64iDztv66i8MuLlXssZhb+hPZdWcKlKsYeKXC85Va4YThBN+Q=
=qOaE
-----END PGP SIGNATURE-----

--HdwLfQVIuJ7fsrbV--
