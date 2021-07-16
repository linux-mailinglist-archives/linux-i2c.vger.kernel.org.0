Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69103CBA39
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jul 2021 18:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235486AbhGPQEW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jul 2021 12:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235138AbhGPQEW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jul 2021 12:04:22 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2886C06175F;
        Fri, 16 Jul 2021 09:01:26 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id BD14C805DF;
        Fri, 16 Jul 2021 18:01:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1626451283;
        bh=6i5JGXlL1V3GzRerBd5Yb5nT3I1ajEBH7myeU25jc8E=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NGQromh6ScHrW/4NMwJm/TNJla7SDk/N6ofjCi6q4i2x2Yj0OWt3YHxBunD6Trfua
         8gdS4Kbq+IPjxT4i6oSdMn4b1LuVIhR1Kzumef9H8RGCLF/bHtkGAs+gEtbWPXf4OK
         edeacIDNq4cgFJlAsU5nG/gAWwqfocQDNUXPIR9XJcuLMifDFQcqhTiqQQmvhx8LJV
         vTN64zlJIw8HtQp5Mvdhhm25nVr+LIR7yK0Lk/ZkO80bZ5cRGFZK/lo/hcIzWLyOew
         47sI4mnql4dalYah60E0c531rS4IMDvfq6LlkVfKShX/CtTxwZ9/InuossyPVoEm2p
         5DgvZBZlvgmQw==
Subject: Re: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
To:     Michal Simek <michal.simek@xilinx.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com, joe@perches.com
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <95162fd0-10e6-2bc6-4079-899ac26f66ce@xilinx.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <0c51785f-9763-aebc-a9ea-04337ad1accc@denx.de>
Date:   Fri, 16 Jul 2021 18:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <95162fd0-10e6-2bc6-4079-899ac26f66ce@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/28/21 9:23 AM, Michal Simek wrote:
> 
> 
> On 6/26/21 12:27 PM, Raviteja Narayanam wrote:
>> -Add 'standard mode' feature for reads > 255 bytes.
>> -Add 'smbus block read' functionality.
>> -Add 'xlnx,axi-iic-2.1' new IP version support.
>> -Switch to 'AXI I2C standard mode' for i2c reads in affected IP versions.
>> -Remove 'local_irq_save/restore' calls as discussed here: https://www.spinics.net/lists/linux-i2c/msg46483.html.
>> -Some trivial fixes.
>>
>> Changes in v2:
>> -Grouped the commits as fixes first and then features.
>> -The first 4 commits fix the dynamic mode broken feature.
>> -Corrected the indentation in coding style issues.
>>
>> Michal Simek (1):
>>    i2c: xiic: Fix coding style issues
>>
>> Raviteja Narayanam (7):
>>    i2c: xiic: Fix Tx Interrupt path for grouped messages
>>    i2c: xiic: Add standard mode support for > 255 byte read transfers
>>    i2c: xiic: Switch to Xiic standard mode for i2c-read
>>    i2c: xiic: Remove interrupt enable/disable in Rx path
>>    dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
>>    i2c: xiic: Update compatible with new IP version
>>    i2c: xiic: Add smbus_block_read functionality
>>
>> Shubhrajyoti Datta (2):
>>    i2c: xiic: Return value of xiic_reinit
>>    i2c: xiic: Fix the type check for xiic_wakeup
>>
>>   .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |   4 +-
>>   drivers/i2c/busses/i2c-xiic.c                 | 593 ++++++++++++++----
>>   2 files changed, 487 insertions(+), 110 deletions(-)
>>
> 
> Acked-by: Michal Simek <michal.simek@xilinx.com>

I just tested this patchset on next-20210716 and the XIIC failures are 
still present, see:

xiic-i2c a0010000.i2c: mmio a0010000 irq 36
xiic-i2c a0120000.i2c: mmio a0120000 irq 38
atmel_mxt_ts 3-004a: supply vdda not found, using dummy regulator
atmel_mxt_ts 3-004a: supply vdd not found, using dummy regulator

xiic-i2c a0120000.i2c: Timeout waiting at Tx empty

atmel_mxt_ts 3-004a: __mxt_read_reg: i2c transfer failed (-5)
atmel_mxt_ts 3-004a: mxt_bootloader_read: i2c recv failed (-5)
atmel_mxt_ts 3-004a: Trying alternate bootloader address
atmel_mxt_ts 3-004a: mxt_bootloader_read: i2c recv failed (-5)
atmel_mxt_ts: probe of 3-004a failed with error -5
