Return-Path: <linux-i2c+bounces-14503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE9FCB4FDD
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 08:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1DD030081B0
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 07:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F642BFC8F;
	Thu, 11 Dec 2025 07:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CVGj2JFS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC81A9F90
	for <linux-i2c@vger.kernel.org>; Thu, 11 Dec 2025 07:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765438543; cv=none; b=iWtTsAhm61Kyb7s4AvSYV0MtGVJ2As7/upHzj2hWeXVq04Li4S+2aGMhuSVJ6k1VXUzQaLzqzel3zw5Fy4xSGx052lvJaJho2R3CW1ETc7gOJT20z9P2FHKbN3R12O/6pQxf3C2UFyKXtlT7/s0sJKbl5/f9mvOepgu39GFMYEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765438543; c=relaxed/simple;
	bh=D9L3NlYN0YqGBEdLUPdxfdpbeolFXHZmFSSeiZG1E+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeO9lNMXs4aZKDVldd1I5CwfT750o90F4AUsTPFwGRFzXAGA0lP7sejWhMt12cyBM16kwWYl0Yi+qFTJnDBbs9ava5pwn+2XZOS+6385zVK6N7uOo4RedkTCvoSmPK+anLC/JCBn0rTNeu3eXOmhFtzGmXdzYihuZQ+UxZPgR2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CVGj2JFS; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso569061a91.2
        for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 23:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765438541; x=1766043341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cRIyUToWBqfDVg5RwgWa/mJtHaJ3ZD2Xr1P/TceRSA=;
        b=CVGj2JFSSYXw1vUEObIAYhKJu+GrOq+InkXUBVKRqsm+rGVHn29QYgvJJx5YFLfBeK
         4Se9W0k9c/RingXjjotYMd0JE5yPMZB3ygRvTI4/gsWJVP4+JZmODsEw2GKKFTK8HHf7
         yo0xyHKcBmLX/XqdRMxZG2oxHtTZucD/93OLUoNmLhJ3lLcdj92s+mEgbYxu00MktOxT
         u07EveaKpTXF+Mfdof1ufkly5LEVwNvJX6e6lyjhghV6RtpfubFtfAmSP7M//znvaP9u
         haEuOXMlUXJnXEJ/lM2LI6ALAUE686LMDhwVj7Pqat8ZgD8j0dAjyJOWMZc8G3J8gzBw
         xUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765438541; x=1766043341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5cRIyUToWBqfDVg5RwgWa/mJtHaJ3ZD2Xr1P/TceRSA=;
        b=Jy6VqHSh9YJuqof5s3OuwNlxmN48dhclFHPQyKQD3jixL1wYlBhf69UYTdz6L76eU6
         kliSQWwrkIdDnCEohFGU9iQesGTvUBkTPB2PQU/hVwVTtYTGQ0qfVp3iBbMQ7DFEBmFm
         QeW3LjiauNlOFkwEJfema68kX6osMnBNFzN0551xR3E1iayGY7LWBPhzWyB5Bjrcksj+
         2bOh+Ns4tJ6H+b9AjrbJYNB3dc+RbFzLg2XoJu5PrwmHmyvlQbLYPFuetm/SRqSxhaGy
         xE1xkig2jRy80V6Pg7AKrPXbh9Ionj4x08wAZ14yjQWzbyUut6AbMKYmthXrPZ8n3ao7
         0Vpw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Yqh2bh1dj6O+qfIbAIkd30riUQZjBFDrxwl3DbZWDJs6JF3981Q9LZ6uOzZQMzFFqzbR9/gb5Eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWbVXoQnvzjFOe5ngk6hghPXkBPkHVhtw/1doOxRKljjJA3wWz
	uXkLMn27WlAslrAxkB2I0Y1xCY4My8hzgYoI77jwOQgTDxTwsUggtPcQMm2J4S0sHmVrmVtg3yB
	TU7eW1pe4Tw==
X-Gm-Gg: AY/fxX6xpdfPv+vXH2X9uPeasy1TExWADIz+chZWirfz0wKMrqF9zxPiIhR5oTTVrds
	f/5ZULyoBAmwBdhci+VCGz5+6w8zLXI8tTfERQPz1lmLh5jXsiP0NU66f5oKlxWnHkyME/lMVDn
	o19NqY6dY07nb7hG4xJWjSRzOn0CssR/lJZZVNgJAuk9i297kf+5g2tK+YOKrjlCBEKyVf66Www
	jV5hx/nRo7lx1GtCktnu9V+94vFJoUAIVz74tPOhGVUn78514SDvlaySm3XOKoyhd+2Q6IifQ6l
	GdZ23myqrpAe7VUYMuj9dvjrattVLOt85zV4onGrH4S7dyG3wagKQ1GFfHZuTFcZjx7tC2WmS56
	wkb5GaBpDkU18K5a6u33wEeUanzt54TooHRJcYOpXII9i/bb7bLs+om0zXMh7CJUemgrpvPFRZw
	DyC/zrUaOtFKCaZSGhsinqmqETyLv5XxFT1cMmpdEDOkGCOcI=
X-Google-Smtp-Source: AGHT+IGoUuUHw4G8GEx6LIfCNmK4Wz0P7Vv4+W+//KXKrKQNRYKoJQHJnPyRAtlt73kARbQ3vU0CQQ==
X-Received: by 2002:a05:6a21:3086:b0:366:58cc:b74b with SMTP id adf61e73a8af0-366e07dae21mr5212459637.21.1765438541298;
        Wed, 10 Dec 2025 23:35:41 -0800 (PST)
Received: from localhost.localdomain ([2a12:a304:100::202f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a9277e13dsm392594a91.5.2025.12.10.23.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 23:35:40 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: Re: [PATCH 2/3] i2c: k1: add reset support
Date: Thu, 11 Dec 2025 15:35:26 +0800
Message-ID: <20251211073526.3164875-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
References: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 19, 2025 at 07:46:44PM +0800, Encrow Thorne wrote:
> Add reset control handling to the K1 I2C driver.
>
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612..64d817d8315d 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -10,6 +10,7 @@
>   #include <linux/module.h>
>   #include <linux/of_address.h>
>   #include <linux/platform_device.h>
> + #include <linux/reset.h>
>
>  /* spacemit i2c registers */
>  #define SPACEMIT_ICR		 0x0		/* Control register */
> @@ -113,6 +114,7 @@ struct spacemit_i2c_dev {
>  	void __iomem *base;
>  	int irq;
>  	u32 clock_freq;
> +	struct reset_control *resets;

Thanks for the patch! A few suggestions to simplify this:

The reset_control structure doesn't need to be stored in the device
struct since the devm API automatically manages the resource lifecycle.

>
>  	struct i2c_msg *msgs;
>  	u32 msg_num;
> @@ -571,6 +573,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)

Please use a local variable in the probe function instead:

       struct reset_control *rst;

>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
>
> +	i2c->resets = devm_reset_control_get_optional(dev, NULL);

There is a new API, I would suggest this:
       rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);


> +	if (IS_ERR(i2c->resets))
> +		return dev_err_probe(dev, PTR_ERR(i2c->resets),
> +				    "failed to get reset\n");
> +
> +	reset_control_assert(i2c->resets);
> +	udelay(2);
> +	reset_control_deassert(i2c->resets);
> +

Why you need to call assert() then deassert()?
Wouldn't the single API fit?

Best regards,
Guodong

>  	spacemit_i2c_reset(i2c);
>
>  	i2c_set_adapdata(&i2c->adapt, i2c);
>

