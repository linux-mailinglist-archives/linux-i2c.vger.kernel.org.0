Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3659389AD0
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 03:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhETBVD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 21:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhETBVD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 21:21:03 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08726C061574;
        Wed, 19 May 2021 18:19:42 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id i67so14698537qkc.4;
        Wed, 19 May 2021 18:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1D3O+JRxyNjN7AfoZ/LrzEWFZxa2jRcbF0cobpLTwBI=;
        b=eU7zw9r8Zd+1y+GyrlwfK44OtLvUENYjnu3QHCykZLnrIK1EN7Jd8yURoCh4abpebN
         nXffVmA/P4XqKMZfZrpr7T1+Mmuk8i8PSzF4Cb83TFFmSc5OHyzLSo5Ss9zMgIXCFJIS
         M4OMkrTj3I76GCuMk7ahIAtCJDLiY307C2iQihHpsIUhm7tYX+55tYEtD7P+Ezw9TNLh
         TyounvSXxOTukIGHmFD9aU0uAXRo0LdKXYLUf6o5P1PO/wG2Li/5dFsHXjRf4TcdKziN
         T3KUgTFP8G0AJmwUfsb1SCqALHzb1Da224QzqT7nGd2WB2UTOWV3leq8x6jdmO3evhnd
         zo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1D3O+JRxyNjN7AfoZ/LrzEWFZxa2jRcbF0cobpLTwBI=;
        b=tamorkXvRqdweimgq26dqiUkrEjXPqH8gfjx+INX6g+Y4LdeRm9kblDerbzAPGWz/G
         tNroHwGlVe3O5WU0vopgClHJENnbruqO/L3e9e697QEs1B1B4CGrKQzhtByIJPCYpYBV
         +KE9ZPmK4QsKmCqh2JDwgOe1UZLMDOamnPR7Fj6btJek7EBOWM9TZAgDxDuemirssnRL
         op8/0KMcE+2rNyW33VC7m7WO4oYZiAe+b4HxoDOmuygYFLtX0nOF8aBTN0a9D1hbKuEh
         0fzB6JoJStAIl3peUULeXIIsNigFCIgW1Tb4cLaDidoxSUytf80buZ3EIToC0hiSrrut
         aq5g==
X-Gm-Message-State: AOAM533NXhU+OFVgjFAmZkET9bwQCeuvY9AJRaG4gxnF5RuYLMz85O8I
        aax0xi4QtKsQo58ViB2UjSORgmsgVWw=
X-Google-Smtp-Source: ABdhPJyFOg1bxkiIgR5UtafC5GzENVkl+n00XgA3bXG4idwEtbP07zX0Un68QH28aZ9fnkkoC860yg==
X-Received: by 2002:ae9:e706:: with SMTP id m6mr2534629qka.74.1621473581138;
        Wed, 19 May 2021 18:19:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u126sm1075725qkd.80.2021.05.19.18.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 18:19:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Joel Stanley <joel@jms.id.au>,
        Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-5-quan@os.amperecomputing.com>
 <CACPK8XdyQT=cuSr9KBqC0PBkOLgBUBpyz3kZEA3JuOuZsQN_Rw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 4/7] i2c: aspeed: Acknowledge Tx done w/wo ACK irq late
Message-ID: <414a51e8-0973-0007-9ffc-2949f3c7b0f8@roeck-us.net>
Date:   Wed, 19 May 2021 18:19:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XdyQT=cuSr9KBqC0PBkOLgBUBpyz3kZEA3JuOuZsQN_Rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/19/21 4:43 PM, Joel Stanley wrote:
> On Wed, 19 May 2021 at 07:50, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>> With Tx done w/wo ACK are ack'ed early at beginning of irq handler,
> 
> Is w/wo a typo? If not, please write the full words ("with and without")
> 
>> it is observed that, usually, the Tx done with Ack irq raises in the
>> READ REQUESTED state. This is unexpected and complaint as below appear:
>> "Unexpected Ack on read request"
>>
>> Assumed that Tx done should only be ack'ed once it was truly processed,
>> switch to late ack'ed this two irqs and seen this issue go away through
>> test with AST2500..
> 
> Please read Guneter's commit message
> 2be6b47211e17e6c90ead40d24d2a5cc815f2d5c to confirm that your changes
> do not invalidate the fix that they made.  Add them to CC for review.
>  

This might re-introduce a race condition if the code that is handling
Tx done sends another byte without acknowledging the original interrupt,
and another Tx done (or Tx nack) interrupt is received before the interrupt
handler returns. If that happens, the second Tx done interrupt would be
acknowledged but not be handled, and transmit would stall. That may well be
what I had observed at the time but it is too long ago to remember, sorry.

> Again, this is a fix that is independent of the ssif work. Please send
> it separately with a Fixes line.
> 
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v3:
>>    + First introduce in v3 [Quan]
>>
>>   drivers/i2c/busses/i2c-aspeed.c | 26 ++++++++++++++++++--------
>>   1 file changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 3fb37c3f23d4..b2e9c8f0ddf7 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -606,8 +606,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>
>>          spin_lock(&bus->lock);
>>          irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> -       /* Ack all interrupts except for Rx done */
>> -       writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>> +       /*
>> +        * Ack all interrupts except for Rx done and
>> +        * Tx done with/without ACK
> 
> Nit: this comment can be on one line.
> 
> 
>> +        */
>> +       writel(irq_received &
>> +              ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
>>                 bus->base + ASPEED_I2C_INTR_STS_REG);
>>          readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>          irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
>> @@ -652,12 +656,18 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>                          "irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>>                          irq_received, irq_handled);
>>
>> -       /* Ack Rx done */
>> -       if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
>> -               writel(ASPEED_I2CD_INTR_RX_DONE,
>> -                      bus->base + ASPEED_I2C_INTR_STS_REG);
>> -               readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> -       }
>> +       /* Ack Rx done and Tx done with/without ACK */
>> +       /* Note: Re-use irq_handled variable */
> 
> I'm not sure what this note means.
> 
>> +       irq_handled = 0;
>> +       if (irq_received & ASPEED_I2CD_INTR_RX_DONE)
>> +               irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
>> +       if (irq_received & ASPEED_I2CD_INTR_TX_ACK)
>> +               irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
>> +       if (irq_received & ASPEED_I2CD_INTR_TX_NAK)
>> +               irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>> +       writel(irq_handled, bus->base + ASPEED_I2C_INTR_STS_REG);
> 
> Are you intentionally only acking the bits that are set when we read
> from STS_REG at the start of the handler? If not, we could write this
> instead:
> 
> writel(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK |
> ASPEED_I2CD_INTR_TX_NAK,
>          bus->base + ASPEED_I2C_INTR_STS_REG);
> 

This would clear those bits unconditionally even if they were not handled.

> If you only want to ack the bits that are set, then do this:
> 
>    writel(irq_received &
>              (ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK |
> ASPEED_I2CD_INTR_TX_NAK),
>           bus->base + ASPEED_I2C_INTR_STS_REG);
> 
> That way, you can avoid all of the tests.
> 
Or
	irq_handled = irq_received &
		(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK);
	writel(irq_handled, bus->base + ASPEED_I2C_INTR_STS_REG);

if the idea was to avoid the long statement.

Guenter

>> +       readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> 
> When you move this, please add a comment that reminds us why we do a
> write-then-read (see commit c926c87b8e36dcc0ea5c2a0a0227ed4f32d0516a).
> 
>> +
>>          spin_unlock(&bus->lock);
>>          return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
>>   }
>> --
>> 2.28.0
>>

