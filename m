Return-Path: <linux-i2c+bounces-2920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8918A3198
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 16:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEBE61C21C2D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05A5146A79;
	Fri, 12 Apr 2024 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZ+7TOIl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBB9145B36;
	Fri, 12 Apr 2024 14:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712933657; cv=none; b=aku2LWtGaiOA4OMlfCqO+sOtYv6HLeGG37hziF2iMjGH5mMu6axqJvED27eh1Ln+Sv/Ur7GTm41TsokzEXQ7/3aHjJGvHre8lqbi6VNhMnW4TYPup6UpiO1NADK6sz07XB1t3H6UNfE1/HmM1NP3880lr4ElOnrGxCOKl3VMs9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712933657; c=relaxed/simple;
	bh=in6s0CayvsuzQeqaiNyjVowzPqlZrAQVR/B3bv4tggk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4BU6hTSz0iODNBmRxJzExBXNEXjrWG6ihQeOuEaivSuUOY9fBsUfAeqf5cwVM2ka8Bo6Lr18b7Sy8vDM1kYGZ93iSF1fy7wwuDyfVi9cpEwnXmkHEtNSnX81/D1/eJK2ABSmqB42fth85RB4pcSPWi2qembERwJ4wtjYieDCnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZ+7TOIl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712933656; x=1744469656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=in6s0CayvsuzQeqaiNyjVowzPqlZrAQVR/B3bv4tggk=;
  b=PZ+7TOIl3IMkcVwvngqbigo3519xjbImb4htVZ5I/Ae5SO2umBr1U6cZ
   ZoFxJMp7/lvDcoit1zc/mkZxZQfo94VDm09Ct0CrK8nof70cAcvPnZwKK
   1JC4jwA3j8vw9fjKW3ZsfUpaFON6m2s5371j85RR4Lx78TrfdWf2DX79F
   wv9dPSnuo3KTGXIjTcKJYCrH4KIthUS+qqKUEiRqGppfV97CYQVUe9ZzH
   FfPNpuj6n3pRu2OBBVT9H6ozBsk5Ksap3v8ROVsMFPAHnYmktRQXBvvk/
   ZsBBEqDCcu8jWcocQ+RpCZp0pCn917AhYFkfF9jGQnhmpCSVonjp0fcKh
   A==;
X-CSE-ConnectionGUID: EtnHBXRSSiGavd3eXC5xmw==
X-CSE-MsgGUID: ZzY2kez7SpGHngCwWB3tDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8249778"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8249778"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 07:54:15 -0700
X-CSE-ConnectionGUID: 6fFYUjUFQBanhxX5HwRLfw==
X-CSE-MsgGUID: 167iCC+KQkS2JkX98wu9pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="21238596"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 07:54:09 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rvHtF-00000003eRB-20ZW;
	Fri, 12 Apr 2024 17:28:29 +0300
Date: Fri, 12 Apr 2024 17:28:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	kernel-team@android.com, Wolfram Sang <wsa@kernel.org>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 2/2] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
Message-ID: <ZhlFDeDxict3ThJO@smile.fi.intel.com>
References: <20240411235623.1260061-1-saravanak@google.com>
 <20240411235623.1260061-3-saravanak@google.com>
 <CAL_JsqKRVVNzgQk6PETfJ9RrDuzT1CTjHWW02Twc_T4C82t__Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKRVVNzgQk6PETfJ9RrDuzT1CTjHWW02Twc_T4C82t__Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 12, 2024 at 07:54:32AM -0500, Rob Herring wrote:
> On Thu, Apr 11, 2024 at 6:56 PM Saravana Kannan <saravanak@google.com> wrote:

> I think it is better to not have this wrapper. We want it to be clear
> when we're acquiring a ref. I know get_device() does that, but I have
> to look up what get_dev_from_fwnode() does exactly.
> 
> Side note: I didn't know fwnode has a ptr to the struct device. I
> wonder if we can kill off of_find_device_by_node() using that. That's
> for platform devices though.

I don't like the idea because we already have a big design issue with fwnode
that is used in struct device. Ideally, fwnode has to be a node in the linked
list, head of which is provided by the user (struct device, for example).
When it's done, it will be easy to handle.

Have you read the comment in the struct fwnode_handle definition?

-- 
With Best Regards,
Andy Shevchenko



