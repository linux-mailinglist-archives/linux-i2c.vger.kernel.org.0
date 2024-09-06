Return-Path: <linux-i2c+bounces-6320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBFD96F705
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 16:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 160711F257E1
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 14:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14551D1732;
	Fri,  6 Sep 2024 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ro3NCSWs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CXht1XFP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A7C1CEAC9;
	Fri,  6 Sep 2024 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725633395; cv=none; b=JkMr/5LZRNNpLg1/WMv+Scaz6qhRBoiQKDSkzYvvJHB6Luh8u2aeDwNCW3znOLcIgp829c5d36MMZgo/cOOPeYPkyxs22ZifLoaYAg4VoloPZnNYrcp9V+aRoTffHShlT1ZdNhdV5JE0MtuLh1ZV+mgBpA7ffex4+PRcN+wjjSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725633395; c=relaxed/simple;
	bh=Nx1U+UZGy8KapZRzAqUmGm0UfNYUr1sfn5+hoZ3BP/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D+8ASxL6K92cNVIhBn33N/AlRHTmoKJqUWeOuhjPjYNQY4hBHxdlrqEClmwz8XoU9XFMHaakJIPzxsiQM7zDPPuP0qsfKPUQAoz7m5J7ihcd/7ebnnxStBjT0Jt+S2VhjTnLaJmpjS5QxiWFaw6D+vlrt5iZOKrjMF3MSI1v4uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ro3NCSWs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CXht1XFP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725633390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqDf1IFSPRmnkLeOOfhEN8R37Qr25b+7q7Psmj+CwGs=;
	b=Ro3NCSWstn0jOxZcaRvYcg3L1VjimheJTVlYRpu+pc35F2wAleirXJvFX1XRCEVaWtexjH
	HsilswSBvDFMSfniuHepAkMlKP6+oCtt65o9fTHnQ0QV6bTBSmPrx4GR4JU7OGrYNdjY0v
	yN1xybwLEjqDqBdlX/wv0tyvd9FZnt4fEEYtgX6wOi+uO0jffhf1oremGkKk/Eptt8sWtv
	dvUnnQUn0XUkkwfFOgFCnB7Pe23NRr+kXCNPYuNxuCdPj9JyTCkgaFXb07tDvxQTbPIvgv
	3Rb93VyOK9xl4y0pVE9krunDg+Me8U4Dx4mflWFbg5qzpGH22fOmk1jae9jAyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725633390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqDf1IFSPRmnkLeOOfhEN8R37Qr25b+7q7Psmj+CwGs=;
	b=CXht1XFPbcJsT6gCiTVJ3lnKlbCr7Kq+A4vcTy4KxP5X2zZrR00B+mIC9apOTF6PNbVS6X
	JC3lEIVhq3N4Y/CA==
To: Ma Ke <make24@iscas.ac.cn>, jochen@scram.de, andi.shyti@kernel.org,
 grant.likely@linaro.org, thierry.reding@gmail.com, rob.herring@calxeda.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ma Ke <make24@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH] of/irq: handle irq_of_parse_and_map() errors
In-Reply-To: <20240830142127.3446406-1-make24@iscas.ac.cn>
References: <20240830142127.3446406-1-make24@iscas.ac.cn>
Date: Fri, 06 Sep 2024 16:36:30 +0200
Message-ID: <87bk10etn5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 30 2024 at 22:21, Ma Ke wrote:
> Zero and negative number is not a valid IRQ for in-kernel code and the
> irq_of_parse_and_map() function returns zero on error.  So this check for
> valid IRQs should only accept values > 0.

The subsystem prefix is wrong. This changes drivers/i2c/busses/i2c-cpm.c
and has nothing to do with of/irq. Sure, the problem has been caused
by the commit below, but that's a different thing.

> Cc: stable@vger.kernel.org
> Fixes: f7578496a671 ("of/irq: Use irq_of_parse_and_map()")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/i2c/busses/i2c-cpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> index 4794ec066eb0..41e3c95c0ef7 100644
> --- a/drivers/i2c/busses/i2c-cpm.c
> +++ b/drivers/i2c/busses/i2c-cpm.c
> @@ -435,7 +435,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
>  	init_waitqueue_head(&cpm->i2c_wait);
>  
>  	cpm->irq = irq_of_parse_and_map(ofdev->dev.of_node, 0);
> -	if (!cpm->irq)
> +	if (cpm->irq <= 0)
>  		return -EINVAL;

The function _cannot return a negative number:

extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);

So what is this actually fixing?

Thanks,

        tglx

