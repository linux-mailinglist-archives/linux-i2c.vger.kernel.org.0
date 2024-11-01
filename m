Return-Path: <linux-i2c+bounces-7718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E89B919A
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 14:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0C401F23229
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 13:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949AA19F464;
	Fri,  1 Nov 2024 13:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6eBVc1x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F924156C5E;
	Fri,  1 Nov 2024 13:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730466746; cv=none; b=CjvAfXWQ+TEv2UP2VwfLTc4+MwGuOikc3MF53i3s96+XLQkV0j8vwlLyvaaRKe0QwMCmP0+K/n1VG1bMA6zyiXfMu6F1Wkg78fG0Zbk0DK+g4ypydGelYcoYjxULhIOS6WS1Xp0SeOi5t6mXtrCqoh+tO0c8eBSA8+Z2olMvzfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730466746; c=relaxed/simple;
	bh=FvvkMv5YLfzduJjZcjlfjCmbHf/dOLJrKj3AM3w+wuU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0g7Vcfl8PZnYGIV4z4THONUtoZIneJCqf2dHs6zlfiDlgXw9vMJFqb7X/AsWytWcDrFRiKJ+Dqi21Ak65+OTsWm1kEPkWfYIaujcAFuiInbSgpeg1VNPDDjly71zGvooECaO/IVrYdV2Y8o1tPDV/B711rPj0P8Y9lvXqtOUEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6eBVc1x; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730466745; x=1762002745;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=FvvkMv5YLfzduJjZcjlfjCmbHf/dOLJrKj3AM3w+wuU=;
  b=b6eBVc1x2mGsih5rddGhT+lMiS9xlphyvNJ06j/pAD2ZNCBPFZOMZ29F
   SfK0fkrDsJI3t1iOdHjqNbG3jPlDK9HkMk+DVurgsjhsiFt7R7q/blH4v
   iGvzvEk6z6XXaeUEauUqXlUN0z8X2cI7auCu8q4I38cB4TofPYgoXzpdm
   HPuo2V0+cX50GxlRY0rx6OoMcWsAp5wmfwsRLKYsfPP8Jhc9n53moLsak
   Ytp6nBeWfSiw8kOAc7tFRV9Cnt/NMo8RZwONWTHtrGhlSMQ2k+TGLy3pp
   PlEIAUmGO6+pvTaA3XOc7C+2U89DBBca6CYg5Tbhsr2P4o7WFMLXx60l3
   A==;
X-CSE-ConnectionGUID: lizxyZ3pQ3KY/NqsJNWImA==
X-CSE-MsgGUID: W6P8q9H1TYW0EclT8QGoEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="55630843"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="55630843"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:12:24 -0700
X-CSE-ConnectionGUID: 73C8zUomRtCSQefpzybn0Q==
X-CSE-MsgGUID: xtxxTxskSsq6S5DxFlZPkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83780090"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:12:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t6rRs-0000000A2Rd-0gT1;
	Fri, 01 Nov 2024 15:12:20 +0200
Date: Fri, 1 Nov 2024 15:12:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: Use *-y instead of *-objs in Makefile
Message-ID: <ZyTTs8gFx5r_N5Pi@smile.fi.intel.com>
References: <20241018150337.2182181-1-andriy.shevchenko@linux.intel.com>
 <ZyTIf8l1ghcyzJUH@smile.fi.intel.com>
 <ZyTNA34Y1BRxMhhn@shikoro>
 <ZyTSZTcNU63F2GjY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyTSZTcNU63F2GjY@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 01, 2024 at 03:06:46PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 01, 2024 at 02:43:47PM +0200, Wolfram Sang wrote:
> > 
> > > > Let's correct the old usages of *-objs in Makefiles.
> > > 
> > > Any comments?
> > 
> > LGTM. What about fixing the drivers, too, in one go?
> 
> What drivers do you have in mind?
> Shouldn't be separated commit anyway?

A separate patch just has been sent.

-- 
With Best Regards,
Andy Shevchenko



