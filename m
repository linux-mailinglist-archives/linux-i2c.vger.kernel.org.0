Return-Path: <linux-i2c+bounces-14805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF6CE58B8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 00:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D537730087BC
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Dec 2025 23:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F3F29D281;
	Sun, 28 Dec 2025 23:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="T/mZusvd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA772874FE
	for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 23:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766964267; cv=none; b=jpUa0UdwHsRfu5QM0K4WyeT5BReevJP1h9zgU9V7DWKznw1ghrVT49SQU5wMotlUXkraI82eXinz6DRJFpPJUNtdAAddpauvSNcNO5lBWiQPtgBwobbBXJ0TwxGmq02b9ijlslrvhm+95sMj53yN6Ucl44zrhYxJVCKDj/za9mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766964267; c=relaxed/simple;
	bh=OyujpZZsgmaCODovITjtJcQsqNER1AQhipqOJMTC0eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OuzaHcT9GE4AFLchL9vXWFpByNNvddO+gR548Flz2IGCu1kbnurZjCjkLVCY7jfvCX8RpY+GcZM/mq42Ogspaa3ex9K116BTUPaLmEHG1kOefZjo2mC4QDykmR2dbFNPB06AMwi5ntz5RaG76q/YGKxAiJSNcfFIxBWBpc+bFog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=T/mZusvd; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4f8a6b37b2dso6564681cf.0
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 15:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766964265; x=1767569065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xydt6mikMK7J/ACpt60zKlMdVmmHvuDTKG/LIZvEl0Q=;
        b=T/mZusvdlHaSdU/UttSOWuMIAuVPthwF0kC44rgUujKr21pGaX/s8sDAp2T8+WXprU
         dVCW0sSR2SEXA4K6YLmdgosw1v/b+XUriOMrDo9Ndx12hfV7GdA7gPAswSdbW8t9wMfi
         8LLUmTWY1bFwUyLzNIf+HeN+JHnfGzUqL57PkRy6TnTeyc+J+T686/8xKy6UygQ6rzv2
         8vZyEVRjscCPeUrz5hhWNIyELKD9c2qZZ/X/0eTRF9quumXZ5qWH5wexJaYB38wA7HRi
         dbOo3CdRIwKt8+YoM+99skUEiQE83TyD5eI5P1JBir8f1+ExJynGg1XWGPqM6y4S+Es2
         2Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766964265; x=1767569065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xydt6mikMK7J/ACpt60zKlMdVmmHvuDTKG/LIZvEl0Q=;
        b=noIao7qarrnbIYrHKVzYQ5RC05qHW5KA60O8CiI0BB96ok7jhiCfppqNmXxRnoz8w/
         //LmhqepN1ts7oZKAwkih0NvrGadr2RmKM/eAPT2Go8vf2BCPK836/6HZZ4EP9xEE3XY
         Z9+AnyUhQbsjNC+DKy0yxbgxtwQJUTmEFB6Q+e0Dle4EnPRQ2tW/Ven4Pxi4No5uuouB
         GCWIza+1+xJU1dZHldZZTuHp5N9g11B1W4fP2XeFTzRZ6UXg8xHLmIZ/XKHCX152yFfc
         GnvPciAWiNQ7Md+L/rEF9/48umd56UP3kDktbFDABE/fKcrH60L05vL7LXaq0ZnCHAiz
         1zZQ==
X-Gm-Message-State: AOJu0YwXE+XAcv+E8azuC/yEvsCQXNbNIvQ3Q006bIWYdS5RfXlRRcBw
	SAv0l6deEpg02hr1lZf5tRtrHKAaKFC+ntgYM/8Io/O8pJtOzX4OuXLp8uEJxBv1v+U=
X-Gm-Gg: AY/fxX5vDx2je5/m8sPMxdT3sVvitbiRW/H6QudKdstYsXekUFiUBRkZY38aynl9lBY
	aHfthzvExc3oc1HNkwrQ5BgtOcIQvkRRNFOAMR1Cp2A0hWRS+TPgqF4eIVLenks6H+MKsz8dIy4
	RP/BpoLVLIUJvqaHiXpv9pnY67CMsGH2ALFjyalmoPgzUE8hkbNogUMBalv5G1+8cZA2j2IKFc4
	dCbow7nT0O+vOAM2/WBYNCizL4wdcE09Io3TThgSLlgRFGN5RlSLhEBzuRks95sTgo22v5Ps7pj
	rHvGVgDKSuHWgw/lTYYk51dsGPUD/pJJ/2mu5J8gBokNVdcQM4vdx++70t6iLhdgxgCKGM+L7Ls
	HLM3B3XbpAb+xDO0U5KNg9LbD8qUGX0vpCR40DlbsA6NS/y8mo8MktiwXvXgipHJvTpM/AJesmt
	k6Kq4TD0JGWFYKYb5KPxTUjExV1XR5GW90HFNrL18qTJvwyolPvqQ=
X-Google-Smtp-Source: AGHT+IFxndCaQ3g5mQEld9CJ+Zg2xTQQHo+r3w56Ps2u11p4W4wTawdR8ANKUOQfAZjJSvAqZ/++TQ==
X-Received: by 2002:a05:622a:7502:b0:4f4:df23:ab5d with SMTP id d75a77b69052e-4f4e39243a4mr169416911cf.75.1766964264478;
        Sun, 28 Dec 2025 15:24:24 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac64c011sm207819451cf.25.2025.12.28.15.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 15:24:24 -0800 (PST)
Message-ID: <bb6665f2-e4c5-455c-b6d0-9acf41aa9e30@riscstar.com>
Date: Sun, 28 Dec 2025 17:24:22 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] i2c: spacemit: replace i2c_xfer_msg()
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/25 9:31 PM, Troy Mitchell wrote:
> The upcoming PIO support requires a wait_pio_xfer() helper, which is
> invoked from xfer_msg().
> 
> Since wait_pio_xfer() depends on err_check(), move the definition of
> xfer_msg() after err_check() to avoid a forward declaration of
> err_check().
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Other than fixing "replace" with "move" as Andi mentioned,
this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/i2c/busses/i2c-k1.c | 62 ++++++++++++++++++++++-----------------------
>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d42c03ef5db5984ea8e06b3d7eb485b4f899e616..accef6653b56bd3505770328af17e441fad613a7 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -304,37 +304,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>   	writel(val, i2c->base + SPACEMIT_ICR);
>   }
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
>   static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
>   {
>   	if (i2c->msg_idx != i2c->msg_num - 1)
> @@ -418,6 +387,37 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>   	complete(&i2c->complete);
>   }
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
>   static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>   {
>   	struct spacemit_i2c_dev *i2c = devid;
> 


