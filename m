Return-Path: <linux-i2c+bounces-13935-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F993C25BE6
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 16:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47F30425C71
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 15:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90A426ED38;
	Fri, 31 Oct 2025 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZJQ8oQv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFC734D385;
	Fri, 31 Oct 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922693; cv=none; b=tuug/BVBHHpL6BR31VaciZI+c4XAW/utjZhGVP69fHWp6PSyzVzm2I32v7t1fGSyJ+WVEHDQngW61tynVoeDHAodoJjdGZLZXUmhcUTcRnUcFrVTcNmGmj4aXhjDtXjnS15tg5UEgFN4T6NumxlM07O3FoOVzTvjxsQhPXZ+gu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922693; c=relaxed/simple;
	bh=hJWzz6XCk4hYFyEUatn9zLjpnq+roHgfo0xNOZNwXeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npAY0jsergAnZqo7kf1wtVANb/AdM4GQDT2AqBh93pxYZZGxJQ/7r+sqR2PgM7DdJQ1WJzD7PqZ980WRBL0dwNydB9kMAztUjx/Ar0AHvWuFkritfFwRdUTJoEeYWgpEBferegOPT3n34Wdq54NKSQL1WcM8FmLy8xXASgIP0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZJQ8oQv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761922691; x=1793458691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hJWzz6XCk4hYFyEUatn9zLjpnq+roHgfo0xNOZNwXeY=;
  b=OZJQ8oQvuCpuJZEcRQxRbjVtpIrLHcE0iUTk59ESmJZ3sz1cekNB4DN+
   SxLw4oXbqnmirQi0SR/ynC0lWTT+60K9ESEa/DRnLyWBZy46by30Ir+sg
   lxdXNPp7+0GPA6ilzp3IDJH5R2gO+wPacNu2y9I5VOnqAfa7QYZdQNDVh
   pohhg/1guu+yVibtNW3BdtHhpWkWSxTPSCBjSdOHXAAdPcFUj0sHOMS/1
   Ti/v2OrtAXxBF0XaJsZ/i54TEHJ5iW9QSlDkTYnkUQLAHe90iGMo8XpP/
   GyOoP7WgeRf6JAmGxLN5trWMgJ/0jMFgUz7WHvSkXn21YBAS6jzRygK+2
   A==;
X-CSE-ConnectionGUID: Pmrbe/2pTAuO4ibac5Qp6Q==
X-CSE-MsgGUID: ZullW2zkRdCLum5aUM4S8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75201585"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="75201585"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 07:58:10 -0700
X-CSE-ConnectionGUID: wZxVrHPYTKGc0sRQ28fQ0A==
X-CSE-MsgGUID: gEOuztlpS5u3NzlhBamfgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="185470386"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.66])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 07:58:06 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vEqZj-00000004Imb-3mXr;
	Fri, 31 Oct 2025 16:57:59 +0200
Date: Fri, 31 Oct 2025 16:57:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 4/5] i2c: designware: Implement I2C_M_STOP support
Message-ID: <aQTOd4tghCexT_0Z@smile.fi.intel.com>
References: <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-4-90416874fcc0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031-i2c-dw-v2-4-90416874fcc0@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 31, 2025 at 03:35:42PM +0100, Benoît Monin wrote:
> Add the support of the I2C_M_STOP flag in i2c_msg by splitting
> i2c_dw_xfer() in two: __i2c_dw_xfer_unlocked() for the core transfer logic
> and i2c_dw_xfer() for handling the high-level transaction management.
> 
> In detail __i2c_dw_xfer_unlocked() starts a transaction and wait for its
> completion, either with a STOP on the bus or an error. i2c_dw_xfer()
> loops over the messages to search for the I2C_M_STOP flag and calls
> __i2c_dw_xfer_unlocked() for each part of the messages up to a STOP or
> the end of the messages array.
> 
> i2c_dw_xfer() holds the device lock while calling __i2c_dw_xfer_unlocked(),
> this allows to group multiple accesses to device that support a STOP in
> a transaction when done via i2c_dev I2C_RDWR ioctl, in a single-master
> configuration.
> 
> Also, now that we have a lookup of the messages in i2c_dw_xfer() prior
> to each transaction, we use it to make sure the messages are valid for
> the transaction. We check that the target address does not change before
> starting the transaction instead of aborting the transfer while it is
> happening, as it was done in i2c_dw_xfer_msg(). The target address can
> only be changed after an I2C_M_STOP flag, thus a STOP on the i2c bus.
> 
> The I2C_FUNC_PROTOCOL_MANGLING flag is added to the list of
> functionalities supported by the adapter, except for the AMD NAVI i2c
> controller which uses its own xfer() function and is left untouched.

...

>  /*
> - * Prepare controller for a transaction and call i2c_dw_xfer_msg.
> + * Prepare controller for a transaction, start the transfer of the msgs
> + * and wait for completion.
> + * Caller must hold the device lock.

Comment is good, but having a lockdep annotation in addition to is even better!

>   */

...

> +done:
> +	return ret;

Drop now unneeded label, return directly.

...

> +static int
> +i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> +{
> +	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
> +	struct i2c_msg *msg;
> +	int ret, cnt;
> +
> +	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);

__func__ can be turned on or off at runtime (with Dynamic Debug help).

> +	pm_runtime_get_sync(dev->dev);

Can you switch to use ACQUIRE() ?

> +	switch (dev->flags & MODEL_MASK) {
> +	case MODEL_AMD_NAVI_GPU:
> +		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
> +		goto done_nolock;
> +	default:
> +		break;
> +	}
> +
> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		goto done_nolock;
> +
> +	/*
> +	 * If the I2C_M_STOP is present in some the messages,
> +	 * we do one transaction for each part up to the STOP.
> +	 */
> +	for (msg = msgs; msg < msgs + num; msg += cnt) {
> +		u16 addr = msg->addr;
> +
> +		/*
> +		 * Count the messages in a transaction, up to a STOP
> +		 * or the end of the msgs.
> +		 */
> +		for (cnt = 1; ; cnt++) {
> +			/*
> +			 * We cannot change the target address during
> +			 * a transaction, so make sure the address stays
> +			 * the same.
> +			 */
> +			if (msg[cnt - 1].addr != addr) {
> +				dev_err(dev->dev, "invalid target address\n");
> +				ret = -EINVAL;
> +				goto done;
> +			}
> +
> +			if ((msg[cnt - 1].flags & I2C_M_STOP) ||
> +			    (msg + cnt == msgs + num))
> +				break;
> +		}
> +
> +		ret = __i2c_dw_xfer_unlocked(dev, msg, cnt);
> +		if (ret < 0)
> +			goto done;
> +	}
> +
>  done:
>  	i2c_dw_release_lock(dev);
>  
>  done_nolock:
>  	pm_runtime_put_autosuspend(dev->dev);
>  
> -	return ret;
> +	if (ret < 0)
> +		return ret;
> +	return num;
>  }

-- 
With Best Regards,
Andy Shevchenko



