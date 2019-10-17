Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 662A3DB9BA
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2019 00:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438377AbfJQW3G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Oct 2019 18:29:06 -0400
Received: from mga14.intel.com ([192.55.52.115]:28276 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438269AbfJQW3F (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Oct 2019 18:29:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Oct 2019 15:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,309,1566889200"; 
   d="scan'208";a="280040914"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143]) ([10.7.153.143])
  by orsmga001.jf.intel.com with ESMTP; 17 Oct 2019 15:29:04 -0700
Subject: Re: AST2600 i2c irq issue
To:     Eddie James <eajames@linux.vnet.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
 <f9fecc04-2a9a-4cbd-a1ff-ffb680b0fec2@linux.vnet.ibm.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <dbb8635e-a95a-3951-cd65-3428adc461ec@linux.intel.com>
Date:   Thu, 17 Oct 2019 15:29:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f9fecc04-2a9a-4cbd-a1ff-ffb680b0fec2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/17/2019 1:31 PM, Eddie James wrote:
> 
> On 10/17/19 1:14 AM, Joel Stanley wrote:
>> I have been doing bringup of the ast2600. It contains i2c buses that
>> are register compatible with the ast2500, and I am running them
>> without buffer or DMA mode. This is with v5.3.6, with no patches other
>> than adding the compatible string:
>>
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -938,6 +938,10 @@ static const struct of_device_id
>> aspeed_i2c_bus_of_table[] = {
>>                  .compatible = "aspeed,ast2500-i2c-bus",
>>                  .data = aspeed_i2c_25xx_get_clk_reg_val,
>>          },
>> +       {
>> +               .compatible = "aspeed,ast2600-i2c-bus",
>> +               .data = aspeed_i2c_25xx_get_clk_reg_val,
>> +       },
>>          { },
>>   };
>>
>>
>> I see this behavior:
>>
>> [   20.981417] aspeed-i2c-bus 1e78a280.i2c-bus: master failed to RX
>> [   20.988259] aspeed-i2c-bus 1e78a280.i2c-bus: irq handled != irq.
>> expected 0x00000014, but was 0x00000010
>> [   22.451265] aspeed-i2c-bus 1e78a200.i2c-bus: master failed to STOP.
>> irq_status:0x0
>> [   22.459909] aspeed-i2c-bus 1e78a200.i2c-bus: irq handled != irq.
>> expected 0x00000010, but was 0x00000000
>> [   22.470604] aspeed-i2c-bus 1e78a200.i2c-bus: irq handled != irq.
>> expected 0x00000011, but was 0x00000000
>> [   29.156951] aspeed-i2c-bus 1e78a280.i2c-bus: master failed to STOP.
>> irq_status:0x0
>> [   29.165601] aspeed-i2c-bus 1e78a280.i2c-bus: irq handled != irq.
>> expected 0x00000010, but was 0x00000000
>>
>> It happens on boot, and can also be triggered by placing load on the
>> system. In particular, if I copy a large amount of data to the flash.
>>
>> The IRQs are being served on one of the CPUs:
>>
>>   29:          0          0     GIC-0 142 Level     1e78a080.i2c-bus
>>   30:          0          0     GIC-0 143 Level     1e78a100.i2c-bus
>>   31:          0          0     GIC-0 144 Level     1e78a180.i2c-bus
>>   32:     302596          0     GIC-0 145 Level     1e78a200.i2c-bus
>>   33:     197340          0     GIC-0 146 Level     1e78a280.i2c-bus
>>   34:     196900          0     GIC-0 147 Level     1e78a300.i2c-bus
>>   35:          0          0     GIC-0 149 Level     1e78a400.i2c-bus
>>   36:       2199          0     GIC-0 151 Level     1e78a500.i2c-bus
>>   37:          0          0     GIC-0 152 Level     1e78a580.i2c-bus
>>   38:       3407          0     GIC-0 153 Level     1e78a600.i2c-bus
>>   39:          0          0     GIC-0 154 Level     1e78a680.i2c-bus
>>   40:          0          0     GIC-0 155 Level     1e78a700.i2c-bus
>>
>> Following a hunch, I booted the system with SMP disabled (it's a dual
>> core part). The issue did not reproduce.
>>
>> This suggests the driver is lacking locking. I am yet to do any
>> detailed debugging.
> 
> 
> Been doing some testing.
> 
> I'm not sure it's locking, but I think it could have something to do 
> with the fact that the driver only acknowledges (clears the irq status 
> register) the RX done bit way later than the rest of the bits. Is there 
> a reason for this?
> 
> It seems to me that we get a second interrupt pending (on the second 
> processor? don't see how as we never see any irqs handled there) for RX 
> done sometimes, immediately after we've cleared it. I've ONLY seen it on 
> RX done. Here's some data to show this:
> 
> This is just some custom tracing to track the driver state and the irqs. 
> There was too much traffic for dev_dbg to handle. before is the driver 
> state before the irq, and after is the driver state after the irq.
> 
> 0: error entries[10]
>      0: irq[00000000] before[inactive] after[start]
>      1: irq[00000001] before[start] after[tx_first]
>      2: irq[00000001] before[tx_first] after[tx]
>      3: irq[00000001] before[tx] after[start]
>      4: irq[00000005] before[start] after[rx_first]
>      5: irq[00000005] before[rx_first] after[rx]
>      6: irq[00000004] before[rx] after[rx]
>      7: irq[00000004] before[rx] after[stop]    << all good, transfer is 
> complete so we send stop.
>      8: irq[00000000] before[stop] after[inactive]    << this is the one 
> that triggers "failed to STOP" below

It's really odd. Why does H/W trigger an interrupt without setting any
flag? Or is it an irq affinity setting issue?

>      9: irq[00000010] before[inactive] after[inactive]    << now we get 
> the actual stop, but we're in the wrong state and ignore it
> 1: error entries[9]
>      0: irq[00000000] before[inactive] after[start]
>      1: irq[00000001] before[start] after[tx_first]
>      2: irq[00000001] before[tx_first] after[tx]
>      3: irq[00000001] before[tx] after[start]
>      4: irq[00000005] before[start] after[rx_first]
>      5: irq[00000005] before[rx_first] after[rx]
>      6: irq[00000004] before[rx] after[rx]     << all good, transfer is 
> continuing
>      7: irq[00000000] before[rx] after[stop]  << no RX during an RX 
> operation causes driver to abort and stop

Here again. If it happens, state machine in driver will be broken and it
would affect the next event handling.

I didn't see this issue in AST2500 which has a single core and runs in
UP kernel. Seems that it can be observed only in AST2600 SMP setting.

Ryan,
Can you please check it whether it's an expected H/W behavior of AST2600
or not?

>      8: irq[00000014] before[stop] after[inactive] << now we get the RX 
> and the stop.
> 
> This corresponds to:
> 
> [   18.405472] aspeed-i2c-bus 1e78a300.i2c-bus: master failed to STOP. 
> irq_status:0x0
> [   18.414164] aspeed-i2c-bus 1e78a300.i2c-bus: irq handled != irq. 
> expected 0x00000010, but was 0x00000000
> [   21.355422] aspeed-i2c-bus 1e78a300.i2c-bus: master failed to RX
> [   21.363323] aspeed-i2c-bus 1e78a300.i2c-bus: irq handled != irq. 
> expected 0x00000014, but was 0x00000010
> 
> 
> I don't understand how disabling SMP fixes this, since the second core 
> doesn't seem to ever handle any interrupts. Maybe it's just reporting it 
> wrong? From what I understand of interrupt handling, the second core is 
> allowed to get interrupts while the first is handling an interrupt and 
> has therefore disabled it's own interrupts... correct me if I 
> misunderstand. In this case then, RX done gets triggered on the second 
> core since it's sitting around uncleared in the status register?
> 
> 
> I was also able to "fix" this by simple returning IRQ_NONE if irq_status 
> == 0 in the interrupt handler. But probably not a good solution.

A fix like below, right?

@@ -603,6 +603,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void 
*dev_id)

         spin_lock(&bus->lock);
         irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+       if (!irq_received)
+               return IRQ_NONE;
+
         /* Ack all interrupts except for Rx done */
         writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
                bus->base + ASPEED_I2C_INTR_STS_REG);


I think it's a right fix for the issue. At least, we need to prevent
any driver state corruption. The state machine would run correctly if we
filtering the garbage interrupt out.

Cheers,

Jae

> Eddie
> 
> 
>>
>> Have you seen any behavior like this?
