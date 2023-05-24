Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2116E70F839
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 16:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232991AbjEXOFw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 10:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbjEXOFw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 10:05:52 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE63AE7;
        Wed, 24 May 2023 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684937150; x=1716473150;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=O3ky+HRl+9kQSjMWZ81b6b+99pfCEki8XfJm2dVk39Q=;
  b=KddEqw3jsh3sZRRg7pkEGGar8EBvrLlLWQisgdVO2V1tHim9WJEHQvOh
   VuD0KyNuou7WpLZm0PvwppmRlrwGewbAowo99OQvpebch3/lacWkaZsbq
   vGE9cGy8e5DkC5PJdjTRFFn7mS5RGMgUBBaCi9tv2OMVVr0N9dg+6JQWk
   p38KAW34jyjdaXn7opVThW7unAIbFsdhev5QLcVDQM9raGX662c9tMnXR
   ZJwQfTw7Zox21go+akSYblxepKW9p4+Mzj1Ujn61r2z2uKnvXGg3bLTVC
   NvwF4qVvJFjk3VOw8MDenc2aGqhTgoF87teoYgn1bsRyC9Vy35qSMq1th
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="351084598"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="351084598"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 07:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="951031302"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="951031302"
Received: from mylly.fi.intel.com (HELO [10.237.72.160]) ([10.237.72.160])
  by fmsmga006.fm.intel.com with ESMTP; 24 May 2023 07:05:17 -0700
Message-ID: <49bce4e6-5757-7afe-2173-681305f1be36@linux.intel.com>
Date:   Wed, 24 May 2023 17:05:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH v1] i2c: designware: fix idx_write_cnt in read loop
Content-Language: en-US
To:     David Zheng <david.zheng@intel.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com
References: <ZGzt3dGW0dxa5fqc@davidzhe-DESK>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZGzt3dGW0dxa5fqc@davidzhe-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/23/23 19:46, David Zheng wrote:
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
>   drivers/i2c/busses/i2c-designware-slave.c | 4 ++++
>   2 files changed, 6 insertions(+)
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

Sorry, didn't notice earlier. Could you put this near to 
DW_IC_DATA_CMD_DAT define.
