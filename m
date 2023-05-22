Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E75B70C1A9
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 16:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbjEVO7Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 May 2023 10:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbjEVO7S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 10:59:18 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F45A1AD;
        Mon, 22 May 2023 07:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684767550; x=1716303550;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eGWqhbY4zoCc+GFxYj9kerl8y0O3B0XglUVKZ8y8N3Q=;
  b=LPJbtx1MFUaBpvTQBD9RoFy8D5/Cls3Y4LF0FjCSpYUqgUWNLppEFykZ
   Lfnxfj/1C48SJgXlPx5AsqO+15JXtf05psVfnxty1YI5230SEMRjF94Cl
   zX5uhu9gBy6pX/7k8akzW8is2yNK8FlnuIEtypbNZ+1j1khTRI1ufXzB6
   IAtivFoUfMm7u0QHNIKByQYEmtYlRDpWItBG1Gj2KARMiwZRTNkm1sxJS
   smuhABluAJyvuGWS+b3x/ZHnoeBBv4DuSJ/ivGg0FcSsxhyfp6p68n8+d
   qRgiPgeiXy1hCo/xGlfqNJJebgvHFWEFGKBSrd+vJL4eCgMDmI8hBqN6G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="342396097"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="342396097"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 07:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="703544278"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="703544278"
Received: from mylly.fi.intel.com (HELO [10.237.72.160]) ([10.237.72.160])
  by orsmga002.jf.intel.com with ESMTP; 22 May 2023 07:58:27 -0700
Message-ID: <a4d3252d-158d-a7b3-2988-22df39dba24f@linux.intel.com>
Date:   Mon, 22 May 2023 17:58:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH] i2c: designware: fix idx_write_cnt in read loop
Content-Language: en-US
To:     David Zheng <david.zheng@intel.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com
References: <ZGZpEyITTuoBUEAM@davidzhe-DESK>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZGZpEyITTuoBUEAM@davidzhe-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 5/18/23 21:06, David Zheng wrote:
> With IC_INTR_RX_FULL slave interrupt handler reads data in a loop until
> RX FIFO is empty. When testing with the slave-eeprom, each transaction
> has 2 bytes for address/index and 1 byte for value, the address byte
> can be written as data byte due to dropping STOP condition.
> 
> In the test below, the master continuously writes to the slave, first 2
> bytes are index, 3rd byte is value and follow by a STOP condition.
> 
>   i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D1-D1]
>   i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D2-D2]
>   i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D3-D3]
> 
> Upon receiving STOP condition slave eeprom would reset `idx_write_cnt` so
> next 2 bytes can be treated as buffer index for upcoming transaction.
> Supposedly the slave eeprom buffer would be written as
> 
>   EEPROM[0x00D1] = 0xD1
>   EEPROM[0x00D2] = 0xD2
>   EEPROM[0x00D3] = 0xD3
> 
> When CPU load is high the slave irq handler may not read fast enough,
> the interrupt status can be seen as 0x204 with both DW_IC_INTR_STOP_DET
> (0x200) and DW_IC_INTR_RX_FULL (0x4) bits. The slave device may see
> the transactions below.
> 
>   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1794 : INTR_STAT=0x204
>   0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x1790 : INTR_STAT=0x200
>   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
> 
> After `D1` is received, read loop continues to read `00` which is the
> first bype of next index. Since STOP condition is ignored by the loop,
> eeprom buffer index increased to `D2` and `00` is written as value.
> 
> So the slave eeprom buffer becomes
> 
>   EEPROM[0x00D1] = 0xD1
>   EEPROM[0x00D2] = 0x00
>   EEPROM[0x00D3] = 0xD3
> 
> The fix is to use `FIRST_DATA_BYTE` (bit 11) in `IC_DATA_CMD` to split
> the transactions. The first index byte in this case would have bit 11
> set. Check this indication to inject I2C_SLAVE_WRITE_REQUESTED event
> which will reset `idx_write_cnt` in slave eeprom.
> 
> Signed-off-by: David Zheng <david.zheng@intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-core.h  | 2 ++
>   drivers/i2c/busses/i2c-designware-slave.c | 6 ++++--
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index c5d87aae39c6..8b85147bd518 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -123,6 +123,8 @@
>   #define DW_IC_COMP_PARAM_1_SPEED_MODE_HIGH	(BIT(2) | BIT(3))
>   #define DW_IC_COMP_PARAM_1_SPEED_MODE_MASK	GENMASK(3, 2)
>   
> +#define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
> +
>   /*
>    * Sofware status flags
>    */
> diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
> index cec25054bb24..9549cbcf50aa 100644
> --- a/drivers/i2c/busses/i2c-designware-slave.c
> +++ b/drivers/i2c/busses/i2c-designware-slave.c
> @@ -170,12 +170,14 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
>   		if (!(dev->status & STATUS_WRITE_IN_PROGRESS)) {
>   			dev->status |= STATUS_WRITE_IN_PROGRESS;
>   			dev->status &= ~STATUS_READ_IN_PROGRESS;
> -			i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED,
> -					&val);
>   		}
>   
>   		do {
>   			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
> +			if (tmp & DW_IC_DATA_CMD_FIRST_DATA_BYTE)
> +				i2c_slave_event(dev->slave,
> +						I2C_SLAVE_WRITE_REQUESTED,
> +						&val);
>   			val = tmp;
>   			i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
>   					&val);
I fear this might cause regression on some use case on HW that doesn't 
have the FIRST_DATA_BYTE bit in IC_DATA_CMD. That is available on newer 
Synopsys I2C IPs only. For example my test HW doesn't have it.

This means the I2C_SLAVE_WRITE_REQUESTED is never delivered on these HWs 
that don't implement the FIRST_DATA_BYTE.

My quick tests using i2c-slave-eeprom didn't show regression but I'm 
sure there is a case that will regress because of that.
