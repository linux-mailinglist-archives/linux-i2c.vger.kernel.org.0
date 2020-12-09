Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFECB2D4BAB
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Dec 2020 21:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387405AbgLIUXi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 15:23:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:35034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387451AbgLIUXf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Dec 2020 15:23:35 -0500
Date:   Wed, 9 Dec 2020 21:22:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607545375;
        bh=uzNNrMsS5dDdFc7L8sCpXmso6Sbld2saFYXuAW0oZ8A=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=b3hlZ9n5qV52rd2drTUaHTr9fAC2C2pBWZ2OM4PkHS+RtPW1KC9g2Y/LqgFmCmG4d
         gt7c2Nbt3OugxxlECFvt9c6i4LuupXWZcIlMt1yZ3YxQ5RMkef2fI49iz7OhI9n3ZH
         hG6RBn7yl9roitPYV8LaWY/siqp4K3noWk8ZuLQqJqEm8QBDGI7DZb0n0pjAKkXdt7
         vgpQ0Ra3neYrtRJQbnKMkRA54TMVnCybndOcqmsN09do8SRmP7GECQxPmB+xA82J38
         tiz5AQmvuJeQPJFi0tV1t9ko14q9P4l3gNdzZgbS9DrUnOb1qw/ulrdBPjCzSa0o62
         ZmldXlOpz5vUA==
From:   Wolfram Sang <wsa@kernel.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 11/18] MAINTAINERS: Update entry for Actions Semi Owl
 I2C binding
Message-ID: <20201209202252.GB3499@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
 <0fd6baffa255ab37853f738aca0c466f471002ab.1605823502.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline
In-Reply-To: <0fd6baffa255ab37853f738aca0c466f471002ab.1605823502.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 01:56:05AM +0200, Cristian Ciocaltea wrote:
> The Actions Semi Owl I2C DT binding has been converted to YAML schema,
> therefore update accordingly the entry in MAINTAINERS.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Squashed with 10/18 and applied to for-next, thanks!


--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/RMhwACgkQFA3kzBSg
KbaEcw//d/bHsY7TOJXsndIwMEkflMEJi1+zmgo6M3cKKnqrQxHbtVmikOADH6JO
0R/bkruAD5n1us9yZAQVDFuFuGkyLlA+q50Ik7ZKILL1E0vQtc9ELqOUR76SazDM
SquEOMF2tsGoWZCGIgUX9tM75HqOwh/Jk1DVi4Nl3NRsp/xVqfBGpEConJXXiKpZ
VQM49TL4Frdf3N44kzYAC8NQTMaNEhLcGfLZrP4G/KwlqXjfMAwwWcIzVjT0Gmh/
rgweZY5/VIKa4MNaVKG3WTo9rVvb0ZWKbo1SFXWW3exQMLUhIG5TN08YJmMRBzhP
eXl27bqqJwq7/vn//r8yVu/6pfu7fYJGaGwh3Sy4B87YvvYxoAcmWsLQ2+Mgg5nV
iw8oxO2HMGzJZm/KkbsFzR8OtN++iiPLo9wCfXtEv0r8V5BUXQOm96pMzoRzIM4T
KC/R0GEqQlJEPvLKx2AvkFydjVnAu0VSCHWuWoPTHUNTlFTUKJZS/PW9kL8K2YEJ
u35P3ZTwPIuGg3UNDvAWIDGDH7kCCFzj0gkdNDs4iNtVwvRpe2os65kNQYpIuVTE
D4RloH1COjrpI3lBiY/VGelDCK4Dz5s8cdv04rxMrkcMmo22RkMloR5aO/aV98yP
ZWOu0lPRTtpTHDDOAR4s/juMDNRodvarszRI4Idfvl87RVgcmwM=
=/Eem
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
