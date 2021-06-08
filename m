Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD8539F129
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 10:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhFHIoq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 04:44:46 -0400
Received: from mga14.intel.com ([192.55.52.115]:25207 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230371AbhFHIop (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Jun 2021 04:44:45 -0400
IronPort-SDR: 9uOc8NPw05lJdOGoH2omPZBHyWlGsnVcuagX7gchIy4G/QCS/B85MzzLFsttnU6M4iE/99rmRr
 Bf12OuNGkNIw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204616263"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; 
   d="scan'208";a="204616263"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2021 01:42:53 -0700
IronPort-SDR: V0Ov13dmGK4COhb7BFnuyeEIcn4E/RTcO4o6wnoaTZm2qViByR++L9wZq7hJcci0VxCnImiEjA
 CjTtXNJQbn/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; 
   d="scan'208";a="447821292"
Received: from unknown (HELO [10.237.72.51]) ([10.237.72.51])
  by orsmga008.jf.intel.com with ESMTP; 08 Jun 2021 01:42:47 -0700
Subject: Re: [PATCH v2 1/3] units: Add SI metric prefix definitions
To:     Joe Perches <joe@perches.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>, wsa@kernel.org
References: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
 <ae919bae6c21e23b0a1ed0c9327738e59dd90aa0.camel@perches.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <a6f0677c-70b0-2a51-a01b-f84bcacfc0bd@linux.intel.com>
Date:   Tue, 8 Jun 2021 11:42:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <ae919bae6c21e23b0a1ed0c9327738e59dd90aa0.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/7/21 10:09 PM, Joe Perches wrote:
> On Mon, 2021-06-07 at 18:23 +0300, Andy Shevchenko wrote:
>> +#define HECTO 100L
>> +#define DECA 10L
> 
> Should it be DECA or DEKA or both?
> 
> https://www.nist.gov/pml/weights-and-measures/metric-si-prefixes
> deka Example: dekameter da 	10**1 	Ten
> 
>> +#define DECI	10L
>> +#define CENTI	100L
>> +#define MILLI	1000L
>> +#define MICRO	1000000L
>> +#define NANO	1000000000L
>> +#define PICO	1000000000000LL
>> +#define FEMTO	1000000000000000LL
> 
> IMO: Might as well include all the prefixes up to 10**24
> 
> EXA ZETTA YOTTA, ATTA ZEPTO YOCTO
> 
> And how do people avoid using MILLI for KILO, MEGA for MICRO, etc...
> The compiler won't care but usage could look odd.
> I find this patch creates more confusion than solves a real problem 
(typo where one zero is missing or one extra) and adds potentially 
needless churn. For instance I don't assume much use for the HECTO now 
or in the future.

How about if absolutely necessary just adding only KILO, MEGA and GIGA 
and questionable defines only after when the real needs arises and can 
see does "1/1000L" etc define cause any troubles to real calculations?

Jarkko
