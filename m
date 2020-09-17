Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1DC26DA4A
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgIQLdU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgIQLbt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:31:49 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6189C06174A;
        Thu, 17 Sep 2020 04:31:48 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t10so1688256wrv.1;
        Thu, 17 Sep 2020 04:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UM35Rz/z6Kt1fk3hrJcZfv0YfHRgM9+Q33CFv7aCdSI=;
        b=XZrVq98D8H2TZ9pw8D4QrlP/urfWYfB05/TiUS9qO0mrL/hlemKvYDgTYsV2v1Cju8
         mBhS44ceeYeHW/GMFvSYld/fC01ok8+yOzE6LXPDgsWq7tmXB7zlALhC7GY8VP06Dgga
         hDVuPgf/SXa9s5ZasxUxJBMkkECKGxxaou6+SLj3ovP9h+OjsGDSamDs0jdVJNjyx6iN
         hcLyLgcb7/GA9dOzhZeJl/qF2sdIGScnEaJCwy3slrRQZGwQ7ifZgYgCi9VaB2EcCzGM
         YAw5A6+RSutPhvPckfAgibcPKGUrmReJggYRnnK7tWoPUe7VqtvnecQy94VqtNwjEuUL
         lqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UM35Rz/z6Kt1fk3hrJcZfv0YfHRgM9+Q33CFv7aCdSI=;
        b=btpV8qV9R8wHwq6uIRMkeDs2jJutqUqudDP+tW5xVyOqKoJ18bRZmEt+EAYGC89cGk
         JPOklIa/7oKppiCMNb83ZEsKQ6bMEtvYDVWG53vgcLbEp+Hx0kbFtc8A9f0O0D1Z5o6Z
         YJAGytUdt9pgAJpwCATOkiYqN9Uq8D3UEyWzEhX/MEbZD+xXVhKL4saSYfS9DJHDTpbG
         EyeQc7MJx1JytMcUc+IFPrXkdFWTc7HGO6vc7hUOMEs42MstO2gpFfd3XNN1Nfy8syvv
         7eeeP2fCBtDUqVIc/DfYDhSoyX2IH5OpaHu2A8PV1cUQi+QjXNiTtnOBI2U5PKhCEXO7
         DuHw==
X-Gm-Message-State: AOAM530w593Iv3r/DzhhioZJmx5munOyPNPD44MWxZa6lFYXUksIJnm8
        Sv8FfnKl4mbOGsbdAXYyRtXxg0Eei566cg==
X-Google-Smtp-Source: ABdhPJyEaskOyNjz75uwych9h7nYbJr3AvRQYu2dfBa3uHwINdIg81F4pYnhyNS0H1s1zO1ebrv6CQ==
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr32479370wrr.269.1600342307502;
        Thu, 17 Sep 2020 04:31:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l126sm10205995wmf.39.2020.09.17.04.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:31:46 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:31:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 11/34] i2c: tegra: Use platform_get_irq()
Message-ID: <20200917113144.GU3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-12-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QOa9dl9wYIBIim/b"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-12-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QOa9dl9wYIBIim/b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:43AM +0300, Dmitry Osipenko wrote:
> Use common helper for retrieval of the interrupt number in order to make
> code cleaner. Note that platform_get_irq() prints error message by itself.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--QOa9dl9wYIBIim/b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jSSAACgkQ3SOs138+
s6EXkA/6AvPlAXn38dxmP+5hB1FF0aYyDDH2Z0CrYPtYrLfr0lOPjJGHjs8aP184
fnc3Zwt4/0Ep53tSTgxBNZfQQe+F5bgOHerUbjG6svkWbHs0cXVQ1UlYJn4uzcwz
Aw8WdQTIXHUmviM6euI3Rhm7PwbNeEcXb+0nWkDGAwcExkUtODPTWinYOYvyAPjR
fnObgvZxHF1ThN/BhlONzr2GoLJxDYExcXe44rkS1iKi8uVl7hn0pZNJWgVDeD7G
OYG7bsg3cAxHpKKB2C6fLJoJ+gExYhtl0KOnPmERw9iB2wH02siOssv00VRquh6K
kxBX5kJ7mD7VYOFRLo4qT9K4U1oAqr6MCelFv1GEEdDkDyUhQQ3HR0OENCv3JDEi
ivqcjSxb2UBrqSh1aHbgpD0u7SS13+/IvjePV40SB7WsYJrDHChQ6UOcVN+IDKxt
UHdjk/jbD3HZZFpQHD5eAif6PTbUoYlhfBNxlR+AMJ0nUoS7+3Y5I6CwphUXvbuu
WB08aTvXBMxGRlpxLIWuUWqJMceyFKA38o6ys1GqBFSp5N0yWusjTJCtdOvJm4e4
S248kJjIxC1Q+DHcKBEKGkNeiZ6Y6jrJIYEaNzXs9VyrjnDAAERfijbouASCd6gX
QueZpDaRTxB61DTuv4QMJqJeCWPrxTlxHOFqj/TWGy7ZUuPts3c=
=sxyt
-----END PGP SIGNATURE-----

--QOa9dl9wYIBIim/b--
