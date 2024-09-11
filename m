Return-Path: <linux-i2c+bounces-6598-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF1975C96
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 23:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFBF82859E2
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 21:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F084152532;
	Wed, 11 Sep 2024 21:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhuX+uvI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD0214389F;
	Wed, 11 Sep 2024 21:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726090582; cv=none; b=ZqoCoYVvY61QmewX5ZsIaw68ly2hKQ5iXu3wwdN22OAoJPci8Pu3TkuFSD85e4acc+fChq7XdLrJ4jE7VW4VFas9q2nJL6V1s7OxeUpFkj3AIIUnsWHDV8yqs6KbJf4GFfkI8nSrl8MRGjDXiF1HT2NSI6hMkw9QZRY97arORjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726090582; c=relaxed/simple;
	bh=Yk8c5C0p1nUSjhTjdc11LraEH8etKz4Q/gIg70xKV0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHsH814jP13Yh6sAB7+GDaM4AcDXe+jsJ3nWWLn/k175qpmJrsyFO19/8gkwnViaQ3Pr7ihs9fSw3q2hvvCwfPacqQzWFuOxSTR5YyPDqjGWHB0ZMJV0G8n8xKe+vndGEFGtEtsPydXiKbICNnpvUqpK96urQLXXswW/v8jyeMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhuX+uvI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726090581; x=1757626581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yk8c5C0p1nUSjhTjdc11LraEH8etKz4Q/gIg70xKV0E=;
  b=bhuX+uvIVorl4ftruu33LAvpGX3eJAImMxd1iV0HSsAH6Ca1l/vMUEqm
   uHsiPUOXB54kr11JyqyhghvKfffZVrz0EyhDNj3VZgPyZpYIyDhCQwknR
   +ZJ0jts1ySM8wBG8aXEcfHHXEfDzwD3obR4Vaca6ZzALAX+2AbIp/hF4D
   Odflnmprj5KpG23THufT+B4GI7pTkXfM9IVfrgaFPgvZRrQaXu5LrbUQV
   lHjlGBKAyMNjVKx7+RuqXvMPKRAEq8C6DeJE+7ZdMOR+NCGNokImijKY6
   nQCjvlYnv4ujKDZJfx+XSCpm32Hiww1Mywf9yEeKWKAAg9QUWQv29mW/B
   Q==;
X-CSE-ConnectionGUID: lsPWWygPRJyo8bXz8t9R5g==
X-CSE-MsgGUID: CMThUmrITtmmV08lkP4nZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24852618"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="24852618"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 14:36:20 -0700
X-CSE-ConnectionGUID: CzqDVDDXR/uTcLIBiWH4WA==
X-CSE-MsgGUID: WTy+GWdWRrmgUrts67WT9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="67328454"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 14:36:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soV0a-00000007jYM-46gT;
	Thu, 12 Sep 2024 00:36:16 +0300
Date: Thu, 12 Sep 2024 00:36:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 01/12] i2c: isch: Add missed 'else'
Message-ID: <ZuINULKQ0-fXyrF9@smile.fi.intel.com>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
 <20240911154820.2846187-2-andriy.shevchenko@linux.intel.com>
 <ow7ym7aobu5qukkwvds3dtt5qy65jp5ltzirtzhwr5aef3rxd3@6xceyxzy5orc>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ow7ym7aobu5qukkwvds3dtt5qy65jp5ltzirtzhwr5aef3rxd3@6xceyxzy5orc>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 11:35:01PM +0200, Andi Shyti wrote:
> Hi Andy,
> 
> On Wed, Sep 11, 2024 at 06:39:14PM GMT, Andy Shevchenko wrote:
> > In accordance with the existing comment and code analysis
> > it is quite likely that there is a missed 'else' when adapter
> > times out. Add it.
> 
> Good catch! Very likely this was an oversight.
> 
> > Fixes: 5bc1200852c3 ("i2c: Add Intel SCH SMBus support")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I merged just this patch to i2c/i2c-host-fixes.
> 
> I will take the rest of the series after the merge window.

Fine with me, thanks!

-- 
With Best Regards,
Andy Shevchenko



