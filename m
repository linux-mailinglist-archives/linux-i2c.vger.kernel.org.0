Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3FB7275469
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 11:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgIWJX2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 05:23:28 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13240 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgIWJX2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 05:23:28 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f6b13b10002>; Wed, 23 Sep 2020 02:21:53 -0700
Received: from [10.26.74.254] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Sep
 2020 09:23:26 +0000
Subject: Re: [PATCH V2 0/5] Add support for custom names for AT24 EEPROMs
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200916094952.458003-1-jonathanh@nvidia.com>
 <CAMpxmJX6OxS-dxcK8whCm-Ups6Uts1iYE8bux_wAGeBPXihYBA@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c8bd52a5-2f80-2183-11bf-f7f531be2a56@nvidia.com>
Date:   Wed, 23 Sep 2020 10:23:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJX6OxS-dxcK8whCm-Ups6Uts1iYE8bux_wAGeBPXihYBA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600852913; bh=9tn65bkkY70YMWVjeAuBAkcP9eGmaq3E0Ud6x7JNbDM=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=irajoaE9RYbmc3jeKLDjjG8BGENVRqAuONIPqXagWEZ0uWKthZmbwR9DuLJFWXet2
         5OXWRvJxpAcs2WgqKNkLp5dcNRlRsAB2TMi8SrnRXf95OXWjwUMVdNGMgK8FY5gDNR
         3sMzFD/PJdAzsgk6DG7ZaBgqDKdf0pq3syQ40PtCTIDNtVou6Ht4hTpGy3LyIiVtla
         JV+d0oufRc4HoLfs0QSFyXebxK0RfH0ZJjV3r1RUV2yinQM7KkfMHSSqL2VkyxlD4b
         e9IPUMTnIf4N/UtO+MUGeIyCStYmX/dUacGjhJ7bKEv/5wsaeRNq2PJc+5GcNqOjm5
         b98eIajGZvJoQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 23/09/2020 10:15, Bartosz Golaszewski wrote:
> On Wed, Sep 16, 2020 at 11:50 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>> For platforms that have multiple boards and hence have multiple EEPROMs
>> for identifying the different boards, it is useful to label the EEPROMs
>> in device-tree so that they can be easily identified. For example, MAC
>> address information is stored in the EEPROM on the processor module for
>> some Jetson platforms which is not only required by the kernel but the
>> bootloader as well. So having a simple way to identify the EEPROM is
>> needed.
>>
>> Changes since V1:
>> - By default initialise the nvmem_config.id as NVMEM_DEVID_AUTO and not
>>   NVMEM_DEVID_NONE
>> - Dropped the 'maxItems' from the dt-binding doc.
>>
>> Jon Hunter (5):
>>   misc: eeprom: at24: Initialise AT24 NVMEM ID field
>>   dt-bindings: eeprom: at24: Add label property for AT24
>>   misc: eeprom: at24: Support custom device names for AT24 EEPROMs
>>   arm64: tegra: Add label properties for EEPROMs
>>   arm64: tegra: Populate EEPROMs for Jetson Xavier NX
>>
>>  .../devicetree/bindings/eeprom/at24.yaml      |  3 +++
>>  .../boot/dts/nvidia/tegra186-p2771-0000.dts   |  1 +
>>  .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  1 +
>>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  1 +
>>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  1 +
>>  .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 14 ++++++++++++
>>  .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 16 ++++++++++++++
>>  .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  1 +
>>  .../boot/dts/nvidia/tegra210-p2371-2180.dts   |  1 +
>>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   |  2 ++
>>  drivers/misc/eeprom/at24.c                    | 22 ++++++++++++++++++-
>>  11 files changed, 62 insertions(+), 1 deletion(-)
>>
>> --
>> 2.25.1
>>
> 
> Just FYI: I'm fine with the at24 part. I can take them through my tree
> for v5.10. Who is taking the DTS patches for tegra? Thierry? I can
> provide you with an immutable branch if that's fine. I can't just ack
> the at24 patches because they conflict with what I already have in my
> tree for v5.10.

Thanks. Yes Thierry is picking up the DTS patches.

Cheers
Jon

-- 
nvpublic
