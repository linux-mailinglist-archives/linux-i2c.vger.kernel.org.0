Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E0C26DAC4
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgIQLvj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgIQLv0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:51:26 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C04C06174A;
        Thu, 17 Sep 2020 04:51:26 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id w5so1729303wrp.8;
        Thu, 17 Sep 2020 04:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TBUiml/Uj9hKEJeA51ivy558iLQsoTK3f192+ZXXxgQ=;
        b=s3j0jcq8lZnHN92aZ/GGewvxNv+c7ox6fw0js/K67WJ0qgSsRlQXQRrYXhcSH+GAFG
         jQQ15WR/2Ltp/tGI3hw+2pd3hB1dtPBZsdYQnr4sCYLb4eus7/6sbnEgCNOvDYVPS96i
         XBZwO/UN4sk0qIUy33gjJ8gZDpqb+2mtREhBegnq8K4o5QfV9OULgWQsJLTohLMSawIp
         OYm4UcUuMLD/42JNScfj1K8IViF67GSf7xA4UcquZlAR0nGAL5DZ7rvHPiZZA0LAEY0s
         pi/IUnZArRERoKlPDDKVa4v1ITxXshY/K/v3ejjhyr0locgU+7ui9JJqSrqcAaKzJ20i
         BeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TBUiml/Uj9hKEJeA51ivy558iLQsoTK3f192+ZXXxgQ=;
        b=fMo7KaRw7epgbMmtTuiQJlezmhicF6CmQ5rX//Hly38c/XUb/fkpe4Hf1AHU3rLm4R
         JIkzOasDACySloD4WbAHzQOZBWjFeF8sqZiBYqsQFVfz0EDrtde0Vk+Xznomz1nZAmx/
         jo92G7SVvCsXNNX4pjXkzJz+EGBaqM+472JL+0E6UjykfLdHVTutL33E3P5JQ5BWAObx
         goHVqwub/fTWRkEtIrE4c4JbOsemInODR9tsucOVZawplFOHj/VvuKF957+urAOYpC8U
         rphGyIBANStgRDHgm/vcAPGxypT6xdWrAcIFVZ3TidK1GD0R+OKUdhGh89qNOJ4F0qzr
         CWNg==
X-Gm-Message-State: AOAM533G0f90U0MM5f9qU4k1vB0kWeFNGw16UWRBcXEqP9apyy7GnPlA
        y0mwpwA0NrPBFQ9qcOYSUdk=
X-Google-Smtp-Source: ABdhPJxf2zUIgb7FLB/EuBFv18SytIkxbhYryS4bStUsreLQYQkgqOdwZAgKQSGCzN2QHr1D3z5YLg==
X-Received: by 2002:adf:ff83:: with SMTP id j3mr32846642wrr.135.1600343484665;
        Thu, 17 Sep 2020 04:51:24 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a13sm10725988wme.26.2020.09.17.04.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:51:23 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:51:21 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 24/34] i2c: tegra: Factor out packet header setup from
 tegra_i2c_xfer_msg()
Message-ID: <20200917115121.GC3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-25-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LkL3iLkxWcC48rNm"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-25-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LkL3iLkxWcC48rNm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:56AM +0300, Dmitry Osipenko wrote:
> The code related to packet header setting up is a bit messy and makes
> tegra_i2c_xfer_msg() more difficult to read than it could be. Let's
> factor the packet header setup from tegra_i2c_xfer_msg() into separate
> function in order to make code easier to read and follow.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 92 ++++++++++++++++++++--------------
>  1 file changed, 53 insertions(+), 39 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--LkL3iLkxWcC48rNm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jTbkACgkQ3SOs138+
s6FH7BAAlTp1UkThynTuwY8KzZ3PBlq1Z9HNV+CJCadQeENtcqBYn9/Q158SQaVi
JfE4FcOf0EHPZKbjD1wujKr1AQfKepeQOAS1b38hKOhJCcDjGqPzWRkFoREA8s+p
Q9umCHUxXYcAfroXyiBijakA9OqvXBRX1FmDxmdCqM8Hd6Emv6z3u998J+m+eIAw
jRBUIYu1X93du0PnprxoISb6HEdJwBR6I7Y29WtZzQtjT5JTbdtyyqZEjux0sMF+
jmELdmQ7fsRThS6bvxPTEM0R/aSvF/DQOreIvZQNAhl1ZufNMv4IeBeFWF/qpcqO
0R06tUC4NSnXGvCRHHsbRkM9Q7YlAyDZ7phnP+MaMsmiGUP5RgEreKS7iSOVJ2Lt
JfKESiSqEmxtGuG5mQNBScyVibbG3iEMGtKkq0qq0eUl3RBO5qC7Ju6TDxBjU1a3
gbOmh65P7FDRbOz8q7ScHv2Hu83G3Vm0SJEN4eEmNYocoS+hIcZL+rHj+9HjiZ84
pnPkp5CgYR/Xj2Cq+cqiNZRTzAtwalWuLPQJxXwfd/uki37rw19xf+Oj1+UKPzST
sRbWjhioP37+xdoCifJP2dp+smj3NYu1oZxw76SMplG8b8CiLm9++FaYKd981W00
8g5FSWZemUS6Isrnj+s13FMM/QU4tiSath4+4L73//xnZ3zR4bU=
=8nUD
-----END PGP SIGNATURE-----

--LkL3iLkxWcC48rNm--
