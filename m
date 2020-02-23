Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E504F169A99
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 00:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgBWXLR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Feb 2020 18:11:17 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:50009 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727064AbgBWXLR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Feb 2020 18:11:17 -0500
Received: from [78.134.20.33] (port=59608 helo=[192.168.77.67])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1j60P0-00FBU2-SK; Mon, 24 Feb 2020 00:11:10 +0100
Subject: Re: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <e43eaaf1-a294-902f-9a52-ebf8b29acab1@lucaceresoli.net>
Date:   Mon, 24 Feb 2020 00:11:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 21/02/20 10:45, Geert Uytterhoeven wrote:
> Hi Wolfram,
> 
> On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>> Sometimes, we have unknown devices in a system and still want to block
>> their address. For that, we allow DT nodes with only a 'reg' property.
>> These devices will be bound to the "dummy" driver but with the name
>> "reserved". That way, we can distinguish them and even hand them over to
>> the "dummy" driver later when they are really requested using
>> i2c_new_ancillary_device().
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Cc:ing Alexandre who raised the need for a described-but-disabled I2C node.

> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> but one question below.
> 
>> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>> @@ -50,7 +50,6 @@ Examples:
>>                 reg-io-width = <1>;     /* 8 bit read/write */
>>
>>                 dummy@60 {
>> -                       compatible = "dummy";
>>                         reg = <0x60>;
>>                 };
>>         };
> 
> There's a second instance to remove 18 lines below.
> 
>> --- a/drivers/i2c/i2c-core-of.c
>> +++ b/drivers/i2c/i2c-core-of.c
>> @@ -27,17 +27,15 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
>>
>>         memset(info, 0, sizeof(*info));
>>
>> -       if (of_modalias_node(node, info->type, sizeof(info->type)) < 0) {
>> -               dev_err(dev, "of_i2c: modalias failure on %pOF\n", node);
>> -               return -EINVAL;
>> -       }
>> -
>>         ret = of_property_read_u32(node, "reg", &addr);
>>         if (ret) {
>>                 dev_err(dev, "of_i2c: invalid reg on %pOF\n", node);
>>                 return ret;
>>         }
>>
>> +       if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
>> +               strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));
> 
> Could this cause a regression, e.g. if people already have such dummy
> nodes in their DTS, and use sysfs new_device from userspace to
> instantiate the device later?

Such a DTS would be illegal because "compatible" has been a required
property so far. Thus one could leave such people out in the cold
because they went on an unsupported path. Not super nice anyway.

However I'd like to view the issue from the DT point of view. DT
describes the hardware, and it is possible (and even desirable) that the
firmware provides the DTB independently from the OS, and the kernel
consumes it. It this scenario, firmware could and should describe all
I2C slaves with proper "compatible" property, and there is no way to
remove it, in a clean way at least.

But the kernel currently ignores nodes that have no matching driver,
right? So in this case the kernel knows that that address is used, but
ignores this information and considers the address as available.
Seen in this perspective, we should have a "compatible" for all nodes:
it is just describing the hardware and could be out of the kernel
control. But instead of discarding all nodes without a matching driver,
the i2c-core-of code should mark them as "reserved".

Does it sound correct?

Clearly this does not fit the case reported by Alexandre: a device
having a driver which is known to be badly buggy, so we don't want to
instantiate it. But again, this should not affect DT as it is not
describing the HW, but only an implementation detail. Probably disabling
or blacklisting the driver would be a better option there?

My apologies to Wolfram, I appreciate a lot the effort you are doing,
but before reviewing this patch I have never realized what I tried to
explain above.

-- 
Luca
