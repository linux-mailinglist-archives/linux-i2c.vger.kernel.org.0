Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A942CB0B7
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 00:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgLAXQ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 18:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgLAXQ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 18:16:27 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73453C0613CF;
        Tue,  1 Dec 2020 15:15:47 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id e7so5552053wrv.6;
        Tue, 01 Dec 2020 15:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3VbF30wKtAJP8MAjXe3KNwVj1p7jHGN4bxqNNTIYUOY=;
        b=XMWqvkrnDz62fEIqhZb4Fo1254CzBIuHuqZ0rFA9P4jh0wbGopqWnd1n5sprMkdklm
         /7p9VoK2pVBeshyAtoMHfCqMvvZZTFSJhEcdisoSQtcBttFpyWluRjnK7vbo/xH+tw4/
         NEEW6qDqyTSyTyjrHRQNm2NmqBGVWJqEntN3gKGTpCD5d3hxFLnzM70bL64ux6o1keZu
         +iyg4c0h/GXl/owOWyK/RfD3aVOG9ldNBuQFoEMkMyc5JfwSaQV+gDga6+SHL6VhdHm5
         lwzRFGama84Q0ewjD4rK4oTNW+ZfTUF8FM+Swr92VW+U1OgOZivM6B8a+W9hz3qE9nZt
         jSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3VbF30wKtAJP8MAjXe3KNwVj1p7jHGN4bxqNNTIYUOY=;
        b=IW0RcYOqJxvTbyv/ou6Ox++X+mQf+sn2tklBA1sqRlW7/ZSTXeaFhxx7hBN4SdEeud
         P+UZ9zysC1xNw7UnWdQXhxs0MYqtcI7/njE3tbNi/fbgkCyTgwEkM3j+xOm/LxN392Kd
         4TdFaAOL4CRhpdkNDR8odkv4cdzyLJ0OtewjAuoV4vagkSjKlrfsk+aRKX8tiFs43ifS
         RhZvDTGHffWHzG4ZkxKdQJlT3nR7BPnAouC3WA5YVKYOo9vZWuJ/nrgF5ijX2lpQrOzj
         GFUJ6+9aZjqqxWEsVzKo5OVuzJGcdvsM1Wex4nTn/AVaWGimQRjMnhXh+B2TgD+P4Hyx
         zTVw==
X-Gm-Message-State: AOAM530qMfuW/YUn/maXLU5HeOW1srp1Kxhmwb0eDmh4u+/Xa0hOHFpd
        iD2m3MkCb0ZE58K9njXGn8M=
X-Google-Smtp-Source: ABdhPJw/9cAic6iM8VyiiPQl8pOSzmtDD4F4dW7ovAZneoEikM8hT/0UigDmyxhS6fOjtEqi4GoX3Q==
X-Received: by 2002:adf:eb88:: with SMTP id t8mr7155076wrn.105.1606864546080;
        Tue, 01 Dec 2020 15:15:46 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id l16sm1642406wrx.5.2020.12.01.15.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 15:15:45 -0800 (PST)
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing software_node
 connections to sensors on platforms designed for Windows
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-14-djrscally@gmail.com>
 <20201130170955.GN14465@pendragon.ideasonboard.com>
 <b5cc6bbd-f679-7023-fde0-de2acb65a3c2@gmail.com>
 <20201201223053.GB4569@pendragon.ideasonboard.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <23cbc632-9a57-ad67-b7f8-61ff0672d070@gmail.com>
Date:   Tue, 1 Dec 2020 23:15:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201223053.GB4569@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laurent
On 01/12/2020 22:30, Laurent Pinchart wrote:
>>>> +}
>>>> +
>>>> +static void cio2_bridge_create_fwnode_properties(struct cio2_sensor *sensor)
>>>> +{
>>>> +	unsigned int i;
>>>> +
>>>> +	cio2_bridge_init_property_names(sensor);
>>>> +
>>>> +	for (i = 0; i < 4; i++)
>>>> +		sensor->data_lanes[i] = i + 1;
>>> Is there no provision in the SSDB for data lane remapping ?
>> Sorry; don't follow what you mean by data lane remapping here.
> Some CSI-2 receivers can remap data lanes. The routing inside the SoC
> from the data lane input pins to the PHYs is configurable. This makes
> board design easier as you can route the data lanes to any of the
> inputs. That's why the data lanes DT property is a list of lane numbers
> instead of a number of lanes. I'm actually not sure if the CIO2 supports
> this.

I don't see anything in the SSDB that might refer to that, though of
course we're lacking documentation for it so it could be a part that we
don't understand yet.


>>>> +			dev_info(&bridge->cio2->dev,
>>>> +				 "Found supported sensor %s\n",
>>>> +				 acpi_dev_name(adev));
>>>> +
>>>> +			bridge->n_sensors++;
>>> We probably want a check here to avoid overflowing bridge->sensors. The
>>> other option is to make bridge->sensors a struct list_head and allocate
>>> sensors dynamically.
>> Err - agree on a check. There's only 4 ports in a CIO2 device, so that's
>> the maximum. Seems easier to just do a check, unless the wasted memory
>> is enough that it's worth allocating dynamically. I don't mind either
>> approach.
> In theory we could route multiple sensors to the same receiver, as long
> as only one of them drives the lanes at any given time. It's one way to
> support multiple sensors in cheap designs. I doubt we'll ever encounter
> that with the IPU3, so we could just limit the count to 4.
Ah, that's neat though. But I'll leave it at a check at the top of the
loop for now.
>>>> +
>>>> +	fwnode = software_node_fwnode(&bridge->cio2_hid_node);
>>>> +	if (!fwnode) {
>>>> +		dev_err(dev, "Error getting fwnode from cio2 software_node\n");
>>>> +		ret = -ENODEV;
>>>> +		goto err_unregister_sensors;
>>> Can this happen ?
>> It _shouldn't_ happen, as long as nothing else is touching the swnodes
>> I've registered or anything. I've never seen it happen. That didn't feel
>> like quite enough to say it can't ever happen - but I'm happy to skip
>> the check if you think thats ok.
> It seems a bit overkill to me, but I'm not a swnode specialist :-)
I'm going to keep it, if you have no strong feelings, partly through
caution but also because the other place swnodes are most heavily used
(drivers/platform/x86/intel_cht_int33fe_typec.c) _does_ perform the
check, so consistency too.
>>>> @@ -0,0 +1,108 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/* Author: Dan Scally <djrscally@gmail.com> */
>>>> +#ifndef __CIO2_BRIDGE_H
>>>> +#define __CIO2_BRIDGE_H
>>>> +
>>>> +#include <linux/property.h>
>>>> +
>>>> +#define CIO2_HID				"INT343E"
>>>> +#define CIO2_NUM_PORTS			  4
>>> There are a few rogue spaces before '4'.
>> Argh, thanks, this is the curse of using VS code on multiple machines...
> I recommend vim ;-)
You're not the only one - maybe I need to spend the time and it'll save
time in the future
