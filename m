Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1ED26DBC8
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgIQMlp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgIQMl3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:41:29 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA58DC06174A;
        Thu, 17 Sep 2020 05:41:24 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t10so1922130wrv.1;
        Thu, 17 Sep 2020 05:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NBHR/fgIoFwmMy9FagkEI3Hp1HWTM/rAeZswTOULEWM=;
        b=oiHEEW9KiIBL2DtNhJzo1QxpIOhm/e+pIPpsmvTwBi0d839K5GCBj6IRZCNCfUcYun
         l34MEY63AWgKua4s3sM6I+oOsH5k4SKzzqlpFro95p8kdcxVZxNfEdqwHCEBcNZE2p4G
         OBvUvyD0P8qxXd+7y3EYGeM54tztI43PaLRlvQQ3o1MdDmNSQ8YaS8w50MHUyNQr9ToJ
         ntCzZQlH+YfVIGc16KRfHP6lft+7ZzVlyXMgbu6NkTHiln9SqwU7v6TBr4Qw16ROBisn
         U7NgYoop96e/xVbsV0d/jAViqsAOr54TNE0z5pj908JLONEpFdApr22LpyurOjikRp5g
         9bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NBHR/fgIoFwmMy9FagkEI3Hp1HWTM/rAeZswTOULEWM=;
        b=Kn4JzFhU7aI2LSHxPIzPjtFCdnmmjlCOWiv2Hr7u2xV3o1xLawqVghh7OGfXdyfpfQ
         CODp5XuTHpGYto07ozbiDZCwr5lfHF52akmQVBXzgC3oNcOJmP6IGL2s6RvSLeWKBN1M
         4eTvklSrL5oEHC+k6dXX2t4vCgyidWMojAjVbfjftIth8x6yydJ67NHBefvLKsyEOcUG
         PyX5ap7Wj2XCHjFtOXc7vRD52Dns3W9u44iy3vkteTWoWySRn6QnL9vtNxxlmZcW4vUU
         m3XFgX9+vJOCYMGpIbXsPqQYk1IuaZFsgsdVH1v/1yUK/p3/3if2Qyd0+OjVALLohiWh
         00aQ==
X-Gm-Message-State: AOAM532Et2h5ub/K+Kn6DKNE93evZYxvvTDBLs0nDQh5FVr/DNLY/7F8
        J2KlyIDboIYbdO7X72fnbq0=
X-Google-Smtp-Source: ABdhPJyN19L+ZxIYbdbk9hfFceuN6mCl4fWAlDvGP7X8RBovx12aRuredCaarWMW85c5lu/4CIwAvA==
X-Received: by 2002:a5d:660f:: with SMTP id n15mr34461459wru.103.1600346483526;
        Thu, 17 Sep 2020 05:41:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id o15sm10476800wmh.29.2020.09.17.05.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:41:21 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:41:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 18/34] i2c: tegra: Remove likely/unlikely from the code
Message-ID: <20200917124120.GS3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-19-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3xvobRwI6W2FSfVC"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-19-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3xvobRwI6W2FSfVC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:50AM +0300, Dmitry Osipenko wrote:
> The likely/unlikely annotations should be used only in a hot paths of
> performance-critical code. The I2C driver doesn't have such paths, and
> thus, there is no justification for usage of likely/unlikely annotations
> in the code. Hence remove them.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index ab83d1de6c94..fd0d51ec447f 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -852,7 +852,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_i=
d)
>  		goto err;
>  	}
> =20
> -	if (unlikely(status & status_err)) {
> +	if (status & status_err) {
>  		tegra_i2c_disable_packet_mode(i2c_dev);
>  		if (status & I2C_INT_NO_ACK)
>  			i2c_dev->msg_err |=3D I2C_ERR_NO_ACK;

At least this one is an interrupt handler, so it's kind of performance
critical. That said, it probably doesn't make a huge difference, so I
don't have any objection:

Acked-by: Thierry Reding <treding@nvidia.com>

--3xvobRwI6W2FSfVC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jWXAACgkQ3SOs138+
s6EN1BAAl+GC/O0i3TYCRAwVs2JSksmmfZw7tOyIS66DyRolVplzWcmmaYc3SFFY
emR7t+vbcueRN89jX0kR05LXAupTtdIcanFTdr6bvMnDwccLfnK1bXFF9dW/AwOl
IbUdZrgZaYHBWHB9VvesJX3SONsrP9RjQ4ftJ+FIkd7c20VKkNnTsLbPpr/Qed6L
+gsyVuJPOtcWeBn/jcXCuSXVKkXSq+RMAiJlxmwXxVcMm50KtlEnJixWpCAke2kl
3zT3YPn17IOZYY3zxrnH1lVHVvgFXKDN6ild9qGpqRlvISp+KtKppa52yaNbJMam
FpUst5MtqP+qWl8D2MmmmIk51KzmGelZghvQS0KMvi4Pa0WrUtlFaRoXh57oKdBH
Xal3cUunpNMJzIT879UH9r+X13ahz8wbhYxMI7Rg5vbZd8lOdN1a8oPXJLexctLu
YjmmCjCGAN5dCN0NEVNfGCwph+smKN+Y21OTPIcCkfp549EgMBP0doc6dCHTmUBc
02hd5EasRwtf2ik3/sNUWTkDzoZeWyRqNDwn1Yg7jEfC4Civ12f/2JahjQRwrMPi
HZRa0vgy7FDzr97L+4tRL+Qp9nZZlAUkgQeTNt+OcJ4R5g+MDjxvW8DWNHF62UOT
HDCaFbwOchkrWRSExwvETNXoaLFRbUF4TS/ZSk1CNIKrLCK1nR8=
=jcaP
-----END PGP SIGNATURE-----

--3xvobRwI6W2FSfVC--
