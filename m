Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D135D73466E
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jun 2023 15:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjFRNmr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Jun 2023 09:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjFRNmq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Jun 2023 09:42:46 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA699B;
        Sun, 18 Jun 2023 06:42:44 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4QkYxF3xdLz9tCs;
        Sun, 18 Jun 2023 15:42:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mariushoch.de;
        s=MBO0001; t=1687095761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PSrpFxRnE90pI/PbBDb75Dg8JDAmYIWPFe9j58pJbEw=;
        b=n5RTdScbHAdjPxBBbrrtAcbJfXpyCpEdsc45UJqW5SMWVDO2v0JyB7oqrXRDeq2IBm1CN4
        yLpXGgTmlWdU12m3ux9Tjbvnzd/esPILmrMD5P3jG9dei8dZA0a5E3TGWkZNJI7diLiFva
        C4afeH4FVyXo/alYMBOriV+aUXnVeTjzqQHpZnfmVcBxSccgHXqLlDpOyoG3dWcVerxC+M
        D+Ie9SqyZcffCpp88gAsbmz+PtO8OYqHntYm4wp6bgpJGGxIpchspMvMTbHqIvyrAi5i1F
        9jGvl8/mSQ2RSaHU7c7DLhMAG7oWwBRNH1KVy1J7JRL5sePraNVGOq/6wKSNWQ==
Message-ID: <967411b3-7013-619e-4fef-90644fa8d489@mariushoch.de>
Date:   Sun, 18 Jun 2023 15:42:40 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] i2c: i801: Force no IRQ for Dell Latitude E7450
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230514103634.235917-1-mail@mariushoch.de>
 <20230523200350.62ab4788@endymion.delvare>
 <59a6a917-2a93-d52d-37f3-091295dd0db4@mariushoch.de>
 <20230604160132.102dd6a7@endymion.delvare>
From:   Marius Hoch <mail@mariushoch.de>
In-Reply-To: <20230604160132.102dd6a7@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

thanks again for all the helpful replies!

On 04/06/2023 16:01, Jean Delvare wrote:
> Hi Marius,
>
> On Sat, 3 Jun 2023 11:24:02 +0200, Marius Hoch wrote:
>> On 23/05/2023 20:03, Jean Delvare wrote:
>>> On Sun, 14 May 2023 12:36:32 +0200, Marius Hoch wrote:
>>>> The Dell Latitude E7450 uses IRQ 18 for the accelerometer,
>>>> but also claims that the SMBus uses IRQ 18. This will
>>>> result in:
>>>>
>>>> i801_smbus 0000:00:1f.3: PCI INT C: failed to register GSI
>>>> i801_smbus 0000:00:1f.3: Failed to enable SMBus PCI device (-16)
>>>> i801_smbus: probe of 0000:00:1f.3 failed with error -16
>>> The i2c-i801 driver supports shared IRQ. If this fails, this means that
>>> the other driver is not passing IRQF_SHARED when registering the
>>> interrupt. Which driver is this? I'd rather check whether sharing the
>>> IRQ is possible, rather that falling back to polling, which has a
>>> performance cost.
>> I don't think this is a conflict rather than a completely bogus entry:
>> smo8800 uses IRQ 18 (the freefall sensor).
> You're probably right. I admit I misread your report originally and
> thought requesting the IRQ was failing. But actually the failure
> happens before that, when enabling the PCI device. So its not related
> to sharing the interrupt.
>
>> For the SMBus in acpi_pci_irq_enable, acpi_register_gsi fails for GSI 18
>> with IRQ 255 (dev->irq), independently from the presence of the
>> dell_smo8800 module.
>>
>> Now looking into this again, seeing dev->irq at 255 seems very
>> suspicious here? Doesn't that mean not connected (although I'm not sure
>> how this relates to it supposedly having GSI 18)?
> I admit I don't know. I'm not familiar with how GSI numbers relate to
> IRQ numbers. I think I understand that GSI numbers are an ACPI thing,
> and the ACPI layer is responsible for mapping these to actual IRQ
> numbers? Is there a GSI-to-IRQ table available somewhere as part of the
> ACPI tables? If so, it would be interesting to disassemble the ACPI
> tables on your system and check what this looks like for you.
>
> If this is a bug in the ACPI data then it might be worth booting with
> acpi=noirq and see if it helps. This option might break other things
> though (like free fall detection or thermal management) so be cautious.
I just booted with acpi=noirq, the PCI device no longer fails to be 
enabled and the device got assigned IRQ 19 now (according to lspci -v/ 
proc/interrupts), while the freefall device remained at IRQ 18.
Interestingly dmesg is full of spam from the freefall device (endlessly 
reporting that freefall got detected, probably indicating a problem in 
IRQ handling, yikes).

Booting without the smo8800 module results in:
[root@fedora ~]# dmesg | grep -i smbus
[   20.042515] i801_smbus 0000:00:1f.3: PCI->APIC IRQ transform: INT C 
-> IRQ 19
[   20.042548] i801_smbus 0000:00:1f.3: SPD Write Disable is set
[   20.042574] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[   20.051270] i801_smbus 0000:00:1f.3: Accelerometer lis3lv02d is 
present on SMBus but its address is unknown, skipping registration
[   20.253942] i801_smbus 0000:00:1f.3: Transaction timeout
[   20.461962] i801_smbus 0000:00:1f.3: Transaction timeout

The "Transaction timeout" messages might indicate that interrupt routing 
isn't actually working?
>
> IRQ number 255 indeed looks suspicious, but I'm also not aware of this
> being a special value (nr_irqs is defined as an unsigned int, which
> suggest that large IRQ numbers, albeit unusual on desktop and laptop
> systems, are supported and frequently seen on large server systems), so
> the i2c-i801 driver has no reason to handle it in a particular way.
>
> Out of curiosity, did you check for a BIOS update for your laptop? Did
> you look at BIOS option to see if by any chance enabling/disabling the
> SMBus interrupt is an option there?
There is a newer BIOS version, yes.
I didn't yet apply it, though. Reading up on the kernel bug, I doubt it 
will fix these issues (it would be interesting to see though, but this 
might make this bug unreproducible for me).
>
> I'm also curious how you collected the IRQ value. Did you boot with
> some debug kernel parameter, like dyndbg="file pci_irq.c +p"?
>
> Did you manage to figure out where in the function call chain (starting
> with pcim_enable_device) the failure actually happens? Even if IRQ
> value 255 is most probably wrong in your case, I'm surprised that this
> causes an error at device activation time, rather than when later
> requesting the IRQ.
I'm not sure anymore IRQ 255 is actually being set from ACPI or PCI 
registers but might just be a pre-initialization value (see my reply to 
Rudolf).
>
>>>> Force the SMBus IRQ to IRQ_NOTCONNECTED in this case, so that
>>>> we fall back to polling, which also seems to be what the (very
>>>> dated) Windows 7 drivers on the Dell Latitude E7450 do.
>>> What makes you think so?
>> According to the Windows 7 device manager IRQ view, the SMBus has no IRQ
>> assigned, which I assumed implies that polling is used. If there is
>> another way to check this on Windows 7, please let me know.
> That's a reasonable assumption, and not being familiar with Windows, I
> don't have any other suggestion. However that doesn't necessarily mean
> that interrupts can't work. After all, the original i2c-i801 Linux
> driver also did not support interrupts.
>
Cheers,
Marius
