Return-Path: <linux-i2c+bounces-6795-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8633F97A11D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B89751C231A5
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053AB15746F;
	Mon, 16 Sep 2024 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZO14zwsA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABDD156F4C;
	Mon, 16 Sep 2024 12:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488206; cv=none; b=P0Ru/vK1I5WFAzWfPS3WTrE2tArXpx6DmGAacDNo/tK/O45Ucio0PMEe7Ct0V+lGSKEBNWVBHYGBVz5fWvxSv1O3NxFXedBq+wt6RcbTn2auMtTTTQeeVHpsKRLneZ5QUaarLDFxpY+GQY5nLbEIQu7kZX16pAAS1RfesfCmnk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488206; c=relaxed/simple;
	bh=0sePlQ6v8SDrzxFHDtEPRg3gT5Tv1CqKdfBCdG5rw/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNilYVhMcqBV8rik1vQgVlM60YtlPmTsgUAbkEhm7qCbzhgpodud43SC7zQ4ouWkyLNr7Uykn4QsVTdKUyMKDIOwbxJB2NfQlO80b+VLFNPkNFTuuwtcKzEtdGxeJ35v0c8V7/dmroTUKxuxL4GnBAUPpWwun99ejZTF6q/VBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZO14zwsA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488206; x=1758024206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0sePlQ6v8SDrzxFHDtEPRg3gT5Tv1CqKdfBCdG5rw/s=;
  b=ZO14zwsAlbnI+Lq7STlq+fcDNDebZfWLtJOvMoRqDu3DcnUPcd/zla17
   NWoHFHqhcjPd5vxUysgBeQ01THs6+F9VAeOadqeH1TFvgm+HX1svuYMf3
   sNAiGtv6eTgEUvTHq82/6EDuQtbOWHniUK1kxhJKFh2zvOGN8Sg0pEvFI
   ZCeDpGXVD1AHpp05XUqFdddK8JdczxeJvsDQ1ALBLf58quMdV+asV0nlo
   7s6L9TdzU1MWFfgabaJPqXH3bLY7yu/QDRU4p7NC2GHQTTep+4G7N1upX
   CQzPKNXMj0xSHPYHp60z9Q1CoKl8O9QXA+/c007dCeSN7JloIZJlIk9DZ
   g==;
X-CSE-ConnectionGUID: 75yP99IQS263ZdACdkup5A==
X-CSE-MsgGUID: CsapTDD+T66RyhfeupyypA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24794233"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24794233"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:03:25 -0700
X-CSE-ConnectionGUID: 2NPTtz0FRT+IiDPT9K5Qvg==
X-CSE-MsgGUID: UR0g2S9DS6OTn5/rndSTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="73221867"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:03:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sqARs-00000009RtK-3CxY;
	Mon, 16 Sep 2024 15:03:20 +0300
Date: Mon, 16 Sep 2024 15:03:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: kernel test robot <lkp@intel.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
Message-ID: <ZugeiJ96VHwg-pl0@smile.fi.intel.com>
References: <20240911154820.2846187-5-andriy.shevchenko@linux.intel.com>
 <202409141436.QFCDQrRF-lkp@intel.com>
 <Zuf1UJ6K_8hL5x5U@smile.fi.intel.com>
 <leoyop42s4qmaytvwhwhpgfwfrkpm2xxabskz645r337jdjfml@zg5ql73tqidk>
 <ZugI2NCtaWKgcgh5@smile.fi.intel.com>
 <uikfb52qduifmhnlkc43tgvmw2ok67eclqpokyrkp7sftetz3v@bs64p6aga6s3>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uikfb52qduifmhnlkc43tgvmw2ok67eclqpokyrkp7sftetz3v@bs64p6aga6s3>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 16, 2024 at 01:58:06PM +0200, Andi Shyti wrote:
> On Mon, Sep 16, 2024 at 01:30:48PM GMT, Andy Shevchenko wrote:
> > On Mon, Sep 16, 2024 at 12:10:32PM +0200, Andi Shyti wrote:
> > > On Mon, Sep 16, 2024 at 12:07:28PM GMT, Andy Shevchenko wrote:

...

> > > Feel free to send it, I will apply it in i2c/i2c-host-for-6.12,
> > > that's where I'm collecting the next patches.
> > 
> > But I believe it's a material for v6.13, no?
> 
> yes, I gave it the wrong name :-)
> I renamed it now to i2c/i2c-host-for-6.13(*).
> 
> But it doesn't matter. It will become the next i2c/i2c-host after
> Linus has taken the actual for-6.12 patches into mainline.

v2 has just been sent out.

-- 
With Best Regards,
Andy Shevchenko



