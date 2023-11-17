Return-Path: <linux-i2c+bounces-209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE797EF451
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 15:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 788481F268CC
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 14:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5994B34CEB;
	Fri, 17 Nov 2023 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVaw95sp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7899BD5C;
	Fri, 17 Nov 2023 06:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700230797; x=1731766797;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oB/0lrFLvbXhsCuvYVt03j/KY8IZrsteq/mpUnJIAis=;
  b=PVaw95sp806U6GgaIRv8LzRwNYjDtoxliRFObnVWGCXDypt52KTUV87M
   cFi6o3/S1vQ+xx+2Qo/f70ddL2BBcHYyHztRHrHFHGgTaDh8nxBIGSeyM
   MtukkL4uDgU1Z8R6+cm2hVfAJlLpys4LXRZD3Kp1V568rR+O9V6dqKQmL
   jiwIhBtiCucTRzK6bB++AIDojVvxTOP+C23BPjZas5vLaRCQYK7OnIZfx
   ScNZC+uwFk2T8+8bxukJH6AkjkYO3Sbxr3uGKzdl6+9xOgnmXh2rtkQgX
   ujUMBFpxOV1oBsFYXJxVFmaZjF3lSuflw9119aHTvwenSBQlWnm+UBicU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="394154947"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="394154947"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 06:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="939160431"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="939160431"
Received: from unknown (HELO [10.237.72.75]) ([10.237.72.75])
  by orsmga005.jf.intel.com with ESMTP; 17 Nov 2023 06:19:53 -0800
Message-ID: <95bd788a-cb10-4f1d-b238-4422bba4d8cf@linux.intel.com>
Date: Fri, 17 Nov 2023 16:19:52 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/25] i2c: designware: Drop return value from
 dw_i2c_of_configure()
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-14-andriy.shevchenko@linux.intel.com>
 <839ed9c8-f58e-495e-97a1-0734b8fa6fb8@amd.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <839ed9c8-f58e-495e-97a1-0734b8fa6fb8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/23 21:41, Mario Limonciello wrote:
> On 11/10/2023 12:11, Andy Shevchenko wrote:
>> dw_i2c_of_configure() is called without checking of the returned
>> value, hence just drop it by converting to void.
>>
>> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/i2c/busses/i2c-designware-platdrv.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

