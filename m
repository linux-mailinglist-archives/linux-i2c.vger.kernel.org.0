Return-Path: <linux-i2c+bounces-11771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32229AF5F40
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ABEC3AA6AD
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 16:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A0E301122;
	Wed,  2 Jul 2025 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRdRrBd4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442B02F3C36;
	Wed,  2 Jul 2025 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751475426; cv=none; b=ZrMTrxD8++KEXORP//VxxImc8H8L7/Bx2wlZLRScpiztGZWBaiwcMefE8hIED0OUIzip9szVc5JY3HVohWqcvUna3BzLBqfVjYxJ5279r8eUupDzyXdr4ZflpgR5GbUjFIhW0oC8CUqPVw28/JGsjfEmWQfemtuhOo1TlcU607s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751475426; c=relaxed/simple;
	bh=ocNwR/XXz0H6vYXtxoEREo6XhUYrxZeTqCH9xLXk4Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lozq8+czG9jALCWu010UBMMdDPh49f2gRDei9g/K5UDKhzH+VJhmuRzNiUGLKe71Av5ZOooXxWyf8R9WYbOJafRtKynwbcXjPmdB3Z2cd93+ljTpoYnbGebC36VXmgo55zhnOJ2cjTccSdcHeWyMfpg7pyc0IjaaftpETpOAJQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRdRrBd4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1317FC4CEEF;
	Wed,  2 Jul 2025 16:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751475425;
	bh=ocNwR/XXz0H6vYXtxoEREo6XhUYrxZeTqCH9xLXk4Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRdRrBd4rqlB8P6ErGgt4dvwpJ1u94yU+jWyu49x4SA6gFJNM0mkK6DqYNPhRr2cx
	 ASDxNstDubarmmecPdK72Xh7hjJPR7qRiDFqkILrbugZJAitqUdPhke+aIfhnm/oPj
	 teu1773om9O6m6zKuBi0N2Cw7YHP0vtecXbXdaS0PtKUg+na4X229xfbyfv2rhQsJm
	 stZy47lY2torkY8GlO5HjTfcWb2uIi08rf39WN2ywlh5BFuSnIwrG7TAhSQZtWrJC4
	 RnVJ+LRovqcXfETHgEkNAFhWgnih5HrjuobsWNkhaISKTZFqlA6XMHBxFGsD5IgHpd
	 zwtUHA+TAL1YA==
Date: Wed, 2 Jul 2025 18:57:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
	linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 1/3] i2c: stm32: fix the device used for the DMA map
Message-ID: <n4mx3xukr5zffajpwomuwp27fywmogm6nmv7hgkcwpghjaorwv@2mqmgg3u5far>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>

Hi Clement,

...

> @@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>  	dma->dma_len = len;
>  	chan_dev = dma->chan_using->device->dev;
>  
> -	dma->dma_buf = dma_map_single(chan_dev, buf, dma->dma_len,
> +	dma->dma_buf = dma_map_single(dev, buf, dma->dma_len,
>  				      dma->dma_data_dir);
>  	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
			      ^^^^^^^^

this one should be "dev" too, which renders the chan_dev variable
unused.

Thanks,
Andi

>  		dev_err(dev, "DMA mapping failed\n");

