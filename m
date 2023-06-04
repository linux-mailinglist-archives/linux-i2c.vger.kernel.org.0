Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF83B7219FE
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jun 2023 22:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjFDUtw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jun 2023 16:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbjFDUtv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jun 2023 16:49:51 -0400
X-Greylist: delayed 510 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 04 Jun 2023 13:49:49 PDT
Received: from mail2.medvecky.net (mail2.medvecky.net [85.118.132.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AD0DB;
        Sun,  4 Jun 2023 13:49:49 -0700 (PDT)
Message-ID: <ae93843f-7ab0-9d10-cf93-261f986962a5@assembler.cz>
Date:   Sun, 4 Jun 2023 22:41:15 +0200
MIME-Version: 1.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>, Marius Hoch <mail@mariushoch.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230514103634.235917-1-mail@mariushoch.de>
 <20230523200350.62ab4788@endymion.delvare>
 <59a6a917-2a93-d52d-37f3-091295dd0db4@mariushoch.de>
 <20230604160132.102dd6a7@endymion.delvare>
From:   Rudolf Marek <r.marek@assembler.cz>
Subject: Re: [PATCH 0/2] i2c: i801: Force no IRQ for Dell Latitude E7450
In-Reply-To: <20230604160132.102dd6a7@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: mail2.medvecky.net;
        auth=pass smtp.mailfrom=r.marek@assembler.cz
X-Spamd-Bar: /
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

Dne 04. 06. 23 v 16:01 Jean Delvare napsal(a):
> I admit I don't know. I'm not familiar with how GSI numbers relate to
> IRQ numbers. I think I understand that GSI numbers are an ACPI thing,
> and the ACPI layer is responsible for mapping these to actual IRQ
> numbers? Is there a GSI-to-IRQ table available somewhere as part of the
> ACPI tables? If so, it would be interesting to disassemble the ACPI
> tables on your system and check what this looks like for you.

You need to check _PRT method of PCI0 device in APIC mode.
This will tell you to what GSI (APIC/pin) it goes.
To check you need to have a look to the DSDT table and decompile
it. You can obtain it by running acpidump > tables.txt and the acpixtract -a tables.txt
and finally running iasl -d dsdt.asl.

Then, because the SMBUS lives on bus0, you just need to check _PRT method
under PCI0 device for the entry of 001fffff (INT C).
If this entry exists it will tell you where is it connected.

I assume this has no entry and then as a last chance Linux tries the PCI IRQ entry
in the configuration space gets queried. And this has 0xff which is
telling no IRQ connected.

The southbridge has a IRQ routing configuration register which can be used to verify
if this is routed anywhere or really left "unconnected". This is usually in the the RCBA base + something
register. Have a look to "D31IP" register:

SMBus Pin (SMIP) — R/W. Indicates which pin the SMBus controller drives as its
interrupt. bits 15:12

If there is 0, it is not routed anywhere. Also you need to check "D31IR" where the PIN C is going:

Interrupt C Pin Route (ICR) — R/W. Indicates which physical pin on the PCH is
connected to the INTC# pin reported for device 31 functions.

The PIRQA corresponds to the PIN 16 of IOAPIC etc.

If you need more info on that feel free to contact me. I can try to help.


Thanks,
Rudolf

