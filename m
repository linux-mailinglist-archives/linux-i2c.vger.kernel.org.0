Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F7B26DBAD
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgIQMgu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgIQMgJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:36:09 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BF0C06174A;
        Thu, 17 Sep 2020 05:35:49 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x14so1864282wrl.12;
        Thu, 17 Sep 2020 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zLJqbDwuehQ2Cscsi0Vgu4DaQNXgK8MdMyM08+54l6o=;
        b=EW7fwLGFFz06wWMfDjmNc0mTGIsD6om8dkMIOzMU7M+E6Ut7hiZBNVjztuD0+tq3hZ
         Hb4TdAg3atN+o2E2EmY5R7YiH6J4Sb2iLVU4AwCc07FGuYIoKDW1sN8AR4rNaQAMbvXu
         hqqZfT2YwsYNeabbMrvyxhQVSZpUCzryXER4NTh6nYKZi9IVKFygefy1ExXMRCXLAd+D
         YPh6glNOrmgtge+Ao6fwNBdYQQ67SAki8WoV9Qj0tfAJzQLDi/miovcCGjKHJWr1HQ4e
         MXL+xu8mOSSMLssjqbxAVWg7+WaGSxoHUrGuTD43piqbkPSrM9ab2cpMSjOlcTXek5m5
         +07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zLJqbDwuehQ2Cscsi0Vgu4DaQNXgK8MdMyM08+54l6o=;
        b=bVr/e9MTF1nO4M4JWaa5pIC0rCn7GIP6CJkNcwl7Mm4PkOvrO17VW5M1Tb0fBtfuQV
         0gHit0SE/jp/UtD1mXdapGJKosSlnlxIiRP5hipVQECLqMn9i8ExShGNXIvP1ZKNa+8G
         L54IgefLlw6rgjqsz1dV+vO7t1Z/lNmIs52vOlqaoO1U2HRUVLqaJCiCIF1bka7K7VA1
         JOb99y813xDEXUR2f5182F7DRB1A6KJqEUBdF38rglNSC5BNHlyGIUZnI5ti1XKSgaKv
         F/dHyRhdu/eOW3LR/axD7fzd6F+cqMBjKpAO/YGIuG36byRIOAEefpoTpqXveLrdemGR
         cYCQ==
X-Gm-Message-State: AOAM530HugGeJCHRRB8+CoVzZane9Qx9fQlHamyZNOxdKkDwSw30UFkp
        GJTFHFSHuWxCHZxUvFyhSUI=
X-Google-Smtp-Source: ABdhPJwhPRBJXgodadIR6kaG3OgAHsTPr/V4LesSUl0PyXGAeRviLrUJ48AP40kTx16xFsIu+v+1Kg==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr31305653wrn.209.1600346148156;
        Thu, 17 Sep 2020 05:35:48 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t4sm39125403wrr.26.2020.09.17.05.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:35:46 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:35:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 33/34] i2c: tegra: Clean up whitespaces, newlines and
 indentation
Message-ID: <20200917123544.GL3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-34-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tKh+x8PS77aidDsl"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-34-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tKh+x8PS77aidDsl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:40:05AM +0300, Dmitry Osipenko wrote:
> Some places in the code are missing newlines or have unnecessary
> whitespaces and newlines. This creates inconsistency of the code and
> hurts readability. This patch removes the unnecessary and adds necessary
> whitespaces / newlines, clears indentation of the code.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 72 +++++++++++++++++++++-------------
>  1 file changed, 45 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 31fbc6181dd5..087f98010963 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -314,6 +314,7 @@ static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i=
2c_dev, u32 reg)
>  		reg +=3D (reg >=3D I2C_TX_FIFO) ? 0x10 : 0x40;
>  	else if (i2c_dev->is_vi)
>  		reg =3D 0xc00 + (reg << 2);
> +
>  	return reg;
>  }
> =20
> @@ -373,9 +374,12 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev=
 *i2c_dev, size_t len)
>  	struct dma_chan *chan;
> =20
>  	dev_dbg(i2c_dev->dev, "starting DMA for length: %zu\n", len);
> +
>  	reinit_completion(&i2c_dev->dma_complete);
> +
>  	dir =3D i2c_dev->msg_read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
>  	chan =3D i2c_dev->msg_read ? i2c_dev->rx_dma_chan : i2c_dev->tx_dma_cha=
n;
> +
>  	dma_desc =3D dmaengine_prep_slave_single(chan, i2c_dev->dma_phys,
>  					       len, dir, DMA_PREP_INTERRUPT |
>  					       DMA_CTRL_ACK);
> @@ -387,8 +391,10 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev=
 *i2c_dev, size_t len)
> =20
>  	dma_desc->callback =3D tegra_i2c_dma_complete;
>  	dma_desc->callback_param =3D i2c_dev;
> +
>  	dmaengine_submit(dma_desc);
>  	dma_async_issue_pending(chan);
> +
>  	return 0;
>  }
> =20
> @@ -455,6 +461,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i=
2c_dev)
> =20
>  	i2c_dev->dma_buf =3D dma_buf;
>  	i2c_dev->dma_phys =3D dma_phys;
> +
>  	return 0;
> =20
>  err_out:
> @@ -557,6 +564,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev=
 *i2c_dev)
>  		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
>  		return err;
>  	}
> +
>  	return 0;
>  }
> =20
> @@ -650,8 +658,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_d=
ev)
>  	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
>  		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
> =20
> -	clk_multiplier  =3D tlow + thigh + 2;
> -	clk_multiplier *=3D non_hs_mode + 1;
> +	clk_multiplier =3D (tlow + thigh + 2) * (non_hs_mode + 1);
> =20
>  	err =3D clk_set_rate(i2c_dev->div_clk,
>  			   i2c_dev->bus_clk_rate * clk_multiplier);
> @@ -799,9 +806,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_de=
v *i2c_dev)
>  		 */
>  		buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO_WORD;
>  		tx_fifo_avail -=3D words_to_transfer;
> +
>  		i2c_dev->msg_buf_remaining =3D buf_remaining;
> -		i2c_dev->msg_buf =3D buf +
> -			words_to_transfer * BYTES_PER_FIFO_WORD;
> +		i2c_dev->msg_buf =3D buf + words_to_transfer * BYTES_PER_FIFO_WORD;
> =20
>  		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
> =20
> @@ -914,12 +921,18 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev=
_id)
>  	goto done;
>  err:
>  	/* mask all interrupts on error */
> -	tegra_i2c_mask_irq(i2c_dev, I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST |
> -		I2C_INT_PACKET_XFER_COMPLETE | I2C_INT_TX_FIFO_DATA_REQ |
> -		I2C_INT_RX_FIFO_DATA_REQ);
> +	tegra_i2c_mask_irq(i2c_dev,
> +			   I2C_INT_NO_ACK |
> +			   I2C_INT_ARBITRATION_LOST |
> +			   I2C_INT_PACKET_XFER_COMPLETE |
> +			   I2C_INT_TX_FIFO_DATA_REQ |
> +			   I2C_INT_RX_FIFO_DATA_REQ);

This now seems inconsistent with the choice in other places in this
driver where we wrap only when necessary. I think it would be more
consistent to align the subsequent lines with the parameters on the
first line. Or alternatively assign to a local variable and pass that to
tegra_i2c_mask_irq().

But the above is fine with me as well:

Acked-by: Thierry Reding <treding@nvidia.com>

--tKh+x8PS77aidDsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jWCAACgkQ3SOs138+
s6GCVA//W79A190+2W0uOxIWxiaJNbyANhmZG2Rr+NCnOzkfux/K9moch6/uLB/P
THZASmuNRenBWhZ+/e8lRkZhXwpeUVSD8y8VxLGnVhxaOhKo0C1RdyY6l6gglLbD
mF0B+glwz2NHyXdZhtGcAGswu/cW0glRzqtehiEqb9J98N9dgroiafzmYr/zc2Ip
q4Zp0kAM/l+AIEFfUMmrTZ8nfX2vd5+rz8kYHwsKYjvL85yCAad4XV1vzrK47P6T
Iwy4auCx6Rr2+Fh8TImMTU9LcfEOltTHT8/4jl4PLcV5QxA6qvriW1pymUqlyJLG
EYxo4ezVN+Sf8CexT4rPM90AHtNKH5ToLHtcvgV6vT73OBqtSEA6/t48heGIQF24
/i5Lo2kVgtmuYugd7F55Ws/xfGWZi31wHvE9c1NAvpU3FeaYFFoZydRALtcLNDRQ
AOOpvdhjvbVJC6n7I2xJcJcUCPJhYVLdRUBKbdJlWYCgZSG5u4hVB/x41SLdI6rq
sb1xRI23wBwx09WVmT0vBVFxx57Pz0AZsyfBt4ZVTwzt1rdY0OW/hvKpPSor2T7m
Ow+VRunI7I3MBMOdtocY2H2948AqA6+iag9CEGeKgQo2iIiMGVslmojLX2fLD++i
RtakINWoV7rxPjsWqVXt73OKRzMpDFoUtWHj9aWg/b9U2L899e8=
=yIYF
-----END PGP SIGNATURE-----

--tKh+x8PS77aidDsl--
