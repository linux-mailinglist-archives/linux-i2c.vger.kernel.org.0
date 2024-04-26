Return-Path: <linux-i2c+bounces-3206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7EE8B3330
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 10:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E49D01C2212F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 08:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E8443AC5;
	Fri, 26 Apr 2024 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="aX8CtGSq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D85813A879;
	Fri, 26 Apr 2024 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.110.109.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121088; cv=none; b=WzO2MfpcqOQY4i6WJ/b9pYNLbKqZVeeB9CoLNRY8bgDOUFOt/rBSnLBsKg8JxnN5JDF0SVSYEgSIJWUM7Qzn2neoHjlbkFrb2tfz4x5xAYAoA/LX1mEjRMgk9gbREMP+701Hjufd5welv3GAaafx/PWKmLjXqhJQeVaLciPR+40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121088; c=relaxed/simple;
	bh=OAVtZtBf7B9h6ZnYh5M/C/oO9W5Yg0/byzN4wLUDgb0=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=kUcDUkGwz35kJXFhrW8qmhHpj9rH0SXAwpiyhgotsMBpH6teo15J1leboRVtjMAQLV3tutdWP74dVvyyg9wBY7s3hviglwXuorAYWMwVV4VV+hzgH5W3IQQ0nOZFtFwBsubhVmsL9b7RmY6DcJBjfJOVe2qpu/2zGyYTKw6QrGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=aX8CtGSq; arc=none smtp.client-ip=84.110.109.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id E3074440534;
	Fri, 26 Apr 2024 11:38:22 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1714120702;
	bh=OAVtZtBf7B9h6ZnYh5M/C/oO9W5Yg0/byzN4wLUDgb0=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=aX8CtGSqsKGv/OzL6CPpi+dX9N6dhOwBlp/IsUivA9Dv/EfbCCXY59PhlTStpHu3g
	 xphb3xLfNLhY6iEdHbuvdeF74l53KNsX3KYqFzbhFxFtOy5f2Jimab2ckNojsXsiBs
	 QY17hX6o1kQo5kYhyXezD9NQEpwZZQSz+90XZvOtqlxlARqAYo9EVMy8CMGNO+Ffbt
	 oKpMhK9RBEsbUl7ualBGHsBIciAlqopeEKlpn+XkK5BxZRZ1piUP81Iyc18Q9lmXoh
	 TYaWzLRuKd28qpFAXHPaqkv+GNdvWNyyW7foSpAHVRYWV8/p0DG0gJUT4uiQln7te/
	 23+JT9YmxPieQ==
References: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Baruch Siach <baruch@tkos.co.il>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: smbus: fix NULL function pointer dereference
Date: Fri, 26 Apr 2024 11:32:49 +0300
In-reply-to: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
Message-ID: <87edas5xip.fsf@tarshish>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Wolfram,

On Fri, Apr 26 2024, Wolfram Sang wrote:
> Brauch reported an OOPS when using the designware controller as target
> only. Target-only modes break the assumption of one transfer function
> always being available. Fix this by always checking the pointer in
> __i2c_transfer.
>
> Reported-by: Baruch Siach <baruch@tkos.co.il>
> Closes: https://lore.kernel.org/r/4269631780e5ba789cf1ae391eec1b959def7d99.1712761976.git.baruch@tkos.co.il
> Fixes: 4b1acc43331d ("i2c: core changes for slave support")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  drivers/i2c/i2c-core-base.c  | 12 ++++++------
>  drivers/i2c/i2c-core-smbus.c |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index ff5c486a1dbb..db0d1ac82910 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2200,13 +2200,18 @@ static int i2c_check_for_quirks(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   * Returns negative errno, else the number of messages executed.
>   *
>   * Adapter lock must be held when calling this function. No debug logging
> - * takes place. adap->algo->master_xfer existence isn't checked.
> + * takes place.
>   */
>  int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>  {
>  	unsigned long orig_jiffies;
>  	int ret, try;
>  
> +	if (!adap->algo->master_xfer) {
> +		dev_dbg(&adap->dev, "I2C level transfers not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
>  	if (WARN_ON(!msgs || num < 1))
>  		return -EINVAL;
>  
> @@ -2273,11 +2278,6 @@ int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>  {
>  	int ret;
>  
> -	if (!adap->algo->master_xfer) {
> -		dev_dbg(&adap->dev, "I2C level transfers not supported\n");
> -		return -EOPNOTSUPP;
> -	}
> -
>  	/* REVISIT the fault reporting model here is weak:
>  	 *
>  	 *  - When we get an error after receiving N bytes from a slave,
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index e3b96fc53b5c..a942c5306a4e 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -596,7 +596,7 @@ s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>  				break;
>  		}
>  
> -		if (res != -EOPNOTSUPP || !adapter->algo->master_xfer)
> +		if (res != -EOPNOTSUPP)
>  			goto trace;
>  		/*
>  		 * Fall back to i2c_smbus_xfer_emulated if the adapter doesn't


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

