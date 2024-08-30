Return-Path: <linux-i2c+bounces-5967-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36099668FF
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 20:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A053A28571C
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 18:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC4D1BAEF5;
	Fri, 30 Aug 2024 18:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iU5/2uLR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DFF14831C;
	Fri, 30 Aug 2024 18:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725043001; cv=none; b=ElzZmzBJp1jcZGIAaFP2ZFVofvBH+GiszuRK7XG/xf0cWZTGQgGszVxxNmaMLUhPqFnUFw+gjfRMbjQ71691y4g7af/yHLHewoJwYGJPzcdSkH2spEAeAG+byzHtGWkSxY1kEjr0vZ9C2e/ffoRxMORpdA0WUzAE44n+Q3OmA8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725043001; c=relaxed/simple;
	bh=rI/rbGiMk2OYoAJWrDTPYBZiOMXUdMM4JWp7f0WuIPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDTaNunKf3pH5IkCzrAwmfnQSj17KmBnmdzbRDkEvvyVsNdCvZ9RqbcheCsK/4XrUhYL9QPC1ZyebP4xqZ1UWEG7mFrX9bU2sSv3RVGO/7kDNzDsAEeE2N+sxeJXnzUZ53NzaaIKrik5OXQsPK7rEiq9zaQPE7LH7nAgNiRkeLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iU5/2uLR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725042999; x=1756578999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rI/rbGiMk2OYoAJWrDTPYBZiOMXUdMM4JWp7f0WuIPE=;
  b=iU5/2uLRdgssESOa3BDi/dLyUyfnZkXvd5az/mF0tfmzR6BL7rCpF5Jh
   8T3mfQ0VJB/DR/2urABgJyGDrHKW8bWYXR4NZn7kwt6/mZPEfzEPls+nH
   bEkuiYLizy6O+9X5k+44KFIdV0qhVlyOk/DDqjLVUz/0IcBXyKK3W/90d
   Fy24esvP5FKlNYC1Z5XiHZj4Zq7hIzXmEmNKYi7U3fL646WiXQtNh1gVk
   bNLYWzyLQ78p4IQ/w+XkEKxBxcG0Uin5++6jTk1oElq7gk2MpzyjCHOU+
   faINB2wrk7ZZVMSePubgkW58zJjk5Rg1ZwNtMlkY/uuJzkGkPFbCwFqGo
   w==;
X-CSE-ConnectionGUID: PhJCCUCuRIGngxUGhpCRjw==
X-CSE-MsgGUID: 5/V1NYaGQLKKH3lUQ+kLJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23833565"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23833565"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 11:36:38 -0700
X-CSE-ConnectionGUID: lkOQGzLOQb+l11QS6SB70g==
X-CSE-MsgGUID: Z0sY8LeNRMG8e9gok0U7sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="101468049"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 11:36:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sk6U4-00000003Riz-3AXw;
	Fri, 30 Aug 2024 21:36:32 +0300
Date: Fri, 30 Aug 2024 21:36:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Goswami, Sanket" <Sanket.Goswami@amd.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>, Kim Phillips <kim.phillips@amd.com>,
	Shyam-sundar.S-k@amd.com
Subject: Re: [PATCH v2 1/1] i2c: designware: Consolidate PM ops
Message-ID: <ZtIRMLwJhKHGVwNv@smile.fi.intel.com>
References: <20240827150101.2171107-1-andriy.shevchenko@linux.intel.com>
 <9d424592-c157-417a-9d6e-d12d80e19829@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d424592-c157-417a-9d6e-d12d80e19829@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 29, 2024 at 08:25:27PM +0530, Goswami, Sanket wrote:
> Adding Shyam (as he asked me to check this change on AMD systems)
> On 8/27/2024 8:30 PM, Andy Shevchenko wrote:
> > We have the same (*) PM ops in the PCI and plaform drivers.
> > Instead, consolidate that PM ops under exported variable and
> > deduplicate them.
> > 
> > *)
> > With the subtle ACPI and P-Unit behaviour differences in PCI case.
> > But this is not a problem as for ACPI we need to take care of the
> > P-Unit semaphore anyway and calling PM ops for PCI makes sense as
> > it might provide specific operation regions in ACPI (however there
> > are no known devices on market that are using it with PCI enabled I2C).
> > Note, the clocks are not in use in the PCI case.
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Tested-by: Sanket Goswami <Sanket.Goswami@amd.com>

Thank you! Andi, can you apply this now?

-- 
With Best Regards,
Andy Shevchenko



