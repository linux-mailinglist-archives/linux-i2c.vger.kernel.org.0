Return-Path: <linux-i2c+bounces-6870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BF697CB54
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 17:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEB91B23700
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 15:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FED1A01C1;
	Thu, 19 Sep 2024 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IS9VPAvb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AE41A0702;
	Thu, 19 Sep 2024 15:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758447; cv=none; b=W272Viw485Yo1+N9/zpcjDMCmequ7OdorS9NjtRLExZAcQduUJVH8Dy7gwUo3L9X0VX0odUhU1an/6mVZIQV/LhYg36D+Q4LTXfqhyuecXAICTMlo0DJGa4of59qDGXVPwJ8dyCmjeS5GJz6V0YEyiKi+8TW5PJY+SJFwVkCoWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758447; c=relaxed/simple;
	bh=1hq+R54sFJfLru6RgemPhymLSogzGWahdYblHai9E2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgKVFGuixZa6a61edjEFR1wCK0awQSjhMvjzju/wKGmgWw7+PBJV7ai1jGF/V12Lzi4IpvQxMm3lLAJV80d1U3eWiKnYRiWUDwNgUzbMcCVhAZ8ZCmiOcoigB35a3m8KgN4IWbhZPRNwzlflfYiRwOgOQc6gGoe/0958YkxRTQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IS9VPAvb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726758425; x=1758294425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1hq+R54sFJfLru6RgemPhymLSogzGWahdYblHai9E2k=;
  b=IS9VPAvb0mfoWrEdeZK7pdeRC3XFL0MLdgVENushg3oCVAPSAXFnFaxh
   wg2RllGF0OwUjY8QFTpXhvnHH4y83KzibseP7bzWqRaqvHChqaqFUyG9Y
   0bEkS6v9uNEm2x5K3EntziWLFh7AACJg+EI6ku+vw95jiZregnZEwOvJC
   t6bL88f46wBkIIns8Jh/wTkK5KSKxsioAdyhIES9hdKRY7s3RKgt/ypnN
   CSwMATsKUUZ5JotbZlBoRdhKWdkJiq72WlNtRWszw1fDvPEFuaEDn2S8G
   KXcF7cHr4UmmORCoRw2BorqnSS9rtEiah7E1SuE3H7VlqzqufEt1g61GY
   w==;
X-CSE-ConnectionGUID: BS2QTsRKR4C/eUaihX8BCA==
X-CSE-MsgGUID: P2Ve4LJLROSRvtDikOj03g==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25871426"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="25871426"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 08:07:00 -0700
X-CSE-ConnectionGUID: 11S0iFDnTrC+iK7+OJznMA==
X-CSE-MsgGUID: 1CPGrhlkStyWrx6P5TWJVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="69851403"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 08:06:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1srIkA-0000000AZE9-3dql;
	Thu, 19 Sep 2024 18:06:54 +0300
Date: Thu, 19 Sep 2024 18:06:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: hunter.yu@hj-micro.com
Cc: rafael@kernel.org, lenb@kernel.org, jarkko.nikula@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] ACPI: APD: Add clock frequency for HJMC01 I2C
 controller
Message-ID: <Zuw-DvvksYPXzkUp@smile.fi.intel.com>
References: <20240919062943.1551197-1-hunter.yu@hj-micro.com>
 <20240919062943.1551197-2-hunter.yu@hj-micro.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919062943.1551197-2-hunter.yu@hj-micro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 19, 2024 at 02:29:42PM +0800, hunter.yu@hj-micro.com wrote:
> From: "hunter.yu" <hunter.yu@hj-micro.com>
> 
> I2C clock frequency for HJMC01 is 200M, define a new ACPI
> HID for it.

...

>  	{ "HISI02A3", APD_ADDR(hip08_lite_i2c_desc) },
>  	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
>  	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
> +	{ "HJMC3001", APD_ADDR(hjmc_i2c_desc) },

Please, keep it ordered.

-- 
With Best Regards,
Andy Shevchenko



