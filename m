Return-Path: <linux-i2c+bounces-5924-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3C0964275
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 12:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FA7E1C219E6
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 10:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27C618D65D;
	Thu, 29 Aug 2024 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xe2ni663"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC822097;
	Thu, 29 Aug 2024 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929184; cv=none; b=abotxReKQi4XvlYJ3KGcohuziUfhUTsgXGpWK7Cs6ZOT/EkucVD52qCHAGTSFElSw+e3NP7u2oPTsZ89h6Eaom1BTbrPL9gOS0+xSUFcNg8Vge/UTsyAAnUe7B3Qe2jR00PGLcl1Mu3xgbmF1ob85iuvzG+p6iqGa8iC1V4871Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929184; c=relaxed/simple;
	bh=jXZDHzKBB72ifpzF16YMfRYFr+9T5f/n/snDNmchpIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSjSQ3xTWJ5bqLVl7p1lG6NW+BJhJ6mQ1iIRK1CwugMPUcdJ4i7PIeBGkk5T6J3QSrUcG8vpMB/FQZ/Wb/CpDbdKaEhKoBydF8na7AzZsIJjxwqtTneUCoNYTZvdR6oyZiIzOS8Bdx+na+HOi08x6kdC8yEyPJV0KRmXgpjy+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xe2ni663; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724929183; x=1756465183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jXZDHzKBB72ifpzF16YMfRYFr+9T5f/n/snDNmchpIU=;
  b=Xe2ni663lNQXrRownrVAshkueqKUNCMGViRsGbQlDVjpUfKYaOV99ZI1
   gnwkL9NfeuthO2nD7GyZfe2Tg0lrL/JO3r5N5b5+ZqKNmLREwcfHDQWW2
   ua0Cal8JV/q7B8vxFLnn5j9cell4GidapsSL/LacTj0ZNN9xk4PJd8ANP
   sFtpb0i24hqtaox6U+yH/TPe0XnU4J4bAvIz3aZgsDFSgNNQdv4VrzgXH
   Qsc85pwQWzpzu2P4zuFI+I5rOE+0y8l943BSCnpBUwp40/40bzEncR/Iq
   EMAOzZ6J0aKBqvWCqc3K6j2K87HiJ3xAia1oFMfNLUEXbN6pBkU3HRZWk
   g==;
X-CSE-ConnectionGUID: lHlY1/I0R+eXikHF8plo6g==
X-CSE-MsgGUID: h2BlsB4GRESoydlJld48ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23029282"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23029282"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:59:43 -0700
X-CSE-ConnectionGUID: /o0N/svPTkyS9eBnyjyQvQ==
X-CSE-MsgGUID: yfhLpQlGTaCvODyMMSnOZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="68318556"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:59:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjcsJ-00000002yEq-1X7x;
	Thu, 29 Aug 2024 13:59:35 +0300
Date: Thu, 29 Aug 2024 13:59:35 +0300
From: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: andi.shyti@kernel.org, jarkko.nikula@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, rmk+kernel@armlinux.org.uk, andrew@lunn.ch,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	mengyuanlou@net-swift.com, duanqiangwen@net-swift.com,
	stable@vger.kernel.org
Subject: Re: [PATCH net 3/3] i2c: designware: support hardware lock for
 Wangxun 10Gb NIC
Message-ID: <ZtBUlxDWTfwpzm5V@smile.fi.intel.com>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
 <20240823030242.3083528-4-jiawenwu@trustnetic.com>
 <ZsiZALjnoUpb0H_I@smile.fi.intel.com>
 <02a901daf9f4$063e8cf0$12bba6d0$@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02a901daf9f4$063e8cf0$12bba6d0$@trustnetic.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 29, 2024 at 05:15:42PM +0800, Jiawen Wu wrote:
> On Fri, Aug 23, 2024 10:13 PM, Andy Shevchenko wrote:
> > On Fri, Aug 23, 2024 at 11:02:42AM +0800, Jiawen Wu wrote:

...

> > > +static int i2c_dw_txgbe_acquire_lock(struct dw_i2c_dev *dev)
> > > +{
> > > +	void __iomem *req_addr;
> > > +	u32 swsm;
> > > +	int i;
> > > +
> > > +	req_addr = dev->ext + I2C_DW_TXGBE_MNG_SW;
> > > +
> > > +	for (i = 0; i < I2C_DW_TXGBE_REQ_RETRY_CNT; i++) {
> > 
> > Retry loops much better in a form of
> > 
> > 	unsigned int retries = ...;
> > 	...
> > 	do {
> > 		...
> > 	} while (--retries);
> > 
> > BUT... see below.
> > 
> > > +		writel(I2C_DW_TXGBE_MNG_SW_SM, req_addr);
> > > +
> > > +		/* If we set the bit successfully then we got semaphore. */
> > > +		swsm = readl(req_addr);
> > > +		if (swsm & I2C_DW_TXGBE_MNG_SW_SM)
> > > +			break;
> > > +
> > > +		udelay(50);
> > 
> > So, can a macro from iopoll.h be utilised here? Why not?
> 
> I need to write the register first and then read it in this loop.
> It does not seem to apply to the macros in iopoll.h.

I don't see how does it prevent from using read_poll_timeout() macro.
You need to implement a body of the loop as a helper function that you supply
into macro as a parameter.

> > > +	}
> > > +
> > > +	if (i == I2C_DW_TXGBE_REQ_RETRY_CNT)
> > > +		return -ETIMEDOUT;
> > > +
> > > +	return 0;
> > > +}

-- 
With Best Regards,
Andy Shevchenko



