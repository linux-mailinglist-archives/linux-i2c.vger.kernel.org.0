Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75DECAE4B8
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2019 09:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbfIJHgL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Sep 2019 03:36:11 -0400
Received: from anchovy1.45ru.net.au ([203.30.46.145]:47567 "EHLO
        anchovy1.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728885AbfIJHgL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Sep 2019 03:36:11 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Sep 2019 03:36:11 EDT
Received: (qmail 5825 invoked by uid 5089); 10 Sep 2019 07:29:30 -0000
Received: by simscan 1.2.0 ppid: 5760, pid: 5761, t: 0.0539s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy1.45ru.net.au with ESMTPA; 10 Sep 2019 07:29:30 -0000
To:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
From:   Phil Reid <preid@electromag.com.au>
Subject: i2c: designware: multi master problem
Message-ID: <d950db24-cee4-2d21-dbb3-1359d29d15e9@electromag.com.au>
Date:   Tue, 10 Sep 2019 15:29:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

G'day All,

I'm seeing a problem with the designware driver in a multi-master system.
This is an Altera / Intel Cycloe V SoC.
This is with it connected to a ltc1760 sbs manager which acts as a slave and master.

What I'm seeing is that a requested read of the ltc1760 will return successfully before
the u2c transfer has been done. Read data contain garbage.

In i2c_dw_xfer() I set all read buffers to 0xff and get 0xffff as the return value
from sbsm_read_word().

I've injected a gpio trigger before and after the sbsm_read_word() call and
looked at the traffic in between. I can see the ltc1760 as master talking to
the sbs batteries and after the sbsm_read_word() call returns the start of the
actual sbsm_read_word() call is started with the address and and cmd byte being
sent on the wire. The bus then hangs with scl held low by the
designware driver, while I think it waits for the driver to start the read.

I've been able to isolate which device is driving the bus
by routing the i2c control signal thru the c-v fabric and tapping the OE enables from
the designware core to separate pins.

What I think is going on is the the stop events from the ltc1760 are being
counted by the driver as part of it's transaction.

ie in i2c_dw_irq_handler_master() the completion is only monitoring
	if ((stat & (DW_IC_INTR_TX_ABRT | DW_IC_INTR_STOP_DET)) || dev->msg_err) {
		complete(&dev->cmd_complete);

Anyone have any thoughts on how to fix this?

Should complete only be called if DW_IC_INTR_RX_FULL or DW_IC_INTR_TX_EMPTY are
also set?



-- 
Regards
Phil Reid
