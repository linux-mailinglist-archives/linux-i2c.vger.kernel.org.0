Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFAB26DBBC
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgIQMjf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbgIQMjJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:39:09 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746E3C06174A;
        Thu, 17 Sep 2020 05:38:43 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x23so1810716wmi.3;
        Thu, 17 Sep 2020 05:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FGjR+d+JXWgy8/GPd/QulX+q0ICOMnYHyNA3qxfsAgE=;
        b=PAg8PwVfRywiYUjB1HLM0FGkbVI/EYy5tT19m/aDoOInLlAHR1cePQWz/iFGZ4WuFU
         FXGmvhOgiVuOn7MsZPv/0EbWdTA70EAjeWA3lbOjVmNW5O7hratbPyZTsp93OqtkgQSO
         ffRwmpfF55uS+9nokEz1iq9xrrfmvk8onFFpCnRskYWOy88OT12r4i+jP+uBiSOxO1NG
         wcH4NuUM/WVN2r6MqbAaRN97veKinJEybzyM5CqaNdQwI4KiJxfaipPuNsoz0IYilBRn
         jLAgeA5NS1tw8eDSws+G4IO139nCDoS5MWNMhUIYKKiA6kjoELpjhXl3Av8lliWmmmWZ
         8xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FGjR+d+JXWgy8/GPd/QulX+q0ICOMnYHyNA3qxfsAgE=;
        b=gEAL3l8p4McKbm72T4mgxejJEzQL/V/vlsfJ6Vdbrl7NeldS/1gloz4vB82erEbCL3
         PiCwqjzfAaymZXu2uCTBFJQlcmPBoOMIcZ3FTqvvxiR1E1Y7B7b7d3gBVAQxVOJjimoK
         jVx1un/KI3U1S8QqfINKkk0WVrboZWNT6bJgg5LU4Y9saEzcFpm9lWeoGz+mqeMydaGY
         BYjj8d3HLx4ELkyCwWIEVEIsj7/kwk0N0HsSYRi8YpkFUdU1qLZ5iC8C4ixEf0arLuMR
         G8+IaiPwMhusaEtLGx1icAoNb5+ghGqjffdWV2BreGcLxZivaHxov78Esf6x3Yrp5M+l
         DRlA==
X-Gm-Message-State: AOAM531YgfnQ0Zh1CB6kHLumpCeBaA7ha2b5dIsNbyV6GkZ8lS9H/BRZ
        /P3LbwhmySyL8qaleBwCSgA=
X-Google-Smtp-Source: ABdhPJwCWJ4lzAgCqQUZDD+gpVhPaqmbrn1bGTCOl455gjPiXzN26QwpwfIifwGui9GnO1JlvTUabQ==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr9571261wmj.187.1600346322154;
        Thu, 17 Sep 2020 05:38:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y1sm10589324wma.36.2020.09.17.05.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:38:40 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:38:39 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 15/34] i2c: tegra: Reorder location of functions in
 the code
Message-ID: <20200917123839.GP3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-16-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZgsfP6ejcHXtpYqZ"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-16-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZgsfP6ejcHXtpYqZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:47AM +0300, Dmitry Osipenko wrote:
> Reorder location of functions in the code in order to have definition
> of functions closer to the place of the invocation. This change makes
> easier to navigate around the code and removes the need to have a
> prototype for tegra_i2c_init().
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 486 ++++++++++++++++-----------------
>  1 file changed, 242 insertions(+), 244 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ZgsfP6ejcHXtpYqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jWM8ACgkQ3SOs138+
s6GnXg//XT5ks0Kikj1dVSBpnuRI+I2D72GCq0MdKa7mDu5vSFyIB1xIEn8+Yt1+
SK+oTXOgq5Gzi2Fbu0wkPzptDoR+VzohHWVEcrLn4YYtJwEiwSjIsEC0++UeCSUi
2Y1j1kFdBM4FUROKEwdZyAdKKm/kc6hb8WszGPojYZcLK8cdJd7OiN0+wpEGQzoc
frezaUI+yMhaRNXf6oYq89lFApoeFc1WlGaYfaGdw8paIuOTFdjej5EgxW9NU9So
L8nmQyGO/o3vM2ePu3BtkQfP5zgbNkX5wlKrlJAYSeD0VW4tlguY4Tdlq+LEaN/O
n+a3iL+FGyTIG3Fy8uNHHb8OOiSdGMioNUfX87OocT+ScTf4duYMiObwqcU5AZov
CsyNNVE7i0mAHBqYn7p8tTefzbudusDiWE0YOVUk7SwSYe0+brHwwzpxVXQZRKKa
WLSut3uLfoq1hE9LSVJbLtBIMSf3l+yFD8VtDGg1chmYm0ZNFGTAHWbQfGOxha3z
02ylX46rqJvwg+DSSO7NOLqxBI7iNZAhyiiJ0rqbzgiE89eBcoQP+w0/5ewdSzSI
jZpCWKeBaGj/lEhKkGzQEVn+ohye6O59kzqgBYPjdfdBW1LUh3R+/d42WXv9LUEj
KccdZUh+G9ZWWOxEzZP6FAxPgSBwy/0HZ9D8Nf0Y5gCi5gvuxLs=
=1YhH
-----END PGP SIGNATURE-----

--ZgsfP6ejcHXtpYqZ--
