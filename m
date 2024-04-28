Return-Path: <linux-i2c+bounces-3268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9797D8B499B
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 06:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 536CA281DFC
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 04:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7D5A23;
	Sun, 28 Apr 2024 04:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="dtBw+nzb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A153F8BF9;
	Sun, 28 Apr 2024 04:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.110.109.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714279148; cv=none; b=XECACJn9cbPbGJSj3GZ7zIwPAKwMmhVTuNAtlDPnKF3BEdqj5eYK/JkY5f97AnhZbHoFLYCrAaHwY0bn6wunwKRv6Xa8Aj3DYbbqhtIWAOyYqxDtvDkRnKDqLjCNes4Ntvydka8JxtQj82C7+7rMcbGV7h8khX9c1UNPnphGSKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714279148; c=relaxed/simple;
	bh=giGSOh0yZ6SkerlyT8081TSZgFdl+fSuhiMJkcK3yEA=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=ettTM8SDByJ3RhNendHxGUQhe99qUfVGHA8Bmw61kTYWC1dOZ3CPYvOt12Y9OU204FfsmPqeTn1T1s9p7llUsdml0/qLLhs5SCZhILCeTQd+qgHT/lEytXf8Oi1bwPAYhc5MdK3lgZYqMX0WolKgSX3aM7/0GzN+quvooTuEjOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=dtBw+nzb; arc=none smtp.client-ip=84.110.109.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 18C2E4402B5;
	Sun, 28 Apr 2024 07:38:39 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1714279119;
	bh=giGSOh0yZ6SkerlyT8081TSZgFdl+fSuhiMJkcK3yEA=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=dtBw+nzbBW/SPrP3jdj8JLTvfbDR1shk0ID14OjUgR6ZPFOfp8L9GNK7ngjk+UHRh
	 qrPj1effwEV39fvkPWFv1tKU3NEHO+R3Snv5/9oXUOx8+LeDTNLSqybLfJ8E8GyFF1
	 MLtCbu+qCPiQSRt0o1oUITQZArubOkwFm3J5rIiayhRJvhcfJ3Hg9+H11EJv8boboM
	 82CAamc8CjprveDVKieQXW/b/yMKZpUP8lYh8xLuxhHchIHDCRM7wyLfFIk9DXclbf
	 QLoKQLvk12uGOSHmVPl9OQp+IBRMyLl7rsSMWHkKdt4BVTSVa56d8ltKmMbi1a8RT1
	 3qrDVAl+uf26Q==
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
 <20240427203611.3750-3-wsa+renesas@sang-engineering.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Baruch Siach <baruch@tkos.co.il>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/15] i2c: digicolor: use 'time_left' variable with
 wait_for_completion_timeout()
Date: Sun, 28 Apr 2024 07:38:00 +0300
In-reply-to: <20240427203611.3750-3-wsa+renesas@sang-engineering.com>
Message-ID: <87il02cd9a.fsf@tarshish>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Wolfram,

On Sat, Apr 27 2024, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
>
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
>
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  drivers/i2c/busses/i2c-digicolor.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
> index 3462f2bc0fa8..737604ae11fc 100644
> --- a/drivers/i2c/busses/i2c-digicolor.c
> +++ b/drivers/i2c/busses/i2c-digicolor.c
> @@ -213,7 +213,7 @@ static irqreturn_t dc_i2c_irq(int irq, void *dev_id)
>  static int dc_i2c_xfer_msg(struct dc_i2c *i2c, struct i2c_msg *msg, int first,
>  			   int last)
>  {
> -	unsigned long timeout = msecs_to_jiffies(TIMEOUT_MS);
> +	unsigned long time_left = msecs_to_jiffies(TIMEOUT_MS);
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&i2c->lock, flags);
> @@ -227,9 +227,9 @@ static int dc_i2c_xfer_msg(struct dc_i2c *i2c, struct i2c_msg *msg, int first,
>  	dc_i2c_start_msg(i2c, first);
>  	spin_unlock_irqrestore(&i2c->lock, flags);
>  
> -	timeout = wait_for_completion_timeout(&i2c->done, timeout);
> +	time_left = wait_for_completion_timeout(&i2c->done, time_left);
>  	dc_i2c_set_irq(i2c, 0);
> -	if (timeout == 0) {
> +	if (time_left == 0) {
>  		i2c->state = STATE_IDLE;
>  		return -ETIMEDOUT;
>  	}


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

