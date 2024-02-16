Return-Path: <linux-i2c+bounces-1844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0098586A1
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 21:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4BFEB21ED0
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 20:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C99513957E;
	Fri, 16 Feb 2024 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b="Jib9uMGo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C6E138496
	for <linux-i2c@vger.kernel.org>; Fri, 16 Feb 2024 20:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708114823; cv=none; b=p7OMFL8S1OqR5El78KmJ4swVNptB3Lv2mRVYEWOLZh3zNREtU99iipQX/blQD/Uoc78zWq8RNBsQmoM6rkc5NfSptQcJbilm4LggsRge+6o0iVCA1xxXUXKwIkLYyQCJ3JXga5uODyQjzgb07YjE+3Ye11ghrLA5gIpd4jl9KCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708114823; c=relaxed/simple;
	bh=K/h1DiJQZpuXmKZCBLykYam4RQ5/rwmjbzvVMNkW5OU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AR9xVriP8qAcDMg4QPu7Lx/u/N1bpU1IHpopW+Brw2kbuILL1ktBEgg183LEgJ5wTxXJn7Ts2/QSmvukeABuTmPvdxePjpVEhoAh0PE/nd9Su7NDcIJlAx24xHeKDVMdeP1+F/Ym/sx2qqs4svye1JK43CV0qy1awsiMiZLR2jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b=Jib9uMGo; arc=none smtp.client-ip=193.222.135.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 17528 invoked from network); 16 Feb 2024 21:20:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1708114809; bh=qmYllgnwKksRx5/Imr5XsNxmytwFQiqpm7EidwFAVVU=;
          h=Subject:To:Cc:From;
          b=Jib9uMGoYCv+XdfnuLL+E0b6/X8TnX6dmdXwEq52OzPhq9JBbk/IQODFpn9XkcvHv
           9QLazsNdhc+YMrbOXcSZX9uibHfoO+Lw6mZ9+e+3L7Ktg3BEgqCchbrpzC4elLgHgL
           bbqg4JTKfb2sIXvwXbBkWH0ntrfNQCRyuJ7Ob234=
Received: from aafh184.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.137.184])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <helgaas@kernel.org>; 16 Feb 2024 21:20:09 +0100
Message-ID: <520eaafc-e723-49d4-8a6b-375fc64dd511@o2.pl>
Date: Fri, 16 Feb 2024 21:20:06 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] acpi,pci: warn about duplicate IRQ routing entries
 returned from _PRT
Content-Language: en-GB
To: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Jean Delvare <jdelvare@suse.de>, Borislav Petkov <bp@alien8.de>
References: <20240216184946.GA1349514@bhelgaas>
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
In-Reply-To: <20240216184946.GA1349514@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 4ac63e82f2f54a09f826c6db96293531
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [8XOF]                               

W dniu 16.02.2024 o 19:49, Bjorn Helgaas pisze:
> On Fri, Feb 16, 2024 at 07:26:06PM +0100, Rafael J. Wysocki wrote:
>> On Tue, Dec 26, 2023 at 1:50 PM Mateusz Jończyk <mat.jonczyk@o2.pl> wrote:
>>> On some platforms, the ACPI _PRT function returns duplicate interrupt
>>> routing entries. Linux uses the first matching entry, but sometimes the
>>> second matching entry contains the correct interrupt vector.
>>>
>>> As a debugging aid, print a warning to dmesg if duplicate interrupt
>>> routing entries are present. This way, we could check how many models
>>> are affected.
>>>
>>> This happens on a Dell Latitude E6500 laptop with the i2c-i801 Intel
>>> SMBus controller. This controller is nonfunctional unless its interrupt
>>> usage is disabled (using the "disable_features=0x10" module parameter).
>>>
>>> After investigation, it turned out that the driver was using an
>>> incorrect interrupt vector: in lspci output for this device there was:
>>>         Interrupt: pin B routed to IRQ 19
>>> but after running i2cdetect (without using any i2c-i801 module
>>> parameters) the following was logged to dmesg:
>>>
>>>         [...]
>>>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>>>         i801_smbus 0000:00:1f.3: Transaction timeout
>>>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>>>         i801_smbus 0000:00:1f.3: Transaction timeout
>>>         irq 17: nobody cared (try booting with the "irqpoll" option)
>>>
>>> Existence of duplicate entries in a table returned by the _PRT method
>>> was confirmed by disassembling the ACPI DSDT table.
>>>
>>> Windows XP is using IRQ3 (as reported by HWiNFO32 and in the Device
>>> Manager), which is neither of the two vectors returned by _PRT.
>>> As HWiNFO32 decoded contents of the SPD EEPROMs, the i2c-i801 device is
>>> working under Windows. It appears that Windows has reconfigured the
>>> chipset independently to use another interrupt vector for the device.
>>> This is possible, according to the chipset datasheet [1], page 436 for
>>> example (PIRQ[n]_ROUT—PIRQ[A,B,C,D] Routing Control Register).
>>>
>>> [1] https://www.intel.com/content/dam/doc/datasheet/io-controller-hub-9-datasheet.pdf
>>>
>>> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
>>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>>> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>>> Cc: Len Brown <lenb@kernel.org>
>>> Cc: Borislav Petkov <bp@suse.de>
>>> Cc: Jean Delvare <jdelvare@suse.de>
>>> Previously-reviewed-by: Jean Delvare <jdelvare@suse.de>
>>> Previously-tested-by: Jean Delvare <jdelvare@suse.de>
>>>
>>> ---
>>> Hello,
>>>
>>> I'm resurrecting an older patch that was discussed back in January:
>>>
>>> https://lore.kernel.org/lkml/20230121153314.6109-1-mat.jonczyk@o2.pl/T/#u
>>>
>>> To consider: should we print a warning or an error in case of duplicate
>>> entries? This may not be serious enough to disturb the user with an
>>> error message at boot.
>>>
>>> I'm also looking into modifying the i2c-i801 driver to disable its usage
>>> of interrupts if one did not fire.
>>>
>>> v2: - add a newline at the end of the kernel log message,
>>>     - replace: "if (match == NULL)" -> "if (!match)"
>>>     - patch description tweaks.
>>> v3: - fix C style issues pointed by Jean Delvare,
>>>     - switch severity from warning to error.
>>> v3 RESEND: retested on top of v6.2-rc4
>>> v4: - rebase and retest on top of v6.7-rc7
>>>     - switch severity back to warning,
>>>     - change pr_err() to dev_warn() and simplify the code,
>>>     - modify patch description (describe Windows behaviour etc.)
>>> ---
>>>  drivers/acpi/pci_irq.c | 25 ++++++++++++++++++++++---
>>>  1 file changed, 22 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
>>> index ff30ceca2203..1fcf72e335b0 100644
>>> --- a/drivers/acpi/pci_irq.c
>>> +++ b/drivers/acpi/pci_irq.c
>>> @@ -203,6 +203,8 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev *dev,
>>>         struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>>>         struct acpi_pci_routing_table *entry;
>>>         acpi_handle handle = NULL;
>>> +       struct acpi_prt_entry *match = NULL;
>>> +       const char *match_int_source = NULL;
>>>
>>>         if (dev->bus->bridge)
>>>                 handle = ACPI_HANDLE(dev->bus->bridge);
>>> @@ -219,13 +221,30 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev *dev,
>>>
>>>         entry = buffer.pointer;
>>>         while (entry && (entry->length > 0)) {
>>> -               if (!acpi_pci_irq_check_entry(handle, dev, pin,
>>> -                                                entry, entry_ptr))
>>> -                       break;
>>> +               struct acpi_prt_entry *curr;
>>> +
>>> +               if (!acpi_pci_irq_check_entry(handle, dev, pin, entry, &curr)) {
>>> +                       if (!match) {
>>> +                               match = curr;
>>> +                               match_int_source = entry->source;
>>> +                        } else {
>>> +                               dev_warn(&dev->dev, FW_BUG
>> dev_info() would be sufficient here IMV.
>>
>>> +                                      "ACPI _PRT returned duplicate IRQ routing entries for INT%c: %s[%d] and %s[%d]\n",
>>> +                                      pin_name(curr->pin),
>>> +                                      match_int_source, match->index,
>>> +                                      entry->source, curr->index);
>>> +                               /* We use the first matching entry nonetheless,
>>> +                                * for compatibility with older kernels.
> The usual comment style in this file is:
>
>   /*
>    * We use ...
>    */
>
>>> +                                */
>>> +                       }
>>> +               }
>>> +
>>>                 entry = (struct acpi_pci_routing_table *)
>>>                     ((unsigned long)entry + entry->length);
>>>         }
>>>
>>> +       *entry_ptr = match;
>>> +
>>>         kfree(buffer.pointer);
>>>         return 0;
>>>  }
>>>
>>> base-commit: 861deac3b092f37b2c5e6871732f3e11486f7082
>>> --
>> Bjorn, any concerns regarding this one?
> No concerns from me.  
>
> I guess this only adds a message, right?  It doesn't actually fix
> anything or change any behavior?
Exactly.
> This talks about "duplicate" entries, which suggests to me that they
> are identical, but I don't think they are.  It sounds like it's two
> "matching" entries, i.e., two entries for the same (device, pin)?

Right.

> And neither of the two _PRT entries yields a working i801 device?

Unpatched Linux uses the first matching entry, but the second one gives
a working i801 device. The point is to print a warning message to see
how many devices are affected and whether it is safe to switch the code
to use the last matching entry in all instances.

Therefore I used dev_warn().

> Bjorn

Greetings,

Mateusz


