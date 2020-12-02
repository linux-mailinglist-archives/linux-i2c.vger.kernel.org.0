Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C467C2CB9AC
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 10:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgLBJts (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 04:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgLBJts (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Dec 2020 04:49:48 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D36C0613CF;
        Wed,  2 Dec 2020 01:49:07 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id p8so2870496wrx.5;
        Wed, 02 Dec 2020 01:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=yQcKfKpaPCijy5k5bBL/2/rvkWxF60Sjyf/OFciVT4E=;
        b=NS2dkcDRwlstmZMjKx+25hsYmoZXzToqWqP5Brh93+gnrg1sJPJPLygKQEMv3aMs0S
         4wPWuwzjvOvhI7MSAyK2A47UZSTNLBT47aahoQJBlUCMTW4bjFg90pxWhNmFgPPrXOXv
         TNufwpUbncla2U5K5u9Id5ZXfbO2hKi4qvdnOx1X9oWxSy4m3eHqjsWc2H6HVHDEY8Bq
         Emqg4YqoXJ5ok/2sCOok6Kei5EG0zm2jtq4jmGVgI2EC89t2OKwDZJfzGeOsrRhbadDy
         6s+qcY99lWI7XkJF1Obm8kubL1RGRkEvHau3Jje+0NPHuNP0vfky4zq7jwwUGIqHihOX
         4Idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=yQcKfKpaPCijy5k5bBL/2/rvkWxF60Sjyf/OFciVT4E=;
        b=E/g85nR71vmfhkkIFvICfS4VM9Queav2MkBtQHRCENgKo5O+Ii5OL9P4wtTNRZWnAe
         dOuUAAaeZxnNg4WgmX8r3AbWwgWFIGIkZHqEmO+R3BvidL0WzMO4587Mq9Ud0aDFF6pw
         oDxtNkGXF1j3b0TOWncFFwA6xhk66vdT3VOFEXXVMgfWuX/1HrWSNK/eiHHp6L+LyHjX
         syITO7ykRbnRhHEJd9X9dGZDqcEfz0ItAu9pjUXn7xT7XKTDYOR7MjlzmwMc04JxzXqZ
         fLwyvD3HScMbS3HS/MLllOMpK+QsBRqx3BHza+Lv01tWaqpB2QG3h6BhFMHZtm0qtYO1
         vbhA==
X-Gm-Message-State: AOAM530gLCDYbX9WKctE38OF9RvCXsnOrPSuQXuovLHmuSjmfW5hdzvt
        2NVdBKy9dwK+fs8igASvCMI=
X-Google-Smtp-Source: ABdhPJxPOCKPkUspcfEOQk9WMx2dI4EMfP5HRYAxSdyKmKw5HqF1+BUAKSsVa16mCpjXfRTCrJ14AQ==
X-Received: by 2002:a5d:544e:: with SMTP id w14mr2306939wrv.227.1606902546472;
        Wed, 02 Dec 2020 01:49:06 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id s8sm1349434wrn.33.2020.12.02.01.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 01:49:05 -0800 (PST)
Subject: Re: [PATCH 16/18] i2c: i2c-core-base: Use the new i2c_acpi_dev_name()
 in i2c_set_dev_name()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-17-djrscally@gmail.com>
 <20201130171241.GP14465@pendragon.ideasonboard.com>
 <20201130191856.GX4077@smile.fi.intel.com>
 <20201202093554.GT4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <edc659fc-9579-7541-ab4f-1c8588566688@gmail.com>
Date:   Wed, 2 Dec 2020 09:49:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202093554.GT4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/12/2020 09:35, Andy Shevchenko wrote:
> Dan, does this mail among other my replies reach you?
> It seems you answered to Laurent's mails and leaving mine ignored. Just
> wondering if our servers have an issue again...
Morning - I got it, sorry. I just read Laurent's first and then called
it a night
> On Mon, Nov 30, 2020 at 09:18:56PM +0200, Andy Shevchenko wrote:
>> On Mon, Nov 30, 2020 at 07:12:41PM +0200, Laurent Pinchart wrote:
>>> On Mon, Nov 30, 2020 at 01:31:27PM +0000, Daniel Scally wrote:
>>>> From: Dan Scally <djrscally@gmail.com>
>>>>
>>>> To make sure the new i2c_acpi_dev_name() always reflects the name of i2c
>>>> devices sourced from ACPI, use it in i2c_set_dev_name().
>>>>
>>>> Signed-off-by: Dan Scally <djrscally@gmail.com>
>>> I'd squash this with 15/18, which would make it clear there's a memory
>>> leak :-)
>> ...
>>
>>>>  	if (adev) {
>>>> -		dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev));
>>>> +		dev_set_name(&client->dev, i2c_acpi_dev_name(adev));
>>>>  		return;
>> But you split pattern used in i2c_dev_set_name().
>> What you need is to provide something like this
>>
>> #define I2C_DEV_NAME_FORMAT	"i2c-%s"
>>
>> const char *i2c_acpi_get_dev_name(...)
>> {
>> 	return kasprintf(..., I2C_DEV_NAME_FORMAT, ...);
>> }
>>
>> (Possible in the future if anybody needs
>>   const char *i2c_dev_get_name_by_bus_and_addr(int bus, unsigned short addr)
>> )
>>
>> And here
>>
>> -		dev_set_name(&client->dev, "i2c-%s", info->dev_name);
>> +		dev_set_name(&client->dev, I2C_DEV_NAME_FORMAT, info->dev_name);
>>
>> -		dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev));
>> +		dev_set_name(&client->dev, I2C_DEV_NAME_FORMAT, acpi_dev_name(adev));
>>
Yeah ok, I like this approach much better, I'll switch to that.
