Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3534E3AE070
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 22:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhFTUuD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 16:50:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229905AbhFTUuD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 16:50:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F10B06108E;
        Sun, 20 Jun 2021 20:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624222070;
        bh=Bp8cnLr7xfqy+UKnnykADt2ZO35GTyUrsLstokF0RNg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MI+FE/u3nf6Isuo06cjBFROaYAOqk3WUkfMKaSaWv0HbKKLbmKvxVaQP44IkbQhhN
         vxkcXCzJV2TAQoGAH4jDhTM9J4H03DGva9eXn+GZvBdqn96d4FaohLXibXGtdw/9A5
         359EbzJHwZVpdPRafLLY+Em0rd7g7a+8QllrxD3BM+X3tX4GsGSvkFLM6X3eBWrIQZ
         Iy6WgXkhoDS2P7kxbhhx/sKgk5RJ0lB1BSPhB9Fo3O/jzLHkQonLrkFaSIDeBbVZue
         hi68mDoudMO3PrK7k84ydKL5tz1Xfn+dWkzBOCbY290A7GCrKr4QYZaa40CtseeeHp
         lO1Cb7ynqOVkA==
Date:   Sun, 20 Jun 2021 22:47:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/1] i2c: cht-wc: Replace of_node by NULL
Message-ID: <YM+pcm7WaK0LvtQQ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
References: <20210609173035.83777-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sAMmsqq1V/mM7NId"
Content-Disposition: inline
In-Reply-To: <20210609173035.83777-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sAMmsqq1V/mM7NId
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 08:30:35PM +0300, Andy Shevchenko wrote:
> The driver is run on the platforms where OF node is always NULL.
> The confusion comes from IRQ domain APIs that take either OF or
> firmware node as input parameter. Since fwnode is not used here
> either, replace of_node by NULL.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--sAMmsqq1V/mM7NId
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPqXIACgkQFA3kzBSg
Kbbq2A/6AsBLgI8X0UQSGvFG5aemun6SOI01KYa2LM1B33EF6VStN+YipkX5ced6
M/JiBWtb6B06rqCAZzQuKab+s3R/wp3xAIwRcJHxdMrE+nsww0PwWc5AfyZjd5+9
BUdt8hkmK5FD7cXUXIe1vQ4CdYc6kkMtK6sR1j2tfeBhuB7cclXKEBHYjh7AGvY7
PGrCMboPAIBMey6GGfiRp2ixpoxiRALf/2OmJxBJIwKFzVvgL3KnkYDcOLAK7abp
R5kzZQROAeAFT/TTKY//bh6LbinuSCUQIAtxTizxkNVpu9hlwyS3YTPdlzqc4yOM
OFHtBV5b1PpnkCCq5xJYZfcAh0+1vWbPWn1nJ940mFed1d1BM1A47otKnMHrY97C
LnT64lrr6z4uG6Ohdq/3uVjiMTb3d6cXL03414uezjqN2+m4zfDcTERP8wXYmC9j
2m06Ti9lP+8U57sXtfDtXGCkxEd96DW0GBuxkQZ0slakbxh7aK14/a6yzQZwYxCh
4KoU4cHwG3mPfnCv8wXbhzylVHZiUZPqev7vIW1489xSMUqTD0rKa5u2W//L5nlU
bM1u/gPijW/dFp4n3fx2k66EvASB8AvkHEVqw4CfxufJFxl3jDiZXWkcQDFsFk+Z
5QXhqUBjF4DZJp9jxNStUekoDnTIuIwcPHD/hbfLfdeHkLCMnU8=
=2uBb
-----END PGP SIGNATURE-----

--sAMmsqq1V/mM7NId--
