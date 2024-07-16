Return-Path: <linux-i2c+bounces-4999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0F932A13
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 17:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B67B1C23F9F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 15:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1991E19EEA4;
	Tue, 16 Jul 2024 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgmP60eD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252B619EEB5;
	Tue, 16 Jul 2024 15:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721142334; cv=none; b=FCmmTWVgFusEiTNU/qxXsiYMlAecweAkt2gINaBkjsextQ7mv5DAPvTE0527zStlCfBRzzBBixMjOnHojbd/Yb0CfelITasKw22fe/F9LdX34AAomXtJI3fcoUo+suOH+vT+hQyL9FU1kcU1AOTz73CLMr25/a8UxmPASxKemeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721142334; c=relaxed/simple;
	bh=cprunrzR2Vx52GohB9P9vzAt1SjTpPE0piOrxfNcg2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyssK8W47sSZ/pArTjTmESmdh4IauluLcgAXna7JNiKnAAqsld+DI006GktVIB+1c/Vu7bZB9mgF3PzT6AcibAIva+VRTo0exRyaGPqQjz/wi6/QNg+h4ybpnQnuKpX/Vmzs2DMX2lwsnVn805C1M/CGNtJBpjR9at8GxlW0PAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgmP60eD; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a77b60cafecso663056866b.1;
        Tue, 16 Jul 2024 08:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721142331; x=1721747131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oIsP9WfA0TMZUezHpRe4LD3xeHG2Pnug2FDZg/pF9jA=;
        b=lgmP60eDc5wTrUBuxpjOlKEvggdxrKafQwoT+G0kVFcsxwNphSBPsNKWEtP9unNf9q
         7rcnGRB1LWlv8K380RvXyD0YtAIEE7W/oyee0dnx52KQn9K5CcgvKId1HqXylwi/lKdR
         jEwe73eTbLj4Ma7ZtrL0wgIndm2E/Zey1w5/B2QceI8YRpztNwnzo2n5OG0K3qg4hhYF
         yZevMzjX8r/JgBqSPgVzoI8uA1Ut1RImyg8XVObZwfUgEY9W1beYfJDZa4taU+g05R/6
         uhhPXYZqR/+uY+5vQjwx7qSPBvYZREDv6JEtY637QZQx2amD4PbVyFmVQTkrBJ9auY2J
         T3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721142331; x=1721747131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIsP9WfA0TMZUezHpRe4LD3xeHG2Pnug2FDZg/pF9jA=;
        b=Klw3/wG2bKD27BrK+n3vISNW6RB+tqBV12hzjuRxTg/8/FjXyIahG6GdBBWv9RbWaw
         Tp3lybs44ozleJdG2rQQzxSAF70szshUIgv+tU07mWWA3sI/T8DifHqd9R0tQi2kAnjE
         qoJjbUCBN3Be3iUTeCLlGcJ0GmKo9wxK5F8JnI7Of0rEMkmPFOakNg7+rq06NIjbdapu
         0WsaCzyjK0xtIxaXzfVh7ml9TTUEz+EeHwnI+eTEfjjq7bYDm9pCh+sIqxZp3soY8AMl
         7Kecrc1irN2HsFjXdPca1080BFeyHKIA5lj//zJIh6sQgn9bcXHa/RyFUT8Ry9isQcan
         9KIA==
X-Forwarded-Encrypted: i=1; AJvYcCU2/UPvf4tymsTb2WYda6iJQ/uCt7GunkKeft6ZTBaXB8JwkBUdk11g8pIknfMe2D71vdVIrSJbSXiTqpBrbuhQMRtG5oadzzKmGepyEERGWly3GGPVhOiKdeGd1IMCYWfD5IPPLBcf
X-Gm-Message-State: AOJu0YwvIxYfTLkrQsjdCj9DKZNM1NyMXXBm5eo7h8tnhf4QGvui3gz/
	lYOy57jjZD0tYSZyHqQDdpoPEpp6b54XGnkDEcv8kfRgi0D8Rao/8Yqxh7I7
X-Google-Smtp-Source: AGHT+IHu17WSkuVX0jxOAWCJadIe0O6dlHEv4dokYnccOiyPeH2LoXogdOhBgimTWYiWMAXlMX5fnw==
X-Received: by 2002:a17:907:dac:b0:a77:e0ed:8b9 with SMTP id a640c23a62f3a-a79ea3dfc64mr274375466b.6.1721142330957;
        Tue, 16 Jul 2024 08:05:30 -0700 (PDT)
Received: from eichest-laptop ([77.109.188.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7f1e04sm328378066b.127.2024.07.16.08.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 08:05:30 -0700 (PDT)
Date: Tue, 16 Jul 2024 17:05:28 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	wsa+renesas@sang-engineering.com, francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 3/3] i2c: imx: prevent rescheduling in non dma mode
Message-ID: <ZpaMOHhs1uDPAuKe@eichest-laptop>
References: <20240715151824.90033-1-eichest@gmail.com>
 <20240715151824.90033-4-eichest@gmail.com>
 <ZpVWXlR6j2i0ZtVQ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpVWXlR6j2i0ZtVQ@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Jul 15, 2024 at 01:03:26PM -0400, Frank Li wrote:
> > +static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
> > +{
> > +	unsigned int temp;
> > +
> > +	if ((i2c_imx->msg->len - 1) == i2c_imx->msg_buf_idx) {
> > +		if (i2c_imx->is_lastmsg) {
> > +			/*
> > +			 * It must generate STOP before read I2DR to prevent
> > +			 * controller from generating another clock cycle
> > +			 */
> > +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +			if (!(temp & I2CR_MSTA))
> > +				i2c_imx->stopped =  1;
> > +			temp &= ~(I2CR_MSTA | I2CR_MTX);
> > +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > +		} else {
> > +			/*
> > +			 * For i2c master receiver repeat restart operation like:
> > +			 * read -> repeat MSTA -> read/write
> > +			 * The controller must set MTX before read the last byte in
> > +			 * the first read operation, otherwise the first read cost
> > +			 * one extra clock cycle.
> > +			 */
> > +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +			temp |= I2CR_MTX;
> > +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > +		}
> > +	} else if (i2c_imx->msg_buf_idx == (i2c_imx->msg->len - 2)) {
> > +		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +		temp |= I2CR_TXAK;
> > +		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > +	}
> > +
> > +	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> 
> Why not use loop to read all data from FIFO? I think read_reg use readb(),
> suggest change to readb_relaxed(). The similar case for writeb. dma_engine
> will use writel() at least once when start DMA. it should be enough for
> memory barrier. 
> 
> Because it move to irq handle, writex__relaxed() will help reduce some
> register access time.
> 

I think there is not FIFO on the i.MX I2C controller, or do I miss
something? In the i.MX 8M Plus reference manual they write for example:
> In Master Receive mode, reading the data register allows a read to occur
> and initiates the next byte to be received.

I will test the changes with readb_relaxed() and writeb_relaxed() and
see what happens, thanks a lot for the hint.

Regards,
Stefan

