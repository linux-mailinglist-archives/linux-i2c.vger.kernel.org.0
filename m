Return-Path: <linux-i2c+bounces-13948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90354C2B1A9
	for <lists+linux-i2c@lfdr.de>; Mon, 03 Nov 2025 11:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1539E344ACF
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Nov 2025 10:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BF62FF652;
	Mon,  3 Nov 2025 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUWuUlCo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840772FE571;
	Mon,  3 Nov 2025 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166359; cv=none; b=koRrwx/M4rMwpFIVGjoyOoLzVakQSfaX1VfLnyhDRAJcoLf0DMl+Auq1Ubhq0WA35XjvaX+ZsR3lixQCiLoV4+RypQMNbkmttvTRSaS/XFNjaZAdRoexZd/2ZVJWU5oEkPbOMVFY4zfwJ5oJ29J3PSOEs8imzJRoR28U7Dy31+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166359; c=relaxed/simple;
	bh=CLkRW+K6EonTnm3JAoeOcnWGUZYBkAwjcxjTvnIEpj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbDjTdOXZ9H48LX6d0MQd+PbDUOjX0VRSf9DqCXFWQvkfDjI8OX9uJ0OD8SEqkGuclt0HP0PeKZT26s8fs7MN6Rhy9e3u++lD6c151lwO/nghE3dJpPrWTDTyLlbLp7eFJGL3NvG8NSqstbuCblpzlD6KA6g+MbadS67U7VCxyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUWuUlCo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762166358; x=1793702358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CLkRW+K6EonTnm3JAoeOcnWGUZYBkAwjcxjTvnIEpj4=;
  b=RUWuUlCoFDvbzniEK/1oFOkwyCq1RV9WJy76c0cXJ6aLYjNB9rKpj/bd
   F5GAZUMCo1sKCDS39MTLPtzIrTQ/AeLaxY9kyfFGJbn+YA2DoY9faUopt
   r4eVkVx2Yi+KKE6/fygskn8c9UDmQqU0K+6O2u9H/XIrreg4rCnNwQD0O
   1cbD2HUPUCFEtb5VgwOHdijGsApZuyM9Nkx5ftubu06JTqz4SL+CijUPk
   42HdGon0v1P8rTKUFqxrQsr2Fk5/jonnMQ+CpTDkKsmuASSF9xB7cKPCF
   Wek0+E8JMhwgQpN/JeKBEUPF9QfxxkU21ME6pt0ck4SRQyL6+ne7eOlUb
   A==;
X-CSE-ConnectionGUID: oHta70IISNGsIrp4t1axyw==
X-CSE-MsgGUID: fvg559F/SJuQL0XppzSy7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="51808503"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="51808503"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 02:39:17 -0800
X-CSE-ConnectionGUID: 6XG+0mW8R4WKmyc4dJ6Uig==
X-CSE-MsgGUID: P+4yL3FORJa64CIrV/+Jcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="186982383"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 03 Nov 2025 02:39:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0C89395; Mon, 03 Nov 2025 11:39:08 +0100 (CET)
Date: Mon, 3 Nov 2025 11:39:08 +0100
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
Subject: Re: [PATCH v2 4/5] i2c: designware: Implement I2C_M_STOP support
Message-ID: <20251103103908.GF2912318@black.igk.intel.com>
References: <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-4-90416874fcc0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031-i2c-dw-v2-4-90416874fcc0@bootlin.com>

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

I2C controller

> controller which uses its own xfer() function and is left untouched.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 103 ++++++++++++++++++++---------
>  1 file changed, 70 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index ec4fc2708d03..da1963d25def 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -431,7 +431,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  	struct i2c_msg *msgs = dev->msgs;
>  	u32 intr_mask;
>  	int tx_limit, rx_limit;
> -	u32 addr = msgs[dev->msg_write_idx].addr;
>  	u32 buf_len = dev->tx_buf_len;
>  	u8 *buf = dev->tx_buf;
>  	bool need_restart = false;
> @@ -442,18 +441,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  	for (; dev->msg_write_idx < dev->msgs_num; dev->msg_write_idx++) {
>  		u32 flags = msgs[dev->msg_write_idx].flags;
>  
> -		/*
> -		 * If target address has changed, we need to
> -		 * reprogram the target address in the I2C
> -		 * adapter when we are done with this transfer.
> -		 */
> -		if (msgs[dev->msg_write_idx].addr != addr) {
> -			dev_err(dev->dev,
> -				"%s: invalid target address\n", __func__);
> -			dev->msg_err = -EINVAL;
> -			break;
> -		}
> -
>  		if (!(dev->status & STATUS_WRITE_IN_PROGRESS)) {
>  			/* new i2c_msg */
>  			buf = msgs[dev->msg_write_idx].buf;
> @@ -801,26 +788,15 @@ static int i2c_dw_wait_transfer(struct dw_i2c_dev *dev)
>  }
>  
>  /*
> - * Prepare controller for a transaction and call i2c_dw_xfer_msg.
> + * Prepare controller for a transaction, start the transfer of the msgs
> + * and wait for completion.
> + * Caller must hold the device lock.
>   */
>  static int
> -i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> +__i2c_dw_xfer_unlocked(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
>  {
> -	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
>  	int ret;
>  
> -	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
> -
> -	pm_runtime_get_sync(dev->dev);
> -
> -	switch (dev->flags & MODEL_MASK) {
> -	case MODEL_AMD_NAVI_GPU:
> -		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
> -		goto done_nolock;
> -	default:
> -		break;
> -	}
> -
>  	reinit_completion(&dev->cmd_complete);
>  	dev->msgs = msgs;
>  	dev->msgs_num = num;
> @@ -832,10 +808,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  	dev->abort_source = 0;
>  	dev->rx_outstanding = 0;
>  
> -	ret = i2c_dw_acquire_lock(dev);
> -	if (ret)
> -		goto done_nolock;
> -
>  	ret = i2c_dw_wait_bus_not_busy(dev);
>  	if (ret < 0)
>  		goto done;
> @@ -896,13 +868,75 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  
>  	ret = -EIO;
>  
> +done:
> +	return ret;
> +}
> +
> +static int
> +i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)

Typically if you have

i2c_dw_xfer()
i2c_dw_xfer_unlocked()

The only difference is that the former call the latter with lock held.
However, this is not the case here which is confusing.

I suggest move the lookup to be part of the _unlocked() variant.

While there, can we use size_t with the num parameter.

> +{
> +	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
> +	struct i2c_msg *msg;
> +	int ret, cnt;
> +
> +	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
> +
> +	pm_runtime_get_sync(dev->dev);
> +
> +	switch (dev->flags & MODEL_MASK) {
> +	case MODEL_AMD_NAVI_GPU:
> +		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
> +		goto done_nolock;

Not really problem of this patch but I'm sure there is cleaner way to deal
with this. I mean first of all we don't wan't to differentiate here what
model this is. Instead we can look for a "quirks" based on dev->flags.

Secondly goto inside switch is confusing too.

This can be better written like:

if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
	...
}

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

This can be

	break;

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
>  
>  static const struct i2c_algorithm i2c_dw_algo = {
> @@ -920,6 +954,9 @@ void i2c_dw_configure_master(struct dw_i2c_dev *dev)
>  
>  	dev->functionality = I2C_FUNC_10BIT_ADDR | DW_IC_DEFAULT_FUNCTIONALITY;
>  
> +	if ((dev->flags & MODEL_MASK) != MODEL_AMD_NAVI_GPU)
> +		dev->functionality |= I2C_FUNC_PROTOCOL_MANGLING;
> +
>  	dev->master_cfg = DW_IC_CON_MASTER | DW_IC_CON_SLAVE_DISABLE |
>  			  DW_IC_CON_RESTART_EN;
>  
> 
> -- 
> 2.51.1

