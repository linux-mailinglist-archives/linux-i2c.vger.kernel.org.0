Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAFE2DAAF0
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Dec 2020 11:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbgLOKdL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Dec 2020 05:33:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgLOKdF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Dec 2020 05:33:05 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CCA5C06179C;
        Tue, 15 Dec 2020 02:32:19 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id c133so4387370wme.4;
        Tue, 15 Dec 2020 02:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zM12Vu2WHRPOJz6hUWWLoP76rHHBWWIXvKZ62qMZpOo=;
        b=Ql5S7sxstdmE3XGP6QmWP0l1O9dxtvqCl/284IlCrUCXxpNOrcC0QhvH5hsY2qDorn
         2unlqivrj9Afdl+JM6qHZ9zR8tWIxZDexIyb/QwtWi1Vhs76RX0HqtUNd+SZubvAvtUC
         i8vtQkdk+d2BrVi+FE5xFNRT9/GPcjTe3fxyKUswyttdj1dBwf/2r4wUqxM0dG6px1AX
         jGa004iWa7wV8WsFMQqu1MF2OVKdic3gNA5ZnJ2qtGkKSMHcAj8p8HEamYhVz9wPHzzk
         u4PaqR71RCuR48pyK7kIsqWttGnHo0wqzi17IilT1MpnknokiKL59i2MzhJEc4VF+LPv
         Xkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zM12Vu2WHRPOJz6hUWWLoP76rHHBWWIXvKZ62qMZpOo=;
        b=MA9SdzFd3d5K4PTRtWKwpSFiwLEpm7ma37CrX9HqNlLl6taFwK3A4/Q/wJdr52S2No
         dsx/recqfgqq4EjWlb6imF9DqLYfozolIXZx+aZczpiye77yc1wSn+KDS/3i9vzVJcQl
         59MQvAEuUsW0XMmkiVBhapB6DjfIuD3sWyb8qXE3RSkD2QUMLtufZGJ3jU1ys0gDJhvj
         rnzMQXG60ntYhFSeUMrxkpqHW3CAmd2C6s4n31m2Bk5k9E8C/5pOtWy91ms7g1Nd6vq1
         vyphKO0NyK0v8TZ7TamCN2v6baKnbgcVU4y5dYpOudUmnp35mI8ADNjyTL3hgTGwVi+W
         MhQA==
X-Gm-Message-State: AOAM531mmFkCh9V1adiwJUDoEJaZfYc4u2B8zEOy50DspSKDdLnDEBcN
        NZhPHvfzE4Upkyvc8Rojyuo=
X-Google-Smtp-Source: ABdhPJwZ82yXRV2xba7TcgkEC4E5GvoMBYDenAO+wt6vgbm4LkRqezVikCXN+mePBO1G2X+9RsAANQ==
X-Received: by 2002:a1c:a9c8:: with SMTP id s191mr3348516wme.89.1608028338138;
        Tue, 15 Dec 2020 02:32:18 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.56])
        by smtp.gmail.com with ESMTPSA id e17sm35548101wrw.84.2020.12.15.02.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 02:32:17 -0800 (PST)
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing software_node
 connections to sensors on platforms designed for Windows
From:   Daniel Scally <djrscally@gmail.com>
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
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-14-djrscally@gmail.com>
 <20201130203551.GP4351@valkosipuli.retiisi.org.uk>
 <5238fc28-350b-a785-0a33-edeba9dfb096@gmail.com>
Message-ID: <aff13cfd-5664-8b49-d188-ac1e2adec0b9@gmail.com>
Date:   Tue, 15 Dec 2020 10:32:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5238fc28-350b-a785-0a33-edeba9dfb096@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15/12/2020 10:28, Daniel Scally wrote:
> Morning Sakari
>
> On 30/11/2020 20:35, Sakari Ailus wrote:
>>> +/*
>>> + * Extend this array with ACPI Hardware ID's of devices known to be working.
>>> + * Do not add a HID for a sensor that is not actually supported.
>>> + */
>>> +static const char * const cio2_supported_devices[] = {
>>> +	"INT33BE",
>>> +	"OVTI2680",
>> I guess we don't have the known-good frequencies for the CSI-2 bus in
>> firmware?
>>
>> One option would be to put there what the drivers currently use. This
>> assumes the support for these devices is, well, somewhat opportunistic but
>> I guess there's no way around that right now at least.
>>
>> As the systems are laptops, they're likely somewhat less prone to EMI
>> issues to begin with than mobile phones anyway.
> Just looking at this; we're currently using this with the ov2680 driver
> that's in mainline currently (with very minor tweaks) plus a
> hacked-into-roughly-working version of the atomisp-ov5693 driver (ACPI
> ID INT33BE = ov5693 physical device). Neither of those drivers lists any
> link frequencies, nor provides a link frequency control for v4l2 to work
> with.
>
> On the other hand, the ov5648 [1] and ov8865 [2] drivers which Paul has
> submitted recently


Forgot to actually link these:


[1]
https://lore.kernel.org/linux-media/20201211154027.153535-1-paul.kocialkowski@bootlin.com/T/#m5eb18611b7df1538ed4924422583b62cc61dbfae

[2]
https://lore.kernel.org/linux-media/20201211154428.153762-1-paul.kocialkowski@bootlin.com/T/#m6d4fd5e590b1c4583d4a74f5ae938ea011408640

