Return-Path: <linux-i2c+bounces-12010-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 579B1B0F560
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 16:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8708A1C81DCA
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 14:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FAA92EE27B;
	Wed, 23 Jul 2025 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6WkK6Sc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0702E763B;
	Wed, 23 Jul 2025 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753281211; cv=none; b=a2SF/7C0Xm6nC3U7iEVDC+IKGfQL3H+Dg4sMMOqVwy4r6aue+51R4IjyfdWRtCzG9LzlrhwEsC/bt9QBrtqkLP8Fxd42xH/3cTrKxxMehh4vuE8uhFj68SvEPXMHc0vk2ZBixscBJfwd/9QZpqtIQVQSvXAKU7hmBDJ4pjqdT+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753281211; c=relaxed/simple;
	bh=8R1Uyybb1AHZXoW5q10mRs/TaVHVGp3bgAGFMHMoQZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1mbeP+6QqVLoI3UNH8vwYrk7IKfalgq74JptV0C4fCWX9CNnS64MwOvq+lhBsXguCmN8N3bq70r9qGwO0p19GKnUQHQnM5286Aou+7XYnQgW0n2iXW3yOcnI9lJ0kMhT1JIAu4rjZ36gT6GePt/3VkthaZcc+UWxnsXRIsOf9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6WkK6Sc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753281210; x=1784817210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8R1Uyybb1AHZXoW5q10mRs/TaVHVGp3bgAGFMHMoQZA=;
  b=i6WkK6ScwBMSmSOY47J4jZ+GU6uzgKHVtjz6OzcSBmPkf1QlnzEoGHj3
   QjYAe4EhBaAiGkLFmMwmtomRLQsRHMFt8gAHhMWmvztEgeVRBsQF1bAly
   bVLpJl1evTwFRH4Xvq4/ckJjiBmTWvoUB8i7ljK9xzJa7wQvboze11zeo
   ZaZq2lMmW6avvVIqwvWSAiVYJ5uuOdiPC3cygUIa999eRrPCCsCXNeISI
   iY3VZkS5eDqS7/RZPf/rEmiAoDL+ir95TthqYDUqftxLZLxYzQyLI4AZN
   wArjJIb739T+k7Jgk2nY9y4ARQ2Z+iH4G0p04SNb6ZK2sxEmXehZNB30V
   w==;
X-CSE-ConnectionGUID: YXjpXzVcRaS8xDTkuy/d8g==
X-CSE-MsgGUID: 4qaLcYwmTBuBraObR+oqTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55713447"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55713447"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 07:33:30 -0700
X-CSE-ConnectionGUID: uUFaIqLYQ9mzBnsq59+64w==
X-CSE-MsgGUID: cvgKaRGiSQG71+WZa7jnjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159178417"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 07:33:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ueaX7-00000000JWI-1OU2;
	Wed, 23 Jul 2025 17:33:25 +0300
Date: Wed, 23 Jul 2025 17:33:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	linux-i2c@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Fix double-free of fwnode in
 i2c_unregister_device()
Message-ID: <aIDytDyThR4SoR68@smile.fi.intel.com>
References: <20250719180104.66939-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719180104.66939-1-hansg@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jul 19, 2025 at 08:01:04PM +0200, Hans de Goede wrote:
> Before commit df6d7277e552 ("i2c: core: Do not dereference fwnode in struct
> device"), i2c_unregister_device() only called fwnode_handle_put() on
> of_node-s in the form of calling of_node_put(client->dev.of_node).
> 
> But after this commit the i2c_client's fwnode now unconditionally gets
> fwnode_handle_put() on it.
> 
> When the i2c_client has no primary (ACPI / OF) fwnode but it does have
> a software fwnode, the software-node will be the primary node and
> fwnode_handle_put() will put() it.
> 
> But for the software fwnode device_remove_software_node() will also put()
> it leading to a double free:
> 
> [   82.665598] ------------[ cut here ]------------
> [   82.665609] refcount_t: underflow; use-after-free.
> [   82.665808] WARNING: CPU: 3 PID: 1502 at lib/refcount.c:28 refcount_warn_saturate+0xba/0x11
> ...
> [   82.666830] RIP: 0010:refcount_warn_saturate+0xba/0x110
> ...
> [   82.666962]  <TASK>
> [   82.666971]  i2c_unregister_device+0x60/0x90
> 
> Fix this by not calling fwnode_handle_put() when the primary fwnode is
> a software-node.

Thanks for the fix!
It doesn't look elegant, but I think it's all due to the (current) design of
the fwnode linked list.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



