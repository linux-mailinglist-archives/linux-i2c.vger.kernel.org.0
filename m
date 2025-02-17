Return-Path: <linux-i2c+bounces-9473-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5854A38D1C
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 21:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 171C41888CEC
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 20:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9DB234970;
	Mon, 17 Feb 2025 20:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adOKGdLp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7B7149C41
	for <linux-i2c@vger.kernel.org>; Mon, 17 Feb 2025 20:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739823558; cv=none; b=jVI1tIampI2J/oMmzzEyIE+FQ9ts2/qCSg4sglPceoVnv21cC0lTSBWOh7UdS+12a3ySBnzgss+aJ61ykab483X13HBAe0if0iSAeWqqRac46//erVNz2bb2OzgpVKNuQRKeAhrVmWpgkWJtTCWwsQYGZuFZQY0qEY7ucxh1TvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739823558; c=relaxed/simple;
	bh=5u5W6/ejYUW6p4Sb95Flf21Zxx9s4MAM5EaxgqBygXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tw49WMb/q53uGn/sKBDJsZDiR3kOKOAoVfX/rTzstLwQEANez0toSrRCm2OwlaPD/MrkbbJ84kOonjkv/azlpmgzQtgeOCJbu7bUD+h8Ftd/GoNBtHpOCtj13wj9/cue1+H8zK0HXtU5E1EbXfH+UwX4qdTXYZoPnLdq4ZUd7cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adOKGdLp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739823557; x=1771359557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5u5W6/ejYUW6p4Sb95Flf21Zxx9s4MAM5EaxgqBygXw=;
  b=adOKGdLp02yl6if8fs0W84YmSos40MJeWxgYjbEktIy2R8sKEWk6qAPr
   uBWvyerNDOavpc/Z9milvi+g9gO7rItBM7OsCzIDDb3ooj6XP9b7P2YF7
   LgIYwgB8cf50oZahQQCSDsvQokDJcjVChTgvrJGG5MAzNs1e/7qaCgHKD
   4CKyS7vJ95opXCt/UvI7mY8OzLMZQo9nNScJwlBus5WrDZmXGwBHh9261
   8+lrhtvIDKsPGg3xO99PSPMjR0HCLF+VpnHiPGhgi3S6qJvtE//m+JVpn
   XPFdd6MUS4/wSuLlKmNG8efytnwCyK+WWfX4Zal7DTqXvUmzHkm52W/vB
   g==;
X-CSE-ConnectionGUID: bfM7qbDqRpq46Foq0tJo2g==
X-CSE-MsgGUID: 9CpQn65TS+aTnPqiBsLGqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="58042158"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="58042158"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 12:19:16 -0800
X-CSE-ConnectionGUID: JIxM50VnRoWyuLeRa/7HHA==
X-CSE-MsgGUID: QBEv5EwMTpCLhho/D081jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="114136730"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 12:19:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tk7aB-0000000CVbX-1ybx;
	Mon, 17 Feb 2025 22:19:11 +0200
Date: Mon, 17 Feb 2025 22:19:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket Goswami <Sanket.Goswami@amd.com>
Subject: Re: [PATCH 1/2] i2c: amd: Switch to guard(mutex)
Message-ID: <Z7OZvxCCnil-nerR@smile.fi.intel.com>
References: <20250217124709.3121848-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217124709.3121848-1-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 17, 2025 at 06:17:08PM +0530, Shyam Sundar S K wrote:
> Instead of using the 'goto label; mutex_unlock()' pattern use
> 'guard(mutex)' which will release the mutex when it goes out of scope.

Both LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

But next time either sent them separately (seems like they are independent),
or add a cover letter explaining what the big picture behind all the patches
as a whole.

-- 
With Best Regards,
Andy Shevchenko



