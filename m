Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459453519C0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 20:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234103AbhDAR4G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 13:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237193AbhDARvB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Apr 2021 13:51:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D472C08EA3B;
        Thu,  1 Apr 2021 06:23:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ap14so2924307ejc.0;
        Thu, 01 Apr 2021 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TLYZzYC7kune3zSfVVdBcQLOfp865ju5ItSB96/oYR8=;
        b=F0RkON/ZHnb/EPNaq/7KFYBOhpTGGhmebZzMBLB1CcCsPGdlDFuE60mVwTDb1ebLul
         i3uuA02RhRlL3exJ0mMhKLIEFry3Kz3TrG+WjxJR/aGZ9leQaSNNxAuysvYrbFtsv6yP
         Ha+bEX7lVgQdUbm6qP8oSjAxP6bO9y83MPLuZmj+vy7AAZpPhbCKlHnUyx8IzkMS77ai
         aG6lmGBjNrCbu4SFymoPYBTVqQ2tHh6v2uUDrk8H0DHi1Zk9JHvYdgNhvJyhdZwb0yFc
         rHU5KHyZJpH/7O2c58pPDNlYvtEYSU2zsfJ2UJmpeEzsd+nhcxXwniIVuNbJucWb/pvB
         3PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TLYZzYC7kune3zSfVVdBcQLOfp865ju5ItSB96/oYR8=;
        b=guLY8MHUD6IXtlQYyBXlzi+fUh0E3SrkETJeAagrXRolYeVHJX6rP/fYrXoSOB5h4o
         RGNf5zhHwSoWEfkMTLklCH0Oi8UFjPmrb8dO+Fw4HzsYfuisQDVu/aEzKZDvoIcrpX+C
         TZRaogKE0BAM6vZhOjNFL1VG5X0XNkSJhfOySb4pEa1CyeDV7qQWmrGosIxnaomyuExb
         OkFlNwZCYnsD00OCeB2X9z73D7p5uMNjmlsX5eDLP8GIiPrzgJuxiCDYGWohXVtlefZh
         OPbvxE8W10ywQP4GOja8jxE11mRk7b6APzMEjilfuG75Xw5IlTTN3F3kz103JfSdpZhE
         55cw==
X-Gm-Message-State: AOAM532xreRCpY3qLRD9kN/hDSxooNT5BRj4VngpkR5dP67wTxvZss7c
        z1vUeuT6m/h2jKiAUWT3GvNWi1jEnNs=
X-Google-Smtp-Source: ABdhPJyBznMqCW/x1FurFDOu4scrUFIfE/XmC/zTKwBktKJoDSyl/UtzPFVugI9of5VNQ9YuSj3Z3w==
X-Received: by 2002:a17:907:3d8d:: with SMTP id he13mr9274707ejc.530.1617283401002;
        Thu, 01 Apr 2021 06:23:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r24sm3492722edw.11.2021.04.01.06.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 06:23:17 -0700 (PDT)
Date:   Thu, 1 Apr 2021 15:23:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 2/2] i2c: tegra-bpmp: make some functions void
Message-ID: <YGXJYUGVFa5EaQR0@orome.fritz.box>
References: <20210331075141.22227-1-wsa@kernel.org>
 <20210331075141.22227-3-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fKfBd+NSkD+Qw2c1"
Content-Disposition: inline
In-Reply-To: <20210331075141.22227-3-wsa@kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fKfBd+NSkD+Qw2c1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 09:51:41AM +0200, Wolfram Sang wrote:
> They return 0 always, so save some lines and code.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>  drivers/i2c/busses/i2c-tegra-bpmp.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>

--fKfBd+NSkD+Qw2c1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBlyWEACgkQ3SOs138+
s6Fr+w/8Cde29MsDOpSRJDI8gGeaJ7W0dB+GLmGeTHzpQ5RcuFtVB1QCKxqdxLwx
2iOMk0pRlDWGyBu/qu0KVtlMkyyM4z8O5iKrATmQJ1rxWavni30DmIt061lrtz2P
RADljdIPlX+MCkhuRJillY6HgzzGxI+R+0aMhXR2xr01jcS0cUeMwhXT9iVHnS2M
oGR3PKADJpmGd5lVqcfI+tyta0wgX/jmhzINGl4b4rFwICVu7hJhhktzaG3Ya6+H
TPCGg+zKw4QH2iuEGmU170j7Yppwacv3eo6qAI96umhf7UpWbeZ//pODEMNRuEUi
HryDiM2U/HbqBW6FglJ57x9JX0kVa7zKqBMYFHlzTdkPDsEQnbPJ3Z1DNtkEzYLs
asOM0bxplZ7RW7cP92C1RcuTdqGy2pz7bjr/JrgwVuMSAynYLBpKkoorfn9NzskT
siSUjHqJKiX5FuOSu5I/jDL2qOkcoz74LLshISNS1QOnoF7dDGc0p8OQCsUF4HCp
12FiOggiymwXQ9LATcHp+o4R1b4suSdHuKwtxOWVf6JFUdnezuva15I7upiSrV6l
gKDPpvYHYifogF2hwMbp77Aw9V7gTsW6rdHcXvX4lvbmBPy12V1EOpgEsSvlqPMF
5eeFS19cNeECRsgxmCG+kJKV3Iy9SJ0Yre41Lo3c4w4uEgsNHFY=
=N6Kb
-----END PGP SIGNATURE-----

--fKfBd+NSkD+Qw2c1--
