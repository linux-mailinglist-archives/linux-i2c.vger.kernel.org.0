Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 799A42FA1C6
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 14:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404570AbhARNiD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 08:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404563AbhARNh7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 08:37:59 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95FA1C061574;
        Mon, 18 Jan 2021 05:37:18 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id q18so16517481wrn.1;
        Mon, 18 Jan 2021 05:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0GzTuPlUmDlKAUOrTakw6mXZi0BGp+BTd5mEhKzsE+Y=;
        b=tbqoUD1yUgihkyIV/iG6PchxPwEEkIAUVuetxA75KepkQeOSsnIrYS9EK6v7ZOtYA9
         IBGyo+kGzKw5FTjO+Ad8ncYjSkSivJpdhTIHcFrP93uElvxQFMrZEqFvILABrpw4hu+i
         hrF+pMhcU+wjsAJMeDt53poZyUuuWR2owSvA6g+yXeLw1C+fvii8looKEAoe4j8gPjIW
         hMEZbOi7LBVNzv8VciTLds8PkmLlBFO2DTrMHk8gJcAN7UaTHmasUp+dGLcQA/Gw4tv2
         DJ9PW6RDw0CbLP2hMGD/zrUsTqPKK+wuLC+nL4hbHKZ5iuBNAtNhMNaf5G9ML5rgWecr
         9/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0GzTuPlUmDlKAUOrTakw6mXZi0BGp+BTd5mEhKzsE+Y=;
        b=McuMqQPb2zCx5ou/J+LVZ2bY2nE/lOSf0VXxOb3KeyoV/i8hyptZWF8OtLq/LccNLc
         eNIeBKLBki1ef4xMqU0XqWfAACDTusvsG/9hqrOoBFRG1biq675UWBrtEhzos2NIhjgw
         J6ssCUssrncuHzVwv5YkogiWlSl0Q1S/qmeISYWJ+WvTqZOo95Fdc5EIt8QyjHmGXEgM
         c4jAQNsablqJclU52emH4W0mOBUQzOX+xSJJUGvxdUIWDKk2YUBJFSoYU8oWWVV6yy4+
         Uh5mzIFN9iiLggd1z3iv3mtjTMiJBof71zbLbEXOOakdIL0liaXIE7WbOV2CMiCn/ijU
         spjA==
X-Gm-Message-State: AOAM533UkJyXxgzGbXAOSXWy/N3PWsqu6HTGibhsiNM9MDMoR18H5AwJ
        kXf0M5vmDfWN/zpiV/p65zc=
X-Google-Smtp-Source: ABdhPJzEAiBeMBKPwY1u7Uw98g43mjmAdoEw7ZgexSS/BfValqgZ8NFe8jJicfnFbGGpQDebn+LkVw==
X-Received: by 2002:adf:d231:: with SMTP id k17mr24905141wrh.264.1610977037314;
        Mon, 18 Jan 2021 05:37:17 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id u5sm9676387wmg.9.2021.01.18.05.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 05:37:16 -0800 (PST)
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent
 acpi_devices
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-3-djrscally@gmail.com>
 <20210118123355.GF4077@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <c4875559-d735-67ff-66a2-8fd2bc1eceab@gmail.com>
Date:   Mon, 18 Jan 2021 13:37:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210118123355.GF4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 18/01/2021 12:33, Andy Shevchenko wrote:
> On Mon, Jan 18, 2021 at 12:34:23AM +0000, Daniel Scally wrote:
>> In some ACPI tables we encounter, devices use the _DEP method to assert
>> a dependence on other ACPI devices as opposed to the OpRegions that the
>> specification intends. We need to be able to find those devices "from"
>> the dependee, so add a function to parse all ACPI Devices and check if
>> the include the handle of the dependee device in their _DEP buffer.
> Fix prefix to be "ACPI / utils: " and rebase on top of function name changes as
> suggested by Laurent.


OK.

>> +/**
>> + * acpi_dev_get_next_dep_dev - Return next ACPI device dependent on input dev
> Are you expecting some kind of for_each_*() macro to be added and used?
> Otherwise there is probably no need to have it "_next_" in the name as it will
> be a bit confusing.


I thought that somebody might want to do that in the future yes,
although I've no need for it at the minute because each of the dummy
INT3472 devices only has one dependent sensor that we've seen so far.
But for the INT3472 devices representing a physical TPS68470, there are
platforms where 2 sensors are called out as dependent on the same PMIC
ACPI device (Surface Go2 for example).

It can be renamed and just cross that bridge when we come to it though,
I have no problem with that.

>
>> + * @adev: Pointer to the dependee device
>> + * @prev: Pointer to the previous dependent device (or NULL for first match)
>> + *
>> + * Return the next ACPI device which declares itself dependent on @adev in
>> + * the _DEP buffer.
>> + *
>> + * The caller is responsible to call put_device() on the returned device.
>> + */
