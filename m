Return-Path: <linux-i2c+bounces-15082-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35158D15438
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 21:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE4BC300A511
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 20:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11AC33F8CE;
	Mon, 12 Jan 2026 20:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxC1bIIB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8A134321A;
	Mon, 12 Jan 2026 20:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250215; cv=none; b=u/kBifUQbsomXBIn26A+EI/m9W3S43mjJgqWu8GxJrJ3ryfIrrFXZWr8LAEFOckvXu1FXcabl+RPkzpzN1KIW8idgtGk1x4rHwFXCrJYR48eIGD6tbWBE44D8KwhZYIMB64kSDXlpdvZ16sERY0wnPQIqh4rTAGWEX81n8+MB94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250215; c=relaxed/simple;
	bh=roZIE+R8HkWJJPpTh0p9OPAlG0vpl4AdvMaCv6FT9A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pndlDGLzbJXGvM1pYlNFyBgr/whRxf/DC23vCgKzvlXZ6ZmTvFBnCRO+nzgd6cG3K+MK/dJMvuXZ4xy6nNPXJbVitVEarI3px+sTLqt7slcMaZ25yeKhYnZfpgWQSgW9ar3estU42hpiFI4fOMRPDPjsm+mAFtpV4vYi2z98S6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxC1bIIB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768250214; x=1799786214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=roZIE+R8HkWJJPpTh0p9OPAlG0vpl4AdvMaCv6FT9A8=;
  b=MxC1bIIBEmCM5U2705ndaDWSlqP23KbJtHEzW0pT08YLry82vTm8iXbg
   RRyrIM/+SOLCf28b+jkyAHM+7KlARW0VYMWaMKiLVQvulBOrTsItZZjWf
   MgcYH39b+cR1IuES3dZfjTXPBS+J6t8j1b0qpfbOyEmtIJnUGRD0tGZmT
   8xZe5QYxyrPfvUFVIbQmUxVjTqr97AYmkKz3izWQwx4W2T0DVOGlX9v9Y
   FtnIWZ2JdVEYdMfat+uKzvbhZBuY+gq9IGcGlyqg2iXgNGz485WimbzhO
   S/L81dUy6APbk17efazlp3VmotB58rBW+/a6GWYGFS3NEQMo+rOgEiLw6
   w==;
X-CSE-ConnectionGUID: fvnB+206TfuTJ/kKIO4Mpg==
X-CSE-MsgGUID: +wDJmiODQw+Uu+/bOiQyLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73383383"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="73383383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 12:36:54 -0800
X-CSE-ConnectionGUID: V53gA/8VT/ahBML4KiF4fA==
X-CSE-MsgGUID: 8NSLRkxFTVaYuY5xEPgLOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204096670"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.37])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 12:36:52 -0800
Date: Mon, 12 Jan 2026 22:36:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 2/2] i2c: mlxbf: Use HZ_PER_KHZ in the driver
Message-ID: <aWVbYYusNh_q_91o@smile.fi.intel.com>
References: <20260112135603.4150952-3-andriy.shevchenko@linux.intel.com>
 <202601130414.VJyCNWzI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601130414.VJyCNWzI-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 13, 2026 at 04:33:04AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build errors:

Ah, okay, this needs to be based on the series that adds HZ_PER_GHZ as it
provides the needed header inclusion.

-- 
With Best Regards,
Andy Shevchenko



