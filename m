Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE5C26DAE7
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgIQL1W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgIQL1U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:27:20 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E7DC06174A;
        Thu, 17 Sep 2020 04:26:53 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k15so1651158wrn.10;
        Thu, 17 Sep 2020 04:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hgXKYbM0FxliriBoHtZzEGLbiDYre2hcolRhvw2PK4k=;
        b=rkOjoAsuEGmMyPo9JZrTR/TmyYTFS57Dn/py4MVrViLOMV7Yl6xAk/t2li1Qpdjeg9
         UTGfo3u9R0lV1Y9u97lKavLWd8WhHCFPJJq7oAAILBchArjdqB7fvjZmuVzSOTHel7xO
         Rtr9ea/U5h0I/xcYyTaSacZPgaYXDJsdq8HnhIsFBDkBaww3MvgL5A7dxuNUbUSeHOj5
         a54wIxKyz1AwS6BxD5dIEwvSa0AYJ+ngAeT6zLOXjQ4+/hCrOtWrysbPL+qyUAJyVfpI
         WDboxlnHQQzP/5NYnQ/QtfHtIL0qrRuY0k/2b54zmHWlDh+t2GCSFIwlVcKk3wc30exq
         r7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hgXKYbM0FxliriBoHtZzEGLbiDYre2hcolRhvw2PK4k=;
        b=UvLu+TFgosILbeYdnUzUnSC2sgQrZNuNE71rdhXDeisW2gTeTlUBIswBJnhTXs6u4z
         f/Ctn/p9ozqiFhe52vN8slBY+3+Ekxyq/WNpUfsK4O4gvjGj/BX14ZTj0YeX5OX52NBW
         piTEm2ijornoXIO1xuxyM7Jq4LEzvBkqbm++Gq7TmSG4cr2EXDlc/oPxx+f25TfSGz9K
         a+LWrjllZ28hvSQa7/rFHw8JUf82PDJlKi1L5/sGVWfUsw3vWa+UtrPnKMdrFQbyaIob
         lFVN3siDKh2YkJNqR3Vc2cTunnCfhSKX5mUOGSHsfIfmWamW2TnhNEhk4p9rWLr1R8dp
         fTvQ==
X-Gm-Message-State: AOAM531iSrOdCgXWdpVxo2kvCfKY/5bdxC6DjVS2gt6QmLVnPdmvJEpx
        9ZwXDAnKbkitrUNAclG5Sqw=
X-Google-Smtp-Source: ABdhPJzYH7mlV1lRCautWIWWJ3PKTnLiI/qb+GtFP/RpvUwgo+rkBxMzN9JRp4EOXJeZs3X/M0wjtA==
X-Received: by 2002:a5d:4388:: with SMTP id i8mr31473250wrq.365.1600342011709;
        Thu, 17 Sep 2020 04:26:51 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t203sm10806341wmg.43.2020.09.17.04.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:26:50 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:26:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 07/34] i2c: tegra: Runtime PM always available on Tegra
Message-ID: <20200917112649.GS3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o/5eNASeIIpuMggS"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-8-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--o/5eNASeIIpuMggS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:39AM +0300, Dmitry Osipenko wrote:
> The runtime PM is guaranteed to be always available on Tegra after commit
> 40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remove
> all the RPM-availability checking and handling from the code.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 29 ++++++-----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--o/5eNASeIIpuMggS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jR/kACgkQ3SOs138+
s6GdFRAApWkZ22wz87S5ny+K7oMkHdAlashGwFCHEHOql51tSWohFjSdFeoeEYBP
m1YnV7HyriqoMjDwFVCfC1I8Ar+HnEoWBszWLIfJd34Wgud7eczhjZtL6lhJHzkX
oFJ2GzGA4C0LxDvnTJAWWA182kEHdeqha9uyRBYM30/3X5tWUgPVsqflx5DpipxE
E4Oekj2Z62A+x3poL2NRkC6YCBO4bps/2k3w5BXxZhCbUGusRiXO9g/RVpUm9xx/
z1IuZ5tNeFlWMJDrQydXhSw/dqUAU9r6Xncuob0qHykQY0QPk7fv9wyMHbZjJIJ0
kg8UbI7p/Xp/xZ67Ni6vd4DHanEiXTZ97Q7P/lyGRb75bYeqXFrELwf2/NSMKag+
iXwdZA2JPwqCWjLc77kM2aCNST/qjAPKb0iqzUTuc9KwCnctglUWe5LaE+IodVA7
YWYlpb2LcaihwlyhDw4TmcXEk1Tm4hGWUxAgAzlB4oDSmesEw4EcWyrwhijZPzDk
FzLvSg0IuZNR3uXkv7lwyGxjvXqoCghBIB/nSeSbuVHZKzJqLb7e8zUih3cYa/Dz
eld1QUBQkMIbUsZgvvljsHa/tNYPngNRVbzC8M5Yeezum4z0Ptf1MB/6/GTcn+d6
XHeFb1bLPdahCfgJfQlTGDBDC1Zmc/wZ77y+AblCMovs7lCcUIk=
=zLFT
-----END PGP SIGNATURE-----

--o/5eNASeIIpuMggS--
