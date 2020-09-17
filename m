Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FA526DBB2
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgIQMhK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgIQMgJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:36:09 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89D9C061756;
        Thu, 17 Sep 2020 05:36:03 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id m6so1911195wrn.0;
        Thu, 17 Sep 2020 05:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3yPXsrPhSCIZUrB7xZj1zBgenMOKixXRrzVZiQa+dO4=;
        b=WVdnvsGCc2l4csA5idiz5iTwvWaHJ0eZNqDWhuAlryyyMn/OYAx9ewOZtWhBg0/cq+
         GmcQCv+j3ijB+ifJVlcu03YzQXaKc6FUCCmwXxervJ/o6ae50PqjT81Q2RdrSnPLpV2y
         hcTct0eLgR2WYcAEjgVY/53Q4mz2bo+7ZVoTYzMlMN2Y7y/p3VSmK/dXNf4Pq1xCqDAv
         nj2uk7nbT37qqm9yi4BlpRr5NNG8VNkTRBmYDaxqD3sKId7FFWT2Yqz+7xelZeem44OJ
         zsVd0319nO81CiNuoA7goFLnvxJCyG5xeVJHzqxzNDgGBtJGqwyac16GbylWkIPlUVVJ
         +3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3yPXsrPhSCIZUrB7xZj1zBgenMOKixXRrzVZiQa+dO4=;
        b=GV6L6HsUeiGzPqIma5dYia/eLiaU8ZXUGK2AIqPJ/GFyrlooU2WIS8UZvM2pBSZG1N
         YFCCoVzgdPRg08n/5FwuaxnvGvb0UjzUveetLhoS1uPcG9H9mpc4k3iEBno8t6ipK4fp
         6c5wfXKyFqnx15hBE1JWNhYQUXMg4Pw1TooM90RFhqasZuU1UMOC+sy2E2PGuNXG6eyX
         /bZcDPaLlV706+uymRkxwk7HFKqCLRMo5H/JPo0gk7AzfG3YRUZaCSD0hNszKtnM4fs/
         7MmLqxIgFWkM/cYDk86dGPEunNGz81wELvoRZNaxp0A9CEiz7JbnRKdSuHV0rjkK/m/e
         9GEQ==
X-Gm-Message-State: AOAM531hhS2cxllssTsJy/oBHU6BzF8Lbi2BLzn1zuzqiFe0Q1m1Jh/N
        Iis4uiRumGWZsqSMmnZyr0o=
X-Google-Smtp-Source: ABdhPJywcomF+a0+iY7h+fYLupgH6UzzAN511ZwJ4vwAxZaobLmDmAlvaCrBFWsPki3ptYHRx0ZmWg==
X-Received: by 2002:a5d:69cd:: with SMTP id s13mr30907536wrw.379.1600346162543;
        Thu, 17 Sep 2020 05:36:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 9sm11063919wmf.7.2020.09.17.05.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:36:01 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:35:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 34/34] i2c: tegra: Improve driver module description
Message-ID: <20200917123559.GM3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-35-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="O7r0+uQg70mf5vhh"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-35-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--O7r0+uQg70mf5vhh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:40:06AM +0300, Dmitry Osipenko wrote:
> Use proper spelling of "NVIDIA" and don't designate driver as Tegra2-only
> since newer SoC generations are supported as well.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--O7r0+uQg70mf5vhh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jWC8ACgkQ3SOs138+
s6FjmxAAuYZkqBGgrZXFeRxA8HF7im1K980s10TUvYL6syg0rZL2Ic/mAXhHw5ch
X+Us9KVrUDv5lGK8h19oGCeZSKmort3NxPJpPff7r9AgJ2/IyWZmYKB6pNRUAGQy
GkBfCMJBs1kvP3cY0+iaw2ePTlB3kNBpSogIHmC28zn4AMvMjeq8m5BKHeNJcywp
Ub2DXJQvmic7e4SWFc0biJH0vzBl0r9Ujh1Ln3vzXQRpRbo1lm5bIOoNGsEMkkFk
xvJ7hI5fT3Jk/+soM0/b9QYR6kQvUwbE057J1cfRug9hs+XVsMgZgVWX0h5Hv8fA
FBe/VXDoAWFtcn4wJd6Ah+1nLvUVh/gvXUpHa4O9bDEAnIFrzpdVXs9Rm+JMTEEv
96RMRgazS49xZuoVVEb+pesKYKvxkszs/eVss68M4DCdIWeJA+Qb2m0QWr4dGjXY
W/GIAq4XIuf4EiyqaM4jy1VdVR+Cw0cVOoTc0bHRsGyopeu8SMR0F+K6luRT+KDf
Yf2PwWij0g0xeGFPnb9Pn4fkr/O2M9ghkErCxGnv2uTk4BZwGX0DVDB420eQafgk
gBn/tfx735dR4a1tFdwhL5vtWnxhU9eM6S5XqDMeRlGJWrYkxRuMk6jy9eIaRsko
V7ARxD3vgxmgaHkZmOPQ2pNocH1T6MSSIAAm8hQUrmSp3UmKAdg=
=i9VQ
-----END PGP SIGNATURE-----

--O7r0+uQg70mf5vhh--
