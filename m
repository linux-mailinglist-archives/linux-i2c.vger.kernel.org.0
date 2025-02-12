Return-Path: <linux-i2c+bounces-9385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F5CA32728
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 14:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD03916300B
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 13:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D85B20D512;
	Wed, 12 Feb 2025 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUf8Kdhj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A318C0C;
	Wed, 12 Feb 2025 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739367083; cv=none; b=R02QkMHNplf1DH8QlgrqUG614G8F6PT21IUYSDcGR8bc96moYTibV5R8gzBugcAxK8ZPS0AgJOg2s37XNk4VUhZ8yaEweK5g6fYK6QqUpP9bHV0Cew/+ojAI2EOFF1wUb9WpBmezOLXN3itKDcEyHGVExwTcY0G6VrFUIf0CNOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739367083; c=relaxed/simple;
	bh=4xoEGxaGTPfg8j04VjecwBWjkZWT480TK+WyMxjO+kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecwDU//RcJgkhQLXIsmWRRAgWrHExs/YOMNcihu8zgjuoAsHNGZmdsKD/DYZmhwB+qWKIoypfdvPyWq2Zul+l+7dc6dHN8fZj1iV7vbU8BglVODt42uvh1tsuERpcGWgjbz6k9A35u0lMQ/faohyemW40wzRQDLRB6PudNPgTLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUf8Kdhj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739367081; x=1770903081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4xoEGxaGTPfg8j04VjecwBWjkZWT480TK+WyMxjO+kI=;
  b=iUf8KdhjeQD6DvUFofOA2WwNs7S4kURyidsIdvmIYR/gdaoBmWSqRu/H
   GqZcRc03Vu0+AMtTpD1YkC8crUYHK38sTFXUv6QoDs58DZEtZxCCjNpY4
   wmgqkQv9iiF/UYL1AI4N5dlbQCvDZFSRtA/yOUMhK1c1PmECSx02bgDX4
   49A73C/apkXpoV+FiwZ9LeLQ/NhBkHrwbZiU7uD0ThykvFrQVoLjpxzeO
   JnxURoYE2FxP3IvFM1bYj12PNSh4YXVvAAO5fZ3iok4nFDwWJy6ihx3YJ
   FmeTFMV1AhdbJvvgwsrHwSh/gD0+Pg0VMoaa23OMLrrOnbsYiQ8dlX7+A
   w==;
X-CSE-ConnectionGUID: 4uCIoRBeTW2L3MEZzEcieQ==
X-CSE-MsgGUID: 21V54vdrQJqVqYIsBuDIZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40167862"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="40167862"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 05:31:21 -0800
X-CSE-ConnectionGUID: 4k3j/0+uQK6hTeh1E1+jAg==
X-CSE-MsgGUID: O5UX6aFNSFeUn1plna4zHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="112770975"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 05:31:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiCph-0000000AqTL-2M5z;
	Wed, 12 Feb 2025 15:31:17 +0200
Date: Wed, 12 Feb 2025 15:31:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: Assigning fixed numbers to i2c buses via ACPI code
Message-ID: <Z6yipb0ACrqVaECP@smile.fi.intel.com>
References: <CACSj6VVNFZWJZVk4k98QYGdCQ=u5TzyfRE9NC_3xAKMRoPGzJA@mail.gmail.com>
 <Z6yBGoUeoNQGZHVn@smile.fi.intel.com>
 <CACSj6VWkDnQj2=tOPMsbTo0uerNSR6sGSMO9c1FxWbEfYFz7Lg@mail.gmail.com>
 <Z6yO1wJ12FuiEVdf@smile.fi.intel.com>
 <CACSj6VUV7XjYMnu482tVsS2Sb1XrxzBA5h+AAkt1K-FU3Dy=Hw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACSj6VUV7XjYMnu482tVsS2Sb1XrxzBA5h+AAkt1K-FU3Dy=Hw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 12, 2025 at 03:37:22PM +0300, Konstantin Aladyshev wrote:
> Don't get me wrong, I'm not trying to defend a solution with aliases.

I'm not assuming you defend it, just telling you that, yeah, design of
some solutions in the user space WRT HW finding and identification is
broken. And OF alias approach was maybe a mistake to work around that.

> It is just there is existing code that relies on fixed i2c bus
> numbers, and I was just trying to understand if it can be ported to
> x86 easily.

If you do it correctly from day 1, there porting will not be needed *at all*
independently on the architecture (it will work even on legacy non-OF/non-ACPI
platforms as good as on newest ones). That's my point.

> Apparently it can't.

It can't be done in current code base, but one may patch the kernel and
the ACPI tables to achieve that. I do not think it's a practical solution,
though.

> Thanks for the answer!

You're welcome!

-- 
With Best Regards,
Andy Shevchenko



