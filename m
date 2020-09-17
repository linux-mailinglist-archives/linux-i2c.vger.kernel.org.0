Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A7826DB11
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgIQMGo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726868AbgIQMGk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:06:40 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A74C06174A;
        Thu, 17 Sep 2020 05:06:18 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l9so1784350wme.3;
        Thu, 17 Sep 2020 05:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tE9yLGNH1EMsfGO/TyvFBeLycfQZd8KEkVYBUcpK+V4=;
        b=J6bZqsPWsLpDwG7bmnR7GKqPSvmtPDV9Jb0lO1LO5qwAvotOxtvCLn21cRP0BzWt+V
         uR9MAInTJAD7UgdD0/Oj4nYwhpeR+hr1MlGj+fUmSLzazWD14HDDjYoksBVkjAy6JQpl
         zAXP9lCyeT1lT+eXeREUzCesaGBbJiBGFHpwsJOrfhQPrhZVrkLLUZTmUMOADJZvAHD/
         LiuS9rQnTeF5hh4CNpYhfUXPgqzYs1MV+/ueFTdg0T1ETmD2ZH4/r226ENkFs1/NRv6q
         HG+S+adX7nSi0wtrys00tkws9iRJH8HGn+F2B4VivNkDfwEDw0UzDs9TapH0mcN1zKjF
         AVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tE9yLGNH1EMsfGO/TyvFBeLycfQZd8KEkVYBUcpK+V4=;
        b=pROvloJt5Jkxp6+gRCj7jI0yd4q4tsnq9FM0HUrwsxWRgofSj94SxACus8Jb+PmZxk
         rxhnUOk3faGwFdiix6PsNQjgyOsDDE/zdGCmhB3S3tUcFdT9W0Y2HQF/2D2G5WtCuRwf
         mxv28iLF/VN5A95MHwUIcD9Itb2dbsdvOmH76GUpcBqmrjYTo0Nvga6qYybToHTFUIt0
         p7GmgZJ5tE8oqqciPw0/QPY2g5dJiYKDeEVQDefh/93800RzaSO/2Um2tWIukxYmPNcJ
         9HALRLUnMO8moB5j8xLym+i7vEEBRS0yv4GbTxet7cjKRZstlRfpEGzurb20yRePvc0H
         DO7Q==
X-Gm-Message-State: AOAM532kjFnH1Xsml/djx4G0Q84mePEpQFk5JHtaDChafQ43lgVeLnSr
        +I42dG5JDkuTui8LJCtlHyM=
X-Google-Smtp-Source: ABdhPJzmbtGSgc/sCPHjT+k5AfHdUa4dj7lYQlTy1Z+U37azmH8kS8esDLh8hX0vP2eldd03r2AWrg==
X-Received: by 2002:a05:600c:210c:: with SMTP id u12mr10437557wml.185.1600344377136;
        Thu, 17 Sep 2020 05:06:17 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d83sm11075751wmf.23.2020.09.17.05.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:06:15 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:06:14 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 26/34] i2c: tegra: Factor out hardware initialization
 into separate function
Message-ID: <20200917120614.GE3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-27-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kUmo4NyTJbuJZ752"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-27-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kUmo4NyTJbuJZ752
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:58AM +0300, Dmitry Osipenko wrote:
> Factor out hardware initialization into a separate function from the probe
> function. The only place where runtime PM needs to be resumed during probe
> is the place of hardware initialization, hence it makes sense to factor
> out it in order to have a bit cleaner error handling in tegra_i2c_probe().
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)

Not really sure this is worth it, but since I don't feel strongly, I'll
leave this up to Wolfram to decide:

Acked-by: Thierry Reding <treding@nvidia.com>

--kUmo4NyTJbuJZ752
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jUTUACgkQ3SOs138+
s6HD+BAArcmDQvZJ43BnrWJSDzM2F4Nc1yHsjUZkBEwlFdVehB88ksYQMGJRWs3/
fkKLrBksvlGvGVReLfL0SxFmJXifR/qxYbnkZv+G2yleGdXa7w7VTfYUBI/CG8Dn
Y78esXfSlqIr0sYIrXlSaIyiUqjzP6hB4x/G5awdKREiWyqGmgZ17AFd01QZyMG0
+wTVSvfR4/IGhMJnqqdgXRUCbY+NTGEMzT3pkTuZ629fmKBxDVac3Pg0wEOaK4T0
IzIOc58zbQ1g1IwAfXxXf0MaQ1YtG6rDfU7xWUZxEWfV9Mjeg0RaX2ooXVfF5Y43
rIKKdxS5v+hJhvZKoPAyjAjFaj8Nt83Wf5Tm/ZjyMVJCBPbws0DI5ZYAHo9ABEXp
mWMTnFIcMQaSQTY/JIu32KCQxjoTC/ZI0U3SNtyY23C9RL85mnd4uDPzS/uv7auT
EXvbL6htIs5dPzSJemQUpW93UKa5SbBsRj4u3k4ZFbqGVkO92L+gWBSUPcCU3Of0
d3yru6TAaQoQbT3XGa5PaDHauscLeTWgcsPJM1VFD8T6IJeN6oqfM0zY4YSjkBLh
Cw3mcAXX7uMiIxNdwfoNxJhm+eOCeDd4UEJWPW0IOumOy9JkgfdROEq7/4eFPpGP
lcnaBN31gf/4jrZDNaeORhScYXUCPwP0dk+DLm3I0WcP7MknVjI=
=pBH+
-----END PGP SIGNATURE-----

--kUmo4NyTJbuJZ752--
