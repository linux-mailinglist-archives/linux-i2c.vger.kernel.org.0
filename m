Return-Path: <linux-i2c+bounces-14847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ECECE7183
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DD1E30329C6
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEDC320CDF;
	Mon, 29 Dec 2025 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="j39VqWGL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9E1320CA9;
	Mon, 29 Dec 2025 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019185; cv=none; b=XUZ3ST2qidURbTqLGQ48O4Tc/fCqZH3v30cPkznEu9BigPFhPNcYATrppXkFkcuiADX8cdjzi/5nIA0xm8tC2s98GJEvhsS77ylvHTU+o7MWGASkkLaTyAeaq5+RPT8qLNzpYgpUqMmnuXxUhYV1fwMsI41mY5WJl5buayTMeb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019185; c=relaxed/simple;
	bh=0JI6UDT8DA2r/KDubRKHa2QAHomU4k5Xb/WQkXUn8LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBLBkhv7JifnmsZ/ZGCMo2aFqPTn9xcef6Jhq/FfW7jrKUKsZmI+NBeTOJGyiD0DTYVB9DW12s6ZF/XKzBqToOpYnk6WBctJCpEX6ciYThdePh/b95XaKAQZp3wKpeKdeCCRmoyCZ61y3j5qHpsTWSntq6Ujpjt3RWuOxIVyyKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=j39VqWGL; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=GrYHcHnP6wftcFE2RuDhEbTzFwJI2LRIQv18lcOiPHM=; b=j39VqWGLn76xTD628aOXT/U3D9
	Mg85LIduMyYuCor5hbwHOgxNkI8d79FAhMAQyUtqsx+z2+MOvQhJWZi7Ty72AYTjmDO8gizDhVumM
	gBBxfynTeJLi9YVaQIl5ARzmjP/gGSHCEE0HTyuWx0cQtiyVvKEFCzcVrngEVtSUbXcsxKT05gm5S
	dj05HdZK41ZL7LKsVz3XaLRxRl1nkpGevfJjYi/yGM9iVBdhlgAnqABO8YN0LHFKwKSCzC9dj4DDu
	Eonhw2VcsGg3NqgOGL9GniibDOZlX5rrs1MfUWkSl191swBiRjxJqUod0vVOVkmjXn/R0CS6lMW2b
	y+PNbTYQ==;
Received: from [2a01:e34:ec5d:a742:6075:34ff:c68a:2cc7] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vaEPL-00000003LFG-3I9o;
	Mon, 29 Dec 2025 15:39:39 +0100
Date: Mon, 29 Dec 2025 15:39:39 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 1/2] i2c: spacemit: replace i2c_xfer_msg()
Message-ID: <aVKSqx6J4HHfnBNX@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-12-26 11:31, Troy Mitchell wrote:
> The upcoming PIO support requires a wait_pio_xfer() helper, which is
> invoked from xfer_msg().
> 
> Since wait_pio_xfer() depends on err_check(), move the definition of
> xfer_msg() after err_check() to avoid a forward declaration of
> err_check().
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 62 ++++++++++++++++++++++-----------------------
>  1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d42c03ef5db5984ea8e06b3d7eb485b4f899e616..accef6653b56bd3505770328af17e441fad613a7 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -304,37 +304,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>  	writel(val, i2c->base + SPACEMIT_ICR);
>  }
>  
> -static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> -{
> -	unsigned long time_left;
> -	struct i2c_msg *msg;
> -
> -	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> -		msg = &i2c->msgs[i2c->msg_idx];
> -		i2c->msg_buf = msg->buf;
> -		i2c->unprocessed = msg->len;
> -		i2c->status = 0;
> -
> -		reinit_completion(&i2c->complete);
> -
> -		spacemit_i2c_start(i2c);
> -
> -		time_left = wait_for_completion_timeout(&i2c->complete,
> -							i2c->adapt.timeout);
> -		if (!time_left) {
> -			dev_err(i2c->dev, "msg completion timeout\n");
> -			spacemit_i2c_conditionally_reset_bus(i2c);
> -			spacemit_i2c_reset(i2c);
> -			return -ETIMEDOUT;
> -		}
> -
> -		if (i2c->status & SPACEMIT_SR_ERR)
> -			return spacemit_i2c_handle_err(i2c);
> -	}
> -
> -	return 0;
> -}
> -
>  static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
>  {
>  	if (i2c->msg_idx != i2c->msg_num - 1)
> @@ -418,6 +387,37 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>  	complete(&i2c->complete);
>  }
>  
> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> +{
> +	unsigned long time_left;
> +	struct i2c_msg *msg;
> +
> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> +		msg = &i2c->msgs[i2c->msg_idx];
> +		i2c->msg_buf = msg->buf;
> +		i2c->unprocessed = msg->len;
> +		i2c->status = 0;
> +
> +		reinit_completion(&i2c->complete);
> +
> +		spacemit_i2c_start(i2c);
> +
> +		time_left = wait_for_completion_timeout(&i2c->complete,
> +							i2c->adapt.timeout);
> +		if (!time_left) {
> +			dev_err(i2c->dev, "msg completion timeout\n");
> +			spacemit_i2c_conditionally_reset_bus(i2c);
> +			spacemit_i2c_reset(i2c);
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (i2c->status & SPACEMIT_SR_ERR)
> +			return spacemit_i2c_handle_err(i2c);
> +	}
> +
> +	return 0;
> +}
> +
>  static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  {
>  	struct spacemit_i2c_dev *i2c = devid;

With the patch title updated as suggested:

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>


-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

