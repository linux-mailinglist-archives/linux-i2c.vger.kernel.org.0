Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9D035DEFC
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 14:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbhDMMfx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 08:35:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:47576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229730AbhDMMfx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 08:35:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D9CA6128E;
        Tue, 13 Apr 2021 12:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618317333;
        bh=jZq27WHtD28iaDPaxdRQdCiW4Fnh0dePIgDdkXHZc3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LAv+3hMeHEqlxWgwh6oyJugxWohxTict/My9171bvPww47HspB15sgTu7FAbfAJoI
         fIRUwOOq2RSB3GojIDBUfvktn78o0tZ5e8JTsJf5+jbsIfTl0fhOJ8yNZpSW7wGG7R
         nxN3bnyaR90N1SRP5d75tOSGizN+lZjJyC0XWoGV5Qhx5ESKxw5DSelZdhrk4J+whr
         mD4oOeM9GcQdHbUeZbBcOsl7o/ZW+4HNjK7N6G5MRKv0uhX19IvORo6lReP4PnKV76
         tGIf+CHXt9VgS975Ohn7vDRsEXv1N9G1QtjCxWqRupWB6WU/e5adpQfEu0LYaNRAFq
         liGbHPstqKOow==
Date:   Tue, 13 Apr 2021 14:35:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Linhua Xu <linhua.xu@unisoc.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] i2c: sprd: Add missing MODULE_DEVICE_TABLE
Message-ID: <20210413123530.GF1553@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bixuan Cui <cuibixuan@huawei.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Linhua Xu <linhua.xu@unisoc.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210410035044.11418-1-cuibixuan@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HCdXmnRlPgeNBad2"
Content-Disposition: inline
In-Reply-To: <20210410035044.11418-1-cuibixuan@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 10, 2021 at 11:50:44AM +0800, Bixuan Cui wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>

Applied to for-next, thanks!


--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB1kBIACgkQFA3kzBSg
KbZDrA/9FvLooUUs4AsjyGRYipNco5Ol7z7YKTI0xXJmFyAo3kKTGFpQH8YTgd0Z
6D4XwZYhd24uMewRDSzlmCLBI85oDkC/6FV1dIOY/7P62lwkkjYOCw7UvA3sfPq9
M871GHF4w1OAKTylSL/ZAi7llH0ReofkE1n/2L8ALnX7iI38xMwc3BeCdgMc2HFc
nuGvOwOcJLzByakfawWB1Q/hiDZy49DpkhLexw+cXNtYBS6y9zRdyjiZisgGS/mT
XduvW18Mv/2Xm/qz8RGKwdWR8HDd0g8KVZ4ZcQm4LsiuxO8fnHftTpMcmzrsgbOF
KMbJdIC6l2KPPDlk3LCm1bmdIvqtlb6dPeFkx0u65FXi6mr5JaPEqPXLhzrXZ4YN
JmPspVHwk7BfcRIlJ+H6ZmbWJn85xV4d07jfUvg0QQA+KHGroRoG6GGxg8/Y6BWQ
OKdr4X5sERgm7/3OgL2Ka1GjOr4sggLZTw9J9IBkZIByzto8qNiZWe5Zhuweb1ix
O2kvnVtF3iQMUJGgLt1unLQeDgwBVB7vrrTvlN/gmurTjQi2ClLtIiBP3NARBf7C
8x5+nkbyCXhmH41GtfFbnSdl9QPJZOwhUWwCBvUAxbEAJ+n+QtElSB3sY6ZKh1Gb
hX794odocfaC0pyJ4MzNFlWw/GtP5XGZ2+Hw1+h5AlQOah541o8=
=LBNi
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--
