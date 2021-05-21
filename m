Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127EE38C8F2
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 16:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235438AbhEUOKy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 10:10:54 -0400
Received: from mga14.intel.com ([192.55.52.115]:43480 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236232AbhEUOKw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 10:10:52 -0400
IronPort-SDR: +eeMFgZGV2JUsXuOAGEtXsFP9ACO9phziRUlN5HRGQMXFJw6IFz820R4YOryxqxIMdndcdcIV7
 5b8uAiuwRABw==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="201200695"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="201200695"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 07:09:26 -0700
IronPort-SDR: nk+7WWZBtJVl0i92iS7gXZwt0A60gbUMRRoTZnE9L4drx61JYJHnfSIG/tFsC0YSX8MHdh8a5C
 4BgRVUWE5l+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="441094755"
Received: from unknown (HELO [10.237.72.56]) ([10.237.72.56])
  by fmsmga008.fm.intel.com with ESMTP; 21 May 2021 07:09:25 -0700
Subject: Re: i801_smbus: no runtime pm since a9c8088c7988 ("i2c: i801: Don't
 restore config registers on runtime PM")
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
References: <a9ad7cb4-ca40-1c25-9c9a-f7f167ad8be9@gmail.com>
 <b61f2014-fa9d-f63a-7ea2-3c9226411a58@gmail.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <dcb18f97-fdb5-516b-bbad-c61defd23915@linux.intel.com>
Date:   Fri, 21 May 2021 17:09:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b61f2014-fa9d-f63a-7ea2-3c9226411a58@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 5/21/21 4:26 PM, Heiner Kallweit wrote:
> On 21.05.2021 10:19, Heiner Kallweit wrote:
>> Before the referenced commit we used i801_suspend and i801_resume also as
>> runtime pm callbacks. That's no longer the case, and at least on my
>> platform the SMBus controller PCI device doesn't support PM. Therefore
>> PCI core can't do what it would do for other devices: bring them to D3hot
>> or D3cold.
>> Having said that effectively there is no runtime pm any longer. Not sure
>> whether there are SMBus controller versions where the PCI device supports
>> PM.
>>
About commit a9c8088c7988 which removes the runtime PM callbacks: It 
indeed had a runtime PM regression but is fixed by commit c5eb1190074c 
("PCI / PM: Allow runtime PM without callback functions").

>> So my questions are:
>> Does the SMBus controller support any power-saving modes?
>> i801_suspend() just sets SMBHSTCFG to the value it had when the driver
>> was loaded. Means if SMBHSTCFG_HST_EN was enabled already, we won't clear
>> it. And this bit may have an impact on some internal PLL's (just guessing).
>> If there's no good-enough power-saving option, then runtime pm support
>> could be removed completely, or?
>>
>>
>> 00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
>>          DeviceName: Onboard - Other
>>          Subsystem: ASUSTeK Computer Inc. Device 8694
>>          Flags: medium devsel, IRQ 16
>>          Memory at a1316000 (64-bit, non-prefetchable) [size=256]
>>          I/O ports at efa0 [size=32]
>>          Kernel driver in use: i801_smbus
>>          Kernel modules: i2c_i801
>>
It's not entirely clear to me either is it HW or FW specific what 
platform supports PCI PM for the SMBus controller. But usually what I've 
seen Core based platforms don't have it while *some* Atom based does have.

I saw your message earlier today and was looking at from our lab 
machines which have it. I'm quite sure but not absolutely one Apollo 
Lake one had it but today didn't see it. Need to check with colleagues 
did they change BIOS etc. Or I just remember wrong :-)

Fortunately one Braswell based have the PM. Here's the lspic output from 
kernel 5.13.0-rc2:

# lspci -s 00:1f.3 -vv
00:1f.3 SMBus: Intel Corporation Atom/Celeron/Pentium Processor 
x5-E8000/J3xxx/N3xxx SMBus Controller (rev 31)
     Subsystem: Intel Corporation Atom/Celeron/Pentium Processor 
x5-E8000/J3xxx/N3xxx SMBus Controller
     Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx-
     Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Interrupt: pin B routed to IRQ 18
     Region 0: Memory at 9191c000 (32-bit, non-prefetchable) [size=32]
     Region 4: I/O ports at 2040 [size=32]
     Capabilities: [50] Power Management version 3
         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
         Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
     Kernel driver in use: i801_smbus
     Kernel modules: i2c_i801

So the PCI device needs to have Power Management capability and here the 
current status is SMBus controller is suspended to D3 state.

Jarkko
