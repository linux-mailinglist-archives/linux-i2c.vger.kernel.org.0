Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B51DC6629A4
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 16:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236994AbjAIPP1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 10:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235065AbjAIPOu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 10:14:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA58E0E3;
        Mon,  9 Jan 2023 07:13:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC78C61150;
        Mon,  9 Jan 2023 15:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9491C433F1;
        Mon,  9 Jan 2023 15:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673277233;
        bh=aw5g2+N40T1RbR1TXIDcEVtH1DGEdrFT6EahnvI9MH0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bHyqZ0gLuinYKQJX4JV5PH6eWbA0DWP+9R5V5PcW7aDMzBJLNcs8hO4e9s7ethLro
         auDXzgwm2u9fXVpC76rIz6QHXr66W7AcOwo1s+RRXv82CTP1/i6ZdZywZ4bCwGRwYQ
         Qwlk8N0gFhUFErri8rpz+5mk92g6bDKBjNUtvMQg+g5CHbtDyeUlRUEtE56KHfPSiU
         X04q69/oXOkXLL7b4tfUSqtGqpMD5uQuNOQl9f5Onq6HFC/DF84Lpx8VLhrCs0YZpt
         fOLBPNVKZyxoHzV5Rhyj56MYmv/ZmnLXovBbLHqiC6yxUGTs4fkjXBU5vtpeFZMZOc
         kStdKCszpnc8A==
Date:   Mon, 9 Jan 2023 16:13:50 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Riwen Lu <luriwen@hotmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiongxin@kylinos.cn, Riwen Lu <luriwen@kylinos.cn>
Subject: Re: [PATCH v1] i2c: i2c-core-base: Modify the maximum idr id for i2c
 adapter
Message-ID: <Y7wvLi2lA1bSH5By@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Riwen Lu <luriwen@hotmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, xiongxin@kylinos.cn,
        Riwen Lu <luriwen@kylinos.cn>
References: <TYCP286MB26079F414019C8AC9303E412B1E69@TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H1mKSQkkXMj2MtdI"
Content-Disposition: inline
In-Reply-To: <TYCP286MB26079F414019C8AC9303E412B1E69@TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--H1mKSQkkXMj2MtdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2022 at 10:07:51AM +0800, Riwen Lu wrote:
> From: Riwen Lu <luriwen@kylinos.cn>
>=20
> Change the maximum idr ID to INT_MAX for i2c adapter.
> This fix the following adding i2c adapter error while the idr with
> adap->nr has been allocated by other i2c driver, and find a proper ID

How did this happen that another i2c driver could get this? Were you
able to follow the code paths that lead to this situation?

> for it.
> [  357.620685][ 3] [ T3655] ------------[ cut here ]------------
> [  357.626544][ 3] [ T3655] couldn't get idr
>=20
> Signed-off-by: Riwen Lu <luriwen@kylinos.cn>
> ---
>  drivers/i2c/i2c-core-base.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 7539b0740351..c2982861057a 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1535,11 +1535,12 @@ static int __i2c_add_numbered_adapter(struct i2c_=
adapter *adap)
>  	int id;
> =20
>  	mutex_lock(&core_lock);
> -	id =3D idr_alloc(&i2c_adapter_idr, adap, adap->nr, adap->nr + 1, GFP_KE=
RNEL);
> +	id =3D idr_alloc(&i2c_adapter_idr, adap, adap->nr, 0, GFP_KERNEL);
>  	mutex_unlock(&core_lock);
>  	if (WARN(id < 0, "couldn't get idr"))
>  		return id =3D=3D -ENOSPC ? -EBUSY : id;
> =20
> +	adap->nr =3D id;
>  	return i2c_register_adapter(adap);
>  }
> =20
> --=20
> 2.25.1
>=20

--H1mKSQkkXMj2MtdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO8LyoACgkQFA3kzBSg
KbYfOA//anlqhJ77n5oqrNV2ddO61vBkXUw9nCYqP5k1DUuoPRgvS+2Ub0QXe3Ee
xP72qtUOvl6zb+RNovwHQW6onsCtT+/jX9KOvsA9+BbcrEtzLgGbTBtPR4KvRttI
zpVl89robRTA461Cs6f3cfGs5x6H3T7ZKkINXJrJf4LBiBAwHPAC/yh9uYs+OQUt
1d8KgYgtex+9ThFEF/4+ySeB6eYVUKLihQRmW8El6QKXgQTnwKRjvncGmzH8rnYF
5EgUkdq01HPNvrZl6bUpJgcMQCEL3+wJ/k+pTKQ+jEsmIQSIYOrq6l/2E2Of19CS
fYZmKMfsCg/RuMDY6vejHxjNDa9epod39/Hte4TXbucJjkq9KXHdu+cZ1ACmCoOd
ZXxge4aEFR9TNhREb40EuyKMYIcZZgKvUYlYWTa2suSa6EjSVNCtys878CmT4URD
lYA0Fw6GgCg0VBg1IdAorrpbtNv5H8HxVihKyaJOFe4gTOAdmYYrc9N0O1Fnaq01
3ROYXoYzEdd3ks1DkI7e0tnBQGt9g8QsKF4MMcRrnYhsNGJZDgHYKkR1SAQUNA6Z
OJQUWpuGduEIqJtOxq6qFZwyx+bW2Fc+Jzl2DV9dI6PxxvPduxWBMoel8d30TXf4
Lr719zFGtAUR1RkXYWYOG1RsQP9qiecmGFL3OpabEZWWA4Pg8MM=
=WR6Y
-----END PGP SIGNATURE-----

--H1mKSQkkXMj2MtdI--
