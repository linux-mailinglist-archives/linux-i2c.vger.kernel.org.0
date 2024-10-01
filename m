Return-Path: <linux-i2c+bounces-7150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D3398BD6A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 15:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC0A31C23B30
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6181C3314;
	Tue,  1 Oct 2024 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zni2fFi1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED811C2DD6;
	Tue,  1 Oct 2024 13:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789004; cv=none; b=MtvPgjR3HgqlTY32bq6e6SvmKKGyiil8t4aytagDGbD6lcs615/viF3KFwmwgsvgsxSVRX0nefOFAlfhX/z+Q3VsuPTok3NLu85y2ngCx0SuMkZ+Juhof5iOW52sdTW/4LprNPQymKqIOZkJZMQ2mrJb1u1bFHH2XsBv8S9hmek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789004; c=relaxed/simple;
	bh=fQ2vhUzLtGvkWyq8DZsTCLJmKFg82cwiPY8f99KGWqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9g5YgVp2v+7F/JHbQLQeBqGNwqoTizmFqhFrqUHCYEu2+MOt0efWTq8Wz/NmK7N+tmVtO3mlzTNtbVN/V/1Z07yUH5sTHgmEwxLgsyAmQHXWuTsJz7s/d/efgmeX1KT5YuBYAFe+YVvYXk0n94xIehbGK/4MT7RxwpHpCvpWlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zni2fFi1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727789002; x=1759325002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fQ2vhUzLtGvkWyq8DZsTCLJmKFg82cwiPY8f99KGWqw=;
  b=Zni2fFi1WVNYJPx4hYUBU+Mp2YTgg3mV1dAANR394a623T17c+6lc0zO
   aw4Q9KiMcKuqgchIq9Eo8DZ4a7B/4v1WFgMpn/nZSJu/5J6LDuBRCzBfx
   R3koxjK+7f9YWM2fyIGSbWYVRB6doBp08vBmJUyT7zCFNdNp/K3AKOj89
   RECFna4jZVeKPXC+G//3S9lQfImntWzJ2wislxkPLKvDaRMY2CdDEfFFz
   eYL2J0+wcWiGyCoNs2yoasBc3CtJeeIAm6oFfqeECljCP87tXEe4rFvJD
   /7hj+uElRfmGQVk55NuYvTLkLUS327cN6lsvSfS1uEHetdicSJm/E4Gsp
   g==;
X-CSE-ConnectionGUID: StrDQSpwQ06XpzCX15m9pg==
X-CSE-MsgGUID: YurNibD3SvW5U7I0V7bbyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27061998"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="27061998"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:23:22 -0700
X-CSE-ConnectionGUID: cEVT+0U0RLiRN7ywqh996Q==
X-CSE-MsgGUID: mVzLgWZCQkeWYNTyQqvzAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="74079983"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:23:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1svcqR-0000000FCj1-08ap;
	Tue, 01 Oct 2024 16:23:15 +0300
Date: Tue, 1 Oct 2024 16:23:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] i2c: npcm: use i2c frequency table
Message-ID: <Zvv3ws1_jUMVnAAJ@smile.fi.intel.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
 <20241001062855.6928-6-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241001062855.6928-6-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 01, 2024 at 02:28:54PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Modify i2c frequency from table parameters
> for NPCM i2c modules.

This two lines have a too small wrapping limit.

> Supported frequencies are:
> 
> 1. 100KHz
> 2. 400KHz
> 3. 1MHz
> 
> The original equations were tested on a variety of chips and base clocks.
> Since we added devices that use higher frequencies of the module we
> saw that there is a mismatch between the equation and the actual
> results on the bus itself, measured on scope.
> 
> Meanwhile, the equations were not accurate to begin with.
> They are an approximation of the ideal value. The ideal value is
> calculated per frequency of the core module.
> 
> So instead of using the equations we did an optimization per module
> frequency, verified on a device.
> 
> Most of the work was focused on the rise time of the SCL and SDA,
> which depends on external load of the bus and PU.
> 
> Different PCB designs, or specifically to this case: the number
> and type of targets on the bus, impact the required values for
> the timing registers.
> 
> Users can recalculate the numbers for each bus and get an even better
> optimization, but our users chose not to.
> 
> We manually picked values per frequency that match the entire valid
> range of targets (from 1 to max number). Then we check against the
> AMR described in SMB spec and make sure that none of the values
> is exceeding.
> 
> This process was led by the chip architect and included a lot of testing.

Personally I consider table approach is not so flexible and it is definitely
does not scale (in the result — hard to maintain for all customers), but if
it's hard to calculate all necessary data and there are other pros of it,
I'm fine.

TL;DR: I don't like this patch, but I don't want to stop you, hence no tags
from me.

-- 
With Best Regards,
Andy Shevchenko



