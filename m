Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A972C9367
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 00:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387702AbgK3Xze (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 18:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730700AbgK3Xze (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 18:55:34 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A512C0613D2;
        Mon, 30 Nov 2020 15:54:48 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id g185so547241wmf.3;
        Mon, 30 Nov 2020 15:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XBVRd2hhngL7guRqxXoC+QmFNH1wDfQZ2r1tO/S1i2A=;
        b=hX7kS0puFUA4k++ZIgBDD+63kiOTSWzMy/Tz8ax7odizmx2YYGNq4JMCofNndfd0Ue
         m7TuxVLJAHElznp5dlpzyk1ss5m0Iv8uEtXlemyafAj5FPRXgWDSnVK1kZffbXo4ktgq
         EyYiw/pHEys6cy7MY2DZYMEO7YxXsSPGHZJibuVWxlAtx948IOY2supb1tIHVg6Q+fQy
         KsQjw4ZlkPym7aZFQ4LSOJmyaGFKMVmL7cRHjIZ2xh0UpXhxoJ50nOuoFHIsj5RgnGtx
         tOjDAJ8r0aCS5BEKjeGDHkA8XJFTdSMI0HoRAeW7VEuET9qAyFKgXQXBLgz/u2FlJbtb
         xojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XBVRd2hhngL7guRqxXoC+QmFNH1wDfQZ2r1tO/S1i2A=;
        b=NZNMXPxeCYBOwfyUHkUNWBcaMPonAjJ0ksapR/g7L8P38L/hGzZk1EGsMkntduQb3g
         zJKuJvkNDxfkNcgxhBEWzpPHRY8mrmzLbjLkQbbNtkoOZFF0FsBG2SHWIjZ2ue0bhnwm
         piSROj0j7s8B4Qfa71MNalMMJM/a5nFqu/MqUQq5+bMXNiOs81pVw+Ff1sxbLlfIRqXm
         D+PucpCp30hifpQ6eVe5PKwGxCBL/8TTSA8CeGPjL4IsgVDss48r3cZAcJL62Nqhj8D5
         fnZR9D85uk4CTQju1vFhRBJbIkPw6jh4hzNTEfD/gbUmuRQebcxBwnTFPZJLVCO+RBGa
         nUOw==
X-Gm-Message-State: AOAM533G0xChQEma1AfbKac+lvnF4tZaxfudZGrIOjjJva8wX0gAgNqB
        4+ol3KtatFLirq+e1stcfEY=
X-Google-Smtp-Source: ABdhPJxfNT0ptDh8zvsMLBjWl4plsBQOlWBrJWvdYxLVXpb3GxHK+GR+xrYL/ad3X322z4IcAJOa9A==
X-Received: by 2002:a7b:c849:: with SMTP id c9mr272766wml.101.1606780486874;
        Mon, 30 Nov 2020 15:54:46 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g11sm30902199wrq.7.2020.11.30.15.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 15:54:46 -0800 (PST)
Subject: Re: [PATCH 14/18] acpi: utils: Add function to fetch dependent
 acpi_devices
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 <20201130133129.1024662-15-djrscally@gmail.com>
 <20201130182354.GW4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <26d7fa3f-3552-90e0-1f64-5c39449dcdd7@gmail.com>
Date:   Mon, 30 Nov 2020 23:54:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130182354.GW4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

On 30/11/2020 18:23, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 01:31:25PM +0000, Daniel Scally wrote:
>> ACPI devices declare themselves dependent on other devices via the _DEP
>> buffer. Fetching the dependee from dependent is a matter of parsing
>> _DEP, but currently there's no method to fetch dependent from dependee.
>> Add one, so we can parse sensors dependent on a PMIC from the PMIC's
>> acpi_driver.
> Do I understand correctly that it's an existing table provided by firmware that
> (ab)uses _DEP in such way? Note, the specification doesn't tell we may use it
> in this way, OTOH I don't remember if it strictly forbids such use.
>
> So, please elaborate in the commit message why you need this and pint out to
> the 6.5.8 "_DEP (Operation Region Dependencies)" which clearly says about
> OpRegions and that part already supported by ACPI in the Linux, if I'm not
> mistaken, need to refresh my memory.


Laurent's reply is good explanation, but for example see my Lenovo Miix
510's DSDT:


https://gist.githubusercontent.com/djrscally/e64d112180517352fa3392878b0f4a7d/raw/88b90b3ea4204fd7845257b6666fdade47cc2981/dsdt.dsl


Search OVTI2680 and OVTI5648 for the cameras. Both are dependent on
IN3472 devices (PMI0 and PMI1) which are the discrete type that we're
attempting to handle here.

>
> ...
>
>> +	handle = adev->handle;
>> +
>> +	if (!acpi_has_method(handle, "_DEP"))
>> +		return 0;
>> +
>> +	status = acpi_evaluate_reference(handle, "_DEP", NULL, &dep_handles);
>> +	if (ACPI_FAILURE(status))
>> +		return 0;
>> +
>> +	for (i = 0; i < dep_handles.count; i++) {
>> +		struct acpi_device_info *info;
>> +
>> +		status = acpi_get_object_info(dep_handles.handles[i], &info);
>> +		if (ACPI_FAILURE(status))
>> +			continue;
>> +
>> +		if (info->valid & ACPI_VALID_HID) {
>> +			ret = acpi_bus_get_device(dep_handles.handles[i], &candidate);
>> +			if (ret || !candidate) {
>> +				kfree(info);
>> +				continue;
>> +			}
>> +
>> +			if (candidate == dependee) {
>> +				acpi_dev_put(candidate);
>> +				kfree(info);
>> +				return 1;
>> +			}
>> +
>> +			kfree(info);
>> +		}
>> +	}
> Can you utilize (by moving to here and export for ACPI layer the
> acpi_lpss_dep()?
oooh, yes, I think I can. Thank you!
