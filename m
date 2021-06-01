Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788D1397603
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 17:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234043AbhFAPEw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 11:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233924AbhFAPEw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 11:04:52 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1129C061574;
        Tue,  1 Jun 2021 08:03:09 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id cb9so5872975edb.1;
        Tue, 01 Jun 2021 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wxdXKgcJOLVIsdWYp16GD2tdmuCQabo69N9o5gXMFQc=;
        b=NdaVzt419/0A1UZh5W07t5UVPcFiBxBvZdB5g/unksXj39PhmpYBxuJAYVlxnaykMQ
         4489Di3p3YKYPEJ1yn7ObtQQZYpAdDlUJvVkd9yhNXbkHgRaYzgzf5EkavaRI6u8bGCn
         YiO+jh2+f+Ilw8n+5dvetEy4Lrwp4GSIqGbs3CnGYY6g1onO6/xdthZWp8Tss3EXgxgk
         KuuRkU/jLbTcHDfB+ztVldOu2T/LjGvBxnQwDmeJzKcGQx3mgbin48TrWO2ML/yCgHzk
         MLVeW6h89EWrWUIvkaMYOCbkcq7end/r50YbL7Qr/O10reTxjycX1DQx+RWl4G3DW/fc
         bluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wxdXKgcJOLVIsdWYp16GD2tdmuCQabo69N9o5gXMFQc=;
        b=nfDbVpc3zoDW1A3qgzqJb9mcMIVzkGGeel0R+phWqtJ0Xg6zNf6rHnvhq3g0/UWPd5
         sjKxpiqLIfd0ODWMvn49z/MYvWley6kLRY23nifoZr6kPmvVyw4BmNcwFjto5zLDQBzJ
         +ehKyneLdYO5kJMgTM+XrnR7RW2kmCalUMh+kPMXOj031xEG8RNWRv/m/WMb5vDNeRd4
         mNImCaT69ijlcAPY5O7hRRoAKi2gJSTFWM/sGYUwrxJ8zy4WwvTnf+5a1FsctdqbD+uA
         SvO3cOfhRlAi6iVMaorim+Lj4AH5H1q50BTVeLQS+eagsndBFruzDQoxjBqnZgIOp5ag
         7eGg==
X-Gm-Message-State: AOAM531+EjKfiDyD1yQrPfj0zX3ZYYbNCB/2Pm3fg5b/otXsL/38V/FB
        JpXK++jqyg8pP88HpRTcxmY=
X-Google-Smtp-Source: ABdhPJy0uimJUbz8rqAFk6jlRXH+bWrZe7CLnVSDFX2Sg9HVHp214eXSoB147n7qH0JEYJkGmBGIGw==
X-Received: by 2002:a05:6402:12d8:: with SMTP id k24mr22591758edx.47.1622559788309;
        Tue, 01 Jun 2021 08:03:08 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v19sm1429028ejh.86.2021.06.01.08.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:03:06 -0700 (PDT)
Date:   Tue, 1 Jun 2021 17:04:42 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>,
        Shariff Md <smohammed@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 15/16] i2c: busses: i2c-tegra-bpmp: Demote kernel-doc
 abuses
Message-ID: <YLZMipfJt9rnIqV4@orome.fritz.box>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-16-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YzqOiTxPrUP7Jx1k"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-16-lee.jones@linaro.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YzqOiTxPrUP7Jx1k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:01:04PM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/i2c/busses/i2c-tegra-bpmp.c:86: warning: Function parameter or m=
ember 'i2c' not described in 'tegra_bpmp_serialize_i2c_msg'
>  drivers/i2c/busses/i2c-tegra-bpmp.c:86: warning: Function parameter or m=
ember 'request' not described in 'tegra_bpmp_serialize_i2c_msg'
>  drivers/i2c/busses/i2c-tegra-bpmp.c:86: warning: Function parameter or m=
ember 'msgs' not described in 'tegra_bpmp_serialize_i2c_msg'
>  drivers/i2c/busses/i2c-tegra-bpmp.c:86: warning: Function parameter or m=
ember 'num' not described in 'tegra_bpmp_serialize_i2c_msg'
>  drivers/i2c/busses/i2c-tegra-bpmp.c:86: warning: expecting prototype for=
 The serialized I2C format is simply the following(). Prototype was for teg=
ra_bpmp_serialize_i2c_msg() instead
>  drivers/i2c/busses/i2c-tegra-bpmp.c:130: warning: Function parameter or =
member 'i2c' not described in 'tegra_bpmp_i2c_deserialize'
>  drivers/i2c/busses/i2c-tegra-bpmp.c:130: warning: Function parameter or =
member 'response' not described in 'tegra_bpmp_i2c_deserialize'
>  drivers/i2c/busses/i2c-tegra-bpmp.c:130: warning: Function parameter or =
member 'msgs' not described in 'tegra_bpmp_i2c_deserialize'
>  drivers/i2c/busses/i2c-tegra-bpmp.c:130: warning: Function parameter or =
member 'num' not described in 'tegra_bpmp_i2c_deserialize'
>  drivers/i2c/busses/i2c-tegra-bpmp.c:130: warning: expecting prototype fo=
r The data in the BPMP(). Prototype was for tegra_bpmp_i2c_deserialize() in=
stead
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Shariff Md <smohammed@nvidia.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/busses/i2c-tegra-bpmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--YzqOiTxPrUP7Jx1k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC2TIcACgkQ3SOs138+
s6HCoxAAgj33Wj3TAjYzXbOl8ORr2Iol4DmRu6QO+eJJ8/uw3Wl82xiAUFCb9OGK
13JZpGo+uYttqJs1v372Qd0aGYtMoiTt9ylmRhZ3+N28smNUYUfPWrSpE6cet54W
Xzd1x2jOqJ/g61yJ4cX0JkvakghNQNQ7nclcbxgfJiv9pgL38IrQ4CVziRuwULz5
9rbPBTBiBacAUgMLMPPVsLhS4+adpf34CTmZnYFtK4ReVqcZOeI7IZYH853tddWY
DydaZQRZ5wyjt8/cu+D4m86aKXJQl59GF30vwQ85I8YlES649Kys5YC09dy/ZsXx
O42GPEEybJZGnF7ERLuzcBEWdRkd2ugXON0iUsHNFphCyrjaib8sqk8VVwH7xGrn
WyjbUT7vqYhtXxch2sYrrn7OUglRh608r1Lg9h/m5C9n7WVozz7hcB0Fp6AFkpfv
nHjds7UX88HYIRdX2gbM9BSTEXIgD+ASGi9DnTQagGtwdyZNC5UPoX8iBlSxR+RN
kLmFZbZXtv1M142wjY46HO5rdc74v728a7cYYGisQKHS9JKJ1ygypHkaqyMfsUs4
/X/FlQP1Ky0omj6Epoo+oPw+8396axhXcJmO3X3vqPSC5ByhQ9fHaB6wJdsQ/Vt6
F50mdsAyp77dq+1Y6P//+wQcCOGgQrk/ut5rouhvNCJjmnR3Vok=
=tO9/
-----END PGP SIGNATURE-----

--YzqOiTxPrUP7Jx1k--
