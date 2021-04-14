Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC58435EF76
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349964AbhDNIXK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:23:10 -0400
Received: from www.zeus03.de ([194.117.254.33]:47556 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349952AbhDNIXK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 04:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=2iL4tCIneCpn4SmM0M3Refp2Ot9p
        z3eawuOR7oYf+eI=; b=TLEFk81N3oowj3OzJV2VJ5fURdhQSJB+AJORkw84d5Jq
        elzQdi6pGg+S3zPzVdugiGpV33MEIj0ka2MB41ekcAwtr3X3+II7IsNhl+NxSf4V
        8lLMIQryavEECIUEPBUnXmRtqkqeRa67c/byd66j0fEQWiCH+Cza5nhf/QGpePE=
Received: (qmail 1266527 invoked from network); 14 Apr 2021 10:22:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Apr 2021 10:22:47 +0200
X-UD-Smtp-Session: l3s3148p1@v4+kc+q/2rkgARa4RUbaAViwQhp+rF7q
Date:   Wed, 14 Apr 2021 10:22:46 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>
Cc:     linux-i2c@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/6] Stop calling devm_request_irq() with invalid IRQs
 in the I2C bus drivers
Message-ID: <20210414082246.GK2180@ninjato>
References: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="asNXdz5DenlsLVVk"
Content-Disposition: inline
In-Reply-To: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--asNXdz5DenlsLVVk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 10, 2021 at 11:11:59PM +0300, Sergey Shtylyov wrote:
> Here are 6 patches against the 'master' branch of Martin Petersen's 'scsi=
=2Egit' repo.
> The affected drivers call platform_get_irq() but largely ignore its resul=
t -- they
> blithely pass the negative error codes to devm_request_irq() which expect=
s *unsinged*
> IRQ #s. Stop doing that by checking what exactly platform_get_irq() retur=
ns.
>=20
> [1/6] i2c: cadence: add IRQ check
> [2/6] i2c: emev2: add IRQ check
> [3/6] i2c: jz4780: add IRQ check
> [4/6] i2c: mlxbf: add IRQ check
> [5/6] i2c: rcar: add IRQ check
> [6/6] i2c: sh7760: add IRQ check

Applied to for-next, thanks!


--asNXdz5DenlsLVVk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB2plIACgkQFA3kzBSg
Kbboag//a5PtzuJjX3Zshqcl9BmZ7YilNzlFuZcyb0Blgkmt4cvUhpQksKHDYYqj
8AbqAsUUxB7wfMuKZ6GGbdhgJ7ZsT/ryqQX8PHhID1Ij+bnjmogXblyQFt2eg2YV
yNjE9PStiYJaBfsdsmTcOuflqZTwGgAYFAsEVemM9Ynec9IWciYkLbfzrbPIu4Zp
bKYIMX+frmfN7xKRSTCdZhyOqjHEH3j1a2Gtv7wGkjWT/2jyZ4jBaBs9n/+NVffI
WvMgKJW1eJy2hN8Z/LM3B9lddAjJRmlOP/O4XY6rL4kN1p58eS0vbIUJr3Dwdzie
xP8+7h56wjGAH/Cf+52Rro71Y6E+UjlOAPsH4EMSCzD6Aec7ONl3ABAMuxIzTWYV
Mjj/u8ofo91ZPxWeY0RM7tZNMYOh2R61mYC9d59U+RaqUR4nBrodL1Dtytb7DZ1D
5VYLRXvWuvkYuF3QXFfNaRvP1nSOCvam4TZJpKiEhIW4LTcaAyLtOWGeI6Hi64FF
teNWxwQMNPoy8jkS0V7NPJ2omfxXFzAvrljwTesDZ3dzoscNMzzc1fUjuw780jRD
lm91j74IAuN+jMPqrrxf+Q8nj7wZBUFG39+Q8G9owfFvoDn7eqUCfv4xCogMlAf3
SbyRbrs/lkRGisTck85c72/QlhsZImg5scDXymqhM5AahRLTpyo=
=Q2Aq
-----END PGP SIGNATURE-----

--asNXdz5DenlsLVVk--
