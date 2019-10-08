Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37D0DD0417
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2019 01:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbfJHX2e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Oct 2019 19:28:34 -0400
Received: from mga14.intel.com ([192.55.52.115]:42783 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbfJHX2e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Oct 2019 19:28:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Oct 2019 16:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; 
   d="scan'208";a="187456628"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga008.jf.intel.com with ESMTP; 08 Oct 2019 16:28:30 -0700
Subject: Re: [PATCH 3/5] i2c: aspeed: fix master pending state handling
To:     Tao Ren <taoren@fb.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
 <422eea61-7cb9-e471-83fb-3f554ff5e079@fb.com>
 <6f280195-eef7-1fe7-ac42-ad6879ca9838@linux.intel.com>
 <bba604eb-4cca-257e-01d7-b2d9471e6455@fb.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <63e99afc-17b4-e63d-f00a-d8fd29b8e735@linux.intel.com>
Date:   Tue, 8 Oct 2019 16:28:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bba604eb-4cca-257e-01d7-b2d9471e6455@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/8/2019 4:15 PM, Tao Ren wrote:
> On 10/8/19 3:45 PM, Jae Hyun Yoo wrote:
>> Hi Tao,
>>
>> On 10/8/2019 3:00 PM, Tao Ren wrote:
>>> On 10/7/19 4:13 PM, Jae Hyun Yoo wrote:
>>>> In case of master pending state, it should not trigger the master
>>>> command because this H/W is sharing the same data buffer for slave
>>>> and master operations, so this commit fixes the issue with making
>>>> the master command triggering happen when the state goes to active
>>>> state.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>> ---
>>>>    drivers/i2c/busses/i2c-aspeed.c | 9 +++++----
>>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>>>> index fa66951b05d0..40f6cf98d32e 100644
>>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>>> @@ -336,18 +336,19 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
>>>>        struct i2c_msg *msg = &bus->msgs[bus->msgs_index];
>>>>        u8 slave_addr = i2c_8bit_addr_from_msg(msg);
>>>>    -    bus->master_state = ASPEED_I2C_MASTER_START;
>>>> -
>>>>    #if IS_ENABLED(CONFIG_I2C_SLAVE)
>>>>        /*
>>>>         * If it's requested in the middle of a slave session, set the master
>>>>         * state to 'pending' then H/W will continue handling this master
>>>>         * command when the bus comes back to the idle state.
>>>>         */
>>>> -    if (bus->slave_state != ASPEED_I2C_SLAVE_INACTIVE)
>>>> +    if (bus->slave_state != ASPEED_I2C_SLAVE_INACTIVE) {
>>>>            bus->master_state = ASPEED_I2C_MASTER_PENDING;
>>>> +        return;
>>>> +    }
>>>>    #endif /* CONFIG_I2C_SLAVE */
>>>>    +    bus->master_state = ASPEED_I2C_MASTER_START;
>>>>        bus->buf_index = 0;
>>>>          if (msg->flags & I2C_M_RD) {
>>>> @@ -432,7 +433,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>>>>            if (bus->slave_state != ASPEED_I2C_SLAVE_INACTIVE)
>>>>                goto out_no_complete;
>>>>    -        bus->master_state = ASPEED_I2C_MASTER_START;
>>>> +        aspeed_i2c_do_start(bus);
>>>>        }
>>>
>>> Shall we move the restart-master logic from master_irq to bus_irq? The reason being:
>>> master transaction cannot be restarted when aspeed-i2c is running in slave state and
>>> receives STOP interrupt, because aspeed_i2c_master_irq won't be called in this case.
>>
>> Even in that case, master can be restarted properly because slave_irq
>> will be called first because master is in MASTER_PENDING state, so the
>> slave_irq handles the STOP interrupt as well, and then master_irq will
>> be called with SLAVE_INACTIVE state so the aspeed_i2c_do_start can be
>> called eventually.
> 
> I mean master_irq cannot be called when irq_remaining becomes 0 after slave_irq.

Ah, I see. It would be possibly happened. Probably we need to remove
'if (irq_remaining)' checking in bus_irq to make it call irqs always.
Will fix the issue in the next round.

Thanks,

Jae
