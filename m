Return-Path: <linux-i2c+bounces-10223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A5FA80F6C
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 17:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C80D175AB0
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 15:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F6C224237;
	Tue,  8 Apr 2025 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N03VHVOj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C510A1A314B;
	Tue,  8 Apr 2025 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124948; cv=none; b=hJum2mI0pSSHOMfk1QY4Okt5VVKR9i2NgSW+PaIyueNH7YaUDkKeOBHFh90aXL5bKV8Ua5PW5meG6u4BdzpVxAzUZ0ffvurzq+TStGVpk5pa9VD2EGCo0ppmI7hmErhwHt48WSM/SWmZ1RDQposxPx31UG5TXlcBtNWiKZp9iHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124948; c=relaxed/simple;
	bh=RwfNPKuGr/tX+bUekrqMT5Ymihw+pvrVdeKlfUSlglE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulB5MXpJoYYvXMOxhtgsAUNx9ANpkYM6XHT3XSYwNTpwFXr0ze6BFqlfgAQUo7gPXYIzwuYEHJLJFZH1XYL0qIFSpz5GdcQM/MeVO1H1b4Qg5DieKYZPxA+9CXAYVhwJtirlL3zIedImjmgxgNPlTsU51GY1GNs/Wq+2sMRhgcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N03VHVOj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744124946; x=1775660946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RwfNPKuGr/tX+bUekrqMT5Ymihw+pvrVdeKlfUSlglE=;
  b=N03VHVOjLCyTZombvPXl9gkmS5hpRLcNNaz/ND82RSD1iw246bI7vPHo
   zWo9iSY9S3iS9zTbbuuPmDJqVOFGjCTgfHHgKwb9pAXJvqpFFT3gqn0Ek
   lPhMmcWKTCNDD8EBBfrSbrFDnZztXLfpZZMbP788j1htxpKpl1xM0vNXS
   Azvo9AlQKN1AZJqCFLDMxcfuYUpmXHwL/JI9oUUqcktTCFSctthPwOudN
   wsJP7Ikh8jYQWv59YD23Tr5CPuuUHOMKeOfADtrEXaERMYgKgsDSNtVxl
   Eyp5RLw4jymSGP9tIGvW0gMHW0JBozGrwq/hZefEKUXxnCDwj7t1V3r8x
   A==;
X-CSE-ConnectionGUID: Glbk309LQd+3Y1BDEHll3w==
X-CSE-MsgGUID: whOk/wlcRymBtDyprakbpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56544745"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56544745"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 08:09:02 -0700
X-CSE-ConnectionGUID: 7C9t1J2oS/G97wxH9g3xuw==
X-CSE-MsgGUID: HtCzBwWlRxGqC8wI5qS2Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="132432567"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 08:08:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1FF9811F74E;
	Tue,  8 Apr 2025 18:08:55 +0300 (EEST)
Date: Tue, 8 Apr 2025 15:08:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 0/7] i2c: core: Move client towards fwnode
Message-ID: <Z_U8Bza932tsZO66@kekkonen.localdomain>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
 <Z_U2HLZN4XrbB-ly@kekkonen.localdomain>
 <Z_U3VcFg0ZtSnLcg@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_U3VcFg0ZtSnLcg@smile.fi.intel.com>

On Tue, Apr 08, 2025 at 05:48:53PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 08, 2025 at 02:43:40PM +0000, Sakari Ailus wrote:
> > On Mon, Apr 07, 2025 at 06:44:56PM +0300, Andy Shevchenko wrote:
> > > The struct i2c_board_info has of_node and fwnode members. This is quite
> > > confusing as they are of the same semantics and it's tend to have an issue
> > > if user assigns both. Luckily there is only a single driver that does this
> > > and fix is provided in the last patch. Nevertheless the series moves
> > > the client handling code to use fwnode and deprecates the of_node member
> > > in the respective documentation.
> > > 
> > > Tomi tested the last patch, but since it was separate there is no tag (yet).
> > 
> > Apart from the two minor commit message comments:
> > 
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Thank you for your review!
> Does it imply that media patch can go via I²C subsystem?

Good point. Yes, and you can use this for the last patch:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I wonder if Tomi would still be able to test (or at least ack) it. I see he
has tested the rest but this one is missing hist Tested-by:.

-- 
Sakari Ailus

