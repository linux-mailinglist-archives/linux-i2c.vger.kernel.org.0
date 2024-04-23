Return-Path: <linux-i2c+bounces-3067-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDF28AE3C4
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 13:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A21BE1C22575
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 11:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96647CF25;
	Tue, 23 Apr 2024 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkytYJJn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8150E576
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 11:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713871411; cv=none; b=MrWe7iiOPQZsSlYicD4bDyj8ckwm8ShMIBqrKjs6Um8QO4QvDFM/x+hF9xmCVwRp7GHqk3pMg6dzsSH4KxfFpxu2yFHz8BsbsEbN4GFnJp9morobuuUY6PjSlOwQfmwfvf5EjRQ7vdaBw0JIKuKsZvPKjrBSsuSSwm2bTjHRfZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713871411; c=relaxed/simple;
	bh=BtapUqg8ned14xfTw8MCYHoFDg35d1K9l+vLHIIHB7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EypHUPivLu44xQhBJjypGTESLt2SFSEGdCWYymNmR12yTrlmWXx6tWniSWRHDfBVoFB/0eoXM+GAM4T7piOTN8T7/3Ha4zKlzMGKYDNGdwg4DvvrftAivtdHKv7uQBi8a2SIOvA+PRkzK2rUzaByVgNgPOStV8BT84nWGUUCubY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkytYJJn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE3AC116B1;
	Tue, 23 Apr 2024 11:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713871410;
	bh=BtapUqg8ned14xfTw8MCYHoFDg35d1K9l+vLHIIHB7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkytYJJnuHAHnsiSXfDI8M/RGxZ3tzpKTltHmjYu9p52XpvGvVzdnofaFBwpQvvuU
	 X/bxvE4Yg3WNjI+noE5ZHcwO3bjuSlsHQCuwkCZfzgZqz6HYEJ/2jXjDtC0T4uEe86
	 qseV7UCUwMd1kTFg9FBAsl4I8NUbXq3zrN1OHNifJ0XCXSf/snbacO02BhWh5gHIS2
	 BOhJC7M2m9JbSRfQfncnm+FWHhybQ00lTRJXE4SGOp+il7mO27v2GHaCu6FGxeFMMh
	 Wztq6fhGjCJ2+t3oHd2x4sVX30EUtJ+M31Y0HFpQSZjUhUajq8YlQJVPtLVB9nqaHZ
	 4Pn3aq5Mi9G8g==
Date: Tue, 23 Apr 2024 13:23:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: linux-i2c@vger.kernel.org, wsa@kernel.org, cobechen@zhaoxin.com, 
	hanshu@zhaoxin.com, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v10 1/6] i2c: wmt: create wmt_i2c_init for general init
Message-ID: <jop5c7fdnh53zztpl2qtipsdg5c7jrg2xvkzsxpwacp3xzsgtd@pnozzn4d275w>
References: <cover.1712479417.git.hanshu-oc@zhaoxin.com>
 <60d6194d9e6623744955047a3881f9010b4da85a.1712479417.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60d6194d9e6623744955047a3881f9010b4da85a.1712479417.git.hanshu-oc@zhaoxin.com>

Hi Hnas,

...

> @@ -109,7 +109,7 @@ static int wmt_check_status(struct wmt_i2c_dev *i2c_dev)
>  	unsigned long wait_result;
>  
>  	wait_result = wait_for_completion_timeout(&i2c_dev->complete,
> -						msecs_to_jiffies(500));
> +						  msecs_to_jiffies(500));

argh!!! This change is not related to this patch.

>  	if (!wait_result)
>  		return -ETIMEDOUT;
>  

...

> @@ -348,18 +370,9 @@ static int wmt_i2c_probe(struct platform_device *pdev)
>  	}
>  
>  	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
> -	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
> +	if (!err && clk_rate == I2C_MAX_FAST_MODE_FREQ)

This is not related either.

Andi

>  		i2c_dev->tcr = TCR_FAST_MODE;

