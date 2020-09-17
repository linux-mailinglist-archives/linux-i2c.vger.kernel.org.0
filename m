Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD1726DA5F
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgIQLfl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbgIQLfb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:35:31 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC940C06178A;
        Thu, 17 Sep 2020 04:35:30 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id s13so1621190wmh.4;
        Thu, 17 Sep 2020 04:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Mus1g7E9Rtbt7/nepGmgFQZVliCzO5VVruzhgZKok1k=;
        b=GWxRVmNUwNR9Ey5zhEDaCxB8vv1SHPfruBwXls5beC7jujQF9UjZwyDycRPrdLdOsv
         Z3BWpYUlraPEsFkTHs6OIfyGhK4h4DbqGQNG06+ULS73/C7I4zuUeYnkG+NkQAE8iZDT
         KdFapj1rUlWsf87R61RI3QAv1mDuGo6oZt4uTl5orzGpEyvoCV7beECuaoacvZsaJRgZ
         JgNUyA6qGFpyc5YhTVZTHQlZ5Z3FmdomkquHtR6/hE+RbYFffAExC+LO62KD0pvkfH1s
         NM1qWpBIUrU+/2DMMXCfHVZXL+x+BsE8ONfghfOhvS0JzzmfgeBYIgRmubvFgDZECiGY
         ztcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mus1g7E9Rtbt7/nepGmgFQZVliCzO5VVruzhgZKok1k=;
        b=PwzDx/dHVDEwmrpky8s87RHTh7oxJ22ti5MUl5QWTxFboXTnfLwGOgWnM/XS1po6Od
         9B3HgujZsxPGVmg7yBCMBD4DvOxyZFSoOrB1PXaX2E133ZXkEHZucn12ZpSS78SBGTsB
         HZnCiMd4c7nOKkEKVRBmSxLHTuhpIl/38pHW43ozCft7bEhJlIVhQ8dKfoFZPSfzEOTw
         D+YzKMJTJ/fViy3Q2/avz9n9QJkdK86Hll8HxByLO5yOnzScamg/JWrIq442oAnwfjWK
         dNz5ATomBnEWRr4gwelAloyfSdiQYmCyrSarC+IvlK1RhEIndKUCRDY8nxnIJn2EWgl5
         sq9Q==
X-Gm-Message-State: AOAM533hgonaKYptMFh4yxh72d6VXGstd1Amtz82CSvX05pMwkN+Cl9y
        xjobpxJsHnVUa4MDzChZRoNp5Vckrs4ABQ==
X-Google-Smtp-Source: ABdhPJwi+j3bVV9XLDKvfIFeifnu1UdiG8GWsRRGY75Du3lRw3z/gOOcDakf0MzklQhLjWAvLqdD9A==
X-Received: by 2002:a05:600c:20c:: with SMTP id 12mr10078544wmi.40.1600342529387;
        Thu, 17 Sep 2020 04:35:29 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i83sm11166196wma.22.2020.09.17.04.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:35:27 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:35:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 13/34] i2c: tegra: Move out all device-tree parsing
 into tegra_i2c_parse_dt()
Message-ID: <20200917113526.GW3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-14-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NO4xtVTk6ycZDAf4"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-14-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NO4xtVTk6ycZDAf4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:45AM +0300, Dmitry Osipenko wrote:
> Move out code related to device-tree parsing from the probe function into
> tegra_i2c_parse_dt() in order to make code more consistent.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--NO4xtVTk6ycZDAf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jSf0ACgkQ3SOs138+
s6EdSA//fSTxfL0lQvOvL75JmgW/zF9J1QXfQzIC7XqKLeVa26a5695M346bbUuh
2DiJpiTXoAKxbqVg+X/M1ptf+04/cACAMj4jyaCaFIjVngsCtV96bRNcZFTkjmH0
kL5KcPHbvKi5rRfyKjodfDTworIbMg8WqDabhUl1pXL6SyctkkLNreXXlDuKMUbx
vo/I2xu8G4bxHAiBA+mBg3l9nJ70vENR4GlT8NRhmaGCnaEtYUYtpgKXUq25Y5Gc
/OIibcJ4hErXLjFnfaEf4wUtkVTlRlz/yB8jDSVqFu/E/ybsW0pZO//LiIwwIpTn
abmXuOzJxQPhkay8fdE8jymUALh5vpb1iE8eEGHHZOibb8Q6UD3dXZKuZcWqNGZP
Myj/ROITZ6nTpZSp5x4NThxltO9J6L+5WVyFyq3ZqRV2WBeDmzfayXePdf0WuW6F
aoT8bL049X5fNl+wg8dCI91NKHxeOwXk4ns22Zy5UdO6YE701GG02VeAg/eifb3y
3Sj41pcdsOQR4JpDB2wSJFOrtuiEvHzUuc2VQJjtUany7dArhLp9FmxFtggIh9Er
gZApT//JSGbdNMju+n6UAQRIZnwrFUir2IRdGqFdHKePVBz3pcPeLyuWfCLe0/7o
CVpKTi3HwfRg4sXpWh0ePK0p3RvjjpTPX8yghsGXGXRtT0/9NHQ=
=tV8d
-----END PGP SIGNATURE-----

--NO4xtVTk6ycZDAf4--
