Return-Path: <linux-i2c+bounces-3366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1298B985A
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 12:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D08B1C20AD6
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 10:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E4A5730D;
	Thu,  2 May 2024 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gY5wmHPm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0976D5676F;
	Thu,  2 May 2024 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714644013; cv=none; b=bpLE96tveE+mMjXjcFsCA+y7NZ6ecnusL9oIJN784G6BKBck8/v8zrQ5IUQkahOjGPKuiT7EdGa9TSfOer3VQdUO6NrhaPY0MokO6xvQ/Yjk4ZRP4AWuH7YqcuzYepgWo0YSyAtpYk33XRj7CqcZHj4rColpPKOPKZ9VB2JQt4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714644013; c=relaxed/simple;
	bh=htKiubxGZ19836bcnvnjwCBea7ZpQE+zL7IN1ToMNkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iK/UMAQjRR273TCmdYCLOQyu6XWWcxmHd4FqYYd09RW/7/YBcfLEoxBYAzDyV5+3bqU3qUcXJHsU9Oj1RyFQbXCIo7/LeRJx3gQErSpH/FTm0fweDKUNC48tYAHDu84MRN1xj67QeVTN5nJF+WxH8rIPJhCty8+B14MQduBQKKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gY5wmHPm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1A9C113CC;
	Thu,  2 May 2024 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714644012;
	bh=htKiubxGZ19836bcnvnjwCBea7ZpQE+zL7IN1ToMNkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gY5wmHPmIq/ogWfrSyBfa7PQpRCTHpwKmP0tgGjLQOE3rKwzQewgxGgwoVpxvoGxw
	 8pWnrrkHRBBtMFlOBDsDuAKKSalqx2fQ8oXXHbciNfp1KkZ/dh9TOwlDBpWO2ChKUS
	 hxwqKBd6Epex7XZ/He6fEDMl+DhIIeVCtTxtsyw46sVgvRyHd0eyVRAF3z/IlZ7idr
	 SVqQnicPYaw2gM08BctkvMi0HJOr/0xXP5ntwVbGmLR+6mHuDPuLlofC6uTPYHbFJH
	 7jF/Ck9IWRhbabsvH5Kqa0nNJJeHLdMGIjFSjEIbJ6SmTrIwP012smiMZQY5QqweSr
	 oSQk8f0hrurmQ==
Date: Thu, 2 May 2024 11:00:06 +0100
From: Lee Jones <lee@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] mfd: intel-lpss: Utilize i2c-designware.h
Message-ID: <20240502100006.GQ5338@google.com>
References: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
 <20240425002642.2053657-3-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425002642.2053657-3-florian.fainelli@broadcom.com>

On Wed, 24 Apr 2024, Florian Fainelli wrote:

> Rather than open code the i2c_designware string, utilize the newly
> defined constant in i2c-designware.h.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/mfd/intel-lpss.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
> index 2a9018112dfc..551560beff7b 100644
> --- a/drivers/mfd/intel-lpss.c
> +++ b/drivers/mfd/intel-lpss.c
> @@ -24,6 +24,7 @@
>  #include <linux/ioport.h>
>  #include <linux/mfd/core.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/i2c-designware.h>
>  #include <linux/pm.h>
>  #include <linux/pm_qos.h>
>  #include <linux/pm_runtime.h>
> @@ -116,7 +117,7 @@ static const struct mfd_cell intel_lpss_idma64_cell = {
>  };
>  
>  static const struct mfd_cell intel_lpss_i2c_cell = {
> -	.name = "i2c_designware",
> +	.name = I2C_DESIGNWARE_NAME,
>  	.num_resources = ARRAY_SIZE(intel_lpss_dev_resources),
>  	.resources = intel_lpss_dev_resources,

I explained why I don't like this in v1 this morning.

Please take a look.

-- 
Lee Jones [李琼斯]

