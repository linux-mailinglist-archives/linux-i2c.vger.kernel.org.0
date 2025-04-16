Return-Path: <linux-i2c+bounces-10423-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA62A907C4
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 17:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0FF2447D01
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 15:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BE6207E13;
	Wed, 16 Apr 2025 15:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBcX0waA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98168A55;
	Wed, 16 Apr 2025 15:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817387; cv=none; b=d9V0JktP3c5/YQcx6mgsJRnQKIt7Mc8fgv8CshfHF0aItz9BTsg4+QkDnGMbykA16OWtBiiI74b0+W45Dt7l+ataIxrV1QotE4thGwLVIfUp8cgWEmacZCXVzVPHsoiIef2valq9iAKx+DWgPF64yQ59y45BFwdI1d8xf56bKOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817387; c=relaxed/simple;
	bh=agQXKgi6oYodzmo7iliNXQbQWlwWFj/taShmHuxsmNA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U71NhhpBUIjWb03dz4V85S/3d8PoTcbQ0RxOF8qzf+7Fv0d1K8MtwfMDyjknDiMocHY/mqfR2xO/K3PyuJA6HDqz4wv7OMRwPTeam/VX+2tzLLM9eJLprJvFb8CLY66j/zfn0yr2cGRxtUbb/pOYktCv6PF6CiQ2Q9OzmMCng00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBcX0waA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744817385; x=1776353385;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=agQXKgi6oYodzmo7iliNXQbQWlwWFj/taShmHuxsmNA=;
  b=PBcX0waAqjtAbUVx21yLqNyNEPnJ0kAp2Tgj9oLQHIE984vZHOj3/14Z
   AbMPXkF0uoXrzziIvpmt0yIRgtUulNl6lAKSyzX3ZNbXq4zssxl1Bthn0
   Gjeerh/8AOWP76EZN3iVHoEgF2VTwOUTT4jXwpBUI9E0FgdA8sjDq7HnM
   4dVAScpFmtY+z50zauIAbAW031O0shcDUsyiv3qdDQ7mbclVstq9Gsmyg
   4T8Eg3HX5hYzcaOEz954CKsJX7lL/pJayQhlKBThwc3oJL9+jKmkeZjrQ
   5ViTLQZWJFBBZeZ6ylp6FJJi66pvJDsbyllpFD+Wn8Q5/dXWIcNbLMAjE
   w==;
X-CSE-ConnectionGUID: 9iq0iUM3R9CxcAPPvtRoyA==
X-CSE-MsgGUID: qtLULbwlTZiwlvdhYRYEEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45509134"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="45509134"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:29:44 -0700
X-CSE-ConnectionGUID: R4ttHlFdSx2KlT1Fy6R+ug==
X-CSE-MsgGUID: 4SpjMaa9Tf+nnFbh/zmRIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="131493597"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:29:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u54hn-0000000Ctlz-1ie8;
	Wed, 16 Apr 2025 18:29:39 +0300
Date: Wed, 16 Apr 2025 18:29:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 6/7] i2c: core: Deprecate of_node in struct
 i2c_board_info
Message-ID: <Z__M45ZIH_l1o9eH@smile.fi.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-7-andriy.shevchenko@linux.intel.com>
 <Z_69Jml3-CKi13wB@shikoro>
 <Z_9NEK7BDrvAQ0Qo@smile.fi.intel.com>
 <Z_9UHrgho0dGoUrG@shikoro>
 <Z_9WtfVzSDuxmqLK@smile.fi.intel.com>
 <Z_-p4HL2pUvEUvWg@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-p4HL2pUvEUvWg@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 03:00:16PM +0200, Wolfram Sang wrote:
> 
> > At least the main objective is to avoid new code using of_node.
> > The rest can slowly rotten on itself (esp. if there is any under
> > arch/ for some old board files).
> 
> Do you know of some examples? I mainly found i2c-powermac and I3C core
> with my two approaches (coccinelle and grep+awk). But maybe my search
> pattern is weak?

At least the first one is what I have a WIP in my local tree.
I haven't checked much and I anyway forgot the results already
(it was at the time of v1, so a couple of weeks ago or so).

-- 
With Best Regards,
Andy Shevchenko



