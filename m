Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB371245A9
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2019 12:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbfLRLVC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 18 Dec 2019 06:21:02 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:47269 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726676AbfLRLVC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Dec 2019 06:21:02 -0500
Received: from [37.162.94.155] (port=27596 helo=[192.168.43.3])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ihXNz-00B31J-Q6; Wed, 18 Dec 2019 12:20:59 +0100
Subject: Re: [PATCH 06/10] mfd: Add core driver for AD242x A2B transceivers
To:     Daniel Mack <daniel@zonque.org>, Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, lars@metafoo.de, pascal.huerst@gmail.com
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-8-daniel@zonque.org> <20191217133952.GJ18955@dell>
 <ce6e0b19-ec40-c17b-cee6-05eca52d5df3@zonque.org>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <e288a6e1-a967-d7cd-72fc-d190819953e3@lucaceresoli.net>
Date:   Wed, 18 Dec 2019 12:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ce6e0b19-ec40-c17b-cee6-05eca52d5df3@zonque.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
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

Hi Daniel,

On 17/12/19 20:24, Daniel Mack wrote:
>>> +++ b/drivers/mfd/ad242x-bus.c
>>> @@ -0,0 +1,42 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +#include <linux/i2c.h>
>>> +#include <linux/init.h>
>>> +#include <linux/mfd/ad242x.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +
>>> +static int ad242x_bus_i2c_probe(struct i2c_client *i2c,
>>> +                const struct i2c_device_id *id)
>>> +{
>>> +    dev_set_drvdata(&i2c->dev, i2c);
>>> +    i2c_set_clientdata(i2c, &i2c->dev);
>>
>> Please explain to me what you think is happening here.
>>
>>> +    return 0;
>>> +}
>>
>> What does this driver do?  Seems kinda pointless?
> 
> As explained in the commit log, these devices expose two addresses on
> the i2c bus, and each of which exists for a distinct purpose. The
> primary one is used to access registers on the master node itself, the
> second one is proxying traffic to remote nodes.
> 
> Now, the question is how to support that, and the approach chosen here
> is to have a dummy driver sitting on the 2nd address, and to reach out
> to it via a DT phandle from the master node. I don't like that much
> either, but I'm not aware of a cleaner way to bind two addresses with
> one driver. If there is any, I'd be happy to change that.

Have a look at i2c_new_dummy_device(), perhaps it is what you need here.

-- 
Luca

