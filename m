Return-Path: <linux-i2c+bounces-6313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4683F96F399
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 13:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 711C31C21E9E
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 11:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974301CF7A8;
	Fri,  6 Sep 2024 11:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4c29Evb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077D91CF2BC;
	Fri,  6 Sep 2024 11:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623438; cv=none; b=gsmuPiJ/g+djo+QwPwBPbbH3vXGCwVvDM0WZlomrlmcqTCf0qVRzOATbrqUQo4irrl/PZXhQzSj7DQH6ejg5IhkGTrcHtipzxOHrvwBzAJzsqPYmwSE7oq57fiqT3UXzN9njhaZpe1C+YZhvr+1SzBA9qJafYN91qlprJELa0Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623438; c=relaxed/simple;
	bh=x9q1YLj8yd5saMYWCx4lmw6GcnGoxW7qIv0+WQlvKkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJIPiOMlCRYKjPEhzJ7M3iiFmyrSPjNamYD3pma4uz11g/7sTYSaJOvvJPHdhADlxa+DvmacTEnM+5wFeyhfZH//M7VQpfD/mvYbW/HKxHQmsaE53k3rLy7MhgfKPaHMwwlIbNXSpt8U/v3REbWwvl9UAJNnttPf+GkwqPFzL0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4c29Evb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725623437; x=1757159437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x9q1YLj8yd5saMYWCx4lmw6GcnGoxW7qIv0+WQlvKkU=;
  b=n4c29EvbNB6Y7x6jDIMTghx2JJ5zyReAOXM+TH3ZmBNvu3FAR1qkfKAD
   IaYoS/e96N1KDy2T44LBZxQlR9ovLBlU96TNW830ijnBsFJFRoEwZ5tW3
   c9DSXybJQFvCxjC5hlM4PQn1526a8Z+BXW3972GbIxybpn2Bc/wPhF5IO
   tU8HkaCYqvn5+46j2y2sZfey3WC986T9wxA02hHLlijROyNcT5IsRsZGb
   0CusgrjXvJInz9NY+E0yiF1GUMKjy6TAY4ZKql6dge0wba62unOMglQmm
   +2VNF/aL/Tb1c1UrHstvqnnQHG9mhQCJcAA9JDt8TiTxfWXY0Ha/F3NkL
   g==;
X-CSE-ConnectionGUID: eNFUFA0PTMK5OnFRqFL+iA==
X-CSE-MsgGUID: kAJdVhpoTnypmt+abpCjWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24245789"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="24245789"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:50:36 -0700
X-CSE-ConnectionGUID: VXFm6dHkQamHvA1TQlM7TA==
X-CSE-MsgGUID: yoi+mpijQZ29UzLBW1ZBqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65916620"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:50:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smXTz-00000005m2H-3Kzj;
	Fri, 06 Sep 2024 14:50:31 +0300
Date: Fri, 6 Sep 2024 14:50:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <ZtrseTh49agQn9Ua@smile.fi.intel.com>
References: <20240906065449.2897-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906065449.2897-1-kimriver.liu@siengine.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 06, 2024 at 02:54:49PM +0800, Kimriver Liu wrote:

> ---
> V4->V5: delete master idling checking

Please, slow down, read Submitting Patches and Submitting Patches Checklist
documentation, make sure you understand versioning of the patches
(this still is v1 formally), address as many comments as you can
(the rest should be replied to the reviewers and explaining why
 you can't / won't satisfy them). Only *after* that send a new version.

-- 
With Best Regards,
Andy Shevchenko



