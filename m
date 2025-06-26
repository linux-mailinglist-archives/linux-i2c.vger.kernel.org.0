Return-Path: <linux-i2c+bounces-11624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D73AEA684
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 21:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF37316DFBC
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 19:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E56C2F0050;
	Thu, 26 Jun 2025 19:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+KKuXwy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDB3253F3D;
	Thu, 26 Jun 2025 19:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750966413; cv=none; b=AgOr3+YJP9RcFCpPbzpBPE9uMGLK79m1L18oDprjDU/Jrd/6p9AQhkHEpDSUIIh3PBo0dCGZ5OAxpBashJM0fHEwmVu5GDr4LrH5U8/5f7ZbJ9/HOoHjHGM2n52GAK4OVCiao54OunGQciIhBgv/IiQAnfdPu6YmR6Q9ORyZ66o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750966413; c=relaxed/simple;
	bh=Qg2ds2zzwZk7i1DpvmncanziZEmqXoyg1oWHGRahHMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RS2qetfzrtFT7vPkFHioRS/pB/9y0y7YjzRd9kdhb8UFFF4o5TBes8yexgDs0hpY1O0/JnIvHfxo/iUrvYDrr+oQfSd/ZKG0VUvLdA9JA1G+q9gVfOCcLlBuGla6pWWFJDqJLUOXKjoRUCwheUVACR9lCDgCY5Z2IZuFfXWGLtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+KKuXwy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750966411; x=1782502411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qg2ds2zzwZk7i1DpvmncanziZEmqXoyg1oWHGRahHMg=;
  b=N+KKuXwyTokGPSy+52Tj497DaMUXeDmL0rfjzW2UZF3gBxoHzL5zliEp
   CNfrr+0gNjPHrR6K202zETdXDABdsOzE9tobHIquQI6kBQ8mIPIdNop04
   f4dPvZVTY3uh8CizYyKi3jzggUpaAyK72XvkSZVyT0tru4wTid1Wvx7oE
   TgssZVYMNo/zzVk1C6JVu9EAcnMLvY9wLGczPDYrXWVZybUsw/8hSLlfy
   6Qjxf9sGv5oADNjPxeq+3quP0v0kzmrC2NXzsiyqFUkX+I6XoRSZ4tDEu
   66TP2GJqVmhe2DCNg3wQJr1vbUTS7LXPsq1BTbDqkN5dW6x2aiTmtiSXD
   A==;
X-CSE-ConnectionGUID: ehMSdrqnSYOmxzMC8z4XQA==
X-CSE-MsgGUID: bszYQue2T7O52KIFqRVvrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64711559"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="64711559"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:33:31 -0700
X-CSE-ConnectionGUID: aYYZWeeHSWS91Bs/9QTSVA==
X-CSE-MsgGUID: hem5iQ1nTTeUnJpYFsK0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="158096049"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:33:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uUsLf-0000000AGnq-13ID;
	Thu, 26 Jun 2025 22:33:27 +0300
Date: Thu, 26 Jun 2025 22:33:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: linux-i2c@vger.kernel.org, andi.shyti@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c/designware: Fix an initialization issue
Message-ID: <aF2ghjEsRbr5-xJg@smile.fi.intel.com>
References: <20250626190525.469618-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626190525.469618-1-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 26, 2025 at 03:05:25PM -0400, Michael J. Ruhl wrote:
> The i2c_dw_xfer_init() function requires msgs and msg_write_idx from the
> dev context to be initialized.
> 
> amd_i2c_dw_xfer_quirk() inits msgs and msgs_num, but not msg_write_idx.
> 
> This could allow an out of bounds access (of msgs).
> 
> Initialize msg_write_idx before calling i2c_dw_xfer_init().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



