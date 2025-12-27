Return-Path: <linux-i2c+bounces-14795-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65905CDFEA5
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 16:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59163301A72C
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 15:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B89B25F995;
	Sat, 27 Dec 2025 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQq2b86Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B40F8479;
	Sat, 27 Dec 2025 15:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766850823; cv=none; b=Fo+AYDo50WDwBth3cVfJX55ZjGXqHviCN8C/5TKCaL20g8ej0VZFnWXqoSVa6vGf8VCsfAYa1RFjgSy1M+BI4xr/K0aOK0uWiyEIj377/P2MrfDi+BWYEcfmE9PXI+nP4ucZY1752/PF/wFOKIouGC16y7+nHpIMXlf+wUkxOPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766850823; c=relaxed/simple;
	bh=AEDz2TpFpE1B5s9kjvpCS/C5OQfDJIsY+a1+QN407a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaRJLbBoZS2cdJtSUXv8KvdNmRd5STIx3FIlBBbr3WAnboc9iwHpAqbkAdVqQbXKMsTZFanei5smLVaxZ6Y/kfLxiMgNMaCrrQbhaTODAQr4lMqCSGmrbdaph9xd9RarKjOT1L1VdgnvDIOcebcodO3xdM4jWrgsDnXEKnp7qP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQq2b86Y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766850822; x=1798386822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AEDz2TpFpE1B5s9kjvpCS/C5OQfDJIsY+a1+QN407a0=;
  b=AQq2b86YnIaGqHKHsCAmY7JzUPIyz5/SQaWPcJOl1IdGpfhRwwl82Mms
   yGgRZY+FVdMdE+B6LZheKAEu16I6mZZHrQeh7wlyGCCi8XXUqDnsVnIsN
   8fRD96KGwG7Biu9kQFcT0j0yRzqYFwe/nQezYDfeMZMrIpfUd9g7NoclM
   Ys/Ck5sg313OHbEH6ECogbtHqwd9Xd48Fk0WEQCAoCVhL8nbrS2sOCpXX
   3Cv4nWbLbo5fTOPqChSsykxnadc7h1M2smaImRse2RDiwi7hDjLjepUhr
   yJ7td6KF0+HNPyTKwzN8/4mzGV1Y5wmRxyBwHHFS7X+t/emV7xQLkbbBU
   A==;
X-CSE-ConnectionGUID: mtbTOG6hQbONEOFntAaxRQ==
X-CSE-MsgGUID: XLpfEfubR+C6bcJms/LOpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="72171373"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="72171373"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 07:53:42 -0800
X-CSE-ConnectionGUID: F2aJoVvmTDqWuI9RvS8x6Q==
X-CSE-MsgGUID: S87ZZ/d6RUS3r0ofQqy2Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205612787"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.211])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 07:53:39 -0800
Date: Sat, 27 Dec 2025 17:53:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] i2c: designware: Combine the init functions
Message-ID: <aVABAIPjkCdbr-Hz@smile.fi.intel.com>
References: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
 <20251218151509.361617-5-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218151509.361617-5-heikki.krogerus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 18, 2025 at 04:15:03PM +0100, Heikki Krogerus wrote:
> Providing a single function for controller initialisation.
> The controller initialisation has the same steps for master
> and slave modes, except the timing parameters are only
> needed in master mode.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



