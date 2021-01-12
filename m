Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945ED2F3642
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 17:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbhALQ5W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 11:57:22 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10839 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbhALQ5W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 11:57:22 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ffdd4ca0001>; Tue, 12 Jan 2021 08:56:42 -0800
Received: from [10.2.51.38] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Jan
 2021 16:56:41 +0000
Subject: Re: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead
 of writesl()
To:     David Laight <David.Laight@ACULAB.COM>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
 <20201020074846.GA1877013@ulmo>
 <538d8436-260d-40a8-b0a3-a822a0f9c909@nvidia.com>
 <c37f8618-5100-4087-3bc3-fe421d40f3b8@gmail.com>
 <2212a21b-7dff-4ba0-a193-badd5a1770c8@gmail.com>
 <6373bc13-a53d-2bb2-98f5-f6f01b0b8b69@nvidia.com>
 <790fa75aaec146f0bb27703157c0e77a@AcuMS.aculab.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <ee6d9283-cbff-1d26-c1ea-2fff435d9c2c@nvidia.com>
Date:   Tue, 12 Jan 2021 08:56:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <790fa75aaec146f0bb27703157c0e77a@AcuMS.aculab.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610470602; bh=OQMmqb5lh1n/TkSrehTwWEmRMv7Pbzy7zBdWLqpHldM=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=dSAwlMNc8X0w5LOLuaOJxJ9Xg+pM9ZaV0zhKBzc9fd3V8bxraC9D6m+qseKl5yXje
         kBQAglalaAYJnn4yTAkWSk5WY4045cDZIJQOGZBpCDS/ElRK968pkB9xHQtUMAP4mW
         04Rtxzf4FocHlSldEguJ8LOH0KXZXuHopjV/7lUfjEzBsrmNL5Xj+dCeN7hXTdArnb
         1IQu2K0yxqKLlcn+HiEyBipRGFk59TJ4TBgbpwmxKm02cqmrLeonxLq83jC9zbcXFY
         Rk4Utn56jauqLoto/BS3wrksqnc3J2NeR+N2fVPldDDNlW+xwbvp3oIsGRXC5OXz9I
         76ZRsZK0SA4zQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 1/12/21 1:32 AM, David Laight wrote:
> From: Sowjanya Komatineni
>> Sent: 11 January 2021 17:38
> ...
>> Using writesl() for filling TX_FIFO causing silent hang immediate on any
>> i2c register access after filling FIFO with 8 words and some times with
>> 6 words as well.
>>
>> So couldn't INTERRUPT_STATUS registers to check for TX FIFO Overflows
>> when this silent hang happens.
>>
>> Tried to read thru back-door (JTAG path) but could not connect to JTAG
>> either. Looks like Tegra chip is in some weird state.
>>
>> But using writel() followed by i2c_readl helps. Not sure if any thing
>> related to register access delay or some other issue.
> How much does the i2c_read() slow down the transfer?
> If the device is PCIe it is probably significant.
>
> If the underlying problem is that the Tegra chip can't handle
> back to back writes to the tx fifo maybe there are other solutions!
> 1) Send it back and ask for a working chip :-)
> 2) Maybe an interleaved write will slow things down enough?
>
> It may be worth testing back to back writes to other registers
> to see if it is a problem that is specific to the tx fifo.
>
> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

This is a known hardware bug with VI I2C controller which is under 
host1x where immediate multiple writes to TX FIFO register gets stuck 
and reading from a register allows them to be flushed out.

VI I2C is dedicated for camera sensors or HDMI2CSI bridge.

