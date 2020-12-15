Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895672DAAE6
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Dec 2020 11:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgLOKaB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Dec 2020 05:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727618AbgLOK3y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Dec 2020 05:29:54 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B39C06179C;
        Tue, 15 Dec 2020 02:29:02 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id c5so15662732wrp.6;
        Tue, 15 Dec 2020 02:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bEPk2uGzECYAQJ4oI/j29UH0rIRPTZKl5uP1+LSK3t0=;
        b=XwsRumAI61dONDNOV52HiUwTKEmlpOmfropbwQKjP4fTAgS2/tpIpiPaeRQ7J7mBSx
         uObBrIiZBVdHrzDlAkdubBcDmbYSa7RkYHC2s46lAIquWeF9IKQcZZHUuBmHkoQusOJL
         iLMMKC23AnY9esp0GRoPCSGODkz1g9MsxTYVe35d5x0WqcBry8xN57fEhecqzfIurVT0
         43GCCrHxpxaj1rWi0SV+Dvb7B6/pwJsT8ugxpuoXhhu6qxf7pRnPe0EdYv3KkyQOgTLi
         ewZkCCIzt+uw/0vT8/LHNFABgp6sAwjr8yDrbmDv/L0OyDkhv37T16yzBZ6xC2HS4268
         m2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bEPk2uGzECYAQJ4oI/j29UH0rIRPTZKl5uP1+LSK3t0=;
        b=oxO/gZ9UrHaMNTNQ0i06o1l8AC+TcPzQdu4SKKMNCPwuFLAEm6YpljZeIQVBfWzNos
         RBhrtw8Ws5W3ptQ4zQXimXmcYy5CoSqstGYsMludn0IBzvrfX+rfL+KQ4pvXnUx0x/oD
         latTCGL9h1vWQ0LsBklAOZ5pr9Lck8sfNLsEDPx0ivesoPDLu7ZaJeBoFUI2qeSjnG90
         rHL3VT9Bbq/m+xeZHGUzZKd5DSoLkaebEqmHyLkY/1iWcewA9hPRK8rsBikYx2sqoYdR
         2KLgn3R4bhpnfDmo0kKfKhfIcsJO0Recuu5JXaq0xan5jEqiYRUa707vE9hxBmg87n3U
         8uWA==
X-Gm-Message-State: AOAM531USwUOlK/Gwfwxpt8lvGpe5qVsARxO+u4jwcM2c23Edu+STfn9
        LLiU2jEl/qV3Y/xfiMdddIQ=
X-Google-Smtp-Source: ABdhPJxqL2E61WJUkFapZMQ/brMjvDKVvba9iJH8655/cxH4Jg3M4Y54HtGk5DAJ3wrzoPm5ZzAIvg==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr25426154wru.43.1608028141652;
        Tue, 15 Dec 2020 02:29:01 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.56])
        by smtp.gmail.com with ESMTPSA id q15sm36200111wrw.75.2020.12.15.02.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 02:29:00 -0800 (PST)
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing software_node
 connections to sensors on platforms designed for Windows
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
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <5238fc28-350b-a785-0a33-edeba9dfb096@gmail.com>
Date:   Tue, 15 Dec 2020 10:28:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130203551.GP4351@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Morning Sakari

On 30/11/2020 20:35, Sakari Ailus wrote:
>> +/*
>> + * Extend this array with ACPI Hardware ID's of devices known to be working.
>> + * Do not add a HID for a sensor that is not actually supported.
>> + */
>> +static const char * const cio2_supported_devices[] = {
>> +	"INT33BE",
>> +	"OVTI2680",
> 
> I guess we don't have the known-good frequencies for the CSI-2 bus in
> firmware?
> 
> One option would be to put there what the drivers currently use. This
> assumes the support for these devices is, well, somewhat opportunistic but
> I guess there's no way around that right now at least.
> 
> As the systems are laptops, they're likely somewhat less prone to EMI
> issues to begin with than mobile phones anyway.

Just looking at this; we're currently using this with the ov2680 driver
that's in mainline currently (with very minor tweaks) plus a
hacked-into-roughly-working version of the atomisp-ov5693 driver (ACPI
ID INT33BE = ov5693 physical device). Neither of those drivers lists any
link frequencies, nor provides a link frequency control for v4l2 to work
with.

On the other hand, the ov5648 [1] and ov8865 [2] drivers which Paul has
submitted recently, which we also want to be able to support, _do_
include that. I can register the frequencies Paul's defined there as a
link-frequencies property but this gives rise to two questions:


1. Is this _mandatory_? Do I need to be finding the link-frequencies for
the OV2680 and OV5693 drivers too? Or can I skip that property where the
driver doesn't handle it anyway. Seems to be working fine without
controlling it in driver.
2. Can I trust all the values in the drivers to be available on each
platform? For example for the ov5648 Paul lists these as available:

 938static const s64 ov5648_link_freq_menu[] = {


 939        210000000,


 940        168000000,


 941};

But can I safely register a link-frequencies property for both of those
and trust that that'll work on all IPU3 platforms with an ov5648 in them?

Thanks
Dan
