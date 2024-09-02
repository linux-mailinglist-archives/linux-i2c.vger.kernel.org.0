Return-Path: <linux-i2c+bounces-5995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7D89686E3
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 14:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD2682855D6
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 12:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D0E1DAC76;
	Mon,  2 Sep 2024 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dbo2RSC6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340071DAC52;
	Mon,  2 Sep 2024 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725278406; cv=none; b=V54f4K3dfq2zEuQSGHhRnHcioJUGvpkvctvYVmtjDUyJ4PQkwTGTwTWVrAMdNqzKRJER8UfpQaJKDnP8VDkBpT3ByBKVoC5CpNrbt+kXVTal9yn8/tNe0JkH4YkGm/ZLfUaUMVGI/c00BMFSLz06KPp7hhvxE37y7S08m2xEXco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725278406; c=relaxed/simple;
	bh=s5PNXJylVeTaejUqfvcmHm17nL+lhZdgF7rPHmXu+Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVXCXzc3qIQaHW6qzVJB8BtxdzKEBxurVTved5Y3pnfTLzYIaUFGYYmctf5Ph1KFkOPYkoua1hITu6G8f4v4DLYw9plJXT//4aD/ueYwtZ2FDRk2e0/tokfmleLa37G6SeUoFG0cAN5DtKuB/2pQlB2GFWWPhnGogIo+yWKQXso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dbo2RSC6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725278405; x=1756814405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=s5PNXJylVeTaejUqfvcmHm17nL+lhZdgF7rPHmXu+Dc=;
  b=Dbo2RSC6HqXW1VTC5GtBboUx56ua8wxCoQKAHrn6cFAR+bSJTSby29iD
   9rOEucttvBR/T6JMHP8E2n0FtZABqHmpdHc1d1MWewI/hFjEd/soquLJE
   04RcynZUqDWZNalTa2kDpU/PZbVb/EvGxoTcQEcNXgf/sON8BC/GNux0n
   IhzEMGvYpYckAxO73v/D+QmMcN1rztnqwZjoi+/df5TrVER3caZ9+COeD
   DtjjONukFyw8XjLQR02R1IKjALGbcCQ3wIvTKbMK+F0v2aEKQ/dWppB+0
   2XgK+3ehFUMIwaiuZBWU16kXeDRobW3RICRdXHcUNOVmL2yz8Zs11fWqm
   A==;
X-CSE-ConnectionGUID: qofDA69QQuKgVpno1tlvAg==
X-CSE-MsgGUID: ztCEXd4ST/KEO/AkHX6dXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="27643885"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="27643885"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:53:42 -0700
X-CSE-ConnectionGUID: bBchEQG1RTKmqrN4miqtxA==
X-CSE-MsgGUID: bamhgSFwRwK8MR+qtAi4vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="65308475"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:53:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sl5cj-00000004LfJ-1Jbb;
	Mon, 02 Sep 2024 14:53:33 +0300
Date: Mon, 2 Sep 2024 14:53:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Cc: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
	tmaimon77@gmail.com, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, andi.shyti@kernel.org, wsa@kernel.org,
	rand.sec96@gmail.com, wsa+renesas@sang-engineering.com,
	tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
	kfting@nuvoton.com, openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
Message-ID: <ZtWnPTSu1RKmIlhK@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-7-kfting@nuvoton.com>
 <ZtIbM4NTbldBIDXf@smile.fi.intel.com>
 <CAHb3i=vWNmokQYyOZJOVeaJaT6XAroct2gZiJYPVQf6rHzR5LA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHb3i=vWNmokQYyOZJOVeaJaT6XAroct2gZiJYPVQf6rHzR5LA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Sep 01, 2024 at 06:53:38PM +0300, Tali Perry wrote:
> On Fri, Aug 30, 2024 at 10:19 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Aug 30, 2024 at 11:46:39AM +0800, Tyrone Ting wrote:
> > > Modify i2c frequency from table parameters
> > > for NPCM i2c modules.
> > >
> > > Supported frequencies are:
> > >
> > > 1. 100KHz
> > > 2. 400KHz
> > > 3. 1MHz
> >
> > There is no explanations "why". What's wrong with the calculations done in the
> > current code?
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
> Hi Andy,
> 
> The original equations were tested on a variety of chips and base clocks.
> Since we added devices that use higher frequencies of the module we
> saw that there is a mismatch between the equation and the actual
> results on the bus itself, measured on scope.
> So instead of using the equations we did an optimization per module
> frequency, verified on a device.
> Most of the work was focused on the rise time of the SCL and SDA,
> which depends on external load of the bus and PU.
> We needed to make sure that in all valid range of load the rise time
> is compliant of the SMB spec timing requirements.
> 
> This patch include the final values after extensive testing both at
> Nuvoton as well as at customer sites.

But:
1) why is it better than do calculations?
2) can it be problematic on theoretically different PCB design in the future?

P.S. If there is a good explanations to these and more, elaborate this in the
commit message.

-- 
With Best Regards,
Andy Shevchenko



