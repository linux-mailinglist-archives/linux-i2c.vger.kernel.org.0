Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B552C98DD
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 09:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgLAIJ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 03:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgLAIJ6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 03:09:58 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6521C0613CF;
        Tue,  1 Dec 2020 00:09:11 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id 64so1173118wra.11;
        Tue, 01 Dec 2020 00:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=g9iTWR+67p816vWv4eUTbB+4T/eP8zsyOLsAJSoKtlo=;
        b=YAm+m6+W/U+Z6DRI04FKYU92w2q8WYWM/8TgmETTQM51pN4ZSsY96OtwJWwH3Vns5u
         /PlGcWmnN/1SVBtBVI18qJtrsoR39Sm01wRczcylg4bFcy74AvV77931Mfgy8Qp5DlPB
         0YmBYgJgbX1n3JQ8FvC8+/0qK/23SknaXT1BYAgYS6VTJaOR6s8tVPe1dFfA8La13IEy
         QE5An386R6//eE0m1BC8+Q5AHC1byO5CnccjJfTSO0Ab0BnLtu2zdkMKJP001RIg0sTG
         ZmFYklcjS0lBn8y4REY92K2XlahQ9aUkLLRXsUKRHU5SbB3Hvirqxlcjvcgq4QfAJHod
         ZBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=g9iTWR+67p816vWv4eUTbB+4T/eP8zsyOLsAJSoKtlo=;
        b=K0Um6Oa2SXIb+z0SQp/un5+RhIvry2xpHRI0aLZ5VMyKahWRaBhVbOKrhgv6vxo58f
         DNn9BSbOR2q2YQqczop+WBCfqS/ECsHOLaMuLvxAjmX5BC6qpVJijr8jJuQRA4rtK5k3
         Dg78avX0RM7V1fmK3/zctX9twAiz5O4zW6EBAlRujv3d5VSd00UpyHxnTimONvcMufvn
         07WrFf1E0l4R92rIMiXvIFQ9LMeRN9c++Ecrg7kLpVq7O5qxe7Tjy046OSt4P+HV0Wgm
         MX87rLaVTL6ctfdfda6aDQ0VzVgNMgg90+E0sc6FcxvFJAasx4FXrBwBZFZsCKR+UwK6
         G8iw==
X-Gm-Message-State: AOAM530JwUG2hmJnzHr+YWdpWbWP4fRNfwF/tLTLUSV/kjJBPabFDcxz
        zQxhd9pShyFfjqhpehgEe2s=
X-Google-Smtp-Source: ABdhPJxuU9hZf/aIutOrOpK2zuTn7eGQm7+XgXJjvuQIUZhG14t+Pi9orIACi8+VsuaqZiteG3JpZA==
X-Received: by 2002:adf:f607:: with SMTP id t7mr2200481wrp.169.1606810150609;
        Tue, 01 Dec 2020 00:09:10 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id f3sm1523119wrx.10.2020.12.01.00.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 00:09:10 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
From:   Dan Scally <djrscally@gmail.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
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
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130205203.GQ4351@valkosipuli.retiisi.org.uk>
 <3e8494a0-a2c0-59e7-46bb-9635c3c239dd@gmail.com>
 <20201201064421.GR4351@valkosipuli.retiisi.org.uk>
 <2a548835-78c6-8fe3-cceb-1fc000707157@gmail.com>
Message-ID: <ee94d229-3d86-d557-1bf7-0d39239928ca@gmail.com>
Date:   Tue, 1 Dec 2020 08:09:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a548835-78c6-8fe3-cceb-1fc000707157@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 01/12/2020 08:08, Dan Scally wrote:
> On 01/12/2020 06:44, Sakari Ailus wrote:
>> Hi Dan,
>>
>> On Mon, Nov 30, 2020 at 11:06:03PM +0000, Dan Scally wrote:
>>> Hi Sakari
>>>
>>> On 30/11/2020 20:52, Sakari Ailus wrote:
>>>>> +static const struct acpi_device_id int3472_device_id[] = {
>>>>> +	{ "INT3472", 0 },
>>>> The INT3472 _HID is really allocated for the tps68470 PMIC chip. It may not
>>>> be used by other drivers; people will want to build kernels where both of
>>>> these ACPI table layouts are functional.
>>>>
>>>> Instead, I propose, that you add this as an option to the tps68470 driver
>>>> that figures out whether the ACPI device for the tps68470 device actually
>>>> describes something else, in a similar fashion you do with the cio2-bridge
>>>> driver. I think it may need a separate Kconfig option albeit this and
>>>> cio2-bridge cannot be used separately.
>>> It actually occurs to me that that may not work (I know I called that
>>> out as an option we considered, but that was a while ago actually). The
>>> reason I wasn't worried about the existing tps68470 driver binding to
>>> these devices is that it's an i2c driver, and these dummy devices don't
>>> have an I2cSerialBusV2, so no I2C device is created by them the kernel.
>>>
>>>
>>> Won't that mean the tps68470 driver won't ever be probed for these devices?
>> Oops. I missed this indeed was not an I²C driver. So please ignore the
>> comment.
>>
>> So I guess this wouldn't be an actual problem. I'd still like to test this
>> on a system with tps68470, as the rest of the set.
> On my Go2, it .probes() for the actual tps68740 (that machine has both
> types of INT3472 device) but fails with EINVAL when it can't find the
> CLDB buffer that these discrete type devices have. My understanding is
> that means it's free for the actual tps68470 driver to grab the device;
> although that's not happening because I had to blacklist that driver or
> it stops the machine from booting at the moment - haven't gotten round
> to investigating yet.
Though having said that, it looks like a separate driver like this is
the least favoured option anyway, so probably it's going to change anyway.
