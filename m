Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94E63720EEA
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Jun 2023 11:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjFCJYV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Jun 2023 05:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjFCJYT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 3 Jun 2023 05:24:19 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56ED61BB
        for <linux-i2c@vger.kernel.org>; Sat,  3 Jun 2023 02:24:16 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4QYDvm2fFWz9slZ;
        Sat,  3 Jun 2023 11:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mariushoch.de;
        s=MBO0001; t=1685784244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aADV6nIiUjR0huya2Ol/0S4K/JZhwz+gBUzva5zIcEc=;
        b=yNdLROCwlPnHukENeuWwHWkVNrtDU5JQa1kQyT/FVpBrPxbcrXn0uxCJKgAhSCxUt+r2Cv
        R2fdhnAQhKSk5keqaDMy130UK0Btx8FAJIhhpZ5Y7J2NwkZnFvEwiK+qPJWZA0YmktG9tL
        ldMH8ckEli2eudkePwVMOCEbaP9eDSP4251OkiHtQdGY+r1sUiqNPRflxUX7UcCvSCGFjB
        U2h2TjYCgGW8iX4/7mDRAdtjXN4GHnR8P+S9FFmeDwKn5DHH6f1PNgtGRxUA/Tujy8wcbw
        RcxYkYZGBKcggFhKCDyIa7p+Lj0U2WSrHyeSbmZXSqzqS+3RnW+dVc29x6zPvw==
Message-ID: <59a6a917-2a93-d52d-37f3-091295dd0db4@mariushoch.de>
Date:   Sat, 3 Jun 2023 11:24:02 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] i2c: i801: Force no IRQ for Dell Latitude E7450
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230514103634.235917-1-mail@mariushoch.de>
 <20230523200350.62ab4788@endymion.delvare>
Content-Language: en-US
From:   Marius Hoch <mail@mariushoch.de>
In-Reply-To: <20230523200350.62ab4788@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4QYDvm2fFWz9slZ
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

thank you for the reply!

On 23/05/2023 20:03, Jean Delvare wrote:
> Hi Marius,
>
> On Sun, 14 May 2023 12:36:32 +0200, Marius Hoch wrote:
>> The Dell Latitude E7450 uses IRQ 18 for the accelerometer,
>> but also claims that the SMBus uses IRQ 18. This will
>> result in:
>>
>> i801_smbus 0000:00:1f.3: PCI INT C: failed to register GSI
>> i801_smbus 0000:00:1f.3: Failed to enable SMBus PCI device (-16)
>> i801_smbus: probe of 0000:00:1f.3 failed with error -16
> The i2c-i801 driver supports shared IRQ. If this fails, this means that
> the other driver is not passing IRQF_SHARED when registering the
> interrupt. Which driver is this? I'd rather check whether sharing the
> IRQ is possible, rather that falling back to polling, which has a
> performance cost.
I don't think this is a conflict rather than a completely bogus entry: 
smo8800 uses IRQ 18 (the freefall sensor).

For the SMBus in acpi_pci_irq_enable, acpi_register_gsi fails for GSI 18 
with IRQ 255 (dev->irq), independently from the presence of the 
dell_smo8800 module.

Now looking into this again, seeing dev->irq at 255 seems very 
suspicious here? Doesn't that mean not connected (although I'm not sure 
how this relates to it supposedly having GSI 18)?
>
>> Force the SMBus IRQ to IRQ_NOTCONNECTED in this case, so that
>> we fall back to polling, which also seems to be what the (very
>> dated) Windows 7 drivers on the Dell Latitude E7450 do.
> What makes you think so?
>
According to the Windows 7 device manager IRQ view, the SMBus has no IRQ 
assigned, which I assumed implies that polling is used. If there is 
another way to check this on Windows 7, please let me know.

Cheers,
Marius
