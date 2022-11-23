Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEDFF636B26
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 21:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239768AbiKWUc3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 15:32:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239776AbiKWUbR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 15:31:17 -0500
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.148])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD1631ECA
        for <linux-i2c@vger.kernel.org>; Wed, 23 Nov 2022 12:28:15 -0800 (PST)
Received: (wp-smtpd smtp.tlen.pl 5473 invoked from network); 23 Nov 2022 21:28:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1669235291; bh=4B+0gVhfeVMpr3xVWJpkPm7YJRc30ybzLuOA8k2a714=;
          h=From:Subject:To:Cc;
          b=Ce865vWNuhQr/TnVnyy1/+H8fh52Y3QBMV5MoOSY7SO8/PbBmJXmOQJXZe6PngaE9
           MpsoFfXNDHkMCNFevc62TrSKI6oQ4HNoN6uMvnYqd7IaFKFo4p5LAinmh8V73xNUTZ
           TxT4hdsEZBD/tu14YsLgmpRkxHGkKFoISy/649wU=
Received: from aafn183.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.143.183])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <jdelvare@suse.de>; 23 Nov 2022 21:28:11 +0100
Message-ID: <140691e3-9c3d-4855-ad21-ec96e77e6693@o2.pl>
Date:   Wed, 23 Nov 2022 21:28:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From:   =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>
Subject: Re: [PATCH v2] acpi,pci: warn about duplicate IRQ routing entries
 returned from _PRT
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>
References: <20221112200927.7255-1-mat.jonczyk@o2.pl>
 <20221113173442.5770-1-mat.jonczyk@o2.pl>
 <20221115093617.519f3aeb@endymion.delvare>
Content-Language: en-GB
In-Reply-To: <20221115093617.519f3aeb@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: dfc6105109ff66cb953bd9e99eb03b64
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000002 [8eGW]                               
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

W dniu 15.11.2022 o 09:36, Jean Delvare pisze:
> Hi Mateusz,
>
> On Sun, 13 Nov 2022 18:34:42 +0100, Mateusz Jończyk wrote:
>> On some platforms, the ACPI _PRT function returns duplicate interrupt
>> routing entries. Linux uses the first matching entry, but sometimes the
>> second matching entry contains the correct interrupt vector.
>>
>> Print a warning to dmesg if duplicate interrupt routing entries are
>> present, so that we could check how many models are affected.
> Excellent idea. We want hardware manufacturers to fix such bugs in the
> firmware, and the best way for this to happen is to report them
> whenever they are encountered.
>
>> This happens on a Dell Latitude E6500 laptop with the i2c-i801 Intel
>> SMBus controller. This controller was nonfunctional unless its interrupt
>> usage was disabled (using the "disable_features=0x10" module parameter).
>>
>> After investigation, it turned out that the driver was using an
>> incorrect interrupt vector: in lspci output for this device there was:
>>         Interrupt: pin B routed to IRQ 19
>> but after running i2cdetect (without using any i2c-i801 module
>> parameters) the following was logged to dmesg:
>>
>>         [...]
>>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>>         i801_smbus 0000:00:1f.3: Transaction timeout
>>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>>         i801_smbus 0000:00:1f.3: Transaction timeout
>>         irq 17: nobody cared (try booting with the "irqpoll" option)
>>
>> Existence of duplicate entries in a table returned by the _PRT method
>> was confirmed by disassembling the ACPI DSDT table.
> Excuse a probably stupid question, but what would happen if we would
> plain ignore the IRQ routing information from ACPI in this case? Would
> we fallback to some pure-PCI routing logic which may have a chance to
> find the right IRQ routing (matching the second ACPI routing entry in
> this case)?

From what I understand, the PCI IRQ routing information is not discoverable
by probing the hardware (in the general case), it has to be obtained from
the ACPI tables (or perhaps from the obsolete MP tables, also provided by
firmware). See https://docs.kernel.org/PCI/acpi-info.html :

> For example, there’s no standard hardware mechanism for enumerating PCI
> host bridges, so the ACPI namespace must describe each host bridge,
> the method for accessing PCI config space below it, the address space
> windows the host bridge forwards to PCI (using _CRS), and the routing
> of legacy INTx interrupts (using _PRT).

(a PCI host bridge connects the CPU cores to the PCI bus, it is the root of the PCI
device tree. This patch concerns the "legacy INTx interrupts" as above).

In the case of this particular laptop, however, it should be possible to obtain
the information by reading chipset registers, which are documented at
https://www.intel.com/content/www/us/en/io/io-controller-hub-9-datasheet.html
But this is difficult to implement in every case.

>> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>> Cc: Len Brown <lenb@kernel.org>
>> Cc: Borislav Petkov <bp@suse.de>
>> Cc: Jean Delvare <jdelvare@suse.com>
>>
>> --
>> v2: - add a newline at the end of the kernel log message,
>>     - replace: "if (match == NULL)" -> "if (!match)"
>>     - patch description tweaks.
>>
>> Tested on two computers, including the affected Dell Latitude E6500 laptop.
>>
>>  drivers/acpi/pci_irq.c | 25 ++++++++++++++++++++++---
>>  1 file changed, 22 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
>> index 08e15774fb9f..a4e41b7b71ed 100644
>> --- a/drivers/acpi/pci_irq.c
>> +++ b/drivers/acpi/pci_irq.c
>> @@ -203,6 +203,8 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev *dev,
>>  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>>  	struct acpi_pci_routing_table *entry;
>>  	acpi_handle handle = NULL;
>> +	struct acpi_prt_entry *match = NULL;
>> +	const char *match_int_source = NULL;
>>  
>>  	if (dev->bus->bridge)
>>  		handle = ACPI_HANDLE(dev->bus->bridge);
>> @@ -219,13 +221,30 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev *dev,
>>  
>>  	entry = buffer.pointer;
>>  	while (entry && (entry->length > 0)) {
>> -		if (!acpi_pci_irq_check_entry(handle, dev, pin,
>> -						 entry, entry_ptr))
>> -			break;
>> +		struct acpi_prt_entry *curr;
>> +
>> +		if (!acpi_pci_irq_check_entry(handle, dev, pin, entry, &curr)) {
>> +			if (!match) {
>> +				match = curr;
>> +				match_int_source = entry->source;
>> +			} else {
>> +				pr_warn(FW_BUG
>> +				"ACPI _PRT returned duplicate IRQ routing entries for device "
>> +					"%04x:%02x:%02x[INT%c]: %s[%d] and %s[%d].\n",
> The beginning of the string should be aligned with the opening
> parenthesis, and the string should be on a single line (this is a
> encouraged exception to the 80-column rule). I would also omit the
> tailing dot for consistency.
OK
>> +					curr->id.segment, curr->id.bus, curr->id.device,
> Is the IRQ per PCI device, or per PCI function? If the latter, then you
> should print "%02x.%x" instead of just "%02x", with the extra element
> being curr->id.function.

This is per PCI device.

[snip]

> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Tested-by: Jean Delvare <jdelvare@suse.de>
>
> (Tested on a Dell OptiPlex 9020 not affected by the problem.)
>
Thank you for reviewing.

Greetings,

Mateusz

