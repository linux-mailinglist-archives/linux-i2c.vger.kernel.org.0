Return-Path: <linux-i2c+bounces-11916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D2DB02431
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 20:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3529E1CA8203
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 18:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FB01E491B;
	Fri, 11 Jul 2025 18:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBvredS8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2967813B590;
	Fri, 11 Jul 2025 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752260250; cv=none; b=mYJ86kQPRN5yqy9TNeSZfToRNf/L0jW9jYT8bWJYOZ4bpw7T9T108RQta35V06G4VFWOIczj1IT+XkSyCell1MgNZDo61L9zZAZTAXARx0hTJ+xCVuQyCt+VYjBUq71syWUEMUdMOK2gIKxrghGV/+olfj6aCU3X1f0HGY7qYiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752260250; c=relaxed/simple;
	bh=1Gc88Na8gcluHywQcvviPDhvVUUkPoMZ9NE3iFFxsTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3eMeVW4okZxNPsOsVasCYT8ZUK8rjxyIq+ZstVd296VkfNc8sxTZDZ+O5IilvYJ545/JY/8qEbezSka1gdKWNAXILSYuF1QX6P9w95Tuxn6S+j25nZuHGr8N77gVWdyX4nd0WeYuTOM8HrYVZ/zfXGSQpB2nmQZ8beRK1oy1Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBvredS8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752260249; x=1783796249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Gc88Na8gcluHywQcvviPDhvVUUkPoMZ9NE3iFFxsTI=;
  b=lBvredS8jNDgBlrO5wqVC82ttdmj+u4wDi9DUu3Ec4DUT3MV9XZKj+L2
   SWGC8p4EDmZrs9ZRl3Mnt4TV5G+H3uWWTME/1h961nf4BvGBUTySeiIXP
   rzmXep6gQr36KgFYlzQaV07tdsrT++iIPbsAgv+fFBhDkd0ezzk+0VdBq
   Z4WAKRx0CX8+PfUCLAzFBhc9FD1FsYUFtg/YdS6FTrr+qAE8kp191afVG
   UotlP9xK3UVzl38KIAw0mkPhB/uuyZSDFDI1ZQ4Z1MU0O4etTY4iWKV6G
   P5hBMLnmt+2R2oqqON9i+MKjU30i+vonU+LW9LM7WUG+r5pMbkcymyD+b
   Q==;
X-CSE-ConnectionGUID: 6jT42kF/SfO03M4o1xriWA==
X-CSE-MsgGUID: BRWhG5wqQP6Oqx7tuH76+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66009060"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="66009060"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 11:57:29 -0700
X-CSE-ConnectionGUID: 3A+5pspgS4+KsV6bdhFhow==
X-CSE-MsgGUID: 6Yx/7JndQue2UoQSnaIVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="193632104"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Jul 2025 11:57:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8CE2E1A1; Fri, 11 Jul 2025 21:57:24 +0300 (EEST)
Date: Fri, 11 Jul 2025 21:57:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: wsa+renesas@sang-engineering.com, Jonathan.Cameron@huawei.com,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: busses: Use min() to improve code
Message-ID: <aHFelLqnfsuaeh2Q@black.fi.intel.com>
References: <20250709042347.550993-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709042347.550993-1-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jul 09, 2025 at 12:23:46PM +0800, Qianfeng Rong wrote:
> Use min() to reduce the code and improve its readability.
> 
> The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> was changed from int to u32, because the max parameter passed
> in is always greater than 0.

...

>  #include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/minmax.h>

Do not blindly add a new inclusion to the end of the list. The list as you may
notice even on this small context suggests that it's ordered. Please, keep
things in order.

Andi, if you don't mind, please fix this.

-- 
With Best Regards,
Andy Shevchenko



