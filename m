Return-Path: <linux-i2c+bounces-10435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AD3A90D5F
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 22:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 146607A5849
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 20:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A4E241139;
	Wed, 16 Apr 2025 20:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhfSBf9T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D10236445
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 20:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836257; cv=none; b=Ngh3Pp2cz1gF1SZS00ll3lz3XrUHZ+ytHesktsF17qaqtytY3QPX0ymbh2HvQ7YpDkF+hzNWf08EdTrKFPRf+oyRTb/xLTAj+GUquLe6KEvC5MSoUN2VVthyOvb9FXmZ61TI21VhKfUO443E5sgMchW8ki9zh6OsavcFlu80YP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836257; c=relaxed/simple;
	bh=NqYIhgVyXrbFVyL8pi1K9+SCEmDq5sPsE6m5fHFw2YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sITvjRhIzGzZbMPH12P3F9+gT8Y8iKsPWyinv0pmSIkQgt05WeArhnbpuvFuYS1LmcCgqfumoMbgOYzdO1jZbLvBWsHp4HRbYJJXnJXrn7/VBXzTz1BTJIi+56rs4yu0ZkQCNddw/amDI9PAimAywpiXMlEa8pgQPGfTnGrMTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhfSBf9T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44C6C4CEE2;
	Wed, 16 Apr 2025 20:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744836256;
	bh=NqYIhgVyXrbFVyL8pi1K9+SCEmDq5sPsE6m5fHFw2YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AhfSBf9Tkdxpj9h7bCSJcTRmBt9sTzHS7sRbL1o/kC9PUi4C9nFGcNyHqpUIdzg/c
	 Nk7qQVhxmWQj6PLU7w1U+l0lTNJ9GekzsQie9u30+y2N5kc7AQTujIxAbEAvkK55CD
	 JpkvigBATYgwlaaTdf4FWUOrk9D4/1dhnI1r/GFDBAizeG9EXqynAhNjXpusg3hPWf
	 SUESGhug7XzssFkcnX9XNun5+GJFJDLI2ntI7GVBXGdvmLiSvkgZg8QRtEE5r/UAT1
	 sH1qmYaT8OuTpy33MtGLT+k74gwQSEbWj3P4HMxcqEaXvlgw1lVjoELMikPRHIT6UY
	 4WoEfNVfwTaHA==
Date: Wed, 16 Apr 2025 22:44:11 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Enrico Zanda <e.zanda1@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH 03/10] i2c: via: Replace dev_err() with dev_err_probe()
 in probe function
Message-ID: <5bk2mkdapfflngrnp5ohctq34fcecco4m6udltvlg6ndgt7lr2@yovayo66fffe>
References: <20250415183447.396277-1-e.zanda1@gmail.com>
 <20250415183447.396277-4-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415183447.396277-4-e.zanda1@gmail.com>

Hi Enrico,

> @@ -89,10 +89,9 @@ static int vt586b_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	u8 rev;
>  	int res;
>  
> -	if (pm_io_base) {
> -		dev_err(&dev->dev, "i2c-via: Will only support one host\n");
> -		return -ENODEV;
> -	}
> +	if (pm_io_base)
> +		return dev_err_probe(&dev->dev, -ENODEV,
> +				     "i2c-via: Will only support one host\n");

as we are here, you can remove the "i2c-via" because dev_err
already prints the device and I don't see any useful information
coming from it.

Thanks,
Andi

