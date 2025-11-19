Return-Path: <linux-i2c+bounces-14177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE1EC71041
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 21:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0168B3589F9
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 20:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11611393DC9;
	Wed, 19 Nov 2025 20:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPhdPCoM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9B33A5E79;
	Wed, 19 Nov 2025 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582639; cv=none; b=SZz+zfNMnj5zT+zN91rKPoqwcuhB09p2tFDZM+WGUi1QDdqwby5rBFpkI2uCcKfaMEoPjRhwq52q+1iFleisrvcIXFr7TbqDBn/10IoLS0USWuS3sZUr6pbVp0dVKVVo04wpojtTp0udes/zfezEXVyCaivRVaYGV64XBVAWznA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582639; c=relaxed/simple;
	bh=6FvheDxb079G/35qiI8mEO2FvYTKpcKFhNAWHP13xrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euihXn6Zl4I2gOm+Jm5x439rWR7FdCkgswbvaqfFWMFaepkdjPMRBDJbo5zj58ZcRZEZ4YjQLXO9ytHGfX8JCUrMCqXd58vN5JSNl7hGgTElSd8xUQih9Cm/Pzo83fl/GAsDkkh8AonFZpycpX3ZVVk48lVp4L+5jlLMOKj4WWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPhdPCoM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763582635; x=1795118635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6FvheDxb079G/35qiI8mEO2FvYTKpcKFhNAWHP13xrI=;
  b=ZPhdPCoMWS1aiMRevJOtKiCYOHq/jwKVAPB/6cJ0WN2A3zWQjlSF9G9G
   DpEvqlIJHJWdfwjT3nr2uTJ/2Nf9lJAtUVX4C2wUFqSYR6ypkwP6bQ+Ug
   Z5OanHcB4auVCMzuMdKwzI031a//VlzQVFWZtOE4AqryyaNu5vYsoCHPh
   iY/3Ut6j4sK3KjcWgDOBWTafKnhhYqPD/o5H91FOzAjwLiUiSBF7ufpRt
   rryZCtAAk2T8i/J/59c7QClw/mYoyzVTvmTG71IiA3HXwuxRabwvO5nNj
   mnUkn+ro4vX3nbfzyiErVcXHjWbQMae3gbpa+kKVl9WBngg9bh/nMNNUr
   Q==;
X-CSE-ConnectionGUID: 1NcTRvf8SxmTLfEfgOz+mw==
X-CSE-MsgGUID: FP+KJgMKR1WBtjanvcZETw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76249897"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="76249897"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:03:49 -0800
X-CSE-ConnectionGUID: QYbq4pmtT5ueZBxR1HyaHQ==
X-CSE-MsgGUID: H2GvheIcQJqNCB3/GdCnVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191590733"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:03:44 -0800
Date: Wed, 19 Nov 2025 22:03:42 +0200
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
Subject: Re: [PATCH v3 6/7] i2c: designware: Implement I2C_M_STOP support
Message-ID: <aR4inuzOitdpSDvd@smile.fi.intel.com>
References: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
 <20251119-i2c-dw-v3-6-bc4bc2a2cbac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119-i2c-dw-v3-6-bc4bc2a2cbac@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 04:05:35PM +0100, Benoît Monin wrote:
> Add the support of the I2C_M_STOP flag in i2c_msg by splitting
> i2c_dw_xfer() in two: __i2c_dw_xfer_one_part() for the core transfer logic
> and i2c_dw_xfer() for handling the high-level transaction management.
> 
> In detail __i2c_dw_xfer_one_part() starts a transaction and wait for its
> completion, either with a STOP on the bus or an error. i2c_dw_xfer()
> loops over the messages to search for the I2C_M_STOP flag and calls
> __i2c_dw_xfer_one_part() for each part of the messages up to a STOP or
> the end of the messages array.
> 
> i2c_dw_xfer() takes care of runtime PM and holds the hardware lock on
> the bus while calling __i2c_dw_xfer_one_part(), this allows grouping
> multiple accesses to device that support a STOP in a transaction when
> done via i2c_dev I2C_RDWR ioctl.
> 
> Also, now that we have a lookup of the messages in i2c_dw_xfer() prior
> to each transaction, we use it to make sure the messages are valid for
> the transaction. We check that the target address does not change before
> starting the transaction instead of aborting the transfer while it is
> happening, as it was done in i2c_dw_xfer_msg(). The target address can
> only be changed after an I2C_M_STOP flag, i.e after a STOP on the i2c bus.
> 
> The I2C_FUNC_PROTOCOL_MANGLING flag is added to the list of
> functionalities supported by the controller, except for the AMD NAVI
> i2c controller which uses its own xfer() function and is left untouched.

...

>  	ret = -EIO;
>  
> +done:
> +	return ret;

I don't see the point of keeping this label anymore. Is there a followup
that addresses this?

> +static inline bool
> +i2c_dw_msg_is_valid(struct dw_i2c_dev *dev, const struct i2c_msg *msgs, size_t idx)
> +{
> +	/* The first message of a transaction is valid */
> +	if (!idx)
> +		return true;
> +
> +	/*
> +	 * We cannot change the target address during a transaction, so make
> +	 * sure the address is identical to the one of the previous message.
> +	 */
> +	if (msgs[idx - 1].addr != msgs[idx].addr) {
> +		dev_err(dev->dev, "invalid target address\n");
> +		return false;
> +	}
> +
> +	return true;
> +}

Hmm... I would do it in the nested conditionals if nothing comes between
the lines in the future.

static inline bool
i2c_dw_msg_is_valid(struct dw_i2c_dev *dev, const struct i2c_msg *msgs, size_t idx)
{
	/*
	 * We cannot change the target address during a transaction, so make
	 * sure the address of the sequential messages is identical to the one
	 * of the previous message.
	 */
	if (idx && (msgs[idx - 1].addr != msgs[idx].addr) {
		dev_err(dev->dev, "invalid target address\n");
		return false;
	}

	/*
	 * Addresses match. For the first message return true as it sets the
	 * address for the whole transaction.
	 */
	return true;
}

...

> +static int
> +i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
> +	struct i2c_msg *msgs_part;
> +	size_t cnt;
> +	int ret;
> +
> +	dev_dbg(dev->dev, "msgs: %d\n", num);
> +
> +	ACQUIRE(pm_runtime_active_auto_try, pm)(dev->dev);
> +	if (ACQUIRE_ERR(pm_runtime_active_auto_try, &pm))
> +		return -ENXIO;
> +
> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If the I2C_M_STOP is present in some the messages,
> +	 * we do one transaction for each part up to the STOP.
> +	 */
> +	for (msgs_part = msgs; msgs_part < msgs + num; msgs_part += cnt) {
> +		/*
> +		 * Count the messages in a transaction, up to a STOP
> +		 * or the end of the msgs.
> +		 */
> +		for (cnt = 1; ; cnt++) {
> +			if (!i2c_dw_msg_is_valid(dev, msgs_part, cnt - 1)) {
> +				ret = -EINVAL;
> +				goto done;

What about

				break;

> +			}
> +
> +			if ((msgs_part[cnt - 1].flags & I2C_M_STOP) ||
> +			    (msgs_part + cnt == msgs + num))
> +				break;
> +		}
		if (ret < 0)
			break;

?

The motivation is to avoid mixing auto ptr with goto style
(it's not recommended as per cleanup.h).

> +		/* transfer one part up to a STOP */
> +		ret = __i2c_dw_xfer_one_part(dev, msgs_part, cnt);
> +		if (ret < 0)
> +			break;
> +	}
> +
>  done:
>  	i2c_dw_release_lock(dev);
>  
> -	return ret;
> +	if (ret < 0)
> +		return ret;
> +	return num;
>  }

-- 
With Best Regards,
Andy Shevchenko



