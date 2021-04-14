Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52B8135EF09
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349881AbhDNIEo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:04:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:60204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349887AbhDNIEg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 04:04:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BDEB61179;
        Wed, 14 Apr 2021 08:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618387455;
        bh=TG4nP5Bkld2PjnN/8JUb328aNVrDFABId/IvxQvT2g8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mb/UywYWL3DXr8vyJn1hemUOkNZ2cNavGmuapnJg4Vb8asObE5JKsmBEAGzbhmjKn
         aJ5nKuoGTkZ9Qly4rZ2ot3Kfji6ki6Juj7UJ+XJrPYD1ZxyA+8fEHsRvcSnx+f3/gl
         IZqWiue02pI0OMrzf3WkXg5E3BXpOWlVQotF653aLHbXGC9fPd5W+dyZ1rJbu26x7Y
         gAUjzZ0g/sXFqWWRjxv7SzAN6woXfQr0fOResW8p0AMLL/2MZh+kp1FswFEfLX0XIe
         8SIf/KngGnO60ngMluBTv6PKaG9JIj+eEq2fA5ZNTZFoI86z6MsoswEl57FMjZfL/j
         eng/82NUELumA==
Date:   Wed, 14 Apr 2021 10:04:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ye Weihua <yeweihua4@huawei.com>
Cc:     linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, yangjihong1@huawei.com,
        zhangjinhao2@huawei.com
Subject: Re: [PATCH -next] i2c: imx: Fix PM reference leak in
 i2c_imx_reg_slave()
Message-ID: <20210414080412.GI2180@ninjato>
References: <20210408110638.200761-1-yeweihua4@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="++alDQ2ROsODg1x+"
Content-Disposition: inline
In-Reply-To: <20210408110638.200761-1-yeweihua4@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--++alDQ2ROsODg1x+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 07:06:38PM +0800, Ye Weihua wrote:
> The PM reference count is not expected to be incremented on return in
> these functions.
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

After rebasing, only one hunk was left:

> @@ -801,7 +801,7 @@ static int i2c_imx_reg_slave(struct i2c_client *clien=
t)
>  	i2c_imx->last_slave_event =3D I2C_SLAVE_STOP;
> =20
>  	/* Resume */
> -	ret =3D pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
> +	ret =3D pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
>  	if (ret < 0) {
>  		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c controller");
>  		return ret;

I applied this to for-next, thanks!


--++alDQ2ROsODg1x+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB2ofwACgkQFA3kzBSg
Kba2ABAAqCYKxzJHnfOMkaWfNU6FGvFtUmEybjPv4Bnw3Vq7FXUQJCLmSCVXM57B
jMgCqk8lQX9fRRSKz7ux8Gq1XJcl3f+66EY2RRB2TzWR18qqa0aUwCxxajoo8qPp
u6rLf4KbErJtAYoma0+W54AYdgWoy6gxnw82yC0xMv39MK8XxlzEbRkVxIovbzxD
/m/XSUtjsDybPN9l7aoESsPXzASXikhH0yNOmffsZCybZ6Xk6V47QBdJz2uHqg0O
y/8V9X1+vE0lqn7mEM+9ShghkZCXUZFifmjIGGoO4SmsCa0mKk6Iq53qL0+OHlKi
vrBQMb8R+t7a2nZnijSLsGHcNx2Kx9HMmn3HY57g4Schlnegin0LRlinMQd6qhuQ
NPkqeeaXdogZxqTXep5udxPht8SjhSex9/L2sAJafrbaNI3FCusQGYu5aFgELJ2p
sQa6BLXctvkSHib8Nfkec7TaX/4mk/vheKpQDpMpYoQ85SgHDd2QCC7ixw4h/ZK9
h2lBp/2vTSUmh6HlUSon+hwulSQdv/nVOK9NL51JaojQ6BP/EJbzMEqPr+ky2O2y
n2C2iv78fMd6SxNCX+5UouqyR0zrk7DlhJr78MkLuvEYdQVwd8ySRlTJH0S+/N3p
YYZhwD3JCurWpOBtR+mekZXfhpJkiQvcG5Qt7oaMe2SsN0wRrMc=
=jEO4
-----END PGP SIGNATURE-----

--++alDQ2ROsODg1x+--
