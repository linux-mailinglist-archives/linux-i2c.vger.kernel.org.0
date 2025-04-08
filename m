Return-Path: <linux-i2c+bounces-10221-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 063DCA80EE7
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 16:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B0833B521B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 14:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DE01E98ED;
	Tue,  8 Apr 2025 14:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fcj7MZvl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E321B6CE5;
	Tue,  8 Apr 2025 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123676; cv=none; b=Sfqx9Bvn3Q5guRfe62UHeXCKaxLeEdUeIaaQ8JoT1Zj92XjRRRSG2GUivvTqz7nKIHSL0HgwEU7ZgogyBvgeET8/eE/igIQcNFCDuLkQ4hyBCC7DP+4JBrsUN0vXW3BZviJd1RFAH0mIuWMmVUg3wu1HPOcdLVMKtWAktH5RM80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123676; c=relaxed/simple;
	bh=xyRTLeNVsfmRHdJr1PsshTXXrynstulle4PHUc3yX4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmClEWywwRnDIV8RpEvBgUQtuMYcH0ce8w4vAx214kkkZDBsaazcUBPsWeKK05zvDTyFjxUF4dFJNsVNK0MLN0rZK9shC8CbYSxxfT8YXEcLnlWdVGJ8A3+vj1UQxY/mmrgDDUZVUX6pVMDXjMgxyiIf5tyhF7xe9mxPUc46yT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fcj7MZvl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744123675; x=1775659675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xyRTLeNVsfmRHdJr1PsshTXXrynstulle4PHUc3yX4k=;
  b=Fcj7MZvl5HkUaqDgQegEPerWo99QLglUW5A575keADWWEm+AE47ow9vR
   p3NTgKeLhTZQoDtkGyp+4KSAB1wohuwd+sENN5yEk5Zru5fF8/qGJTAfW
   B/GIfqsO/Tg5LQZ66usyQ4chG9tzfpX+1gr+753x8ZVt9dg+9W/sA+Qss
   0+cfuaXxYz4EHHNSvuvLnxjqgy5IMBjd1CkdSrCWToKKUVwFuQxXqUyGh
   pD5Ajq37IUi6krWUr7hdRLPCiRH/FAqjGUkXXMmmgaoeWdUyjuvq/Y4j6
   zKym8uyxTaWc0Z3W4t2tAcB0gAoWbIEn8P4i8YNh1TFUeD/dzs8jsnW5S
   Q==;
X-CSE-ConnectionGUID: eR5k+H1hSS2u6J6FVYVL6A==
X-CSE-MsgGUID: FPISMuAcR32qqaJ/VplIbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49220051"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="49220051"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:47:54 -0700
X-CSE-ConnectionGUID: DGOQxxVNS2WoQ432qPNqYw==
X-CSE-MsgGUID: Jo5vtBjhQ7+afDU2Q06ijg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133159877"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:47:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2AEv-0000000AQv2-105M;
	Tue, 08 Apr 2025 17:47:49 +0300
Date: Tue, 8 Apr 2025 17:47:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 6/7] i2c: core: Deprecate of_node in struct
 i2c_board_info
Message-ID: <Z_U3FNa0ay_Sb9Cs@smile.fi.intel.com>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
 <20250407154937.744466-7-andriy.shevchenko@linux.intel.com>
 <Z_U162kNEPSZI3zD@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_U162kNEPSZI3zD@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 02:42:51PM +0000, Sakari Ailus wrote:
> On Mon, Apr 07, 2025 at 06:45:02PM +0300, Andy Shevchenko wrote:
> > Two members of the same or similar semantics is quite confusing to begin with.
> > Moreover, the fwnode covers all possible firmware descriptions that Linux kernel
> > supports. Deprecate of_node in struct i2c_board_info, so users will be warned
> > and in the future remote it completely.
> 
> Too long lines, should be up to 75 characters long only.

It's media CI complains, but this code is for I²C :-)
But in _this_ case I agree with you. It's more for the
external users of Git, rather than for us.

-- 
With Best Regards,
Andy Shevchenko



