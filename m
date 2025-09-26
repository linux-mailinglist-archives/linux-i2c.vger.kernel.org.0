Return-Path: <linux-i2c+bounces-13204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD6BA3C2C
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 15:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 189124C7BED
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 13:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275012F5479;
	Fri, 26 Sep 2025 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6orXHV+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B0211CA0
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892040; cv=none; b=NBv4I8fk5DzkrL1w4zj3jnlri6id2hyaTDh2X8l0lHW2GbMFmQmT755F258UMuSFevrR8LOSfTpyb59J9VCmhMqDkz3loX7c+USxu/hdHV+IvckoVlGUlZ0HPxsLQ88vOY7w2iVVco4ZpCXCJuA3nyjEJfmyXX3cwB8ksj21Ru4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892040; c=relaxed/simple;
	bh=DDE8YBkCFoqfJ02lQizM//lXJWnXcMtujfHoyv6zGQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIo+xpilL0MUOGlosBRPim/7zH/ViDYKdi97M2wWn1XsG1o0RZ9HBNGTyn0NKGuYwJhm4b6mFcRcXTBK4o3vX25Yt9lINlSD16AsGNKuyJj1DmaNwz4TwQu87Ta6Nc7gP15vmTzj8ks9LzXxXFV34DFywje0qyn42Y2efu+Awac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6orXHV+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758892039; x=1790428039;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DDE8YBkCFoqfJ02lQizM//lXJWnXcMtujfHoyv6zGQU=;
  b=f6orXHV+kbQtwvCagYuN0bJhlmo6ZdvIe5CEnKg7Z0mXKfiSGpwrknlO
   Hb10NtviGu4LYf4PQZxTnrJdOfDDAtLAf6108b2bKBTMUPkVIk0lLCGbf
   eN6v8UHgkRMRjJSnc+8rFjZzuaSelNoTit9rbdvb/4QQFnQis/Ms8VJdI
   CLfe5V2Lj15e3ov1WGbF7sRSl+gUmdVR/GqdBt8m8YTFQw8C3LxlVU91s
   AOk5RAp1eKUASK6NS6mqfYYQJV8QgzaBPJAzeNbAnzbHka5A1/m91neAY
   J9xP64Yl1UuYoIZd6SqzDCqt0V4Z/GOmt6aj3Juq3UvlLsDIIYcpbQRHU
   g==;
X-CSE-ConnectionGUID: xTsF7myXTY2rZlOIEj+JQg==
X-CSE-MsgGUID: ZXRi+Ls0RlqG9nBVhBwptQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="64855536"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="64855536"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 06:07:18 -0700
X-CSE-ConnectionGUID: O5i1fC4nTzGP/lNMwvYyyA==
X-CSE-MsgGUID: 8b1G81FFSjeq4RNolKh3WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="177172200"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orviesa009.jf.intel.com with ESMTP; 26 Sep 2025 06:07:17 -0700
Message-ID: <c5871d96-1b35-422a-bf45-f79fff55968c@linux.intel.com>
Date: Fri, 26 Sep 2025 16:07:15 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add me as maintainer of Synopsys DesignWare
 I2C driver
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250926115057.3752771-1-mika.westerberg@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250926115057.3752771-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/25 2:50 PM, Mika Westerberg wrote:
> I volunteered as maintainer of the DesignWare I2C driver, so update my
> entry from reviewer to maintainer.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e2330f9a5d76..d256222abf99 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24481,8 +24481,8 @@ F:	Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
>   F:	drivers/media/platform/synopsys/hdmirx/*
>   
>   SYNOPSYS DESIGNWARE I2C DRIVER
> +M:	Mika Westerberg <mika.westerberg@linux.intel.com>
>   R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> -R:	Mika Westerberg <mika.westerberg@linux.intel.com>
>   R:	Jan Dabros <jsd@semihalf.com>
>   L:	linux-i2c@vger.kernel.org
>   S:	Supported

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

