Return-Path: <linux-i2c+bounces-8343-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247CD9E4EF7
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 08:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2C0516907D
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 07:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C3F1B4F3E;
	Thu,  5 Dec 2024 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FR27yzi7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CF21917EE
	for <linux-i2c@vger.kernel.org>; Thu,  5 Dec 2024 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385204; cv=none; b=WTYEORulqtHYrRlJswdVWIcDlIIVaswS3EMyL2wrqhSoFv7wGu6DEJKlBqpOuuabEdYdgCj3zZR+YbvCyIB1WQ6hgeaSWT40TpbCLLGmIcih0zkdDEUVnvQkUxIBlUHCkO8C+d8Fy5d6PbiSCQrS2x7VLf0G/nYbn8agxih8owg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385204; c=relaxed/simple;
	bh=eY5ge75FaMP9GPTeH7bLLIxZ/xdSRLZaPxejZWlulEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpQNcHJ/uV805oID6mJreOvY7vYFQHNS9GpEjuUm8Ga9/xJeg0GYYHXWA2sfFied6Ey/OdDaubOAanCQ1nUCDq+A1lOq0/7rrVRBTlde1lMni7XohBFl91yQuaRSqf26kkDt5yrgqiiYyRGeSrFf+7O8tX4O3xPv2cL1VYNXiUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FR27yzi7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733385203; x=1764921203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eY5ge75FaMP9GPTeH7bLLIxZ/xdSRLZaPxejZWlulEE=;
  b=FR27yzi785oSroIvjnun4TFxzzrOtBMg3z+qLYqoeDKRFWtc6bzgqD3e
   UjejDT+1IydwUGuwkbCIx0Pd465Q/YJ0yxxEKhinUKrO+/nH1Cj/RHYsW
   dl58ln/0DdeweZ/FGit6J+UHpg3UlYLg8bW87UYi35LELDsDvdLcxS1QA
   Mxfkmdam0jZ5EImvmeY8gXAODD7KAwDsTWx023EfWVMxEUTXQNEhh3RTz
   eXdfLNZCgJ5d9sDyQocagd0qSB/LnPANr5FveJYwfDEN7t0YDIJG/tved
   Leh6eg9Hd9GJUxtCnIRyH/ovEnuR/UGmSZ3lGAWW7Y+W6ocR4R4H5IC3g
   w==;
X-CSE-ConnectionGUID: nzzYbAtFRFKQXBxmH7a7Sg==
X-CSE-MsgGUID: qGOWHBSgScufWs+BlltXeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45072086"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="45072086"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:53:23 -0800
X-CSE-ConnectionGUID: ZSViFWSXRv2p3E7PcX4ZIw==
X-CSE-MsgGUID: YIxLzFojRFOnNwcKWIS+DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="124834945"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:53:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tJ6fm-000000041AF-0hxu;
	Thu, 05 Dec 2024 09:53:18 +0200
Date: Thu, 5 Dec 2024 09:53:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON
 and I2C_DW symbol namespaces
Message-ID: <Z1Fb7eYPr8y_l2dT@smile.fi.intel.com>
References: <20241203173640.1648939-2-u.kleine-koenig@baylibre.com>
 <Z09bp9uMzwXRLXuF@smile.fi.intel.com>
 <aenflylxg46hie6yj2hzlelnzbq42mox24fzzz7o44dvb3j575@r2hgad4ghgym>
 <Z0-vKE3FLxa2BWmS@smile.fi.intel.com>
 <k75ryxfif2jhzb4b6ipkyxol22rt4p4uv4dquajkiwj5m5du6s@mxe2q7s2n575>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <k75ryxfif2jhzb4b6ipkyxol22rt4p4uv4dquajkiwj5m5du6s@mxe2q7s2n575>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 04, 2024 at 11:25:40AM +0100, Uwe Kleine-König wrote:
> On Wed, Dec 04, 2024 at 03:23:52AM +0200, Andy Shevchenko wrote:
> > On Tue, Dec 03, 2024 at 11:46:07PM +0100, Uwe Kleine-König wrote:
> > > On Tue, Dec 03, 2024 at 09:27:35PM +0200, Andy Shevchenko wrote:
> > > > On Tue, Dec 03, 2024 at 06:36:40PM +0100, Uwe Kleine-König wrote:
> > > > > DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> > > > > is included. So move the define above the include block.
> > > > 
> > > > As in the other email I pointed out the doc says that we need to undef the
> > > > symbol. No need to move it around.
> > > >
> > > > The only requirement is to place that before any EXPORT_SYMBOL*() we want to
> > > > add it to.
> > > [...]
> > 
> > Perhaps we need to update the documentation first.
> 
> I addressed that in https://lore.kernel.org/all/3dd7ff6fa0a636de86e091286016be8c90e03631.1733305665.git.ukleinek@kernel.org/

Thank you!

-- 
With Best Regards,
Andy Shevchenko



