Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36244493D93
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 16:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355882AbiASPrA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 10:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355624AbiASPq4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 10:46:56 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF5FC061574;
        Wed, 19 Jan 2022 07:46:56 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id e81so4745381oia.6;
        Wed, 19 Jan 2022 07:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LnWfVRfNsWhn3KCKfkXN1IPDGRcjwiXW3hktOQD1t2c=;
        b=DGdvkYeVNv4oLdoNZFXAcIQrBVGwi1LW0pO1aw1PUyTMzM/x7RTnx9WbMElqfYkHto
         9A+m+qNAwb5h8eJZfNU+JiOHzqvJ3Gx8nAt4bpnF5R/SjSigbffSUynmoeU/jZh0/V4e
         NiemJVFd61ZMqGiuPPGIIWv6aiqWZ4WLlXzOodhtuJeFs5FkxTzDtfso80ILD04zJdQu
         ZwMfoTVzzrvn1GWuYHG653iJH0nO/a9Wby1LPNYTrD4JK/FdgBfBt/n6egVPpSmvoFNm
         UFunnqgnDVno/mjWEYf90clfQ4sa0IjicYcXmy9WbpycDOUv6t9sILI+Y+D5PUeFGJtn
         NMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LnWfVRfNsWhn3KCKfkXN1IPDGRcjwiXW3hktOQD1t2c=;
        b=faUHeNZA/+e8W42mB0OnP9SdsDz8dGxD16BhHxpskv3nsTwTvBaYnncSPwJp4+2LqT
         dYcGqas8eLFcbDtP+FAwoonAMv6c1DhfHOs5RoFbmmtyS6h1s48XJ2Dr7ADMrN6Tpkr1
         OV0tU7Khox6FMw1Zy3VP3an9v5ghE08qQ3agPT/amYT8LZIwoVrXfFYitSxQFeBswOp3
         3CnOfRKF+WjwilMaWvwDff2TXpEL9CaoOR42eRtQAOkSrmJXquCOfF9cL6DXj3C04PoN
         wLrJFuhWDBkMkOgKht2Ddg1ThADMHfxpWPVwUF93BhFttXwoFcKni13JuyVEIBkrfYN3
         oYjQ==
X-Gm-Message-State: AOAM532M9VNtMy40Vl4bfJbJUWJJ2fBhXGyVrm9kz4mmzvC9kBp3plM0
        sd5h7K0bLSnjTj2xRlsFZjU=
X-Google-Smtp-Source: ABdhPJwc1TT+ChSeoXbg0p0CnzpgXR2ZisNNptyDL+X2NF8gsxcBGGwsXgrMQiKRkJVR2qHi2rd9ng==
X-Received: by 2002:a05:6808:f13:: with SMTP id m19mr3513973oiw.123.1642607215838;
        Wed, 19 Jan 2022 07:46:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e1sm75857oou.0.2022.01.19.07.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 07:46:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Terry Bowman <terry.bowman@amd.com>
Cc:     linux-watchdog@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
 <20220118202234.410555-3-terry.bowman@amd.com>
 <CAHp75VdBFN+QMJpYDp8ytGGrBKYyjxU8u=Xrn44Lc3UGLPRQOA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
Message-ID: <b4f66a42-6f25-7e93-2a3b-5d73af39e72e@roeck-us.net>
Date:   Wed, 19 Jan 2022 07:46:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdBFN+QMJpYDp8ytGGrBKYyjxU8u=Xrn44Lc3UGLPRQOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/19/22 3:53 AM, Andy Shevchenko wrote:
> On Tue, Jan 18, 2022 at 10:23 PM Terry Bowman <terry.bowman@amd.com> wrote:
>>
>> Combine MMIO base address and alternate base address detection. Combine
>> based on layout type. This will simplify the function by eliminating
>> a switch case.
>>
>> Move existing request/release code into functions. This currently only
>> supports port I/O request/release. The move into a separate function
>> will make it ready for adding MMIO region support.
> 
> ...
> 
>> To: Guenter Roeck <linux@roeck-us.net>
>> To: linux-watchdog@vger.kernel.org
>> To: Jean Delvare <jdelvare@suse.com>
>> To: linux-i2c@vger.kernel.org
>> To: Wolfram Sang <wsa@kernel.org>
>> To: Andy Shevchenko <andy.shevchenko@gmail.com>
>> To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: Robert Richter <rrichter@amd.com>
>> Cc: Thomas Lendacky <thomas.lendacky@amd.com>
> 
> Same comment to all your patches.
> 
> ...
> 
>> +static int __sp5100_tco_prepare_base(struct sp5100_tco *tco,
>> +                                    u32 mmio_addr,
>> +                                    const char *dev_name)
>> +{
>> +       struct device *dev = tco->wdd.parent;
> 
>> +       int ret = 0;
> 
> Not really used variable.
> 
>> +       if (!mmio_addr)
>> +               return -ENOMEM;
>> +
>> +       if (!devm_request_mem_region(dev, mmio_addr,
>> +                                   SP5100_WDT_MEM_MAP_SIZE,
>> +                                   dev_name)) {
>> +               dev_dbg(dev, "MMIO address 0x%08x already in use\n",
>> +                       mmio_addr);
>> +               return -EBUSY;
>> +       }
>> +
>> +       tco->tcobase = devm_ioremap(dev, mmio_addr,
>> +                                   SP5100_WDT_MEM_MAP_SIZE);

Talking about line splits, is this one necessary ?

>> +       if (!tco->tcobase) {
>> +               dev_dbg(dev, "MMIO address 0x%08x failed mapping.\n",
>> +                       mmio_addr);
> 
>> +               devm_release_mem_region(dev, mmio_addr,
>> +                                       SP5100_WDT_MEM_MAP_SIZE);
> 
> Why? If it's a short live mapping, do not use devm.
> 

This is not short lived; it is needed by the driver. The release
is an artifact of calling this function twice and ignoring the error
from devm_ioremap() if the first call fails. devm_release_mem_region()
isn't strictly needed but that would result in keeping the memory
region reserved even though it isn't used by the driver.

There is a functional difference to the original code, though.
The failing devm_ioremap() causes the code to try the alternate
address. I am not sure if that really adds value; devm_ioremap()
fails because the system is out of virtual memory, and calling
it again on a different address doesn't seem to add much value.
I preferred the original code, which would only call devm_ioremap()
after successfully reserving a memory region.

>> +               return -ENOMEM;
>> +       }
> 
>> +       dev_info(dev, "Using 0x%08x for watchdog MMIO address\n",
>> +                mmio_addr);
> 
> Unneeded noise.
> 
>> +       return ret;
> 
> On top of above it's a NIH devm_ioremap_resource().
> 

Not sure what NIH means, but if you refer to the lack of
devm_release_mem_region(), again, it isn't short lived.

>> +}
> 
> 
> ...
> 
>> +       int ret = 0;
> 
> Redundant assignment.
> 
> ...
> 
>> +       /* Check MMIO address conflict */
>> +       ret = __sp5100_tco_prepare_base(tco, mmio_addr, dev_name);
> 
>> +
>> +       /* Check alternate MMIO address conflict */
> 
> Unify this with the previous comment.
> 

Why ? It refers to the code below. If that is a single or two comments
is really just POV.

>> +       if (ret)
>> +               ret = __sp5100_tco_prepare_base(tco, alt_mmio_addr,
>> +                                               dev_name);
> 
> ...
> 
>> +               if (alt_mmio_addr & ((SB800_ACPI_MMIO_DECODE_EN |
>> +                                     SB800_ACPI_MMIO_SEL) !=
>> +                                    SB800_ACPI_MMIO_DECODE_EN)) {
> 
> The split looks ugly. Consider to use temporary variables or somehow
> rearrange the condition that it doesn't break in the middle of the one
> logical token.

Split at the &, maybe.

> 
>> +                       alt_mmio_addr &= ~0xFFF;
> 
> Why capital letters?
> 
>> +                       alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
>> +               }
> 
> ...
> 
>> +               if (!(alt_mmio_addr & (((SB800_ACPI_MMIO_DECODE_EN |
>> +                                      SB800_ACPI_MMIO_SEL)) !=
>> +                     SB800_ACPI_MMIO_DECODE_EN))) {
> 
> Ditto.
> 
>> +                       alt_mmio_addr &= ~0xFFF;
> 
> Ditto.
> 
>> +                       alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
> 
> ...
> 
> Okay, I see this is the original code like this... Perhaps it makes
> sense to reshuffle them (indentation-wise) at the same time and
> mention this in the changelog.
> 
> ...
> 
>>          release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
> 
> Is it still needed? I have no context to say if devm_iomap() and this
> are not colliding, please double check the correctness.
> 
Not sure I understand. This is the release of the io region reserved with
request_muxed_region() at the beginning of this function. Why would it no
longer be necessary to release that region ?

Guenter
