Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2AE26DA00
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgIQLV0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgIQLUk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:20:40 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23170C06174A;
        Thu, 17 Sep 2020 04:20:23 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z9so1653554wmk.1;
        Thu, 17 Sep 2020 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s0Mn6hVpuDmYvya0vHUcmwuT1TeYzUj9E6j9cQhWCVE=;
        b=lEkID1R4JmGRGGsFR3W8WSDhN8QOSXYq8fSt67Q0iiFFT10AIWJ9IvZRyJE+kVvJbK
         upiGoGWPyiJ+jJDiPv89krXiNxIHAMU5qyVSUrIcwZm7Aoxql5UP7OSefuY5jdcySrsg
         PP297i3rBfvQrVIdK1WqqfsbKv46jDJOyAUO+8qRAdf589tTvI9BLZDFzWJmmiVf2c9K
         2ylLWME8i3t607G4CyaO2+/oAoptunPCPlNMnltAMu0swIFbnlUCM1bSMqLf1U2PojBl
         GKh0ZdBc/ajpTecPymGfzYX1UE3mal/pB+k6TpAOaSBkM5jv+jAlC4rSn6QorybkK1ra
         dnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s0Mn6hVpuDmYvya0vHUcmwuT1TeYzUj9E6j9cQhWCVE=;
        b=bDkvXkA/H02qoInCIXiAqaZPQ9VtlsrSQ5bBGsSBfbrzzpkCjA0OsquUFu6sPuIm/B
         M6Z5j9oIYjzwYGPbKlEr8YWcIJROJ2bTT0Rm771nGHf1S2QO9a66PkvPONue7w2pLygL
         QS02oL0BZPsPmZRADKBI57/BWkUW1Lfpkdv5KtGAqTCMNUGJOc52TVCnvAErzq1Ao1UO
         ZoR9/1k4ZRc4fQpPqVTizwcLQXeJk5CiFc/cAdJx8+3RIuG/tKyjEqnRxVIIGs5UnIxz
         0tm0SR4cvXCgie4giN/YHbFDy1DLAObd6vOOvhxrn1IOGoPxDY0mfSgHE/6SwtZ8kH9x
         xJhA==
X-Gm-Message-State: AOAM532E2PrC5mNjMoVfoNMW6+J23DZsiaW+HjCf/nk43iP+x6JB1tCx
        wsYKi+JvRKcNrQhRVpuUaaA=
X-Google-Smtp-Source: ABdhPJxY1aunJcVdJdKrdU5SY2SSnDG+tSkCJvAabIGENkwn/Ft7SpuHQbwdMCHKUtxCr/JoY+dArg==
X-Received: by 2002:a1c:2543:: with SMTP id l64mr8926412wml.96.1600341621859;
        Thu, 17 Sep 2020 04:20:21 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y5sm10614528wmg.21.2020.09.17.04.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:20:20 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:20:18 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 05/34] i2c: tegra: Initialize div-clk rate
 unconditionally
Message-ID: <20200917112018.GQ3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i/CQJCAqWP/GQJtX"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-6-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i/CQJCAqWP/GQJtX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:37AM +0300, Dmitry Osipenko wrote:
> It doesn't make sense to conditionalize the div-clk rate changes because
> rate is fixed and it won't ever change once it's set at the driver's probe
> time. All further changes are NO-OPs because CCF caches rate and skips
> rate-change if rate is unchanged.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--i/CQJCAqWP/GQJtX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jRnIACgkQ3SOs138+
s6Gvxw//YIsUb30uhZmog+j2pWjI6/ggd39LPU513zqrD+KNY4X3RbKgmszrJPHx
KmeG8a41F0D0/a8Nb10+54XkB9hfQY1eoLoia2yeNbjJu0Etb6+X6HPqaBKxfrCh
S9oFiWgxiZX4XdKp/69aTqQB6xUd+/2+/IXRoQaaLuTLW30WHcB8rdun0qN3DfVU
lpUv/YOYHW+AYKuKq2Pt3WsR5kemkF5qRginE5dlEHcN1qHWKy5edOzEFmccoILT
7s73zPf1SWsETLX3yOOtVmbmSkEywbbzg6SVVLdCM8g2IpHTQ9j0ZZj4lfWzt+GW
1RDnUCjaB289jqb8GnmzPrANnaOxj+jFTx3e/sndc0buPz37BcXmPQqAoQQMOTHa
oJhBKAwRXSDBRmKpuResjS3wtM5SD1ZoAZnRO3OmmnnKbQeAGDqfjfvZSufrfOHs
BqxhEJvfNr2tJ9gR9dll6YDP9erOQPEoDENBo8PH9I/XurVmOA08i3a/yIzFd9TV
nU/LvcLQ05cCc9Un4T8PyBsQfJsSoHgXNvU0WbATOap3wvSc/IrcPzCDGcffSs2W
TSxzuMImyz383wiCAT6O1FeMRtC9jCT0Ryg1syIks/xrWmqHcQPIS5bzH7AAtU0B
QlkIHSHfqEa9W3P+hkK4UnUHuFEX2GztsShHzKWCysXq8vCu/M0=
=VD5G
-----END PGP SIGNATURE-----

--i/CQJCAqWP/GQJtX--
