Return-Path: <linux-i2c+bounces-12535-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 412C5B3DDD6
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 11:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF68E1897456
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 09:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E859630ACEA;
	Mon,  1 Sep 2025 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgCbK9sw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2F43019C4;
	Mon,  1 Sep 2025 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718328; cv=none; b=NwMjMTtv4A3c8gGh5muifZw3e7g9UztBCMZD1b4Tz7wschGnSllILcnHwX8iC8TxI/J3sC9ojG29zAtIoqN1Lp9g5w6ze1vqgMqQ8y94OLNU01+bBU75BpUBG7Xk/S0ta3e7XdCh1WA2T5O2t3tue691LrAc033ZoBKo7RVEKW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718328; c=relaxed/simple;
	bh=U9UuqDFkrLgjRhqIJII3tNcirx8QhpftQh9aAI96g30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCwfcqrW+muRRL1mvDFkEaNGBgCUUqQQwz4F7u8xJ9teVeUSEnRQL6GZrnej5akuKNy02adFFyhpVnF7rI9PUmTrIhABgv/YwWaU10Y1uHB4/+FyqJwN+AkXfYkuS9eEMcKEAGDBKuJx8/hIPihPAormMhwJznGZK2k1QNH/f14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgCbK9sw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756718327; x=1788254327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=U9UuqDFkrLgjRhqIJII3tNcirx8QhpftQh9aAI96g30=;
  b=hgCbK9swpcKBC4DBnBehJpQkZ37w8nqKf5ox9s/DLq7IZpF3ooJzS6dI
   +RKPLSEqORBps75Xe6Yhn285j5TJoSnZPys1MCwJ1jJIl/kTTkve1+Jc7
   bGm+gZzUvyYFHXu0VUsupCNalv61foNtQtwnQEkOYL+zv5f6dG5JX87N6
   5e+nKER9KLSKTWgx0Nv4ML9vBHLSXi+jh+vNa5nTm6kmZvNPdGWl67UTz
   CNbroxGKuyHQjdwUQIUhgW0iBn1cU6uYdtPNU8K288t+NAAa9YNyolvgo
   4d75yS+B+jzzBnr5mmbqL2cxyvChgrypWPymDDxq3T3goEjEsfk9g9q4q
   Q==;
X-CSE-ConnectionGUID: 4ppHx5GwR/WBO5AlD3X/Kw==
X-CSE-MsgGUID: Trr0jQoQSMWRBFTvnDCxQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="59041287"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="59041287"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:18:47 -0700
X-CSE-ConnectionGUID: VxMvKw0vSNe9+2U91/MoJg==
X-CSE-MsgGUID: NoA1b17tQdSKXGVqEhzG2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194623013"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:18:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ut0gT-0000000AN3y-2t4t;
	Mon, 01 Sep 2025 12:18:41 +0300
Date: Mon, 1 Sep 2025 12:18:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aLVk8RutTYuRbEfL@smile.fi.intel.com>
References: <20250829130010.12959-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250829130010.12959-1-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 29, 2025 at 09:00:08AM -0400, Jean-François Lessard wrote:
> Add scoped versions of fwnode child node iterators that automatically
> handle reference counting cleanup using the __free() attribute:
> 
> - fwnode_for_each_child_node_scoped()
> - fwnode_for_each_named_child_node_scoped()
> - fwnode_for_each_available_child_node_scoped()
> 
> These macros follow the same pattern as existing scoped iterators in the
> kernel, ensuring fwnode references are automatically released when the
> iterator variable goes out of scope. This prevents resource leaks and
> eliminates the need for manual cleanup in error paths.
> 
> The implementation mirrors the non-scoped variants but uses
> __free(fwnode_handle) for automatic resource management, providing a safer
> and more convenient interface for drivers iterating over firmware node
> children.

The problem is that these two are not coupled, means there is no need to send
a single patch, so, please split to a series of two.

-- 
With Best Regards,
Andy Shevchenko



