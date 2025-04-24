Return-Path: <linux-i2c+bounces-10616-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47579A9AFE8
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 15:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98BC74678B1
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 13:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF64C1714B2;
	Thu, 24 Apr 2025 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsLs1Vbt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD3D2DF68;
	Thu, 24 Apr 2025 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503102; cv=none; b=CmIA/+drapuBP+BHp9PSrEg08MsRpf2WCoKPVmFAmu61JppC/xUpgHqYlFs+xKwwbL2vTF1F51qkTuE+6AilRlurkahLQa1novplRHjgprTLtSiw6YucsA072l/a1GHIwN/29UGGvKCxov6JO2eRb7g9fZTsKHMb7DQwPi9X9N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503102; c=relaxed/simple;
	bh=PvBNm4cbVRvbo1bX9od51ONdTl0ajMPNF1GEfWAYWrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaNJ/lng6OCi8pMPI06JEc6t4Wih3keQnKlshq91zDbZV96+xoR0YE0iNGJp3hthPqh06MKWFEESdJh4stn1YxPewCkLDk9urVFsUT3I7Ps9GIuNqQHsbWzzujeKaktsKgciqW9mRTuGy6ramqbAyxYjgGT717rC97acZiYT6ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsLs1Vbt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70110C4CEE8;
	Thu, 24 Apr 2025 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745503102;
	bh=PvBNm4cbVRvbo1bX9od51ONdTl0ajMPNF1GEfWAYWrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OsLs1VbtJZ+G4U6KiTzEFIQ1CgDhAUn2XVw7uHD9PLgbu+Rp0hZ0wG69X8y9xN5M0
	 qwNPGrcv2/0eqVBpodkKa7Xk2ucZl5pAdFw2KWTbe5HRfE82nois3k1CB2EHYD9Q7x
	 /GfTtDXM9ka4eBGYWShNvjG2zlmY7aT/ojdpgja0upMD1ENxRH6RRlSNx/gLQTEWIp
	 LOZKHOqz56oLqIS4g8YqSHzMOG1xibQ9JzAMuhQETBn6nIIod3jw+DvwzPFjcjzwBJ
	 q5OlRRbZv5HfAfuTQHOOgPOe4ZN6YQfm+THgNUTJD5MagGGZXkULKn3Jw9V4TaYsJz
	 o1J5gKsxEIfRQ==
Date: Thu, 24 Apr 2025 15:58:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Guenter Roeck <linux@roeck-us.net>, 
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: smbus: pass write disabling bit to spd
 instantiating function
Message-ID: <axsc6nipjntdtcgxdmlyz3awlcwawqu6k4uxjmdlx3zgzfkjhj@zlffk4sx5uaw>
References: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-0-627398268a1f@canonical.com>
 <20250424-for-upstream-i801-spd5118-no-instantiate-v1-1-627398268a1f@canonical.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-1-627398268a1f@canonical.com>

Hi,

> @@ -44,9 +44,9 @@ static inline void i2c_free_slave_host_notify_device(struct i2c_client *client)
>  #endif
>  
>  #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
> -void i2c_register_spd(struct i2c_adapter *adap);
> +void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled);
>  #else
> -static inline void i2c_register_spd(struct i2c_adapter *adap) { }
> +static inline void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled) { }
>  #endif

Please don't add random bool flags to function parameters,
especially in library functions. They add confusion and make the
code harder to understand. I even dislike them when they're used
inside drivers.

I'd much prefer something like this:

   static void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled)
   {
   	...
   }
   
   void i2c_register_spd_write_disable(struct i2c_adapter *adap)
   {
   	i2c_register_spd(adap, true);
   }
   
   void i2c_register_spd_write_enable(struct i2c_adapter *adap)
   {
   	i2c_register_spd(adap, false);
   }

This way, we gain readability at the cost of a bit of redundancy,
a trade-off I'm more than happy with.

Of course, this is just my preference (even if I'm pretty strong
about it, especially when it comes to libraries). Wolfram is free
to override me on this.

Andi

