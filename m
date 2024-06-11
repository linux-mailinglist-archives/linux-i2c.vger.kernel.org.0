Return-Path: <linux-i2c+bounces-3979-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FC1903C2D
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 14:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C069EB21DF1
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 12:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EA917C21E;
	Tue, 11 Jun 2024 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnED1n3G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E44C17C20E;
	Tue, 11 Jun 2024 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718110159; cv=none; b=gPxaS4qxqabGxm9DJj/2XaQ5M85nUmmFEp1yiwLPu7mPzrj9p+1t9yF6+dnnNh6Ex2tS75lZ6xKI8tMAaoehXR7v0pCX30zk7ArlAMsvSz5EIQ2uU22HjN1+vxMKJtyNqsKXi1N4kccHvDp1iql/qJlwXz/hUGz5mTwB938b/Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718110159; c=relaxed/simple;
	bh=+QxKwaQcofH/vz7EI40+6zzWU5vWLDbTcmb2UoPBdts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4hvdW1XlA0rEa+ztlvC31l/iuKjQ/EsBurfMW4mBPrLQKRp8ySpPN9Vf8CDukI9Qa/SEg6+2MnuToJyW+fvuxn4Z6m3DarV3bF3a7fG88bDc/KMMqleBtiHAWqDwBvERIAo7ayikwuQ0azopljhd0IpTvjip50cH72cAiX1QP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UnED1n3G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718110158; x=1749646158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+QxKwaQcofH/vz7EI40+6zzWU5vWLDbTcmb2UoPBdts=;
  b=UnED1n3GEhxRvqM8ZbnAhjPoOQGh4kAqhkUTpo5GzSd+/T0OkY6QCTju
   2mlYOmSOieOfvV7k0k1cwOR2jHW7AuRJe3WfnwFAobk7ohV5AOC0KdHUa
   3FyDQeA1NsLsqyuWSYeZtShIr7S4NwYIZ2W2r5E/iQPeqpXsJZVJFWHhS
   JPBhOS/PhA4NqhDSNnjyVTZRjLwRuyYtQFMQ2w0zBMBoY83SZnWF25rdO
   TtLO9neCYMAVQz+vUbBot4vL43nlUEeM8PlxnwUXDgzyFb0I/0OxlxfJT
   g5MYQIJcqE6qRk48BC41xqZcIzgoysJrYSLFG9o7YSmwmNR49QHha6loR
   A==;
X-CSE-ConnectionGUID: FJgiGhNmTEumiDXML0ffNA==
X-CSE-MsgGUID: 2nTlOlT7SROv9E9HaGye7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="40217850"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="40217850"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 05:49:09 -0700
X-CSE-ConnectionGUID: A6HISGOJQiatQg6STih/Yw==
X-CSE-MsgGUID: 9c4C8P1+TnSTbPenn1WmuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="40124797"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 05:49:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1sH0vv-0000000FXSj-1RHd;
	Tue, 11 Jun 2024 15:49:03 +0300
Date: Tue, 11 Jun 2024 15:49:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, paulmck@kernel.org,
	apopple@nvidia.com, Michael van der Westhuizen <rmikey@meta.com>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] [i2c-tegra] Do not mark ACPI devices as irq safe
Message-ID: <ZmhHvpHlkxe4kid7@smile.fi.intel.com>
References: <20240606132708.1610308-1-leitao@debian.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606132708.1610308-1-leitao@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 06, 2024 at 06:27:07AM -0700, Breno Leitao wrote:
> On ACPI machines, the tegra i2c module encounters an issue due to a
> mutex being called inside a spinlock. This leads to the following bug:
> 
> 	BUG: sleeping function called from invalid context at kernel/locking/mutex.c:585
> 	in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1282, name: kssif0010
> 	preempt_count: 0, expected: 0
> 	RCU nest depth: 0, expected: 0
> 	irq event stamp: 0
> 
> 	Call trace:
> 	dump_backtrace+0xf0/0x140
> 	show_stack (./arch/x86/include/asm/current.h:49
> 		     arch/x86/kernel/dumpstack.c:312)
> 	dump_stack_lvl (lib/dump_stack.c:89 lib/dump_stack.c:115)
> 	dump_stack (lib/earlycpio.c:61)
> 	__might_resched (./arch/x86/include/asm/current.h:49
> 			 kernel/sched/core.c:10297)
> 	__might_sleep (./include/linux/lockdep.h:231
> 			 kernel/sched/core.c:10236)
> 	__mutex_lock_common+0x5c/0x2190
> 	mutex_lock_nested (kernel/locking/mutex.c:751)
> 	acpi_subsys_runtime_resume+0xb8/0x160
> 	__rpm_callback+0x1cc/0x4b0
> 	rpm_resume+0xa60/0x1078
> 	__pm_runtime_resume+0xbc/0x130
> 	tegra_i2c_xfer+0x74/0x398
> 	__i2c_transfer (./include/trace/events/i2c.h:122 drivers/i2c/i2c-core-base.c:2258)

Please, read
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#backtraces-in-commit-messages
and follow the advice on how to improve your commit message.

> The problem arises because during __pm_runtime_resume(), the spinlock
> &dev->power.lock is acquired before rpm_resume() is called. Later,
> rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
> mutexes, triggering the error.
> 
> To address this issue, devices on ACPI are now marked as not IRQ-safe,
> considering the dependency of acpi_subsys_runtime_resume() on mutexes.

...

While it's a move in the right direction, the real fix is to get rid of
the IRQ safe PM hack completely. Look at how OMAP code was modified for
the last few years and now it's pm_runtime_irq_safe()-free. The main
(ab)users are SH code followed by Tegra drivers.

So, can we fix this once for all?

-- 
With Best Regards,
Andy Shevchenko



