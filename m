Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFC01D9C09
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 18:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbgESQIj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 12:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729254AbgESQIi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 12:08:38 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98CD5C08C5C0;
        Tue, 19 May 2020 09:08:38 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z4so3633594wmi.2;
        Tue, 19 May 2020 09:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H3nu7VrwvLGsvIsa7+j8CtNPbNRPrA0ZjO/Ju6okssY=;
        b=JAth1hRp/E4hzP+kJYGtmCG1RahLqaT5mKGRMHgrCKQRVjyZXaKX4WISMJ/Y3fzC7t
         mOK3V1d/vcK/a6PWqfX9L0Hj0GYL2vqce8Ubw0765CS9ad/nHH+0moTU0s4UADt5Z1uF
         Q55bNU7/TtFtzyhWHpDtCeu28l0QkuyoKPKUmyo55Lla4aMK20fNfDTBIZJvL88ivsEa
         xPPc0HbpUOVfVitQ5dYFm+rYnVEulmoSdF5qmzpbtXXtpQ/uvECwqBdBoPDbcjK3Dove
         yM2v0Xf1psMaxvmYcdnhd8AU8gSsQ3JTL6kgf++Dw7xFrzlfBKK4qtoHdmQIvaNVwC0t
         3tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H3nu7VrwvLGsvIsa7+j8CtNPbNRPrA0ZjO/Ju6okssY=;
        b=Bjrxb/y0tAZvWRDYic4iJPcFxPfRdzuAFuUTv97/lhBbXe4i2fX1C71hPUQ6QR/uC1
         VpQOBnD5vqplxy8idwKHIb5QvxRxfBrBus5SxqgyjKZ6E7gQlca7aWBmBq3VUAKtviN1
         oxmZ5nivToDAmhffU3PnAN8913IWcZRjeL3xP1oAYe1NLN665Vn0X9eIwhxOPrwB1Vwf
         7CHMPxG1qOFcI/ykZO40DCYm007L2LM8YxKV9Dph146kh7twt91SkGgXiPx9z4UX9zWN
         6MejTb1B1FWUfOjYJNp34XnHbdabgbvIqBcPEu7hjKuSTjGxnZwCIKYlBeanNTY0leLE
         FMVw==
X-Gm-Message-State: AOAM531YwK3odYWO9dH/A5iLAxMCzXsCPZ4f9ndQcYUrmL+ssb85PrrT
        1tCdnzjZZyFppKqAcZrsBt8=
X-Google-Smtp-Source: ABdhPJwj/tbR/q+NrqQ9jpGL0M7S6IIFZiSBoZawQj2sCxubfCZRcJMrfo+6mXZJoTDuoiXlLBLc1w==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr113632wmj.3.1589904517325;
        Tue, 19 May 2020 09:08:37 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id a15sm21433590wrw.56.2020.05.19.09.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 09:08:35 -0700 (PDT)
Date:   Tue, 19 May 2020 18:08:35 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] i2c: tegra: Changes for v5.8-rc1
Message-ID: <20200519160835.GC2113674@ulmo>
References: <20200515143924.1579055-1-thierry.reding@gmail.com>
 <314a292e-bcd9-bb30-4067-71dc7cc399d6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <314a292e-bcd9-bb30-4067-71dc7cc399d6@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2020 at 10:45:32AM +0300, Dmitry Osipenko wrote:
> 15.05.2020 17:39, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi,
> >=20
> > The following changes since commit 0e698dfa282211e414076f9dc7e83c1c2883=
14fd:
> >=20
> >   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/fo=
r-5.8-i2c
> >=20
> > for you to fetch changes up to c73178b93754edd8449dccd3faf05baafd4d3f0e:
> >=20
> >   i2c: tegra: Add support for the VI I2C on Tegra210 (2020-05-12 22:47:=
52 +0200)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > i2c: tegra: Changes for v5.8-rc1
> >=20
> > This includes a few improvements to make the Tegra I2C controller behave
> > properly on suspend/resume, does a bit of cleanup and adds support for
> > the VI-variant of the I2C controller that is used primarily for video
> > capture purposes.
> >=20
> > ----------------------------------------------------------------
> > Dmitry Osipenko (2):
> >       i2c: tegra: Better handle case where CPU0 is busy for a long time
> >       i2c: tegra: Synchronize DMA before termination
> >=20
> > Thierry Reding (5):
> >       Revert "i2c: tegra: Fix suspending in active runtime PM state"
>=20
> >       i2c: tegra: Restore pinmux on system resume
>=20
> In general this series is good to me, although I have some concerns
> about this patch. Could you please answer the review comments?

Sorry, those had been burried under too much email. I've answered your
questions now.

Thierry

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7EBIIACgkQ3SOs138+
s6H9yA/+KiXPhxq4DKM2TKGlA1D80ApzNJeKnRVrHVqhxvjfR75Fu3uNEe3/5nSx
lxcBhgr/izItLIaqI4Sn+JqmXrWF3OhzPYR4CuCadTZyKqI8gdVe4j2cGtlooN0G
9l/9dWPDhHBmqyapu0TFVPrKHeRwt0ittIXE7FmjESu14Sk1fEbQCyf38GJpOaOJ
KujHRXgvKJvGH/Ta1AQYaVM5NS7YQoRvO9hH5IPYhTjaWgE+DWUzTHDKUkZH0kMq
qR3PDa4M+RkIRubEoXqJyTVx6hKP/uCl+3bzSZ1cT8Iph4uXmNP6x2swcfogEWJL
1wQ+A0JIaG3dHg/SoCbpbqCnss1jCFKaiTa74HWAuBH3RVS+upJsjLd4lzwNcYEr
Wb0nAtgnyKlqo+wM97f3lljRXHgu8c/0y1eX7UmL8utdVTiE5KnwDaG37ERDpsnS
7ep4J0eZDA+WDkQ5w6AzjZM5dw8fXKt8Czxy1AExggTG+Y9G1R8wY002EDqAnycW
tVEx/jgVvWZq1ESwGZMUHpVpE2U072p43qwlidnnlSW27QkCDeZ2Hx6JMFKZJ9bA
k9igkSiDc+jtiihGkAz9kQPKIfGbUvEp3ZhOGHqqN/1iRDiwr4lIfbHT4oYqwMkc
fcTBARUrorQrDGXGiKmOmSXmzb79zmcE9cESlYugNBzqYSSXYNU=
=F1qQ
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
