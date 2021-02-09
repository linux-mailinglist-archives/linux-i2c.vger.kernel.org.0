Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C813315753
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 21:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhBIUAu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 15:00:50 -0500
Received: from mga07.intel.com ([134.134.136.100]:65188 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233643AbhBITrp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Feb 2021 14:47:45 -0500
IronPort-SDR: aqZlTnDLpYP24DoIeTBbkkXA7/RCK0UwTkNZYLKOtUa3QLI09GbbcCw46x+2UlwedMvbcDpS9C
 R6W21kvdGymg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="246010853"
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; 
   d="scan'208";a="246010853"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 11:17:31 -0800
IronPort-SDR: MxO/TaNgsO9MJwQeVuSDeZorgw79f/mE+ATgYIh8UIY00h59Mhp7oCFKPPRQQErfUUviuKCn6m
 NrxcRfEOV2Jg==
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; 
   d="scan'208";a="375068802"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.209.39.4]) ([10.209.39.4])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 11:17:30 -0800
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: aspeed: add buffer and DMA mode
 transfer support
To:     Joel Stanley <joel@jms.id.au>
Cc:     Rob Herring <robh@kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>, linux-i2c@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
 <20210112003749.10565-2-jae.hyun.yoo@linux.intel.com>
 <20210114193416.GA3432711@robh.at.kernel.org>
 <4f67358e-58e5-65a5-3680-1cd8e9851faa@linux.intel.com>
 <CACPK8XcZTE=bnCP1-E9PTA09WnXG9Eduwx0dm-QqmQJUDa_OrQ@mail.gmail.com>
 <1814b8d1-954c-0988-0745-e95129079708@linux.intel.com>
 <87ed4085-26e4-98f8-21e3-b1e3c16b0891@linux.intel.com>
 <CACPK8XekihpoXEeyUbWSXsRkVMbX1gKG-gSeYgWq=s3UR2gi1g@mail.gmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <3cb75f5e-43d8-a06c-5149-e69823728325@linux.intel.com>
Date:   Tue, 9 Feb 2021 11:17:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XekihpoXEeyUbWSXsRkVMbX1gKG-gSeYgWq=s3UR2gi1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/9/2021 4:10 AM, Joel Stanley wrote:
> On Wed, 3 Feb 2021 at 23:03, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Hi Joel
>>
>> On 1/28/2021 11:36 AM, Jae Hyun Yoo wrote:
>>> Hi Joel
>>>
>>> On 1/27/2021 4:06 PM, Joel Stanley wrote:
>>>>>> All this information doesn't need to be in the binding.
>>>>>>
>>>>>> It's also an oddly structured dts file if this is what you are doing...
>>>>>
>>>>> I removed the default buffer mode settings that I added into
>>>>> 'aspeed-g4.dtsi' and 'aspeed-g5.dtsi' in v1 to avoid touching of the
>>>>> default transfer mode setting, but each bus should use its dedicated
>>>>> SRAM buffer range for enabling buffer mode so I added this information
>>>>> at here as overriding examples instead. I thought that binding document
>>>>> is a right place for providing this information but looks like it's not.
>>>>> Any recommended place for it? Is it good enough if I add it just into
>>>>> the commit message?
>>>>
>>>> I agree with Rob, we don't need this described in the device tree
>>>> (binding or dts). We know what the layout is for a given aspeed
>>>> family, so the driver can have this information hard coded.
>>>>
>>>> (Correct me if I've misinterpted here Rob)
>>>>
>>>
>>> Makes sense. Will add these settings into the driver module as hard
>>> coded per each bus.
>>>
>>
>> Realized that the SRAM buffer range setting should be added into device
>> tree because each bus module should get the dedicated IO resource range.
>> So I'm going to add it to dtsi default reg setting for each I2C bus
>> and will remove this description in binding. Also, I'll add a mode
>> setting property instead to keep the current setting as byte mode.
> 
> I don't understand. What do you propose adding?
> 

I'm going to add reg resource for the SRAM buffer per each bus like

reg = <0x40 0x40>, <0x800 0x80>;

into the aspeed-g*.dtsi but adding like this will not be a key for
enabling buffer mode like this v2 does. Also, I'm going to remove the
'aspeed,dma-buf-size' in this patch series and I'll add fixed DMA length
as a configuration per each SoC. Instead, I'm going to add a xfer mode
property e.g. 'aspeed,i2c-xfer-mode' to select 'byte', 'buffer' or 'dma'
modes.

Thanks,
Jae
