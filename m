Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C514B351852
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 19:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234600AbhDARpk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 13:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234541AbhDARh5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Apr 2021 13:37:57 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86BDAC08EA3A;
        Thu,  1 Apr 2021 06:23:05 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id o19so1948695edc.3;
        Thu, 01 Apr 2021 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5ygqa9FWuFmxAlwf50Ft0YEOSKOXa1EWcv0ya6Di6Xc=;
        b=W5wRYpbs9hkiNXZsHOOwNu+fVTh4xfDoIsYfoA6e/giKuFmmHgfSqDU3rebRtw6Piv
         8Bnq17lxdwOUGBcpgRAc+q1IrdPTovKLxdRYrHcxasdpjtc8snp7KkGgITNEG/A0flSg
         cLYreNOU7robCiaONP7I6OCd85fItuf6o2Km9QgZGJB0QtmkOCavErAW+3Q6vJhlkAZe
         wEWia1EsHnfJF+1PpGyzyj+VlqzXBQvu69cJgFbgtfl7JzswdykukcQiLMOM218SIBm4
         LJSmMKVgx5RgoF/2C/24783h39g4wwQzI9Qsiz2aV79xHaO36FMQ/RfOVjQmlvpzN13/
         tjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5ygqa9FWuFmxAlwf50Ft0YEOSKOXa1EWcv0ya6Di6Xc=;
        b=qHAxo5Ebtz121eohBZhUcOMd3r4FpvTozPXHMPxuVs0l9PBhmSqgoSr25Co1V0SF3j
         iKQXWa1FfqGgujC1ODcgEFuePGncY83oEkkDVfuriQPIGKPk0SPIyc/arJJPyAKOfaa5
         U4jkhkbCFCFPgNSC/zWKPXqTFsi9bipToxfUaIgCiOLEykbcPjb4UhT1pD0YXqrQbquf
         6fbuGvFEe8AU403ZPBkrjhEw8j3ib3bJhy/oDlXYUOfdYTSfz2MK0QcQgZmg77j85zho
         aLunV82N2xRPRZufKYuokpG/Ks6mTpRPLKPnIg4pcBrdD4s/qqOMPZok/2V1T2cr2SxM
         KWMg==
X-Gm-Message-State: AOAM532IbeTPw3VPcldWyKtvXHyKmP2XW1nwhdEbjLxSO/NHL+rlUtWj
        KY7JyB326QJY2GmodaZ/dHTuUBzeOho=
X-Google-Smtp-Source: ABdhPJzYpXGH4H8cgGbD6924YrC67K1ekh3mJnDOpJujV5sR641kdjmx3UH67vKuL0THrme8A3z2Cw==
X-Received: by 2002:a05:6402:31b7:: with SMTP id dj23mr9980144edb.245.1617283384183;
        Thu, 01 Apr 2021 06:23:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d15sm3559656edx.62.2021.04.01.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 06:23:02 -0700 (PDT)
Date:   Thu, 1 Apr 2021 15:23:30 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 1/2] i2c: tegra-bpmp: don't modify input variable in
 xlate_flags
Message-ID: <YGXJUpgMnx8xDnCv@orome.fritz.box>
References: <20210331075141.22227-1-wsa@kernel.org>
 <20210331075141.22227-2-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Anz1p+RLPni8dZJK"
Content-Disposition: inline
In-Reply-To: <20210331075141.22227-2-wsa@kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Anz1p+RLPni8dZJK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 09:51:40AM +0200, Wolfram Sang wrote:
> Since commit bc1c2048abbe ("i2c: bpmp-tegra: Ignore unknown I2C_M
> flags") we don't need to mask out flags and can keep the input variable
> as is to save quite some lines.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>  drivers/i2c/busses/i2c-tegra-bpmp.c | 32 ++++++++---------------------
>  1 file changed, 8 insertions(+), 24 deletions(-)

I've applied this to my local development tree and ran this on Tegra194,
didn't see any issues, so:

Tested-by: Thierry Reding <treding@nvidia.com>

--Anz1p+RLPni8dZJK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBlyU8ACgkQ3SOs138+
s6GoGhAAiACz4ndsUFgAOE+dPR5PDaIQoDfX3xh0nvHdlY6wChg3VkknmThcY/h4
7Dwzk29jMAwvl0zSoJXQy4GMgtOvZp01TEluoxpPcCC+2Uiq68a7pXScEv7qGyzd
BKmOwNl6/IQNPwr4iVCEG6ZI2/t+XkwPmqv4/W+rPEJ9sAH1etQC3xm29BAvAoSV
xlQYpWkBFhPHDQIITZq+W/ztwkzysG9pweRuB7KPs9fnCCDgi46izcUsELVpqlPU
9UsJPFWlFcyuCa9NrtGImKZBhFIzjrWd5NF0nUsuNRRvlmJKQ10g521CLw+sVb+Y
98x/o1CUrthgL9nHnA2KFIncipjGdMv/4aq+kb2u6YKK/xVKdW1lqWIGzSriSs2b
5zlkZ/CV153sxoDEhS1Aw+WmbmJn4wf42/p9eV7+A+4zsIGu6DlIZPv6LYQaCG8w
ZqhLpR9CzQ+fj9WSK1thGcrlgduAO+3ReJgUGHFSA5owBLFUO/yEVCEoD06ZRpND
qt1BjcVymdtT/GGkOpu+Fwh12WgjjYVOZArtBAfwUesBOx0No/fJUNKzTQbjCKfE
yvUk4iTzD3JR9+2B0b97E5bVoh9RaRlwbxr1ON/rnWLaUbwWxlDAA8ErbcEzcXDc
oaA4rMBRZ5BdHnMpRFZhSG4r6CKgIjCEGLeTfMoOtOhPuFYvxAU=
=Mq9C
-----END PGP SIGNATURE-----

--Anz1p+RLPni8dZJK--
