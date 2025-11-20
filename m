Return-Path: <linux-i2c+bounces-14193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6AFC737A0
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 11:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 151902A05A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 10:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B442FB966;
	Thu, 20 Nov 2025 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R634Dkwn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452C9205E25;
	Thu, 20 Nov 2025 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763634856; cv=none; b=jtdC5N+/hVuK9GgRb5AqFxsa7k6MEY9h/9HQd1ktiItlXdApn9Q/oCr0TjuXhH2MD25uAYARHkQx7ZlY8xXYp+QJ1fZJ+bE0e9tC1FOgrenCqZ0WPCCDfUZZLTeFDYhRhaBoTfLMGcm+I6YNA/L8NQmY9bZ3qTiZejbWKeEKglw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763634856; c=relaxed/simple;
	bh=0kC3JVbniNzr/ImDlkOT0dNJwNLVLcsG6+ixM/BI2sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDj8fwhGgEybg4LShHdxiR1Eh1cPHhBxVl7Q37TCqw7S6+zmyRJS+j/LCTOWv7Xm2zTbjvr0Q3EDEZrpien6JI6LzHkL0/M+2EkM6e8xtbvtJoiq1xx1e0O/Wv0c9IMXvnjkHPW4FLe5NX4ENCZLwcqh9pJqk13CaCXax4fI2t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R634Dkwn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763634854; x=1795170854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0kC3JVbniNzr/ImDlkOT0dNJwNLVLcsG6+ixM/BI2sI=;
  b=R634DkwnCAGalqYwCscEn5XiFKz4lNkToYqCnfPZE0Axfyn88qUnmO5H
   5u0nKXz5qvUE6WC6DD9B3Dmh28rzl+JRU9Zg/lDuZjtGuI2H8kAlwVrn8
   nXbWSOIby2dOUfkF0CXGLPd4J8hOy4yXA9Wd61dsV+FIXPoP6dsWKjZHH
   nId3i65xtGzGQ805Tce/s7pVN8YJ/K2iREOyDIHgMVXi1ZxpWPUewaX05
   pRxb1pbfC35NrLUKdVxmJte94iOOueyuGG7UkkMvvTAGekKJbUvbJCxAX
   7eyFw8/59ZRmIJGh9r4xnwUYQaNr5Z0g2fktyIuUOE+HmZZ4Inyeu+qwG
   A==;
X-CSE-ConnectionGUID: 2I/wwwXYQNSQGOlaIiASCw==
X-CSE-MsgGUID: 08N8s2C9R9mA526YrgpxCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76308541"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="76308541"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:34:13 -0800
X-CSE-ConnectionGUID: w0355Oc6SFu/ZzuNlAwbEA==
X-CSE-MsgGUID: Sf5bM+iTTw6SqHjQxv4REA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="195465708"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2025 02:34:09 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AACE196; Thu, 20 Nov 2025 11:34:07 +0100 (CET)
Date: Thu, 20 Nov 2025 11:34:07 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 4/7] i2c: designware: Use runtime PM macro for
 auto-cleanup
Message-ID: <20251120103407.GO2912318@black.igk.intel.com>
References: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
 <20251119-i2c-dw-v3-4-bc4bc2a2cbac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119-i2c-dw-v3-4-bc4bc2a2cbac@bootlin.com>

On Wed, Nov 19, 2025 at 04:05:33PM +0100, Benoît Monin wrote:
> Simplify runtime PM handling in i2c_dw_xfer() by using the
> pm_runtime_active_auto_try guard. This adds the proper handling for
> runtime PM resume errors and allows us to get rid of the done_nolock
> label.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index ec4fc2708d03..fe708c7cd282 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -811,12 +811,13 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  
>  	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
>  
> -	pm_runtime_get_sync(dev->dev);
> +	ACQUIRE(pm_runtime_active_auto_try, pm)(dev->dev);
> +	if (ACQUIRE_ERR(pm_runtime_active_auto_try, &pm))
> +		return -ENXIO;
>  
>  	switch (dev->flags & MODEL_MASK) {
>  	case MODEL_AMD_NAVI_GPU:
> -		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
> -		goto done_nolock;
> +		return amd_i2c_dw_xfer_quirk(adap, msgs, num);
>  	default:
>  		break;
>  	}
> @@ -834,7 +835,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  
>  	ret = i2c_dw_acquire_lock(dev);
>  	if (ret)
> -		goto done_nolock;
> +		return ret;
>  
>  	ret = i2c_dw_wait_bus_not_busy(dev);
>  	if (ret < 0)
> @@ -899,9 +900,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  done:
>  	i2c_dw_release_lock(dev);

There is still this goto here. I don't think it is good to mix the
"cleanup" helpers and gotos. So if we want to use the cleanup helpers then
I think we should convert the whole function.

>  
> -done_nolock:
> -	pm_runtime_put_autosuspend(dev->dev);
> -
>  	return ret;
>  }
>  
> 
> -- 
> 2.51.1

