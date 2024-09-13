Return-Path: <linux-i2c+bounces-6733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B5F9788D5
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 21:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75782B26308
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 19:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056B912DD90;
	Fri, 13 Sep 2024 19:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxzdQ8yP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C1281ACA
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 19:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726255271; cv=none; b=HrEPwSk4OBm6RaAoA6PnJ/mg70fnDg1/Ymz8gUV2ywT+jr7UR6rO8zQE1UZe/cWmHJehmfEG+1ekuJWph4engQG/cBVWbLY0DMHgzW46qtvGtDabkhQTTvXTYlwA9oE+/yI9jhWDPtpVn43VYons7Yw15FFJZgw+3G7JT2D0NIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726255271; c=relaxed/simple;
	bh=h8Nsa/O0L3KY9l3L9Is1pNlwHYSr+rA2Z1hiFmmxPFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAiYh9AKOxPpKZK5nx9muWz25ZhKWKkLsn2xbM+NLjFYYwxETiMLcGF/D7XtqcGOIyuwEsHYt4GCea4wvydp4CWwesdGExDZ3g023VZnAAF4s263+QkILpoLQMNte2YPlIfPOcobC1KB1HcqVoidpjqrutqZ34dsNuCY0X7FRf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxzdQ8yP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726255270; x=1757791270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h8Nsa/O0L3KY9l3L9Is1pNlwHYSr+rA2Z1hiFmmxPFk=;
  b=gxzdQ8yP5HvAGXrFYO4jvoDk9KBNVB/DvzuFrg9FNIPgeXiJY2pgnWOy
   WmV3aJHJg5XeO/WCGIyypawnCn0vEeaWACo+JmVCQT8tw0EhUew3J15uC
   vJ0yw7X8tNoUf/ovLonqW6HwhpoferOKWYCOY08vESDnP42eelmSHkU2H
   7AP4Jm2NAB4qjCnbs1tLOL1A8wJCxtz7c0Thg5r2BTR5HXShVDjtCg5L8
   8cU+FuobluzYVp9yPY8EGH1ewVKlEL2tbDS98SXB0HooFWGUvKjCyWO/Z
   3J9yVwspqljFHQ05fKXGJpc3Es/eZIPAWrOukjscK/AX91IY6SAZEkrDj
   Q==;
X-CSE-ConnectionGUID: qayC1P0KTtCd0RR18NxzlQ==
X-CSE-MsgGUID: h91eFY35TZGmKgIUs8TW0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36303686"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="36303686"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:21:10 -0700
X-CSE-ConnectionGUID: tgtsFzhhQ92V/0K6grRnGg==
X-CSE-MsgGUID: zZLl6rugSIOdxs5x6I1/pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68020748"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:21:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1spBqr-00000008P75-2UWT;
	Fri, 13 Sep 2024 22:21:05 +0300
Date: Fri, 13 Sep 2024 22:21:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 1/8] i2c: piix4: Change the parameter list of
 piix4_transaction function
Message-ID: <ZuSQocKu-cG2Fmi0@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121110.1611340-2-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 05:41:03PM +0530, Shyam Sundar S K wrote:
> Currently, `piix4_transaction()` accepts only one parameter, which is the
> `i2c_adapter` information. This approach works well as long as SB800 SMBus
> port accesses are confined to the piix4 driver. However, with the
> implementation of a separate ASF driver and the varying address spaces
> across drivers, it is necessary to change the function parameter list of
> `piix4_transaction()` to include the port address. This modification
> allows other drivers that use piix4 to pass the specific port details they
> need to operate on.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



