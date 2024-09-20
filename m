Return-Path: <linux-i2c+bounces-6905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEDD97D743
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 17:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED88BB22490
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 15:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD83F17C21C;
	Fri, 20 Sep 2024 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvcirAt/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565003BBC1
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726844783; cv=none; b=HyZHhzcPlFMJGzrSQNx/GGhtLRks6sabPuMsv5+jz7oT15UYFvIM+42zi09a9o7j49Lsy0b6T4qlq/6f7SvuoD9qE56cIkBqE9LH2qhFIAolAVy67NtBwIlzHy8V/V1oZuTNLHPcKGTVS0aAWB3myTgoT9qzr/HWs/08AL52vvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726844783; c=relaxed/simple;
	bh=7Fes3PYwjj72ms4WvqEzwa11mNbSm5TGHdHzW+3tboQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNgEqQkTT5qYZkQmMG4riS9zqYxNjgcROlIx3JVHhG88U9A9QJ7BVrm31qYbDAAJx1yb+DUncvZQvpzdn+uFeVrf/uj7iuLWXh64V52hA6sfkYuY2tYwXc9KEo+jDjJ2fFmxD2fm+Fwx3ZMEWFEqTfN6cUK/gP76z8N0teyEuQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvcirAt/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726844783; x=1758380783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Fes3PYwjj72ms4WvqEzwa11mNbSm5TGHdHzW+3tboQ=;
  b=lvcirAt/38Vbhx+UsAVzLfu+ZybI7xvZXTAHf2Q9lnJggm30uFtggYqg
   hFuX8j4CYox7MWeVVW2Y5AIkuMT/SPUaEruPaDG3PeLJJC+0ErPlvBo49
   EYlJFWRyF6IO+WuyelWL6Q8lTLGTiredcYpRlLvN8InoR7pXF/QyJWJef
   91b89goA59gzBx3ZcJc34dJVwFB5SXqN2DWkdl1Eg40bsf78xSCBJf215
   bZvABAM8uPMzdw4wqgbzViF+lQXzKgsYMgRxBu5R5GdkV99desw4u9AzP
   FEqG5d0MfXoL1OooSO0SjUZX3KDvOUR6y4dTJiYTPDjUiaKshicSwlMq6
   g==;
X-CSE-ConnectionGUID: 97SmoXTASQ6Mn7QuVKCV6g==
X-CSE-MsgGUID: mJet+VOXS7Gu6zA4wHnNuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25972788"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25972788"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 08:06:22 -0700
X-CSE-ConnectionGUID: C7g4sKJZSku8a8ysJa4RAQ==
X-CSE-MsgGUID: mAQrwvekQTaqyv62uNzsPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="75112647"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 08:06:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1srfD7-0000000AwxL-29rA;
	Fri, 20 Sep 2024 18:06:17 +0300
Date: Fri, 20 Sep 2024 18:06:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v6 8/8] MAINTAINERS: Add AMD ASF driver entry
Message-ID: <Zu2PaSOws6ANkILL@smile.fi.intel.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
 <20240919175913.1895670-9-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919175913.1895670-9-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 19, 2024 at 11:29:13PM +0530, Shyam Sundar S K wrote:
> Update the MAINTAINERS file with AMD ASF driver details.

...

> +AMD ASF I2C DRIVER
> +M:	Shyam Sundar S K <shyam-sundar.s-k@amd.com>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +F:	drivers/i2c/busses/i2c-amd-asf-plat.c

Just to be sure that people at AMD understand the difference between
Maintained and Supported in S: line.

The first one more for volunteers, while the second one for paid job.
Maybe someone should go through the entire MAINTAINERS database and
revisit AMD related records?

-- 
With Best Regards,
Andy Shevchenko



