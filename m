Return-Path: <linux-i2c+bounces-1652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6100F84B991
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 16:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 837511C24C1D
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66136133404;
	Tue,  6 Feb 2024 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNlkr+Kd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE55C133292
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 15:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707233309; cv=none; b=gp1TRoRUNeLbkJmEE+FDjh9oM1CHQO4e9msbpNcFrS+KtfLXW8CVzcC82dgCgNRLJU37K4WM+joVj2ZY60yEZqvQaFyMZVj7ewmP2QznsonqJG6qgsNZEUzX150lN6atXyRkhnNF+i+yAG9Km430YZ+gN0AZy1gNo463AvFfK3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707233309; c=relaxed/simple;
	bh=i18DyJR/Q0jhPwu8dnrbEe75svp0TGo4p5NbUs7GZfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRE/AGPgWyohf4OGSlkBnq329LmJ3dm0VtGTTg4GsO2PBvmCVntAid2+gW/V1Pbb20c0P7d7H3a96kwSYTrTt2h5k5V8W1VqeBhsU94205UaJ4L610cStRBoxkY4ie+9vLqbDyF36q4X1UImOJXG/SpGdR835ojZ0zWz6wJgudg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNlkr+Kd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707233307; x=1738769307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i18DyJR/Q0jhPwu8dnrbEe75svp0TGo4p5NbUs7GZfo=;
  b=KNlkr+Kd8QWcFEUNmC7YzYBUKDJfvwKPl9QgdaxEfFBniXVyUW2D+4OU
   AXN73csGFb2+kWG5qIshr2VX9GykQmGkGlTtk3GLprc7j1UTDy6ROQ85W
   /NHIzh2Oj3XNKL4v+xHEtb2NEPs/bmPLoRLWFE0XSqIISLXOcPxaz1YLT
   LIqM/eLaHmUioWI/tBTTF5u8dcJWTDUO0X4ETbWpgk9BfJh6DQ1Fdrrj9
   LuC+FRNKElQ/DZ6dHcjEc5CHCWiI+VbrSTjH/qE94ssO8kyBcDlwDSwUn
   oR2oW5j6JrAFgvaJAeU/ppkzc+ypiWoHdZ4UanmsFW04dFzrXYPbpbzeR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="657157"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="657157"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 07:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="909666931"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="909666931"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 07:28:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rXNMz-00000002NIL-0qiO;
	Tue, 06 Feb 2024 17:28:21 +0200
Date: Tue, 6 Feb 2024 17:28:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 9/9] i2c: designware: Implement generic polling mode
 code for Wangxun 10Gb NIC
Message-ID: <ZcJQFAa7Kspgb1En@smile.fi.intel.com>
References: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
 <20240206145158.227254-10-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240206145158.227254-10-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 06, 2024 at 04:51:58PM +0200, Jarkko Nikula wrote:
> I got an idea the i2c-designware should not need duplicated state
> machines for the interrupt and polling modes. The IP is practically the
> same and state transitions happens in response to the events that can be
> observed from the DW_IC_RAW_INTR_STAT register. Either by interrupts or
> by polling.
> 
> Another reasons are the interrupt mode is the most tested, has handling
> for special cases as well as transmit abort handling and those are
> missing from two polling mode quirks.
> 
> Patch implements a generic polling mode by using existing code for
> interrupt mode. This is done by moving event handling from the
> i2c_dw_isr() into a new i2c_dw_process_transfer() that will be called
> both from the i2c_dw_isr() and a polling loop.
> 
> Polling loop is implemented in a new i2c_dw_wait_transfer() that is
> shared between both modes. In interrupt mode it waits for the completion
> object as before. In polling mode both completion object and
> DW_IC_RAW_INTR_STAT are polled to determine completed transfer and state
> transitions.
> 
> Loop tries to save power by sleeping "stetson guessed" range between
> 3 and 25 µS which falls between 10 cycles of High-speed mode 3.4 Mb/s
> and Fast mode 400 kHz. With it the CPU usage was reduced under heavy
> Fast mode I2C transfer without much increase in total transfer time but
> otherwise no more effort has been put to optimize this.
> 
> I decided to convert the txgbe_i2c_dw_xfer_quirk() straight to generic
> polling mode code in this patch. It doesn't have HW dependent quirks
> like the amd_i2c_dw_xfer_quirk() does have and without users this patch
> is needless.

...

I believe even with a single point of out we may do better this one, see below.

> +static int i2c_dw_wait_transfer(struct dw_i2c_dev *dev)
> +{
> +	unsigned long timeout = dev->adapter.timeout;
> +	unsigned int stat;

> +	int ret = 0;

	int ret;

> +	if (!(dev->flags & ACCESS_POLLING)) {
> +		ret = wait_for_completion_timeout(&dev->cmd_complete,
> +						  timeout) ? 0 : -ETIMEDOUT;

		ret = wait_for_completion_timeout(&dev->cmd_complete, timeout);

> +	} else {
> +		timeout += jiffies;
> +		do {
> +			if (try_wait_for_completion(&dev->cmd_complete))
> +				goto out;

				break;

> +			stat = i2c_dw_read_clear_intrbits(dev);
> +			if (stat)
> +				i2c_dw_process_transfer(dev, stat);
> +			else
> +				/* Try save some power */
> +				usleep_range(3, 25);
> +		} while (time_before(jiffies, timeout));

> +		ret = ETIMEDOUT;

		ret = time_before(jiffies, timeout);

> +	}

> +out:

	if (ret)
		return 0;

	return -ETIMEDOUT;

> +	return ret;
> +}

This will make same error code for both branches without need to synchronise,
meaning better maintenance.

-- 
With Best Regards,
Andy Shevchenko



