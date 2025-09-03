Return-Path: <linux-i2c+bounces-12583-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A179B4213C
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 15:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E51F7B8721
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 13:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C56830274B;
	Wed,  3 Sep 2025 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTLGWmbb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435192F28E2;
	Wed,  3 Sep 2025 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756905572; cv=none; b=R2GuPHse8R0ILKaSNG6PjzItx41HwA23ZZ8B0NRDx0sLTD62zLVeil4TK4NVe7wgRfHESlJ3HNA77Yte0Kkf25w4JeX9q4V++C7RM9bdKK52PNLs3xRxygYqgMeJ+mXWVQMyHtrHHSVSQAt8CgG+52kTfyf6bBHekV8GsMBiV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756905572; c=relaxed/simple;
	bh=hp6/NLkgKs2XU7QkPF+2ruICId0w3OtofTaIfJkDpsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+onFmqm/Q7/ffXfmzmv6KlqJC/8C9EpOTg0kr8yD0q8i3XhQRNk7RnY/kEJvcfAR/MFcs9vUhb3OjQFUi4/3NhYsoWU6Am0CaTJiKBvVOIV2VA0EXaidW2/XP+c1Jo5qQ+iK4yqdPWQ8H++g6yo539Xn6blDy4ay8wyusQtXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTLGWmbb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756905571; x=1788441571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hp6/NLkgKs2XU7QkPF+2ruICId0w3OtofTaIfJkDpsE=;
  b=WTLGWmbbbwXg8vp7fs3jA804tpiXYToloXlRQTbTStsQMVDEPiT/6fRv
   dcAVtIZXuKE3nmTCHxzIEdthr7mt00qqBiBecbGnCv2pbYO/b5ggepNVm
   t4zcgKOgzHK0dYEroHsZqqkkiTyWUNnYUsvgXT5qw5IoyqZkojWmqteGD
   QFPwHpSAu6b8+/SQWjgCix6Q25IOl7JgalPpBF+zeq+W95LH/sSm5Ktfa
   KZm7Gy6xQHkcXqwniMrCzEu1N9YJH3h5TGimbXiuEZI6q3TNdEBFpqq5u
   wyhm0WZ8S3o611UbXOWuV3Ky2opV9Bk/rYnrGgYRkLgpacYEfwcIJ0B+o
   Q==;
X-CSE-ConnectionGUID: 3YIktcUgQoCDlABrUJHemg==
X-CSE-MsgGUID: Rn5O+gjGSrWd/ZNZv6m66w==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76820032"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="76820032"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:19:30 -0700
X-CSE-ConnectionGUID: 7bZnIMmsRuavOb6da1L1IQ==
X-CSE-MsgGUID: 3/2iDBhqT2+9TaQluPXqhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="171467895"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:19:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BF5B511F99F;
	Wed, 03 Sep 2025 16:19:24 +0300 (EEST)
Date: Wed, 3 Sep 2025 16:19:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i2c: core: Use fwnode_for_each_child_node_scoped()
Message-ID: <aLhAXBhz3AcePUEK@kekkonen.localdomain>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-3-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902190443.3252-3-jefflessard3@gmail.com>

On Tue, Sep 02, 2025 at 03:04:40PM -0400, Jean-François Lessard wrote:
> Replace the manual __free(fwnode_handle) iterator declaration with the
> new scoped iterator macro for cleaner, less error-prone code.
> 
> This eliminates the need for explicit iterator variable declaration with
> the cleanup attribute, making the code more consistent with other scoped
> iterator usage patterns in the kernel.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

