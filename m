Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3422722E2
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgIULoO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgIULoH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:44:07 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FBFC061755;
        Mon, 21 Sep 2020 04:44:07 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o5so12372364wrn.13;
        Mon, 21 Sep 2020 04:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FqD+XtlFIJxWhWStSHd4RbFikZ83A6060PJXaSCU2xs=;
        b=T/YnNgTnyR//4zr6lDgU62cAk0JYaKuYnJWXOWHaCRwbCYQ6j0DLqXg61l3i3bf7eW
         bDmyZQV8KPRt4yNG+RUjL5h8deRmFIHf/2xGcSlX7LjQ0xoBLkOguL+ntjPkwLqhvDUB
         kaYaTlniKkG7zp5vFoOOd3tCtlPkvxtY1z8Hhl8CMKUULPGDA7sk2neg3bEahOdszv5H
         k2CAFjZZyXSuueUFQcxdN6XtANyjbRozLwCQPDhTYfZnmUBX0tY+DK+Ep7xPMjplLDO4
         26wgVetFaN77pgt62L4Bo8E84FhV5QpTl3eBDNLuk8s/MzaJe4IvUxKVz1jALYjuFPgq
         NJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FqD+XtlFIJxWhWStSHd4RbFikZ83A6060PJXaSCU2xs=;
        b=rkd7qm1QjHdC/u1Z6m+Ue/u4aUARCojytZG0mzk0jQHZNj0CCx197N1zZ72vK71xmr
         j1OB5+X/1IjyLKBW2I2JJ2Ay39IihqppjOdydUWSOi7Yx206P/U/2gNCKXwsneywmpQx
         YwqhkUUQk5hYvWFcgsG36Jhv8f/5iU2LEgmN7SQcy3+T+hjCKpP98ORO0sa90xrVt/Di
         Dyu21WTKlgFJlvuIoRDen5anDp+mJLQiQkiKm9kgez3BMRITT3+OM7k4tM76blkQ40R/
         Ne2c0GLdyZHxAenua6yv7m1v65k76fRrO5OUH5gXYgBzNdlMpQkjiHMpnf7PAA9x28r/
         RMEg==
X-Gm-Message-State: AOAM532fXta4Hj5hSILqSEsPRHATAtkAUFNwMaX8u5d3MIhwkuxd0t2Z
        iKeOS+L1ZAmBZIhTM9LgOdo=
X-Google-Smtp-Source: ABdhPJy0GsL40pgbWIe274jQ0n+bSiIIajzDdFxVyBH93akhvvKOfkaiDSQy7MjC6nyZm1Gkb79jng==
X-Received: by 2002:adf:f0c7:: with SMTP id x7mr51072937wro.315.1600688645981;
        Mon, 21 Sep 2020 04:44:05 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a81sm20064855wmf.32.2020.09.21.04.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:44:05 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:44:03 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 32/34] i2c: tegra: Clean up and improve comments
Message-ID: <20200921114403.GO3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-33-digetx@gmail.com>
 <20200917123208.GK3515672@ulmo>
 <11a29706-0870-792e-d5d5-7c0d1f402281@gmail.com>
 <cbf6f8da-0e9e-3249-2173-bdccbf368bcb@gmail.com>
 <20200921114320.GN3950626@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7gLe/sNPhR777EPF"
Content-Disposition: inline
In-Reply-To: <20200921114320.GN3950626@ulmo>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7gLe/sNPhR777EPF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 01:43:20PM +0200, Thierry Reding wrote:
> On Thu, Sep 17, 2020 at 06:17:39PM +0300, Dmitry Osipenko wrote:
> > 17.09.2020 18:02, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > 17.09.2020 15:32, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > ...
> > >>>  /**
> > >>> - * struct tegra_i2c_hw_feature : Different HW support on Tegra
> > >>> - * @has_continue_xfer_support: Continue transfer supports.
> > >>> + * struct tegra_i2c_hw_feature : per hardware generation features
> > >>
> > >> I think that space before ':' can go away. Although that's preexisti=
ng,
> > >> so could also be a separate patch, I guess.
> > >=20
> > > I haven't even noticed that!
> > >=20
> >=20
> > Wait, that ':' is used only for the struct description, hence it
> > actually looks natural in the code.
>=20
> What makes the struct description different from the field descriptions?
> A description list is basically:
>=20
>   <term>: <description>
>=20
> And it doesn't matter what exactly <term> is.

Anyway, like I said, this is preexisting, so we can always fix that up
in another patch:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--7gLe/sNPhR777EPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9okgMACgkQ3SOs138+
s6EmtBAAkfQ9fVhXgL1Kn6aZkejoutZrTxeIfbN6vwCo2rdm2HliMngdx5VEd/HR
BeicysE9y12BvO34KW0VVeF7YIPELrYf1V76ROQmLI3GSwFNZ+1i8K4ICtRAHN4D
RUd4aCiyKDpqwK7WVzdxAyIE53YCd+Lmx4K89s+o5eRc0/ncFv76sHwaVta9fvPa
f9Rh/s9ec3E8Z70VyC0dVubQ7SB+/OZgtrqq4UvKQB4bnkToaRWM5AHavGngesCN
DEl7fZmKzZ7jM/QpYEcMYk4SWjrOmduYiEhf0y+3GrRHj8FxVihfBhRwwbJRaaUR
j0exQgu+B1Yt2rE1ieW8wjYZR9S3qIE5OD3T0oz37AH4PUEOT9yn+ZhuujRr1gjb
ckXw3Md3cSVxGyQJUtWqzUAvF/zJR86AkkQIvxAr8ZjlYWRA9qsyL4VctdVCpmye
XE27ycAXmcYOOMlJFlbU7bDdDA30b5JWnubnIiZ1DdDPpOQBmmcNxL/eREl2sFBM
wONlkz5+IH6c/zIZOxJl+eWKU46du9S5Xr00XctA9zphWkzbKwllzOFUtJl7K4Il
Ro8hwWokfMKANk9KHY0K34MzHEDzW7ILLD8FYcYEJ/STWBAkh8b8IfuRGhcf6Rgt
GNLhLC1y0NP16rqKAe9+6T5ztUA4XaO01e70+Yxbzz+j0wCFTwI=
=a9jA
-----END PGP SIGNATURE-----

--7gLe/sNPhR777EPF--
