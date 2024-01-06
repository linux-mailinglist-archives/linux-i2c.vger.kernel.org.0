Return-Path: <linux-i2c+bounces-1180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F282607B
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 17:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C587EB230DD
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 16:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E938830;
	Sat,  6 Jan 2024 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+Tc4YOg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D2A8820;
	Sat,  6 Jan 2024 16:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704557189; x=1736093189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8+aVIg+Wk08nweCOUOZlJw89CNCLOYDE563yrRwYD+k=;
  b=f+Tc4YOgXrEM49imVFtvdyMocnUeI8Fq2UW+3L9KLwnxYxeZBBo8AgTM
   5IZmYZtCfbPXQFkaaezaEBH5dW9Atc7bG+Mhva/fbs8/yG0ghHRmHLug4
   tWCszzP/k/twEy2ytZ0fzxxsxrFpSAm6Jdpe54lQN+SzpA3KNblvsG13J
   b5XR3hE9M1nS0GnoqmMjuZiP7CPqjmuTbrUV71jCmH/zFuFGV6PF6lgdZ
   YLJbZHuACcugFK1eUHQyt3hW9yjL6NmFeJdayg4zRx67+nK9y/xprYgZ5
   UyWQvzkCCxjMR2oIbOUPp7ws1VZFojn1u1Ep5pHJrgttE1TOvMyMXzIbQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="401446500"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="401446500"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 08:06:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="781016603"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="781016603"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 08:06:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rM9Bn-0000000BwpI-2BN1;
	Sat, 06 Jan 2024 18:06:23 +0200
Date: Sat, 6 Jan 2024 18:06:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: "V, Narasimhan" <Narasimhan.V@amd.com>, Borislav Petkov <bp@alien8.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: Re: i2c-designware: NULL ptr at RIP: 0010:regmap_read+0x12/0x70
Message-ID: <ZZl6f05pJKw8rnAa@smile.fi.intel.com>
References: <20231229120820.GCZY62tM7z4v2XmOAZ@fat_crate.local>
 <8169d773-f9ec-4092-b036-9e4fd59966c3@linux.intel.com>
 <DM4PR12MB508654DF49FE079D6C283D658961A@DM4PR12MB5086.namprd12.prod.outlook.com>
 <888da30a-c1ed-4fb0-af81-787fd868ce20@linux.intel.com>
 <DM4PR12MB5086DE2882C7C5044697B1C38967A@DM4PR12MB5086.namprd12.prod.outlook.com>
 <adf6c24a-d94b-40e5-b645-0c6b23b2d513@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adf6c24a-d94b-40e5-b645-0c6b23b2d513@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 04, 2024 at 03:40:44PM +0200, Jarkko Nikula wrote:
> On 1/4/24 08:35, V, Narasimhan wrote:
> > > [    6.245173] i2c_designware AMDI0010:00: Unknown Synopsys component type: 0xffffffff
> > 
> > This made me scratching my head since driver probing will fail in this
> > case with -ENODEV and I could not trigger runtime PM activity in such
> > case but perhaps this is timing specific which happens to happen in your
> > case.
> > 
> > Out of curiosity do you see this same "i2c_designware AMDI0010:00:
> > Unknown Synopsys component type: 0xffffffff" error on Vanilla or is it
> > also regression in linux-next?
> > 
> > This does not happen on Vanilla, only on linux-next.
> > 
> This is even more strange. Controller is in reset but I'm blind to see from
> Andy's patches why. Do you have change to test at these commits?
> 
> bd466a892612 ("i2c: designware: Fix PM calls order in dw_i2c_plat_probe()")
> c012fde343d2 ("i2c: designware: Fix reset call order in dw_i2c_plat_probe()"
> 
> and maybe the last one
> 4bff054b64e1 ("i2c: designware: Fix spelling and other issues in the
> comments")
> 
> I'm trying to narrow does the regression come from first two patches and if
> not, then test the last one.
> 
> Andy is out of office and if we can narrow the regression to first two
> patches we perhaps can revert just them and otherwise need to drop the whole
> set.

Since I saw this email...

First of all, it's easy just to go patch-by-patch and see if it helps.
Or simple bisect among 24 commits (4 iterations only).

Second, it seems that we are using autosuspend but we don't prevent
the PM to go down during the ->probe(). So, a WA can be to take a reference
count preventing PM from going down.

->remove, for instance, uses RPM get/put calls.

-- 
With Best Regards,
Andy Shevchenko



