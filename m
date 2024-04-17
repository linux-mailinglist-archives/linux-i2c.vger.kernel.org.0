Return-Path: <linux-i2c+bounces-2994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E60AF8A7DB8
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 10:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75228B2389C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 08:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29C37CF1D;
	Wed, 17 Apr 2024 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMkTAgUf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA5D7C6C1;
	Wed, 17 Apr 2024 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713341156; cv=none; b=fHH3M+ZvUe7syQlUqa1luH/nMpXYNFHXagg2F/o5YlajoH5o9HrCVRJjeSAdMAkxXtATrgK7f8pBpbLXo7oxoDtmi+Vl/SOa6Ju3l/32+5vc+28doynurtBOYrwpNGy4SCOVOJFQ2R3t97tk+QX8HvJjysIhGoD8YB4EX402ros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713341156; c=relaxed/simple;
	bh=YxZtVJOHt7v0ErisjCwYOMhRixExZvTP9uLYzfqnNtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxX3LVOlJpHXE2+5LbjNp/peQf2ivRmYiT2RyZ6shFlVx3f7IPqVvgD0RgeGUPaHj9Bbu5Hp5tQLmQCGb3BCj9PTjJfe3qk0lv5FVd+GCxHG3W34zwnF8UR4UnKAvUGUcyYgRcmUKMg1+SOj4nILkOnxsjGz+zu78AITpqx/iE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMkTAgUf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA76C2BD10;
	Wed, 17 Apr 2024 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713341156;
	bh=YxZtVJOHt7v0ErisjCwYOMhRixExZvTP9uLYzfqnNtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMkTAgUfwWBVidEbZeg1pARdyxZtJZBAcadUMc6y7wZgY83+ja8AHDZW0m4pFFSjR
	 jqjVzzh3j7Q7Fs1zQ/hfiwtD5xIWVABA7uOzmShrtyVLsS1yp+pkHogD6b8y5nnsiZ
	 SLkzStRL37cViyYNQohVAvlr2Z/GEkHfPmS3DcgLAorHXDS3d0J8HfFup85L/F0RLi
	 SRzJiJIz3rl2Ky0L4SM42b2tQ/D/TdtCydEJ5O6uGRzdQhCh3WzY9xYNl8XKAlzjSE
	 sb3kMWg2lgOmma3YjUtAAbB23nwqKLrOXfUoPpW3ruLvQtVukII4uhZ8v0Gmyxcl1x
	 9VAPV4ZI1T1wg==
Date: Wed, 17 Apr 2024 10:05:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Peter Rosin <peda@axentia.se>, 
	Guenter Roeck <linux@roeck-us.net>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 4/4] i2c: Remove I2C_CLASS_SPD
Message-ID: <7qmjriqdfhbi6mkegcxu3cfpi4j4mw3qynz3byujgg2uzl2lrh@5amydhvwcytj>
References: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
 <951819eb-aa65-4e39-a60e-62886759e524@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <951819eb-aa65-4e39-a60e-62886759e524@gmail.com>

Hi Heiner and Guenter,

On Mon, Apr 15, 2024 at 10:50:27PM +0200, Heiner Kallweit wrote:
> Remove this class after all users have been gone.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  include/linux/i2c.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 5e6cd43a6..970953737 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -852,7 +852,6 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
>  
>  /* i2c adapter classes (bitmask) */
>  #define I2C_CLASS_HWMON		(1<<0)	/* lm_sensors, ... */
> -#define I2C_CLASS_SPD		(1<<7)	/* Memory modules */

I missed the fact that we need some synchronization, as I'm
getting a build failure.

I will revert this and apply it after Guenter has merged his part
into the mainline.

Guenter, if you have a spare Post-it, could you please note to CC
me when this part is sent as a pull request?

Andi

>  /* Warn users that the adapter doesn't support classes anymore */
>  #define I2C_CLASS_DEPRECATED	(1<<8)
>  
> -- 
> 2.44.0
> 
> 

