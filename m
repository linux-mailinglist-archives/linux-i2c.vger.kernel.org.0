Return-Path: <linux-i2c+bounces-10219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B62EAA80EB6
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 16:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3438188769E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 14:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88D01E5B7F;
	Tue,  8 Apr 2025 14:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8vaNK5I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3C51C5D61;
	Tue,  8 Apr 2025 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123427; cv=none; b=U2J5lwNX7Y2G9TgWKyv1RaxvIxQGMK6spjGilBplJG6+D9xOxmsblpR6lbFyjCc+KSiQlgE2ubxDDRy1Cpv9KTfcaqKvn3JH2y9mv9mEozN0WCClhBVvCgVJvK4+U1hy4iuavyAwZdF1iG1ZctRcnx8otv1FFYSmwaJZxWYBqX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123427; c=relaxed/simple;
	bh=zGdt+ukPlAMOCFqD1yNzf/Vh5n9UxPgNGy45Hy0mfG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsoTWjqRyybn0+dfmkXQxx9nBrM62kGgrtdnX9l2sGnG0eMNtqPq9kuPMnB9Ih1gd8LTFti6m7AVnLUzVX64WUAwS6cbIXBikKdLmO+BH4kzNXgdkt2qsdluflZkE39z8PxJuR1/bFXWXrYTwA2yYAa/bHJrhYKYDCjUqyB0LC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8vaNK5I; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744123426; x=1775659426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zGdt+ukPlAMOCFqD1yNzf/Vh5n9UxPgNGy45Hy0mfG4=;
  b=S8vaNK5IGFNINpEGd7MEij7zLiEwYZuqvH6egw/Vn6Qz8wBpMYd2fn3S
   oWtUCUkLtxU7k15ChNItXRvDrEVLvngfpHqF+z5FDXUelz/sL3rlw30F4
   Pr/4zuBpEpLXWgd004QdMuX92W5ybVdmrPHLcB7A+XaI0EGZMTjfEZA9s
   KMkAVzRNpgPbpMWnVVF+BwlhpeB6d1k+ByD0fle0wKh31vsI+WjDVDMCK
   5nFB5lMXWncwXE2IF6ePjSpwzqM9ki8WhnTrGGnmhBlBwMnaqMj3me0h7
   YlTYmBklwvOVnXcrqWDIqL/fhgjTl6DLFQmqsdAJKeTB/P6ljL4S0xYzi
   g==;
X-CSE-ConnectionGUID: qiXLmDxoRsK7knhrqfkh8g==
X-CSE-MsgGUID: OyBz7yzyQoKWySvaQnRV9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45574643"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45574643"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:43:46 -0700
X-CSE-ConnectionGUID: ppaSmjd+Qs2FZwJRFqjmlg==
X-CSE-MsgGUID: hDkphww8TSeA/e+4F3BdQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128796978"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:43:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7BBAE11F74E;
	Tue,  8 Apr 2025 17:43:40 +0300 (EEST)
Date: Tue, 8 Apr 2025 14:43:40 +0000
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
Message-ID: <Z_U2HLZN4XrbB-ly@kekkonen.localdomain>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Apr 07, 2025 at 06:44:56PM +0300, Andy Shevchenko wrote:
> The struct i2c_board_info has of_node and fwnode members. This is quite
> confusing as they are of the same semantics and it's tend to have an issue
> if user assigns both. Luckily there is only a single driver that does this
> and fix is provided in the last patch. Nevertheless the series moves
> the client handling code to use fwnode and deprecates the of_node member
> in the respective documentation.
> 
> Tomi tested the last patch, but since it was separate there is no tag (yet).

Apart from the two minor commit message comments:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

