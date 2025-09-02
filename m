Return-Path: <linux-i2c+bounces-12556-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4ABB3FAF3
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 11:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C5B3A7FB8
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 09:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3160F2EC0A0;
	Tue,  2 Sep 2025 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJIP64kK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4388F26E161;
	Tue,  2 Sep 2025 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806300; cv=none; b=g0fIMc1MjEU3UVSWAZRRtZ+nKMiphnvK9WubEMgYK2SHI8uy3mpXuKCkgIJpTQVfBiSZa1Oip7uZhebFEMkX2UG/b1sgktjUgNdlTOrVPTixv8szbbBdD3PT5kaGMZPTkaasXUq85kncymneGP2WJyW/QOMJb7oQCLRw2SNv6Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806300; c=relaxed/simple;
	bh=W3FhchwMGrBfGEBPQg497OJio42fh4lj/DiZs9ubwL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCBhUF9u2R+0zzL8UAkVADN2dUy2XNJ3jPEYgLAnAOUnZ9mmK1BRbLYbyP/8zk68oUiwiafl/1MwWDh+Zh4292mpHvW40W6tfWI5IMDqsXoSOeJZI0oTG5rvEhL+GrQ7XNoA2VM4FZPxatmTrgwMEKwHR68+g9aWrLx/02A8Z3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJIP64kK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756806298; x=1788342298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=W3FhchwMGrBfGEBPQg497OJio42fh4lj/DiZs9ubwL4=;
  b=YJIP64kKq41lDg57J4fxeAEEVYhknke5hV3Ih/aedFJBVNFNowQ2UzsB
   3+LwYACMTm8/HjwSyhXzNQwN/m9PpxON/hQR6qOhgAUfHQV1JZRpYXko2
   WP2sPZsUk0IuKeUNjbP6wFWZ2Kjxm8qbgmw9ajByGfVwYBATF9G4uzwCA
   4FIHPs6EQ3YVivlF0Uc+ZuFfpkIqyJIkOunHDKpwf9SkkpBhDfZqWcnPl
   Gpken8oZnN/51OaMISLsHlE2D2kSqQPN2IExX4lp4+jeCad8UiyOfAN3N
   iEKUmAI0fzXtbM7Rd99ExdF4PN9qQepS1fCve8uhxjiELqe0eYrGaQnS3
   w==;
X-CSE-ConnectionGUID: Go8HfspfR/WbpXSOwPl61A==
X-CSE-MsgGUID: U+4cDd33Q4uie7RaCzAJaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62901143"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62901143"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:44:58 -0700
X-CSE-ConnectionGUID: 2dLfsjlCQwOF6IwFbzr5PQ==
X-CSE-MsgGUID: iEVQHMTuSB+kEOHecW3R1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171594293"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:44:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1utNZM-0000000AerL-1nLN;
	Tue, 02 Sep 2025 12:44:52 +0300
Date: Tue, 2 Sep 2025 12:44:52 +0300
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
Subject: Re: [PATCH v3 2/2] i2c: core: Use fwnode_for_each_child_node_scoped()
Message-ID: <aLa8lGxHvCd6nreg@smile.fi.intel.com>
References: <20250901163648.82034-1-jefflessard3@gmail.com>
 <20250901163648.82034-3-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901163648.82034-3-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 01, 2025 at 12:36:45PM -0400, Jean-François Lessard wrote:
> Replace the manual __free(fwnode_handle) iterator declaration with the
> new scoped iterator macro for cleaner, less error-prone code.
> 
> This eliminates the need for explicit iterator variable declaration with
> the cleanup attribute, making the code more consistent with other scoped
> iterator usage patterns in the kernel.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



