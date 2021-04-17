Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 090FB363156
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 19:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236620AbhDQRSv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 13:18:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:60336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236595AbhDQRSt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 17 Apr 2021 13:18:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA5946109F;
        Sat, 17 Apr 2021 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618679902;
        bh=tUjr+wYEDYEirs0FaCMyY4V7y5/vSgKdEpgImqlsWck=;
        h=Date:From:To:Cc:Subject:From;
        b=OE+huC054Q3wjgUhwGMJRbC+gatDqXHydoxEU5hO1YfKJHB53A5WSWUSqj0WXIb2x
         u93yJJh5k/VB+b8As2xx72rxS/HJNfp6d8+tj2fj/BTs/lSJfy1G8USG3RkcbNjR9i
         qkn7yMyt9Uz0CwAwCAoEs4cwocoV42bwrCJUvsnT3lolk5wDcYfrFNBWG2cG7euSDk
         q99Ybvmx87ncRsIMd268Agh7z5IAwuiDiBop8Vo2Wr5bHDSMThSVtSQzuyYo2g826U
         sqbSeKFESi0DMjoKftKy4PaEJi5p/tmdw9g8f39mJXU5d+8fkI2HhaiThsf9wJa5+6
         kn0d9EMb4VwPg==
Date:   Sat, 17 Apr 2021 19:18:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.12
Message-ID: <20210417171816.GA2369@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

here is one more driver bugfix for I2C.

Please pull.

Thanks,

   Wolfram


The following changes since commit d434405aaab7d0ebc516b68a8fc4100922d7f5ef:

  Linux 5.12-rc7 (2021-04-11 15:16:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-curre=
nt

for you to fetch changes up to 39930213e7779b9c4257499972b8afb8858f1a2d:

  i2c: mv64xxx: Fix random system lock caused by runtime PM (2021-04-15 22:=
13:19 +0200)

----------------------------------------------------------------
Marek Beh=C3=BAn (1):
      i2c: mv64xxx: Fix random system lock caused by runtime PM


with much appreciated quality assurance from
----------------------------------------------------------------
Samuel Holland (1):
      (Rev.) i2c: mv64xxx: Fix random system lock caused by runtime PM

 drivers/i2c/busses/i2c-mv64xxx.c | 4 ++++
 1 file changed, 4 insertions(+)

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB7GFQACgkQFA3kzBSg
KbYRShAAo5WyglJcxPLFTWJBuOecptUEv0d5QJWt2lLW0wV4d2Sr7Xq+P20TTBz5
3p+zJemHohXzPA1eZz6XtOZj5RsptiSCVFzH/Vqvj48MbOZoOF5XtcAMIix218Il
gAcXhke9SAtiBwVpmul3BJorti/+5ciQe/f5vaLRrBcXhpRg+9HqG8SUdjNiU9KH
rHAu8N2ViZjwknjQv8rbcShJMkTzPQ0AJFYWZnMKVIK7z/GNmPO6e9PKLAk7JkUg
/04oW0lAaoD+ccTPUP1F4anK6+mdXqiMcbN8gNT5cMhNdudQtoOfGyyQPCQaFblc
P3+uTlFHg2ed2Umwn+pVgPAcMDrPGcyZeTr48bV75OtIWLlbdTOh6tnDISAwKPLB
rRgT/aa1oO1NIhFlxgcnLho4nDHwffCvo7zmWnODs6c8DaYr7xGX6MCNegWs9puF
Ur/L9CZADPXmn0KUZEQWO8iD73+qO96gY5swDYMu3afkzGfHMo2SoKt1Wej3baoF
wdJAZxPYTAEgE6UkIkqTbUpYu8yhK1/Ke9CUMkYukn+1eZ+ns2O+EUuLXRIY7am/
O6XeZK/gp/STlYEIUmiGEtd5ZS/d1oWMHmzx51RgEJEi6WZhYSEi5tkelkhWWNhB
CU1NaYhgfuatYwm4jT0Dw5PcUsUtqpgPgHNytLRQ9Y+dRkIm/PA=
=3wOJ
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
