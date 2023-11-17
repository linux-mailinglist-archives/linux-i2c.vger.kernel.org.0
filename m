Return-Path: <linux-i2c+bounces-210-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE77EF4B5
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 15:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C32291C20902
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 14:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2E12F50D;
	Fri, 17 Nov 2023 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqWmTG9p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA23A0;
	Fri, 17 Nov 2023 06:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700232380; x=1731768380;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UplMRcx2+EMvaSGsjiy0W4/FVTFMn6dq/vf46rVY1ck=;
  b=bqWmTG9pjAGReVPGLYsT84nlCNXAkWxofGtlXFKhil6uncP6AI0cdKsW
   9SJIjshh53uQdqiy2VURxtSiBoWw6/QCa+k7kLSkcyskCyl7gd/f5ktt8
   NIMz4n40MiSkx+97NSi/CeXrQSO/lROGS2VdsOUW9quvgAd4m027Pk8rM
   qRV8x5C69/Za82ET7WMi6biK0o5KEVDQJ+9wJnc73tsMAWPRP7Us4yyjB
   fsWyIvvlpz+ldE0NBnaLEw7Xzuy0QFO/UtG4GBHY+Y751tw68wfECwO8d
   FAvGU0REx0RyjGUr1/iv9A/u91RUwtxSlcuRBqpx0CZHha5kLNl2HtONn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="477523674"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="477523674"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 06:46:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="715552637"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="715552637"
Received: from unknown (HELO [10.237.72.75]) ([10.237.72.75])
  by orsmga003.jf.intel.com with ESMTP; 17 Nov 2023 06:46:16 -0800
Message-ID: <6c04956b-26ee-484c-81d0-bc301315b4d2@linux.intel.com>
Date: Fri, 17 Nov 2023 16:46:15 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/25] i2c: designware: Drop return value from
 i2c_dw_acpi_configure()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-13-andriy.shevchenko@linux.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231110182304.3894319-13-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/23 20:11, Andy Shevchenko wrote:
> i2c_dw_acpi_configure() is called without checking of the returned
> value, hence just drop it by converting to void.
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-common.c | 4 +---
>   drivers/i2c/busses/i2c-designware-core.h   | 4 ++--
>   2 files changed, 3 insertions(+), 5 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

