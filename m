Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C47F606565
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Oct 2022 18:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiJTQIF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Oct 2022 12:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbiJTQIE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Oct 2022 12:08:04 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AABD5B138;
        Thu, 20 Oct 2022 09:08:03 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id r17so613428eja.7;
        Thu, 20 Oct 2022 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T65DqKigBMa2EwCWHwffhhgOHHqLTCucg7U0i2a4bTo=;
        b=E6MU75+hZorij3sdEzcLyjHYZ6a4W8Vc1lBoveGbGzfz8e9Yvkd5/8w6360EkNWmnf
         la3st60PNsqvB0W+xBuzcEuAXul7uwIdO7DiqddrWPQ/VgeThoKMDDURSSCPdlmCaNwO
         WCpyF7E/RkDpdgqVTjMTPTP5nmS6KUar6ilz72vP0q4wpmHeeMrShJnlrgz8jLJklXiP
         lmk6GQ8JGifX4u/JTrkBlknZNyuwSMFY8kW3odhYicVEqJGbTmXgva4DWVOFSEUl71je
         4CwRN/iSbI6ROLG6BWXqDK82yRZ4n+elef5dcT+Sf+m4lvttq9g5li3tS79a1heAdTHi
         CoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T65DqKigBMa2EwCWHwffhhgOHHqLTCucg7U0i2a4bTo=;
        b=GQ83ifqtbn2PfQf/LZjW2K6jhDXTXY2S4wIHni0qJ49/9Khxu4qal0kBJ7lqYh2bd+
         LtSw1o7Haz0qehDTL1CBYV01sxNijzUzC2d5TiGprpv7hq7UR7otFERSzgt9HPAcd/ot
         bjxkN1v47Z+uFM2LE0r/L4DKNMXZq3U+42eHqxFDtLEVIBlN3fzcmHyxlkUFelH6H/ty
         s69abi6DEm0JOJb8iItqSYPjpgExiqsTci4LMTgyhPL6nlMBnrCGYFjVjTHocymfv54j
         v7tQT8cQ6kKeNUarcFjjZpU1Ay4GkawwEQKkMa2FQ1/Xae0MDUgbm6A/AxU8Rvp+iGAe
         YKcQ==
X-Gm-Message-State: ACrzQf1lIE26GdI4tgCCSf4kXwgGXz2Q2tJnHac3lx1V/gmTpMMDgUWQ
        RObLuCHmOdIkKNPA3HA+XB3s3oaZIaw=
X-Google-Smtp-Source: AMsMyM44mDU6qjEAuLGu1JV/I+ZhHeJ5LkVcSsn17ZRCDz6gx+QB5wuQjh5Np3G+3Y8BDIJ/2Cqw7Q==
X-Received: by 2002:a17:906:7193:b0:78d:b87e:6aa5 with SMTP id h19-20020a170906719300b0078db87e6aa5mr11669488ejk.580.1666282081709;
        Thu, 20 Oct 2022 09:08:01 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id fe7-20020a056402390700b004587c2b5048sm12274247edb.52.2022.10.20.09.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 09:08:00 -0700 (PDT)
Date:   Thu, 20 Oct 2022 18:07:58 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Allocate DMA memory for DMA engine
Message-ID: <Y1FyXuEzcxIMRKlT@orome>
References: <20221020143933.1951609-1-thierry.reding@gmail.com>
 <b258387c-365e-e18d-7b7c-e38105786193@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jLeJhy2w5AJvp9VT"
Content-Disposition: inline
In-Reply-To: <b258387c-365e-e18d-7b7c-e38105786193@arm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jLeJhy2w5AJvp9VT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 04:14:20PM +0100, Robin Murphy wrote:
> On 2022-10-20 15:39, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > When the I2C controllers are running in DMA mode, it is the DMA engine
> > that performs the memory accesses rather than the I2C controller. Pass
> > the DMA engine's struct device pointer to the DMA API to make sure the
> > correct DMA operations are used.
> >=20
> > This fixes an issue where the DMA engine's SMMU stream ID needs to be
> > misleadingly set for the I2C controllers in device tree.
> >=20
> > Suggested-by: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/i2c/busses/i2c-tegra.c | 16 ++++++++++------
> >   1 file changed, 10 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
> > index 954022c04cc4..3869c258a529 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -284,6 +284,7 @@ struct tegra_i2c_dev {
> >   	struct dma_chan *tx_dma_chan;
> >   	struct dma_chan *rx_dma_chan;
> >   	unsigned int dma_buf_size;
> > +	struct device *dma_dev;
> >   	dma_addr_t dma_phys;
> >   	void *dma_buf;
> > @@ -420,7 +421,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_de=
v *i2c_dev, size_t len)
> >   static void tegra_i2c_release_dma(struct tegra_i2c_dev *i2c_dev)
> >   {
> >   	if (i2c_dev->dma_buf) {
> > -		dma_free_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
> > +		dma_free_coherent(i2c_dev->dma_dev, i2c_dev->dma_buf_size,
> >   				  i2c_dev->dma_buf, i2c_dev->dma_phys);
> >   		i2c_dev->dma_buf =3D NULL;
> >   	}
> > @@ -472,10 +473,13 @@ static int tegra_i2c_init_dma(struct tegra_i2c_de=
v *i2c_dev)
> >   	i2c_dev->tx_dma_chan =3D chan;
> > +	WARN_ON(i2c_dev->tx_dma_chan->device !=3D i2c_dev->rx_dma_chan->devic=
e);
> > +	i2c_dev->dma_dev =3D chan->device->dev;
> > +
> >   	i2c_dev->dma_buf_size =3D i2c_dev->hw->quirks->max_write_len +
> >   				I2C_PACKET_HEADER_SIZE;
> > -	dma_buf =3D dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
> > +	dma_buf =3D dma_alloc_coherent(i2c_dev->dma_dev, i2c_dev->dma_buf_siz=
e,
> >   				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
> >   	if (!dma_buf) {
> >   		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
>=20
> That much is definitely better, but as mentioned previously all the syncs
> below look completely bogus either way, so should really be removed rather
> than "fixed". If it's necessary to ensure ordering of CPU accesses to the
> buffer relative to the DMA transfer itself, where that isn't already
> implicit in some readl()/writel() involved in starting and stopping the D=
MA
> channel, then dma_wmb()/dma_rmb() are the tools for that job.

Yes, I've had those comments in the back of my mind and wanted to get
this out separately because this is needed to redress an issue that
we've introduced in the DT files for these devices, where now all I2C
controllers are sorted into the same IOMMU group as the DMA controller,
which doesn't make any sense as they are not themselves performing any
DMA accesses. I'll look at the synchronization bits next.

I suspect that you're right about the sync calls all being redundant. If
dma_alloc_coherent() memory is always guaranteed to be uncached (unless
perhaps if dma-coherent is specified for the DMA device), then I don't
see why they should be needed.

Thierry

>=20
> Thanks,
> Robin.
>=20
> > @@ -1272,7 +1276,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
> >   	if (i2c_dev->dma_mode) {
> >   		if (i2c_dev->msg_read) {
> > -			dma_sync_single_for_device(i2c_dev->dev,
> > +			dma_sync_single_for_device(i2c_dev->dma_dev,
> >   						   i2c_dev->dma_phys,
> >   						   xfer_size, DMA_FROM_DEVICE);
> > @@ -1280,7 +1284,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
> >   			if (err)
> >   				return err;
> >   		} else {
> > -			dma_sync_single_for_cpu(i2c_dev->dev,
> > +			dma_sync_single_for_cpu(i2c_dev->dma_dev,
> >   						i2c_dev->dma_phys,
> >   						xfer_size, DMA_TO_DEVICE);
> >   		}
> > @@ -1293,7 +1297,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
> >   			memcpy(i2c_dev->dma_buf + I2C_PACKET_HEADER_SIZE,
> >   			       msg->buf, msg->len);
> > -			dma_sync_single_for_device(i2c_dev->dev,
> > +			dma_sync_single_for_device(i2c_dev->dma_dev,
> >   						   i2c_dev->dma_phys,
> >   						   xfer_size, DMA_TO_DEVICE);
> > @@ -1344,7 +1348,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
> >   		}
> >   		if (i2c_dev->msg_read && i2c_dev->msg_err =3D=3D I2C_ERR_NONE) {
> > -			dma_sync_single_for_cpu(i2c_dev->dev,
> > +			dma_sync_single_for_cpu(i2c_dev->dma_dev,
> >   						i2c_dev->dma_phys,
> >   						xfer_size, DMA_FROM_DEVICE);

--jLeJhy2w5AJvp9VT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNRclwACgkQ3SOs138+
s6GAyxAAiG+gYMGs/9uXjk5atznXKVKXvtDN1SwQDbtDJ64PH2+EGd0dCEh+Flmp
PecLlYj6kobdJO1QqP8cZ+A1bBcb7rZoWPqsFCAH8HrEo2vxayWV0ZYUkCNz71/c
np3BpZj70fFqvRFCcW2XNG4IkFWiA3WTWCAWKvLeANi5XTKV5u0vob+tcXLwIbHq
wuvo6v6haiQfJOty+WywtWqQWZV1Qglo4Gq6NzYplciSpi7oagtTzfpp08QuG14s
XSq/Fw9RIsi7pYjAUhlgznv5GMShk05I/tqzcyCby4LL2xLbtDyKFoy32vqivB6B
WtJ+3mcduNV0WiYYuceO7h+cYzw4ZNqa9IeCHFNIYKKRbkLzfraLJUCtoWQZu/MS
f27XTNAELop0t7sxcdkwed5Z3B13YW7yem4IrCplUmitKmnw+LLewtlZgJJ8VmTk
HuRSMcAcePdY8lDBFwY81uN+fwZiKv2uc4VQMAfpXymnJSzfvrvGE54NPhcf10WX
nDpG4vYX0l/9ljKcNIL4mSOaCu+CQ7BF3XiugcosiUgnPfQpLox0a2FxI4Jk96i/
9NqsQQlfaVdAe4krrwwdRTy2xx5dfDDuQzikNjP5iZhFUtZbPor8NrOLlYoCzLPm
luT9KTAhHv0CbShCMPJaZH+xo6Y3u9ZA4Cr5jxSQWIbWYLfx+/E=
=9wP+
-----END PGP SIGNATURE-----

--jLeJhy2w5AJvp9VT--
