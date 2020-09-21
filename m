Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF1A272174
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgIUKtZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgIUKtZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:49:25 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0F7C061755;
        Mon, 21 Sep 2020 03:49:25 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d4so11644790wmd.5;
        Mon, 21 Sep 2020 03:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sFVxQK8xBdnDzjC1OK9aTiATQgc70EQvPj0Jv/k0m2U=;
        b=LhgB896XWAR4s2E2aG3g4uEPeh7KjNPwa6dX/xHSQ8LHOxzY+mRid+dUEOgG6UsBhJ
         IoRcSVKdEjWHBK8oqbryBenL916Ult9x0nvSeP3neaOz5KLD/zHtRZShWC1XrS1gLH8C
         Y1VMdysiQjI++mibrEjGMsl0EVfPngVhwZglGdr6DEtHMFu5w8NdVMeIcV+d/3DKoCFD
         udvzBdgpHrm29tUyt13dGKA5KNbWSrAtWrW4YtGApghHqQPiU0WjNfmxSNqt6AQmy17W
         M52QK+aWP138GkTqxtJ/bzkRX8ZzqvYnJw9r2ITkaMA2Z4iD8k5/Kxy9PzDwlysrBLlT
         EeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sFVxQK8xBdnDzjC1OK9aTiATQgc70EQvPj0Jv/k0m2U=;
        b=OsJPNvFjiO8wThYvbt/E4vree4YmK28iQBrTQv6e3SvW89t83iBLewoXPI16VLBCgo
         qauZY8clMZHC5xHHKCZccKZffFP5Qx5WbiKCicACMs98GkisxmNimUg/cWW0sHGuu3dl
         5YqfltW6WhcDZfCYnV2ceJmMy3rJ987/m7E8m0LWv92OPzU2EHVyI4WLqdHI6MKTSlDK
         Q7l5BTR1w/7PLiUekFrKtBQ1klg7y5/3ZnBgCDIxVa0ggCp+Z8D3/nYLsX/1CyRjH3GQ
         NSlX2ZcTXPKDc9GwUsllnHsvWdKFLT+SG8JTKa/v0wyoBtmVjKxRL1wZhxfRk5an7LE0
         Qv3w==
X-Gm-Message-State: AOAM533H8dFf3zBeFNnsIbMfT8QhdBxKXTREKWBZeWvmGEGjcP0J9ciJ
        +d4K+iiRTFiQhxz75KFhy8U=
X-Google-Smtp-Source: ABdhPJxrLrraWSWA5NDAw14eQvB/LHfrHR4gsnemPlmWHSd4rdUZOfU1uTsJkoL0IZjUL29ej3djRg==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr30894952wmi.55.1600685363673;
        Mon, 21 Sep 2020 03:49:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id z13sm19918106wro.97.2020.09.21.03.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 03:49:21 -0700 (PDT)
Date:   Mon, 21 Sep 2020 12:49:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 06/34] i2c: tegra: Remove
 i2c_dev.clk_divisor_non_hs_mode member
Message-ID: <20200921104920.GB3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-7-digetx@gmail.com>
 <20200917112541.GR3515672@ulmo>
 <716583f1-60df-f576-16d3-dbb72d12fa54@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <716583f1-60df-f576-16d3-dbb72d12fa54@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 06:27:28PM +0300, Dmitry Osipenko wrote:
> 17.09.2020 14:25, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 09, 2020 at 01:39:38AM +0300, Dmitry Osipenko wrote:
> >> The "non_hs_mode" divisor value is fixed, thus there is no need to have
> >> the variable i2c_dev.clk_divisor_non_hs_mode struct member. Let's remo=
ve
> >> it and move the mode selection into tegra_i2c_init() where it can be
> >> united with the timing selection.
> >>
> >> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++------------------
> >>  1 file changed, 21 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-t=
egra.c
> >> index 720a75439e91..85ed0e02d48c 100644
> >> --- a/drivers/i2c/busses/i2c-tegra.c
> >> +++ b/drivers/i2c/busses/i2c-tegra.c
> >> @@ -250,7 +250,6 @@ struct tegra_i2c_hw_feature {
> >>   * @msg_buf_remaining: size of unsent data in the message buffer
> >>   * @msg_read: identifies read transfers
> >>   * @bus_clk_rate: current I2C bus clock rate
> >> - * @clk_divisor_non_hs_mode: clock divider for non-high-speed modes
> >>   * @is_multimaster_mode: track if I2C controller is in multi-master m=
ode
> >>   * @tx_dma_chan: DMA transmit channel
> >>   * @rx_dma_chan: DMA receive channel
> >> @@ -281,7 +280,6 @@ struct tegra_i2c_dev {
> >>  	size_t msg_buf_remaining;
> >>  	int msg_read;
> >>  	u32 bus_clk_rate;
> >> -	u16 clk_divisor_non_hs_mode;
> >>  	bool is_multimaster_mode;
> >>  	struct dma_chan *tx_dma_chan;
> >>  	struct dma_chan *rx_dma_chan;
> >> @@ -783,6 +781,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2=
c_dev)
> >>  	u32 val;
> >>  	int err;
> >>  	u32 clk_divisor, clk_multiplier;
> >> +	u32 non_hs_mode;
> >>  	u32 tsu_thd;
> >>  	u8 tlow, thigh;
> >> =20
> >> @@ -805,24 +804,33 @@ static int tegra_i2c_init(struct tegra_i2c_dev *=
i2c_dev)
> >>  	if (i2c_dev->is_vi)
> >>  		tegra_i2c_vi_init(i2c_dev);
> >> =20
> >> -	/* Make sure clock divisor programmed correctly */
> >> -	clk_divisor =3D FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
> >> -				 i2c_dev->hw->clk_divisor_hs_mode) |
> >> -		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE,
> >> -				 i2c_dev->clk_divisor_non_hs_mode);
> >> -	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
> >> -
> >> -	if (i2c_dev->bus_clk_rate > I2C_MAX_STANDARD_MODE_FREQ &&
> >> -	    i2c_dev->bus_clk_rate <=3D I2C_MAX_FAST_MODE_PLUS_FREQ) {
> >> +	switch (i2c_dev->bus_clk_rate) {
> >> +	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
> >=20
> > Is there are particular reason for switching the simple conditional to a
> > switch here? The old variant looks much easier to understand to me.
>=20
> The reason is make it readable :) For me it's too difficult to read > <=3D
> && { } + no proper indentation.

Guess this is very subjective then... It would've been nice to avoid the
+ 1 and instead use the correct enumeration value. I think that would've
made it a little bit easier on the eye.

But anyway, no reason to hold up this patch set:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9ohTAACgkQ3SOs138+
s6H5gxAAq8lxEQuTD+ICSI7UrAnKvtPj0dffLSIhLhI6sJskBNYnNdYsf7XSV0+Q
L/VEqn9a7bILeTeSCx2woc/WEIi2lvVIWjy7PN0NFd5Iy47zlq1+Q9F8dfJjGZPX
HQan5r50jFANqZLyxd3pE+XXreO3pv7sDAHTIOfiHME5Za81XShtcqG7b66R4wU+
BJlUSIKxUM4uiDoaJGtkFY3F2fGpMM3FrcbzaqArmiN37E42G409NUiUSMQgzdw2
jNiXYHysoPAC46owmd0mRSt2R6UM98vYD5BoRM5zc1eXMynfjsA+Pz/cTqaVnzqR
tKfhalHcTSOIIzWi2tIBDBYYhgJ0TZfyoHgVaKa9p98BuOPWYFCnuUJMgh4gWSEe
3zGFRGLF9LPb64WoU6DRWFwIezxJTmhkKg/Xm9asplw/FiPJKGoLtycM1bQTKfb4
AHqBcGaeMI8GU9uIQa9dn91Oj9iDbaEbnHd73BW+y/Vfd+5jt6CRG3ctmA1Ke9y2
zM4xFpX5wh5pNwyBypPQ+p8HGBXPX75d0+WUnZYphId2Es+SUfPbRzJ1p/gjC2fr
mj50HJLY4R2xtFbSmbUjLjn8/GS12O/gQ4j3SUxDauNgdW8Ds42KPdXmLbvwOzpE
7syEHSl/vdX47rS3j7tbPAarlBVXK4o7TrvH4xZeYtITIV8dOjo=
=h5/U
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
