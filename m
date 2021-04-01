Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881AF351440
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 13:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234160AbhDALLQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 07:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234194AbhDALLH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Apr 2021 07:11:07 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C5BC06178C;
        Thu,  1 Apr 2021 04:10:03 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id h10so1463919edt.13;
        Thu, 01 Apr 2021 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2iYfNltgE66MNf1+cCMunSVnQ9fC+NyShwsSwfmwMG4=;
        b=BLqzrTYzcMv1sjx4MiTfzkg5FfZBElR9NHTjybHfic25RT0pUlWPuu140JqpcqIQSd
         mMtqbRUtXkg9ucbHUWMFxGkC/pRTX3yV7RspvOxTSBNsdJwB/8suY2Pw5NUEvGSkKQcE
         xjfrCA3D4Gxyroolr7ewHojoYUDTynaWgy86mNzyKPvu0yuSF5e8bRmqt0uixezFuY9F
         AbUq+5DEOEV+9vjE/Tw5zte044gc84cGGFRjvtAPgbNHiMUx+WoPEyTiyp4xXhvEesMx
         t3fLumcGSDNqxnQ/ufT8hn88H1yPcaWfAIxpw4rAnAbME6OF5zuDg9w//NcG+LhuMx7J
         SHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2iYfNltgE66MNf1+cCMunSVnQ9fC+NyShwsSwfmwMG4=;
        b=CUXS/zdTCzUNUMh+oCkiFJ3qMseiNdej29W5+GAu8fyqy8hTRknxsjWhbHHruzdZ1N
         0FT/UAYVQnpKR3Y/IkV3XS1qa/7gaH8M4cjGxWPGuRwuQPFIScJP/zfDD663ENyYpXMW
         iBeCehKpV2TAwm7QBlobcX3H1rdJeEeETKovNVkQIPnUZdFnH4JmG5i4wq8Yt9Z2KjAU
         MWCUutylVb0Gmo845RdvBJZelIFu/cm5fsFrItVOtwcZLd8PnTj0j5FfJq2NLx/FDe7p
         tXCbLptCOMUVT2fW8Wim9+oswpgGhTcXJnm2HHXpFuaFnG7qo1cdybXFaLp6afGGeikD
         9CGw==
X-Gm-Message-State: AOAM533C7b6lq2/TOUEaPoHdCI4toF7tivebYBZUWqU2QKLN7MZrIEqz
        08ZVtOjg6j7Vqz+NnVBsz7Y=
X-Google-Smtp-Source: ABdhPJzkl8g28FR3OTh8N1fIE3v26GDXOH94FUrwc5rjYYPEQZxEmyTLBSHFqSPnTFIoZM9B97qywA==
X-Received: by 2002:a05:6402:698:: with SMTP id f24mr9130630edy.262.1617275401846;
        Thu, 01 Apr 2021 04:10:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y2sm2586168ejf.30.2021.04.01.04.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 04:10:00 -0700 (PDT)
Date:   Thu, 1 Apr 2021 13:10:28 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 1/2] i2c: tegra-bpmp: don't modify input variable in
 xlate_flags
Message-ID: <YGWqJDragDjqoYOx@orome.fritz.box>
References: <20210331075141.22227-1-wsa@kernel.org>
 <20210331075141.22227-2-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ulkELN0qXIIA2VQ/"
Content-Disposition: inline
In-Reply-To: <20210331075141.22227-2-wsa@kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ulkELN0qXIIA2VQ/
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

Heh... good catch!

Acked-by: Thierry Reding <treding@nvidia.com>

--ulkELN0qXIIA2VQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBlqiQACgkQ3SOs138+
s6Hljg//VeHjqThQ0xUFQiAFUxEcj63HY+LqpuT69aJvU18GA7LFeufUzSpFEfc+
9rpXBJZe5Uw/6Rdc6uCBQPkeLX2uQT/rkTdkWY/kCIOV9YgE8xjc3Zh8YfOpnpA0
5bV3bB00U/9oxdHCiZ94Hum7qPZ74o42/LVb15+Jbmk4wjQ71it+z2l7doX3K7F0
zClYgdm2S0f1BTtXDQwkDRIz0sQ2sGgllGjly+s0ij0zfAtVP0+dlp8tvztxXku1
SoBovzL71rtEuf04RaLrqNmiix4KSsNLefKaJeVHJ/Cvdtrv+DEniyUBa8R/cQ3L
jy3trSigOXmJMDUXglnsdiObEwiEPIvOILLRENqIPZMTdsvJ4JyW+24Oem/NKwie
UrsUM9GU7kBZzph7xhGZey1rtZEgWG5c0LL9UVWA9Rn3di85/F89YIvxCYSNa8me
30mkLoaErGLZ5bNwj6a4eNIdMiqZYHMSJI4B7LMw3VEIVdxmiVUgqZlPP4he3ZFM
tC+RQZk/b4Lo52t1kfQlr0I9A4oKfcvrzY5rPHNJS5w+Taj9kUC4jlFMiiUbmC4O
SS+4wPpS6uzUy989YJuy9AP2HLnKu+noibj5KgcDB0ox1+vtXGiPDJ/ytGKuXJSZ
+8/JSU+1A8Ni/eoitakrEXCu2fEgIb9MOIhriI9YM+54FJkLcmo=
=hQc5
-----END PGP SIGNATURE-----

--ulkELN0qXIIA2VQ/--
