Return-Path: <linux-i2c+bounces-3219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 284148B3A0E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 16:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28A26B2489B
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 14:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC941E869;
	Fri, 26 Apr 2024 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqgdVq9Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569361DFFC;
	Fri, 26 Apr 2024 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714141834; cv=none; b=bgyPF1m3viucTgJ+mivEBajvnhEYVyCe5IT2lbn0ojZL327poygRiDsxN8zd3v44SV5u5vaAtmwvZvh+eT4P7XtP6geW8jSV4uiRrMfJoVxtqEVCRkRNFAekYPc5fTHQ4mA4NOUX9kJsrrmdalb52fnz/YhcjI2O8vsMn6FZ2vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714141834; c=relaxed/simple;
	bh=7jaY6iKYpTLxfAVZPPuHMnYRCkS4mEJxcsaz7O6SumU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsvdYZRK+jRyq4XC4ewBv7jnxNxVvjSvWEasO2B4A3TuJabOmqTZxCvs4lau5+z0DCx2v90Gh73hpwvf/WZ1JRShepu+FgUFFP4o95OGRogTNSzlP2mRs7gE8LvSQsKE8DP68QMgXvXG+2mqIl68+O6nD0dFgtFUeScUfInqIPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqgdVq9Y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714141833; x=1745677833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7jaY6iKYpTLxfAVZPPuHMnYRCkS4mEJxcsaz7O6SumU=;
  b=VqgdVq9YLi7SQyrorzGhy7HHfxv1C/QMuMUF4EY2fYnvI/ddDU1tbHoH
   pOTNf1Z03SDbRI8rVpKATbPhAbhXtot2fZus2uyvDebPJvJ/92/Z22Xlq
   wpPCrTrtHoCe7bL2QFCuCxeIlZrRasn+3azpcPBjeySPj0ElxqlWhRVC8
   SslFkLzVe4EFvywtwIS6dUqADbPIlU3V42UWR9hxCOdH+W/qraNxaDnq8
   TEL4r/hmYLzOXPeT/nEld6yz1kbQXc6SD2syTMzhjpON92LIUm4d/EwsL
   o70Ow0nV/hzIgyF9rs0bm+wsTEMv+BlCKI5RcJNaQ5B1YSVs6wFDp4wzG
   Q==;
X-CSE-ConnectionGUID: 7xCOhSf4S0KvSUSsV4N5Dw==
X-CSE-MsgGUID: CbYAnsGJQkyX7LoRmsZIGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10410813"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="10410813"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:30:32 -0700
X-CSE-ConnectionGUID: fC5i3e8/QKihJMqDtRb86Q==
X-CSE-MsgGUID: Md3LwZRaRf6CT10gcwaJhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25459838"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:30:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s0Man-00000001LTV-0yOy;
	Fri, 26 Apr 2024 17:30:25 +0300
Date: Fri, 26 Apr 2024 17:30:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] mfd: intel_quark_i2c_gpio: Utilize
 i2c-designware.h
Message-ID: <Ziu6gDOqhEYQNhcH@smile.fi.intel.com>
References: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
 <20240425214438.2100534-5-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425214438.2100534-5-florian.fainelli@broadcom.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 25, 2024 at 02:44:37PM -0700, Florian Fainelli wrote:
> Rather than open code the i2c_designware string, utilize the newly
> defined constant in i2c-designware.h.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

P.S>
Note, my tags for MFD patches does not imply that I agree on the general idea
of this series, it's just in case if it will be approved by the respective
maintainers (I²C / MFD / etc).

-- 
With Best Regards,
Andy Shevchenko



