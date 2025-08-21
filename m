Return-Path: <linux-i2c+bounces-12367-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8ECB2F934
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Aug 2025 15:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BC427BE305
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Aug 2025 13:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D85319844;
	Thu, 21 Aug 2025 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMACdinf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998262E0B4E;
	Thu, 21 Aug 2025 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781322; cv=none; b=E1TweXenngSdnccxasujEYWqhdeKIh1Tea9LZ/WnucqTKPOFb6Lp4y540k0gDeKOfAOhFJ5kZ/2SOC+HhnJj1HAe06LRHZq8CU3Abad9ebIWANaMmRQgzgJBgr68T3xQu9q7fyXyk3sb6yQ26Sg+VsWbvu37QjDJZWi0QT2T0AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781322; c=relaxed/simple;
	bh=vQANgwcodOpodUJI6SYV5BAoMpb1/x9q87YxgpzYPe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfkUK85XNNEg8VvmTtimso0zEgTjylfgPW+5+lksAZIy2eBSIj0PpDVPYDVO5W3gcxLM/8faz1nM0wZbIvroDuD97bk55N/iwzLLQDtAgV4XlBjBME6UNsjr6aAnBn1ChB0VQf3J8alLK9udk2f7YxFUb7s57B/J1v6uoz56PXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMACdinf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755781321; x=1787317321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vQANgwcodOpodUJI6SYV5BAoMpb1/x9q87YxgpzYPe4=;
  b=bMACdinfiQLj3VUaFxj9CAjHO0YGMH4f6gukQXe0TynuZjSY6R171Lfx
   cvx3AAMxuOWH87BTQ4hszePsP5pG4g6F9GctibGGHrIKbIEqlXrCAGIFo
   o4li1a1U+kvOOLEpkxCXHtDjiXqxs0LqUKYQbaKO4RLy3JRcP020BeAR+
   HDxjA/ZmlccrJlcjsxNlRZ33b/QmpZC8gr3UGQZYDbR9Ul8J8VcySo3QI
   TtkoeUWxjB91PP8nYQdf5wwhczysV/DRH0ywONBHscBluxSvjPSGXQK5b
   LkWwGvJ+Xjg2nnwRoFSROXTQMJCbfBENLgU0D4glhvzvMwbpIJxSpRIK8
   Q==;
X-CSE-ConnectionGUID: 4WRw40wXQwuZP/wqRWa+tg==
X-CSE-MsgGUID: AkdUHVh4Tne1P8po2ggUnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58018520"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="58018520"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:02:00 -0700
X-CSE-ConnectionGUID: IM/qwm2RSJqj0lAW7K6SKQ==
X-CSE-MsgGUID: vUdXZO86RDGQB2eL//xlIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199279399"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:01:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1up4vT-00000007EnJ-43ll;
	Thu, 21 Aug 2025 16:01:55 +0300
Date: Thu, 21 Aug 2025 16:01:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: Avoid taking clk_prepare mutex in
 PM callbacks
Message-ID: <aKcYw0Az1fYfNbBr@smile.fi.intel.com>
References: <20250820153125.22002-1-jszhang@kernel.org>
 <20250820153125.22002-2-jszhang@kernel.org>
 <aKXyVvFOvpsaAEAB@smile.fi.intel.com>
 <aKX4xEYE29JC_g14@xhacker>
 <7198221a-1f12-49cf-9d35-7498ae7389cd@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7198221a-1f12-49cf-9d35-7498ae7389cd@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 21, 2025 at 03:45:43PM +0300, Jarkko Nikula wrote:
> On 8/20/25 7:33 PM, Jisheng Zhang wrote:
> > On Wed, Aug 20, 2025 at 07:05:42PM +0300, Andy Shevchenko wrote:
> > > On Wed, Aug 20, 2025 at 11:31:24PM +0800, Jisheng Zhang wrote:
> > > > This is unsafe, as the runtime PM callbacks are called from the PM
> > > > workqueue, so this may deadlock when handling an i2c attached clock,
> > > > which may already hold the clk_prepare mutex from another context.
> > > 
> > > Can you be more specific? What is the actual issue in practice?
> > > Do you have traces and lockdep warnings?
> > 
> > Assume we use i2c designware to control any i2c based clks, e.g the
> > clk-si5351.c driver. In its .clk_prepare, we'll get the prepare_lock
> > mutex, then we call i2c adapter to operate the regs, to runtime resume
> > the i2c adapter, we call clk_prepare_enable() which will try to get
> > the prepare_lock mutex again.
> > 
> I'd also like to see the issue here. I'm blind to see what's the relation
> between the clocks managed by the clk-si5351.c and clocks to the
> i2c-designware IP.

I believe they try to make an example when clk-si5351 is the provider of
the clock to I²C host controller (DesignWare).

But I'm still not sure about the issues here... Without (even simulated with
specific delay injections) lockdep warnings it would be rather theoretical.

-- 
With Best Regards,
Andy Shevchenko



