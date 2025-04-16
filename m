Return-Path: <linux-i2c+bounces-10395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B2FA8B1AA
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED0925A3158
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08A322D7A1;
	Wed, 16 Apr 2025 07:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T35I1GxC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3606F22AE5D;
	Wed, 16 Apr 2025 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787133; cv=none; b=jpLqS4QWkobdbPBq0qB1K19vsw5GupyvX6kkVlRwOqhXyD9gbvuB8hBGY9WHd5yHXgVQTU/dHtLUwLMMgr9hIp8pp0Vv+rZpR3eFTFfVTbk6sHWBe5MmMB20+9ApUbORRJ+uL/lJB3Zc0pf8uxNZo0ZAKsgeBsCoUID8Xkypi90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787133; c=relaxed/simple;
	bh=j8eWpTOg/shBeJKd5tKj0TWI9EVOGFzQqhxV9GqN8SY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUi9S6D9q7sT12NzQvKBCkIe34r+acoHhXED1cOAcanmdSTf35QF4V/yETWXEq6IkZeoyYBb2U+jXHaj9AoNra+oslWjyPmsArVZZpkJWMOJtR/eSgZN/voVQ8CvxGKRhaI+RhMi8gJ0+130TU5Diif3R5eKWOPEhSFlmfm3qzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T35I1GxC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744787132; x=1776323132;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=j8eWpTOg/shBeJKd5tKj0TWI9EVOGFzQqhxV9GqN8SY=;
  b=T35I1GxCb9LNra0M4mKUwUfBAjfgFEKOGnUN1xsKMHe1kMjy+ADdrgFl
   x5QWMlXTfk4I/P9NHDGaWo7SejPTeumlPUC/gfNQMBbUgC2WPZMPJGCyw
   ysacRz6P7BPSVQ2KXf2+DkANSyRD32Xtj/TvPhhLjYT5ipadf/5ZS300A
   hVRXGPemSjiVh+2HEoakxLst6AwErjPwsGsXL5wjCB9tNub6+XVFoRIQY
   SOkbnrb6DOg0Kc6U5ACVuEDF+HKOxzcj9kHf5GRt3oF8uIgUHW2eLp/Gs
   kLzepuMrmxMES6D1WfAXOzynPkyjNQdum5f10eTRYpH/JpACVRcEkIQIQ
   g==;
X-CSE-ConnectionGUID: hEhIUKuATBiT/MGClEc6fA==
X-CSE-MsgGUID: cfOgsSoMQGGRO7wEzqOFng==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46202402"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46202402"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:05:31 -0700
X-CSE-ConnectionGUID: 3mhFgh7uRFSSbq9SLGe7uw==
X-CSE-MsgGUID: CXlj7u0eR9G1mDXFDhiOfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="161306083"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:05:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4wpq-0000000Cm7P-0xYw;
	Wed, 16 Apr 2025 10:05:26 +0300
Date: Wed, 16 Apr 2025 10:05:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 6/7] i2c: core: Deprecate of_node in struct
 i2c_board_info
Message-ID: <Z_9WtfVzSDuxmqLK@smile.fi.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-7-andriy.shevchenko@linux.intel.com>
 <Z_69Jml3-CKi13wB@shikoro>
 <Z_9NEK7BDrvAQ0Qo@smile.fi.intel.com>
 <Z_9UHrgho0dGoUrG@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_9UHrgho0dGoUrG@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 08:54:22AM +0200, Wolfram Sang wrote:
> 
> > > > that Linux kernel supports. Deprecate of_node in struct i2c_board_info,
> > > > so users will be warned and in the future remove it completely.
> > > 
> > > Is there a plan or volunteer to do the conversion?
> > 
> > Yes, long-term as I'm alone for many janitor works.
> 
> I could help here if you are not keen on doing it on your own.

Thanks!

At least the main objective is to avoid new code using of_node.
The rest can slowly rotten on itself (esp. if there is any under
arch/ for some old board files).

-- 
With Best Regards,
Andy Shevchenko



