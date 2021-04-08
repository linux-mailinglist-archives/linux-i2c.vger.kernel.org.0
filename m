Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67A4358BB3
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 19:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232144AbhDHRuy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 13:50:54 -0400
Received: from mga11.intel.com ([192.55.52.93]:40693 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232086AbhDHRux (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 13:50:53 -0400
IronPort-SDR: 9192zSNf1+v5XkiV3m4u4iznRpo+nYKI0EV9jPEpLL6u+xdVu9MSvjrkPzGfjN4zQUjBqkbk0C
 r6vWdfaO1T8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="190398903"
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; 
   d="scan'208";a="190398903"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 10:50:42 -0700
IronPort-SDR: p3wh+dLx0XeI3dTL4S60AIwO/HXvhpohRVDWptGhIxxc+i8Sq6es+WRDGpb/HfdaG4cxlzj3zl
 OHfGZJhhjuhg==
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; 
   d="scan'208";a="530687284"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.251.26.54]) ([10.251.26.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 10:50:41 -0700
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: aspeed: add transfer mode
 support
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andrew Jeffery <andrew@aj.id.au>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux I2C <linux-i2c@vger.kernel.org>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com>
 <20210306203011.GA1152769@robh.at.kernel.org>
 <f6732348-d6c8-f49b-6123-afe542bb1f8c@linux.intel.com>
 <CAL_Jsq+H2wCyTKhGcQvgiuyMtGW0hytQgw=948q0JGLSLOo9KA@mail.gmail.com>
 <f1811747-3826-215a-d822-85170303a7c9@linux.intel.com>
Message-ID: <fadf1244-ed6e-5973-ff1b-018bd20ff3b1@linux.intel.com>
Date:   Thu, 8 Apr 2021 10:50:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <f1811747-3826-215a-d822-85170303a7c9@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ping.

On 3/10/2021 7:55 AM, Jae Hyun Yoo wrote:
> On 3/9/2021 6:15 PM, Rob Herring wrote:
>> On Tue, Mar 9, 2021 at 10:02 AM Jae Hyun Yoo
>> <jae.hyun.yoo@linux.intel.com> wrote:
>>>
>>> Hi Rob,
>>>
>>> On 3/6/2021 12:30 PM, Rob Herring wrote:
>>>> On Wed, Feb 24, 2021 at 11:17:17AM -0800, Jae Hyun Yoo wrote:
>>>>> Append bindings to support transfer mode.
>>>>>
>>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>>> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
>>>>> ---
>>>>> Changes since v3:
>>>>> - None
>>>>>
>>>>> Changes since v2:
>>>>> - Moved SRAM resources back to default dtsi and added mode selection
>>>>>     property.
>>>>>
>>>>> Changes since v1:
>>>>> - Removed buffer reg settings from default device tree and added 
>>>>> the settings
>>>>>     into here to show the predefined buffer range per each bus.
>>>>>
>>>>>    .../devicetree/bindings/i2c/i2c-aspeed.txt    | 37 
>>>>> +++++++++++++++----
>>>>>    1 file changed, 30 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt 
>>>>> b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>>> index b47f6ccb196a..242343177324 100644
>>>>> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>>> @@ -17,6 +17,20 @@ Optional Properties:
>>>>>    - bus-frequency    : frequency of the bus clock in Hz defaults 
>>>>> to 100 kHz when not
>>>>>                 specified
>>>>>    - multi-master     : states that there is another master active 
>>>>> on this bus.
>>>>> +- aspeed,i2c-xfer-mode      : should be "byte", "buf" or "dma" to 
>>>>> select transfer
>>>>> +                      mode defaults to "byte" mode when not 
>>>>> specified.
>>>>> +
>>>>> +                      I2C DMA mode on AST2500 has these restrictions:
>>>>> +                        - If one of these controllers is enabled
>>>>> +                            * UHCI host controller
>>>>> +                            * MCTP controller
>>>>> +                          I2C has to use buffer mode or byte mode 
>>>>> instead
>>>>> +                          since these controllers run only in DMA 
>>>>> mode and
>>>>> +                          I2C is sharing the same DMA H/W with them.
>>>>> +                        - If one of these controllers uses DMA 
>>>>> mode, I2C
>>>>> +                          can't use DMA mode
>>>>> +                            * SD/eMMC
>>>>> +                            * Port80 snoop
>>>>
>>>> How does one decide between byte or buf mode?
>>>
>>> If a given system makes just one byte r/w transactions most of the time
>>> then byte mode will be a right setting. Otherwise, buf mode is more
>>> efficient because it doesn't generate a bunch of interrupts on every
>>> byte handling.
>>
>> Then why doesn't the driver do byte transactions when it gets small
>> 1-4? byte transactions and buffer transactions when it gets larger
>> sized transactions.
> 
> Good question and it could be an option of this implementation.
> Actually, each mode needs different register handling so we need to add
> additional conditional branches to make it dynamic mode change depends
> on the data size which can be a downside. Also, checked that small
> amount of data transfer efficiency in 'buf' transfer mode is almost same
> to 'byte' mode so there would be no big benefit from the dynamic mode
> change. Of course, we can remove the 'byte' transfer mode but we should
> also provide flexibility of configuration on what this hardware can
> support, IMO.
> 
> Thanks,
> Jae
