Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6695226DBDA
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgIQMnz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbgIQMjv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:39:51 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8106C06174A;
        Thu, 17 Sep 2020 05:39:30 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t10so1915470wrv.1;
        Thu, 17 Sep 2020 05:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YwMQfbNIF5jMMUvWm8IsaWJLUMaY8nP5R2Kt18gwYe8=;
        b=HqHntlEK1rnqEe+OdkmhA8AT+rLjaiS6Ky4q2L3Zua6fZu79aYQrN5u+jUXUoLb1wl
         5h9+Vqslc7gbJcUWsx1CoyylQacW+A6Ybq5RthCfAGbHaa5iT6+YMdO8pj/u1fVzeTr3
         NIq4CmRC2BmqmIdz14Ed8qAdrraXAR/u8g5wa5x3heECCci5s5YuHa19uYD/VwCT5wy/
         U51pGO2DaJ5YWz8kWW1IhrofvKSOzVoq5uXh6yN9YLJuTR5o75ROSk4Q09MrSpJq5c4C
         6M6Eo00zzMLjUzAE2gFzsCfeFML5Gv0JxwlJrAQv+3UK5Ua6wU5NzDFR6aI20/60Xa72
         dIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YwMQfbNIF5jMMUvWm8IsaWJLUMaY8nP5R2Kt18gwYe8=;
        b=Z2FUwtOuEaN7kysdrxl9JemoAt0Fd2xxQe0iQCnFj3ZhXxjbybfDNtps/DfP8gHtGI
         5CzCJXuK84lZkDn9TgPoywrIZ1Ya5tkmKIkDIkIfGWngrUgmgXgJltRwGHWCxUDa4xOL
         N6ApWyjrIj1rMJpoFhXAdoZmzRJJAFTxaet+mbzFkMxTHCAM1iArHt6305xBcj8IXGvj
         Tw5SQNpjw/th8f87KI7iYCzSM/lKrjD9tFaDKc+4BCCnEcj9LIzLF1fkq/ODXLiXqrJd
         2eErzYRN54B5NB+QZpfLb9SZ5G++VJODPeDvJU2fx+W98ddp9UzcdEIQGU3eYfOvWEQF
         6d4Q==
X-Gm-Message-State: AOAM533eRHJzhE2TFJqvkg4oQeJh4/DTfNNGDh+b1YhowK6qNe9eHQC0
        g9v8v3HdfRwqjyclridMv7w=
X-Google-Smtp-Source: ABdhPJySMOh0BSFCcvbIYAgHcYytrLEbLAzBfcB02+UU5xlUYqNHwa8ii1hoRE6lF6PQAysw4R/GXw==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr32584373wrk.263.1600346369607;
        Thu, 17 Sep 2020 05:39:29 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i3sm37796775wrs.4.2020.09.17.05.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:39:27 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:39:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 16/34] i2c: tegra: Clean up variable types
Message-ID: <20200917123926.GQ3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-17-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qCGCnlPZoKZX9mDP"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-17-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qCGCnlPZoKZX9mDP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:48AM +0300, Dmitry Osipenko wrote:
> Don't use signed types for unsigned values and use consistent types
> for sibling variables.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 38 +++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 19 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--qCGCnlPZoKZX9mDP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jWP4ACgkQ3SOs138+
s6ET8w/+NH0rf+CS+ifhTnKq79IfLGaMaSxz4XfrQmeGrQq3s5EL8tZJkXU+jAvv
RMfxefUw4dIaa2delaia7FbrimcN/ZFmhY4apXJ/UhfXtcMHhuGdb2vys28/rVaD
noDPFvaM0Fx4qp1O7vo1gbm0Oh+9/WniMluRsYXd/lixM6nSzZoVsC238TfA2SE6
AgVlKzhwJWpr3CFmUc+AAg+fRmk7IKrwAIlWLMIp9xM0iX62o+iI9wTy9yf0gCAK
pmPiwh+hIdsUmLnvFQg+1kKWO5ggClVl9FxaFVn67KU0ruoadFwTqK4VcR1kZd6n
3gULSJquybPOnKxuzt//bqKcTZ92ibcxaQu1qWjE16n2auDdloGMLhrFGnmChFsf
q/28SuzfiGNpe2iVim/7zEnfH589I2LGGXo4TUaY56NAwgI49ZwbSQSCBKrlUatq
rCuNTYMtymLYQ6TU48G4sfLU3TgjPw+RYnIf7KQZIM0N740wkPjTXQ2CY0O0sPN5
7DsiK2EhJV8wrLZk1LqygvmbQVH+MujubG6M48B969sqm2E60sYjkAruBSJh0UaG
lyEGNMDXRKTFl25HkR9hb5RNFmXT8RJBzMOIctzn4ry2jx4T6/X7pAsGifaqHrfg
LM12IwpE5e9TjH/x/icJzNCIkVSeMQ5pklv+mTn7Vm62W2Lr8Iw=
=hU/I
-----END PGP SIGNATURE-----

--qCGCnlPZoKZX9mDP--
