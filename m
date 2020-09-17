Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2888526DA42
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgIQLc3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgIQLcP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:32:15 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CBCC06174A;
        Thu, 17 Sep 2020 04:32:01 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k18so1671092wmj.5;
        Thu, 17 Sep 2020 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WajD7Q5IaEUeqlGzuj9f4SKj/X4IJE7Rh0zR/eL6gi8=;
        b=XKoIQ5LwWSVKQPOxrOces5s/xdb6iMl76kL+eVU9QNRs9jbIsbBr7kvTzmRTX2ya0j
         FibQfCrYj9OG13OWmKlDVAZWGnVo/fKsSu3AC6ZMdK7MR936TLdiOY5zaWDfNrDtc+EX
         PvHzTe6ZdECU6Z0YR7eCGJfyEtYfJV2CBKQD02yR0NP3mUpZ/ZCThPhvHXbB7FFFiHBS
         GIZOC2M+IX+urevXxx70diNZ5mzn3wz7OUMhwzGZN2/UOxnI11uOk3usmWciwJ3S7tM9
         cMvHcri/k1sElWz5NV73YnLmjrUx3AsB3Jwr/qAkPCSP45WpfoXvCDYd3jb4SqlWlpku
         1dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WajD7Q5IaEUeqlGzuj9f4SKj/X4IJE7Rh0zR/eL6gi8=;
        b=A4rOByXAfl2HxZ7AWHx0zNiPH2t9RVc1o3wFN+c1HEwRkwuTEkMSzIlJzshiTbw0Jp
         P2R4/BCVzNV6cTNRALyKnu6mXxFpezqQPvB2q+MuYDp+qoi0dr7wn4XUEiWh8W+IsbrI
         KzSm6d2IfGmjLqg3vKLWygt4XfSdlI0M2hYupVoHtO7zRwyT+uFz7eba9FaczQhzyfhI
         iE8060nPX/Nvb+M5nkA8PAhcYNR/pdBrM6i+hsPhv6BOhIXB95gtqecDmCW2cS1ixfNi
         OdNEvfdRFeaF5W8732Uf6kUBqq8RZ1U38yYsto8fiwNIX9OEuEYB+fbOlBEfNtGgn4/K
         QRNg==
X-Gm-Message-State: AOAM531IkAEIm7p8DYInhRAX580/N56crA4Dj03KFH4DTu8nMswbodIu
        +D80q0I8ZhFpRGaSyn9LoC6fkxnQTsz8LA==
X-Google-Smtp-Source: ABdhPJwk4+ou8IHIzcuyJxZq22L1zderwjpVKf78WTU+pyCvP/jeFyd94qbdR7A4/3sPPZ7lsi382A==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr9231898wma.87.1600342320026;
        Thu, 17 Sep 2020 04:32:00 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s80sm10200478wme.41.2020.09.17.04.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:31:58 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:31:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 10/34] i2c: tegra: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20200917113157.GV3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-11-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dRgc669pgRVB2OqT"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-11-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dRgc669pgRVB2OqT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:42AM +0300, Dmitry Osipenko wrote:
> Driver now uses devm_platform_get_and_ioremap_resource() which replaces
> the typical boilerplate code and makes code cleaner.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--dRgc669pgRVB2OqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jSS0ACgkQ3SOs138+
s6GyoA/+JS/7t4lJVZ41P+9Vnrd05ZUVparmqXNdy03HlhU8g3/GC0JJ0qW0nzJd
AW69IMT2HGYO9qJlC4NZbfWWiY/a4A3Oiqiemixp5hgOU7nkeOADsYmNargr6K6z
cyDsMjbABeYth+wB3PvDGvCzb4hWWHk4GgOEwvzr6Aiotf9+SFSe0b/UoL9rWqpO
lnooT+d6c6vhDVmUhGk9PgAdXh4Ym883V858NUpTm/Pghn2V86S9rrDzUKFSenWP
vzEUzWFA1nvcCxOghmKBvmRXFep6uOLsyGh5CmYmUo6+t2ezuUdXx7TLy9VAl+tI
Tlzt9tKAkSlIKrLR/VS2CRV1aClpxMJ6QoGyE/pj2EkmpvuGsT5sliQiZ3HEDpjn
7AM1yEpwBYuGzLsMpl7nYCMKjbLf9PqRYNF/ZYEGcGWXe0f+pveyXhW4riJpBeVu
QtAEZoaEXHKUIB02Mj0PoHEzZJMrlxlrEO1U/xT38Nm/sTiaZP52DMJBZhMgyZjF
xKn4zOPyz7U/a7u9Ph6Ch12tdjrfDCA9a+NdwFP4jJEIFaoOD58DShw6XsciJro1
PlROhUCEzsiPgrKdSIL2CxyS3RgpTsKQF1w244brlBJZfU1eMcFeZC28V5nJJDl0
/LK/Ole9R1neAa+VVxJr6klZa5O6z1I5switUvfWktXxEse4Y5I=
=J1ev
-----END PGP SIGNATURE-----

--dRgc669pgRVB2OqT--
