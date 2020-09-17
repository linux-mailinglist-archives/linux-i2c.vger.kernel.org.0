Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E54626DB50
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgIQMRs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgIQMRl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:17:41 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5CEC06174A;
        Thu, 17 Sep 2020 05:16:43 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e16so1835623wrm.2;
        Thu, 17 Sep 2020 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i0cO/atr56p3A85zV6WQmzIk6b31734E5bUWMJSETmI=;
        b=ZRgediSCZsMc7TZgHN+vSTSW6RZ8SIXUE29LEPGpX3c4lVmEIcqG6okSQbnVd0jfdX
         Ab8hy+KEIWVtafsRY3ergewJ5mGJf/NJiS9vFWO7q/jn0wHYnX0KZQXjP6hTz8jDGCLD
         gHgWIyiR6O8LxjyF8XVbGZ4yGSfxoStt3BoVQtFrueep4s88uS7Oy8pk6+iak2aqOE+x
         au2PWnkNb95D+L5Khb2YVwa4LJXgaUnh6yiAbc9HMhu4cPiZnuKirWMoBPlBvYF5XK8c
         8ks0Js87SE7BWOV/KYkHBSkk0s7Eh4BLMHBRfQfrNW4LuMXkDT6SlsZy9S4TR7fxyx5r
         nRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i0cO/atr56p3A85zV6WQmzIk6b31734E5bUWMJSETmI=;
        b=V32CXhaS1wij/z5SZ7SySulp4N244IfrAv3Y6Suzv40Tem7uIWL0qwQYjuRqY9dWqR
         PrdRU45JcAq6NOcZOeT/8J6VOq+pPdZBL8xadjOJyZ9GlM06CUxn+0bmpfGkLPt1C3y0
         78ufJV8bkBpkiPnW01RHnuyKoiDLxgOyLpb66/b0DANzWKufx3pdfgJJrZ6ly0054ByD
         cD6knPta7uwNLLjKtz0wXWNiocBG3uoBn3qSCNLtMlskbyLCnL12UUAJYUyuV0koEWyp
         r/zJx3LmrHxPjr3hglnqeOxuveOCyy8LKX+CsqGfoahOX0wkgVet1DnEmgihegBOZMLk
         a2bA==
X-Gm-Message-State: AOAM530ay3fe3Q8Q9N4FZBsNj8ca11hbPqNJ0I6sLLvng+eThtMqcUFZ
        NLyOn6bbmyArZlEOSo1NK3s=
X-Google-Smtp-Source: ABdhPJxD+xcAn3G77ka20hWynIDxK1jKG8Ny8fh0ELbkF6od/YdA84uD8WZCLOMYfVhCtAn2sBvIAw==
X-Received: by 2002:adf:e488:: with SMTP id i8mr33941004wrm.116.1600345002630;
        Thu, 17 Sep 2020 05:16:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i11sm39047492wre.32.2020.09.17.05.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:16:41 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:16:40 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 29/34] i2c: tegra: Improve formatting of variables
Message-ID: <20200917121640.GH3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-30-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+E165xXSMiO4rFaE"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-30-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+E165xXSMiO4rFaE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:40:01AM +0300, Dmitry Osipenko wrote:
> Reorder definition of variables in the code to have them sorted by length
> and grouped logically, also replace "unsigned long" with "u32". Do this in
> order to make code easier to read.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 97 ++++++++++++++++------------------
>  1 file changed, 45 insertions(+), 52 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index ac40c87f1c21..2376f502d299 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -259,42 +259,48 @@ struct tegra_i2c_hw_feature {
>   */
>  struct tegra_i2c_dev {
>  	struct device *dev;
> -	const struct tegra_i2c_hw_feature *hw;
>  	struct i2c_adapter adapter;
> -	struct clk *div_clk;
> -	struct clk_bulk_data *clocks;
> -	unsigned int nclocks;
> +
> +	const struct tegra_i2c_hw_feature *hw;
>  	struct reset_control *rst;
> -	void __iomem *base;
> -	phys_addr_t base_phys;
>  	unsigned int cont_id;
>  	unsigned int irq;
> -	bool is_dvc;
> -	bool is_vi;
> +
> +	phys_addr_t base_phys;
> +	void __iomem *base;
> +
> +	struct clk_bulk_data *clocks;
> +	unsigned int nclocks;
> +
> +	struct clk *div_clk;
> +	u32 bus_clk_rate;
> +
>  	struct completion msg_complete;
> +	size_t msg_buf_remaining;
>  	int msg_err;
>  	u8 *msg_buf;
> -	size_t msg_buf_remaining;
> -	bool msg_read;
> -	u32 bus_clk_rate;
> -	bool is_multimaster_mode;
> +
> +	struct completion dma_complete;
>  	struct dma_chan *tx_dma_chan;
>  	struct dma_chan *rx_dma_chan;
> +	unsigned int dma_buf_size;
>  	dma_addr_t dma_phys;
>  	u32 *dma_buf;
> -	unsigned int dma_buf_size;
> -	bool is_curr_dma_xfer;
> -	struct completion dma_complete;
> +
> +	bool is_multimaster_mode;
>  	bool is_curr_atomic_xfer;
> +	bool is_curr_dma_xfer;
> +	bool msg_read;
> +	bool is_dvc;
> +	bool is_vi;
>  };
> =20
> -static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
> -		       unsigned long reg)
> +static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, u32 reg)

I actually prefer unsigned long/int over u32 for offsets because it
makes it clearer that this is not in fact a 32-bit value that we're
writing into a register. This is especially true for these register
accessors where the "offset" is called "reg" and may be easily
mistaken for a register value.

Thierry

--+E165xXSMiO4rFaE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jU6gACgkQ3SOs138+
s6Gt4w//eQTYuWVJf9AGLpSfI2NEwi8LwUZVYc3MP1NkbsWWs5+feDeRyWJ52ucy
Cf/2aoF8erQDZflPM/JXe3hdPEw5xkIVwg6KrLiYqZyU2W2exwuamxmuwIvo9P+G
7QHpfWvxMvMgADqNvVrHrTXFbxP1jTXSTLccmKa+8dYyw1rRNPaI3pF/6/rwEMbm
T6JI/Y/e3L21y9O4L8UuWfFcZk50sXYdcKh2ya2cdjcsI0UW45YiN6VdKclUvTcM
jvI0in5lgTPhHO555UQ+1rvkp/+lmu8+sTmkdnuyXBqIT44SYp7kYWdb5ZXbgklz
SxUxtFrlAJjlfWJunxbG7Lm48H/09NqVg2mwphCg7ixUL/DAm1qszmCj5DWOR2XU
HjDd2ENyXlgefuXLB5InIAVGTCdGhOjo+1IiYPFgE4mUjxaT0901797Au5+OMBg3
0i6I8p17gUkLeDm1fHusAf53KN/vcWHrWRyklv5Ki8S57c5Xjbu4eYD1iBy8qcGn
Iqp/BMjwgx8m3xR2OJSBZYCWi/GAN5kFb5qJVNHkkSUUSr2ThWVphw64Jqm+ERSB
J/EyBtrMd40oyepjfV52FCqY3sa4gxS9L6TtI8y35+D4YhIfkxGvuhGixoLrYlZV
IfIzQbPwvZ2E6+Yqq3o7fSQMlJt9VSNA1rwq1KpblT3D85jf6h8=
=2HC5
-----END PGP SIGNATURE-----

--+E165xXSMiO4rFaE--
