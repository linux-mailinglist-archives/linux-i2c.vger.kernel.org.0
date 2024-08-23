Return-Path: <linux-i2c+bounces-5747-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE5595CFD8
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 16:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94DD81F20FE9
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 14:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F47818BBA7;
	Fri, 23 Aug 2024 14:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfI0ilj5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F08185945;
	Fri, 23 Aug 2024 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724422453; cv=none; b=irfY679Pd33Bwe8uKtj2QmcpWMDZQewRCExqwW83CbcCoUedhonWh9k7HQIPEN4rEA4W/wFKyNvG4JBWYNI76Q3j1djJLXgj7KsjpU7UsTSCI3Dp9fpkXvSbwlxLWp6F6kMFrR/vgVYESY3YUu4APzG3AqZGTNnD37SaSAZi5/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724422453; c=relaxed/simple;
	bh=HE989/n9y2OsE2fm8mYlQJ34Hr3xyGpPU/aMiImPfuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kd+VZ9IyOxuTtIbJaOSEuUYQe9wCo8JSUhav+m8SrprANAj09v2Lt7Es97pYw/4FIpFOCnntE6C2xkAkQz0l5oaqzcCzctWEIR3Wi6I6GNZ9ZVApvIw5Z01DwqNRsyvp1WAWBufofV5+nyT7nDL1O82JNPYxNxRB0WErY6jY6Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfI0ilj5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724422452; x=1755958452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HE989/n9y2OsE2fm8mYlQJ34Hr3xyGpPU/aMiImPfuk=;
  b=mfI0ilj53xuEChyjMxQ2vUytkCHAUIh+hjr8fclOnYxNjJ+dzVttVnzg
   JmxddOlMlcqSc9wR11QjdQ24hINUmB45JuzWPZYWoY0uUM+s5faD4lJvv
   jpFjoOj3hbWX8lBR/P5a2ZR4ZU1eA9ouNXOGBmyTJoYEb+1j+a+q4nA3t
   JZMumvdOhTlY5Iw2DcY4t6pd5JR7qYLPdEqBYWvrpdfdMV6dF0Wkhxp31
   FXfjq/8wRPC5xf1W3yU8PK6b4bivM0K5PKDarRlpH/moU4rgRDhKCE4+f
   hOnTmkP5+V7EXbJoBjWQoS+yi6aaFz9DSuWpyGv5iBK2emAATQLcNi1PC
   w==;
X-CSE-ConnectionGUID: sq/1vpNFTd6q5Y3QLoR95Q==
X-CSE-MsgGUID: s3SfFZc3QFqfs7P7Mxi3Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40407650"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="40407650"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:14:11 -0700
X-CSE-ConnectionGUID: +1bb5Lu0StCSI5ypw4aPdQ==
X-CSE-MsgGUID: XHW89+I0SkuGXTYiUMqnmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="84983772"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:14:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shV3E-00000000ogh-0nIV;
	Fri, 23 Aug 2024 17:14:04 +0300
Date: Fri, 23 Aug 2024 17:14:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: andi.shyti@kernel.org, jarkko.nikula@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
	piotr.raczynski@intel.com, andrew@lunn.ch,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	mengyuanlou@net-swift.com, duanqiangwen@net-swift.com,
	stable@vger.kernel.org
Subject: Re: [PATCH net 1/3] net: txgbe: add IO address in I2C platform
 device data
Message-ID: <ZsiZK5x77MRAyJdK@smile.fi.intel.com>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
 <20240823030242.3083528-2-jiawenwu@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823030242.3083528-2-jiawenwu@trustnetic.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:02:40AM +0800, Jiawen Wu wrote:
> Consider the necessity of reading/writing the IO address to acquire and
> release the lock between software and firmware, add the IO address as
> the platform data to register I2C platform device.

...

> +#include <linux/platform_data/i2c-wx.h>

I don't like this. Can you provide a property for that or so?

-- 
With Best Regards,
Andy Shevchenko



