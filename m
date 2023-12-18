Return-Path: <linux-i2c+bounces-854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4858D8174C6
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Dec 2023 16:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D86F28198F
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Dec 2023 15:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEE13A1A9;
	Mon, 18 Dec 2023 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDfmKtLX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7653789E;
	Mon, 18 Dec 2023 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702912014; x=1734448014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ED+u/AYyXUeR3n2sBQzQCQR/yUmEx9ZTfYlrQpeWOBQ=;
  b=lDfmKtLXmcfoynEMr05a4rz+3qCn1n7yeEc2OnJIGpIg3PWV5HTqo/+o
   K5h93JoT2SnUFc5+dF/hONHXjAF5J5Z/2dDJlwQuBfqBYW8r8k/QsUiXl
   7D0oSJ8As1ngtzfoA7IzCeEBwpyfaAp0ZjaqjSd+mRj37SUmoHZKPC+K1
   GplX4U0Ug78SLFQbvTOino5bME4Unur8dF+/AVG02IpUIwralWP/hpzdN
   jFRDD3X4BJ0Db3guyMcNKwIpMO9ntP8nRBFgp4hAwfEsd7RccGoszY12N
   JAymOjySRbBS96DCYnqUuPWUVX4ynv0USewPhGmxyp5Hmi1vPz+YG0wK5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2342991"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2342991"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 07:06:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="845976856"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="845976856"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 07:06:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rFFCh-00000006yA4-1KjY;
	Mon, 18 Dec 2023 17:06:47 +0200
Date: Mon, 18 Dec 2023 17:06:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 00/24] i2c: designware: code consolidation & cleanups
Message-ID: <ZYBgB3J51hfGQSVX@smile.fi.intel.com>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 07, 2023 at 04:13:40PM +0200, Andy Shevchenko wrote:
> The series now consists the following groups of patches:
> - fixing cleanup order in error path and remove (patches 1-4)
> - refactoring i2c_dw_*_lock_support() (patches 5-6)
> - refactoring module alias and device ID tables (patches 7-10)
> - unifying firmware parsing and configuring code (patches 11-15)
> - miscellaneous cleanups (patches 16-17,21-24)
> - consolidating PM ops (patch 18)
> - using device_set_node() for all drivers (patches 19-20)

Wolfram, is there any chance to get this into this (v6.8) cycle?

> Changelog v5:
> - collected tags (Serge, Jarkko, Andi)
> - corrected commit messages in patches 7, 18, 19 (Andi)
> - amended grammar in the patch 24 as suggested (Andi)

-- 
With Best Regards,
Andy Shevchenko



