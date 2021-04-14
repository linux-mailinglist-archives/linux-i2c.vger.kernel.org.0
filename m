Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1398935EEE8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346219AbhDNH5Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 03:57:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:41750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245671AbhDNH5N (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 03:57:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84C7761168;
        Wed, 14 Apr 2021 07:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618387012;
        bh=ZlI+ifK8nDRxlFjrAvKHl93m4FsTVNazVsbtuHBYRXo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lz2DuH2A056JAvCSz/PJca6NQ2CL9S9KSqHp/xBPWKhuA7DeuCgzpQcGUYup48U8e
         j3dTzNKBwPsm+nzEBQZjLhDiYeIrFuKF2MTg9aQzSbZqmDjXVu2Fud3h53VWEur/G3
         QvQn7L+7q0eM8qC+ptHCXbvvp0pN/VAhrLefcHynu/WEAQYd4TdMA5ILgUi7EjIlMx
         VSCQXhsiudBVMnN0ac7kbAVuXfpDJ9KorWjdhZHZpN4Nbp+sOEqNrzI1GEKBhVmx5J
         tleBlmj4w1USQOaxatsY90Zcv/9GJAdopiLqjJVzCcdh9ullnBQcmLBfR9xKxqFGEv
         le2WXaUT4XnFA==
Date:   Wed, 14 Apr 2021 09:56:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ye Weihua <yeweihua4@huawei.com>
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, yangjihong1@huawei.com,
        zhangjinhao2@huawei.com
Subject: Re: [PATCH -next] i2c: imx-lpi2c: fix PM reference leak in
 lpi2c_imx_master_enable()
Message-ID: <20210414075649.GC2180@ninjato>
References: <20210408111930.203574-1-yeweihua4@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline
In-Reply-To: <20210408111930.203574-1-yeweihua4@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 07:19:30PM +0800, Ye Weihua wrote:
> The PM reference count is not expected to be incremented on return in
> ipi2c_imx_master_enable().
>=20
> However, pm_runtime_get_sync() will increment the PM reference count
> even on failure. forgetting to put the reference again will result in
> a leak.
>=20
> Replace it with pm_runtime_resume_and_get() to keep the usage counter
> balanced.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Weihua <yeweihua4@huawei.com>

Thanks, yet I applied this series now:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D217733&state=
=3D*


--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB2oEEACgkQFA3kzBSg
KbaD2w//c6tPpaUb7wtiOq6bOZe+m2ZS8H8jOVPC/nEP7Ka9kHUg9fRAbiR1K1rg
21TdJ9N4v9wlCpNwz11IEEhkP2Q+jrY27CzcT8M2v19vaWJH1O1tySeZa7bncvjY
fKrw3839HDPHIq6pAErbRDwiaj8UGw5/nsLQwF3NEI0OTkcuOixk2f5Ff9J77NHd
NJh+T69QLGQNsXPZJNY7EKocqEGOYQTnCLwnNymAJk31+J8YUYmSgGZJaM5kK4cI
ThTEGeI+7mroX9476D5qQMUgxUHUmhq0xb7GrzuWixXWjLJPhR5cQaYekvZm9K2/
g9lzkrktoFEg0sImkVsGGn3XSEB9EFfbSdLmB551Qbm962Ppix5uztp6B0Qk021s
0yqWcOA+t7zuoL0Gezorof+CNjghM1EMt35+He63oU2Glzpe13+yQ8wKj+mfql7J
pXwOUFK+EgjosnyoKkE1RTxnxmd9ZRX0an55d1EMjSLYrA+u/2Thcqh939RH6UFa
acoVQMR3fhawo6XFqQRyZE/fPczsrmMhhZ4stR/v+vm5jqY5BgI4xQ1amCiVl3qr
UIdetwb+DpFr2KwlSlzS628s10WYfT6c0u2tVsA8oswvJr1XsjpLn56LdQT05kx0
vfHuQLFytVpGfUMEAxOuWzOEpgqOeZVlJKN1Naa3rwLYIi/Qd+k=
=lutH
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
