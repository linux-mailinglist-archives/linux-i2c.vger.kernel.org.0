Return-Path: <linux-i2c+bounces-6608-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F119762B1
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 09:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C7A71F24854
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 07:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA0A18C92D;
	Thu, 12 Sep 2024 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbmHp4q5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A8126BFC;
	Thu, 12 Sep 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726126183; cv=none; b=eP3+ngyyV+I2XOwnL++cO2AV4splJCDs+k8rhquMW21KusC2jEIz6qm4wMHjvIYRn6VtV++/9a2+GbMttIl1F1IYGf3Kl1gwJ9MFrP2Gvx62b5n+iMpcrhDfk81tkTqhZprY8/exZj5aDmzQzoUFST7Xym9JPlqBaPBcos/Re5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726126183; c=relaxed/simple;
	bh=uVoySAa/5Xi8uQ8WEJx1H/S17eNfwgwkO5RN1y7SltA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXI1gS0HVSeb9yIHLlqff+7aJOkzVzmw5HqH13C6EeT1ARMU7PwG+xPrS0AgFtnf/YFWVcW1PXXw/MDjs3orMqxPF2c9VB2PPJCGZfHm39mTV+Vh/rJBkPJKXefOQTziH9sSVY9SARil8sq5L+eHGT6nSLI/lERp9r7udHezsrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbmHp4q5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4C1C4CEC3;
	Thu, 12 Sep 2024 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726126182;
	bh=uVoySAa/5Xi8uQ8WEJx1H/S17eNfwgwkO5RN1y7SltA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbmHp4q5dKw9fxiuTCmhHT/b0QbyuKjde27+Q9UfoZjhhwSD+6scXxxJ0oFBs/CJN
	 RVHYxv9NMea3dUIUfg4YK619c0D+MtmH/hYMZYN/GLAHOMs1zkBwHEtkaObV/hryPV
	 JTGj21Xrpd3QoLoSSOyAGDwdSaFx9r4ll0lpahlrXAE91Of6GKqKhk8+V+ux5U2fAO
	 YKjUe494jrRuLjOguw5cgvcTYkEh9vE+SQgA2JrdfrL0H5bdADKntAkAybPAqVjWDJ
	 zGbN8jPXnZUSd5DnJuBogZlE7ru+xph29cflTAZAihVpiGbaGgyhI6qedeYY/JInoa
	 k8hMOpZNBYbUg==
Date: Thu, 12 Sep 2024 09:29:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 08/12] i2c: isch: Use read_poll_timeout()
Message-ID: <pwvhzkxeniutopyxczvimkau3elchfy5x32cimlqwjnmqjzv42@zpojd2lxs3o4>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
 <20240911154820.2846187-9-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911154820.2846187-9-andriy.shevchenko@linux.intel.com>

Hi Andy,

...

> @@ -83,7 +80,6 @@ static int sch_transaction(struct i2c_adapter *adap)
>  	struct sch_i2c *priv = container_of(adap, struct sch_i2c, adapter);
>  	int temp;
>  	int result = 0;
> -	int retries = 0;
>  
>  	dev_dbg(&adap->dev,
>  		"Transaction (pre): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
> @@ -112,15 +108,11 @@ static int sch_transaction(struct i2c_adapter *adap)
>  	temp |= 0x10;
>  	sch_io_wr8(priv, SMBHSTCNT, temp);
>  
> -	do {
> -		usleep_range(100, 200);
> -		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
> -	} while ((temp & 0x08) && (retries++ < MAX_RETRIES));
> -
> +	result = read_poll_timeout(sch_io_rd8, temp, !(temp & 0x08), 200, 500000, true,
> +				   priv, SMBHSTSTS);
>  	/* If the SMBus is still busy, we give up */
> -	if (retries > MAX_RETRIES) {
> +	if (result) {
>  		dev_err(&adap->dev, "SMBus Timeout!\n");
> -		result = -ETIMEDOUT;
>  	} else if (temp & 0x04) {
>  		result = -EIO;
>  		dev_dbg(&adap->dev, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
> @@ -130,7 +122,7 @@ static int sch_transaction(struct i2c_adapter *adap)
>  		dev_err(&adap->dev, "Error: no response!\n");
>  	} else if (temp & 0x01) {
>  		dev_dbg(&adap->dev, "Post complete!\n");
> -		sch_io_wr8(priv, SMBHSTSTS, temp);
> +		sch_io_wr8(priv, SMBHSTSTS, temp & 0x0f);

there is still a dev_dbg() using temp. To be on the safe side, do
we want to do a "temp &= 0x0f" after the read_poll_timeout?

Andi

>  		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x07;
>  		if (temp & 0x06) {
>  			/* Completion clear failed */
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

