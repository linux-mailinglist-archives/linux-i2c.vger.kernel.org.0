Return-Path: <linux-i2c+bounces-9803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E88A5DF5E
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 15:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E7216EBE1
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 14:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6656D24E01A;
	Wed, 12 Mar 2025 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwfj0d5c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957F924E00B;
	Wed, 12 Mar 2025 14:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741790669; cv=none; b=bVXNLY+7j5gV34+Fm/YBo5/v23DZZGPtsDoXg2iYVwG1A4NqpNUtoLh9AutxE+Asv86ma8STA32K5NtZPW7UueOSPWAgzK4p7tK9Ba1L11mNm4oQSNs93aZ2LY9meudADkq7JLSyB7St+Yb3jEUAoM6V+EhM0eMmVuhGQ6jM/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741790669; c=relaxed/simple;
	bh=JlyULm5sFWfEC5W6Kp9T+STW4ug38juslA9+OoQ2jdY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sO0G0WM3XoqwHhc3qB1fs8anQWKel55aQEHtH4mbW6OuTlZofSvV1T0Gud1dp5fVQ3wDw8cHUpFCwNDq8XI/M4SPWVSeH4qMMSr5bt1hS9vypAKoC3Z6HNHG1ENDQ34kt7UOZnyQ72YOTuKKP+XTYWdwdTK/oPjexzUH/7Be8dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwfj0d5c; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741790667; x=1773326667;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=JlyULm5sFWfEC5W6Kp9T+STW4ug38juslA9+OoQ2jdY=;
  b=cwfj0d5cafalYJ/37f0sRCj88jw0P3AEagfXBedrz6L6/DMZbvifUTGb
   o948Ba/7HJu4srzsLpxQSQUoDJhByW7GPUq2Op1J5rgpOS1N80ua9lXro
   H1O9N0/1albDjpV43hfgV+9Ty40WXOiISaweu95MwjQ4bj9XvLDGH0cfD
   p7va9b9GdJsaf0ihtEBgAGaBAcrueo631LwuEln2/wSjsyuUWFu8Np1D+
   rzEvcbObv+Z+MzZcz/FY/z2SSvaHEE+WfASWin7r4J+Uvp3If6Zv2rN3C
   WEaNWW95lGl+qn+8/3w/GSdy2KXzQMrDkEk8kn7bCRyzdBOJ3RoJ5JBqM
   A==;
X-CSE-ConnectionGUID: J5wK57r4QcWh6Krzbbt/Zw==
X-CSE-MsgGUID: 1/fHfwFkQFuSywnWSO2tnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60417674"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="60417674"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 07:44:27 -0700
X-CSE-ConnectionGUID: 7vDn7qVXR3GnS9FGPXuH1Q==
X-CSE-MsgGUID: +OCaPgHaSqCl1FpJYMeLtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="120631285"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 07:44:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsNJn-00000001tP8-2EnW;
	Wed, 12 Mar 2025 16:44:23 +0200
Date: Wed, 12 Mar 2025 16:44:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: core: Propagate all possible errors when
 requesting recovery GPIOs
Message-ID: <Z9Gdx4QIMj25JRB2@smile.fi.intel.com>
References: <20250212163701.2407540-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212163701.2407540-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 12, 2025 at 06:37:01PM +0200, Andy Shevchenko wrote:
> If GPIO is available but we can't get it by some other, than deferred probe,
> reason, propagate it to the caller.
> 
> No functional change since i2c_register_adapter() still cares only about
> deferred probe.

Any comment on this? It's a month passed without any reaction...

-- 
With Best Regards,
Andy Shevchenko



