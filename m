Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4212DD2CC
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Dec 2020 15:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgLQOR5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Dec 2020 09:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbgLQOR4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Dec 2020 09:17:56 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E32C061794;
        Thu, 17 Dec 2020 06:17:16 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id c5so23100561wrp.6;
        Thu, 17 Dec 2020 06:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RVg2KaUX9LtQiHzjB7xT37Qy3WEyf0tgr+9J0DJhh24=;
        b=elLHsMhscHdpWReZCb0saZ18kXY3TQwyWKKjk4J/DDSkJEa6TEqF/R1VJ9cI8Du5n1
         in7SwPFMnB072o0zodeRItpXzFA/gijJ3+s5fDtzqW8AY6NGcidWXLfTwlq9elhIq34Q
         12wKCsmDUyjy+6KOHsUuj1S1IA3RjtffIje7f5kDp+QIoL6ds9lHwEWLDt076LkYaRr0
         NIMtEk5ztziZL0+Gcx+VNfiPzPRF1I6xipCcXJ9kJADJWEsPJVxpELfzGt/OrMJRcqmu
         FkNGbljp8D3PEE01W2eZLv+y0dTo3km34j1eK693igl080OWz249961mCS7bLLaWdwSe
         jXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RVg2KaUX9LtQiHzjB7xT37Qy3WEyf0tgr+9J0DJhh24=;
        b=Hmj/QJ2lGBn5mFFfH1DcxJ6+2MjH3l9muXAqjHyEsCFgSaRfcmQUx7uWAqF9nTxvG1
         S6KjKcKtyJt9wmZEo/ldwqHA+XlwGSUgOFw72KjVCKnnKJdrgupUoZLEhwpwJ9mc1gNg
         yVbm9hx8VI40kpSFAlpFrEh1AWOPZ52RSBYCONpLp5ugkf/CF4Drxy/Re8eVaHn2Bvcc
         0xQwQDgkIlqr6X9/g99BxaU/lsfD13XU/GIDMdEYvxiSXSbx0KDd22lK3+nnRTI110Mu
         XmeRTzsWueU9CWZKlfYlMqtZr/6Cl0PipiVxDdrYEwI//P2wN/PXGV3ueKussOUxXZmG
         Cc7w==
X-Gm-Message-State: AOAM533/cMxeZmVhG1f5ievFHciRYSGYxbuAsObVcHc5OBa8Ch7ttIeC
        5LssPQcloWmJrpQrt0Gc9N8=
X-Google-Smtp-Source: ABdhPJxZvUwst1WZ0MrRvTXG9usPINfZ0wEuqEMsaqHc3yrKUJOq/opPYDvircGFa1Qjy5wmZfc4Uw==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr28326528wrq.75.1608214634962;
        Thu, 17 Dec 2020 06:17:14 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.56])
        by smtp.gmail.com with ESMTPSA id h98sm10253123wrh.69.2020.12.17.06.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 06:17:14 -0800 (PST)
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing software_node
 connections to sensors on platforms designed for Windows
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
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
 <20201215220249.GG26370@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <797dda65-aedd-6a83-3f36-0cba457e4570@gmail.com>
Date:   Thu, 17 Dec 2020 14:17:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215220249.GG26370@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sakari - sorry for delayed reply. I didn't get this email actually,
just spotted it on the newsgroup by chance.

On 15/12/2020 22:02, Sakari Ailus wrote:
> Hi Daniel,
> 
> On Tue, Dec 15, 2020 at 10:28:59AM +0000, Daniel Scally wrote:
>> Morning Sakari
>>
>> On 30/11/2020 20:35, Sakari Ailus wrote:
>>>> +/*
>>>> + * Extend this array with ACPI Hardware ID's of devices known to be working.
>>>> + * Do not add a HID for a sensor that is not actually supported.
>>>> + */
>>>> +static const char * const cio2_supported_devices[] = {
>>>> +	"INT33BE",
>>>> +	"OVTI2680",
>>>
>>> I guess we don't have the known-good frequencies for the CSI-2 bus in
>>> firmware?
>>>
>>> One option would be to put there what the drivers currently use. This
>>> assumes the support for these devices is, well, somewhat opportunistic but
>>> I guess there's no way around that right now at least.
>>>
>>> As the systems are laptops, they're likely somewhat less prone to EMI
>>> issues to begin with than mobile phones anyway.
>>
>> Just looking at this; we're currently using this with the ov2680 driver
>> that's in mainline currently (with very minor tweaks) plus a
>> hacked-into-roughly-working version of the atomisp-ov5693 driver (ACPI
>> ID INT33BE = ov5693 physical device). Neither of those drivers lists any
>> link frequencies, nor provides a link frequency control for v4l2 to work
>> with.
>>
>> On the other hand, the ov5648 [1] and ov8865 [2] drivers which Paul has
>> submitted recently, which we also want to be able to support, _do_
>> include that. I can register the frequencies Paul's defined there as a
>> link-frequencies property but this gives rise to two questions:
>>
>>
>> 1. Is this _mandatory_? Do I need to be finding the link-frequencies for
>> the OV2680 and OV5693 drivers too? Or can I skip that property where the
>> driver doesn't handle it anyway. Seems to be working fine without
>> controlling it in driver.
> 
> Receiver drivers generally need the information to program the receiver
> timing. It may work for you without using the correct frequency, but the
> risk of failure on another unit increases.

Hmm, ok. I'll see if I can find the correct values then to add to the
existing drivers.

>> 2. Can I trust all the values in the drivers to be available on each
>> platform? For example for the ov5648 Paul lists these as available:
>>
>>  938static const s64 ov5648_link_freq_menu[] = {
>>
>>
>>  939        210000000,
>>
>>
>>  940        168000000,
>>
>>
>>  941};
>>
>> But can I safely register a link-frequencies property for both of those
>> and trust that that'll work on all IPU3 platforms with an ov5648 in them?
> 
> Ideally we'd know which frequency Windows uses, and use the same.
> 
> Using another frequency may have adverse effects elsewhere in the system.
> AFAIU mostly this concerns radios of all sorts.
> 
> Now that this is in the kernel in any case, it can be fixed later on so I'm
> not too worried about it. Having still a comment there that the
> configuration is opportunistic would be nice.
> 

Understood - I'll add in the ability to add the link-frequencies plus a
comment explaining.

Thanks
Dan

