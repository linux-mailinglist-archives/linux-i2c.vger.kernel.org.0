Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD4234F9C9
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 09:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbhCaHZs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 03:25:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:41248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233906AbhCaHZk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 03:25:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 785E5619CA;
        Wed, 31 Mar 2021 07:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617175540;
        bh=gfs/4+yvDDSHyYCJffzwiYeFOBptJi6oZMP+hYY43uo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g6jgK0NbJoLV/+kq002UUfJM9Q7ntYwj8tZzSvtw8HuApvG3u5Q3albWNlIkVRL8o
         fynuccx144K2CiLG18+0wW1kB9MwGTI8QNDANkWb5QKOKKgGTdkzBxiLqAL85eqdpv
         BptUuvgJEbaNddEhtS6HeJ2HBTuxmblOiZ+DbmFcEQWZAj63BMtBwPBemj2wZytmiW
         m0h5GoM67coLoBDO0ZWriwy/zK7Yx7dYrZUOhBTityjidy30mQlrA3YrLz0f8mYd5g
         fV/cWzfa33UU8QnujuTUx6NnPbiK/Yrj0qSiXSplqBsVEH1kB6j81FEmlGraTJdRII
         TPcBPVGOWHSnQ==
Date:   Wed, 31 Mar 2021 09:25:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     kblaiech@nvidia.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: mlxbf: Remove the unneeded devm_free_irq
Message-ID: <20210331072537.GD1025@ninjato>
References: <1616144165-54498-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Content-Disposition: inline
In-Reply-To: <1616144165-54498-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 04:56:05PM +0800, Tian Tao wrote:
> Use devm_request_irq to request interrupts,devm_free_irq is
> not needed to release interrupts. so just remove it.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

So, we are sure that interrupts can't happen anymore? Otherwise we would
get an OOPS because of the missing adapter. And if so, what about
the devm_release_mem_region() above. Can't they be removed, too?

> ---
>  drivers/i2c/busses/i2c-mlxbf.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxb=
f.c
> index 2fb0532..ea839de 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -2426,8 +2426,6 @@ static int mlxbf_i2c_remove(struct platform_device =
*pdev)
>  	}
>  	mutex_unlock(&mlxbf_i2c_bus_lock);
> =20
> -	devm_free_irq(dev, priv->irq, priv);
> -
>  	i2c_del_adapter(&priv->adap);
> =20
>  	return 0;
> --=20
> 2.7.4
>=20

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkI/EACgkQFA3kzBSg
KbaMQA//S6K7UETD0+Aql02rXai3MVITV5OYWiekbQhzXCV6NlqyWeqDr//BXzJB
N+dYtfjdyGRUqCK9jIUyFKQHOr8dbfXIy9bt/7UMr9aPYu0RDvoG4n9lIiT/YSBF
o3aXz6jXvDImJh7rIuNM4hZWP/7oZ+/NltdRLy7QU1f4y0NP6jXzW7HT+qE1Z3KB
0MPh8HbSSRY8COSj4aG0bQtoJjAFuoC6KaVdbH82S7f/5JOAIPz5ctkmvzeiq/ve
7e6bsA2sXh+uJ7GJw+2HC/p+hJQhlLrth8SdXfvxWDuDF+VeyozCC3cGp+NPUKih
ew2OCoCAHneSCWLKmU0NZafRMtshuDz9mXqyWTV4A+AdhuphdRd0h8hXdQPopClI
c3Hkkaj2fl6ilRQh8LI9XsT013qgdNHBayPPkyRDcCxIMoyOZc5GrtbiflJwMuJD
Uh149MEkdAC5ghLMVz/0CHBN7/PGsxEfKdPFrS+FmwMMFAhsVji9OU8THC75cTEZ
ZyDCpnqmmnjFNR8QTJ0/53/Gi9d/5P3xubqpuOcRuyC5tZtkfrBson3qN6WdW0Jo
nsIQl+xogw/GMXMDlfj8cDAM8HWyKrYR3a/lqU7wjtnYRQlcd03Dz5GjB8hQKS0D
cL0Sq5Yem1vTCJNoZDr0Qqi3waTXVzkZ7+WhMw2RH7UQWN34SG4=
=8iLh
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--
