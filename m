Return-Path: <linux-i2c+bounces-6933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00097E77A
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 10:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CADBC2819FB
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 08:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53E519341A;
	Mon, 23 Sep 2024 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXT44RQg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C9C101E6;
	Mon, 23 Sep 2024 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727079929; cv=none; b=CqJcKOblGp9Ym47wOn5Hkb0UPnfv3Fc+HXnGcXxnGJBUGVoOR4Mu1Gn19X7VFbAO4fcosJDqeq3wzSucMb2CBkLXiKLjhoidJdMf8RbIOLrZAPYtCGq9hvyCeodv6qpa58gUvzU085KWrpVIEw8ciFrdbgLqSu/OfH32TeX88kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727079929; c=relaxed/simple;
	bh=1Cf4C1+sLwIadApLBZyzieaza09oq+YyYQasxL0Ht7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pH6lNPvBkHQ8EIEhVMvBTGEs70Lquw3KmB6qJWeV11FZ+GSbxUx0FP2Ok15/VBXIgfjSR+uEplulJrwVkswo0Mffd1bnmrybuCYTZxl+PopqIRN+MsuBXlE2H7s9IWYaux2JVZ2YEVcTMzXoT31dxAcDwlmfnRXeK4JVNWi7CCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXT44RQg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727079928; x=1758615928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1Cf4C1+sLwIadApLBZyzieaza09oq+YyYQasxL0Ht7w=;
  b=FXT44RQgWegl3MuCXZQCnnEAhloc3RzrkQYQn53xFIdP8ImIFPBKCoyw
   84RRrEIKD7cDAnEvL51dSf1S34oxv5XLkdTikMPFAlM66dB1mi5H8pLaQ
   y7Afnyiql03lBS0CoxGZu8TeoSrUZ0XogMgcl6tiCPEfEYuVPa62rU8Fg
   EQV5iDe+NAjLr1ASmsem1UH2r9GepLj+zZ+MrXqW/R0vql5zintCSKof0
   78Ew12q2ZlE0Bh3VBc1makkERssIr7RVDuqZH/zNf7UeUyL+oiKGws0vQ
   kGTDc4pPi3D+a9DblBN7X6uURfUB7t/MRglIxOrQGX1rRa/UpXU4i7FxK
   A==;
X-CSE-ConnectionGUID: vQWZpuZlT4+vUhwSVnjrbg==
X-CSE-MsgGUID: QLM8s8WNS0unzjjyDPWiJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26108022"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26108022"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:25:27 -0700
X-CSE-ConnectionGUID: uUOCbsW8TSi11bfKU2Xwtw==
X-CSE-MsgGUID: X5GI/7SVTMiFcKMxvvSs9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71016318"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:25:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sseNj-0000000BtJt-3Lv3;
	Mon, 23 Sep 2024 11:25:19 +0300
Date: Mon, 23 Sep 2024 11:25:19 +0300
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
Subject: Re: [PATCH v4 4/6] i2c: npcm: Modify the client address assignment
Message-ID: <ZvEl77NIpNwtAAow@smile.fi.intel.com>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-5-kfting@nuvoton.com>
 <Zu2HmkagbpMf_CNE@smile.fi.intel.com>
 <CACD3sJbD4TuhDwazBwcc4FR2yK40LV=D-mk6VAKwNvxqAHNGLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACD3sJbD4TuhDwazBwcc4FR2yK40LV=D-mk6VAKwNvxqAHNGLw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 23, 2024 at 09:59:31AM +0800, Tyrone Ting wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> 於 2024年9月20日 週五 下午10:33寫道：
> > On Fri, Sep 20, 2024 at 06:18:18PM +0800, warp5tw@gmail.com wrote:

...

> > > Store the client address earlier since it might get called in
> > > the i2c_recover_bus logic flow at the early stage of the func()
> > > npcm_i2c_master_xfer.
> >
> > You got my comment really wrong.
> >
> > func() in my example was to refer to _a_ function mentioned in the text.
> > And IIRC I even posted the example, like: i2c_recover_bus().
> 
> So the commit message in next patch set would be like:

Yes.

> Store the client address earlier since it might get called in
> the i2c_recover_bus() logic flow at the early stage of
> npcm_i2c_master_xfer().
> 
> The code comment would be like:

Yes!

> Previously, the address was stored w/o left-shift by one bit and
> with that shift in the following call to npcm_i2c_master_start_xmit().
> 
> Since there are cases that the i2c_recover_bus() gets called at the
> early stage of npcm_i2c_master_xfer(), the address is
> stored with the shift and used in the i2c_recover_bus call().

-- 
With Best Regards,
Andy Shevchenko



