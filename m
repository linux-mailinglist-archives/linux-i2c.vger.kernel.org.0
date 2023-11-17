Return-Path: <linux-i2c+bounces-206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA357EF401
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 15:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE2A4281355
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 14:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5033130FB9;
	Fri, 17 Nov 2023 14:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oo8hYWjA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BDD611F;
	Fri, 17 Nov 2023 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700230046; x=1731766046;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=I5QXnegWS5VNgSpWhOlr98MjHSa5xU0gdds5Tc5IRi4=;
  b=Oo8hYWjA0FmoGZEI2Am0a095LK/3HKqczYlTueb9+riPDFohMvrqTeWo
   Z5CjpYQwhy2KL77ru0z+lPRsgINx7RdH+7Y9Bihc3uYr1JpR58TwVbpbN
   aOyJdx7cPh1ZN/HrZAJolqLwsjOnNYaR1vGvcx+XJ0MggnV0OkWG4RzA+
   C0vtMOmFcG443ARfmsSoNRmlK6VHSnflYnqrORyqIeJWir9irM4bXzBEB
   UnDVoZSwxlf5oA+o4Wdlfko1zKxWOoSdIYsqWXf3ZgUGyQMtZHVQCu/g4
   e3X8IsJjwUhMd6kiA8jDnHuAdI5SjBJkdKzEJYYP6dLEgBLnVbvbOEHxt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="391087483"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="391087483"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 06:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="909442841"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="909442841"
Received: from unknown (HELO [10.237.72.75]) ([10.237.72.75])
  by fmsmga001.fm.intel.com with ESMTP; 17 Nov 2023 06:07:07 -0800
Message-ID: <b49b66a6-3b53-44eb-83d7-72d13f76c657@linux.intel.com>
Date: Fri, 17 Nov 2023 16:07:06 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/25] i2c: designware: Replace MODULE_ALIAS() with
 MODULE_DEVICE_TABLE()
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-10-andriy.shevchenko@linux.intel.com>
 <c39d3c5b-6722-4cbd-a2c5-a8b642b47016@amd.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <c39d3c5b-6722-4cbd-a2c5-a8b642b47016@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/23 21:39, Mario Limonciello wrote:
> On 11/10/2023 12:11, Andy Shevchenko wrote:
>> As Krzysztof Kozlowski pointed out the better is to use
>> MODULE_DEVICE_TABLE() as it will be consistent with the content
>> of the real ID table of the platform devices.
>>
>> While at it, drop unneeded and unused module alias in PCI glue
>> driver as PCI already has its own ID table and automatic loading
>> should just work.
>>
>> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

I'm using modular build and modules get autoloaded fine after this patch.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

