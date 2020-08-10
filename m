Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875D82412EE
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Aug 2020 00:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgHJWWu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 18:22:50 -0400
Received: from linux.microsoft.com ([13.77.154.182]:37136 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbgHJWWu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Aug 2020 18:22:50 -0400
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id A0D7120B4908; Mon, 10 Aug 2020 15:22:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A0D7120B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1597098169;
        bh=YX6zs56mpB20F9QGhA/q409LzILhsnF/rVT8T07hRsY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O8T0wGasaG3HSifLjhj90V7WehHpntMviC1004hcoJ6e4/eqHddnq6YgCwAgPDSYr
         LDARm3g8IB+uzhDgcKugFPxAEOtJ1oMcKAY7Cclp0zICxF1vf1aJwEDgDSvgLMLwTp
         Pfa+YRKerd2bUX4ERXSfNaICF/YKo3sPhQ1bQ3lc=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     ray.jui@broadcom.com
Cc:     bcm-kernel-feedback-list@broadcom.com, dphadke@linux.microsoft.com,
        f.fainelli@gmail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, rayagonda.kokatanur@broadcom.com,
        rjui@broadcom.com, wsa@kernel.org
Subject: Re: [PATCH v2] i2c: iproc: fix race between client unreg and isr
Date:   Mon, 10 Aug 2020 15:22:49 -0700
Message-Id: <18cf439a-8fde-02b0-31b6-9ac42f7e972c@broadcom.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <18cf439a-8fde-02b0-31b6-9ac42f7e972c@broadcom.com>
References: <18cf439a-8fde-02b0-31b6-9ac42f7e972c@broadcom.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 8/10/2020 02:17 PM, Ray Jui wrote:
>> On 8/7/2020 8:55 PM, Dhananjay Phadke wrote:
>>> On 8/7/2020, Florian Fainelli wrote:
>>>>> When i2c client unregisters, synchronize irq before setting
>>>>> iproc_i2c->slave to NULL.
>>>>>
>>>>> (1) disable_irq()
>>>>> (2) Mask event enable bits in control reg
>>>>> (3) Erase slave address (avoid further writes to rx fifo)
>>>>> (4) Flush tx and rx FIFOs
>>>>> (5) Clear pending event (interrupt) bits in status reg
>>>>> (6) enable_irq()
>>>>> (7) Set client pointer to NULL
>>>>>
>>>>
>>>>> @@ -1091,6 +1091,17 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
>>>>>  	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
>>>>>  	iproc_i2c_wr_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET, tmp);
>>>>>  
>>>>> +	/* flush TX/RX FIFOs */
>>>>> +	tmp = (BIT(S_FIFO_RX_FLUSH_SHIFT) | BIT(S_FIFO_TX_FLUSH_SHIFT));
>>>>> +	iproc_i2c_wr_reg(iproc_i2c, S_FIFO_CTRL_OFFSET, tmp);
>>>>> +
>>>>> +	/* clear all pending slave interrupts */
>>>>> +	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, ISR_MASK_SLAVE);
>>>>> +
>>>>> +	enable_irq(iproc_i2c->irq);
>>>>> +
>>>>> +	iproc_i2c->slave = NULL;
>>>>
>>>> There is nothing that checks on iproc_i2c->slave being valid within the
>>>> interrupt handler, we assume that the pointer is valid which is fin,
>>>> however non functional it may be, it may feel more natural to move the
>>>> assignment before the enable_irq()?
>>>
>>> As far as the teardown sequence ensures no more interrupts arrive after
>>> enable_irq() and they are enabled only after setting pointer during
>>> client register(); checking for NULL in ISR isn't necessary. 
>> 
>> Agreed.
>> 
>
>Okay I think we all agree that this teardown sequence will guarantee
>that no further "slave" interrupts will be fired after it.
>
>>>
>>> If The teardown sequence doesn't guarantee quiescing of interrupts,
>>> setting NULL before or after enable_irq() is equally vulnerable.
>> 
>> The teardown sequence is sort of a critical section if we may say, so
>> ensuring that everything happens within it and that enable_irq() is the
>> last operation would seem more natural to me at least. Thanks
>> 
>
>I tend to agree with Florian here.
>
>1. Enable/Disable IRQ is done on the interrupt line for both master and
>slave (or even other peripherals that share the same interrupt line,
>although that is not the case here since this interrupt is dedicated to
>I2C in all iProc based SoCs).
>
>2. The tear down sequence here wrapped by disable/enable_irq is slave
>specific
>
>The effect of 1. is temporary, and the purpose of it is to ensure slave
>interrupts are quiesced properly at the end of the sequence.
>
>If we consider both 1. and 2., I agree with Florian that while the end
>result is the same, it is indeed more natural to wrap the entire slave
>tear down sequence within disable/enable irq.

Ok, will send v3 with this change.

Thanks,
Dhananjay

