Return-Path: <linux-i2c+bounces-6237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFDD96D697
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 13:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BBD21C25594
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 11:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761B91990D0;
	Thu,  5 Sep 2024 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qk0lQP6T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C01990C1;
	Thu,  5 Sep 2024 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725534034; cv=none; b=JLMxjc5qPfHD5XTrUmUcmdpckDAE/D9t02icCJEbn3eljtXvwQcIhpgG2g6FdPFCeAy4/nc98hnwXPoYSKBepdYPMigvyMrCwGgDdCSvbyCS4e9idxA+HTbVMzYNISUGmqkF0szg7g1vxxPUAlXAbLViVylbY3vgcQhXc9ONgeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725534034; c=relaxed/simple;
	bh=+gSr0mV8+IFPh2fHLoHzzTIO+Wl2aNGvhbs477QpoPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaVcd7b8IK7tZc6EgmdUegTBYYehkBTQGQ3UVqFRHGwGeBLfslt87KZaSxeByYEuTMr8+7DWp8TKJXobMTV826VQHwUZq4eW2KLqIPYCJrIYZXG1RAk1jv6LzwC1Ijj2X70oTudNjkHdTY89X3IfCQ5yJ8Fcle5ZcZJiEhXBSmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qk0lQP6T; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725534033; x=1757070033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+gSr0mV8+IFPh2fHLoHzzTIO+Wl2aNGvhbs477QpoPM=;
  b=Qk0lQP6Tb4su+kDb6l11RxP5AWKqyd94ecl37o83MBdprKWt3Vd/oviQ
   tRPhhcih3cLa0r+XZOa0RHYJBJRKME5W5qHUWYNcZl58jGrFdXQGur4UN
   Fh24m4bP/PTFHh5Xu+GQ23OfFeovgJtW1kwwFha6o5kSc73upCIhw1jGD
   Ukg+gj8akcCj+R4KqdKZk0Bf0LgPyWsALSHL1EQFGiFAmflT2/jeaNu/o
   9xFaDNyWGOaeXRnI6iclD7bhu8QIndp/dX6nX2P2unMZ31QJxojADseJ1
   +72d8H8O0h4VWw9sSC33ebN+CcW9Bx4wWvfnZIg7RQAOwcEapFHynOoWl
   g==;
X-CSE-ConnectionGUID: GlXvOaQKQU6eun3O8qx05A==
X-CSE-MsgGUID: F5TzhyZWR9WbY0D0x82n/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="41718371"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="41718371"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 04:00:32 -0700
X-CSE-ConnectionGUID: idY47MK+SnSDEu19+XGEoA==
X-CSE-MsgGUID: XDdaonLXTFy2eGDKBv6DcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="70385933"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 04:00:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smADy-00000005MtU-3AFa;
	Thu, 05 Sep 2024 14:00:26 +0300
Date: Thu, 5 Sep 2024 14:00:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kimriver liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <ZtmPSqSwwarYDDJt@smile.fi.intel.com>
References: <20240905055753.2276-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905055753.2276-1-kimriver.liu@siengine.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 05, 2024 at 01:57:53PM +0800, kimriver liu wrote:
> From: "kimriver.liu" <kimriver.liu@siengine.com>

You forgot bumping patch version and adding a changelog.

-- 
With Best Regards,
Andy Shevchenko



