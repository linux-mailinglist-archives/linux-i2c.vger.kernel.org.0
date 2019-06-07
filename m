Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD043832F
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 05:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfFGDkS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 23:40:18 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15308 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfFGDkS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 23:40:18 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf9dc920000>; Thu, 06 Jun 2019 20:40:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Jun 2019 20:40:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Jun 2019 20:40:17 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 03:40:14 +0000
Subject: Re: [PATCH V4] drivers: i2c: tegra: fix checkpatch defects
To:     Peter Rosin <peda@axentia.se>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
 <8df7648d-c5bd-7179-6368-66dab9b7fa39@axentia.se>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <7f24640f-5031-1413-e96d-6a28e6a50869@nvidia.com>
Date:   Thu, 6 Jun 2019 20:40:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8df7648d-c5bd-7179-6368-66dab9b7fa39@axentia.se>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559878802; bh=nfSUhBUF0xlX62infTIeqrfDT/WeXXcT5pJ8IWqzS7E=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=eIZjWpfvKzFCwQBJeizXnXqq20T+jo+8OdUlQ/U8pnV5ormVQsb0am3YqW0y7wIwc
         kxWPHMyJvk1z/h3Men8AqQ0X9V0BeJgeV1XqYg93Ud2y/AfbJqi43yhQh8Cf0b7XMh
         1CZDD6wfk/8I5EctFaDLnz2c1qUmBPN38GcjR84OLNbz/xmGuzdTMkltoKHaP4PXI8
         5OSw19q4NXiPZ3zqQqg3u9WZ464Y2Im3mAUFKqGgXVtPmHu+RFYps6sw8yIR2A1y05
         dU7CfPAMO7aOCUpHWvi1sjAV4VaoECe3k+vr7FcCkkiznBpnFSejJ0TtFZCpEvuZVA
         KhmWBvf1ETI0w==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/6/19 1:45 PM, Peter Rosin wrote:
> On 2019-06-06 09:35, Bitan Biswas wrote:
>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Replace BUG() with error handling code.
>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 67 +++++++++++++++++++++++-------------------
>>   1 file changed, 37 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 76b7926..55a5d87 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -78,6 +78,7 @@
>>   #define I2C_ERR_NO_ACK				0x01
>>   #define I2C_ERR_ARBITRATION_LOST		0x02
>>   #define I2C_ERR_UNKNOWN_INTERRUPT		0x04
>> +#define I2C_ERR_UNEXPECTED_STATUS               0x08
> 
> Use tabs like the the surrounding code. And perhaps convert all
> these flags to use the BIT() macro?
I shall correct the line and use tabs. I shall convert macros to BIT() 
if possible.

> 
>>   
>>   #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>>   #define PACKET_HEADER0_PACKET_ID_SHIFT		16
>> @@ -112,7 +113,7 @@
>>   #define I2C_CLKEN_OVERRIDE			0x090
>>   #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
>>   
>> -#define I2C_CONFIG_LOAD_TIMEOUT			1000000
>> +#define I2C_CONFIG_LOAD_TMOUT			1000000
> 
> Similar to xfer_tm already mentioned by Dmitry; just keep it as
> ..._TIMEOUT and ignore checkpatch on this issue. Or juggle the
> code in some other way to pacify checkpatch. E.g. abbreviate
> CONFIG instead? Or something. CONF is way easier to read than
> TMOUT IMHO...
OK. Just for consistency planning to ignore checkpatch warning and shall 
keep current macro I2C_CONFIG_LOAD_TIMEOUT.

-Thanks,
  Bitan
