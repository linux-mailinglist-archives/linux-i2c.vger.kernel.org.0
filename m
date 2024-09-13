Return-Path: <linux-i2c+bounces-6697-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BC5977D96
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E74C1C24A72
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462771D9354;
	Fri, 13 Sep 2024 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxEYC1Rr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741001DCB0C;
	Fri, 13 Sep 2024 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223429; cv=none; b=A1YK89OrXQ58F3GH3bOrJAxQHmfxfjRAfZ79zAZNT+87ToPfKbGjGXiF3iwRxphV88K9AT5JTmqdYVMqHp3iZK5XDQvm98VW4rXwCkDlQLKLW3Os9OzaKWrnbZpQBsci5s4TBp7N8c/DnhXD1Pr+rQeBvA9dbsHvF6qlL416bGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223429; c=relaxed/simple;
	bh=oD+Qsgq58ocfiZiQ8YH8GER77w5w9FSuVLKbvSvLgRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqXwOrOiWoN5J5nbH//2Vb0qhg5wk+Sdt37Vs5n4PcM8rcBTwtD5UrSRayFGu5oNxjIQ2XgLvqyLpI1YW68ZWDt/eNbC2eiI189rDcHGbKwdsja1nWZuG4GJQcIv45Bjunqb8uG6CXF8sbOa9a/vMaQl/U4nDrGUTl0MLs8oVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxEYC1Rr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223427; x=1757759427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oD+Qsgq58ocfiZiQ8YH8GER77w5w9FSuVLKbvSvLgRM=;
  b=ZxEYC1Rr8DCBI+NUgX9L6cRmQzGGOfgmpq6/SY9SxvnBQUoKx2TATdqv
   YRRuQZorpPTkC/+/TVZMWwxGfLsUOGe0os6Uh1FT554o54AHhlyZHnmkS
   DLo7hDMdk4hAJO+5ihWt+nWCDmc66yISwViN4nN/pubtyBkUvwN4BRSkE
   xpEwkq8I4WlAAFYsMd0DTIB/OfQC8750WSFU7Ymiv+hItnFXn1WrNLgIb
   yVP5zMt5jiBXa73y6JtCT9nqBeZHU3OvAmzxJKfPf5UO7qnDHyhZfXixW
   nxrXCd5gIPLoBjQO12CgQhsz9dgcPbdCxiUxwQhfYsoJI3j32cCFtzDrJ
   Q==;
X-CSE-ConnectionGUID: vcirwhjmQROsZB5/TSqBXw==
X-CSE-MsgGUID: MW57keYASmC+pbAbNB6OZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25272099"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25272099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:30:27 -0700
X-CSE-ConnectionGUID: gaR+cvi6Sb+Gvch5XSFGcw==
X-CSE-MsgGUID: df8w1pRzTNWUh5IXFaV8Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="67978434"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:30:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3ZE-00000008GHh-02wk;
	Fri, 13 Sep 2024 13:30:20 +0300
Date: Fri, 13 Sep 2024 13:30:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: warp5tw@gmail.com
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] i2c: npcm: Bug fixes read/write operation,
 checkpatch
Message-ID: <ZuQUOw5Y2hZgGyFJ@smile.fi.intel.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913101445.16513-1-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 06:14:40PM +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This patchset includes the following fixes:
> 
> - Enable the target functionality in the interrupt handling routine 
>   when the i2c transfer is about to finish.
> - Correct the read/write operation procedure.
> - Introduce a software flag to handle the bus error (BER) condition
>   which is not caused by the i2c transfer.
> - Modify timeout calculation.
> - Assign the client address earlier logically.
> - Use an i2c frequency table for the frequency parameters assignment.
> - Coding style fix.
> 
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Somehow your 6th patch becomes independent from the email thread.
(Initially I thought it was a separate fix)

Please, check what's going on with email settings on your side.

-- 
With Best Regards,
Andy Shevchenko



