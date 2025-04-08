Return-Path: <linux-i2c+bounces-10222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD68A80EF2
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 16:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D6A73B46D7
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 14:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351681E9B16;
	Tue,  8 Apr 2025 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYJhIm2v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BA31B6CE5;
	Tue,  8 Apr 2025 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123741; cv=none; b=mNHZZrkJbEeqUe+ikrk/zgGIaV+ZqJQ2awckd1nC5QBgSJR8+hq5PTkbkDEshLVzwBhWIZuzg5RI+m2OgJ4yev/qSBaQ+yBqZhflO3duVBXrE+p1tANbQq8gLt9KFtDzEjFASzikRupSLQwUucozKhEvwguIePOsh8+OFWhrOVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123741; c=relaxed/simple;
	bh=aeGG/G4C0WrUQMHmkDPtULd/jCcQyouQwWePL/m/5VY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3wmJcBrN3ZyXQfbBd/2S6Yr09upQGKMVad7dXsomasPIJBk7kF3M8kWbOoFumjOovcCsC2TORf/m8MGu3xhsD1fazmsCIOsHls1SDFT3pD8KjhEF5WGCQGxGLHUOisGx2m99u0WzahMzBwTx51BrdbCAlPfStWW1YHy0ZmxJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYJhIm2v; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744123740; x=1775659740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aeGG/G4C0WrUQMHmkDPtULd/jCcQyouQwWePL/m/5VY=;
  b=TYJhIm2v2pqg8djm7bP45an9+iRBphg3JVhA6RjuVggrNBg5EE9T30ct
   OjAoRkoi/eYXIaWNKl1YGUf0t/s/UMnDUxhhc/PiV+35uoktQiXQpwzsh
   3WwGX4Hn2ZrJbGG1MmhepEDIV8wHQpWprARmNOEz+U7dlw0Goqve4MqDT
   72DkGQuS3hrzDah6moYh1xR3drdK3UkD+jb+27GzCneGpNhmw/UgU7uTw
   mMi1kpMh2VrQtYFFfudzWIcy3GGuVkAO0hakTjmk2R227I9KjGo5oJPpo
   zJN6oTCLIl47ftHPOIzrkHVZEsN0CKawu44ajM0eqtR6ge3EtUTC75y3f
   A==;
X-CSE-ConnectionGUID: Nut49xbvT/KsMgcVGo1tIA==
X-CSE-MsgGUID: r6QF81UXQW2Bq7fFjeH1Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49220183"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="49220183"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:48:58 -0700
X-CSE-ConnectionGUID: ijXW++7sTpm5XfSZsoru8w==
X-CSE-MsgGUID: dntfW6/RQdK+B4TjSfJJBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133442752"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:48:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2AFx-0000000AQvz-143C;
	Tue, 08 Apr 2025 17:48:53 +0300
Date: Tue, 8 Apr 2025 17:48:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 0/7] i2c: core: Move client towards fwnode
Message-ID: <Z_U3VcFg0ZtSnLcg@smile.fi.intel.com>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
 <Z_U2HLZN4XrbB-ly@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_U2HLZN4XrbB-ly@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 02:43:40PM +0000, Sakari Ailus wrote:
> On Mon, Apr 07, 2025 at 06:44:56PM +0300, Andy Shevchenko wrote:
> > The struct i2c_board_info has of_node and fwnode members. This is quite
> > confusing as they are of the same semantics and it's tend to have an issue
> > if user assigns both. Luckily there is only a single driver that does this
> > and fix is provided in the last patch. Nevertheless the series moves
> > the client handling code to use fwnode and deprecates the of_node member
> > in the respective documentation.
> > 
> > Tomi tested the last patch, but since it was separate there is no tag (yet).
> 
> Apart from the two minor commit message comments:
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thank you for your review!
Does it imply that media patch can go via I²C subsystem?

-- 
With Best Regards,
Andy Shevchenko



