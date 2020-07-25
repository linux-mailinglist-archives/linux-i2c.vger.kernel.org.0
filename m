Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D211922D831
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jul 2020 16:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgGYOqI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jul 2020 10:46:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:50430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbgGYOqH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Jul 2020 10:46:07 -0400
Received: from localhost (p5486c508.dip0.t-ipconnect.de [84.134.197.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5CE2220674;
        Sat, 25 Jul 2020 14:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595688367;
        bh=vcSG7943G073w6Pwb+rh5rVweLM7A/kq7rjNuL+rk/4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VzxpYRw+ElVEjP9xb0LM+GztZNW3DKWGGFlu4AOvxHHKTHxstvxrs9A1jSRaSVrTt
         htpsL1fjUHqZhZRBT2EelQ2cQL9zT8FD3hrieR+zjhZQ6t2wSCdsx75G1/QT84WdME
         xLwGfIiAxvcfZaHWsUb1v8krvayBgV/puFY4ehq0=
Date:   Sat, 25 Jul 2020 16:46:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PULL REQUEST] i2c for v5.8
Message-ID: <20200725144603.GA4013@kunai>
References: <20200724192728.GA1596@ninjato>
 <CAHk-=wjaHZKQnOuGLWukvMrTmDrDd6iyiq5toQumB2uX1nR9Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <CAHk-=wjaHZKQnOuGLWukvMrTmDrDd6iyiq5toQumB2uX1nR9Xw@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

> Do you have a lot of pending fixes? Because things _seem_ fairly quiet
> for this release, and right now it doesn't seem to make much sense to
> delay 5.8.

No, it is not about fixes. I have one fix pending and I am quite sure we
make it for 5.8.

It would simply give me one more week to get some not-so-complex I2C
driver updates into 5.9 which I couldn't apply before because of my
holidays. With the next merge window this soon, I can now choose to let
people wait 3 more months or to put some stress on my side (bye bye
holiday relaxation).

So, I wondered if maybe more maintainers would be in a similar siuation
and we could get an extra week to catch up (I know this is not a
technical reason).

Anyhow, given your response, this seems not the case.

Kind regards,

   Wolfram


--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8cRacACgkQFA3kzBSg
KbaPXg//bU7uyvbHxTOXq2iXko57j42kewqZbf5hy3Gjfkjad5RLzSRfQaJiYq/C
jCL2e+RpB87yp65U035PyVSzzw5/v/BEZu6ulF//ZDPMBX5T7U+FEMp26IsnNH6Z
rDAC7/T9gjgALcGl/Ux8lca9BcI7APxh1wFPzAKtIc43pEWlXC+yu/0MmTewxZO7
B4wbXO2wYhKFxEVJ29JFz2I9YJTyk/PyEgk/pYPn5yN5s6Dkz4QNAwoHzwd8Sulw
RNTC0wahwplwUThzvrCnIPBMxNP8bGHTe2bCwQSkKhcEL9ng1pO8PodZSfsa5em0
VT/KMucDQpkZ3xOk1OWRZaGOgZLsqVOs3OT2IRZT7bfAcH/jbPHG/CVmS+SYB8J2
HipnN8f7rwtrUGrhc8bcuPHtq+4pUUsd1yhMCwfI6wKW0Xk2Atdz0cBXI5vZeFXH
Q7TTJcdgwh7o85tQZhP9RpURe03klkuJ/WW1WoDbbts7M6Y15sbso3lLt0SCGnOi
6xb0IiqM0tWD7g8sGxAaZRwuwT62BqvYpkx73NK+gFOdN1G8z5Epkzvmy9T5V2dl
e+C8yYkeKfjaHHtVJ3007t1QxxIHDnMDjDw3WaoKCiCKus5TT/LvLWf7fPdDqoMI
VyPJn2q5pepha8sXUOxOVYC9klZJ/xxXie3S6RIaQYDV9zFNEME=
=U/Zx
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
