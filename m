Return-Path: <linux-i2c+bounces-1678-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9184F73B
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 15:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF1731C22EAB
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 14:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B2167E72;
	Fri,  9 Feb 2024 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmgBiuyy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A172C3C46D
	for <linux-i2c@vger.kernel.org>; Fri,  9 Feb 2024 14:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488744; cv=none; b=kRyi6WnIr6saxqLwWpjDgCdNBtG3pyqqg21HPV4a6AGMYYYMS8Zkg6DL8AVviw0rlhDgY9aylhNerCin4LWE8JHhn7XPfM7B57u0i9BlKHQjf6tcim2KrVjZx3V07f6/FowaCYcvu2cpONytuLLMw9BhfSCjqgHHpU2sHzbRDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488744; c=relaxed/simple;
	bh=bD0qncuUGI/gKL5gUEf8MWvaO7VXsTutGTkTaVJyyvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhMMEko/1KzbCHwOilLIppNTmSe2Lt4NLjaqCpwfEmBm9xHI679QYZj+sySdMvN4vw3hfK46IKUx3bTrV1EXFBIGL/mugaBSNSuYcA5KGoRT2ybrnc3IxZXkehDdaAoODjmzcovl+DI1eywl8yL0n/MeqW8pakCADAH2xG6/ZVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmgBiuyy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488743; x=1739024743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bD0qncuUGI/gKL5gUEf8MWvaO7VXsTutGTkTaVJyyvc=;
  b=NmgBiuyyMz58O7Kx4EIaUxzP9yqvyXUmLWH/pTRQi5y1fCLjSfWCYeKP
   AVZE1wZTCgyeuszpm5ZmTzk3HPpmdHjhUjUb2k4fzvVrMM8KSmuWxobKj
   VCfi+ISVGh/f8AeKrqhqy+bDCWyZ0OTJsbCWYFlIFj5s7OqSMKZO3SVG1
   dbAVsXWALdyMKHGgofD5JcLUSBltRk73KZEL2l+s9WWOZsMaLREAX8IGa
   1vRA0STMgJTcaOsBYC9V3cs9BnGf3QlIWL6euxbc1Yefy/ZMV2iKYZ2gi
   7SG4w9pqVxqZU3cpcwXRJ3ra/GAKrBt0imi2Jq/5vjIWKgxUG/UxUA+YL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1340900"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1340900"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="910723090"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="910723090"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:25:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rYRou-00000003AdP-0fDv;
	Fri, 09 Feb 2024 16:25:36 +0200
Date: Fri, 9 Feb 2024 16:25:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/9] i2c: designware: Add some flexiblity to the model
 info
Message-ID: <ZcY132jyoUqNTDso@smile.fi.intel.com>
References: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
 <20240206145158.227254-2-jarkko.nikula@linux.intel.com>
 <ZcJQljILDGq9Xk_A@smile.fi.intel.com>
 <849af5df-4b7d-493c-ad70-b99fc322af90@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <849af5df-4b7d-493c-ad70-b99fc322af90@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 09, 2024 at 04:14:37PM +0200, Jarkko Nikula wrote:
> On 2/6/24 17:30, Andy Shevchenko wrote:

...

> I was thinking I'll drop these first 3 patches in the next version and go
> back to v1 version. IMHO it's better this patchset to focus implementing
> generic polling only and not mix with cleaning up the semaphore or other
> random stuff.
> 
> So planning to go back to v1 version and take your notes for v2 7/9 and 9/9.
> What would you think?

I'm fine with that.

-- 
With Best Regards,
Andy Shevchenko



