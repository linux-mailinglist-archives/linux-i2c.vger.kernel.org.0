Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4002F44D7CC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 15:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbhKKOJI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 09:09:08 -0500
Received: from mga02.intel.com ([134.134.136.20]:13577 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232033AbhKKOJH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Nov 2021 09:09:07 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="220121290"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="220121290"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 06:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="733188914"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by fmsmga006.fm.intel.com with ESMTP; 11 Nov 2021 06:05:55 -0800
Subject: Re: [PATCH] i2c: designware: I2C unexpected interrupt handling will
 cause kernel panic
To:     huangbibo <huangbibo@uniontech.com>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com,
        andriy.shevchenko@linux.intel.com, p.zabel@pengutronix.de
References: <20211111065759.7423-1-huangbibo@uniontech.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <0f203acf-7f63-e2d0-b590-120d3a7ba9c5@linux.intel.com>
Date:   Thu, 11 Nov 2021 16:05:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211111065759.7423-1-huangbibo@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 11/11/21 8:57 AM, huangbibo wrote:
> I2C interrupts may be triggered unexpectedly,
> such as programs that directly access I2C registers,
> bus conflicts caused by hardware design defects, etc.
> These can cause null pointer reference errors and kernel panic.
> 
> kernel log:
> [   52.676442] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> ...
> [   52.816536] Workqueue: efi_rts_wq efi_call_rts
> [   52.820968] pstate: 60000085 (nZCv daIf -PAN -UAO)
> [   52.825753] pc : i2c_dw_isr+0x36c/0x5e0 [i2c_designware_core]
> [   52.831487] lr : i2c_dw_isr+0x88/0x5e0 [i2c_designware_core]
> [   52.837134] sp : ffff8020fff17650
> [   52.924451] Call trace:
> [   52.926888]  i2c_dw_isr+0x36c/0x5e0 [i2c_designware_core]
> ...
> [   52.957394]  gic_handle_irq+0x7c/0x178
> [   52.961130]  el1_irq+0xb0/0x140
> [   52.964259]  0x21291d30
> [   52.983729]  0x21160938
> [   52.986164]  __efi_rt_asm_wrapper+0x28/0x44
> [   52.990335]  efi_call_rts+0x78/0x448
> [   53.019021] Kernel panic - not syncing: Fatal exception in interrupt
> 
> Signed-off-by: huangbibo <huangbibo@uniontech.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 2871cf2ee8b4..6af1ede38253 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -631,8 +631,14 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
>   	if (stat & DW_IC_INTR_RX_FULL)
>   		i2c_dw_read(dev);
>   
> -	if (stat & DW_IC_INTR_TX_EMPTY)
> -		i2c_dw_xfer_msg(dev);
> +	if (stat & DW_IC_INTR_TX_EMPTY) {
> +		if (dev->msgs) {
> +			i2c_dw_xfer_msg(dev);
> +		} else { //null  pointer
> +			i2c_dw_disable_int(dev);
> +			return 0;
> +		}
> +	}

This feels to me we are masking the problem. It's common to have 
i2c-designware device suspended (and registers might read all bits zero) 
and receive interrupts from another device if interrupt line is shared. 
Also while dev->msgs is NULL.

I'd like to understand the issue more. Could you add 
"i2c_designware_core.dyndbg=+p" into command line in order to see 
dev_dbg() prints in dmesg and with following patch?

--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -720,6 +720,7 @@ static int i2c_dw_irq_handler_master(struct 
dw_i2c_dev *dev)
         u32 stat;

         stat = i2c_dw_read_clear_intrbits(dev);
+       dev_dbg(dev->dev, "stat %#x\n", stat);
         if (stat & DW_IC_INTR_TX_ABRT) {
                 dev->cmd_err |= DW_IC_ERR_TX_ABRT;
                 dev->status = STATUS_IDLE;

Jarkko
