Return-Path: <linux-i2c+bounces-9975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C6CA6C2D6
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 19:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43A663B2C91
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 18:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50721EB1A1;
	Fri, 21 Mar 2025 18:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ogaroxcg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665CB664;
	Fri, 21 Mar 2025 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742583322; cv=none; b=o23gbNGGo/iss53wJIWTCIV/I2QNpexSoRZ5SsZhK23fn4hjxd7i+422L4PxbDJe1tNq9oDUfl11RpecGuQTH8tFxr3Z4NmqeJfWp/yJQyPCcg/zY8y8JuqX1eSdCCYw6dR2xJqz2Nc68pEQkyJ63Gl6MT9gLOqTkGXDkDD1cNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742583322; c=relaxed/simple;
	bh=SsDJwih5GnyB+2h0ZWQo789Uj0Vz3YbMNjzUsm9L1hA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfcsLSccg6tpQULT02NOsvSliSg4EZllKnC1Uo655UfO04WGTG0MBG1MAGGOk7Z4b7i2zrvK3lvUqY7KMYc4HzAeOBlbwoUFVchcvTgKD9bi1w5cUKNZJ3xHCilvKUjgEOnaAgpOUgiF7ELl7SqVq0IZmvK2iGLvrPR5VOeLcuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ogaroxcg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742583321; x=1774119321;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=SsDJwih5GnyB+2h0ZWQo789Uj0Vz3YbMNjzUsm9L1hA=;
  b=Ogaroxcg+ZTk4O6NFpv5S8TDDz34ODV3PhEetU7rqVrPcAAc3z9PorOF
   8yaTw9Hy69Qz2NpI4qJHwY91VYFrW+4OHiCcQMOxY0E0UDB6MexNGuIAK
   ag2pXpBO1I1S4XKDnt1nnFrzOuo4PkQkaXgQC+suk+tf+y/1aZY/EczwB
   pPTJsygjPpz91v2KufypmprNTOlTRtAwJVG65mf5Ad6HreF4/MbAqtpeM
   d1W+CujiVRFlkfhJBBkT0NcJ9zjM+FHTcdxmJRHZqmT+Sf2KeKmyhB7rN
   n9cAuiHwgiOj4cSRTSEBdigLYt89OJpw8Sm6+HHj8RnDe0nvDql7YbXSl
   g==;
X-CSE-ConnectionGUID: jTgSWn5tSzqxNDFU9PTGtg==
X-CSE-MsgGUID: /fyrEBXKT7WlGRYNb4r+SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43588233"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="43588233"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:55:20 -0700
X-CSE-ConnectionGUID: 8XJnfEDYT6GuTYVYTwXqEw==
X-CSE-MsgGUID: 7UxxAdGeR26p4SvEwzcEzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="123935807"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:55:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tvhWW-00000004bI4-3G1y;
	Fri, 21 Mar 2025 20:55:16 +0200
Date: Fri, 21 Mar 2025 20:55:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/6] i2c: core: Unify the firmware node type check
Message-ID: <Z922FFNjTYqNJs3i@smile.fi.intel.com>
References: <20250312185137.4154173-1-andriy.shevchenko@linux.intel.com>
 <20250312185137.4154173-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312185137.4154173-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 12, 2025 at 08:48:49PM +0200, Andy Shevchenko wrote:
> OF and ACPI currently are using asymmetrical APIs to check
> for the firmware node type. Unify them by using is_*_node()
> against struct fwnode_handle pointer.

>  drivers/i2c/i2c-core-base.c | 14 ++++++++------

The i2c-core-slave.c can be also modified to follow the same approach.
I'll do that way in v2.

-- 
With Best Regards,
Andy Shevchenko



