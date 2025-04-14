Return-Path: <linux-i2c+bounces-10315-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DEEA87842
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 08:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4546E7A7CB1
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 06:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDE51B0412;
	Mon, 14 Apr 2025 06:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvAUGxjq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8E21A2630;
	Mon, 14 Apr 2025 06:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744613728; cv=none; b=Skw3cJ6Xabay2lN4E29J11XJQh6yDrxjqg5hTe3rn4LFxnas1ADvq1uK+KDuQhQX3507nCzsZE0FsRKo1i6x3SNy17hiPf29ZBUagP7T1DmRqJqc1jDahIg6RQ106oBXF/l4jSL9t6Jz2Wy2oV/lCahFGZ9ascnLsllIPnq2dg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744613728; c=relaxed/simple;
	bh=k7dhkveoyFwvi7/tUvCHIPEyndab2IDG85JIg/N+H5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCGxknB0DMOAVD5dWO96S7ASsCU2xZB4ZKtaxb/2SNu+g5oflOM1h00fr6Ijm4vr2DxPa0NxBJ/y8Sqll1QUow3xQl7IgL1x0r2IxqPADWF/kKz7S/EW3xPC288SpexDIURWaAdoNtG5MHP9cNKs1M48b01g5+CT90A+s7/d0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvAUGxjq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744613727; x=1776149727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k7dhkveoyFwvi7/tUvCHIPEyndab2IDG85JIg/N+H5E=;
  b=jvAUGxjqHv+bZ2e+mvxzFJq9Pq+Ub4s/7+HDxqDALH/Di1zljlrSHK1w
   tO6UKM4Ngne4vD1Na0+Syz/v1Rx2Is84tetstuWi8ds9YkmoNEC7RDg65
   HCyPWiDzu9iP/Jjmz/XVN7dm/oSx/BHFKxf9Kb0AXjZhmq2+JglNuTdPh
   5g+eeZbRBqnghjtaw49R8QeGn870mItA2CgRe5YPeLixz9gLrx9A7K63Q
   7duIAUTCFQSNikFbdeHfDUJ45HcEv4ckRyY5QmE1x8XGTHpqkriYaNM+/
   sLy/W1iZZLCzPOGPZZiu16TB9l31FQWn0tL9BBvRB2iAwffXA9hHv42ou
   A==;
X-CSE-ConnectionGUID: DiLU1NRgTrudxHXc8AaIIQ==
X-CSE-MsgGUID: e96YyGlzQqyCWbr9ugRk/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45952058"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="45952058"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:55:22 -0700
X-CSE-ConnectionGUID: WNE0w/XOTly35i3ezIIVjg==
X-CSE-MsgGUID: OLhFZRTMRo2sNarFDbrQNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="133839425"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:55:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4Diu-0000000C9le-3zxa;
	Mon, 14 Apr 2025 09:55:16 +0300
Date: Mon, 14 Apr 2025 09:55:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: ende.tan@starfivetech.com
Cc: linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, endeneer@gmail.com
Subject: Re: [v2,1/1] i2c: designware: Add SMBus Quick Command support
Message-ID: <Z_yxVJVc69ljaDZe@smile.fi.intel.com>
References: <20250412093414.39351-1-ende.tan@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412093414.39351-1-ende.tan@starfivetech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Apr 12, 2025 at 05:34:14PM +0800, ende.tan@starfivetech.com wrote:
> From: Tan En De <ende.tan@starfivetech.com>
> 
> Add support for SMBus Quick Read and Quick Write commands.

it's interesting how you made a versioning. Just run
`git format-patch -v<X>...` where <X> is the number of version you want,
it will make it properly in the Subject.

...

> +	/* i2c-core-smbus.c: Only I2C_SMBUS_QUICK has msg[0].len = 0 */

Please, remove filenames from the code, better to refer to the actual functions
as func(). This helps also to grep for all usages in case of renaming.

...

> +		/* i2c-core-smbus.c: Only I2C_SMBUS_QUICK has msg[0].len = 0 */

Ditto.

...

> +			regmap_write(
> +				dev->map, DW_IC_DATA_CMD,

Something wrong with the indentation. And you have plenty of room on the
previous line.

> +				*buf | DW_IC_DATA_CMD_STOP |
> +				((msgs[dev->msg_write_idx].flags & I2C_M_RD) ?
> +				DW_IC_DATA_CMD_CMD : 0)
> +			);

...

> -	dev->functionality = I2C_FUNC_10BIT_ADDR | DW_IC_DEFAULT_FUNCTIONALITY;
> +	dev->functionality = I2C_FUNC_10BIT_ADDR |
> +			     I2C_FUNC_SMBUS_QUICK |
> +			     DW_IC_DEFAULT_FUNCTIONALITY;

Ditto.

-- 
With Best Regards,
Andy Shevchenko



