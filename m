Return-Path: <linux-i2c+bounces-12578-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55604B41BE0
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 12:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D6DA5413B0
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 10:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3C9279351;
	Wed,  3 Sep 2025 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hW3aGszi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0157138FA3;
	Wed,  3 Sep 2025 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895455; cv=none; b=ODjNweohuKTd/eFASS8K8moBom5r4GOUvC75Qj8WqYMfGyYY4nrQR9bygl85MxXEFG8NB8ysk1F5mmCvUPl1WzelRvMEKocLOJz4bdnkevpwkTm1Z3q17gNNQz1BCYn0YD7UqX/fOPU/B9hBA3HHv6hfOvD+OgjfJKMtQTj4YxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895455; c=relaxed/simple;
	bh=ClOTmE55Wwsm0LpC9z5gh1a0PSmL2dFavPpmP8ftZUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nczy2tdfwjhZopfxJVsGBbsqnHACghQYtLhExwcWBUgwVXd8l1nFeS8Iw2psXykyaGMOKNlKbYjiA6stEX6wVN0mTmLRnYE6y5tRMkVqZhNUh8ZVudzzd5mwmyw1l7vhDVWrz9ji7xevjNb5I8zZJ0ApSTWbCs4Yj1N6Unp6dVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hW3aGszi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756895454; x=1788431454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ClOTmE55Wwsm0LpC9z5gh1a0PSmL2dFavPpmP8ftZUg=;
  b=hW3aGsziGo1W7a+4X+VmKZeJV3ZGggh/3lVecDrIc2G162Brj5UQ+/Fc
   WMu6cfV5dDmeaQ41LQ8oYG30lF761hgdj4QuD4aYXM1A2ZKHv5LqxyXnE
   sRGxYNmZPq4XaMiTojmQ0zBlxA5rsyMvwM+FsT08K/diccceIGx3Uoa/B
   EZsJxbFS0iq9QHHZdk3ZwHxpxHfGCPWEZ6nvwBiTTeydHCC56cJFPR33k
   927Evy/FzhdGZlrXzlUGBdYUbJYm9QguhlcMvkUO76xgmLGCEBnXMdL3d
   bBVhjuUeEvDwFZFr3ldlly2brK3F4tuH0tloUvTnUOO0uZpmmkNneoWq2
   g==;
X-CSE-ConnectionGUID: Fx3DPs1QSwaXLucj7L6AkQ==
X-CSE-MsgGUID: iA3ecWsUSiyYSG5rJFUr/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59272082"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59272082"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:30:54 -0700
X-CSE-ConnectionGUID: X8Li4sRYRLGLm/jr2tJJcQ==
X-CSE-MsgGUID: 3beLwcruROehcl7/JRvuZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="176803032"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:30:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1utklL-0000000AxNd-4BeF;
	Wed, 03 Sep 2025 13:30:48 +0300
Date: Wed, 3 Sep 2025 13:30:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 0/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aLgY1z-MvQbDBx2_@smile.fi.intel.com>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902190443.3252-1-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 03:04:38PM -0400, Jean-François Lessard wrote:
> This series adds scoped versions of fwnode iterator macros and converts
> existing manual implementation to use them.
> 
> The first patch adds the infrastructure macros following existing patterns
> for scoped iterators in the kernel. The second patch demonstrates
> fwnode_for_each_child_node_scoped() usage by converting existing manual
> __free() usage in i2c-core-slave.c.
> 
> This series introduces infrastructure for the TM16XX driver series,
> being the first user of fwnode_for_each_available_child_node_scoped().
> See the related patch series:
>   auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver

It might be good to have an immutable branch for me from i2c core.
Wolfram, can you provide a such if no objections?

-- 
With Best Regards,
Andy Shevchenko



