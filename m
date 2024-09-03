Return-Path: <linux-i2c+bounces-6055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E17496A4E6
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 18:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C917E1C23BE2
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 16:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F65418BC19;
	Tue,  3 Sep 2024 16:56:46 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD4E17A90F;
	Tue,  3 Sep 2024 16:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725382606; cv=none; b=CH16yAGkRewze/Ws2dnnKnbkOJq8kYyLi5OmJA/dYVzzwZhRxaDRp/ovGmncF6CPyW3Db80pTN6+2DHfcyUViZGRGiky7TY/0Xp/vaYK5X3YFLg3W758XDzfAhOi/xSKr5bwWKsTFpuFjqxFYzSS8gM8v355gQhr1dK7DQwBKdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725382606; c=relaxed/simple;
	bh=rKkYRwFcgoQMTnREOmP35/mtE44/WeGdXpoaxJyIHhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDGc+I/AY41w3Rjg98hzmL4snUXSJOmgrY0lIvxj2IPU/FrEwuueaGjKyWcd1XcpM1UmCyv/dDzeaXrm4lnOi/fci3Z+hfUJXGl7lO0UR3dy/f9vXssSa8g0KSEnQ4a9v7MV0cIsRq3zwRN+8EsTnN52hxEop0PZYAzyZYosCFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WysGf22nGz9sSH;
	Tue,  3 Sep 2024 18:56:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzJmN4SzLcUB; Tue,  3 Sep 2024 18:56:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WysGf1FZ7z9sSC;
	Tue,  3 Sep 2024 18:56:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A00F8B778;
	Tue,  3 Sep 2024 18:56:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1Eunu3JRLihx; Tue,  3 Sep 2024 18:56:42 +0200 (CEST)
Received: from [192.168.234.228] (unknown [192.168.234.228])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C6338B774;
	Tue,  3 Sep 2024 18:56:41 +0200 (CEST)
Message-ID: <90924209-888d-4ff3-8f60-f82a073bcf1c@csgroup.eu>
Date: Tue, 3 Sep 2024 18:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of/irq: handle irq_of_parse_and_map() errors
To: Ma Ke <make24@iscas.ac.cn>, jochen@scram.de, andi.shyti@kernel.org,
 grant.likely@linaro.org, thierry.reding@gmail.com, rob.herring@calxeda.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240830142127.3446406-1-make24@iscas.ac.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240830142127.3446406-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 30/08/2024 à 16:21, Ma Ke a écrit :
> Zero and negative number is not a valid IRQ for in-kernel code and the
> irq_of_parse_and_map() function returns zero on error.  So this check for
> valid IRQs should only accept values > 0.

unsigned int irq_of_parse_and_map(struct device_node *node, int index);

I can't see how an 'unsigned int' can be negative.

Christophe

> 
> Cc: stable@vger.kernel.org
> Fixes: f7578496a671 ("of/irq: Use irq_of_parse_and_map()")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>   drivers/i2c/busses/i2c-cpm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> index 4794ec066eb0..41e3c95c0ef7 100644
> --- a/drivers/i2c/busses/i2c-cpm.c
> +++ b/drivers/i2c/busses/i2c-cpm.c
> @@ -435,7 +435,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
>   	init_waitqueue_head(&cpm->i2c_wait);
>   
>   	cpm->irq = irq_of_parse_and_map(ofdev->dev.of_node, 0);
> -	if (!cpm->irq)
> +	if (cpm->irq <= 0)
>   		return -EINVAL;
>   
>   	/* Install interrupt handler. */

