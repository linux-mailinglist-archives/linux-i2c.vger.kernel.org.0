Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E33B7127E4
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 15:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237366AbjEZN6t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 09:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbjEZN6s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 09:58:48 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8411B3;
        Fri, 26 May 2023 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685109509; x=1716645509;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GwHThv/yL2ivyUjNaPV/IaAVSIfXPS4jo26+PvVxzeM=;
  b=IqD/9lOMs3QvCKVdCMo0SRKE1oOXLuk4YlC9juszrrQ1MwpkruJtg8V9
   rwQTMu0fA5jkmdUaETDnpOUfbuPlAs8S6tTKiDvERXLArEn2LV04dmG8N
   afHneI870UebSUZeGqzCd0otTbr49X3voAEC5Mi6nTcj+yTBZTs6svcvs
   g68x9d2NWb1kt8UWpu1zKabt9tX9CyIF2A9O4+Sh6DdXTPyb9haq5BnlC
   X3ZcZLrPHpIiaciOjwvZTcZGCKQV82drEzwvRLggwKGY0ny8RHmNJbWHN
   b7ovMERsU6TOq8dZ3YMz3Ppwk96DaPpMU+CFHB85YKzRnxztVuzmjISU6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="419962233"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="419962233"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 06:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="817542977"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="817542977"
Received: from mylly.fi.intel.com (HELO [10.237.72.143]) ([10.237.72.143])
  by fmsmga002.fm.intel.com with ESMTP; 26 May 2023 06:58:27 -0700
Message-ID: <f9a38ff8-ca08-a9aa-e2ff-ce2ce956235a@linux.intel.com>
Date:   Fri, 26 May 2023 16:58:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v3] i2c: designware: fix idx_write_cnt in read loop
Content-Language: en-US
To:     David Zheng <david.zheng@intel.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com
References: <ZG5UI7cJvmLXvtLg@davidzhe-DESK>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZG5UI7cJvmLXvtLg@davidzhe-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/24/23 21:14, David Zheng wrote:
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
> Changes in v2:
>   - Send I2C_SLAVE_WRITE_REQUESTED for HW does not have FIRST_DATA_BYTE
> Changes in v3:
>   - Move DW_IC_DATA_CMD_FIRST_DATA_BYTE next to DW_IC_DATA_CMD_DAT define
> ---
>   drivers/i2c/busses/i2c-designware-core.h  | 1 +
>   drivers/i2c/busses/i2c-designware-slave.c | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index c5d87aae39c6..bf23bfb51aea 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -40,6 +40,7 @@
>   #define DW_IC_CON_BUS_CLEAR_CTRL		BIT(11)
>   
>   #define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
> +#define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
>   
>   /*
>    * Registers offset
> diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
> index cec25054bb24..2e079cf20bb5 100644
> --- a/drivers/i2c/busses/i2c-designware-slave.c
> +++ b/drivers/i2c/busses/i2c-designware-slave.c
> @@ -176,6 +176,10 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
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

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
