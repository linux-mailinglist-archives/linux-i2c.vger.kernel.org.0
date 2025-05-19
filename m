Return-Path: <linux-i2c+bounces-11017-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65591ABBC26
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 13:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81677189C4FD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 11:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A24B2749FB;
	Mon, 19 May 2025 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkPDccuB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B493268FC8
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653523; cv=none; b=fJOnG7DZvMrris6GRHk62TcirpLXI5Kb+9GBfZIyz5flNmb8uRmQujya10uUGelw8OBFa2j24EIfHfITs6+cwcqb3mfjGx61DZcoSVYfOmzyFqyxLzqxJfwG2o7x/j9g2nuB3hP6anm4I2lMiTzzoJ4ZsxmVEnDUIt5i9VjF0HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653523; c=relaxed/simple;
	bh=d8pTiPEkIXmvLphXftkV8OpNnpdeME9fd709mUB0N8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gw5/2+XPAh5CLnEV0p4xWrVmN9jpPjS8JHhm2i7HvFQ9RSX+PLT3aWgumDz7KpFmMQuaQMf99pxFY2uPIIWS4/GX91CaJQS9WC9Q1X2iOEQ5NaDP6HqN44P3apessxmkEdwxtAtlciPf6ack7rVCtUGk5obiq8TK2Hhc8kyoMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkPDccuB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747653523; x=1779189523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=d8pTiPEkIXmvLphXftkV8OpNnpdeME9fd709mUB0N8o=;
  b=AkPDccuBlDCiVfzR2QBnkN4PDe0IR5uWzxMCA4Gld/ohs0mR3KXr4tq0
   Y5N2JIDCZoEUD0imOrb7kXzhOm05ieQxQnm9MYO46UglKnJcbBanCp99w
   PsjuZih1p67pxE8UJa9YA8O1zLEpORZnS3k4Kb1jVK0lBBVfOI/Auv7ZB
   J6IyyWn4m6EKmIEj1dOU6I9sEBhpk5JPBUWDDa3NALGu33yfZWrhX7yXv
   nj7p/jeaYg3aUd+NHbvqhBa6afyTIuvCED/tL/PW8FR3AMfWdGAYJ6NFe
   kgrsutRnYL2EFV8lpuYxlgURjgf9ogbtnoyJr34e8F9Dot8/eNhumatzF
   Q==;
X-CSE-ConnectionGUID: XUbyO/RuST2pwC6aqKXphA==
X-CSE-MsgGUID: Njb9WbpOSk+JV2Hy2ZjFvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49423990"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49423990"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:18:42 -0700
X-CSE-ConnectionGUID: vCl+YuohTSKOiYLvjJb4DQ==
X-CSE-MsgGUID: VUPTVqwoRfeisr+nGACvww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="170251765"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:18:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uGyVw-0000000310x-18lw;
	Mon, 19 May 2025 14:18:36 +0300
Date: Mon, 19 May 2025 14:18:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] i2c: powermac: convert of_node usage to fwnode
Message-ID: <aCsTjM49Ll2fcv4j@smile.fi.intel.com>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
 <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 19, 2025 at 01:13:12PM +0200, Wolfram Sang wrote:
> 'of_node' in i2c_boardinfo is deprecated in favor of 'fwnode'. The I2C
> core handles them equally, so simply convert this driver to fwnode.

...

> -		info.of_node = of_node_get(node);
> +		info.fwnode = of_fwnode_handle(of_node_get(node));

What puzzles me here is that of_node_get(). We already do the same in the I²C
core, does it really need the second bump of the reference counting?

In any case, this patch doesn't change the status quo, I'm fine to leave the
research for the later.

-- 
With Best Regards,
Andy Shevchenko



