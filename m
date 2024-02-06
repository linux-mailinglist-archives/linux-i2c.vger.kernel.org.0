Return-Path: <linux-i2c+bounces-1653-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2929884B99A
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 16:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C6FD1C2134C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA79613173E;
	Tue,  6 Feb 2024 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfoH8biZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305E11E521
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707233438; cv=none; b=XJd5d65KoBraE6N9JB5S8+FVHxa4Bq6wmLt+9bnA5ZbL96+aFv3G+kw0obvIaFqUKuJs6wt46+iQfyNT8+wDsWTBvbvoWE6h4V1IfE2A6MMqkFWsxaruQTu1HsKyMVbw8tYhmUX80LoV7K/MLGaOyn9w5hW8s/tVFFM3Ue74+hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707233438; c=relaxed/simple;
	bh=KnJMmwXaWwy4l2nSQ8FZN0S4eej82LF2/eNENYhe3pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJtjFMCLq6Mggia0Vt4bsEuFDnHdlAOgzg44NQX1DC0av6fnzWqLGNKHrM3w1mu91nAqT7K6XMkDNWQ1KJ8/I3ogs51tT0QZvH/GHw1czU9smhHeyC41mye0H8DsUh0hL6Af0bG3/3kfyofl2dWybp+G8BwGU10AUaJnufLIMxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfoH8biZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707233437; x=1738769437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KnJMmwXaWwy4l2nSQ8FZN0S4eej82LF2/eNENYhe3pE=;
  b=HfoH8biZRX7ePnRZCdodY+FZIN8zRa32UGyAo5UtIbVO9qxluILjSZgE
   tN4Zm4w5E1BrwtKwKresAT1Ds7jgmOqle8lxlLeSK1yaQADaQ8ju7OouT
   feWo9wtBxrXGFyGR9nWYV8V2rQ/L3COG0iZbqWOQNkSxfpBYQsavOH1z1
   OrZJqF6ijalJlyh0UPO5QOgja1bWGc9vfbgYvBXp5O8O07eHO2TGtZBFu
   gowKGuFG1bJVkHFVK/hvEnoe69Z89MJgV8PuSbOwa4WDMfNVU+nK8JAPo
   jL6eDJSOhG7RxSwp6955aBoOQ/T1ZqBjmv7NQARGhQtBvHzowkSanKHNS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="657704"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="657704"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 07:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="909667356"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="909667356"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 07:30:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rXNP4-00000002NJx-3DxL;
	Tue, 06 Feb 2024 17:30:30 +0200
Date: Tue, 6 Feb 2024 17:30:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/9] i2c: designware: Add some flexiblity to the model
 info
Message-ID: <ZcJQljILDGq9Xk_A@smile.fi.intel.com>
References: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
 <20240206145158.227254-2-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206145158.227254-2-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 06, 2024 at 04:51:50PM +0200, Jarkko Nikula wrote:
> From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
> 
> Currently the way to identify a model is via a bit field, of which
> 4 bits are currently defined.
> 
> Use a shifted value to that more models can be defined.

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

While this is true review, internally we're still discussing
the possibility of moving to plain numbers and shift, so we
may add arrays which are indexed in model-based way.

-- 
With Best Regards,
Andy Shevchenko



