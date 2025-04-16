Return-Path: <linux-i2c+bounces-10386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C2DA8B17B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BA3419037EE
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37736224B16;
	Wed, 16 Apr 2025 07:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjfSR7Ka"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DB2221572;
	Wed, 16 Apr 2025 07:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786943; cv=none; b=sfq28OmvCA1RjKWrqVDn4pxapKQtxLqdeTWaT1wSLKu6iJkdLQDWc5cZ61CSuqodvTlWLRsYKAiBc37Uo6+Vx++Fj9OkKmPydCeazFKanuq2LTN4B0rQFttYjaQcvxjVzMYjTpYeYLfpvlRtkqIbsys9ULxmYE/+S9T4T5Q/3H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786943; c=relaxed/simple;
	bh=vC9qu2x28cbxmK7VJr+Bv79rWkNOEx2eUdan3K30uI0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Var3LST7uVTyyQjNFcUe0N71RLYOHHxCxb1LtJqU6J4XqubYJay0YbfLvWgYmXUnKO2Ci+wNkxAhS/pMUDbN82oTZesdX1nGH1vqwuoJFvZtBnbV3NznvjMggD33Ybj1wMbAtLHBM3zmVDij3pqZHL8whVE/ZRqka1PQVPwmO1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjfSR7Ka; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744786941; x=1776322941;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=vC9qu2x28cbxmK7VJr+Bv79rWkNOEx2eUdan3K30uI0=;
  b=GjfSR7KakS9Ni2ufnsU6nokwTrhzSjqcd38j4yeiA4cFVFi0/pMbiyId
   1Iz38FswTDbs/Jf/6b4QXY26Ugo+emMJxZsJCW4sXHHaMbGsF1vdn89wX
   AeoRLV2EsImLSsjoPj1zRmlTOJzSRxEEaIIlPpMFKafUSVAsSiYuYigxi
   H1zyQiVkX671LBAT3ADT/w5wtn/OU9Y4yGZRchCgDf/KkWnf7a1yN/KR7
   S/TigyFI0iEBJBkqLoS8H8l9epJwpm/YpMij7uprazeQQ3AMnToXSojlH
   x8AfimAaem79b+yPwQt+JLxqV3dtQAIhZuXywKb+k3c0d5p8ulY43Zele
   Q==;
X-CSE-ConnectionGUID: bq3/ZRTOQaKqyOS8c/SHbg==
X-CSE-MsgGUID: eESMnd4OQnGGWipTVPs47g==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="49016428"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="49016428"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:02:20 -0700
X-CSE-ConnectionGUID: 3xCPRFkrQH+OdM2dLByN/w==
X-CSE-MsgGUID: +j+Anc7CRfmXx+9z0ZOrzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130370786"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:02:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4wml-0000000Cm2v-3loF;
	Wed, 16 Apr 2025 10:02:15 +0300
Date: Wed, 16 Apr 2025 10:02:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 5/7] i2c: core: Do not dereference fwnode in struct
 device
Message-ID: <Z_9V9x_YBfxiCh1w@smile.fi.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-6-andriy.shevchenko@linux.intel.com>
 <Z_9UX9xkGjvhnub_@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_9UX9xkGjvhnub_@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 08:55:27AM +0200, Wolfram Sang wrote:
> On Mon, Apr 14, 2025 at 01:01:55PM +0300, Andy Shevchenko wrote:
> > In order to make the underneath API easier to change in the future,
> > prevent users from dereferencing fwnode from struct device.
> > Instead, use the specific device_set_node() API for that.
> > 
> > Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I'll check this patch later today. Rest of the series looks good to me
> already.

Note, I'm planning to send a v5 shortly with the style fixes and commit
messages as you suggested.

-- 
With Best Regards,
Andy Shevchenko



