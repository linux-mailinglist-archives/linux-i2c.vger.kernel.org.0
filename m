Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F215399E37
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 11:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhFCJ7I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 05:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCJ7H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Jun 2021 05:59:07 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4279EC06174A;
        Thu,  3 Jun 2021 02:57:23 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A1BEC81FB2;
        Thu,  3 Jun 2021 11:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1622714241;
        bh=SSZQam37MvjdV92UuVrQYX1iZ4LDAER928vqdf2wtvg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mAm39BGWDCGZSGf7fMTpbX/lRe+3AidPstqZkPHZEY/AL926F0LBAOsifvFSxuhVo
         EPfHsHPEF16sShwBP/b8U1Uspr7LfvJMbNArMTd1FAR/leDaL7F94ks48SfZHUDXL4
         fd1B0+Xm8KM7CNoY0SyAThSmkCCA9GG1GYr2NLlG4LSuMjXG2RXyiE8+Td1YeObfQe
         OpH1y7B4s19Ka+g6TLWgEJv3F/ezycGfk/i7Sv335lA3CrX6KXeU0unDWViSmV19WG
         umkY2wmCvfIka0hPwOYVzd4FZzSVVnReTSz4F0MKCSXCcdKOYzED50e3lixFkCGydB
         GsYM+T8Z3ZPIg==
Subject: Re: [PATCH 02/10] i2c: xiic: Add standard mode support for > 255 byte
 read transfers
To:     Raviteja Narayanam <rna@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Michal Simek <michals@xilinx.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
 <20210531131948.19477-3-raviteja.narayanam@xilinx.com>
 <0f167c21-6bc7-0806-a536-55658a199a5b@denx.de>
 <SN6PR02MB4093F1992FA306C027D01448CA3C9@SN6PR02MB4093.namprd02.prod.outlook.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <df5d8f33-1fe0-5760-b19d-300c1f99344e@denx.de>
Date:   Thu, 3 Jun 2021 11:57:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB4093F1992FA306C027D01448CA3C9@SN6PR02MB4093.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/3/21 7:33 AM, Raviteja Narayanam wrote:
[...]
>>> +	if (i2c->dynamic) {
>>> +		u8 bytes;
>>> +		u16 val;
>>> +
>>> +		/* Clear and enable Rx full interrupt. */
>>> +		xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
>>> +				XIIC_INTR_TX_ERROR_MASK);
>>> +
>>> +		/*
>>> +		 * We want to get all but last byte, because the TX_ERROR
>> IRQ
>>> +		 * is used to indicate error ACK on the address, and
>>> +		 * negative ack on the last received byte, so to not mix
>>> +		 * them receive all but last.
>>> +		 * In the case where there is only one byte to receive
>>> +		 * we can check if ERROR and RX full is set at the same time
>>> +		 */
>>> +		rx_watermark = msg->len;
>>> +		bytes = min_t(u8, rx_watermark, IIC_RX_FIFO_DEPTH);
>>> +		bytes--;
>>> +
>>> +		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
>>> +
>>> +		local_irq_save(flags);
>>> +		if (!(msg->flags & I2C_M_NOSTART))
>>> +			/* write the address */
>>> +			xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
>>> +				      i2c_8bit_addr_from_msg(msg) |
>>> +				      XIIC_TX_DYN_START_MASK);
>>> +
>>> +		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
>>> +
>>> +		/* If last message, include dynamic stop bit with length */
>>> +		val = (i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0;
>>> +		val |= msg->len;
>>> +
>>> +		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
>>> +		local_irq_restore(flags);
>>
>> Is local_irq_save()/local_irq_restore() used here to prevent concurrent
>> access to the XIIC ?
> 
> These were used to fix the timing constraint between two register writes to the IP.
> As we have discussed last time, these are removed in " [PATCH 08/10] i2c: xiic: Remove interrupt enable/disable in Rx path".
> Now they are no longer needed since our IP is fixed.
> For legacy IP versions, driver is switching to 'AXI I2C standard mode' of operation in
> " [PATCH 07/10] i2c: xiic: Switch to Xiic standard mode for i2c-read".

I see, I would expect such fixes to be at the beginning of the series, 
so they can be picked into linux-stable.

In fact, now that you mention the bugfixes which I posted a year ago, 
they also fixed a multitude of locking issues on SMP in the xiic driver. 
Has this series been tested on SMP Zynq or ZynqMP extensively ?
