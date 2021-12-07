Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A8646B664
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 09:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbhLGIwr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 03:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbhLGIwq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Dec 2021 03:52:46 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1508C061746;
        Tue,  7 Dec 2021 00:49:16 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id y196so10110085wmc.3;
        Tue, 07 Dec 2021 00:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QR97QPW6f+NCgAfPv43w1fjZD41f7yPQgmLStq1mi9A=;
        b=gRh0LSOOXgIypuCdQaadqe7XgZFROTeqpk1WWlszBVKUUUiTyjV00+KOcnYsNRAX47
         5X3ALW2nTtvtWHqgaUe9zA4UUUjrNu10vXPJPvxB58W9EN1tSP8hz05dDkuR0k+s+AZh
         xrzBKOxupUAn/CqiBNghQJtdF4tjfmSatN2sUUoqaqD3IEIMToLSi2Ke5c6iim46iQys
         Kb/0orwNvVJywlOh8k9fd9C/fPMILruFbp5RSzOfYaZ5dPnRThCRcSGb3qjJ9RpA3+KZ
         yn3g2KlCui30P8L+KmIAw671RtfrcvdbaCtIGh26eFGhOlnNJG3uH0yXlWBodbi7NoaO
         BQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QR97QPW6f+NCgAfPv43w1fjZD41f7yPQgmLStq1mi9A=;
        b=JOKMMOYIi1pQwIW3h1tbV3EawCj2DQtxRQRgSFmhGwtP1ew4d44KWkaJbuUG5YyOP+
         F+rBeaFU0UWLkac4/Zg1vanOUrH6s1GPsmu8/KUXaY211WrSPNHeuThst0LTZE3/3L/Y
         5jVL43mjeEsJQnpuz7smPZSTpRWsJ/Xoqn8FhIijAUA4pe6Bj3CSXZqTlXxE3iOOzgN6
         6tE58d9DHK2XY10YT6aOwpvdS9BCws/5Sa+YnPwhDiHijx7C2nSH5ttILlWlBQy39hvc
         UnWBn2dGEsMKdKlFR34ef780zOswc20KHw0wrzDUFAv447KGIEHsbthXao8UE9SgA83L
         OliA==
X-Gm-Message-State: AOAM530euGvqYrQMSW/1HlaUKXtGDV3oVajbaR/oj+4ofoPTLLQyXgNs
        ZLBhypjIPOsCP2AXKAAjYV8=
X-Google-Smtp-Source: ABdhPJwlcEDhqDKisTkge+HksHvcucpIyuEWBZi2ohpxLgw/uhMKKUgIA3jxgrmbJ1OgEC7tsfbrEQ==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr5272284wmi.35.1638866955262;
        Tue, 07 Dec 2021 00:49:15 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id x1sm13693748wru.40.2021.12.07.00.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 00:49:14 -0800 (PST)
Date:   Tue, 7 Dec 2021 09:49:11 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: aspeed: Drop stray '#interrupt-cells'
Message-ID: <Ya8gB4mu3yFYCbhp@orome.fritz.box>
References: <20211206174237.2298580-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ICqRkSFbTbP5VtpW"
Content-Disposition: inline
In-Reply-To: <20211206174237.2298580-1-robh@kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ICqRkSFbTbP5VtpW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 11:42:37AM -0600, Rob Herring wrote:
> '#interrupt-cells' is not documented which causes a warning when
> 'unevaluatedProperties' is implemented. Unless the I2C controller is
> also an interrupt controller, '#interrupt-cells' is not valid. This
> doesn't appear to be the case from the driver, so just remove it from
> the example.
>=20
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Rayn Chen <rayn_chen@aspeedtech.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 1 -
>  1 file changed, 1 deletion(-)

Interestingly I have a patch for this as well but it does the opposite
and adds interrupt-controller and #interrupt-cells. Upon closer
inspection I was tricked into this because the i2c-aspeed driver
includes linux/irqchip/chained_irq.h and linux/irqdomain.h and therefore
I assumed that it was indeed implementing an interrupt controller. But
none of the symbols in those files are ever used, so your version seems
to be correct.

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ICqRkSFbTbP5VtpW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGvIAcACgkQ3SOs138+
s6HGYg/+O+id0oZwHJkCp6siA2gEqNUXVYkH6mzWDT9oDmO7ABtPrYBDdQi8FLda
Y2GS9i6jKuW6j/EP8fDX61ksJhBBuu1Aj89ivX3aPE9QwZXOHCUaVYnRjEVPyUN3
eFv0QSBMWxsLDNQ0bpOFA5ZpxkJ87wnh1z9u5Vkf4F9q6yUZcWuICwJJImgF5Udm
LcUaBVBLys7gLX4ixJPHymnB9ogCxS87QTdGXSY94E3iR46Spkr2LKOXVaKbqVKJ
OBQIdlk64ZSpQOQ1mUDRAdkSoZtyEik4MBbdOwb5/9bT9QvPu7h1Yi+DWxwJpW9x
40KZD8JDK0xNlJAlUtkiwbu9frmpZrSz359rnQ9HXLbze5p89xsvpLtOiYDemTBW
VYfFjGVMYAhLx5UgIMDTO4f5oQeBeG4N7XkrSAIEK4zZ9OAjwJ25w5aojJuULqgH
/jtYeTcU6dkJ0RD3V7+vhaiznwlPZr4tfu63Fqt3Ai3EVYMqKks78wZhwtrrhrOO
/SpWSv4jyAC7Mh1R6KnDD193ar6IPdW6DkCeuEokRVCpdRjtBGSX2aplXgVlRk+r
YB3WdOKqkaJuEqKhzYuUdaHsTyRSdzSrb19hWbtHjZc+nuQHLs4GqpAxCxNHoXNR
V8bGdcm7GQOiVRbaaY9a0+d82p6+hk0rvv9TtKqE+afw/enojQI=
=8Ial
-----END PGP SIGNATURE-----

--ICqRkSFbTbP5VtpW--
