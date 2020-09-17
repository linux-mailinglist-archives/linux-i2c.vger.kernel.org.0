Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D9A26DA89
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgIQLml (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgIQLi4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:38:56 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929CFC06174A;
        Thu, 17 Sep 2020 04:38:50 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id s13so1630138wmh.4;
        Thu, 17 Sep 2020 04:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rJmyCRW8hkjib/ACuJzI9iaXZVPDBL4tzkgKMlfeHek=;
        b=FJt8nLbiJIpDK5kEO0R2QVVPKC0r12QCW+NaKgxWS+oKXAlaL55uOQNHiAuSg+402U
         iBWtjhuUAjp7TzgPtLSnQmjG9e+nYqZkHkXb9ZqG/kt5K68NwRf7SaqmUcccDzi1R5U4
         fTLh0HR3V92jqgV5bxFigzJHOsBZwCS9OhPXTWW4hyOGgqwYYNCaRF3+ci8i86ihApXT
         dANf0kAKtW1TxXEd2urDs+vZzKHRwGZujLIZvYeoRpttOX9kL95Guzn8S+eVQKKXrH76
         w6Bdx67RqjZrGAYxCVq5xBtRjZGS/fcHy49958Ms0JVIN+WLYdS3NMiz9WadjIvDUwMv
         Yzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rJmyCRW8hkjib/ACuJzI9iaXZVPDBL4tzkgKMlfeHek=;
        b=VFLbLGInNG9IPS3WNrEcl3Hs9thAud3WGoD8lb6SyTB5VoVbqNHWVM81nyzRMbBq4S
         3uVgNJLI0rkEW4zyj1k8/4DGCVkD9aQefynDQoXsPvgj610jgAlAx2WEW6lfDixYbnlV
         cY+phTxAonSXjhFC8xjuLACQ+fabFmB/uf44H0m7aQvTaUlMR4Sucs5GNfO5AADa4fZP
         5cuTrekTVkkSFse2aRaPBs7Yq3CT6jCqH2ZXnwanYbCpElTSvfLNmIstNP//+OUdJbR3
         MwrNr8bIeX4uy1MrhB7VUxfvDDUCCP9b+ETmrd4GyaFW/i6z2DXkUSXB9iKWUC/Yx/fH
         hKYA==
X-Gm-Message-State: AOAM532wSwlP+WxRWupWhGM1rqV8lIpaY9O3Ikw6N8aXGyt6Qlk7nLzI
        uPoGVyedcqA8380RUTquct/PxaU5sHfzsw==
X-Google-Smtp-Source: ABdhPJza4bV3f7fwZefZHWaa6AB76+OITGW8sLvHJnevW+Y3HCVqWcrl8TOfJ6cS5T9+8L7oHM56Rw==
X-Received: by 2002:a1c:81c9:: with SMTP id c192mr9197209wmd.2.1600342729283;
        Thu, 17 Sep 2020 04:38:49 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id v17sm41293646wrc.23.2020.09.17.04.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:38:48 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:38:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 12/34] i2c: tegra: Use clk-bulk helpers
Message-ID: <20200917113846.GX3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-13-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oIMVlEQ///Q2JYC7"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-13-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oIMVlEQ///Q2JYC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:44AM +0300, Dmitry Osipenko wrote:
> Use clk-bulk helpers and factor out clocks initialization into separate
> function in order to make code cleaner.
>=20
> The clocks initialization now performed after reset-control initialization
> in order to avoid a noisy -PROBE_DEFER errors on T186+ from the clk-bulk
> helper which doesn't silence this error code. Hence reset_control_get()
> now may return -EPROBE_DEFER on newer Tegra SoCs because they use BPMP
> driver that provides reset controls and BPMP doesn't come up early during
> boot. Previously rst was protected by the clocks retrieval and now this
> patch makes dev_err_probe() to be used for the rst error handling.
>=20
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 187 ++++++++++++---------------------
>  1 file changed, 67 insertions(+), 120 deletions(-)

This is tempting from a diffstat point of view, but the downside is that
we can now no longer validate that all of the necessary clocks are given
in device tree.

Previously the driver would fail to probe the I2C controller if any of
the expected clocks were not defined in device tree, but now it's just
going to continue without it and not give any indication as to what's
wrong.

Thierry

--oIMVlEQ///Q2JYC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jSsYACgkQ3SOs138+
s6GU2w//Q0AhqiF0c/SNMjblAQKKSNF3TRODXCut1pqNibaGWR6hooo5r52Fb6cE
9TRTDmOgHUvclr9gZ16V97AUNisBJ8LpYOUaDsehz6Y0xjTYpKczQfFj3YpMMBAT
+uV9S7kCE1UU+tW8UZKHDxo5WI3rNF49CKR8r5p0P2PCjzO+GIvHQicUQJqbT5ZP
CXPOKqx+sIgyGVa/Ygt5+68linjQa59RfQQPLtGSC9SguIjspFSPo4mrYVgjQwx2
FuHd2s8I3lncTpvQncWc2XZuZcJl5iMDyKpJaKKgZmpUbR2B7Tel+F4ynhLFPRbk
WuDsC/EcA0FgRHDkoOAuaDw/YFWZpUwimy9nEKafiqcGulLWlncvVHJcJDmSgG7U
Kmo5ftI6jEl8mQWIxbm/fo4Ja++iLvqR1fxUhXsvGHW0ZjnaN9qGZulTwjp0SKvw
/YRLcNZ001wb+i9ax0kDq+J28gIH4Q5ZXUQlH3vOnlniGRCiVJsrJ7NuHhFNZwQa
ybAqssMzlcjXUNsAL2SmBj8CCTI79VzHEiUeXcBMXtxFRvWHuByR5EHlwf2zggVx
W2CFO1NYJs1wjxDBnsy3lFdMDd6tMBe6qL88aojEWKFw3Ads9Vs6+IsiYi364hVS
k6L9ZeVtu7FI//UbUViyMGNorCy+WS0RvPWgZd4zBwv11O2UF3E=
=mt5b
-----END PGP SIGNATURE-----

--oIMVlEQ///Q2JYC7--
