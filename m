Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968C038C99C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 16:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbhEUPAC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 11:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbhEUPAC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 11:00:02 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2EECC061574
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 07:58:38 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a4so21421486wrr.2
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ON3Ax4AhK2BLd8xBY8apWmbzaZJYmeJZ32DPmpTdXHI=;
        b=rOpJO9U4VYkYBrrOqb96FauIVkR26Ua5IbXyv1ig8lXJ4v9OU2XVfY2EawH42rWU0v
         EzuyFmtdpTY8anbuugg5nxxCekbWpA4sUwaVI5bDyfFKGoOc1pV+aly++rXGpJCeHT7S
         /qtBb/iA1k5oESf2V/XUgznmoSr4ORA84yBb07OiGIf7NWJ8kYBv+oSBXlkispWJ6b/z
         Iv4cmXj2ND6ed7wxkSpNceTRU0caV1lgCsR63fnyhBb00RwfDl4c5aNTizzLfD1OpqTv
         79pcQO7HmEUZ8fEAuxtRJlUTg2lHM+wKfZhPNcRgNtWGgPHXZtf1pmOIKf7HTYIa2buM
         YbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ON3Ax4AhK2BLd8xBY8apWmbzaZJYmeJZ32DPmpTdXHI=;
        b=Xi5KkaXIujOHrMI9+sOoJIvdXiKsJpGm46n3DcbgOX8ic1924b0rmf+WZqmY/0xx2Q
         Pcd8VHqDxC4T/D59VSDskmtNA6hqs1T4o+hn43ADPSE4mzPIxzyLQ27vHzZBKDSWzhiC
         CCgfsFrZ8TQWS+RHxGXP6MRgSYjGb0EXQITNEi6es7CqH7ZYYDunKEzyAVXR/pcRSZgS
         AKUfcJvTXebkTaMh+M6J8Lm6+i3woSJ6jLmEp0q/jbNAhUlgcE6MXOoUhpQvKTwJo8Ei
         B/g0YXmX1xogA35kY2pZ/gv+79T40OhuPH2l5RNIorASfjfcKre+nWxhrdpXsnkJYAZy
         xVQA==
X-Gm-Message-State: AOAM532N3c87b9wlyWeY9ckFgKDuIWxHNFp+HPkRs81CL+DZ5nogUgAx
        R6apC39s5eBZEvA7fh30sQGy8T/pHa8=
X-Google-Smtp-Source: ABdhPJy0daG6MKpmugULd6Y5jxvTOiVgsNUkekzKOFV/wOE57FCrZaydDcXoZXArwlPPe2yFhiU2QQ==
X-Received: by 2002:a5d:4843:: with SMTP id n3mr9814032wrs.411.1621609117530;
        Fri, 21 May 2021 07:58:37 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:9d15:18e:4e9:7e3? (p200300ea8f3846009d15018e04e907e3.dip0.t-ipconnect.de. [2003:ea:8f38:4600:9d15:18e:4e9:7e3])
        by smtp.googlemail.com with ESMTPSA id m11sm2234958wri.44.2021.05.21.07.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 07:58:36 -0700 (PDT)
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
References: <a9ad7cb4-ca40-1c25-9c9a-f7f167ad8be9@gmail.com>
 <b61f2014-fa9d-f63a-7ea2-3c9226411a58@gmail.com>
 <dcb18f97-fdb5-516b-bbad-c61defd23915@linux.intel.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: i801_smbus: no runtime pm since a9c8088c7988 ("i2c: i801: Don't
 restore config registers on runtime PM")
Message-ID: <edf5ff46-834a-86dc-a9f9-7682e1ecb346@gmail.com>
Date:   Fri, 21 May 2021 16:58:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <dcb18f97-fdb5-516b-bbad-c61defd23915@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21.05.2021 16:09, Jarkko Nikula wrote:
> Hi
> 
> On 5/21/21 4:26 PM, Heiner Kallweit wrote:
>> On 21.05.2021 10:19, Heiner Kallweit wrote:
>>> Before the referenced commit we used i801_suspend and i801_resume also as
>>> runtime pm callbacks. That's no longer the case, and at least on my
>>> platform the SMBus controller PCI device doesn't support PM. Therefore
>>> PCI core can't do what it would do for other devices: bring them to D3hot
>>> or D3cold.
>>> Having said that effectively there is no runtime pm any longer. Not sure
>>> whether there are SMBus controller versions where the PCI device supports
>>> PM.
>>>
> About commit a9c8088c7988 which removes the runtime PM callbacks: It indeed had a runtime PM regression but is fixed by commit c5eb1190074c ("PCI / PM: Allow runtime PM without callback functions").
> 
>>> So my questions are:
>>> Does the SMBus controller support any power-saving modes?
>>> i801_suspend() just sets SMBHSTCFG to the value it had when the driver
>>> was loaded. Means if SMBHSTCFG_HST_EN was enabled already, we won't clear
>>> it. And this bit may have an impact on some internal PLL's (just guessing).
>>> If there's no good-enough power-saving option, then runtime pm support
>>> could be removed completely, or?
>>>
>>>
>>> 00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
>>>          DeviceName: Onboard - Other
>>>          Subsystem: ASUSTeK Computer Inc. Device 8694
>>>          Flags: medium devsel, IRQ 16
>>>          Memory at a1316000 (64-bit, non-prefetchable) [size=256]
>>>          I/O ports at efa0 [size=32]
>>>          Kernel driver in use: i801_smbus
>>>          Kernel modules: i2c_i801
>>>
> It's not entirely clear to me either is it HW or FW specific what platform supports PCI PM for the SMBus controller. But usually what I've seen Core based platforms don't have it while *some* Atom based does have.
> 
> I saw your message earlier today and was looking at from our lab machines which have it. I'm quite sure but not absolutely one Apollo Lake one had it but today didn't see it. Need to check with colleagues did they change BIOS etc. Or I just remember wrong :-)
> 
> Fortunately one Braswell based have the PM. Here's the lspic output from kernel 5.13.0-rc2:
> 
> # lspci -s 00:1f.3 -vv
> 00:1f.3 SMBus: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx SMBus Controller (rev 31)
>     Subsystem: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx SMBus Controller
>     Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>     Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Interrupt: pin B routed to IRQ 18
>     Region 0: Memory at 9191c000 (32-bit, non-prefetchable) [size=32]
>     Region 4: I/O ports at 2040 [size=32]
>     Capabilities: [50] Power Management version 3
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>         Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     Kernel driver in use: i801_smbus
>     Kernel modules: i2c_i801
> 
> So the PCI device needs to have Power Management capability and here the current status is SMBus controller is suspended to D3 state.
> 
Thanks for the quick reply. Good to know there are actually some SMBus controllers in the family that
support PCI PM. Theoretically we could add PCI PM support to the feature bitmap and enable runtime pm
based on the feature, but this may not be worth the effort (as it doesn't really hurt on other systems).


> Jarkko

Heiner
