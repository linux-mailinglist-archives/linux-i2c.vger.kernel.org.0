Return-Path: <linux-i2c+bounces-9414-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4815A33D0A
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 11:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AFF6161704
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 10:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBAB21324D;
	Thu, 13 Feb 2025 10:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fD9ywQCV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127472080D4;
	Thu, 13 Feb 2025 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739444101; cv=none; b=qstCZgsRrXFnHqpywE0oSYuiqeDFsdaFvF1ruZVVj0Vf/rKzss5sRy9KVzriw5qzXrUwu7XHdP+QCLh5BRmR+gzVJulvU2etpS5f/kEDmXV94qZExNnDGUKK2I3GQSHtyKeszTZlMm6FxzZNusSQO3dbuKvGPedNOxQgo3dbCVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739444101; c=relaxed/simple;
	bh=FC+osHMM1wMl321HcyQTgueNyff8+QNBAFPiwB2uKhA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KplAdQOrM8MRDRg3EXTwFwlNbAVw/nw/439mydLaLBd+9uvkWCFbNKW8t0RoFgJRRoIZPT7SJw59nyTZd7Cm9wnYW7sasB7OGUVHxcNnQLxo8di4SRUkjaDQG6pwXt642xwpUrx4Q21Qru/zJDnjrD3cHv9jIPK0OqFY/gPFfWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fD9ywQCV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739444100; x=1770980100;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=FC+osHMM1wMl321HcyQTgueNyff8+QNBAFPiwB2uKhA=;
  b=fD9ywQCVVFS5poMpcIhvz1Qn5xemPV+daill3TqDq6QLJr0r3OitD5Nn
   RRKP5FHX4XYfo1Bo1NyIRYPE+M1gCLZQJ6/Lm2Aux2fm4f6LG4wFROWWO
   8W6hcHVQOp6asrbt1cPQxorPClEAlkTcw17ncjcbBSLs14KjFCk2kqSrn
   WHxF2tfBe6enIGSZ78S2GtRc1AFJLwHxCXLGbpHqxj3OzXFnjYzgJlf/p
   Y5bTvCXIu89NarEM8/yS6hD9b+XXPhEzbuFgMvNscj8S/8XIlMGm7wjuG
   aegjKppc+BcxzjVCfBIIlOp7QkBBRGX/WMsq6W5lFDl2TIlXQILUzSXWC
   w==;
X-CSE-ConnectionGUID: pQUG0r1vR92RAZ0faSmmUw==
X-CSE-MsgGUID: X6rHjMlpSCWyngjdH0vcrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51568223"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51568223"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 02:54:59 -0800
X-CSE-ConnectionGUID: gH7RkWeCSpOd3hLhl3vVuA==
X-CSE-MsgGUID: qaKLpqIXQIm8x0zlic78AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118049979"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 02:54:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiWrr-0000000B8iO-2JGV;
	Thu, 13 Feb 2025 12:54:51 +0200
Date: Thu, 13 Feb 2025 12:54:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <Z63Pe1clM4VZBmIX@smile.fi.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
 <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
 <Z63DT_XdzEWrP4eR@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z63DT_XdzEWrP4eR@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 13, 2025 at 11:02:55AM +0100, Wolfram Sang wrote:
> 
> Just a generic comment: please don't spend too much energy on 10-bit
> support. I have never seen it used in the wild. It seems more like an
> academic excercise.

True, but still it makes sense to reduce the respective code base.

-- 
With Best Regards,
Andy Shevchenko



