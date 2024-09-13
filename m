Return-Path: <linux-i2c+bounces-6696-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB01977D65
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A1FB1C24A84
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310B91DA0E3;
	Fri, 13 Sep 2024 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WI5xJa3G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927921D86D4;
	Fri, 13 Sep 2024 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223355; cv=none; b=LRD9EBTDdmKkkWeZzEnYWAjmU5g4dlPlKnDhDFFqmFg2XuJrsr9KmbtQMAxO6rWvdiD6J7R34Ij1VpdyEjnSzTC4/4RMOEkYcbXspPPU1vl4QNrBPSH8oNOabrTVtKtIQv4NjKmbO5bT84P+g8hcZrhhfLEv6UqmSMZXcp3d5gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223355; c=relaxed/simple;
	bh=i6ULjdQFx3hSTUi2FClPl+Wv7jWBPBdc7fIJZO9A84g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3aSvwlVMEMc1SVuW21aP+EJ2fYe+AA+tjtgPWtGAndiKjH3EmBXdFlPW9eKoBWKzgsz+8AGDInnR60kM/wA0jPMM2YJsJtQAHBTGFQIGWygGTI/3S9MvHZvQzF45XgR93HlGJcY/VmSMqhvADWiQT8WauQXw0/LlYO4eiDiqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WI5xJa3G; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223354; x=1757759354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i6ULjdQFx3hSTUi2FClPl+Wv7jWBPBdc7fIJZO9A84g=;
  b=WI5xJa3GIm2KlkEQiwKe1gntB9pJOOrkxdt0yWV1xXnOnyHleR/Um+9w
   W/ir2YY/biT9VD2VFwo9a/d8tQfWysyaOO6mWNIdM0sQr3qxv2kdDRABb
   UqrU9zsaSTl4AUD44J0Ac+Gy919VzYFev8g1OaT46QxP2kpQ4KJ/D/Lrm
   rREJAJ7WhtszC36OSuA1Lwz3QOrXhTgXTpoBDQqvOehO31Q8Y1xDNrT/r
   qjv+mEK2J3/ncmBo5vqJlTBiknpiujFVIAe4DVmR7TAhwPS5ZFnyOR/II
   QpuF+BbuD/bAlAQCBXf6NYxU03mN3I1TAMKe9tZHd8QovMB+/1VZXBE/m
   A==;
X-CSE-ConnectionGUID: sInzwkqYRrSQpWgtVf8hhQ==
X-CSE-MsgGUID: jqWV+U2zQ9ScdxAvxHziog==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25271986"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25271986"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:29:13 -0700
X-CSE-ConnectionGUID: +ctQAAoLTYehwwW77k+SjQ==
X-CSE-MsgGUID: eaMqxQcmT3O+2Qu47QihrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="67978143"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:29:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3Y1-00000008GGM-1jvO;
	Fri, 13 Sep 2024 13:29:05 +0300
Date: Fri, 13 Sep 2024 13:29:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Boyer <Charles.Boyer@fii-usa.com>,
	Vivekanand Veeracholan <vveerach@google.com>
Subject: Re: [PATCH v3 6/6] i2c: npcm: Enable slave in eob interrupt
Message-ID: <ZuQT8YfVetrkMotQ@smile.fi.intel.com>
References: <20240913101532.16571-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913101532.16571-1-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 06:15:32PM +0800, Tyrone Ting wrote:
> From: Charles Boyer <Charles.Boyer@fii-usa.com>
> 
> Nuvoton slave enable was in user space API call master_xfer, so it is
> subject to delays from the OS scheduler. If the BMC is not enabled for
> slave mode in time for master to send response, then it will NAK the
> address match. Then the PLDM request timeout occurs.
> 
> If the slave enable is moved to the EOB interrupt service routine, then
> the BMC can be ready in slave mode by the time it needs to receive a
> response.

Fixes tag?

-- 
With Best Regards,
Andy Shevchenko



