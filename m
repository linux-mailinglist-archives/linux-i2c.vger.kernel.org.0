Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9415DE0D34
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2019 22:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388474AbfJVUZ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Oct 2019 16:25:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6864 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387829AbfJVUZ2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Oct 2019 16:25:28 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x9MKOdwT059135;
        Tue, 22 Oct 2019 16:24:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2vt7u89wae-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Oct 2019 16:24:48 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9MKOloN059924;
        Tue, 22 Oct 2019 16:24:47 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2vt7u89w9y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Oct 2019 16:24:47 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9MKOev9030558;
        Tue, 22 Oct 2019 20:24:47 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
        by ppma02dal.us.ibm.com with ESMTP id 2vqt47j0w0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Oct 2019 20:24:46 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x9MKOkfA50790870
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Oct 2019 20:24:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 03195112062;
        Tue, 22 Oct 2019 20:24:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 43351112063;
        Tue, 22 Oct 2019 20:24:45 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 22 Oct 2019 20:24:45 +0000 (GMT)
Subject: Re: AST2600 i2c irq issue
To:     Ryan Chen <ryan_chen@aspeedtech.com>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>
References: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
 <f9fecc04-2a9a-4cbd-a1ff-ffb680b0fec2@linux.vnet.ibm.com>
 <dbb8635e-a95a-3951-cd65-3428adc461ec@linux.intel.com>
 <8c62b118777c44d1bf8e1a3c32175644@TWMBX02.aspeed.com>
From:   Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <333e959f-9296-b6d5-9442-b979a8abd50d@linux.vnet.ibm.com>
Date:   Tue, 22 Oct 2019 15:24:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8c62b118777c44d1bf8e1a3c32175644@TWMBX02.aspeed.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-10-22_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910220172
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 10/18/19 8:36 PM, Ryan Chen wrote:
> Hello Joel,
> 	Could you enable kernel config CONFIG_I2C_DEBUG_BUS? And send me the log.
>
> 	And also add following in aspeed_i2c_bus_irq function
>
> 	........................
> 	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> 	+ irq_received &= 0xf000ffff;	


Hi Ryan,

I dumped the I2C register state at each IRQ like you mentioned. This was 
the kernel log in this case:

[   39.266308] aspeed-i2c-bus 1e78a280.i2c-bus: master failed to RX
[   39.273303] aspeed-i2c-bus 1e78a280.i2c-bus: irq handled != irq. 
expected 0x00000014, but was 0x00000010

The gXX registers are the global i2c registers (not specific to the bus).

0: irq[00000000] before[inactive] after[start]
     00[00008001]
     04[007ee005]
     08[00000000]
     0c[0000607f]
     10[00000000]
     14[0a060000]
     18[00000080]
     1c[00000000]
     20[000004e1]
     24[fffffff7]
     28[00000000]
     2c[fffffff7]
     30[00000000]
     g00[00000000]
     g04[00000000]
     g08[00000000]
     g0c[00000000]
     g10[00000000]
1: irq[00000001] before[start] after[tx_first]
     00[00008001]
     04[007ee005]
     08[00000000]
     0c[0000607f]
     10[00000000]
     14[0c430000]
     18[00000080]
     1c[00000000]
     20[0000e2e2]
     24[fffffff7]
     28[00000000]
     2c[fffffff7]
     30[00000000]
     g00[00000000]
     g04[00000000]
     g08[00000000]
     g0c[00000000]
     g10[00000000]
2: irq[00000001] before[tx_first] after[tx]
     00[00008001]
     04[007ee005]
     08[00000000]
     0c[0000607f]
     10[00000000]
     14[0c430000]
     18[00000080]
     1c[00000000]
     20[0000e2e2]
     24[fffffff7]
     28[00000000]
     2c[fffffff7]
     30[00000000]
     g00[00000000]
     g04[00000000]
     g08[00000000]
     g0c[00000000]
     g10[00000000]
3: irq[00000001] before[start] after[start]
     00[00008001]
     04[007ee005]
     08[00000000]
     0c[0000607f]
     10[00000000]
     14[0c430000]
     18[00000080]
     1c[00000000]
     20[0000e289]
     24[fffffff7]
     28[00000000]
     2c[fffffff7]
     30[00000000]
     g00[00000000]
     g04[00000000]
     g08[00000000]
     g0c[00000000]
     g10[00000000]
4: irq[00000005] before[start] after[rx_first]
     00[00008001]
     04[007ee005]
     08[00000000]
     0c[0000607f]
     10[00000004]
     14[0c430000]
     18[00000080]
     1c[00000000]
     20[000000e3]
     24[fffffff7]
     28[00000000]
     2c[fffffff7]
     30[00000000]
     g00[00000010]
     g04[00000000]
     g08[00000000]
     g0c[00000000]
     g10[00000000]
5: irq[00000005] before[rx_first] after[rx]
     00[00008001]
     04[007ee005]
     08[00000000]
     0c[0000607f]
     10[00000004]
     14[0c430000]
     18[00000080]
     1c[00000000]
     20[000000e3]
     24[fffffff7]
     28[00000000]
     2c[fffffff7]
     30[00000000]
     g00[00000010]
     g04[00000000]
     g08[00000000]
     g0c[00000000]
     g10[00000000]
6: irq[00000004] before[rx] after[rx]
     00[00008001]
     04[007ee005]
     08[00000000]
     0c[0000607f]
     10[00000004]
     14[0c410000]
     18[00000080]
     1c[00000000]
     20[0000d8e3]
     24[fffffff7]
     28[00000000]
     2c[fffffff7]
     30[00000000]
     g00[00000010]
     g04[00000000]
     g08[00000000]
     g0c[00000000]
     g10[00000000]
7: irq[00000000] before[rx] after[stop]
     00[00008001]
     04[007ee005]
     08[00000000]
     0c[0000607f]
     10[00000004]    <<< this is interesting. this has changed since the 
start of the interrupt handler.
     14[0c430000]
     18[00000080]
     1c[00000000]
     20[00001de3]
     24[fffffff7]
     28[00000000]
     2c[fffffff7]
     30[00000000]
     g00[00000010]
     g04[00000000]
     g08[00000000]
     g0c[00000000]
     g10[00000000]
8: irq[00000014] before[stop] after[inactive]
     00[00008001]
     04[007ee005]
     08[00000000]
     0c[0000607f]
     10[00000004]
     14[0a060000]
     18[00000080]
     1c[00000000]
     20[00001de3]
     24[fffffff7]
     28[00000000]
     2c[fffffff7]
     30[00000000]
     g00[00000010]
     g04[00000000]
     g08[00000000]
     g0c[00000000]
     g10[00000000]


I grabbed the registers when the driver state transitions in the irq 
handler. So, after the irq status has been initially cleared (except for 
rx). In the case of 7, when the irq status changes, I grab it in 
aspeed_i2c_do_stop before writing the STOP. So immediately after the 
"master failed to RX" log. The entire irq handler is spin locked, so all 
of the state transitions and register grabbing is locked.

Any thoughts?

Thanks,

Eddie


> 	------------------------
>
> 	
> 	
>
> -----Original Message-----
> From: Jae Hyun Yoo [mailto:jae.hyun.yoo@linux.intel.com]
> Sent: Friday, October 18, 2019 6:29 AM
> To: Eddie James <eajames@linux.vnet.ibm.com>; Joel Stanley <joel@jms.id.au>; Brendan Higgins <brendanhiggins@google.com>
> Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>; linux-i2c@vger.kernel.org; Andrew Jeffery <andrew@aj.id.au>; Eddie James <eajames@linux.ibm.com>; Ryan Chen <ryan_chen@aspeedtech.com>
> Subject: Re: AST2600 i2c irq issue
>
> On 10/17/2019 1:31 PM, Eddie James wrote:
>> On 10/17/19 1:14 AM, Joel Stanley wrote:
>>> I have been doing bringup of the ast2600. It contains i2c buses that
>>> are register compatible with the ast2500, and I am running them
>>> without buffer or DMA mode. This is with v5.3.6, with no patches
>>> other than adding the compatible string:
>>>
>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>> @@ -938,6 +938,10 @@ static const struct of_device_id
>>> aspeed_i2c_bus_of_table[] = {
>>>                   .compatible = "aspeed,ast2500-i2c-bus",
>>>                   .data = aspeed_i2c_25xx_get_clk_reg_val,
>>>           },
>>> +       {
>>> +               .compatible = "aspeed,ast2600-i2c-bus",
>>> +               .data = aspeed_i2c_25xx_get_clk_reg_val,
>>> +       },
>>>           { },
>>>    };
>>>
>>>
>>> I see this behavior:
>>>
>>> [   20.981417] aspeed-i2c-bus 1e78a280.i2c-bus: master failed to RX [
>>> 20.988259] aspeed-i2c-bus 1e78a280.i2c-bus: irq handled != irq.
>>> expected 0x00000014, but was 0x00000010 [   22.451265] aspeed-i2c-bus
>>> 1e78a200.i2c-bus: master failed to STOP.
>>> irq_status:0x0
>>> [   22.459909] aspeed-i2c-bus 1e78a200.i2c-bus: irq handled != irq.
>>> expected 0x00000010, but was 0x00000000 [   22.470604] aspeed-i2c-bus
>>> 1e78a200.i2c-bus: irq handled != irq.
>>> expected 0x00000011, but was 0x00000000 [   29.156951] aspeed-i2c-bus
>>> 1e78a280.i2c-bus: master failed to STOP.
>>> irq_status:0x0
>>> [   29.165601] aspeed-i2c-bus 1e78a280.i2c-bus: irq handled != irq.
>>> expected 0x00000010, but was 0x00000000
>>>
>>> It happens on boot, and can also be triggered by placing load on the
>>> system. In particular, if I copy a large amount of data to the flash.
>>>
>>> The IRQs are being served on one of the CPUs:
>>>
>>>    29:          0          0     GIC-0 142 Level     1e78a080.i2c-bus
>>>    30:          0          0     GIC-0 143 Level     1e78a100.i2c-bus
>>>    31:          0          0     GIC-0 144 Level     1e78a180.i2c-bus
>>>    32:     302596          0     GIC-0 145 Level     1e78a200.i2c-bus
>>>    33:     197340          0     GIC-0 146 Level     1e78a280.i2c-bus
>>>    34:     196900          0     GIC-0 147 Level     1e78a300.i2c-bus
>>>    35:          0          0     GIC-0 149 Level     1e78a400.i2c-bus
>>>    36:       2199          0     GIC-0 151 Level     1e78a500.i2c-bus
>>>    37:          0          0     GIC-0 152 Level     1e78a580.i2c-bus
>>>    38:       3407          0     GIC-0 153 Level     1e78a600.i2c-bus
>>>    39:          0          0     GIC-0 154 Level     1e78a680.i2c-bus
>>>    40:          0          0     GIC-0 155 Level     1e78a700.i2c-bus
>>>
>>> Following a hunch, I booted the system with SMP disabled (it's a dual
>>> core part). The issue did not reproduce.
>>>
>>> This suggests the driver is lacking locking. I am yet to do any
>>> detailed debugging.
>>
>> Been doing some testing.
>>
>> I'm not sure it's locking, but I think it could have something to do
>> with the fact that the driver only acknowledges (clears the irq status
>> register) the RX done bit way later than the rest of the bits. Is
>> there a reason for this?
>>
>> It seems to me that we get a second interrupt pending (on the second
>> processor? don't see how as we never see any irqs handled there) for
>> RX done sometimes, immediately after we've cleared it. I've ONLY seen
>> it on RX done. Here's some data to show this:
>>
>> This is just some custom tracing to track the driver state and the irqs.
>> There was too much traffic for dev_dbg to handle. before is the driver
>> state before the irq, and after is the driver state after the irq.
>>
>> 0: error entries[10]
>>       0: irq[00000000] before[inactive] after[start]
>>       1: irq[00000001] before[start] after[tx_first]
>>       2: irq[00000001] before[tx_first] after[tx]
>>       3: irq[00000001] before[tx] after[start]
>>       4: irq[00000005] before[start] after[rx_first]
>>       5: irq[00000005] before[rx_first] after[rx]
>>       6: irq[00000004] before[rx] after[rx]
>>       7: irq[00000004] before[rx] after[stop]    << all good, transfer
>> is complete so we send stop.
>>       8: irq[00000000] before[stop] after[inactive]    << this is the
>> one that triggers "failed to STOP" below
> It's really odd. Why does H/W trigger an interrupt without setting any flag? Or is it an irq affinity setting issue?
>
>>       9: irq[00000010] before[inactive] after[inactive]    << now we
>> get the actual stop, but we're in the wrong state and ignore it
>> 1: error entries[9]
>>       0: irq[00000000] before[inactive] after[start]
>>       1: irq[00000001] before[start] after[tx_first]
>>       2: irq[00000001] before[tx_first] after[tx]
>>       3: irq[00000001] before[tx] after[start]
>>       4: irq[00000005] before[start] after[rx_first]
>>       5: irq[00000005] before[rx_first] after[rx]
>>       6: irq[00000004] before[rx] after[rx]     << all good, transfer
>> is continuing
>>       7: irq[00000000] before[rx] after[stop]  << no RX during an RX
>> operation causes driver to abort and stop
> Here again. If it happens, state machine in driver will be broken and it would affect the next event handling.
>
> I didn't see this issue in AST2500 which has a single core and runs in UP kernel. Seems that it can be observed only in AST2600 SMP setting.
>
> Ryan,
> Can you please check it whether it's an expected H/W behavior of AST2600 or not?
>
>>       8: irq[00000014] before[stop] after[inactive] << now we get the
>> RX and the stop.
>>
>> This corresponds to:
>>
>> [   18.405472] aspeed-i2c-bus 1e78a300.i2c-bus: master failed to STOP.
>> irq_status:0x0
>> [   18.414164] aspeed-i2c-bus 1e78a300.i2c-bus: irq handled != irq.
>> expected 0x00000010, but was 0x00000000 [   21.355422] aspeed-i2c-bus
>> 1e78a300.i2c-bus: master failed to RX [   21.363323] aspeed-i2c-bus
>> 1e78a300.i2c-bus: irq handled != irq.
>> expected 0x00000014, but was 0x00000010
>>
>>
>> I don't understand how disabling SMP fixes this, since the second core
>> doesn't seem to ever handle any interrupts. Maybe it's just reporting
>> it wrong? From what I understand of interrupt handling, the second
>> core is allowed to get interrupts while the first is handling an
>> interrupt and has therefore disabled it's own interrupts... correct me
>> if I misunderstand. In this case then, RX done gets triggered on the
>> second core since it's sitting around uncleared in the status register?
>>
>>
>> I was also able to "fix" this by simple returning IRQ_NONE if
>> irq_status == 0 in the interrupt handler. But probably not a good solution.
> A fix like below, right?
>
> @@ -603,6 +603,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void
> *dev_id)
>
>           spin_lock(&bus->lock);
>           irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +       if (!irq_received)
> +               return IRQ_NONE;
> +
>           /* Ack all interrupts except for Rx done */
>           writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>                  bus->base + ASPEED_I2C_INTR_STS_REG);
>
>
> I think it's a right fix for the issue. At least, we need to prevent any driver state corruption. The state machine would run correctly if we filtering the garbage interrupt out.
>
> Cheers,
>
> Jae
>
>> Eddie
>>
>>
>>> Have you seen any behavior like this?
