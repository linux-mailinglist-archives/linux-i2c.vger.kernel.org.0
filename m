Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937EC21443D
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jul 2020 08:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgGDGEG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jul 2020 02:04:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbgGDGEG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 Jul 2020 02:04:06 -0400
Received: from localhost (p54b3324c.dip0.t-ipconnect.de [84.179.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BFB4207D4;
        Sat,  4 Jul 2020 06:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593842645;
        bh=ZT3irlGnF64WXNfcKAnWdFCfdFgdVgmo10q2DEsJCYE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QuCiK9IzZSYW13gK+m0JyUSq9kMsaZ26t7KQ+HvZK4G30NEFUQqu0YV+eh9WWwB0v
         uc6SIsroWYiUzvTBCrU6YRKQUkFFHfla8YYN9sqzuz6M1GEF2+6XY95svOtFy+XbGf
         7ZAcNSFkNVgTQ3PziMlX/lRr24/RTyfglGU4T43c=
Date:   Sat, 4 Jul 2020 08:03:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     andriy.shevchenko@linux.intel.com,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: algo-pca: Add 0x78 as SCL stuck low status
Message-ID: <20200704060359.GA1041@kunai>
References: <20200701223912.30864-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <20200701223912.30864-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2020 at 10:39:11AM +1200, Chris Packham wrote:
> The PCA9665 datasheet says that I2CSTA =3D 78h indicates that SCL is stuck
> low, this differs to the PCA9564 which uses 90h for this indication.
> Treat either 0x78 or 0x90 as an indication that the SCL line is stuck.
>=20
> Based on looking through the PCA9564 and PCA9665 datasheets this should
> be safe for both chips. The PCA9564 should not return 0x78 for any valid
> state and the PCA9665 should not return 0x90.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to for-current, thanks!


--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8AG8sACgkQFA3kzBSg
KbaPjA//ZA4V8vkqdM6BI+DnOYhbryJlJ3/Xh8FydkFeE76OSvY1oXzTdsYHbbM5
VUn5ypXdpSvmqlIG1d30simcZqf57R1CFyxEzknA6O8TQ1wuztsDqMXyL5Rv3k2w
vvwuAWOrcS/DVZCf23upPUMnZpVAfgW8wa1SIE1dayLZmx8K8c3hKSIWYDSAr8l/
EfjurQ6jAyCombwF9tEP3A9hUEnU0Ij2cbwtEsQE47Li/op9/qWEZ6dO8WXesOSN
iX5lJR3v593c6jSMm2YHsk9r4w7wkZruSKWtkv1iu1Q0c1Qut9r+luDWixmymxvA
g+5TM9AjmLILUI48NacnozRIcYcr6BlQpBxN/LxV5irYl42Gts37J1qqB4nxeNEo
erRtscT8c6Ul2zwiEra8aFjBDSnpGt5/YURdObyQptdZVKfEqO3U3nNRf0cX3dL8
y/MD0s42A8XsaWo8BtdkaX4gPpvlDQdGxfy0AWZ5XCnSFzXspHPyyFd728aVS8op
Vu5ofH3whLohnBICdek3oOdNjP2txkHYxThHg3p81ajLu6q4AKmBaES9W+69fPkq
27UTd5xCfEtaiHesDOYxH8HbwYMiGJGwqZhJ+dHYrORCgdsOHrq7WfHaI5ZyQjMJ
mZANXdiq60a7kpAfVkBYJBjxZ1N4OOavkIr/exWFaEGPoyeeVrI=
=aSbN
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
