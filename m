Return-Path: <linux-i2c+bounces-3391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467A8BB01B
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 17:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 156BE1F2347F
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 15:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030E9154439;
	Fri,  3 May 2024 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlOVGJ9J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4229B139596;
	Fri,  3 May 2024 15:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714750692; cv=none; b=YIGQDtSzempJk2yI8mBJxrf6dtTv/Mjg5xMcQ9t0ogemfPIFUXrIfLG3qdBK8BwsjsRK7x3gAPExxXeVZ8FSs8yW1rpPIoD1CuBXR7JUI4AyjDN1L8uR2p0Scc8BDvISw7D3061VVcaAbhfnfU5US3fKwAdISUIoL68n7xWYmOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714750692; c=relaxed/simple;
	bh=zK9xPyLlrMQrw1W4qtfch5PbaXf+JksUKf5DwfvtSj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOJD+NFNj982AfMqVGrmFIiXEJunFqOz1GGAiH1SP4+ithLPGI8UODuN0Ppz3fhyTvoEFLO+R3kS/9h5Nd+w2v31YPuwxStS5sxEBDdGbiMYGfLZuESUHKwS530SFcU60sF7FWBiMLIxY2x0ANvB+AJzFKFx6iT9IFfUsLY4iYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlOVGJ9J; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714750691; x=1746286691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zK9xPyLlrMQrw1W4qtfch5PbaXf+JksUKf5DwfvtSj0=;
  b=IlOVGJ9JMXDi7QIjzbJzLIIqWyWJDYXmjHapPBEC6rTSypIXy2M9TMFc
   e9adkJCy0ZSWenuWJQ1y4MRDyM9ANTA/zTBk0BAjHcLUli3GU7bEVFdkI
   2//Dblh/IED+ZhW/yTxyNBfjQy3Zy5wsGkJuuWdmnrnghssGpxnm0yKYt
   FC3vOBROIlP41wVV8iBLPwbp8K4PEa8N6wtJOSXtM2VyMj5jbqzJfkpIR
   mmyNffDGzrfN2wNntt/H+MCcR2eH907Ii0MKHj9HQa1lbphy5i7mVpGT8
   s9IBg75zoM38kn1qHQgzQW+67Q3dhmr7iY4kS1/CvY2087O8ighnbo2NY
   g==;
X-CSE-ConnectionGUID: Fp9zslGCRVyrgVB1xBYHxg==
X-CSE-MsgGUID: a3GNSlzoSMKPkfHw1LpzAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13508909"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="13508909"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 08:38:10 -0700
X-CSE-ConnectionGUID: qn3StII3QSCbvKmhgHVCjQ==
X-CSE-MsgGUID: h4nStAF+SMK+NA5ERfM1ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="50673171"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 08:38:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2uz4-00000003gtM-0guB;
	Fri, 03 May 2024 18:38:02 +0300
Date: Fri, 3 May 2024 18:38:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Lee Jones <lee@kernel.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/5] Define i2c_designware in a header file
Message-ID: <ZjUE2fYc7AV93is-@smile.fi.intel.com>
References: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
 <171469134545.1016503.10207141192762647093.b4-ty@kernel.org>
 <ae872161-d725-4604-9d03-a36a426d0d1b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae872161-d725-4604-9d03-a36a426d0d1b@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 03, 2024 at 09:30:39AM +0300, Jarkko Nikula wrote:
> On 5/3/24 2:09 AM, Andi Shyti wrote:
> > Applied to i2c/i2c-host on
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
> > 
> > Thank you,
> > Andi
> > 
> > Patches applied
> > ===============
> > [1/5] i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
> >        commit: 91647e64f0f5677ace84165dc25dc99579147b8f
> > [2/5] i2c: designware: Create shared header hosting driver name
> >        commit: 856cd5f13de7cebca44db5ff4bc2ca73490dd8d7
> > 
> Was the second patch applied accidentally?

+1 here, asked the same in private communication.

-- 
With Best Regards,
Andy Shevchenko



