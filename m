Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44601D7F69
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 18:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgERQ7c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 12:59:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:45606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbgERQ7b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 May 2020 12:59:31 -0400
Received: from localhost (p5486cdc1.dip0.t-ipconnect.de [84.134.205.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9804F207ED;
        Mon, 18 May 2020 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589821171;
        bh=w0HNXMQtb5MPVWf1AAAYPOcwduF4qerzU22fA0gSZiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HHEGijKf2tjytccux+SuPlDtZb3iKDYVNS3Ck6aivHYkEgdwJogUZYvrqXz6/6nBd
         s+TW35CSH6gLtriPMS/4JmHCYvVcQFvC0xyfm2hZ7H8e+HGLqiYSqRYKAcmUixHg+8
         n8ycxmeFNXpxpd/UERdMwyR6PRtqDnuwYSa8pjt0=
Date:   Mon, 18 May 2020 18:59:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Colin King <colin.king@canonical.com>, qii.wang@mediatek.com
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] i2c: mediatek: fix integer overflow on an integer
 multiplication
Message-ID: <20200518165928.GA5109@ninjato>
References: <20200518165529.57821-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <20200518165529.57821-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 05:55:29PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the calculation of sample_ns is using a 32 bit integer
> multiplication and can potentially overflow. Fix this by making the
> constant a long long to use a 64 bit multiply and hence
> avoid an overflow.
>=20
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 5f1ae73d538a ("i2c: mediatek: Add i2c ac-timing adjust support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

CCing the patch author.

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt6=
5xx.c
> index 702061805925..c93492b997ce 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -551,7 +551,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2=
c,
>  	const struct i2c_spec_values *spec;
>  	unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
>  	unsigned int sda_max, sda_min, clk_ns, max_sta_cnt =3D 0x3f;
> -	long long sample_ns =3D (1000000000 * (sample_cnt + 1)) / clk_src;
> +	long long sample_ns =3D (1000000000LL * (sample_cnt + 1)) / clk_src;
> =20
>  	if (!i2c->dev_comp->timing_adjust)
>  		return 0;
> --=20
> 2.25.1
>=20

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7CvuwACgkQFA3kzBSg
KbZ6Aw//ZeFST6GFjXIXi4OO9acwzfy4x/KqHdw2rfZlnN+ZtibcHk91s8Rnkdxk
7H8sRbJ+28ketszWJnKuhtD8z0+itUi9H2mgbV/RKhPfAzWOoLdt6fLq9OA0KzZh
Ap82nlpIpeVdr7RK+YxcUE9imjdX5bO9fZszo7uwupiUvYm+8hg2K+N8/ZS9Gz74
AEVfRRONIT9Eg+sGk+QNa8wXRitDVsXWrO9ZCWOwEJENotDFCzhUp1qv8AvoF6tq
x0LdEjnpKBe+1rl990NdipL5JBOkh6XTiWer9juE9RyRHZVshuj9CAvyVFYGHCrB
eXB7Ay8S1zkvNgK9kCD3zf1op1kCAiy27RIB2VMlyMX/FzoI/grRInTgO+ApmFW2
e4ZnM38h3lLBXZcho3JjONGt13IMhG0nTR+IWD8yEluXhoKEqZ6EU57GowCS8/sq
it5j0wZZFHLiAMty57Jg4run6MwIDkoCMZqQuPAO17kFstPBKZ8tNIQi1one8CwU
MjgT8Z8yZfaTffAWrhAEldeB3osQfGMbA3mQGdGtLgk5lNNvEAGEWNENzUduANJx
Pj1pvoNcT4rMrLawMbUQbcYLdk4s2vULjtEkyGIbWoNhhJRGT1W9GwmDWaIoiMoh
6xb0jHycEOQOW1xyc7Iw5d2wS67l2y92J0ruBCvYgbUJ1bkJfUA=
=KBYJ
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
