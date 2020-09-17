Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB8926DC61
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 15:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgIQMiX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbgIQMhn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:37:43 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EDFC061788;
        Thu, 17 Sep 2020 05:36:30 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k15so1878358wrn.10;
        Thu, 17 Sep 2020 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MokMm/FLs+Sj4gwWG5HS9e12djHrZ+NZZNdFZk133Bw=;
        b=kv6hNtSDH/EgEe4Lv3fdMeAGUOLl2vIXGTRRnv1t+sgzjy9N2EszgDVJ6f67TcAYIq
         CcQ/XDWknVMZsF6DLK7wKudQiu73AT4oTN7ENefmS+B5r3kmzVP/YS57peKGs6gGHN3r
         fpsE6rb+nbtow6xiELrmS6ad6ZlZtIdJ8nkmtGkSHlhqngaWPeI1LYjiWMAbfAtUbO9f
         r79hxzhkR9Uw+aN8JN0Q9qpvETI41JZUOcZMK5Bz2TLcgCfIpzx6qqvkWYACKJd3Mv52
         PEfE6GSbLEcQa9arsDNM43ux6TpFojd6SOmOh9pvGeWJ5+In2mO+fX3F2az2axQb//v3
         21zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MokMm/FLs+Sj4gwWG5HS9e12djHrZ+NZZNdFZk133Bw=;
        b=LNiuMLqBCXRISZq332kOJj/DvaQR3NuWj4Vh0nKDemRalt7CXTlAw8rIbZSULspAG1
         OUJSLCUPOaHXsVBk6E+pAEdGoYbb+qIrdvp3GgQS9lJ/vcVgaHRl4tTCj2I9Dlg4ldLM
         DxfLaaijQufnghrEXFa50D/G1slTrbS9QiPgUZIYmbiUYUnppS7ll03T0gA86Y8w+HMo
         s7Gkz4WoZ0KKudH/moJOkYQn5r+jSkHlQ5JAcLZ5o3ThN69+FH09edkFAHxI3a9jro0u
         23sA6v7b5sUlJuZZqbhRYJRSQFsyj2HgCEsuBbX9QMe9IHJw9LWt3n8lJWk05k/3Lbea
         VzAA==
X-Gm-Message-State: AOAM532inu/oymjjbb749YwUVvUG+dCQ/ykzdnuq3OBWijWpxnpHV5U9
        Roxmuw/TMTgK9fH+kzzk280=
X-Google-Smtp-Source: ABdhPJxRMqECTdz9dwTSLAN/7LD5KigPqG8k+BnBJy9/Ld7b0rfeUli0oPm1sdfaaHFq8YTYxpj7Zw==
X-Received: by 2002:a5d:6407:: with SMTP id z7mr31672989wru.65.1600346189025;
        Thu, 17 Sep 2020 05:36:29 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a83sm10847590wmh.48.2020.09.17.05.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:36:27 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:36:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 09/34] i2c: tegra: Use reset_control_reset()
Message-ID: <20200917123626.GN3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-10-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BxZB57hXMgIq1JsC"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-10-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BxZB57hXMgIq1JsC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:41AM +0300, Dmitry Osipenko wrote:
> Use a single reset_control_reset() instead of assert/deasset couple in
> order to make code cleaner a tad. Note that the reset_control_reset()
> uses 1 microsecond delay instead of 2 that was used previously, but this
> shouldn't matter because one microsecond is a default reset time for most
> of Tegra peripherals and TRM doesn't mention anything special in regards
> to I2C controller's reset propagation time.
>=20
> In addition don't ignore potential error of the reset control by emitting
> a noisy warning if it fails, which will indicate an existence of a severe
> problem, while still allow machine to boot up.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--BxZB57hXMgIq1JsC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jWEkACgkQ3SOs138+
s6FGyA/+LUKSWNjlGfuwG5hN3wAKNyvo9ixbGUEqUGWGmhlRaeECx+qcVAHi1i6V
KfmAL1PMkfpI9HgDXzZ/1HZMdHkVvEx1Vy0Eh6/iYfnFcCWDDDwwd169VcnzoZST
uzitg/ixEnSZV4zytvdvufisoR3OeZZE1q+9kGN9tSKZfqXVz33NSvvKJFSh7/M2
HK69K2Ho5/FxL6RG6IWe3c1dIaGSjLNjewRDjpInpKjj7qMVoi7baLL2/tbXQBTA
0tQhR5Hokhp1R+tAZxt3BY1GxRcB150V5GOFBVRLA0TD2+wxAYcOmMbcA3yuHOCY
T8WEP+XNvonWPaib3OwCgt/KA/JO/zjssEycONipMlMuUhyU3qPVKikR7TnJdrfy
pT3Um5Q5X6kqi30CkBq/7+WA7zoMdtYJL1/5WvCd1eYUH0yqmsOaz+orYbP9VSdX
lre7RUe8LoNaSawTilo2nzdiihmhgQa7WluRFWUp4dLuh8xxSYG91P4PdybRIqIr
8inS5kTxmkr64Y1OTogXRTJStxM415vGmeSQRr78oZe/e0RzwcpbvkofUeFH4qzk
1FLBQ+fIjtqwiEOy9B6cjOxLkRPTLAcmZuFnQujtbPTaaaDXL8HhUWS1X5Hv8wei
M+FC5JFH8x5YVgQmjpAz03onDtVD4a2yR9eJAghHT4N53CP6H7U=
=fenL
-----END PGP SIGNATURE-----

--BxZB57hXMgIq1JsC--
