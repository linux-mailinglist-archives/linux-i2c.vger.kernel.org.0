Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC76028A32E
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Oct 2020 01:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390475AbgJJW5X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Oct 2020 18:57:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732642AbgJJTyo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Oct 2020 15:54:44 -0400
Received: from localhost (p5486c996.dip0.t-ipconnect.de [84.134.201.150])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CDE422246;
        Sat, 10 Oct 2020 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602328583;
        bh=U4cdh7dwjwdM5zAxioLEF4oJApkgULJqjXDXDatugW8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LMe66DGgw+AqgbPu7cJ9KPCe/BW44Ezb7p7Iyg1sl5E2kAEDk0gGPe9w9jRz8byjg
         i1zSLEk/7iq/2XlRas98CKR45FmOxe8aHwtp6Rfj6XFQ6LQy/Xeni0reCzopDIizSt
         yTt9zFScfs7Tuq20LkrO5384f+8xlxC8z4M9O0pI=
Date:   Sat, 10 Oct 2020 13:16:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH 1/3] i2c: owl: Clear NACK and BUS error bits
Message-ID: <20201010111619.GE4669@ninjato>
References: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
 <6ee573f2904c001ab07e30b386815257c05f6308.1602190168.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Content-Disposition: inline
In-Reply-To: <6ee573f2904c001ab07e30b386815257c05f6308.1602190168.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2020 at 12:44:39AM +0300, Cristian Ciocaltea wrote:
> When the NACK and BUS error bits are set by the hardware, the driver is
> responsible for clearing them by writing "1" into the corresponding
> status registers.
>=20
> Hence perform the necessary operations in owl_i2c_interrupt().
>=20
> Fixes: d211e62af466 ("i2c: Add Actions Semiconductor Owl family S900 I2C =
driver")
> Reported-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Applied to for-current, thanks!


--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+BmAMACgkQFA3kzBSg
Kbb+Ng//Whds9uRZ4LlhO3Up0kDYIsrl2tVh7o5moP5k+/3YmDlqNdyfaq2ZcDgZ
zAdpwobUhUPbBQ8pM5ePoBrCoiQQ5sJCMih/WQwqE/nuYsYkPism1Y5IuRwWXnsQ
Z8jbn87E86mQQ7rZXg/fcpBdaVxKdFWlpBJAbJGE4C2BgD3u/yLdBc1aI/TfNMB1
u5QdzKoxZ++2ahPa0s3fRJ4QNg4mWewJTjeTqDxI5MuB5KTF3cZXnv7L/rITsaGw
yAzKKvIQlt9Y+m2GGLbVUf/22Bj2YUDOyR5sHR/ehFGs65+uK+jafFND+xSCwOyH
ikDJL+lUbYGaB/Y2fIE/8AfW9FGTMwyAYX4S6etZGi+NOT4iPEo3mWqz6Ol8+1st
DERrviXTQbMavY5dIiQVJkMqsvVQH6Xjhhmc64j1dRNipQr0bplNLx3CQBwD9Zfn
GicX9eJ9xWEiAHR25Kuyh+m/kpm1LeLUnqAYBeUe3xabMvH+U31WJafYvuMfozvo
d65OakiKrAhZLVE28Ty07/OOyXNB+0Y+g4z+uhrQ+TTwKJqRZrjv5MJYi1ReV637
bCEP6jybHXFZu2jzXitPB4NFNJW81Rf4wEO4o+lmCw3XKQjKktyQNko6LW7beHwF
sAG6B/V2vXUmgWt+RBp0+Mg3s9ocI9xfLLfs2CXs12wTaKT/+wE=
=DCB7
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--
