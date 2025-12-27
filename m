Return-Path: <linux-i2c+bounces-14790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F535CDFDAE
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 15:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A6923001E1E
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 14:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61B71C8626;
	Sat, 27 Dec 2025 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JptQwevC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A2D1F19A;
	Sat, 27 Dec 2025 14:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845851; cv=none; b=hIZqCpffFqa324DaEulEQ/Mg5Tq++JsSl2VYyVDn5/qzcT+1/yZES6rGt8EUoyfjbm5C0uxTAqTxMyrBzZ0vxTqr1Q5lOuEo4C3amWI8KFw56dJ1zozhxIkr9ksTF5jfGBWj8eVYTouka24pFwCXkxeLPKRGozCQOleERdKwkkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845851; c=relaxed/simple;
	bh=f+DTWYt4YGWkgK+0+Ht38Zh3Uu3YP9dOn2v4dMNXl54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCUYVW5tMbqUwPgbVMPcC+gHaYo8WPYZRyq75hUXIPHTZBhjVvTabIHBVrf3yQNFGYfpprp3YjIHxnOi3d0ahl6wuR/SQ/l9ylSqYatB4gBwRw0AYOCmBz2pZog3Gh68k6sNkFlt5KrqOgyG3vmSHRI3zvG3VRMhCClxHGbfTX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JptQwevC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766845851; x=1798381851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f+DTWYt4YGWkgK+0+Ht38Zh3Uu3YP9dOn2v4dMNXl54=;
  b=JptQwevCqbO+AOt8t3f9qmmWoTfd8BE/v6B8X7aIn2cDcgLOSIMLBlOo
   4MocROirSb+lfhnzu66tOQzG/aemT+ZjRp4MN0aJuP8qNyUySSjRghXgs
   gWNWDoVPZOVbO26hpksCZZowBvu+hoXr3d/qvE6+r0gXthMsCtqT0HxCa
   1FmCL1h+u3C+SCQlsVvLyiaByBxa4jHVoXxYHLMqOOGS6RKqWVhQ33Hgd
   ZinMV69JZ3N4h6KNSCzgIQw3mGKK8eaiRUvfpy6JYyPbYVVo525TSHd8B
   pg/aNt8Kl7QeBAn9Zvdbh6i1l1sHjCTI68NHaWUqOxW3TAhE27VKk2Mkq
   A==;
X-CSE-ConnectionGUID: J6WpsntrRUaD8zc/bX9Sdg==
X-CSE-MsgGUID: kmV5q38MQgOovB2vgKp0Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="72398064"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="72398064"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 06:30:49 -0800
X-CSE-ConnectionGUID: 0U+wzOfzR7KkTZ1jIXDV2A==
X-CSE-MsgGUID: hE4BhxccRJqXVyu5vCqQMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200297804"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.211])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 06:30:45 -0800
Date: Sat, 27 Dec 2025 16:30:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Hans Hu <hanshu@zhaoxin.com>, Bartosz Golaszewski <brgl@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] i2c: designware-amdisp: use i2c_adapter_dev()
Message-ID: <aU_tki7wsUH51rLe@smile.fi.intel.com>
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
 <20251223-i2c-adapter-dev-wrapper-v1-4-bcf960a48fa9@oss.qualcomm.com>
 <aU_tUUSucAQsi5mq@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aU_tUUSucAQsi5mq@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Dec 27, 2025 at 04:29:43PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 23, 2025 at 11:08:21AM +0100, Bartosz Golaszewski wrote:

...

> > -	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
> > +	ACPI_COMPANION_SET(i2c_adapter_dev(adap), ACPI_COMPANION(&pdev->dev));
> >  	adap->dev.of_node = pdev->dev.of_node;
> 
> Why not just replace these with i2c_dev_set_node()?

Oh, I meant the i2c_adapter_set_node() that you just introduced in the previous
series. Effectively this makes a patch of that series.

-- 
With Best Regards,
Andy Shevchenko



