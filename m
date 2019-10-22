Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C625DE0AEC
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2019 19:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbfJVRo4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Oct 2019 13:44:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:51841 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727226AbfJVRo4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Oct 2019 13:44:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 10:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
   d="scan'208";a="200866188"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143]) ([10.7.153.143])
  by orsmga003.jf.intel.com with ESMTP; 22 Oct 2019 10:44:55 -0700
Subject: Re: [PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: add hardware
 timeout support
To:     Peter Rosin <peda@axentia.se>,
        Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <20191021202414.17484-1-jae.hyun.yoo@linux.intel.com>
 <20191021202414.17484-2-jae.hyun.yoo@linux.intel.com>
 <0a629f7b-b829-c332-27d8-dc825205ff72@axentia.se>
 <7abf933b-cb18-10af-9c1b-163ec65ffae5@linux.intel.com>
 <b98827fa-462a-060b-efc7-27fe5d7742ff@axentia.se>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <7806ece8-1d7c-7aa8-20af-6f5f964bec64@linux.intel.com>
Date:   Tue, 22 Oct 2019 10:44:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b98827fa-462a-060b-efc7-27fe5d7742ff@axentia.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/22/2019 1:45 AM, Peter Rosin wrote:
> On 2019-10-21 23:57, Jae Hyun Yoo wrote:
>> Hi Peter,
>>
>> On 10/21/2019 2:05 PM, Peter Rosin wrote:
>>> On 2019-10-21 22:24, Jae Hyun Yoo wrote:
>>>> Append a binding to support hardware timeout feature.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/i2c/i2c-aspeed.txt | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>> index b47f6ccb196a..133bfedf4cdd 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>> @@ -17,6 +17,8 @@ Optional Properties:
>>>>    - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
>>>>    		  specified
>>>>    - multi-master	: states that there is another master active on this bus.
>>>> +- aspeed,hw-timeout-ms	: Hardware timeout in milliseconds. If it's not
>>>> +			  specified, the H/W timeout feature will be disabled.
>>>>    
>>>>    Example:
>>>>    
>>>>
>>>
>>> Some SMBus clients support a smbus-timeout-disable binding for disabling
>>> timeouts like this, for cases where the I2C adapter in question on occasion
>>> is unable to keep the pace. Adding that property thus avoids undesired
>>> timeouts when the client is SMBus conformant without it. Your new binding
>>> is the reverse situation, where you want to add a timeout where one is
>>> otherwise missing.
>>>
>>> Anyway, since I2C does not have a specified lowest possible frequency, this
>>> feels like something that is more in the SMBus arena. Should the property
>>> perhaps be a generic property named smbus-timeout-ms, or something like
>>> that?
>>
>> Well, I tried upstreaming of the generic timeout property a year ago but
>> I agreed that the generic bus timeout property can be set by an ioctl
>> command so it didn't need to be added into device tree at that time. Not
>> sure if any need has come recently but I haven't heard that. This driver
>> still uses the generic timeout property which is provided by i2c core
>> for handling command timeouts, and it's out of scope from this patch
>> series.
>>
>>> If the above is not wanted or appropriate, then I would personally prefer
>>> aspeed,bus-timeout-ms over aspeed,hw-timeout-ms. To me, hw-timeout-ms sounds
>>> like a (more serious) timeout between the CPU and the I2C peripheral unit
>>> or something like that. But I don't care deeply...
>>
>> Changes I submitted in this patch set is for a different purpose which
>> is very Aspeed H/W specific, and actually it's a more serious timeout
>> setting indeed. If this H/W is used in multi-master environment, it
>> could meet a H/W hang that freezes itself in slave mode and it can't
>> escape from the state. To resolve the specific case, this H/W provides
>> self-recovery feature which monitors abnormal state of SDA, SCL and its
>> H/W state machine using the timeout setting to determine the escape
>> condition.
> 
> Are you saying that the aspeed HW is buggy and that this abnormal state
> is self inflicted by the aspeed HW even if other masters on the bus
> behave sanely? Because I didn't quite read it that way at all...

I don't think it's an Aspeed HW bug. Actually, this HW can be exposed to
very severe environments if it is used as a Baseboard Management
Controller which needs two or more multi-masters on a bus depends on
HW design. Also, it should expect unknown or buggy device attachment
on a bus through add-on card slots. Aspeed HW provides HW timeout
feature to support exceptional cases handling which comes from the
severe use cases.

> To me, it sounded *exactly* like the state I2C clients end up in when an
> I2C master "dies" and stops communicating in the middle of a transaction.
> I.e. the thing that the SMBus timeout is designed to prevent (and the
> state the I2C nine-clk-recovery sequence addresses). The only twist (that
> I saw) was that the aspeed HW is also a master and that the aspeed master
> driver is completely locked out from the bus while some obnoxious master
> fails to complete its transaction (or whatever it was up to).

If this HW runs on a single-master bus, any master dying issue will be
cured by recovery logic which this driver already has and the logic uses
the bus timeout setting you are saying.

This patch set is mainly focusing on a 'slave mode hang' issue on a
'multi-master' bus which can't be covered by the recovery logic.

> If this can only be triggered when the HW is acting as a slave, and by
> aborted or otherwise funky master activity on the bus, then I wouldn't
> call it an HW issue. Then it would be a bus issue. I.e. something needing
> a bus-timeout instead of a hw-timeout.

Here is an example. In a multi-node BMC system, a peer master can be
shutdown in the middle of transaction, then this Aspeed HW keeps waiting
for a next event from the peer master but it can't happen because the
peer master was already shutdown. If we enable the 'slave inactive
timeout feature' using the HW timeout setting, the this HW can escape
from the waiting state. If we don't, this HW hangs forever in the
waiting state and it's the reason why I implemented this patch set.

The hw-timeout setting needs fine tuning depends on HW environment so
it should be different from the bus-timeout.

Thanks,

Jae
