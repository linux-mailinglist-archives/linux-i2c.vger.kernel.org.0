Return-Path: <linux-i2c+bounces-3-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE257E7EE8
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99434B21B67
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 17:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD3B3B7B7;
	Fri, 10 Nov 2023 17:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaM+N0Ik"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1AA3B2A9
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 17:46:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AEB831E6D;
	Fri, 10 Nov 2023 04:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699617744; x=1731153744;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=D68uaaStYrSJHvcN7STtPBEb1wH/meEZbd+gmIVtvt0=;
  b=IaM+N0IkcQm5n87ZEdys9oDGluZb3TVT7gohXyJ/m81L2Yy4s8cMNLac
   otgEzjsH8hiD7hhH22Y11igDlp5rp/qXLVp582TTXqXfDf2/K39T+q6ea
   c0JNmZyWdhHbVgaQQOeC97GQdKlZsKX+GBD4L9YKV7OdNreTz+FRWYlr4
   S6BlYQXZ5HkM0/j6vVjjYG6uSlslDM1qBCYMNPtgRWsE6+ZpKBSAuRl21
   bDFnMTaPWJbHNvrSpy9Aum3+Wvp3K8g5E/osMur1EjofIncS4x7uDFjPK
   Vnt6O9JD2iq8lEJsjmPCcHQgTQqqclEDnJwQV3xN1erVcW56nX3+U8PIs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="476400714"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="476400714"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 04:02:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887342622"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="887342622"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by orsmga004.jf.intel.com with ESMTP; 10 Nov 2023 04:02:21 -0800
Message-ID: <de798632-9977-45be-82f2-912081bdfad2@linux.intel.com>
Date: Fri, 10 Nov 2023 14:02:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: designware: Fix corrupted memory seen in the ISR
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Bottorff <janb@os.amperecomputing.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231109031927.1990570-1-janb@os.amperecomputing.com>
 <ZU0eJdwHXEoQ7mj2@smile.fi.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZU0eJdwHXEoQ7mj2@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/23 20:00, Andy Shevchenko wrote:
> On Thu, Nov 09, 2023 at 03:19:27AM +0000, Jan Bottorff wrote:
>> When running on a many core ARM64 server, errors were
>> happening in the ISR that looked like corrupted memory. These
>> corruptions would fix themselves if small delays were inserted
>> in the ISR. Errors reported by the driver included "i2c_designware
>> APMC0D0F:00: i2c_dw_xfer_msg: invalid target address" and
>> "i2c_designware APMC0D0F:00:controller timed out" during
>> in-band IPMI SSIF stress tests.
>>
>> The problem was determined to be memory writes in the driver were not
>> becoming visible to all cores when execution rapidly shifted between
>> cores, like when a register write immediately triggers an ISR.
>> Processors with weak memory ordering, like ARM64, make no
>> guarantees about the order normal memory writes become globally
>> visible, unless barrier instructions are used to control ordering.
>>
>> To solve this, regmap accessor functions configured by this driver
>> were changed to use non-relaxed forms of the low-level register
>> access functions, which include a barrier on platforms that require
>> it. This assures memory writes before a controller register access are
>> visible to all cores. The community concluded defaulting to correct
>> operation outweighed defaulting to the small performance gains from
>> using relaxed access functions. Being a low speed device added weight to
>> this choice of default register access behavior.
> 
> ...
> 
>> v3->v4: add missing changelog
> 
> Side note: Usually it's enough to just reply to the patch with the changelog.
> 
> ...
> 
>> -	*val = swab32(readl_relaxed(dev->base + reg));
>> +	*val = swab32(readl(dev->base + reg));
> 
>> -	writel_relaxed(swab32(val), dev->base + reg);
>> +	writel(swab32(val), dev->base + reg);
> 
> I'm wondering why ioread32be() / iowrite32be() can't be used here...
> 
> Probably it would require to switch entire IO to use ioreadXX() /
> iowriteXX() APIs and since we touch all of them (?) may be it makes
> sense convert to use them at the same time. Dunno.
> 
I would say cosmetic conversions are better to go to another patch.

For this patch:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

