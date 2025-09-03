Return-Path: <linux-i2c+bounces-12577-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F40B41BDA
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 12:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C3C74E4B46
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 10:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9222E1DA60F;
	Wed,  3 Sep 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7eCDwJN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69142E9EB8;
	Wed,  3 Sep 2025 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895399; cv=none; b=HJNGbVdYFZj3aMIELMZlgWS/zGojxf8B+Um78qat/OHt1iqBFugxU1IgDuwPBxCnzoFNUsvTQi/IITsG7+4D8KKknZQ//Pg6a2172bSPFO6+nqPAJZoJWDjdsKEU1n71T3z+i3Espf6qNYi2I3rkiPiufhoKIRSqlivZrKsLwvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895399; c=relaxed/simple;
	bh=9ChJERbF28V62YULxJTUijcjwER+YGRa4ul/JAPdBug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5DqdVKHkfsFH6NG3Tqe5TvMv0kHCt7NaUC8u6vKLwoYo/O8UToNHzcFDhAD7kDpi448c4cFzPPD/rnTqA+P+nx0P/hgwSb4zS6N+4JXhT8WqqRcri2vONWxTQgATN5mP8m0QHCaFlP1rDFugR5dQMO2StV70BrKh4t5Qhr5sZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7eCDwJN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756895398; x=1788431398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9ChJERbF28V62YULxJTUijcjwER+YGRa4ul/JAPdBug=;
  b=f7eCDwJNINczRSOJbSDtejE8HIl5JyRZNBO9YIW1lDj0RU/AKr0tjeYl
   o69nrjZylgE+zmdn1T27iUNOnxAweL7Z2uKy0N0Prt8rKqWWEgmCOr/A7
   o9usdklT6t7v8FiFSQbetTaUTgr1g6uqXAC+KCs/Z5inQGJiNTEOmXhgR
   3HL2uYdojrEXrwHNnFTIpbCAqtOqQM9qqq5yW3FrF8lt8zVrKBq5RWRMq
   KVtalt8uLWUVTR5yFawK0wM9o9/p2JAuMdeGSW9KzFSsFFIRamyB+LXBn
   i6Oaeq4RcswIW3MapG6HXSmCTgaPjz7C3QmSi5WcqKnIYLSlFAgi5ICd5
   w==;
X-CSE-ConnectionGUID: gP2H2uVdSUGJ0Qz3+zDl/A==
X-CSE-MsgGUID: 9F9eOb4eSBy7pXP5mh2Neg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81789240"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81789240"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:29:57 -0700
X-CSE-ConnectionGUID: 98hTFI56SnCjvurjbaAATQ==
X-CSE-MsgGUID: 8u/XXmfRTBqszrgcQw5jZw==
X-ExtLoop1: 1
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:29:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1utkkS-0000000AxMd-11zh;
	Wed, 03 Sep 2025 13:29:52 +0300
Date: Wed, 3 Sep 2025 13:29:52 +0300
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
Subject: Re: [PATCH v4 1/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aLgYoLa6LHEQIdbC@smile.fi.intel.com>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902190443.3252-2-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 02, 2025 at 03:04:39PM -0400, Jean-François Lessard wrote:
> Add scoped versions of fwnode child node iterators that automatically
> handle reference counting cleanup using the __free() attribute:
> 
> - fwnode_for_each_child_node_scoped()
> - fwnode_for_each_available_child_node_scoped()
> 
> These macros follow the same pattern as existing scoped iterators in the
> kernel, ensuring fwnode references are automatically released when the
> iterator variable goes out of scope. This prevents resource leaks and
> eliminates the need for manual cleanup in error paths.
> 
> The implementation mirrors the non-scoped variants but uses
> __free(fwnode_handle) for automatic resource management, providing a
> safer and more convenient interface for drivers iterating over firmware
> node children.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



