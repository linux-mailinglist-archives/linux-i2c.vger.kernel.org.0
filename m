Return-Path: <linux-i2c+bounces-13934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C9C25C0A
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 16:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4571D4F7038
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 15:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6AF2D3231;
	Fri, 31 Oct 2025 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gn6d44Be"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A11C20C004;
	Fri, 31 Oct 2025 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922391; cv=none; b=uYnjQHpeMLhvCDPSGdsIg6b9wldFBBPc3CgwyY0sp0zWN7TmyLTCO9T6DK/NI0FGCfhrH5DnZjLjbw0fyEltdkf7yrQ0Crf9/+nfavHntkGkUb+eB5+DiKs1xCsN71npp0gQogSpftVwbMd3rOjs7nslDFH7VpK6wdyaXBzPLoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922391; c=relaxed/simple;
	bh=lov+vmbKoZkT3iZ5MDyWTKKzx+/OVKK/WuReUGp7jH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcNI8da48kaGaonKXP6dqPRc3/cMuXvGnJljm3+gQ7RD3/PvR9ooMV/gQ4YJDsgCcPcRRse7FMWAZjAzQaoJIs8UJm3INGfQiHrTmTcOeOORMtVJmHezcZRWFvi6qRl3y/lpVmtsK5CX43WAcp7HbTAFaLfQFaW1KEeAOrujyRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gn6d44Be; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761922389; x=1793458389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lov+vmbKoZkT3iZ5MDyWTKKzx+/OVKK/WuReUGp7jH8=;
  b=gn6d44BeepZC/Xq9ElHBVXpxm+7lKRIS8i4Xip5Mp+GAe3ko0hP+4KBK
   yO74cjL/lGU/M1uZTXZIectC4MsD9OZgbt6Nzo9oaf2LkYaXmzDKH0okk
   FGMnUXyJiP2ji91WYtYs7UInNh6RX6t0/RvVhrg7KWJ4rdUwUG1ZY72qz
   7uy6cVPTc9ml+PmBBHgSuQFJNk/v/lHYfsKr+kqyaqubpW7iyIJxW0xsz
   h0W9H38cUFXGY6+tJ+wuc7j5+4T2V6beMj6++KgQ8Y6vtrdse77gkVkQw
   GS12imHlfwoDnlMIj/UO9NWKP3nWy5n0kxuRjxu+iXgWVsutK+ZUrs+Fh
   w==;
X-CSE-ConnectionGUID: pXF2APp3RMiP9JMViSnSUA==
X-CSE-MsgGUID: oJkt8NmHTYCZIacuTEED6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81713628"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="81713628"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 07:53:07 -0700
X-CSE-ConnectionGUID: 7Mj/o2sFSfSx0X2UfuffuA==
X-CSE-MsgGUID: NVNlY3PoQqmz4ngBEtueig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="216908680"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.66])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 07:53:02 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vEqUq-00000004Iip-1OMj;
	Fri, 31 Oct 2025 16:52:56 +0200
Date: Fri, 31 Oct 2025 16:52:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/5] i2c: designware: Sort compatible strings in
 alphabetical order
Message-ID: <aQTNR57ae-hGBPn0@smile.fi.intel.com>
References: <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-3-90416874fcc0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031-i2c-dw-v2-3-90416874fcc0@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 31, 2025 at 03:35:41PM +0100, Benoît Monin wrote:
> Reorder the of_device_id structures so that they are in alphabetical
> order. Also drop the unneeded inner trailing comma in the
> "snps,designware-i2c" struct.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



