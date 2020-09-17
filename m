Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079FC26DB2E
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgIQMK2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgIQMKB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:10:01 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566F2C06174A;
        Thu, 17 Sep 2020 05:10:00 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id m6so1821403wrn.0;
        Thu, 17 Sep 2020 05:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9s22AstJ7BJNTOCg0VPhZtgNsf+um2RTDRRHeVplWZw=;
        b=N8FKReFVUPdlFgTQSKJ5NEJd0A9ijuwh0Ed0ekh2W1IJv7ZVI0XyHo6b9/KQMxd48t
         wli7M9O//WiP2309Mfq6xDTx+HwUlCX9FsFtrbwAWLnc2GpruMWNngq/4/DqQqCgApGA
         MiCQcbMFL/BR/7MdGaySN/UTPyMo+xnXK9YShld3338vjSYJtUEEMa82O1uBbNwgJXaU
         Uj4llsB7GbvzOaqnCQJcMJzh94Sn5oha8rNOUDVup/pHOojlHQXOmLUx0RLBm85SB3Ch
         9mDIAxGZ50DGvwGvmxkcD46L1KXe4Lf0eQPJ9tKKCMcs0uY5p4H3VF5VgTU+8gfApqqO
         DZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9s22AstJ7BJNTOCg0VPhZtgNsf+um2RTDRRHeVplWZw=;
        b=MnCMaQPd46p47HAzcQ2Iz5rueOdgqiLZOaK1p87CkXEsIk1TPf4+BNbU83VtUmeHsR
         tZOkpess7IoQHig+mYj4vg2YHiZEB6fCKsNr1P/pRX2WUCTGJPDozM5XhWi5A2S6GOwU
         F7t9DHt0sUy2yUjswarCOhhooM6G4gf+wMRhQGVXzOa05vi7bofkAiLG6uv+riq0O3yd
         EauYvq7WSaHEX8/ctd63zyABDrFZ5ITmzkqiHLYeqN0KLo6gRhJVgp1MqNFu54f68+dM
         G7u7B0rgUmjS7Zbwzu6PPIauDl7yd28wAFmBHjxc3Pw6/6MY6Enznypt+IZPy9uEGUyp
         CHig==
X-Gm-Message-State: AOAM533JqUV+eqAUnt3NAxcw6gm4zMhctgg7P2BukY6QaBgOf4Z0AJhD
        /ESk72we88m5x48UEEhXAME=
X-Google-Smtp-Source: ABdhPJyi/6a13R0v/0Uqk/vGoZW2tr97dkdC8eqJp0jV3Z3Z2M9f8J/8JXgu3M5CMnmqexzSnI8gAg==
X-Received: by 2002:adf:e391:: with SMTP id e17mr30770039wrm.289.1600344598851;
        Thu, 17 Sep 2020 05:09:58 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id h186sm11056297wmf.24.2020.09.17.05.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:09:57 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:09:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 27/34] i2c: tegra: Check errors for both positive and
 negative values
Message-ID: <20200917120955.GF3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-28-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7cXxibKNEnJOqEg4"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-28-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7cXxibKNEnJOqEg4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:59AM +0300, Dmitry Osipenko wrote:
> The driver's code is inconsistent in regards to the error values checking.
> The correct way should be to check both positive and negative values.
> This patch cleans up the error-checks in the code. Note that the
> pm_runtime_get_sync() could return positive value on success, hence only
> relevant parts of the code are changed by this patch.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Why? All of these functions "return 0 on success or a negative error
code on failure", don't they?

I would actually argue that all of the other checks are wrong. As you
mention yourself, some functions may decide to return positive values on
success to convey some extra information, so making this just check for
non-zero carries a risk of its own.

Thierry

--7cXxibKNEnJOqEg4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jUhEACgkQ3SOs138+
s6FoyQ//el+v4DlNBwE4rVBy7+LlFoHacHj1SffuSYl1l9sMcMCXXgupnlarJ2IR
JGDCtKtduxxm6MY5SORv95PTtRjNjOk2q7IaKn7uftDIH+GMVtH6y/7AIlSI3zle
YctRopASVvzNrf//KLqo6L1PqvyoAqW/Wcy30fihMT56n3ira/GxhJaBzJxcT4ss
aVDiiqqqKF3YwKiiiTvFkrLLWVzqe75KuRPJTTsvWI0OedPG60pWwJmfVWFTnsPU
gPQalW22mSd8ephR9CKxUgthkt+qLIcxlgJJmYYfp823NDdBPh56w54wJpyzUP5P
buuz4ngg2Wyxi77Rdhb1FIJOzcobtuRYqyDhrMX7J6OqgupP7gds34F99JHXw1Zs
bp/e5JJU5+80BqRVtQOMK0/+Bygdzd+5RUraYDHHu1F1cAUd3bN6DrchmsHI2XMt
DT4zxsukBteiTk9cCAf85U0Hi41urs4XOfA4bhiowtowjvtyRi2iGmseQdlt322g
nXdTQDQFSmPEBpamhFjU7h7C/N+N0vg8dsQngJY3dW28JpF1KM3QMzghN/OzqVTw
IIlyPgdMueoHET8FwPnm7zqcAb59iiVla0m6FOpRTCwFpwUE96MHNw/LRBFqDwx/
iCV2/MgCEG2iNytK96PFaA4HFOSakQYq/XF/XhtfExURwA2S8Ss=
=MhMV
-----END PGP SIGNATURE-----

--7cXxibKNEnJOqEg4--
