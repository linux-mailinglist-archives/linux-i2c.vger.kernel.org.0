Return-Path: <linux-i2c+bounces-1651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD7184B955
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 16:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F02971C24BDC
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28424134729;
	Tue,  6 Feb 2024 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLTGNYi3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16B133426
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707232698; cv=none; b=JMNfG8nGAHBT4keSWpoI0rvaGXiTuvUQnRpOHF7Bp2TwqkGico2XS4vHQwe4XHyrC5lIBHu0L6QqR7hQlXurA0pioRbsxJcmark8SJWQmXTDJ+HzI5BqOKM5Up2nq1Eay5XTK0i3et29jKphhrYh4RJxbKAf3zIAoHql9zYOoJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707232698; c=relaxed/simple;
	bh=Bc6ApgyjdpwH6BjfBlepT8FZpukkBxSW7WCOlWlB61M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cj3fF5NvwFA/Z884Nj7DbYApuMPZ1k/fO2djmv/qhK5flPOORMIse1j/1p/NV5soV0voSamMLxuTP5AEfxaWOEZk9dyBDba5VqI+msAss2R6thnoyvd1+EMH62VX37yuVVIIJlhJAafb/K5COlbgYd0AAb5GnKoaRMf/VGkemi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLTGNYi3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707232697; x=1738768697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bc6ApgyjdpwH6BjfBlepT8FZpukkBxSW7WCOlWlB61M=;
  b=NLTGNYi3HjpDB3RPHU7WvSHFCVl4SsTHrwjw9+lLNEr1j1jar1BU1gg1
   5qzxCJVAz2m2JPoqTxQ1NaTAY7nBulzYTqyjd6I3yXQJ1teLD6uuNJ0PD
   O3EGOU4/ypUpB++KbC+di7yhQw3GSkczBXJQWG5tKPIiEbOOjJdk4e54C
   PbtCCKImsB1VX7UZUSG/wTerlda7afnWaD8J5qUKcBdOZgAquXEDxq74y
   1FUo/m1qaPrHFEi/JuwgdIzsXIQMkduWNKTlDgbnmrrgyBm+O6OLo91Iy
   L0iYTIF7cOrOhuKVSdS9+cGQw9TxThcV8jk3Czl4zOqrvqTD5Ba6i9xbE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11413085"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="11413085"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 07:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="909665033"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="909665033"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 07:18:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rXND8-00000002N9W-3Oae;
	Tue, 06 Feb 2024 17:18:10 +0200
Date: Tue, 6 Feb 2024 17:18:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 7/9] i2c: designware: Move interrupt handling
 functions before i2c_dw_xfer()
Message-ID: <ZcJNsv7w7CYiFNpm@smile.fi.intel.com>
References: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
 <20240206145158.227254-8-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206145158.227254-8-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 06, 2024 at 04:51:56PM +0200, Jarkko Nikula wrote:
> Code is more logically arranged when i2c_dw_read_clear_intrbits() and
> i2c_dw_isr() are located before i2c_dw_xfer().
> 
> Real reason for this is to prepare for more shared code between
> interrupt and polling mode code.

...

> +	/*
> +	 * We must disable the adapter before returning and signaling the end
> +	 * of the current transfer. Otherwise the hardware might continue
> +	 * generating interrupts which in turn causes a race condition with
> +	 * the following transfer.  Needs some more investigation if the

While at it, you may make it consistent, i.e. by dropping an extra space.

> +	 * additional interrupts are a hardware bug or this driver doesn't
> +	 * handle them correctly yet.
> +	 */

-- 
With Best Regards,
Andy Shevchenko



