Return-Path: <linux-i2c+bounces-1093-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BD7823605
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 21:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE1281C243BC
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 20:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6361CFB2;
	Wed,  3 Jan 2024 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUSM/OCO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3F41CFA0
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jan 2024 20:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0716C433C8;
	Wed,  3 Jan 2024 20:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704312126;
	bh=P4atSUj/Zz8C/yEytne5gSZ/LJGpqM9haGl7pJDGeNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hUSM/OCOHDoiMLkLCncRFHd97+NW3yxz12YXjXqV42Rj5MYnwgX+P1Plb43IuEQT0
	 AfyGXL3jHfHx+7QBBx1AwVKCjO2QVn8ubpl1Uhh2XPJmn+AqnXQ+naVVwt4QPzD5Cb
	 SrT0lkXm19NYuXom+7LExMvkjzC4U5b6rtLgRmyQop/LbOY1UVjmfTGioJhlcm7lwY
	 ews7fRNREz1X+MEcGR3Vc1M+9JJ7i50u5w6Ty5VWnlh9FPz4Aybif0nip0uc5Teqhk
	 OglOBRoUwSWg94kwYLFGcXK9AnEEi7mRdeRYb6y8AnxgwFL6Ux3ASuKJmyasptpMfa
	 iCtiT7Z0nFHBQ==
Date: Wed, 3 Jan 2024 21:02:01 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 8/8] i2c: add zhaoxin i2c controller driver
Message-ID: <20240103200201.wy6bzqgpoerngqt4@zenone.zhora.eu>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <a0e5f3ac6b344c5891367f5efe5edee80a7ce958.1703830854.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0e5f3ac6b344c5891367f5efe5edee80a7ce958.1703830854.git.hanshu-oc@zhaoxin.com>

Hi Hans,

[...]

> --- a/drivers/i2c/busses/i2c-viai2c-common.c
> +++ b/drivers/i2c/busses/i2c-viai2c-common.c
> @@ -5,7 +5,7 @@
>  #define VIAI2C_TIMEOUT			(msecs_to_jiffies(1000))
>  #define VIAI2C_STRETCHING_TIMEOUT	200
>  
> -static int viai2c_wait_bus_ready(struct viai2c *i2c)
> +int viai2c_wait_bus_ready(struct viai2c *i2c)

no, please, choose the rigth prototype at the beginning, don't
double change things in the same series.

>  {
>  	unsigned long timeout;
>  	void __iomem *base = i2c->base;
> @@ -23,7 +23,7 @@ static int viai2c_wait_bus_ready(struct viai2c *i2c)
>  	return 0;
>  }
>  
> -static int viai2c_wait_status(struct viai2c *i2c)
> +int viai2c_wait_status(struct viai2c *i2c)
>  {
>  	int ret = 0;
>  	unsigned long time_left;
> @@ -71,6 +71,9 @@ static irqreturn_t viai2c_isr(int irq, void *data)
>  
>  	/* save the status and write-clear it */
>  	i2c->cmd_status = readw(i2c->base + VIAI2C_REG_ISR);
> +	if (!i2c->cmd_status)
> +		return IRQ_NONE;
> +

is this change related to this patch? can you put this at the
beginning?

Andi

