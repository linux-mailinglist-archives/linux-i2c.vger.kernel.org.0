Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2031736DF
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2020 13:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgB1ML6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Feb 2020 07:11:58 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:41492 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725769AbgB1ML5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Feb 2020 07:11:57 -0500
Received: from [109.168.11.45] (port=49168 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1j7eUj-001wQh-Pt; Fri, 28 Feb 2020 13:11:53 +0100
Subject: Re: [RFC PATCH 7/7] i2c: core: hand over reserved devices when
 requesting ancillary addresses
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
        <devicetree@vger.kernel.org>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-8-wsa+renesas@sang-engineering.com>
 <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <dc831357-8545-6f6e-71a2-bef282e0bd94@lucaceresoli.net>
Date:   Fri, 28 Feb 2020 13:11:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 21/02/20 11:13, Geert Uytterhoeven wrote:
> Hi Wolfram,
> 
> On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>> With i2c_new_ancillary_address, we can check if the intended driver is
>> requesting a reserved address. Update the function to do these checks.
>> If the check passes, the "reserved" device will become a regular "dummy"
>> device.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -975,6 +975,8 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>>                                                 u16 default_addr)
>>  {
>>         struct device_node *np = client->dev.of_node;
>> +       struct device *reserved_dev, *adapter_dev = &client->adapter->dev;
>> +       struct i2c_client *reserved_client;
>>         u32 addr = default_addr;
>>         int i;
>>
>> @@ -984,7 +986,21 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>>                         of_property_read_u32_index(np, "reg", i, &addr);
>>         }
>>
>> -       dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
>> +       dev_info(adapter_dev, "Address for %s : 0x%x\n", name, addr);
>> +
>> +       /* No need to scan muxes, siblings must sit on the same adapter */
>> +       reserved_dev = device_find_child(adapter_dev, &addr, __i2c_check_addr_busy);
>> +       reserved_client = i2c_verify_client(reserved_dev);
>> +
>> +       if (reserved_client) {
>> +               if (reserved_client->dev.of_node != np ||
>> +                   strcmp(reserved_client->name, I2C_RESERVED_DRV_NAME) != 0)
>> +                       return ERR_PTR(-EBUSY);
> 
> Missing put_device(reserved_dev).
> 
>> +
>> +               strlcpy(reserved_client->name, I2C_DUMMY_DRV_NAME, sizeof(client->name));

Any strong reason for not giving the device a more informative name?
Reading "dummy" in several /sys/bus/i2c/devices/?-????/name files is not
helping. Using the 'name' string that is passed to
i2c_new_ancillary_device() would be way better, perhaps prefixed by
dev->name. But this opens the question of why not doing it in
i2c_new_dummy_device() as well, which currently receives no "name"
parameter.

Of course this is not strictly related to this patch and can be done in
a later step.

About the patch itself, except for the issues pointed out by Geert the
approach looks generally good to me.

-- 
Luca
