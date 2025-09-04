Return-Path: <linux-i2c+bounces-12624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9444DB43BD8
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 631AC1BC8326
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 12:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBE52F1FC4;
	Thu,  4 Sep 2025 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqM8jGv4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6CE2ED17B;
	Thu,  4 Sep 2025 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756989551; cv=none; b=pRnZSAx0pTXDDoEECKraaoLHsz9+r/nYfTvZX0M3yzO83lv71nD39U7YRiYDXukbOfMO74qrWnhr/frWrWDS6HQoDcO7dcZVI09ZVcG+3j98KPnsaXORHdn6v9DZRcSV7WxUH9vE/fxgUKZ3crRL5jDTeEwGYoT9iXDLjMjah8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756989551; c=relaxed/simple;
	bh=PYaalYxcH+Y9o2jdHw45itdsSulRZEoCVkROLCxQ6JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqjEv9pmS4BmxNla3s6nfHA97INQL9V9PzWiV2SDi1omI9h7RNUUe4rxval/UA+cPlaNSi20gjwsEGEQZq/32i8akojIawvTuMnhjykWqiYU6n0iC+vZyHWRGn+RB7usk9z8vw9Uco7/MzhzcdCws47A06/FtR1QxzCpjEJTJ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqM8jGv4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756989550; x=1788525550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PYaalYxcH+Y9o2jdHw45itdsSulRZEoCVkROLCxQ6JI=;
  b=QqM8jGv4OsAdHYhiS1etY98GJJ5LybCfFu9yQNYSuUiKoQDmTtuQ+eXh
   7sTvzYFQHlujn5wqjGCmVGRkpf5nxn5Y42arJh4dYDYYO2YKgIT478/Kq
   MUvoSeC7If67MQzYYDipTDrzf01EQIhqz1Ab+Mx8xpYWjRFMmPZVSKyeW
   uR6Fv8dTBOwUtghoBr/ZKRebqNlYMVboMHL9wYssRBo+0gugAksIcMupW
   ZZv4FY3EPB5BuvVb9Qnz7ZY9laFc1Y0xh6LtYlZdfRNx3M0ZSPjQKhmZf
   6BiWJb5nZwLkZo2/e8o8YUruMzNme8+MXWBl+RvzLbc0040WpcRMVIiR/
   Q==;
X-CSE-ConnectionGUID: tssEjimATeqE8PxvBlQDyg==
X-CSE-MsgGUID: fDfSJ7IUQQG14tNEMyzacw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76928237"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="76928237"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 05:39:09 -0700
X-CSE-ConnectionGUID: q7Y6c87xQzS+ui/Bn19TKA==
X-CSE-MsgGUID: QQzJ7foXQgyDfAdrLNFQaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="171825503"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.92])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 05:39:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9DC8A11F8F6;
	Thu, 04 Sep 2025 15:39:03 +0300 (EEST)
Date: Thu, 4 Sep 2025 15:39:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 1/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aLmIZ1qHWBjpiNjH@kekkonen.localdomain>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
 <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
 <DCJC7Q9MZEM3.34FU7BXXZ7UGF@kernel.org>
 <aLkqE9c9w9m4Axsp@kekkonen.localdomain>
 <DCJTOIQ4Q0Z5.Q2UE5AQU1X35@kernel.org>
 <aLlDJETaWTjiSP0L@kekkonen.localdomain>
 <DCJVYUINZ7KM.7RCV9P9KHTVM@kernel.org>
 <aLl-ABtFi2R9Wc1a@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLl-ABtFi2R9Wc1a@kekkonen.localdomain>

On Thu, Sep 04, 2025 at 02:54:40PM +0300, Sakari Ailus wrote:
> I noticed there's also no availability check for the OF graph nodes. That's
> likely an accidental omission.

After doing some further research, this seems to be correct. In OF, the
status is defined for device nodes only. A child node could be a device
whereas graph endpoints are not device nodes, so the lack of a check there
is reasonable.

-- 
Sakari Ailus

