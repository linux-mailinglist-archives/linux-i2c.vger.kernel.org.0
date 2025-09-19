Return-Path: <linux-i2c+bounces-13058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6652BB89644
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Sep 2025 14:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01EE07BDBE7
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Sep 2025 12:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA03308F07;
	Fri, 19 Sep 2025 12:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrMH9cIM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354EB2F291B
	for <linux-i2c@vger.kernel.org>; Fri, 19 Sep 2025 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758284032; cv=none; b=aKvnDTBlxHd9q1+DyAwaNF7CnMruS1CmoGqURiJvAs4rB+x9OblL8FnF8FDvIk6lnxlVnddhDQhXpXAS2t7JkMRFRGUgLgEE7IWl3iJlr0fZ7comJrmQC3zAH+hQpbAGmiecCjWPjuNJyywcCS8F2etR92Z6O8fxOrmwvBlM6dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758284032; c=relaxed/simple;
	bh=mPX3rPgCLD2pJ6A7IQXFd6cL6iENN0F0p3N55YZij9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cL/OjqKkf6HOAheUhgJO7sXJcMEFxC1kvbKoD903tKxl2TcFxf04rZzK+yG0tqSWuUA2YpKeH52+xBITeVX111AiIiA6wMWadih7VG9wDJ8kkEWWssE2sQdWOaceT143gX/yOq9+bNg/XPaUp2LW9tBarGJ9d0xGKmG6ilmH4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrMH9cIM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758284030; x=1789820030;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mPX3rPgCLD2pJ6A7IQXFd6cL6iENN0F0p3N55YZij9c=;
  b=lrMH9cIMrS+tTCpB/+GkArE5oqI5wNoqHdADp+vF/Tt7BLVkeaw8uBqT
   s4Wcb+2w8yx1AB9e93Q64a7DxJEiH1+Bl9brtQY3Mf3azZ76gI6ESixPk
   47gJP81evd/QYsKWSAd5eBst6btIpxWJrOI2HsU37qqYFRlFJxiq36017
   GgtHAV6k+JKHI3qEb9QeCKiAUoChtXnvF9Sj29tg+RPhTlEO6IirH2gX6
   xnjP82Z6xDztyd8/xoyuOYZ6OAi9Rk6klmTiCnSJehveQINBKQn+YnOwb
   V9EqS4wloeIG1uYWzEGu/Gk2+l9+ZabXPM0aEIa4ICi9SZf6Z9+wL1mv3
   g==;
X-CSE-ConnectionGUID: QDuzvFaZTLySglKNTJGGMw==
X-CSE-MsgGUID: /f+DwpSeTM+hX2Btu9Z1Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="64268922"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="64268922"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 05:13:50 -0700
X-CSE-ConnectionGUID: UC0k6ujlTyadJGaE57FGsQ==
X-CSE-MsgGUID: LrrjO4fPRqOeFHHOY9+I2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="180932753"
Received: from mylly.fi.intel.com (HELO [10.237.72.52]) ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP; 19 Sep 2025 05:13:47 -0700
Message-ID: <45203c37-3be3-4e5f-b191-30c109899355@linux.intel.com>
Date: Fri, 19 Sep 2025 15:13:46 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] i2c: designware: Misc small fixes
To: Jean Delvare <jdelvare@suse.de>, Linux I2C <linux-i2c@vger.kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
References: <20250918160341.39b66013@endymion>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250918160341.39b66013@endymion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 9/18/25 5:03 PM, Jean Delvare wrote:
> Hi all,
> 
> While working on CVE-2025-38380, I noticed a few issues in the
> i2c-designware driver, which I think are worth fixing now to make
> future driver development safer and easier.
> 
> [PATCH 1/3] i2c: designware: Use msgs[0] to validate the slave address
> [PATCH 2/3] i2c: designware: Extend check for mixed slave addresses
> [PATCH 3/3] i2c: designware: Turn models back to enumerated values
> 
> Note that I do not own any supported device so I can't test these
> changes. Even though the fixes are rather straightforward, I would
> appreciate if someone can test them on actual hardware, to be on the
> safe side.
> 
I'm fine with the whole set.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>


