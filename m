Return-Path: <linux-i2c+bounces-12615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EC1B437C6
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 12:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 153B33ACAA5
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 10:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B628A2F90CC;
	Thu,  4 Sep 2025 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G82B4FQQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38FB2F616C;
	Thu,  4 Sep 2025 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756980001; cv=none; b=tqna3UIhVXQQT/PRzPAIRQebtJGjnxADbC+yQCNErve/oi7CW46MophPq19kAKRw6EiJCK4+6g7kqEqGAO+df+utd8F4H7DKaPyvPVbeiy9Vxy9fxvQ9X87JZuxKRNkvoXGP1oNk1X7rrwEYnuaTS6uvAa7OebJ8cT7kTmzig9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756980001; c=relaxed/simple;
	bh=mi+9YZfREfl8bO0SgMMuARpKTRd8R4HxdIYJ2cUBdG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovgd/Ma81G28hUtwYIxV9lCbCWTVcKoY1/R5iZrOEMCr0qYW+yAqXZ9pcX6vnmptthfCfFVwyNb0NvmMpDw/JODRuEqxbOb4mjS52cptYHJwBdQhr5wUQI+8oMZ87W3vg/Ie4Y7kS5dzuwopzlFYuQAmAJ2U7IvImbTqRVXEow8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G82B4FQQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756980001; x=1788516001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mi+9YZfREfl8bO0SgMMuARpKTRd8R4HxdIYJ2cUBdG8=;
  b=G82B4FQQTCvgovhR5S7GI6SYMjndTr668S73HQxhaAlls68uaOh3ROKS
   eru0B1Wpc22LY/mqxCzyJfE6C7BUiMqLHXD+PukFb5lSVXs8nProtiL6v
   B7/jxv0uw+Y5KUk0nPbCO1Osx8+jagjGWOzRCPgLngELfznssAO7v1nIm
   q3iAFlPWM8ZHYlfZKMPe3fWVc8dhAC8ttOI6+slog6GIrvUXwjCQv5lTI
   0fapKG47xujWVonEiichJNXrIA3HhRdZ2SOx8y/sQQKWPM5RV5/IElBsW
   XrHGTN9YJWeMfZ9usTbTRoDDUV/tzxR9d/j3st8CIJ9gkIVeKrX6CYEaR
   g==;
X-CSE-ConnectionGUID: N7FBLycMQ3GxeDUekRxjOg==
X-CSE-MsgGUID: rcqe6eU6TICt5c9Ud8tk4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59230285"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59230285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 03:00:00 -0700
X-CSE-ConnectionGUID: RM5IJwZ1Ql+otGJ4bKKJjQ==
X-CSE-MsgGUID: uuZKpFSCQJO8Q9v49ca8fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="202696450"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 02:59:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uu6ky-0000000BEeS-4A78;
	Thu, 04 Sep 2025 12:59:52 +0300
Date: Thu, 4 Sep 2025 12:59:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 0/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aLljGIcjAjQhC2uS@smile.fi.intel.com>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <aLgY1z-MvQbDBx2_@smile.fi.intel.com>
 <aLlgpUlHp7t8P4dQ@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLlgpUlHp7t8P4dQ@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 04, 2025 at 11:49:25AM +0200, Wolfram Sang wrote:
> 
> > It might be good to have an immutable branch for me from i2c core.
> > Wolfram, can you provide a such if no objections?
> 
> Sure thing, I can do that. But there is still discussion on patch 1, so
> I will wait for an outcome there.

But it seems that the discussion can be implemented in a followup?
I think we are not in hurry anyway, so let see if it settles down soon.

-- 
With Best Regards,
Andy Shevchenko



