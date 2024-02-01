Return-Path: <linux-i2c+bounces-1589-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 560B9845700
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 13:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11E01288E15
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 12:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1690915D5C2;
	Thu,  1 Feb 2024 12:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmeAeWO+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC4815DBAD
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706789374; cv=none; b=rL+sYpAs0iARGz6wQpP8Bk5JNNgfb/b4WkWJpoQdHjXL3G02vMsdazPHOp8+TomB+odLAwXcVZHtjb7TFZGj63XFY0MUc05ez1qIuh+xMEjw4wmp9yQ8PL8UepIUlbEZf4omKKayCFpdejF+MtyUbIyUUFvB/sHh0JUa1OQwQtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706789374; c=relaxed/simple;
	bh=58w19g4O1SMP11fkqS3N58kGjyQG8IfvDgU4V5Ghd7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8yvmfJWzSWjUb0Kz2FuWdoDKLC6WDOnkzHigZY5y+cc115fRi/l6Z4VmORhPeP8xsJKISKZFEPRjJ5aXSMVQ6yQ1v8tWgQPeDyOYvAvpIX4fNZfYE0vaRx8WPFXcGzhpNg4p2NDjBxZcihWot6rnc0kS31FduphXUESpW+GytA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmeAeWO+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706789373; x=1738325373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=58w19g4O1SMP11fkqS3N58kGjyQG8IfvDgU4V5Ghd7s=;
  b=nmeAeWO+PrCx7g18VWkEScCKSIZfUCayUGW+HhsZKh3OCBXszsyuPrL+
   GQx2EtiCeEUAUkQEa8C6r+ySeG8upw8dy7iAIcfsqKkLZmVNIAaTUCaul
   nmXCJfWf0TxVP00u3wp4wXfu/tiz8pbipwFx8priiSllnIQLdyMWu5FxN
   Pl5NbMOMB48b2at/SwsWEz4abgB2Xgz0pxbaQyRX5LXtnRsJ0oC2895bw
   ENk5kLkd27MP6l6KI1VkGp700DmQf/ZPr1StsPye6jTlcf0e/xRVQvi6X
   zF9LaHMx/sH27PAisiB+y9cGL1g0vEgWls9ylk3hlarnGWjyUAw0bVF3Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10632055"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="10632055"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 04:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="912108917"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="912108917"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 04:09:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rVVrV-00000000pKl-3gAW;
	Thu, 01 Feb 2024 14:08:09 +0200
Date: Thu, 1 Feb 2024 14:08:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Ruhl@smile.fi.intel.com, Michael J <michael.j.ruhl@intel.com>
Subject: Re: [PATCH 0/6] i2c: designware: Generic polling mode code
Message-ID: <ZbuJqcmSBzxaAONm@smile.fi.intel.com>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 31, 2024 at 04:16:46PM +0200, Jarkko Nikula wrote:
> Hi Jiawen, Sanket and Basavaraj
> 
> Could you test on your Wangxun 10Gb NIC and AMD NAVI GPU harware this
> patchset since it's touching both.
> 
> For the AMD NAVI GPU and changes are less but for the Wangxun 10Gb NIC
> patchset replaces the txgbe_i2c_dw_xfer_quirk() with generic polling mode
> code.
> 
> I've been testing this on our HW which all have interrupt connected and
> tried to cover also FIFO depth defines for Wangxun 10Gb NIC. Obviously I
> would like to know how this set works on your real HW.

...

> Jarkko Nikula (6):
>   i2c: designware: Uniform initialization flow for polling mode
>   i2c: designware: Do not enable interrupts shortly in polling mode
>   i2c: designware: Use accessors to DW_IC_INTR_MASK register
>   i2c: designware: Move interrupt handling functions before
>     i2c_dw_xfer()
>   i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
>   i2c: designware: Implement generic polling mode code for Wangxun 10Gb
>     NIC

Last two patches named the same, Something is screwed up.

-- 
With Best Regards,
Andy Shevchenko



