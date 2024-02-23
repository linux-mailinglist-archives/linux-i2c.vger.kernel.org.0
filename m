Return-Path: <linux-i2c+bounces-1947-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A78F4861569
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 16:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D985F1C21B4E
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 15:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C88381AC6;
	Fri, 23 Feb 2024 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbSI4xlg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939BD8288D
	for <linux-i2c@vger.kernel.org>; Fri, 23 Feb 2024 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708701609; cv=none; b=TWsW3bqNzp7ONUSMHKsqDdTRttKbqn6Gp+Y1We6zGGKmKAIQ/FLcmOGr+snrMk0p0LKbFV5FWOIG4ZTA26Zj6LJzCuvUMi0wQ54+ceIpAhss2EFe6ah/LntqMan3uziSPJjGjb4e4E9XZDKmQ6odawQNgRFQixGiG/R4D4Vry4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708701609; c=relaxed/simple;
	bh=WatZofJZa7sGjZjsJdj7Yhpb5Jl5j6pb5w8VvpdiJlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tI3xNwztgOS3pRGH75qhT05I58xb0NQtcFm/C5WuGuTEfdExcj6/07sgRVc0tx6jnplzY2oa4Gl6vQwOHdHU6fcxx4BCR3oAHa0Rg2Rdd0IwsYHQBPOsphLRjjhu8C1VlsvFcnT6UMrf/zsnZx53KH0lxsLD4Qp71DEyqXNtRvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbSI4xlg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708701607; x=1740237607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WatZofJZa7sGjZjsJdj7Yhpb5Jl5j6pb5w8VvpdiJlM=;
  b=YbSI4xlgRScPSgFnSGlu2uWg0Fxb/jq+bNwi/9hGip7CY6mdeshBYLH0
   O7GnBloiRHH502GlWq0nxyKPRiyX1b7FvS/9x8ZNO7qmrtswAGRgvLDAt
   BZFmNsLbKARDMKJDSCcksT1tP8oL04YWNpRHqnslaNKVMnHjURGBtLJP/
   lWVTcRS6JICACDN0jYRrie/7xf6tZOTkngljU1i1dbZaVfHAPMzJpE5Pn
   gJdDAywAqcx13/PFgex8vF+EBcD0hcuKcYjQerQiLuKmVin8Q1IHL6whS
   WbecqNpHJ8AntI4LcA0/rqhQ8R+SprlK2Id6R2fhI6fgXuNcS2qoAds27
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6837577"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6837577"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 07:20:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="913748853"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="913748853"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 07:20:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rdXLF-00000006vwn-2KrM;
	Fri, 23 Feb 2024 17:20:01 +0200
Date: Fri, 23 Feb 2024 17:20:01 +0200
From: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>, linux-i2c@vger.kernel.org,
	'Andi Shyti' <andi.shyti@kernel.org>,
	'Mika Westerberg' <mika.westerberg@linux.intel.com>,
	'Jan Dabros' <jsd@semihalf.com>,
	'Sanket Goswami' <Sanket.Goswami@amd.com>,
	'Basavaraj Natikar' <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com
Subject: Re: [PATCH v3 0/6] i2c: designware: Generic polling mode code
Message-ID: <Zdi3oQ87rfvIMUsH@smile.fi.intel.com>
References: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
 <003901da624b$89c7c190$9d5744b0$@trustnetic.com>
 <c813d6d1-e37f-44d5-be40-67976f49cdb7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c813d6d1-e37f-44d5-be40-67976f49cdb7@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 23, 2024 at 05:09:37PM +0200, Jarkko Nikula wrote:
> On 2/18/24 11:19, Jiawen Wu wrote:
> > On Tue, Feb 13, 2024 8:49 PM, Jarkko Nikula wrote:
> > > Hi Jiawen, Sanket and Basavaraj
> > > 
> > > I hope you could give a quick test to this patchset to see it won't cause
> > > regression on your HW. This is mostly the same than the first version what
> > > Jiawen tested earlier but in this 3rd version I decided to drop semphore
> > > touching code patches from v2 due they being out of scope and fix a few
> > > things noted by Andy.
> > > 
> > > Changes are in the patch 3/6 with two minor fixes to comments while moving
> > > them and the patch 6/6 where i2c_dw_wait_transfer() is slightly modified
> > > by Andy's suggestion plus I decided to remove one comment which became
> > > unclear after this patch.
> > 
> > Hi Jarkko,
> > 
> > I've been testing the v3 patch series on Wangxun 10Gb NIC, it works well, too.
> > Thanks!
> > 
> > Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>
> > 
> Andy: Was this set ok in your point of view now?

Yes, I hoped that Andi applies it earlier last week or so.

-- 
With Best Regards,
Andy Shevchenko



