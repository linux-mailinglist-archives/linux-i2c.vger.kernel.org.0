Return-Path: <linux-i2c+bounces-6391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A99A97131D
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 11:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8A9B1F24546
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 09:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C6A1B2ED0;
	Mon,  9 Sep 2024 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3O91yJF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAEB1B2514;
	Mon,  9 Sep 2024 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725873404; cv=none; b=k36OQFOLr9f/BoxAKXg75VMHN5YiMhIgTXbY52OPY8v8C3xZiHen19RgcqjLyHRxV83DOr3IyGy8ShMDXX05WUoYEKuPb5C5XIsP09qCrPF/2KduaecpEwSd8ISq7BQ1gsBwSJCJiefyXiNOfxV3x+k2gzdm8tdqiADUjJaKzzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725873404; c=relaxed/simple;
	bh=wjUZq5eoFguMsvAKAhsl2BUFabxRCU1j+kKbwJn1ifY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxMImlo1W9CDB1FxFOAWIQXVoqeXTp48tqehGC6GmeG7/rM1Er4oSImDtM1iJKL7egVH7lKOLEwJIecFDJO7OlaKIE26uZGyfpRr2L/DoanT0ehH34+wwMg3qP69s8MXenif1SUJUVdmqEjGD8RbB7I5YYCqKD9vG877OBdly1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3O91yJF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725873402; x=1757409402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wjUZq5eoFguMsvAKAhsl2BUFabxRCU1j+kKbwJn1ifY=;
  b=V3O91yJFHQDx06zz0T4ItEUGzrrFbWljVqP/7gg0eMVUgziLYi84Hkxj
   /Vj3/p4h9oOioEjge64UMwV/4u+wUEFuK4/cI4jaxExeLJ+hwsZiM7qF9
   1Ra6mmw1JhjBu7ekwHjI3YI5tNr6pHY5lOP1JFoLM3qOkigshCqzrHLJg
   MltqykAne5HJOb8LUXin9wmb/FsanfFvC2jhUmS8uWuZj0OkYDLZzTbY5
   hvnCtPlMlNKr4JP+DyMmkeA/PHKwv+G/E4YVDIusRYDtlcaSU5kN6ZVES
   /MMNLcLvUDfLBZ7wfzwJGdD04FGEo8TjwOIZDTdJxnDJEmpz5TxbPsam5
   Q==;
X-CSE-ConnectionGUID: zAEJWMSSQKWFHuE6irmU2A==
X-CSE-MsgGUID: +uomp7oFQGeDb8WzwTBxqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="42036565"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="42036565"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 02:16:36 -0700
X-CSE-ConnectionGUID: JSXdFJ3LSkGARy1PxNojig==
X-CSE-MsgGUID: YA27vvciRo+Ma5L1Plrn6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="67352252"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 02:16:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1snaVa-00000006jKt-2UfC;
	Mon, 09 Sep 2024 12:16:30 +0300
Date: Mon, 9 Sep 2024 12:16:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rong Qianfeng <rongqianfeng@vivo.com>, biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v4 3/3] i2c: jz4780: Use dev_err_probe()
Message-ID: <Zt687oWU3I1B-pDI@smile.fi.intel.com>
References: <20240827034841.4121-1-rongqianfeng@vivo.com>
 <20240827034841.4121-4-rongqianfeng@vivo.com>
 <aqigucchbgq2tblnu7gdkpiw35ezqbmgbl6a5ptzzezngnihsi@iny4xyzkjyz4>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqigucchbgq2tblnu7gdkpiw35ezqbmgbl6a5ptzzezngnihsi@iny4xyzkjyz4>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 09, 2024 at 10:23:30AM +0200, Andi Shyti wrote:
> On Tue, Aug 27, 2024 at 11:48:41AM GMT, Rong Qianfeng wrote:

...

> > +	struct device *dev = &pdev->dev;
> 
> I'm not a big fan of this change. There is not much gain in
> polluting git bisect in order to shorten pdev->dev to a single
> dev.
> 
> However, I like the /dev_err/dev_err_probe/.
> 
> I will take the first two patches from this series, but I will
> leave this if anyone else has a stronger opinion. If you want,
> you can send just this one patch with just the dev_err_probe()
> change.

Usually I combined this with conversion to dev_err_probe() et al.
so it makes new lines a bit shorter and hence readability a bit better.
On its own it's indeed questionable change.

-- 
With Best Regards,
Andy Shevchenko



