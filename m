Return-Path: <linux-i2c+bounces-6394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 840C997154A
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 12:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2C501C21F6E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 10:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7C01B3F2C;
	Mon,  9 Sep 2024 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYhD36UO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32481B3F1B;
	Mon,  9 Sep 2024 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725877673; cv=none; b=TKkZFWfBgsgkZSVwDpVWTqUXtiX6H1xpWYLoK3ZnSjjckXTzBcG3ZN4OaRwNfxDCCdAb6PFfO/3A27qPNdHYemfHTYIJUlDV+AIVN+qc65GpJ/2RT9g5CEDg1jjHw6lTVGBg1IKw7XKLWR9zuMSs4c5aUGADLVoBE24+X8GELmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725877673; c=relaxed/simple;
	bh=+SmCyytRSiB0PCoR7QlPPleWDhB0nCXCjJCCXHARODQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3O8VdmxACDIpl16RHNlusCeOf4l+7ZuUGuyE3bQzrvOvVthY33objs6svkq2DvgxNbYi1yOP5sG105T28+vPkG9NULfZmEXdGdpo66w5YFfTqfm3c143QIv9WBLWkXQVjNYRGr11Oft71TSXg6kgHkZlvj1xD7D9LTr7iF5l1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYhD36UO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725877672; x=1757413672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+SmCyytRSiB0PCoR7QlPPleWDhB0nCXCjJCCXHARODQ=;
  b=VYhD36UO/n1P6M440YMPClcc1f8r57QixTuePh0XfO0Td+EELC06GSye
   UfqkZN9WaBGh3tWRSVT4whEoWjIY9koi096QI0t2FByeaqXqZ15wlCTo1
   FXxds7NbZhHAPTUjk2sNgjpcdFOdRz+c52fZynRmFXGBeJR/yqaEGlinY
   Xwsqf8ORDFktz8ElPpL0o34Xkaqolflp8XelIxBjuGAxeCvCxhbmp3Nc1
   g22jNCA04wfFGj5nnK/qhOgqa9otIXGYldqbUtWu076WQQJzikqAAjAJL
   kgur6+eBzRWPvfxKny4rBN20ffT5gwyviCvjG/GDCYIu8U/vYfP3uxk7f
   A==;
X-CSE-ConnectionGUID: Wh1oGafxTY69PK8aZKglXA==
X-CSE-MsgGUID: kbLMyYUIT2KJVMpMJhYuVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24437421"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24437421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 03:27:51 -0700
X-CSE-ConnectionGUID: fviXEXhHSWqLf8LoB33Jlg==
X-CSE-MsgGUID: A+VKBPxTRF+elyruo2PwAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="97337654"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 03:27:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1snbcW-00000006khl-0dob;
	Mon, 09 Sep 2024 13:27:44 +0300
Date: Mon, 9 Sep 2024 13:27:43 +0300
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
Message-ID: <Zt7Nn9uJSeHFUZZF@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-7-kfting@nuvoton.com>
 <ZtIbM4NTbldBIDXf@smile.fi.intel.com>
 <CAHb3i=vWNmokQYyOZJOVeaJaT6XAroct2gZiJYPVQf6rHzR5LA@mail.gmail.com>
 <ZtWnPTSu1RKmIlhK@smile.fi.intel.com>
 <CAHb3i=uN5jtczEjHhzwL9E9c6d9rU-QZckhU79KzPuY5n81CyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHb3i=uN5jtczEjHhzwL9E9c6d9rU-QZckhU79KzPuY5n81CyA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Sep 08, 2024 at 11:54:50AM +0300, Tali Perry wrote:
> On Mon, Sep 2, 2024 at 3:00 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, Sep 01, 2024 at 06:53:38PM +0300, Tali Perry wrote:
> > > On Fri, Aug 30, 2024 at 10:19 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > The original equations were tested on a variety of chips and base clocks.
> > > Since we added devices that use higher frequencies of the module we
> > > saw that there is a mismatch between the equation and the actual
> > > results on the bus itself, measured on scope.
> > > So instead of using the equations we did an optimization per module
> > > frequency, verified on a device.
> > > Most of the work was focused on the rise time of the SCL and SDA,
> > > which depends on external load of the bus and PU.
> > > We needed to make sure that in all valid range of load the rise time
> > > is compliant of the SMB spec timing requirements.
> > >
> > > This patch include the final values after extensive testing both at
> > > Nuvoton as well as at customer sites.
> >
> > But:
> > 1) why is it better than do calculations?
> > 2) can it be problematic on theoretically different PCB design in the future?
> >
> > P.S. If there is a good explanations to these and more, elaborate this in the
> > commit message.
> 
> Thanks for your comments,
> 
> 1) The equations were not accurate to begin with.
>   They are an approximation of the ideal value.
>   The ideal value is calculated per frequency of the core module.

This is crucial detail.

> 2) As you wrote , different PCB designs, or specifically to this case
> : the number and type of targets on the bus,
>    impact the required values for the timing registers.
>    Users can recalculate the numbers for each bus ( out of 24) and get
> an even better optimization,
>    but our users chose not to.
>   Instead - we manually picked values per frequency that match the
> entire valid range of targets (from 1 to max number).
>   Then we check against the AMR described in SMB spec and make sure
> that none of the values is exceeding.
>   this process was led by the chip architect and included a lot of testing.
> 
> Do we need to add this entire description to the commit message? It
> sounds a bit too detailed to me.

Yes, please.

-- 
With Best Regards,
Andy Shevchenko



