Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C54044EAEF
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 17:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbhKLQDy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 11:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhKLQDy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Nov 2021 11:03:54 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0D9C061766;
        Fri, 12 Nov 2021 08:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=1PoMgt225ahOzqxrswYRs4vQ9XtAF4tU8uhs3mpb8aU=; b=VDUQaj/4A55szxk0UlulzfyL12
        QgeoHjN5+YUD4Poz3bWWNvxzEcwhVf9Zg+BMQ1P4FUaL4guk0ALAkwbofY2zxcIMFBR/cm6dsUizw
        VnPjyAmUTpvCOa8udvAvZ/NR+rL9ybpH/UaoewLbguFE4J9G5X2ztUn9Tc6nTT0E+qT23WCQnaqQL
        jwcwgd+lEZ+t/TlKdYQWNMMEdjsxr2+3dcXVCEQcoD0nYmNe6C9QMBoiU4xYSI2rHHTRaCJsAOjL0
        IlcnkD/FZrf/c/ue/CSxfu0KQBdYSu4gEwh9jhotoo4o99cuMm6q+ekKUw0eTv6F+7rbzbvI0twXn
        ZftZm2oQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mlYz7-00BC0o-K9; Fri, 12 Nov 2021 16:01:03 +0000
Subject: Re: [PATCH v1 1/1] i2c: designware: Fix the kernel doc description
 for struct dw_i2c_dev
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e62bf878-03df-1b93-2177-7b8a3be293c4@infradead.org>
Date:   Fri, 12 Nov 2021 08:01:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/12/21 4:34 AM, Andy Shevchenko wrote:
> $ scripts/kernel-doc -none drivers/i2c/busses/i2c-designware-core.h
> warning: Function parameter or member 'rst' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'get_clk_rate_khz' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'flags' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'functionality' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'master_cfg' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'set_sda_hold_time' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'rinfo' not described in 'dw_i2c_dev'
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Andy,

Thanks for the kernel-doc fixes.

> ---
>   drivers/i2c/busses/i2c-designware-core.h | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 60a2e750cee9..4b26cba40139 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -191,23 +191,26 @@ struct reset_control;
>    * @cmd_complete: tx completion indicator
>    * @clk: input reference clock
>    * @pclk: clock required to access the registers
> + * @rst: optional reset for the controller
>    * @slave: represent an I2C slave device
> + * @get_clk_rate_khz: callback to retrieve IP specific bus speed
>    * @cmd_err: run time hadware error code
>    * @msgs: points to an array of messages currently being transferred
>    * @msgs_num: the number of elements in msgs
> - * @msg_write_idx: the element index of the current tx message in the msgs
> - *	array
> + * @msg_write_idx: the element index of the current tx message in the msgs array
>    * @tx_buf_len: the length of the current tx buffer
>    * @tx_buf: the current tx buffer
> - * @msg_read_idx: the element index of the current rx message in the msgs
> - *	array
> + * @msg_read_idx: the element index of the current rx message in the msgs array
>    * @rx_buf_len: the length of the current rx buffer
>    * @rx_buf: the current rx buffer
>    * @msg_err: error status of the current transfer
>    * @status: i2c master status, one of STATUS_*
>    * @abort_source: copy of the TX_ABRT_SOURCE register
>    * @irq: interrupt number for the i2c master
> + * @flags: platform specific flags like type of IO accessors or model
>    * @adapter: i2c subsystem adapter node
> + * @functionality: I2C_FUNC_* ORed bits to reflect what controller does support
> + * @master_cfg: configuration for the master device
>    * @slave_cfg: configuration for the slave device
>    * @tx_fifo_depth: depth of the hardware tx fifo
>    * @rx_fifo_depth: depth of the hardware rx fifo
> @@ -228,7 +231,9 @@ struct reset_control;
>    * @disable: function to disable the controller
>    * @disable_int: function to disable all interrupts
>    * @init: function to initialize the I2C hardware
> + * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
>    * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
> + * @rinfo: I²C GPIO recovery information


Preferably:   "I2C"
like it is in thousands of places in the kernel source tree.

>    * @suspended: set to true if the controller is suspended
>    *
>    * HCNT and LCNT parameters can be used if the platform knows more accurate
> 


-- 
~Randy
