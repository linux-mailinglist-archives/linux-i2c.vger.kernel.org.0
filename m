Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62EDEAEBC3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2019 15:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730779AbfIJNl4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Sep 2019 09:41:56 -0400
Received: from mga14.intel.com ([192.55.52.115]:30479 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730089AbfIJNl4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Sep 2019 09:41:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Sep 2019 06:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; 
   d="scan'208";a="175312962"
Received: from mylly.fi.intel.com (HELO [10.237.72.176]) ([10.237.72.176])
  by orsmga007.jf.intel.com with ESMTP; 10 Sep 2019 06:41:53 -0700
Subject: Re: i2c: designware: multi master problem
To:     Phil Reid <preid@electromag.com.au>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Luis Oliveira <Luis.Oliveira@synopsys.com>
References: <d950db24-cee4-2d21-dbb3-1359d29d15e9@electromag.com.au>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <9c61cfe3-da7d-6819-e60f-7bf3863864eb@linux.intel.com>
Date:   Tue, 10 Sep 2019 16:41:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d950db24-cee4-2d21-dbb3-1359d29d15e9@electromag.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+ Luis from Synopsys

On 9/10/19 10:29 AM, Phil Reid wrote:
> G'day All,
> 
> I'm seeing a problem with the designware driver in a multi-master system.
> This is an Altera / Intel Cycloe V SoC.
> This is with it connected to a ltc1760 sbs manager which acts as a slave 
> and master.
> 
> What I'm seeing is that a requested read of the ltc1760 will return 
> successfully before
> the u2c transfer has been done. Read data contain garbage.
> 
> In i2c_dw_xfer() I set all read buffers to 0xff and get 0xffff as the 
> return value
> from sbsm_read_word().
> 
> I've injected a gpio trigger before and after the sbsm_read_word() call and
> looked at the traffic in between. I can see the ltc1760 as master 
> talking to
> the sbs batteries and after the sbsm_read_word() call returns the start 
> of the
> actual sbsm_read_word() call is started with the address and and cmd 
> byte being
> sent on the wire. The bus then hangs with scl held low by the
> designware driver, while I think it waits for the driver to start the read.
> 
> I've been able to isolate which device is driving the bus
> by routing the i2c control signal thru the c-v fabric and tapping the OE 
> enables from
> the designware core to separate pins.
> 
> What I think is going on is the the stop events from the ltc1760 are being
> counted by the driver as part of it's transaction.
> 
> ie in i2c_dw_irq_handler_master() the completion is only monitoring
>      if ((stat & (DW_IC_INTR_TX_ABRT | DW_IC_INTR_STOP_DET)) || 
> dev->msg_err) {
>          complete(&dev->cmd_complete);
> 
> Anyone have any thoughts on how to fix this?
> 
> Should complete only be called if DW_IC_INTR_RX_FULL or 
> DW_IC_INTR_TX_EMPTY are
> also set?
> 
> 
> 
> -- 
> Regards
> Phil Reid

