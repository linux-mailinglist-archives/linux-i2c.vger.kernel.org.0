Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25067223D2
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 12:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjFEKtc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 06:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjFEKt1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 06:49:27 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293381B4;
        Mon,  5 Jun 2023 03:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685962157; x=1717498157;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=RDSiOGvuWDvk0klatOSDgEpCizk0Ii4pCFeHhwpwOQU=;
  b=Lvy0hqht0+3pPCFEKxO+Qrof4fpir7T5n+IEGWqVaJ50VUHNgN4KFTb0
   3U/Osny/jRf4vGehXBj+74TKoTKRG/8iOTrM2QNAtzTSxxp6n8rZYwQXj
   rrd7hE6ATmfj546ZzA3H+0wfm3WbnbyEph736LLSInuIfF5hI+FJ7A7Z9
   On3f7McFuYasKF6XohFG3wAzoEx185vlf+u56KoEALi27B+ConOke/NU6
   QhRHnKBcYE0q66HOVgUrQy0tYvROdlbb6nFQ5c3PeBpHdhdC1gL7pZ4lm
   By1rw/OhjcyVulewDqpRTjV5V76re1LISByfUNok1abAQPHiWzVGXL4RD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="422162794"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="422162794"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 03:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="708620545"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="708620545"
Received: from mylly.fi.intel.com (HELO [10.237.72.143]) ([10.237.72.143])
  by orsmga002.jf.intel.com with ESMTP; 05 Jun 2023 03:48:52 -0700
Message-ID: <ed2cbf76-1868-9153-81c7-cc17b807421e@linux.intel.com>
Date:   Mon, 5 Jun 2023 13:48:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v3] i2c: designware: fix idx_write_cnt in read loop
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, David Zheng <david.zheng@intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com
References: <ZG5UI7cJvmLXvtLg@davidzhe-DESK>
 <f9a38ff8-ca08-a9aa-e2ff-ce2ce956235a@linux.intel.com>
 <ZH2yr1sFvjbAiBTq@shikoro>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZH2yr1sFvjbAiBTq@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/5/23 13:02, Wolfram Sang wrote:
> On Fri, May 26, 2023 at 04:58:26PM +0300, Jarkko Nikula wrote:
>> On 5/24/23 21:14, David Zheng wrote:
>>> With IC_INTR_RX_FULL slave interrupt handler reads data in a loop until
>>> RX FIFO is empty. When testing with the slave-eeprom, each transaction
>>> has 2 bytes for address/index and 1 byte for value, the address byte
>>> can be written as data byte due to dropping STOP condition.
>>>
>>> In the test below, the master continuously writes to the slave, first 2
>>> bytes are index, 3rd byte is value and follow by a STOP condition.
>>>
>>>    i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D1-D1]
>>>    i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D2-D2]
>>>    i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D3-D3]
>>>
>>> Upon receiving STOP condition slave eeprom would reset `idx_write_cnt` so
>>> next 2 bytes can be treated as buffer index for upcoming transaction.
>>> Supposedly the slave eeprom buffer would be written as
>>>
>>>    EEPROM[0x00D1] = 0xD1
>>>    EEPROM[0x00D2] = 0xD2
>>>    EEPROM[0x00D3] = 0xD3
>>>
>>> When CPU load is high the slave irq handler may not read fast enough,
>>> the interrupt status can be seen as 0x204 with both DW_IC_INTR_STOP_DET
>>> (0x200) and DW_IC_INTR_RX_FULL (0x4) bits. The slave device may see
>>> the transactions below.
>>>
>>>    0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>>>    0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>>>    0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>>>    0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1794 : INTR_STAT=0x204
>>>    0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x1790 : INTR_STAT=0x200
>>>    0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>>>    0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>>>    0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
>>>
>>> After `D1` is received, read loop continues to read `00` which is the
>>> first bype of next index. Since STOP condition is ignored by the loop,
>>> eeprom buffer index increased to `D2` and `00` is written as value.
>>>
>>> So the slave eeprom buffer becomes
>>>
>>>    EEPROM[0x00D1] = 0xD1
>>>    EEPROM[0x00D2] = 0x00
>>>    EEPROM[0x00D3] = 0xD3
>>>
>>> The fix is to use `FIRST_DATA_BYTE` (bit 11) in `IC_DATA_CMD` to split
>>> the transactions. The first index byte in this case would have bit 11
>>> set. Check this indication to inject I2C_SLAVE_WRITE_REQUESTED event
>>> which will reset `idx_write_cnt` in slave eeprom.
>>>
>>> Signed-off-by: David Zheng <david.zheng@intel.com>
> 
> Applied to for-current, thanks!
> 
> Someone maybe has a Fixes tag for it?
> 
In my opinion this patch is more improvement rather than a regression fix.

I see it's continuation to the commits dcf1bf648f94 ("i2c: designware: 
Empty receive FIFO in slave interrupt handler") and 3b5f7f10ff6e ("i2c: 
designware: slave should do WRITE_REQUESTED before WRITE_RECEIVED").
