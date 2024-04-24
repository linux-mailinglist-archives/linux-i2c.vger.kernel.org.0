Return-Path: <linux-i2c+bounces-3085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDC68AFD02
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 02:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F4CA1C22A8B
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 00:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796901370;
	Wed, 24 Apr 2024 00:00:11 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D895C363
	for <linux-i2c@vger.kernel.org>; Wed, 24 Apr 2024 00:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713916811; cv=none; b=lVZcPIIqgKG9e2K5FdMKtCsbn8nVIUXAYH7tHZuvQz2I4AUfzViMjvGHaRp/p9+CcM0dWTZbwAClo44tu962Kx5JVofIB1/QdnOz7Wo/On/L9cNUMDeel0mN40mLXx+M2/dp7ALhlij/h1rhG4ch2moX/dO5pmfOtXC5QCWwb/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713916811; c=relaxed/simple;
	bh=YHhAzKEj1cXzSZSyGZxvntWUsJLnny/LcXCQYZ0+TBg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0K0pVXDemxXORawDJkah4XksmwJMK6aeFAgxj3GyBEOPTbqfnss0S+bxewu5oi8E5VzgOodcnPcNs1VxdA9lWXaR7ipcvPeZ+5Ze8fT5I9hQI/AusSVn9E6cQ/itX8aRuks+yDuF5TOTvb3uRZJjFkpmO6tYVacazy5xtl4M8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 9bebda9f-01cd-11ef-b3cf-005056bd6ce9;
	Wed, 24 Apr 2024 03:00:07 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 03:00:06 +0300
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH 2/4] mfd: intel-lpss: Utilize i2c-designware.h
Message-ID: <ZihLhl8eLC1ntJZK@surfacebook.localdomain>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-3-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423233622.1494708-3-florian.fainelli@broadcom.com>

Tue, Apr 23, 2024 at 04:36:20PM -0700, Florian Fainelli kirjoitti:
> Rather than open code the i2c_designware string, utilize the newly
> defined constant in i2c-designware.h.

...

>  static const struct mfd_cell intel_lpss_i2c_cell = {
> -	.name = "i2c_designware",
> +	.name = I2C_DESIGNWARE_NAME,
>  	.num_resources = ARRAY_SIZE(intel_lpss_dev_resources),
>  	.resources = intel_lpss_dev_resources,
>  };

We have tons of drivers that are using explicit naming, why is this case
special? 

-- 
With Best Regards,
Andy Shevchenko



