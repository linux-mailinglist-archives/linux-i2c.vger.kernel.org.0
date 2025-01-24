Return-Path: <linux-i2c+bounces-9192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B92A1BA42
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 17:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A58816A970
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9720E18E057;
	Fri, 24 Jan 2025 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ls8yfxJ3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4846DF58;
	Fri, 24 Jan 2025 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737735871; cv=none; b=AAMd8AZIBPU6nd0vhJcWEsjFNeKSrhEj6l6M/drcn7vRmBXKRwyqZbV8dRZalu1IFeyzcKVB+Qj97jeO6DI+mt34y+UpsLrQ6Y+EC2dkP1Ab1ZzJWRZGfbvuXJdv0UPmBJb4ZkgC3btgA3Raej6TsGx9nvCpaqnCjynJKNX88/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737735871; c=relaxed/simple;
	bh=6wGrM+/mngDVf4HAnig0e07Y2VR6KxdTQC3515rwQTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sa31DfXh6xmp5DJdA+0DRFUFAjt6R6kGx9METDrvRdOtm2/bUUHKPGnvFtCbt2WUzUrwXLdy/6FtMoV/0N62f3cyEINFxJYf0Blu1aqe6YU+vZIKsEFMpXbQBylfOZJf1en2hb11GoFzeNvrwA7gufy7En0yIVOCQk17GjzZQUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ls8yfxJ3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737735870; x=1769271870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6wGrM+/mngDVf4HAnig0e07Y2VR6KxdTQC3515rwQTA=;
  b=ls8yfxJ30iwNhM+RPPrEJpzEnpiugKUQ72PhjNc2sMTcdRVvcRY0UBvA
   uKHy10mOKcK3XiKAi/HeqzJtwgBHkKPNj7eXiPXMxqzDchMmildrrroT1
   It9XvpBO03g8B5ikd5ZnxjrLNkSTKBLek3R0IzagM7kvQKdgtIW2BKEl7
   FpmHcwjOAqSKk0CEMYGbvYL1eGH3udpb6I5GHjE2AH+2f5wCGNTwvAEyh
   NAeKNbNSQH+fM1IBYqPJsc3oqJ49/4zg4boLt/2XZA2DFRRSHcSqSiXxr
   84uvnzifSYxYsM2BF5SXwNmDCu996rJlQTadqXrhbZe45wevtdjuqrMCr
   g==;
X-CSE-ConnectionGUID: Cg/fMe+8RhWk/8kh3WZKFQ==
X-CSE-MsgGUID: Vf8xF67vQ7WMXMeEmpLCJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="63628619"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="63628619"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 08:24:29 -0800
X-CSE-ConnectionGUID: g3neEdvpR/yyOBf+hYD0Gg==
X-CSE-MsgGUID: 8Ws9+zHNTe+o6QK0SKb5Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112749583"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 08:24:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tbMTl-00000004rk0-3c7K;
	Fri, 24 Jan 2025 18:24:21 +0200
Date: Fri, 24 Jan 2025 18:24:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radu Sabau <radu.sabau@analog.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH v4 0/3] Add support for ADP1051/ADP1055 and
 LTP8800-1A/-2/-4A
Message-ID: <Z5O-tVL3-r01lLDF@smile.fi.intel.com>
References: <20250124151746.1130-1-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124151746.1130-1-cedricjustine.encarnacion@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 24, 2025 at 11:17:43PM +0800, Cedric Encarnacion wrote:
> This patch is a continuation of this series:
> 
> Link: https://lore.kernel.org/20241120035826.3920-1-cedricjustine.encarnacion@analog.com
> 
> which is a combined series from two original patch series for each of the
> above family of devices. Both LTP8800 and ADP1051/55 have similar set of
> registers. The series was v2 of one and v3 of another. Hence, as suggested,
> this patch proceeds to v4 which succeeds the highest.

Cool series! With small issue addressed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
for patches 2 & 3 (no DT covered, not my area)

-- 
With Best Regards,
Andy Shevchenko



