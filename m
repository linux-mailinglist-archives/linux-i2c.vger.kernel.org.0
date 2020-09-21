Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CED2721A1
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgIUK5d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgIUK5c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:57:32 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F41C061755;
        Mon, 21 Sep 2020 03:57:32 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a17so12226654wrn.6;
        Mon, 21 Sep 2020 03:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vg2wNNfraTYJE20kXoFGxN1k8DtAwKPA0F7QLzPYkis=;
        b=G+3UVHK7pneoY0UgAaU76CWTOq7/VBrFb3pAUvKLSFTCP+Q0z+cMCUhwqtIMzboxHc
         N4wiQUiLyVmXcNQqjqaHfGaKzM6a0YWCbtG2iaIJl1pwEZcseXBg4aeuAONzyaLCq669
         vwyVp1ZOJOrRUskQOSbav2YGzMUR/4714zYPNKT7h3GM5PYIJBz/8pACsIymjymdTtgj
         nEH4jKxDSd71Run3FF1/uQXcQAgA4c4C5DqrQdI40uvGxdTCms8StIn3O0I7Cefps8Iq
         UNz3yQMGr2xT/7IAOCqUXwi5/VrnEwBxyAghJt9jf3VbIDPWjTWfHOjmNRbCqwaG7eTz
         i35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vg2wNNfraTYJE20kXoFGxN1k8DtAwKPA0F7QLzPYkis=;
        b=RMi1pxTz27ywW+eKUB41UotWhao9iCg9QebUnPlSQMuu9X9+XGNKUwlZCzGFJhc+9/
         CA1nKTc+UMHas4GVFySrkf0F28U6A2lDtXYalvReHsiLDzgabvU1+UwKqm9R2ykSw1k+
         ZUTchZQHAj9XznY1fn6aXEIhBlNiLiLa7VQddHNpsDUDQaJei58fWsQuBqWEETB8E2cN
         x9EgpAq1yAXqyAP62yPJvDMF9ck5vU+WHsc1vQrUDOkv9zG2/5tY431ww73yTtbPyGOO
         vD85C7wNhWVe5EM0nipHzv6ixTQdCGbwycPxtW5xIBerQQTW1S8o5TYC0MI9bRq8B4F0
         cf7A==
X-Gm-Message-State: AOAM531SL/0CBAWx7oXQRBKuSXsrXZdcYEr2yix9HBp6srPbM5UiVrgY
        YwL/OdrY+YhoqjeTEmk4zc4=
X-Google-Smtp-Source: ABdhPJzy3Nuwdrnr3Qsmd76+KukJVqmbC2U010hra8kJCQlqWPj8LY2U5yRRy+Gsan7G0iQCUCIOEg==
X-Received: by 2002:adf:9e41:: with SMTP id v1mr56390776wre.60.1600685850888;
        Mon, 21 Sep 2020 03:57:30 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q186sm20397159wma.45.2020.09.21.03.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 03:57:29 -0700 (PDT)
Date:   Mon, 21 Sep 2020 12:57:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/34] i2c: tegra: Remove error message used for
 devm_request_irq() failure
Message-ID: <20200921105727.GC3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-9-digetx@gmail.com>
 <20200917112852.GT3515672@ulmo>
 <0a11e836-dcc0-0fba-4da7-caf28cbcf7d6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline
In-Reply-To: <0a11e836-dcc0-0fba-4da7-caf28cbcf7d6@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 05:59:28PM +0300, Dmitry Osipenko wrote:
> 17.09.2020 14:28, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 09, 2020 at 01:39:40AM +0300, Dmitry Osipenko wrote:
> >> The error message prints number of vIRQ, which isn't a useful informat=
ion.
> >> In practice devm_request_irq() never fails, hence let's remove the bog=
us
> >> message in order to make code cleaner.
> >>
> >> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 4 +---
> >>  1 file changed, 1 insertion(+), 3 deletions(-)
> >=20
> > I think I have seen this fail occasionally when something's wrong in the
> > IRQ code, or when we are not properly configuring the IRQ in device tree
> > for example.
> >=20
> > So I'd prefer if this error message stayed here. I agree that it's not a
> > terribly useful error message, so perhaps adding the error code to it
> > would make it more helpful?
>=20
> We have dtbs_check nowadays and I assume you only saw a such problem
> during of hardware bring-up, correct?

dtbs_check is far from perfect, especially since only a handful of
bindings have been converted for Tegra. It's also not going to catch any
functional issues. You could still have a valid combination of flags
passed via DTB and still the interrupt allocation could fail because it
just so happens that the particular combination wasn't valid in that
particular setup.

> Realistically, this error should never happen "randomly" and even if it
> will happen, then you will still know that I2C driver failed because
> driver-core will tell you about that.

And yes, this is the type of error that you typically get during
bring-up and it does obviously go away once you've fixed it and then
tends not to come back. But that's exactly what happens with most errors
and having error messages helps in finding what went wrong.

If we drop the error message, then I may notice that the I2C driver
didn't probe correctly. But in order to find out why it didn't, I have
to go and add error messages to narrow down where I need to look. The
whole point of having error messages in the code is to avoid having to
go in and modify the code in order to troubleshoot.

In the interest of moving this along I'm fine with this for now. But I
suspect that we'll run into an issue with this eventually and that we'll
have to add an error message here again. If that happens we can always
reintroduce one, and perhaps at that time do a better job of making it
actually useful.

Reviewed-by: Thierry Reding <treding@nvidia.com>

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9ohxcACgkQ3SOs138+
s6FAZw/+MzyklBHCa3NuvItwvPM9YixGZSka+8F3obm3hy3fMEPx4AftTHJoiiE9
WShcAFegVPQN2hTeFuqI+qUqBuVKg2T9DY/Oc8h7x56uwY70dmUE35gGX/qkgFu/
zD3Xz0Zz4GyUBl6K4Ry9usUfATLp+2zy5KY+v2dxTvO4vGhJTMKAXOJJxv1Cxsn/
rGuzQ4bXmmpi84nHIaAHAK8SXq5WIpLgmn0MH93ztW4b8axJvzGBZ8/vU1JHCgGA
ijaK/tN8fQr0jzY4OOYezrb/+eIDudwqSPkFbdErJvRjc1CYuD2H6yKZeNm2mUw5
7y/Jju2vunoR4m6NM71TexHmsQq7p3isED2cEPZ66d4VeMqqLan17sVnslJH+puB
KeLKmmZ0PhCjeJwfxgVT1j8YhRRb46vmZzfIMXOlJlesruNMjk6q3xmXeFnql/pn
qZQnRpfkA5qfMX6QU9I5m478XRoiqyGf+zTRpoW5sIGDYSVZbSe2+sc7Hkh7zJjI
/ZxbMN0koMqmG/q4fVbwdKDfuWm/2ROKqute+Aq3VVobISmKeDKKYoagJtljOss1
xTAZuepn1sz6ENtMbQFH2vcMB87tElfgfF2ouuMOiEr2YqQFOFTbHltl9RQ+//8L
OwfH6AjPcqu8jnHASxyfXBgIj/EvwapSjZJCTI+CyovY1jQ+M8c=
=IBBC
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
