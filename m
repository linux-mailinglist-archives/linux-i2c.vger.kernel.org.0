Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2819026DA1B
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgIQLZ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgIQLZs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:25:48 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F564C061756;
        Thu, 17 Sep 2020 04:25:45 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id m6so1678816wrn.0;
        Thu, 17 Sep 2020 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n7mBa3+CaabyaqB7OhdCT9CLExpPusdRJluP0asp0D0=;
        b=Ogm/0uscGeh7KAqkm/ldWNn0FW/9aagq7DisuImZNRkAK9HzRblbPJlWYGnmISFJH2
         7HO+HlI3U6+xrL5eA2p8OlGNsh16X93j0kXa29nDk3itm7lQK2hVxKFTYBm+85aWXyE/
         ZPxooKr1DdVC8+d+gdnZWTkGsvBuqPFJ5BI06Vv4/JBCUfGmfmA9+dywjd9axOeWm0Yt
         JI83xwNTdbZTGKHIipqYsaOdGzWunRHPZintkX9omNFWAiLk9LJ2i6y4+vLVar7ViGhC
         Gcnxuin6xACClSWHsSuzGbl+kHARpcCQujCLXOXdvGPkOJVq9iID6xnaM4nQxWZnLUZC
         gTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n7mBa3+CaabyaqB7OhdCT9CLExpPusdRJluP0asp0D0=;
        b=n+B/4eLW+HQOVzFhV2cR2xYeVz9VgznKw31jr8zDcbCVyIs9xy2kTfj5UZXZR67/Mb
         AhgJoQ3WnnbXJUnpVKQ4pwYn9glX+0UA0Mb31vyuaWRnaI9XHqIrfZE45CoNt+hY38th
         UKVZjl/MyZrrqATAXimJhEeKhyJjhYAEadonorvjwLE9mO0N8veP+MlwyMfno6I6TBlT
         V1oBNsJ9bpMQ0u+oMNB9HmB3wMz1Qq6WaRwYVnbkB6YQ0CVJjWskZuot1+6Wh37IIHiu
         Ae8GKqdB4WkDVo8otGAUO7WxVQqlCUXT9I5J0AGEC2wHI6sC3YfKixyZX2CzpSiTvwoA
         /z9Q==
X-Gm-Message-State: AOAM533eM8nuTSH74C4Yh9n9VjHJcfDKhjmt1Xk9od1or1j6mq8EAZkW
        3MAeTJU6keEZ4/tkAUhiNYU=
X-Google-Smtp-Source: ABdhPJxEQ66hE6LXyYUreo4HvpzmU/v+VrDmSoavPcLF8vPs0JdHc6p/NdXzSaOvChNf2cuFhoXS/g==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr30563305wru.133.1600341944228;
        Thu, 17 Sep 2020 04:25:44 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id x16sm37547473wrq.62.2020.09.17.04.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:25:43 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:25:41 +0200
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
Message-ID: <20200917112541.GR3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gMqNd2jlyJQcupG/"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-7-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gMqNd2jlyJQcupG/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:38AM +0300, Dmitry Osipenko wrote:
> The "non_hs_mode" divisor value is fixed, thus there is no need to have
> the variable i2c_dev.clk_divisor_non_hs_mode struct member. Let's remove
> it and move the mode selection into tegra_i2c_init() where it can be
> united with the timing selection.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 720a75439e91..85ed0e02d48c 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -250,7 +250,6 @@ struct tegra_i2c_hw_feature {
>   * @msg_buf_remaining: size of unsent data in the message buffer
>   * @msg_read: identifies read transfers
>   * @bus_clk_rate: current I2C bus clock rate
> - * @clk_divisor_non_hs_mode: clock divider for non-high-speed modes
>   * @is_multimaster_mode: track if I2C controller is in multi-master mode
>   * @tx_dma_chan: DMA transmit channel
>   * @rx_dma_chan: DMA receive channel
> @@ -281,7 +280,6 @@ struct tegra_i2c_dev {
>  	size_t msg_buf_remaining;
>  	int msg_read;
>  	u32 bus_clk_rate;
> -	u16 clk_divisor_non_hs_mode;
>  	bool is_multimaster_mode;
>  	struct dma_chan *tx_dma_chan;
>  	struct dma_chan *rx_dma_chan;
> @@ -783,6 +781,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_d=
ev)
>  	u32 val;
>  	int err;
>  	u32 clk_divisor, clk_multiplier;
> +	u32 non_hs_mode;
>  	u32 tsu_thd;
>  	u8 tlow, thigh;
> =20
> @@ -805,24 +804,33 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c=
_dev)
>  	if (i2c_dev->is_vi)
>  		tegra_i2c_vi_init(i2c_dev);
> =20
> -	/* Make sure clock divisor programmed correctly */
> -	clk_divisor =3D FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
> -				 i2c_dev->hw->clk_divisor_hs_mode) |
> -		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE,
> -				 i2c_dev->clk_divisor_non_hs_mode);
> -	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
> -
> -	if (i2c_dev->bus_clk_rate > I2C_MAX_STANDARD_MODE_FREQ &&
> -	    i2c_dev->bus_clk_rate <=3D I2C_MAX_FAST_MODE_PLUS_FREQ) {
> +	switch (i2c_dev->bus_clk_rate) {
> +	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:

Is there are particular reason for switching the simple conditional to a
switch here? The old variant looks much easier to understand to me.

Thierry

--gMqNd2jlyJQcupG/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jR7UACgkQ3SOs138+
s6EJmw//f5VTJ9VKqV7qgDBw5KqPdBxP4vgDU7q1b0NNHgCiXE3+4v3pwldNLP2i
g/thiKML1GPBWcZImlVHvlWOzXt6KScIH8NuXpx4hXZW5vJPbCVjuk9LSDZUfJDg
ue9apmnUvTsnVwdn/D8KR8RpcPk3psHysIaUWaJCN306bhIIMeo9UutHsCOhukST
bgXbDnGmkAuEYf56wh2MHIe1NdqPXXE3TJxjYVbGNX0ZEhEE8UbeRNpL0oSIAmqG
8jtkjXxKxilmdG23woleqf/3FpSt78uREv0N8Zt3nADlHcFa7OhqZ56muFDoM/y0
hS2ho8hFa5AAcAEiANbxmMec6qz5n3MMyK/f9BYLZsOKryuEmKKzFnCkHbM3MERX
Zu2328AjtA7hpYxHA2PYchunbV3FCWOrCn5CsgEZhUnxBjYjnGi0yNST1VrIsES7
wqRQ1LIVT7DR63eRaaHfpqhLR59/p3dkF0Dk93k+BaYKLqUZRD50yCrTgKg1Hwrm
3fsJASIGJStLmZXVYzL+B3+I1hEmfv5QkiKcYJ4KKlFZ7FVEccRbtITdKv/jMv1N
k9mHp75h7g8Q7m/WwrPojbSkzdhYZxmHjMPcitB9qCUUdo1n+OuFZJDsl0Y2Q5oS
x2+GxSlY1lr3MvDpdiolWdJ5eyvwgsjvG3XILl7G0jhXFrxwsUY=
=nRmr
-----END PGP SIGNATURE-----

--gMqNd2jlyJQcupG/--
