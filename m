Return-Path: <linux-i2c+bounces-6314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0B396F3AA
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 13:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55C471C24438
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 11:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC411CCB57;
	Fri,  6 Sep 2024 11:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggd+jRVv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A664B1CB52A;
	Fri,  6 Sep 2024 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623535; cv=none; b=qlh+5zkNxVAFBVepCWB1RVqUrD/iNxRdk/t2r0UUfB+/jhQ/wfaTnCECJL2CoE7WTou8OhKkiXBqw8nQ7pK76rxC7o/nhAxgrYaQoEss7mHENZVDD7RkjR9vdFaFQqaXwQpFxXaSewhT7QO6rllHzw8X381q4FtHEDdAgJgW+hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623535; c=relaxed/simple;
	bh=2f3/nOBHkWEXU5xICQ9uAX6+MKLRFa47tYxd7HHtQvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qon6R6/OlerdzYR59v0JnBGYnuLbKkO0jf2FEEZubkQwFMdUt8kKzOppbgjMAGZ3RpDBRw+TJ8BYFHCRUwNgeexk4ncOIltmwLx77r5wAN/RIyZQDkKHLc3TfRxPWbuisqZGHOvHB9d+AJ3in9wbLh6Jf6oMsOtNgCrmhnUrct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggd+jRVv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725623535; x=1757159535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2f3/nOBHkWEXU5xICQ9uAX6+MKLRFa47tYxd7HHtQvk=;
  b=ggd+jRVvlk5lXols4dHegP2joAB84+r/OEt9bLRmdMkMTkCIySPUJ5VP
   /1oEj8b/QRIb0xTdPLAVECOK9AvT2jVA/Ai172HFGX1NQiIo9UI95UBIm
   k2Ch6xvvHpDjsqwVX6gzjCuNYV4lKGSvbiCk5CyFGR3Bnq3vcEvVXurMi
   mWU6gSNDg63CjMfrXtlkRbjc752QVeGNMQXFG7LBA06jsEam7lFDNRdzV
   PaOFvzu5JxWObxhY/ZISt/7ap0FpANTZRBZWpSCTfQChsPQ+8SwKzVJiH
   3HjZRynVdpbors3NmfTrXAvtzhtGD0Dy4Sh6jK7AhPVCKuu4CO9jdCvu6
   g==;
X-CSE-ConnectionGUID: NPM5O7DKSeuVIod1RhxRkw==
X-CSE-MsgGUID: Xjn6GVscQKimM//pwF2ohg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24489370"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="24489370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:52:15 -0700
X-CSE-ConnectionGUID: uVyfWXGKRzuS7Sok8KO6Aw==
X-CSE-MsgGUID: /STYDR5WQRadRnFUJ3C4mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70350132"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:52:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smXVZ-00000005m5L-3IC3;
	Fri, 06 Sep 2024 14:52:09 +0300
Date: Fri, 6 Sep 2024 14:52:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <Ztrs6bA7gfSCl4e7@smile.fi.intel.com>
References: <20240906074731.3064-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906074731.3064-1-kimriver.liu@siengine.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 06, 2024 at 03:47:31PM +0800, Kimriver Liu wrote:
> It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
> IC_ENABLE is already disabled.
> 
> Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
> holding SCL low. If ENABLE bit is disabled, the software need
> enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.

This is *still* version 1!

-- 
With Best Regards,
Andy Shevchenko



