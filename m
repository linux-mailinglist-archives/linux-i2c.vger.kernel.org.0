Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBAB3CEBAC
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jul 2021 22:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352687AbhGSRXM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jul 2021 13:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236213AbhGSRV7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jul 2021 13:21:59 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E29CC0613B7;
        Mon, 19 Jul 2021 10:44:21 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 02023829E7;
        Mon, 19 Jul 2021 20:00:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1626717620;
        bh=HEXZweqgYJVklWr9hryJRs34EHGLfve8XO83yKZu7B8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=J+ywi6bQWKnsHS3gBtT5PAfJuzpX5IN4LBOfCQHf/gB1A3uRouP+KjX3FJ5C/1TQr
         1+D+F8vIDSO32O6E2Z5+M3XkV0m1MZfejm+UdchLH/ET6AOIJAt3MxWYT4/4cnO3/J
         XVMdPsaEe3jfFjv7E4VKzP2R4UMXJ1Zc24EJ+yfdv6MCf+2o2NHMoaTxuWW1hAmuHt
         HjW2nuPFQzTKm4/YyKRzAj2oOsxgGNlGhGwuvz8cJuU1tumkSZTbsWeEWqpsF1MMUN
         um1GChfcTcVfcTCcy5CdrhzNAiTXXrUq2OAKzSWbQTmGca2e/4RmMepl32SpelDCGW
         +KRDWIW0ArSRQ==
Subject: Re: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
To:     Raviteja Narayanam <rna@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>, "joe@perches.com" <joe@perches.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <95162fd0-10e6-2bc6-4079-899ac26f66ce@xilinx.com>
 <0c51785f-9763-aebc-a9ea-04337ad1accc@denx.de>
 <SN6PR02MB40933E99A241952502B69F41CAE19@SN6PR02MB4093.namprd02.prod.outlook.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <45aa8d2b-a077-32a2-0608-8f20a5b807a8@denx.de>
Date:   Mon, 19 Jul 2021 20:00:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB40933E99A241952502B69F41CAE19@SN6PR02MB4093.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/19/21 12:09 PM, Raviteja Narayanam wrote:

Hi,

[...]

>>>> -Add 'standard mode' feature for reads > 255 bytes.
>>>> -Add 'smbus block read' functionality.
>>>> -Add 'xlnx,axi-iic-2.1' new IP version support.
>>>> -Switch to 'AXI I2C standard mode' for i2c reads in affected IP versions.
>>>> -Remove 'local_irq_save/restore' calls as discussed here:
>> https://www.spinics.net/lists/linux-i2c/msg46483.html.
>>>> -Some trivial fixes.
>>>>
>>>> Changes in v2:
>>>> -Grouped the commits as fixes first and then features.
>>>> -The first 4 commits fix the dynamic mode broken feature.
>>>> -Corrected the indentation in coding style issues.
>>>>
>>>> Michal Simek (1):
>>>>     i2c: xiic: Fix coding style issues
>>>>
>>>> Raviteja Narayanam (7):
>>>>     i2c: xiic: Fix Tx Interrupt path for grouped messages
>>>>     i2c: xiic: Add standard mode support for > 255 byte read transfers
>>>>     i2c: xiic: Switch to Xiic standard mode for i2c-read
>>>>     i2c: xiic: Remove interrupt enable/disable in Rx path
>>>>     dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
>>>>     i2c: xiic: Update compatible with new IP version
>>>>     i2c: xiic: Add smbus_block_read functionality
>>>>
>>>> Shubhrajyoti Datta (2):
>>>>     i2c: xiic: Return value of xiic_reinit
>>>>     i2c: xiic: Fix the type check for xiic_wakeup
>>>>
>>>>    .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |   4 +-
>>>>    drivers/i2c/busses/i2c-xiic.c                 | 593 ++++++++++++++----
>>>>    2 files changed, 487 insertions(+), 110 deletions(-)
>>>>
>>>
>>> Acked-by: Michal Simek <michal.simek@xilinx.com>
>>
>> I just tested this patchset on next-20210716 and the XIIC failures are still
>> present, see:
> 
> The probe of ' atmel_mxt_ts' failed as per the error. May I know the details of
> your test case if you tweaked any i2ctransfers/added delays.

It is still the same test case from a year ago -- Atmel MXT touchscreen 
controller connected to XIIC I2C IP in ZynqMP FPGA, both drivers are 
compiled into the kernel. Also, it is not the "new" XIIC IP revision, 
but older one from Vivado 2019 or so.

> If it failed without adding anything, then please check whether the vivado design constraints
> are correctly applied or not.

They are, we already checked multiple times and the FPGA part is OK.

> Also check if the other devices on the bus are detected and i2ctransfer command is successful on them.

Note that this problem is very likely a race condition in the XIIC 
driver, so a trivial test like i2ctransfer on idle system from userspace 
is unlikely to trigger it. When the system is under heavy load e.g. 
during the kernel boot, that is when these corner cases start showing up.

> It would be helpful to know if the device ' atmel_mxt_ts' is successfully probed with next-20210716
> without applying this patchset.

Sometimes, the XIIC driver in current mainline Linux suffers from race 
conditions on SMP, so it depends.

The MXT driver also has to be patched to avoid longer than 255 byte 
transfers, because that is currently broken with XIIC.

> I have tested this again on our boards with eeprom and other sensors, this is working fine for us.

Can you share details of how those tests were performed ?
