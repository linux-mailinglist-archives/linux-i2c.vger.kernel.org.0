Return-Path: <linux-i2c+bounces-8155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2879D6028
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 15:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE3A12821DA
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 14:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C783F2AEFE;
	Fri, 22 Nov 2024 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFJfOb37"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423DE80604;
	Fri, 22 Nov 2024 14:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732284581; cv=none; b=ieg5WGHzoflmFDia9ZCklzqc/sMFAJbmZcMEdeyj4G+KQo7PAf4dHLamTIIO4fDl4/qAqULo+bx7L3Re8EawcrkWDxaQEkyespO4/uuabX8tPxlyNRLBhPEwySyun62SM5ZlrNB0t1GioNS04evhdTuLgGVGCxCXf1TaGJ+WiBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732284581; c=relaxed/simple;
	bh=8yzL4RefbyRilcnMt/6RHj2li1nlKEMv79iPDOsRWkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIPOXO+aBbn2VfV4g+bWMmq44kazamOPhQP9qzPGC2gk+0TGIBJdEaJm35YfuRTMJyIWAuOt47VYchQLPUMaZn/04KhJ8YKtzYwxem7nF4gRToPBJ5dM/dDkePFGPtHvjtDuUteFtM3ECi26Gn1XDD1DGrhdsKyCq1IEU1teGNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFJfOb37; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732284581; x=1763820581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8yzL4RefbyRilcnMt/6RHj2li1nlKEMv79iPDOsRWkM=;
  b=oFJfOb37tkGlDim9YMR5+9jVE0nVfbRBxAhUHdnQnx5vINZ0/RP9s+7C
   JvWgjS+9vivMbhGt+zJWdcPOSGZXEyMCr5Bz60CnjtHrfnHhQIrBD2a7m
   wW+CwMvepESb+IShs6RpTSC4KDLBVSvIGFN2l5PljSqzIbmViMBM2kkfR
   Ne+xugn4RbGaOTnYoZaT/+/VgudyneW3oPooBEkUlCGZfVMmzmsQvHhr1
   h9icoUAs5tvX1Gilo7pZHNUxbwFUkNhZBoe6e+BGeRmcZEyqwFwGRzuWk
   abCyXLo+wtqwGN52DUOwm5LnFyVJQMNBx9AAKkulsyMDM9eyTpHlw80CN
   w==;
X-CSE-ConnectionGUID: 1KTmeH2DQ9a01ZndBEvi0g==
X-CSE-MsgGUID: eSIzhDkMRd+vVukGl0GXZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="49860260"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="49860260"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 06:09:40 -0800
X-CSE-ConnectionGUID: io0Y5A9JQt+m8ujAzjDt9Q==
X-CSE-MsgGUID: oUWLO3FMQwaULxlztRCN3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90730534"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 06:09:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tEULm-0000000HR2B-31yr;
	Fri, 22 Nov 2024 16:09:34 +0200
Date: Fri, 22 Nov 2024 16:09:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested
 ATRs
Message-ID: <Z0CQnqfkR_p53Fvf@smile.fi.intel.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
 <20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 22, 2024 at 02:26:19PM +0200, Tomi Valkeinen wrote:

...

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

SoB != committer.

(Yes, I know what + means in the email there, but I don't know
 if it's a problem for all those checks or not)

-- 
With Best Regards,
Andy Shevchenko



