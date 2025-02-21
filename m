Return-Path: <linux-i2c+bounces-9517-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE3A3EA66
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 02:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83FA0422486
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 01:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6761C5D76;
	Fri, 21 Feb 2025 01:55:59 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id CF84170807;
	Fri, 21 Feb 2025 01:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740102959; cv=none; b=iauUOAh2ea+/dsjFGUBzPk+dGGXXVbbBerEda/i+D6j72JvYl4z45nJEzRdF/i6EySwyo+VzyNGilmKw0WX27rVWy0YN+lOYBm0F6aY1y4TRJzkLrfnEobfCJRBc1jIKxWWfIPLt+SqxSHbl5J/T7kkGTGJAHwkWyDGNkFiZRag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740102959; c=relaxed/simple;
	bh=hsntVK7cTYXQSCvpRcoznBAI6GvWvnEJaFI3QhsoYvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=uKkt8qbYx/q+lyZ7HMC+79cLBw9SALH6YlSVmYurEzTr18BXx5UpZ7Vtp/ZtXE6iHEJvC1Mh2+EoEYQKgHfbzEUNjoGZdNVl0qfSrG90HwppV9V2vdyq34/UKXayrNVA9aSG7cl+DqN4foIyzLhu1Aks40YAdyzjMXLQrY8gseY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 8E305601A2175;
	Fri, 21 Feb 2025 09:55:44 +0800 (CST)
Message-ID: <c581a336-37c9-aeae-0960-7c20e1c2dc25@nfschina.com>
Date: Fri, 21 Feb 2025 09:55:43 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] i2c: core: Allocate temporary client dynamically
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <f9aa39362e918b62aec0567f899b37d8d3c44710.1740064176.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/2/20 23:12, Geert Uytterhoeven wrote:
> drivers/i2c/i2c-core-base.c: In function ‘i2c_detect.isra’:
> drivers/i2c/i2c-core-base.c:2544:1: warning: the frame size of 1312 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>   2544 | }
>        | ^
>
> Fix this by allocating the temporary client structure dynamically, as it
> is a rather large structure (1216 bytes, depending on kernel config).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Mostly compile-tested, as apparently I have no I2C devices for which
> driver->detect and driver->address_list are valid.
>
> Apparently an alternative solution was posted before, but that does not
> fully address the potential stack size issue:
> "[PATCH] i2c: core: mark i2c_detect_address noinline_for_stack".
> https://lore.kernel.org/20250210080217.2772467-1-suhui@nfschina.com
> ---
>   drivers/i2c/i2c-core-base.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 35a221e2c11c1460..7ad1ad5c8c3f5694 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2506,7 +2506,7 @@ static int i2c_detect_address(struct i2c_client *temp_client,
>   static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
>   {
>   	const unsigned short *address_list;
> -	struct i2c_client temp_client;
> +	struct i2c_client *temp_client;
>   	int i, err = 0;
>   
>   	address_list = driver->address_list;
> @@ -2527,19 +2527,24 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
>   		return 0;
>   
>   	/* Set up a temporary client to help detect callback */
> -	memset(&temp_client, 0, sizeof(temp_client));
> -	temp_client.adapter = adapter;
> +	temp_client = kzalloc(sizeof(*temp_client), GFP_KERNEL);
> +	if (!temp_client)
> +		return -ENOMEM;
> +
> +	temp_client->adapter = adapter;
>   
>   	for (i = 0; address_list[i] != I2C_CLIENT_END; i += 1) {
>   		dev_dbg(&adapter->dev,
>   			"found normal entry for adapter %d, addr 0x%02x\n",
>   			i2c_adapter_id(adapter), address_list[i]);
> -		temp_client.addr = address_list[i];
> -		err = i2c_detect_address(&temp_client, driver);
> +		temp_client->addr = address_list[i];
> +		err = i2c_detect_address(temp_client, driver);
>   		if (unlikely(err))
>   			break;
>   	}
>   
> +	kfree(temp_client);
> +
>   	return err;
>   }

Looks good to me.

Reviewed-by: Su Hui <suhui@nfschina.com>

Su Hui


