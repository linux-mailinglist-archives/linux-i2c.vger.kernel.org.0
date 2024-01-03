Return-Path: <linux-i2c+bounces-1091-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D4D8234C8
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 19:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF90D1F24094
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 18:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009521CA86;
	Wed,  3 Jan 2024 18:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYYT4QfT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B031CA83
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jan 2024 18:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B532EC433C9;
	Wed,  3 Jan 2024 18:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704307548;
	bh=o19/5tXsN961QLyGdluAzMHHIPCywKQ9gfWZ5JHVD1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jYYT4QfTOxqB5na7r4MMY5OkuEZZZyxxBsMMIL9lus23TZqPX/R/mhDluu2Y1LGOV
	 vLmv3WpiHL3YVkm+nLYfRZPMH9NHPGqUTJbosOn24/s1BabYfZPn6DMAr9U3AXMjlz
	 ARuUGilW2BI1057oTA3yff3qVN2I4nTiLOjkJXXFImoRj83vIXDlwEZNO3NqN5hgUF
	 uHoQ2nBFPFUSyueIWgKjjCKa0xW+sxY8iF7D51EYwLniaT7cCCxQSNifgLaFS26LGy
	 0EJCgahTlFmmfCPZfGUSTo9PBvDMIhciIgPlKv0kb6s1jetolS+V+DFUCX03GbFJGu
	 KZMYbD/0dL6Hw==
Date: Wed, 3 Jan 2024 19:45:44 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 5/8] i2c: wmt: rename with prefix VIAI2C_ and viai2c_
Message-ID: <20240103184544.7mugspjz7cyhn7jk@zenone.zhora.eu>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <65b930cefd380ce45e0e1b3967bc7f51737b0948.1703830854.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65b930cefd380ce45e0e1b3967bc7f51737b0948.1703830854.git.hanshu-oc@zhaoxin.com>

Hi Hans,

On Fri, Dec 29, 2023 at 02:30:36PM +0800, Hans Hu wrote:
> Since the I2C IP of both wmt and zhaoxin come from VIA.
> So, rename common register, function and variable's name
> to VIAI2C_ and viai2c_.

this commit is not really clear. Can we write something like:

"The I2C IP for both wmt and zhaoxin originates from VIA. Rename
common registers, functions, and variable names to follow the
VIAI2C_ and viai2c_ naming conventions for consistency and
clarity."

> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

[...]

> -#define WMTI2C_REG_CR		0x00
> -#define WMTI2C_CR_TX_NEXT_ACK		0x0000
> -#define WMTI2C_CR_ENABLE		0x0001
> -#define WMTI2C_CR_TX_NEXT_NO_ACK	0x0002
> -#define WMTI2C_CR_TX_END		0x0004
> -#define WMTI2C_CR_CPU_RDY		0x0008
> +#define VIAI2C_REG_CR		0x00
> +#define VIAI2C_CR_ENABLE		BIT(0)
> +#define VIAI2C_CR_RX_END		BIT(1)
> +#define VIAI2C_CR_TX_END		BIT(2)
> +#define VIAI2C_CR_CPU_RDY		BIT(3)
> +#define VIAI2C_CR_END_MASK		GENMASK(2, 1)
>  
>  /* REG_TCR Bit fields */
> -#define WMTI2C_REG_TCR		0x02
> -#define WMTI2C_TCR_STANDARD_MODE	0x0000
> -#define WMTI2C_TCR_MASTER_WRITE		0x0000
> -#define WMTI2C_TCR_HS_MODE		0x2000
> -#define WMTI2C_TCR_MASTER_READ		0x4000
> -#define WMTI2C_TCR_FAST_MODE		0x8000
> -#define WMTI2C_TCR_SLAVE_ADDR_MASK	0x007F
> +#define VIAI2C_REG_TCR		0x02
> +#define VIAI2C_TCR_MASTER_WRITE		0x0000
> +#define VIAI2C_TCR_HS_MODE		BIT(13)
> +#define VIAI2C_TCR_MASTER_READ		BIT(14)
> +#define VIAI2C_TCR_FAST			BIT(15)
> +#define VIAI2C_TCR_SLAVE_ADDR_MASK	GENMASK(6, 0)
>  
>  /* REG_CSR Bit fields */
> -#define WMTI2C_REG_CSR		0x04
> -#define WMTI2C_CSR_RCV_NOT_ACK		0x0001
> -#define WMTI2C_CSR_RCV_ACK_MASK		0x0001
> -#define WMTI2C_CSR_READY_MASK		0x0002
> +#define VIAI2C_REG_CSR		0x04
> +#define VIAI2C_CSR_RCV_NOT_ACK		BIT(0)
> +#define VIAI2C_CSR_RCV_ACK_MASK		BIT(0)
> +#define VIAI2C_CSR_READY_MASK		BIT(1)
>  
>  /* REG_ISR Bit fields */
> -#define WMTI2C_REG_ISR		0x06
> -#define WMTI2C_ISR_NACK_ADDR		0x0001
> -#define WMTI2C_ISR_BYTE_END		0x0002
> -#define WMTI2C_ISR_SCL_TIMEOUT		0x0004
> -#define WMTI2C_ISR_WRITE_ALL		0x0007
> +#define VIAI2C_REG_ISR		0x06
> +#define VIAI2C_ISR_NACK_ADDR		BIT(0)
> +#define VIAI2C_ISR_BYTE_END		BIT(1)
> +#define VIAI2C_ISR_SCL_TIMEOUT		BIT(2)
> +#define VIAI2C_ISR_MASK_ALL		GENMASK(2, 0)
>  
>  /* REG_IMR Bit fields */
> -#define WMTI2C_REG_IMR		0x08
> -#define WMTI2C_IMR_ENABLE_ALL		0x0007
> +#define VIAI2C_REG_IMR		0x08
> +#define VIAI2C_IMR_BYTE			BIT(1)
> +#define VIAI2C_IMR_ENABLE_ALL		GENMASK(2, 0)
>  
> -#define WMTI2C_REG_CDR		0x0A
> -#define WMTI2C_REG_TR		0x0C
> -#define WMTI2C_REG_MCR		0x0E
> +#define VIAI2C_REG_CDR		0x0A
> +#define VIAI2C_REG_TR		0x0C
> +#define VIAI2C_REG_MCR		0x0E

These defines have been changed twice in this series. The patches
should be rearranged in order to avoid this.

I Wolfram is not against, I'm OK with letting it slip this time.

> -struct wmt_i2c {
> +struct viai2c {
>  	struct i2c_adapter	adapter;
>  	struct completion	complete;
>  	struct device		*dev;
> @@ -60,7 +60,7 @@ struct wmt_i2c {
>  	u16			cmd_status;
>  };
>  
> -int wmt_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
> -int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c **pi2c);
> +int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
> +int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c);
>  
>  #endif
> diff --git a/drivers/i2c/busses/i2c-wmt-plt.c b/drivers/i2c/busses/i2c-wmt-plt.c
> index e0ffccf8a40a..8f506888cff7 100644
> --- a/drivers/i2c/busses/i2c-wmt-plt.c
> +++ b/drivers/i2c/busses/i2c-wmt-plt.c
> @@ -22,13 +22,15 @@
>  #define WMTI2C_MCR_APB_96M		7
>  #define WMTI2C_MCR_APB_166M		12
>  
> +#define wmt_i2c				viai2c

no, please, do not redefine types. Besides This looks a bit
dangerous and reckless to me :-)

Andi

