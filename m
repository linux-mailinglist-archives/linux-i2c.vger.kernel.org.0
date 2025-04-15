Return-Path: <linux-i2c+bounces-10343-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14B3A89DC5
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 14:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24D7A17FD28
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 12:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2677429B79C;
	Tue, 15 Apr 2025 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVMNqHO/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8971F3FE3;
	Tue, 15 Apr 2025 12:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719463; cv=none; b=ZC3vIDodmjdBe0O4llA3pldXk7q0MFjv2w/27qq6OiBzUIBZ7ARbEFuCHphiK2Xp9Rs3IGXvN+gdl4t96cjC0P0wAMNwN+ZZ397t0+9NQBhbpJpbbGg17N+9WnuC5ebNrivcHb0uNJhBroQUWBv4wYYEXQPjZxfrzVBqpZwJ6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719463; c=relaxed/simple;
	bh=680YusfcDIJHGakz22M+4X2qU3JsC2WO4jYYg3Pt/aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6a2FR0EbKls3gXuu4ivJBa8rCU5PPx/p9fQYcG26QY81KBObLkXIpsUs2ByHvZvZp5JdFkp96lcZO3B2zJ1d1F4aUSWxqKYkvNWqqKnSUA54qK6XvfXFfbzBo0B1s5pcay4/1RPbMuObDclWAsz4YsYzNP2LUYRTT2WE7C+rZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVMNqHO/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744719463; x=1776255463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=680YusfcDIJHGakz22M+4X2qU3JsC2WO4jYYg3Pt/aQ=;
  b=HVMNqHO/j4ZGvmHNt9U/7JDCfFI4Y0OxEWa/Q1V9rClXySZdKqUEKYhj
   qHN0HVMsDAxVMQnge5gZhtUVy9m3SCfDfH6zBD0uNkLVsRspVzzHNpwNj
   76kRUnq3a1kDxQRNlCSDsKv+CTxUppwJrNahZyvOq3rxC3XM/BHWDbss/
   821PKUZ2EeYKYEEWV9hdmGGSuh96XykS1iLKKEHBvF2cWlvlXRu9ujkBT
   ErmoaXnXhabzurYdW/+Up7KUtVVI9/dYR7VnRJzKJdErILNuEnMOZIale
   moOPF5ENotAEIrA8PzyLmR6u0N+XBcuq2GrXrT2VlvQrGRfyXfYJ/hc4T
   Q==;
X-CSE-ConnectionGUID: S3VeUeMwQNWOhBL5hNP9aQ==
X-CSE-MsgGUID: HJN5lgmKS9eEB8M/QJoc4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46238343"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46238343"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:17:42 -0700
X-CSE-ConnectionGUID: pRhAND7iQcyf+1LZsJBDRg==
X-CSE-MsgGUID: d9NlFOTyRg2IN4NLnBc95g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130436978"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:17:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4fEP-0000000CXY4-1Ams;
	Tue, 15 Apr 2025 15:17:37 +0300
Date: Tue, 15 Apr 2025 15:17:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: Luis Oliveira <lolivei@synopsys.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	kernel-team <kernel-team@cloudflare.com>
Subject: Re: Hitting WARN_ON_ONCE in i2c-designware-common.c
Message-ID: <Z_5OYSxZS05LO7cE@smile.fi.intel.com>
References: <20c191d9-5f7a-4ec6-a663-dcc8d0b54c18@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20c191d9-5f7a-4ec6-a663-dcc8d0b54c18@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 15, 2025 at 02:03:26PM +0200, Jesper Dangaard Brouer wrote:
> Hi Maintainers,
> 
> I'm hitting a WARN_ON_ONCE in drivers/i2c/busses/i2c-designware-common.c
> when booting the kernel on our Gen12 hardware.
> 
> I'm using devel kernel net-next at commit 1a9239bb425 (merge tag
> 'net-next-6.15').
> 
> I assume you want this report.
> 
> Maybe it is not a critical error(?)
> ... looking the comment in the function:

Have you forgotten to compile in the drivers/acpi/acpi_apd.c?

-- 
With Best Regards,
Andy Shevchenko



