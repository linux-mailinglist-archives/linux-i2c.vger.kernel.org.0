Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035412C98D6
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 09:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgLAIJL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 03:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbgLAIJL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 03:09:11 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C92C0613CF;
        Tue,  1 Dec 2020 00:08:30 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id e7so1194120wrv.6;
        Tue, 01 Dec 2020 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=99krgEgmvPyXh9ZQjYVBo+1iPZ8DLbvdF3xGcdnmtqk=;
        b=Pfg2EMGZfOdGmmFhQPHaBoNDQCjVxQypIcGb9fnIfhh/DBjGu9YaNLrrXCQrpb3MCP
         nyGtPU7jW6k6SaReLFR8UQprwTnY3GMtmYuM4HpEwxrLNShCugEVfG+ecMHWdu2zIhL/
         Lqir0j4/8ydSL2ybj5Xx5nvydnMMFNBIz5iCrnQS89l4R8WsQ/638EaHcHIPi64zaoWL
         d1DvIp8cHs9QWy6RpYvLsA9O3CE2wEHWUp8bdinrVfnLgpCqTNpSiUgeTZ22h8H/DJsL
         9mkhr2RSaLgE/v1h4vrgZMXFf6ThsjxxZiT99EOyd7+8gyGt/iw2P/cvv8f9ReuiVk9F
         eImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=99krgEgmvPyXh9ZQjYVBo+1iPZ8DLbvdF3xGcdnmtqk=;
        b=Rml+IawEjGq73dzPvC2wq/oo7giVCpDby3nQHutvc8O7bfRJiHL/YEZNW1NCgPFecK
         Ss1FVt+ofzb2UAhOVnwoOuKciBqHxXBgcXzM4hcDFBWfs+OMs3HBTGWguIQO6ah6BatW
         qb+9ETqW5Ajh0AMncjPmx01mjFW9QHAD4SvYSNksJuQFlSWwDwsJiNR6xhgai6C8H3nA
         Oi57+KuFj8lWZgfJUV0B4uSHH3w1p7wxGMQNOh1R4cVTTNjtPONLzfn/yiuz1V018pzw
         5g0Bh3YZ9z99VUH5+g4MNbmtiVJMBaVnzpWfph6O2zve4M11kRRz2kwlqosNnd57t7xi
         8nBQ==
X-Gm-Message-State: AOAM531QrzNIt//SvfK0CEI5/btBdBkLOPBTiFvyBVKgvp1z3nBbQ2Pz
        SyYL986MWQg+0LoMe4kbJco=
X-Google-Smtp-Source: ABdhPJzm9mXIOAmMjVOEQ8IeSFfvoWpTmNSW18f1E8MZVVN0X8sQOPCDp756LbX+4Tt6iDmX3GQgcw==
X-Received: by 2002:a5d:5482:: with SMTP id h2mr2228040wrv.18.1606810109391;
        Tue, 01 Dec 2020 00:08:29 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id d13sm1726573wrb.39.2020.12.01.00.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 00:08:28 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
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
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <2a548835-78c6-8fe3-cceb-1fc000707157@gmail.com>
Date:   Tue, 1 Dec 2020 08:08:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201064421.GR4351@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 01/12/2020 06:44, Sakari Ailus wrote:
> Hi Dan,
>
> On Mon, Nov 30, 2020 at 11:06:03PM +0000, Dan Scally wrote:
>> Hi Sakari
>>
>> On 30/11/2020 20:52, Sakari Ailus wrote:
>>>> +static const struct acpi_device_id int3472_device_id[] = {
>>>> +	{ "INT3472", 0 },
>>> The INT3472 _HID is really allocated for the tps68470 PMIC chip. It may not
>>> be used by other drivers; people will want to build kernels where both of
>>> these ACPI table layouts are functional.
>>>
>>> Instead, I propose, that you add this as an option to the tps68470 driver
>>> that figures out whether the ACPI device for the tps68470 device actually
>>> describes something else, in a similar fashion you do with the cio2-bridge
>>> driver. I think it may need a separate Kconfig option albeit this and
>>> cio2-bridge cannot be used separately.
>> It actually occurs to me that that may not work (I know I called that
>> out as an option we considered, but that was a while ago actually). The
>> reason I wasn't worried about the existing tps68470 driver binding to
>> these devices is that it's an i2c driver, and these dummy devices don't
>> have an I2cSerialBusV2, so no I2C device is created by them the kernel.
>>
>>
>> Won't that mean the tps68470 driver won't ever be probed for these devices?
> Oops. I missed this indeed was not an I²C driver. So please ignore the
> comment.
>
> So I guess this wouldn't be an actual problem. I'd still like to test this
> on a system with tps68470, as the rest of the set.
On my Go2, it .probes() for the actual tps68740 (that machine has both
types of INT3472 device) but fails with EINVAL when it can't find the
CLDB buffer that these discrete type devices have. My understanding is
that means it's free for the actual tps68470 driver to grab the device;
although that's not happening because I had to blacklist that driver or
it stops the machine from booting at the moment - haven't gotten round
to investigating yet.
