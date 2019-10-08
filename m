Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64C94D00D0
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2019 20:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbfJHSrW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Oct 2019 14:47:22 -0400
Received: from mga03.intel.com ([134.134.136.65]:6237 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbfJHSrW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Oct 2019 14:47:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Oct 2019 11:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,272,1566889200"; 
   d="scan'208";a="187381092"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga008.jf.intel.com with ESMTP; 08 Oct 2019 11:47:19 -0700
Subject: Re: [PATCH 1/5] dt-bindings: i2c: aspeed: add buffer and DMA mode
 transfer support
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-2-jae.hyun.yoo@linux.intel.com>
 <20191008181213.GB155928@google.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c09072c6-13f2-202d-8985-ccf409793784@linux.intel.com>
Date:   Tue, 8 Oct 2019 11:47:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008181213.GB155928@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Brendan,

On 10/8/2019 11:12 AM, Brendan Higgins wrote:
> On Mon, Oct 07, 2019 at 04:13:09PM -0700, Jae Hyun Yoo wrote:
>> Append bindings to support buffer mode and DMA mode transfer.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   .../devicetree/bindings/i2c/i2c-aspeed.txt    | 67 +++++++++++++++++--
>>   1 file changed, 60 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>> index 8fbd8633a387..e40dcc108307 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>> @@ -3,7 +3,10 @@ Device tree configuration for the I2C busses on the AST24XX and AST25XX SoCs.
>>   Required Properties:
>>   - #address-cells	: should be 1
>>   - #size-cells		: should be 0
>> -- reg			: address offset and range of bus
>> +- reg			: Address offset and range of bus registers.
>> +			  An additional SRAM buffer address offset and range is
>> +			  optional in case of enabling I2C dedicated SRAM for
>> +			  buffer mode transfer support.
> 
> Sorry, I am having trouble parsing this. This seems like the SRAM buffer
> is global to all busses. Can you clarify? I expect I will probably have
> some more questions elsewhere.

Each SoC has a different SRAM structure. In case of AST2400, it has a
SRAM buffer pool which can be shared by all busses. In the other hand,
AST2500/2600 have dedicated SRAM spaces for each bus.

This is what I explained in the cover letter:

* Buffer mode
   AST2400:
     It has 2 KBytes (256 Bytes x 8 pages) of I2C SRAM buffer pool from
     0x1e78a800 to 0x1e78afff that can be used for all busses with
     buffer pool manipulation. To simplify implementation for supporting
     both AST2400 and AST2500, it assigns each 128 Bytes per bus without
     using buffer pool manipulation so total 1792 Bytes of I2C SRAM
     buffer will be used.

   AST2500:
     It has 16 Bytes of individual I2C SRAM buffer per each bus and its
     range is from 0x1e78a200 to 0x1e78a2df, so it doesn't have 'buffer
     page selection' bit field in the Function control register, and
     neither 'base address pointer' bit field in the Pool buffer control
     register it has. To simplify implementation for supporting both
     AST2400 and AST2500, it writes zeros on those register bit fields
     but it's okay because it does nothing in AST2500.

>>   - compatible		: should be "aspeed,ast2400-i2c-bus"
>>   			  or "aspeed,ast2500-i2c-bus"
>>   - clocks		: root clock of bus, should reference the APB
>> @@ -16,6 +19,18 @@ Optional Properties:
>>   - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
>>   		  specified
>>   - multi-master	: states that there is another master active on this bus.
>> +- aspeed,dma-buf-size	: size of DMA buffer (from 2 to 4095 in case of AST2500
>> +			  or later versions).
>> +			  Only AST2500 and later versions support DMA mode
>> +			  under some limitations:
>> +			  I2C is sharing the DMA H/W with UHCI host controller
>> +			  and MCTP controller. Since those controllers operate
>> +			  with DMA mode only, I2C has to use buffer mode or byte
>> +			  mode instead if one of those controllers is enabled.
>> +			  Also make sure that if SD/eMMC or Port80 snoop uses
>> +			  DMA mode instead of PIO or FIFO respectively, I2C
>> +			  can't use DMA mode. If both DMA and buffer modes are
>> +			  enabled, DMA mode will be selected.
> 
> nit: I think it makes sense to break down the exceptions into a
> bulleted list.

Okay. Will update it using bulleted list.

Thanks,

Jae
