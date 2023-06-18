Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42442734631
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jun 2023 14:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjFRMxC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Jun 2023 08:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjFRMxB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Jun 2023 08:53:01 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8460E5F;
        Sun, 18 Jun 2023 05:52:55 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4QkXqm1VkQz9sjp;
        Sun, 18 Jun 2023 14:52:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mariushoch.de;
        s=MBO0001; t=1687092772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XlGPTTbstQnFGAqOrIapNTlekWsFm28DnNL8CbHdVd0=;
        b=RpKAls7Aibuqbfa+9xhSthLFexlf9163K7BVeT8LEwFzV0zSMPz1Bv79VhVzr8vz+axuPY
        AE0JUKub+hbDE4vY9UcXhZphTrbBZgsAPJpLAubX/CwOk9LPiRYPp6IsqX4nOraUmoN8dN
        q3NbE3AujHBGtCFAjTeMPiBBcJN4LjKbAvxJAyODZfb+BQo5fzhxVtoWxiFzY/oLTP9lEu
        +p1w6PD5HOSL9ZC/e2DhWgUJ70Mi6Q8bZX3NLDiwJRZ1ZC9TaWGFV6tS9GZXNvcts+QCQd
        c6CWxb/iLChVN7NWsbqx0q/rpQMuCRYV/vD2MuBmfDvcWPV2t0LSb2v9kRVFcA==
Message-ID: <9d07309f-9596-2be0-97ab-2bb9ee237c11@mariushoch.de>
Date:   Sun, 18 Jun 2023 14:52:50 +0200
MIME-Version: 1.0
From:   Marius Hoch <mail@mariushoch.de>
Subject: Re: [PATCH 0/2] i2c: i801: Force no IRQ for Dell Latitude E7450
To:     Rudolf Marek <r.marek@assembler.cz>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230514103634.235917-1-mail@mariushoch.de>
 <20230523200350.62ab4788@endymion.delvare>
 <59a6a917-2a93-d52d-37f3-091295dd0db4@mariushoch.de>
 <20230604160132.102dd6a7@endymion.delvare>
 <ae93843f-7ab0-9d10-cf93-261f986962a5@assembler.cz>
Content-Language: en-US
In-Reply-To: <ae93843f-7ab0-9d10-cf93-261f986962a5@assembler.cz>
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

Hi Rudolf,

thanks for the reply.

On 04/06/2023 22:41, Rudolf Marek wrote:
> Hi Jean,
>
> Dne 04. 06. 23 v 16:01 Jean Delvare napsal(a):
>> I admit I don't know. I'm not familiar with how GSI numbers relate to
>> IRQ numbers. I think I understand that GSI numbers are an ACPI thing,
>> and the ACPI layer is responsible for mapping these to actual IRQ
>> numbers? Is there a GSI-to-IRQ table available somewhere as part of the
>> ACPI tables? If so, it would be interesting to disassemble the ACPI
>> tables on your system and check what this looks like for you.
>
> You need to check _PRT method of PCI0 device in APIC mode.
> This will tell you to what GSI (APIC/pin) it goes.
> To check you need to have a look to the DSDT table and decompile
> it. You can obtain it by running acpidump > tables.txt and the 
> acpixtract -a tables.txt
> and finally running iasl -d dsdt.asl.
>
> Then, because the SMBUS lives on bus0, you just need to check _PRT method
> under PCI0 device for the entry of 001fffff (INT C).
> If this entry exists it will tell you where is it connected.
The PCI0 device's _PRT, when PICM is true, returns AR00. That contains:
             Package (0x04)
             {
                 0x001FFFFF,
                 0x02,
                 Zero,
                 0x12
             },

So according to this IRQ (=GSI?) 18 should be used (which, as mentioned 
earlier is also used for the freefall device). (In acpi_pci_irq_enable) 
acpi_register_gsi fails for this (with gsi=18) and afterwards dev->irq 
is at 255 (which might just be an initial value? dev->irq is only set in 
acpi_pci_irq_enable afterwards).

> I assume this has no entry and then as a last chance Linux tries the 
> PCI IRQ entry
> in the configuration space gets queried. And this has 0xff which is
> telling no IRQ connected.
>
> The southbridge has a IRQ routing configuration register which can be 
> used to verify
> if this is routed anywhere or really left "unconnected". This is 
> usually in the the RCBA base + something
> register. Have a look to "D31IP" register:
>
> SMBus Pin (SMIP) — R/W. Indicates which pin the SMBus controller 
> drives as its
> interrupt. bits 15:12
>
> If there is 0, it is not routed anywhere. Also you need to check 
> "D31IR" where the PIN C is going:
>
> Interrupt C Pin Route (ICR) — R/W. Indicates which physical pin on the 
> PCH is
> connected to the INTC# pin reported for device 31 functions.
>
> The PIRQA corresponds to the PIN 16 of IOAPIC etc.
>
> If you need more info on that feel free to contact me. I can try to help.
I skipped these steps (after identifying the _PRT entry) as it seems to 
me that we have a ACPI entry here (it's just not functional), thus this 
information would presumably be of no help.

Further help in debugging this would be much appreciated. In order to 
further see why acpi_register_gsi failed, I also got the irqdomain debug 
output and this also didn't help me (except that it doesn't register a 
domain for our SMBus, like "irq: Added domain IR-PCI-MSI-0000:00:XX").
>
>
> Thanks,
> Rudolf
>

