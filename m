Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 042AB20CB1B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 01:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgF1Xmm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jun 2020 19:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgF1Xmm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Jun 2020 19:42:42 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1222C03E979
        for <linux-i2c@vger.kernel.org>; Sun, 28 Jun 2020 16:42:41 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49w6cF3Dstz1rryf;
        Mon, 29 Jun 2020 01:42:37 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49w6cF2n4Tz1qw6s;
        Mon, 29 Jun 2020 01:42:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 2KakduY6FFfn; Mon, 29 Jun 2020 01:42:36 +0200 (CEST)
X-Auth-Info: S0P/aEwacE3zZmpE/xuVzBR4qBLSRIdHpTdHmDTbZoU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 29 Jun 2020 01:42:36 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
To:     Raviteja Narayanam <rna@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-2-marex@denx.de>
 <MWHPR0201MB3484A9A018788EA755645D2DCA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
Message-ID: <9897de5e-0539-8125-7b3f-41a1c98468ae@denx.de>
Date:   Mon, 29 Jun 2020 01:41:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <MWHPR0201MB3484A9A018788EA755645D2DCA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/26/20 2:13 PM, Raviteja Narayanam wrote:

Hi,

[...]

>> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c index
>> 0777e577720db..6db71c0fb6583 100644
>> --- a/drivers/i2c/busses/i2c-xiic.c
>> +++ b/drivers/i2c/busses/i2c-xiic.c
>> @@ -543,7 +543,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)  {
>>  	u8 rx_watermark;
>>  	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
>> -	unsigned long flags;
>>
>>  	/* Clear and enable Rx full interrupt. */
>>  	xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
>> XIIC_INTR_TX_ERROR_MASK); @@ -559,7 +558,6 @@ static void
>> xiic_start_recv(struct xiic_i2c *i2c)
>>  		rx_watermark = IIC_RX_FIFO_DEPTH;
>>  	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rx_watermark - 1);
>>
>> -	local_irq_save(flags);
> 
> It is added as part of (i2c: xiic: Make the start and the byte count write atomic - ae7304c3ea28a3ba47a7a8312c76c654ef24967e) commit
> to make the below 2 register writes atomic so that the controller doesn't produce a wrong transaction.

Two consecutive register writes are not atomic, they are posted as two
consecutive writes on the bus and will reach the hardware IP as two
separate writes with arbitrary delay between them.

I think the intention of the patch ae7304c3ea28 ("i2c: xiic: Make the
start and the byte count write atomic") is to make sure that there will
be no read/write register access to the XIIC IP while those registers in
local_irq_save()/local_irq_restore() block are written, and that makes
sense.

However, local_irq_save()/local_irq_restore() is local to one CPU core,
it does not prevent another CPU core from posting register read/write
access to the XIIC IP (for example from xiic_process() threaded
interrupt handler, which might just be running on that other CPU core).

The &i2c->lock mutex is locked by both the xiic_start() and
xiic_process(), and therefore guarantees that no other thread can post
read/write register access to the XIIC IP while xiic_start() (and thus
xiic_recv_start(), which is called from it) is running.

And so, I think this local_irq_save()/local_irq_restore() can be removed.

> (If there is a delay between the 2 register
> writes, controller is messing up with the transaction). It is not intended for locking between this function and isr. So, this can't be removed. 

But the bus can insert arbitrary delay between two consecutive register
writes to the XIIC IP, so if the timing between the two register writes
is really critical, then I don't see how to guarantee the timing
requirement. Do you happen to have more details on what really happens
on the hardware level here , maybe some errata document for the XIIC IP?

Thanks

>>  	if (!(msg->flags & I2C_M_NOSTART))
>>  		/* write the address */
>>  		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, @@ -569,7 +567,6

[...]
