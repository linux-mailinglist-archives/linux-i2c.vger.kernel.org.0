Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F06FAF46D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 04:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbfIKCnS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Sep 2019 22:43:18 -0400
Received: from anchovy1.45ru.net.au ([203.30.46.145]:46968 "EHLO
        anchovy1.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfIKCnR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Sep 2019 22:43:17 -0400
Received: (qmail 23216 invoked by uid 5089); 11 Sep 2019 02:43:15 -0000
Received: by simscan 1.2.0 ppid: 23103, pid: 23104, t: 0.0679s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy1.45ru.net.au with ESMTPA; 11 Sep 2019 02:43:15 -0000
Subject: Re: i2c: designware: multi master problem
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Luis Oliveira <Luis.Oliveira@synopsys.com>
References: <d950db24-cee4-2d21-dbb3-1359d29d15e9@electromag.com.au>
 <9c61cfe3-da7d-6819-e60f-7bf3863864eb@linux.intel.com>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <b326f190-8f83-d8f9-929d-eda1c4fd5ffb@electromag.com.au>
Date:   Wed, 11 Sep 2019 10:43:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9c61cfe3-da7d-6819-e60f-7bf3863864eb@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/09/2019 21:41, Jarkko Nikula wrote:
> + Luis from Synopsys
> 
> On 9/10/19 10:29 AM, Phil Reid wrote:
>> G'day All,
>>
>> I'm seeing a problem with the designware driver in a multi-master system.
>> This is an Altera / Intel Cycloe V SoC.
>> This is with it connected to a ltc1760 sbs manager which acts as a slave and master.
>>
>> What I'm seeing is that a requested read of the ltc1760 will return successfully before
>> the u2c transfer has been done. Read data contain garbage.
>>
>> In i2c_dw_xfer() I set all read buffers to 0xff and get 0xffff as the return value
>> from sbsm_read_word().
>>
>> I've injected a gpio trigger before and after the sbsm_read_word() call and
>> looked at the traffic in between. I can see the ltc1760 as master talking to
>> the sbs batteries and after the sbsm_read_word() call returns the start of the
>> actual sbsm_read_word() call is started with the address and and cmd byte being
>> sent on the wire. The bus then hangs with scl held low by the
>> designware driver, while I think it waits for the driver to start the read.
>>
>> I've been able to isolate which device is driving the bus
>> by routing the i2c control signal thru the c-v fabric and tapping the OE enables from
>> the designware core to separate pins.
>>
>> What I think is going on is the the stop events from the ltc1760 are being
>> counted by the driver as part of it's transaction.
>>
>> ie in i2c_dw_irq_handler_master() the completion is only monitoring
>>      if ((stat & (DW_IC_INTR_TX_ABRT | DW_IC_INTR_STOP_DET)) || dev->msg_err) {
>>          complete(&dev->cmd_complete);
>>
>> Anyone have any thoughts on how to fix this?
>>
>> Should complete only be called if DW_IC_INTR_RX_FULL or DW_IC_INTR_TX_EMPTY are
>> also set?
>>
>>

I've logged the DW_IC_RAW_INTR_STAT register in the irq and see the following:
i2c_dw_irq_handler_master: DW_IC_RAW_INTR_STAT register & dev->flags (hex)

sbsm_gpio_get_value: Last value is what was returned from sbsm_read_word() (hex)
After initialising all read buffer to 0xff.
In i2c_dw_xfer I added the following:
	for (ret = 0; ret < num; ret++) {
		if (msgs[ret].flags == I2C_M_RD) {
			memset(msgs[ret].buf, 0xff, msgs[ret].len);
		}
	}

Prior to this it was returning un-inited values in buf.


Successful transfer
              cat-381   [000] ....   167.342035: i2c_dw_xfer: i2c_dw_xfer: msgs: 2
              cat-381   [000] d.h1   167.342048: i2c_dw_isr: i2c_dw_irq_handler_master: s 10 0
           <idle>-0     [000] d.h1   167.342955: i2c_dw_isr: i2c_dw_irq_handler_master: s 514 0
           <idle>-0     [000] d.h1   167.343167: i2c_dw_isr: i2c_dw_irq_handler_master: s 514 0
           <idle>-0     [000] dnh1   167.343186: i2c_dw_isr: i2c_dw_irq_handler_master: s 710 0
              cat-381   [000] ....   167.343218: sbsm_gpio_get_value: sbsm_gpio_get_value: gpio 0: 1011

Failed transfer
              cat-382   [001] ....   168.146166: i2c_dw_xfer: i2c_dw_xfer: msgs: 2
           <idle>-0     [000] dnh1   168.146224: i2c_dw_isr: i2c_dw_irq_handler_master: s 410 0
           <idle>-0     [000] d.h1   168.147345: i2c_dw_isr: i2c_dw_irq_handler_master: s 610 0
              cat-382   [001] ....   168.147639: sbsm_gpio_get_value: sbsm_gpio_get_value: Failed to read gpio 0: ffff

Failed transfer
  systemd-journal-146   [001] ....   168.216212: i2c_dw_xfer: i2c_dw_xfer: msgs: 2
           <idle>-0     [000] d.h1   168.216583: i2c_dw_isr: i2c_dw_irq_handler_master: s 10 0
           <idle>-0     [000] d.h1   168.217277: i2c_dw_isr: i2c_dw_irq_handler_master: s 610 0
  systemd-journal-146   [001] ....   168.217524: sbsm_gpio_get_value: sbsm_gpio_get_value: Failed to read gpio 0: ffff


Successful transfer
  systemd-journal-146   [001] ....   168.229292: i2c_dw_xfer: i2c_dw_xfer: msgs: 2
           <idle>-0     [000] d.h1   168.284968: i2c_dw_isr: i2c_dw_irq_handler_master: s 10 0
           <idle>-0     [000] d.h1   168.285871: i2c_dw_isr: i2c_dw_irq_handler_master: s 514 0
           <idle>-0     [000] d.h1   168.286082: i2c_dw_isr: i2c_dw_irq_handler_master: s 514 0
           <idle>-0     [000] dnh1   168.286103: i2c_dw_isr: i2c_dw_irq_handler_master: s 710 0
  systemd-journal-146   [001] ....   168.286150: sbsm_gpio_get_value: sbsm_gpio_get_value: gpio 0: 1011

-- 
Regards
Phil Reid

