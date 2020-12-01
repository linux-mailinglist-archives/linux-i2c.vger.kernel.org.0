Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A72C42CAFCA
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 23:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbgLAWMZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 17:12:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgLAWMY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 17:12:24 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C65DC0613CF;
        Tue,  1 Dec 2020 14:11:44 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id g185so10665720wmf.3;
        Tue, 01 Dec 2020 14:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vvLKivZTLe69yfxBowgpcvtJyakog4e3s87+lmyS3oE=;
        b=YXFYJkFe0R2S+2QuSkm4uEiX9GDrpMaUQNkTJk1Q6Mzjl7+/n3Ew06bToFqd3nTWYG
         LGlvtSXdwWEkL9vkz17ZaQvRKicaDsdnaoHjcE1WlGz79mcX9S77pFQzVIeVbUVDqxyL
         +nsMAmcQPTUZWmV29+XRyj7PnXLsoxSZ8PxdH36dxcAC0litYnrU5/NOyUDQ6dzI/LN0
         SnURs2cKL4KMFpW1GEbKV+0C6d8FaDfA+hXOHu3xE5rJkx1Qt9DvSl1j0qEgaFlNBndK
         MQDwcCoblzro/koKmYrHi/R2qHzgcdMff00C0vd5saAGhd3QdvZHq6sFE3IN3koNKzmZ
         9sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vvLKivZTLe69yfxBowgpcvtJyakog4e3s87+lmyS3oE=;
        b=IS1NHIiE0cxV4tfGeod3h8pxRYVnPLvKkGunYBHUwTSBxLBcAZtP3E0+NthgO7o1H1
         /33OHW9gguYRP7CWREBlSAofFj+3X1zEqTAGyZsH2AtmV/dpe4udR900H3pUjYZuI2Zg
         5kweZyE/oZsoU5qr/xkNQZPN9WuJ/1xiqGg74xWhOa3WYplaqNvPNaJKRKesr0fWfko9
         23yPZSLOz+dIvKrMq77D9EMxpM39jt6qDnI46AtBoT1ougeezG1YLjzwxKv5+1C6/ics
         Rfhdijc5dseGwLFf4pQpIryF/NDa+JNgTIJM7uC3ogekWd2Uv5rG35CWAma/QqIlcyJQ
         wBTA==
X-Gm-Message-State: AOAM531FzqynueZ1VnXbTmZRHCM5LYUtPndZlWWRJzjwZKFws1opqPo0
        nDDOL6G0UWUaXkAIGW2H+nc=
X-Google-Smtp-Source: ABdhPJz4FVPeIVmkqb70ApddW6Q/2CdhTY2VEJRk485BvgTKPlG8PC6HJx0bJJqPmdsa7OUimUHXJw==
X-Received: by 2002:a1c:4954:: with SMTP id w81mr4828931wma.60.1606860703107;
        Tue, 01 Dec 2020 14:11:43 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id y2sm1629948wma.6.2020.12.01.14.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 14:11:42 -0800 (PST)
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing software_node
 connections to sensors on platforms designed for Windows
From:   Dan Scally <djrscally@gmail.com>
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
Message-ID: <b3fdf17d-ac3d-bb6b-53a5-be4a93ce69e1@gmail.com>
Date:   Tue, 1 Dec 2020 22:11:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b5cc6bbd-f679-7023-fde0-de2acb65a3c2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 01/12/2020 22:08, Dan Scally wrote:
>>> +
>>> +		for_each_acpi_dev_match(adev, this_device, NULL, -1) {
>>> +			if (!adev || !(adev->status.present && adev->status.enabled))
>> 			if (!adev || !adev->status.present || !adev->status.enabled))
>>
>> may be a bit more readable. Does for_each_acpi_dev_match() return NULL
>> devices though ? If no, you could drop the !adev check. You may also be
>> able to drop the !present check, as I don't think ACPI allows !present
>> && enabled.
> You're right, the spec mandates enabled be 0 if present is 0. The
> iterator will return NULL when the previous return value was the last
> matching device, so that part needs to stay, but it can become:
>
> if (!adev || !adev->status.enabled)
>
Wait, that's silly, the loop won't start if the check is null so you're
right of course.
