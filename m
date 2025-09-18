Return-Path: <linux-i2c+bounces-13055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9F5B86965
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 20:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6313F17A4D6
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 18:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9442D9484;
	Thu, 18 Sep 2025 18:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NaXnqum4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC53A28DB54
	for <linux-i2c@vger.kernel.org>; Thu, 18 Sep 2025 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758221462; cv=none; b=lcQtogkeZ8gjUTHrzRbBtccDcW0QchszwAfFCQARMXjtmj9u6iCYxLdXH6B60mMbPqEUJMh23qM11XI2gSfdRK78TD8Mp1Krbtl0k3beUiLruKIG2zRrkLIELvLSGp/YS7rNDD6sYhtI5070OV6em2UaHmxP4qWToXdXghrqXo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758221462; c=relaxed/simple;
	bh=U9qVovcPz2T5ZvS7gFaHrgw4GHywgZtBD8sZ0cSnEM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1MTKIWiIHfDw4kwlBLqrhm9bWbkX2k/wVomDYP7aCd5oJMvuWyeHKVRpOyOa1WkmR9TH+c3bDaT1/U7vh9MxQf3Sj5SpSzTYbXhhzfcopRkA5Ql6RuL3Orp2KhPCcT8+7Vsmb9ReqR0ifd/GZqmn/l9B7AtB+LS7WUVsxP0lWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NaXnqum4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758221461; x=1789757461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U9qVovcPz2T5ZvS7gFaHrgw4GHywgZtBD8sZ0cSnEM4=;
  b=NaXnqum4xLScYWf5NcSqq1+p+mzUPDkTye1uSpi1kU2acIJrKGNGWoQH
   iFdEs/XBc+0iy6Ej1rXs7LdM+IRRkZN7ggKXmm57JIjCGvf7YAbse4dhZ
   kUUdjpJSj0Veel9fw8kUhEEI0cYe0whfDdBUZtC3j0OfKFhxe9Or1UwBu
   ZHOFElG1uIbrDZI3PCTJcXoifXOsOOM5zAw8hvOdL2QdWV5y04Md+ISyD
   AooIbywmlMzDr3SivXUsKXeqADYSyax1JhXK8J1tTqvgCGFrrNbgfjgwi
   UEkJLsGg9uKgc9bsHXzgGBSeb3BfVM+RPHBYs3SKkHXgnNu9G+qScGcMm
   w==;
X-CSE-ConnectionGUID: VVpJE8EOTWOplwoHP3gpNA==
X-CSE-MsgGUID: EqeMVKLTQxmSj0HxRD3fPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="64384761"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="64384761"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 11:51:00 -0700
X-CSE-ConnectionGUID: SLv/r2o7RDauk+7R/PSMgA==
X-CSE-MsgGUID: llhBE3ikRkOtSEBKHT0pEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="176071317"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 11:50:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uzJia-00000004ATp-14Tp;
	Thu, 18 Sep 2025 21:50:56 +0300
Date: Thu, 18 Sep 2025 21:50:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 3/3] i2c: designware: Turn models back to enumerated
 values
Message-ID: <aMxUjzuDnLKRkHva@smile.fi.intel.com>
References: <20250918160341.39b66013@endymion>
 <20250918161301.5405b709@endymion>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918161301.5405b709@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 18, 2025 at 04:13:01PM +0200, Jean Delvare wrote:
> There are 4 flag bits reserved to store the device model. All
> accesses to this information is properly masked with MODEL_MASK to
> extract only these bits and compare them with a given model value.
> 
> However the model definitions isn't an enumeration as you would
> expect. Instead each model uses a separate flag, meaning that the
> reserved space is already exhausted with the 4 models which have been
> defined so far.
> 
> The error seems to originate from commit a5df4c14b9a9 ("i2c:
> designware: Switch header to use BIT() and GENMASK()") where:
> 
> define MODEL_MSCC_OCELOT      0x00000100
> define MODEL_BAIKAL_BT1       0x00000200
> 
> was erroneously converted to:

I don't think "erroneously" is correct word here. The code before that commit
as you mentioned starts with a bit set, rather than from 0. I would argue that
the intention was to use a bitmask instead of plain number.

> define MODEL_MSCC_OCELOT      BIT(8)
> define MODEL_BAIKAL_BT1       BIT(9)
> 
> While numerically equivalent, conceptually it wasn't, and it caused
> the models added later to get bit-based definitions instead of
> continuing with the next enumerated value (0x00000300).
> 
> Turn back these definitions to enumerated values to clear the
> confusion, avoid future mistakes, and free some space for more models
> to be supported in the future.

...

> -#define MODEL_MSCC_OCELOT			BIT(8)
> -#define MODEL_BAIKAL_BT1			BIT(9)
> -#define MODEL_AMD_NAVI_GPU			BIT(10)
> -#define MODEL_WANGXUN_SP			BIT(11)
> +#define MODEL_MSCC_OCELOT			(1 << 8)
> +#define MODEL_BAIKAL_BT1			(2 << 8)
> +#define MODEL_AMD_NAVI_GPU			(3 << 8)
> +#define MODEL_WANGXUN_SP			(4 << 8)
>  #define MODEL_MASK				GENMASK(11, 8)

Taking above into consideration, why can't we start them from 0?

-- 
With Best Regards,
Andy Shevchenko



