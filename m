Return-Path: <linux-i2c+bounces-4236-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 978DA912C88
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 19:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0029628746F
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 17:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFBA168483;
	Fri, 21 Jun 2024 17:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1qZStEY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6621C14
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 17:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718991773; cv=none; b=VQaWjQKPwALmsePm8fbb1cm/HqcX79BNx1xLGBUP1rt7jGNpFZH9UovfTCdBoXSZ+QAI0rmARuN6HD52FzXWmxIhvR39REoI3PRxBFsGwZCOuzzQRKjANGR1dxD1KLfgCpoSCwDiLlPphXHvc1zfduvADc6QHyiYIwmbJtbD0aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718991773; c=relaxed/simple;
	bh=e/xsDqRCBAEV/LLESu6Dhgs1VGWYoFpBI/v/dumcLBA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ly6TlqHgoLs0n+QDTSFd3ZjrkQxvXMhlaehv1S7tqjb8tjwyXLdOcFRQiQVC+2z7I5GcxqcifeAaLO5GgnlnxWlCeIWXrNix1GKunis1kx0OY34LCf8RnRqPTcpMeRsJUqoYW+JdNvAi5QDbAxm+Wp8b8HrLrZwamPbZ4c9CT6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1qZStEY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718991771; x=1750527771;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=e/xsDqRCBAEV/LLESu6Dhgs1VGWYoFpBI/v/dumcLBA=;
  b=h1qZStEYJOlz7blVg63Er1VnX7o85aQY5k50eyVvmNWPSqfV6Ob71bwI
   Nkc4QaD2XalJ2A2vNZad+8/2UXb0NZp999eLuIvHhgLwkgpf2OMM8vVsU
   JVOwAAjCzmQDuSZvBch1h4beB7+1vCNKN9hfugitZQ+6X5eYDwr2DCtBt
   zKnfq+M6PjB9Hi0tUokXGUv5+Cuu6I+a3b1I/dXm/TGz4f9sk0u872jRx
   IQZm8XEP5fq112NRovTiPuJawxiaOMAYEwYrwJ/o4nVMa7Pkb2XsFdTwh
   lnS+k7DYt2VHJmxme1HeM4B/gYJG9/jc9W+0e9adB6QI05XKRr8rjEqnL
   Q==;
X-CSE-ConnectionGUID: HTvELS/4RS2n5ypBvJB3MA==
X-CSE-MsgGUID: NqVCNqO8Ta2QmGP9PNyGLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15794483"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="15794483"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 10:42:51 -0700
X-CSE-ConnectionGUID: U5EMzEbIRvKiLGjxRVkCCA==
X-CSE-MsgGUID: Gfr7SY8hRnGxayUNk/7Vhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="43334823"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 10:42:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EB52A11F855;
	Fri, 21 Jun 2024 20:42:46 +0300 (EEST)
Date: Fri, 21 Jun 2024 17:42:46 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: Add nop fwnode operations
Message-ID: <ZnW7lvL3m1H6Cllf@kekkonen.localdomain>
References: <20240614081418.2506288-1-sakari.ailus@linux.intel.com>
 <27irngtdi3bjhocwjrgw4etg6ieg5fq2g4bgkuyzxhedebvh2r@rlol5d7osyax>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27irngtdi3bjhocwjrgw4etg6ieg5fq2g4bgkuyzxhedebvh2r@rlol5d7osyax>

On Fri, Jun 21, 2024 at 01:36:19PM +0200, Wolfram Sang wrote:
> On Fri, Jun 14, 2024 at 11:14:18AM GMT, Sakari Ailus wrote:
> > Add nop variants of i2c_find_device_by_fwnode(),
> > i2c_find_adapter_by_fwnode() and i2c_get_adapter_by_fwnode() for use
> > without CONFIG_I2C.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Applied to for-current, thanks!

Thank you, Wolfram!

-- 
Sakari Ailus

