Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546A22223D2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 15:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgGPNZO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 09:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgGPNZO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 09:25:14 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10B0C061755;
        Thu, 16 Jul 2020 06:25:13 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id e22so4745340edq.8;
        Thu, 16 Jul 2020 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qAJPPOLuJw/tHb1pZVSinVePDzJWispr0rvTXNStLhk=;
        b=nB/WDx1SGvO5JQhsz3LbhJQ7xS47m5yH14JLOluQoP8cIoCj6yuxinOszE73jtFsoN
         II0uShc06PMirTbyzBak0Z2jDWKI76s2FRgad3W+JuBNxGgkNPWKAZBaroWtOhMJw3AH
         0Y1ok6Y3JOOMZGYv9xpt0nNe8jIEb7THmzGZvKv3ThzqC/kstIwzysxDYYYZM/odZopQ
         5NuHiJncb3r0JtUR5hR0A3z2Up1pIRcA6qjTT6P3GpELs5SaP/SfhojvFj4YC0k429ds
         TjAV9aH2xgRWNNhQWf1T7cp3Vnl4HYHdMx4KD2FjVK71Vj5A5Bv7U06GuhxzZmKEAA+e
         whyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qAJPPOLuJw/tHb1pZVSinVePDzJWispr0rvTXNStLhk=;
        b=YSXTKJxKUD7KugxFq0dgpDRivKeZAZTX1f+65UrN92sjYor+NZx51PtDRfWMky4mGM
         t3ftMu8rnNqRJVyXm4bl++A1UKLCa5gSMAGBFQMex8kwsdG4OiCz0dPRcx9ww2hNprhF
         imGTUSFX0w6udyKC87tPFiIPd9nelMlVb7nLbvCT/URre6pFnH3PWjYMqW8LbUj9ZuBp
         TK2aq5UZOyd9/uypS+2bn6puiyjGtlKB/h1AJfEk8/MRY5b/42sWP2Om/Y7qYAhhW2Gj
         he319ZrjOl3mf7rdcOV145R8IuL8B73G9ERJFKSMa28Ua22VYkkckWElrZZw8yUiWNwo
         kGXg==
X-Gm-Message-State: AOAM531av9PsPSaOU0FDRkXQuBASVEjeOJTi3KeFdCnYg41Pl2H0jxid
        SCLQQg3fpmSHjEyWFlkaqOw=
X-Google-Smtp-Source: ABdhPJxLECYl1nUxuLTa/pRmJrq5T3akb7eBMyKeT+Yh/7+rF93A3oumboTF5NgJQ7f/oh/her18gA==
X-Received: by 2002:aa7:c6d1:: with SMTP id b17mr4546029eds.201.1594905912474;
        Thu, 16 Jul 2020 06:25:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o18sm5038155ejr.45.2020.07.16.06.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 06:25:10 -0700 (PDT)
Date:   Thu, 16 Jul 2020 15:25:09 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v3 01/18] dt-bindings: i2c: tegra: Document Tegra210
 VI I2C clocks and power-domains
Message-ID: <20200716132509.GH535268@ulmo>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-2-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/Gk0KcsbyUMelFU1"
Content-Disposition: inline
In-Reply-To: <1594786855-26506-2-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/Gk0KcsbyUMelFU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 09:20:38PM -0700, Sowjanya Komatineni wrote:
> This patch documents missing clocks and power-domains of Tegra210 VI I2C.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt    | 19 +++++++++++++=
------
>  1 file changed, 13 insertions(+), 6 deletions(-)

Applied, thanks.

Thierry

--/Gk0KcsbyUMelFU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QVTUACgkQ3SOs138+
s6GD9Q/1G32YqO6vyxnxRnDKF+eMWoaJCmEX9ZrBMCVb8gsN4zULuSYSKyApA/Df
jF8HpJqUs+q5rLTRIiJhcbzHRGAmPHyJB8HbSdhczMOxGO0BUiRmmOdPg8Nu56sY
6Y0oIx9t+YFddQw4GjtWlo+/qqXGjw7uZPge5bvwu9Eu7qmIiTIS9+u4Er/cQTGN
Mv7HV2lXxJb1WOeU6fnNNYhIqEps84XJHx4I8iIh93g4yWhU0gzcvrVjmQ5Ce0SM
YJfUbO1gaI+87TMpGg93rMsvyQfdK61hIXmDhwuTy4c5/57tSpxWGcx+6lzPmvg1
hEwhwKf2iDw2UNhVny6W5kKxuKMBki8eObRkOyayZ9mdrpZb/dv03axKR99odEY2
Grv+BTblrLBudH3PUZc2aoo8SgDTqiRvn8p2IEFO6F3xD6YQnAHWYd0PcUZhFiZJ
fuM3fzERkIUbrSiY/HbVkWEKkoneNY1TY17i6tP12YwZhIvVDu2w13i9N2RKcKid
TcRVA/aCd47buEa9y5GeiN1a9NBtDEk+1/z5qte/GrqF+zLXCrS+nyVcbepj23r7
Z31SU2NJIxK846PdM1Xx32Hl4bgv6KEheZ5jCEkJhgrglBP0ueZjIolzZre4QVka
ycxwcfpat4V47begjHpQ9p+SU/Vqog0gI+vYz0y827i41d8wSg==
=YyuR
-----END PGP SIGNATURE-----

--/Gk0KcsbyUMelFU1--
