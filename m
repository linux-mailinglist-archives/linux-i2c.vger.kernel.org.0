Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D491681AA2
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jan 2023 20:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238181AbjA3Tgi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Jan 2023 14:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238162AbjA3Tgh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Jan 2023 14:36:37 -0500
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D3C457F5
        for <linux-i2c@vger.kernel.org>; Mon, 30 Jan 2023 11:36:34 -0800 (PST)
Received: (wp-smtpd smtp.tlen.pl 17953 invoked from network); 30 Jan 2023 20:36:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1675107389; bh=UyKtUMbpANagZPJgK41JJdqAs0OhCdcq4VyL4hUrWuc=;
          h=Subject:To:Cc:From;
          b=ba4tgOkwBVNoc0WIoR3lFKvWeupEenBrJf5IrRgTV0osUw2B/BT8jeAPbKSqqMO3J
           1JdWVwHj89xQ1XkL7rK6+Hw+HaKoYX7yhUhO7IsLwIqFc9z5pRUCxzi2z0JrIlI/Sg
           Lv8NMwWSVquixZ8A6LxS6aVL7ZHfKcjdZMUzf7zY=
Received: from aaew240.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.126.240])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rafael@kernel.org>; 30 Jan 2023 20:36:29 +0100
Message-ID: <b1680e2b-ee84-528b-cd37-e87f5cbce00c@o2.pl>
Date:   Mon, 30 Jan 2023 20:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 RESEND] acpi,pci: warn about duplicate IRQ routing
 entries returned from _PRT
Content-Language: en-GB
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
References: <0113ca60-acf2-f4db-3230-959e9bb15726@o2.pl>
 <20230123214414.GA987407@bhelgaas>
 <CAJZ5v0hTXAdM5oC_5cFF0pZU5QKaaqcsY4rADXJhAkAa0s=4Kw@mail.gmail.com>
From:   =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>
In-Reply-To: <CAJZ5v0hTXAdM5oC_5cFF0pZU5QKaaqcsY4rADXJhAkAa0s=4Kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 1be2d073899174d247f2b1f61622b989
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000003 [cWDF]                               
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W dniu 30.01.2023 o 16:56, Rafael J. Wysocki pisze:
> On Mon, Jan 23, 2023 at 10:44 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>> On Mon, Jan 23, 2023 at 10:00:43PM +0100, Mateusz Jończyk wrote:
>>> W dniu 23.01.2023 o 21:33, Bjorn Helgaas pisze:
>>>> On Sat, Jan 21, 2023 at 04:33:14PM +0100, Mateusz Jończyk wrote:
>>>>> On some platforms, the ACPI _PRT function returns duplicate interrupt
>>>>> routing entries. Linux uses the first matching entry, but sometimes the
>>>>> second matching entry contains the correct interrupt vector.
>>>>>
>>>>> Print an error to dmesg if duplicate interrupt routing entries are
>>>>> present, so that we could check how many models are affected.
>>>> It shouldn't be too hard to use qemu to figure out whether Windows
>>>> uses the last matching entry, i.e., treating _PRT entries as
>>>> assignments.  If so, maybe Linux could just do the same.
>>>>
>>>> Is anybody up for that?
>>> The hardware in question has a working Windows XP installation,
>>> and I could in theory check which interrupt vector it uses - but
>>> I think that such reverse engineering is forbidden by Windows' EULA.
>> I'm not talking about any sort of disassembly or anything like that;
>> just that we can observe what Windows does given the _PRT contents.
>> You've already figured out that on your particular hardware, the _PRT
>> has two entries, and Linux uses the first one while Windows uses the
>> second one, right?
>>
>> On qemu, we have control over the BIOS and can easily update _PRT to
>> whatever we want, and then we could boot Windows and see what it uses.
>> But I guess maybe that wouldn't tell us anything more than what you
>> already discovered.
>>
>> So my inclination would be to make Linux use the last matching entry.
> But it would be able to log a diagnostic message anyway IMO.
>
> So maybe two steps can be taken here, (1) adding the message printout
> (this patch) and (2) changing the behavior?

I have checked and Windows XP uses a different interrupt number for
the device than both numbers from the table returned by the _PRT
method (the correct and the incorrect ones).

It uses IRQ3, as shown in the Device Manager and in HWiNFO32 output:

    Intel 82801IB ICH9 - SMBus Controller [A3] --------------------------------

     [General Information]
      Device Name:                            Intel 82801IB ICH9 - SMBus Controller [A3]
      Original Device Name:                   Intel 82801IB ICH9 - SMBus Controller [A3]
      Device Class:                           SMBus (System Management Bus)
      Revision ID:                            3 [A3]
      PCI Address (Bus:Device:Function) Number: 0:31:3
      PCI Latency Timer:                      0
      Hardware ID:                            PCI\VEN_8086&DEV_2930&SUBSYS_024F1028&REV_03
     [System Resources]
      Interrupt Line:                         IRQ3
      Interrupt Pin:                          INTB#
      Memory Base Address 0                   F6ADAF00
      I/O Base Address 4                      1100
     [Features]
      Bus Mastering:                          Disabled
      Running At 66 MHz:                      Not Capable
      Fast Back-to-Back Transactions:         Capable
      DeviceInstanceId                        PCI\VEN_8086&DEV_2930&SUBSYS_024F1028&REV_03\3&61AAA01&0&FB

Unpatched Linux kernel uses IRQ19, which is incorrect; the correct vector (under Linux at least) is IRQ17. On the other hand, HWiNFO32 has neatly decoded contents of the SPD EEPROMs, which are connected to the SMBus controller in question. So either: 1. Windows' driver (or driver from HWiNFO32 perhaps?) does not use interrupts for the device. 2. Windows somehow has reassigned the interrupt vector for the device. The datasheet [1] indicates it is possible (page 375, Device 31 Interrupt Route Register), but I'm not sure if the interrupt can be reassigned to such a low number. So all in all, I would suggest shipping a patch that only prints a warning for a release or two before changing the default. Greetings, Mateusz [1] https://www.intel.com/content/www/us/en/io/io-controller-hub-9-datasheet.html

