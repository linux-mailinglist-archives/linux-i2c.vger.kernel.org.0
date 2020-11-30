Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01222C923D
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 00:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730504AbgK3XKt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 18:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgK3XKs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 18:10:48 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315F1C0613D4;
        Mon, 30 Nov 2020 15:10:08 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id v14so158270wml.1;
        Mon, 30 Nov 2020 15:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KAwd+sagU7ZwoHzkY8WFvDixnRdQKdnq8c4J8ZOSLe8=;
        b=s0YVQetgcXUCZUuePccdDHOm/lYkq9PddmbCKUbzrdcBaI/Z6OQs5HsDCFB1CdHelx
         PtiqeHUn5ICOwCvxhcCs5/lbeJSEvmDgcRPd+oBbdagJpsECxC3qkU38xrF6I0eqn2Gf
         9Pscx8gPUzh89FX0lg/09asSb+eYpqdx1lxqKEe6SzIZpdYdN75HITkgYNdBm2DSeuR8
         2Y1QmiiZnKER7NHr9unT1kgK/vrpRLJPVtjp6ppUzyBAIKABYKE2HbZgI8Z8hReAVSkn
         vwaaVBI/aaGEtJZq+NIpwHyUwRvO2qyXKE5tulNdYVk/R7vR+n93ve8WUXt9E1R3oQ0M
         Rtxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KAwd+sagU7ZwoHzkY8WFvDixnRdQKdnq8c4J8ZOSLe8=;
        b=eURoDpNIoHXvY0xxufgty5FbBxuRw2IH0Tjhet3yQzoETujZyQBNLGgRV6hH5JeKJ+
         S9u5+lJzoMeFO/7j7WydkTgQ92XNdFMCNbDIGLmeLlOWIoI24lWI5/uPqFpBZoIYoVUa
         RhmU8CB0a1I6qvYz/GTc15HuOmLUblHEv6aVk/Jf491nQtDB+gSWDnN8+byV3vhXNeuY
         NMCE6VFL+itxxY0CRMBHVzutGmOi2pvaxJZGrd7/q2BXphDj0tst1wkP5cT5yZm6j81i
         G7BiK5koC66vu8HtlwdL0njMMLMFQvEjn75zguEskYe6OnTRgz4e9nVVeakn/uu6g598
         Em+w==
X-Gm-Message-State: AOAM531KjmZf7caYfhd8cWDn4xRX8BOORr8AqrQWR2NDol/mbsTbwLSq
        LVncT0yvxWX9SD3X71JXm4s=
X-Google-Smtp-Source: ABdhPJwmQ04ElguRaJT90Eh2XmbsVVZmHnFpw23lDOZ42hGc2n73VlqBQK/73YNP+1VHvbCbX8Fspw==
X-Received: by 2002:a1c:234d:: with SMTP id j74mr148325wmj.18.1606777807007;
        Mon, 30 Nov 2020 15:10:07 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id a191sm62141wme.25.2020.11.30.15.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 15:10:06 -0800 (PST)
Subject: Re: [PATCH 04/18] software_node: Enforce parent before child ordering
 of nodes array for software_node_register_nodes()
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
 <20201130133129.1024662-5-djrscally@gmail.com>
 <20201130161152.GG14465@pendragon.ideasonboard.com>
 <20201130161239.GH14465@pendragon.ideasonboard.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <3f2edde6-e2e3-b379-3c1b-2a5461034b8a@gmail.com>
Date:   Mon, 30 Nov 2020 23:10:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130161239.GH14465@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laurent

On 30/11/2020 16:12, Laurent Pinchart wrote:
> On Mon, Nov 30, 2020 at 06:11:52PM +0200, Laurent Pinchart wrote:
>> Hi Daniel,
>>
>> Thank you for the patch.
>>
>> On Mon, Nov 30, 2020 at 01:31:15PM +0000, Daniel Scally wrote:
>>> Registering software_nodes with the .parent member set to point to a
>>> currently unregistered software_node has the potential for problems,
>>> so enforce parent -> child ordering in arrays passed to this function.
>>>
>>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>> ---
>>> Changes since RFC v3:
>>>
>>> 	Patch introduced
>>>
>>>  drivers/base/swnode.c | 15 +++++++++++----
>>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>>> index 615a0c93e116..af7930b3679e 100644
>>> --- a/drivers/base/swnode.c
>>> +++ b/drivers/base/swnode.c
>>> @@ -700,14 +700,21 @@ int software_node_register_nodes(const struct software_node *nodes)
>>>  	int i;
>>>  
>>>  	for (i = 0; nodes[i].name; i++) {
>>> +		if (nodes[i].parent)
>>> +			if (!software_node_to_swnode(nodes[i].parent)) {
>>> +				ret = -EINVAL;
>>> +				goto err_unregister_nodes;
>>> +			}
>>> +
>>>  		ret = software_node_register(&nodes[i]);
>>> -		if (ret) {
>>> -			software_node_unregister_nodes(nodes);
>>> -			return ret;
>>> -		}
>>> +		if (ret)
>>> +			goto err_unregister_nodes;
>>>  	}
>>>  
>>>  	return 0;
>> I'd add a blank line here.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> I spoke a bit too soon. Could you update the documentation of the
> function to explain this new requirement ?
Oops - of course, will do
>>> +err_unregister_nodes:
>>> +	software_node_unregister_nodes(nodes);
>>> +	return ret;
>>>  }
>>>  EXPORT_SYMBOL_GPL(software_node_register_nodes);
>>>  
>> -- 
>> Regards,
>>
>> Laurent Pinchart
