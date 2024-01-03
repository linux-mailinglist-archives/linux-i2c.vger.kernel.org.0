Return-Path: <linux-i2c+bounces-1089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC989823196
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 17:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80E951F24A85
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 16:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B0D1C289;
	Wed,  3 Jan 2024 16:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iq9YJEUP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931911C283
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jan 2024 16:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA52C433C8;
	Wed,  3 Jan 2024 16:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704300773;
	bh=SiNHfkmZ6YOLp8AgbC1KjZUy8qx2GQ5TjAoHoevZQuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iq9YJEUPjgDSoS2TTYJ1jhRFvDUUsMIQx0fuOQ6mB9i3PPEHxJLCCZSEkv4Fr/j9y
	 Rltp2WCzrWaHW1DHONzhqiBmZ+S3sovJb64WgCX2rQ8vm5u5S7Hy/V1ujX7TIHSLt/
	 3kzJ9z2DJemJma/SGtD97gJQCZYbtfpS1o3GXCpRR9DezQHP/zrXpaf/u1MEe+DNO4
	 HAgL1At3koH6ht7MCjATFMQbx4t7XsB1/p8AYytDFlHJQz8O3ADFhKYQ9BKTHcKWuy
	 5hvawAnYcSbpK9I2l8c26O0RGCnJ0ZfMzT6lNQoUqWquikcwL+w26MrMlDGQeYG0Y0
	 H13urhpjcTS8g==
Date: Wed, 3 Jan 2024 17:52:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 3/8] i2c: wmt: adjust line length to meet style
Message-ID: <20240103165248.77h7uaguphbktebf@zenone.zhora.eu>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <c417d693bbdb3a4b804c1c3ba03e57bf4e8c33e1.1703830854.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c417d693bbdb3a4b804c1c3ba03e57bf4e8c33e1.1703830854.git.hanshu-oc@zhaoxin.com>

Hi Hans,

in case you are going to resend this series, you could think
about these improvements.

On Fri, Dec 29, 2023 at 02:30:34PM +0800, Hans Hu wrote:
> v4->v5:
> 	add previous prototype 'static' for wmt_i2c_init().

please, put the changelog at the end of the commit log.

Where is the changelog from v1?

> Tweaked a few formatting things:
> rename wmt_i2c_dev to wmt_i2c, i2c_dev to i2c, etc. 

Please just list the renames, you are not doing formatting
improvements here.

> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

...

> -static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev)
> +static int wmt_i2c_wait_bus_not_busy(struct wmt_i2c *i2c)
>  {
>  	unsigned long timeout;
> +	void __iomem *base = i2c->base;

this change and similar below, are not listed in the commit log.

>  
>  	timeout = jiffies + WMT_I2C_TIMEOUT;
> -	while (!(readw(i2c_dev->base + WMTI2C_REG_CSR) & WMTI2C_CSR_READY_MASK)) {
> +	while (!(readw(base + WMTI2C_REG_CSR) & WMTI2C_CSR_READY_MASK)) {
>  		if (time_after(jiffies, timeout)) {
> -			dev_warn(i2c_dev->dev, "timeout waiting for bus ready\n");
> +			dev_warn(i2c->dev,
> +					"timeout waiting for bus ready\n");

with /i2c_dev/i2c/ you don't need to break the line anymore (BTW,
now 100 character lines are allowed, however not encouraged).

>  			return -EBUSY;
>  		}
>  		msleep(20);

...

> -	tcr_val |= (WMTI2C_TCR_MASTER_WRITE | (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK));
> +	tcr_val |= (WMTI2C_TCR_MASTER_WRITE
> +		| (pmsg->addr & WMTI2C_TCR_SLAVE_ADDR_MASK));

this change is not listed in the commit log and please, remember,
the new 100 characters rule which makes these changes
unnecessary).

Andi

