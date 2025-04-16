Return-Path: <linux-i2c+bounces-10380-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB4A8B034
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69B9B3BDE29
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 06:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652012206B3;
	Wed, 16 Apr 2025 06:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQ6Qon1u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA29A1BC2A;
	Wed, 16 Apr 2025 06:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784664; cv=none; b=LvaXzIx2Un9GgL/0ZP5SQh44gRnC+FtH40F4vVAHhkYpdKk+nCVJVkl/scDmjrlnzR8gFemOBy2wFosqLDOS7pS/f4hoq6fF0okI5LzQ+oI5MsUjh3LI9n1wGbA7p2opPmz5Q0SQqg867Isi0lhgIyYNc5+WJ4P2UUc8gT9UkfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784664; c=relaxed/simple;
	bh=zgcF97el/86IhXfhDsuBv5IqWCvHgZFIjYblf6Frhik=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYF2qdjyzlMEN3vxVlqaIdEZEqLBYEIr4X3HqnOF+mVgW56ErtUZkDIEXiPC25NKeGEOAercYO7hkBsJvMlZq01F0+PoGecOYqcnodBCYrwYj2vw1lI94L/OfGxVvZDcQ58wkFu696G36ZoBN9k2GEmISBwFDD8jbSG6dnOoJFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQ6Qon1u; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744784663; x=1776320663;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=zgcF97el/86IhXfhDsuBv5IqWCvHgZFIjYblf6Frhik=;
  b=WQ6Qon1uWmp8r/CwJ6eU4z1gFto5sxBIsqx1J8HkJ3h7b/LfItum0iuV
   moBZXVTsV0kkUmsulRRQuX3dxTDmtDG9MqolwNldo89HfCFxuFk/VyViW
   7VM4CuIeML1HXT8S4WLYSUiexwyz44e7OX1xCFWT6gpZMiuUDuwB3cMxR
   lKQs66pVuDjMO84dCiuS6BTa0ctUugUn5lFISbryA/XPJ2PgjLAmUo9gV
   mdnaawWr1aIEVx0BMnyTfEiToEeM5oXv69p2lYAyL0UmT2skL9DC2Met1
   sj3UGh7nFN0gEwLkaNDPOSs4YgQGZESjiwraXvXXXAuoFJRmGP6bVwYsE
   A==;
X-CSE-ConnectionGUID: gDtAlj5fSP2z3g53o/D0hg==
X-CSE-MsgGUID: buOrktVzQhumIxx97pqFRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50116623"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="50116623"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:24:21 -0700
X-CSE-ConnectionGUID: elIN+ZQ/SgmSJIPnN0MxLg==
X-CSE-MsgGUID: OQMHD+qmSC2isHP0LEZ7Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130310965"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:24:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4wC0-0000000ClPA-2q1L;
	Wed, 16 Apr 2025 09:24:16 +0300
Date: Wed, 16 Apr 2025 09:24:16 +0300
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
Message-ID: <Z_9NEK7BDrvAQ0Qo@smile.fi.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-7-andriy.shevchenko@linux.intel.com>
 <Z_69Jml3-CKi13wB@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_69Jml3-CKi13wB@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 15, 2025 at 10:10:14PM +0200, Wolfram Sang wrote:
> 
> > that Linux kernel supports. Deprecate of_node in struct i2c_board_info,
> > so users will be warned and in the future remove it completely.
> 
> Is there a plan or volunteer to do the conversion?

Yes, long-term as I'm alone for many janitor works.

-- 
With Best Regards,
Andy Shevchenko



