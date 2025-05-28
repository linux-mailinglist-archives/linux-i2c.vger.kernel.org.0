Return-Path: <linux-i2c+bounces-11149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 546E4AC62B5
	for <lists+linux-i2c@lfdr.de>; Wed, 28 May 2025 09:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA3B73A5873
	for <lists+linux-i2c@lfdr.de>; Wed, 28 May 2025 07:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E9724395C;
	Wed, 28 May 2025 07:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ls50IZf6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57EAEEB2;
	Wed, 28 May 2025 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416441; cv=none; b=ZndKYbyytIfOLkxDJ5gwsK89BRp9XK1D3etVg7SVdH86xDjn4LmyC8YHrvM7gcOJV7s/wGov3hM1+ctlRUbxI5pa9eaO9/0m8d/mq0UER4zh7wP6iIueh3nQBmc2rdX0nQ/hkvP2Lvf4hI5KgklVpeQyJ1ysRM3/sIZTQRZFkN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416441; c=relaxed/simple;
	bh=NA01JuBV6s2RqUnPspO8lP68OW1tJ4ZIkKhFb8sGOqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aS8GXvV9PlMFFMHmrF3Mu8Iaggdgkts0AkyCeLbrjYEgeJ8bpHzLrFXwrxjS+pOgtsEl2lIs2+PQVOwQsf2kJpGR+/xjpR8iC2AQNYe91y+nYACRoA/hKyCaJdDYqYeUEI5pkJBub8Y9F5SEI+Bh+cMq4oxQw4MSp7qZSFKv7uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ls50IZf6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-441ab63a415so49193415e9.3;
        Wed, 28 May 2025 00:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748416438; x=1749021238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8z38qczvZbxO76S2l6qCCFYCsTxTOPBbrJdkHVddxqs=;
        b=ls50IZf6S7gTgjssKkwT3+X5ZAiWo14FeesTM7XU1h8G1A3Fargr41caUganQNjEK8
         WNTr6/rdldGhncgm935lFvGrz8aJB1OPHvAEjsAFmZodeS7Z8y2W5b2dfUk6B/tRMhq3
         w1x/OznO6chKWaD1k1sUBo8yhzfTqzPeXSGT1SrEEW9qXdOFRTmCBqSaF+Wg9Lim30tV
         FDkwWAnrRH7iGZdtNyTnLj2XgHujCZXyW05M942G59DADeYBIpN0cac//VibNXpreo2V
         bt9XooJdQ3VxhebVUmS78F/+ztDa1jHsizHaacLsoN7ExGTVQVelx2Q5C8I6u1WygOkr
         7G8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748416438; x=1749021238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z38qczvZbxO76S2l6qCCFYCsTxTOPBbrJdkHVddxqs=;
        b=Be5XxqE7KY3DCYvrlnjJuyUXi+c53xUFlcAExSfKGC+DHQlzC4BjhWVXa9rQ0oyZmd
         XUCEBtL1q+1BcozmofMtoT/8r39Qlyjx07B0/zp7bk319a6FE5W3JgO1lxqSMCAPcPm0
         3DLHM9Fiv+GhGPt906vPSEn7dwVdyXe9Hj0dAUn9CaifGf5i9AYNYRWBgfgawJhsCLAa
         7yMldfwMbxDPqndhDSq8zgaZ90cawEAkrj1s2n+3St+nqF6+sf51A9f59xInYRYyFphc
         EpmWPW4/C0wHu220SPoZxF1h3/upF6csS2stdAkcnpCWGmUpUkiUbk71psxNhwQaeVpC
         6zUw==
X-Forwarded-Encrypted: i=1; AJvYcCUohqPlwLTnHU8P/Asf9wHo9Fe7FsCBjdt/0O4McNu0rgihEQjql46+JBSPih9WunnPOng50Qh0N3sdo7ri@vger.kernel.org, AJvYcCX0MopLLSf53HrMokp3xrGnNJuFoSBzUv5emdjIs2t/48/Bg1oGXmIF/NUQ4/Hd0Mz3SuZRcvsDtlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlUdMZx3xMbHscqSu8ipRpurPFB68SQ3sYU8MdbW9VUOycSCHw
	mL7EaqoeAHz75ZnVHeFfU9OfbSlqJFxXdd1+il2mmfPeW1FpISlhuU4XqN+d6Dgp
X-Gm-Gg: ASbGncuanzINB3JxqPWkM29+gjmSIuyxo2dNgtoRiZFNngFducXi8eP9oWQYWyNs2z9
	IU92osj3ScZOz71raswon6JY1c7s3Al0lBo+Il35JIDQA97wR/cvCzRU0xPLMkEk8yDsFVqot7g
	EQuWi8LOeoap9TzI1nNSXY13GNfivYQZJ7+E0O8w+vNacviYhSiWQEXW3ASFg96+gzF6fwa1d5+
	qadGDxMjs9CCNCbBbOUvoIhGVAwc6N6UVcQkpZr2wzPmqjhIaqGQZTmHMmcCKCtCvPaM6ogUdoJ
	tcZeAbaLupE8u38wZZTXkcMNYgeB1uYqs9dDaQEqa0K/j3E/jt0=
X-Google-Smtp-Source: AGHT+IFUeDV6q6xaB+r06fKVdY1G8cH/8XvdGuTg+xFtJRhZxSlobft7u22w3aTFnbPx2ZJc7hHSZg==
X-Received: by 2002:a05:600c:4ed0:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-44c91ad6b5cmr121816275e9.5.1748416437876;
        Wed, 28 May 2025 00:13:57 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:a46c:90a2:a3c0:b012])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4500e1ddaeesm11501665e9.35.2025.05.28.00.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 00:13:57 -0700 (PDT)
Date: Wed, 28 May 2025 09:13:55 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	stefan.eichenberger@toradex.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:FREESCALE IMX I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de
Subject: Re: [PATCH] i2c: imx: fix emulated smbus block read
Message-ID: <aDa3s2TR-GvPmF3z@eichest-laptop>
References: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>

Hi Lukasz,

On Tue, May 20, 2025 at 02:22:52PM +0200, Lukasz Kucharczyk wrote:
> Acknowledge the byte count submitted by the target.
> When I2C_SMBUS_BLOCK_DATA read operation is executed by
> i2c_smbus_xfer_emulated(), the length of the second (read) message is set
> to 1. Length of the block is supposed to be obtained from the target by the
> underlying bus driver.
> The i2c_imx_isr_read() function should emit the acknowledge on i2c bus
> after reading the first byte (i.e., byte count) while processing such
> message (as defined in Section 6.5.7 of System Management Bus
> Specification [1]). Without this acknowledge, the target does not submit
> subsequent bytes and the controller only reads 0xff's.
> 
> In addition, store the length of block data obtained from the target in
> the buffer provided by i2c_smbus_xfer_emulated() - otherwise the first
> byte of actual data is erroneously interpreted as length of the data
> block.
> 
> [1] https://smbus.org/specs/SMBus_3_3_20240512.pdf
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Signed-off-by: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ee0d25b498cb..4bf550a3b98d 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1008,7 +1008,7 @@ static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
>  	/* setup bus to read data */
>  	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  	temp &= ~I2CR_MTX;
> -	if (i2c_imx->msg->len - 1)
> +	if ((i2c_imx->msg->len - 1) || (i2c_imx->msg->flags & I2C_M_RECV_LEN))
>  		temp &= ~I2CR_TXAK;
>  
>  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> @@ -1063,6 +1063,7 @@ static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_im
>  		wake_up(&i2c_imx->queue);
>  	}
>  	i2c_imx->msg->len += len;
> +	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
>  }
>  
>  static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)

This makes sense, we never tested the actual SMBus emulation. Thanks a lot for the fix.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>

