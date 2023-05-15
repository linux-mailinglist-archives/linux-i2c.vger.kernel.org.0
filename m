Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E4C702C4B
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 14:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241436AbjEOMHX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 08:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241292AbjEOMHO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 08:07:14 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36B3E75;
        Mon, 15 May 2023 05:07:05 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ad89c7a84fso104814881fa.2;
        Mon, 15 May 2023 05:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684152424; x=1686744424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8S8sAP8Fagl8K2YKg4fpZu8ftXd+FY79lvepC4kyJc=;
        b=gl10t5IbWZvPcfimSxWMYLFLFqoygfcXT3axtUv5YJ0sZCmKOVDWCcA2VWB/F/jfl1
         tOX0mXfr8Is8+xw0FyIJDHCHM+7EjBNF+iwr2/sabkjo+RzWjFa4HXk1rYF4Ug54Zd3i
         psJomYgEd//rjA5m9jk7cDquT0MUT/nj9GFEB7JpiwatlWBoDWCBmKKDo45ybD7xwH2U
         3i8Fy5t/yKYMUu1McU8RhaFc3Pmk+/yWron5oQ23I8SCJ9dDvi5JoTb02Jl2Oqd7wRY1
         KmDbBrwzVQiwb0+iRND6zIv6PYQIlKsyD1Q4Q4Y2k6wDC5gR6SR68LG+ssXW2pMADWP3
         zVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684152424; x=1686744424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8S8sAP8Fagl8K2YKg4fpZu8ftXd+FY79lvepC4kyJc=;
        b=IqfL1cdi2epzAwjnbwrMmtAC0xsHNesVf8C+vCP28xCqBlDlx63kYesgDOpyzn0m1y
         Mxch++AOW7k+ExA108thYghlESpgGPHnfS+28NRUu/fQmB09IWtg6xRTi+q8BBAmoY8x
         vNKqQapSsOn7pZQzcS0yyOPfoM7vf8eiUC+qgBGNLfT/4mUoU4sSXXIL4+UF4ZPZfAp7
         rREZsSjOd6wSZ3kfR1/ZmkdEiZmDV+mCigT+8+iqQzOZG9v4VmHwNLor7ezcQdJTYRGz
         Vr3wNbtndACmhuMH23eDvSJnL5h9tq16TVVShKaJNprXxRlWFmnYBOnFdfpfW0KPOsQj
         UWfQ==
X-Gm-Message-State: AC+VfDxeAKJpdmOcWHhhuItnqXjsflYYgQGN/hBC9tjxiFqFy9t6mrIf
        fKk6S26PmuOMmktP1/47qiU=
X-Google-Smtp-Source: ACHHUZ4ImT+NseNLVCHJyYNbiz8/qaEbKm2bXboMyU3yUX3Tpo+dB8WlLspZbxMxQ3NzRnCu321l5g==
X-Received: by 2002:a2e:9496:0:b0:2a7:9884:ad53 with SMTP id c22-20020a2e9496000000b002a79884ad53mr6689938ljh.48.1684152423793;
        Mon, 15 May 2023 05:07:03 -0700 (PDT)
Received: from [192.168.1.126] (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id q18-20020a2e9692000000b002ac7a25c001sm3756668lji.24.2023.05.15.05.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 05:07:03 -0700 (PDT)
Message-ID: <0fb0ef4f-b310-0922-2823-e8737159bf26@gmail.com>
Date:   Mon, 15 May 2023 15:07:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/3] drivers: fwnode: fix fwnode_irq_get_byname()
Content-Language: en-US, en-GB
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org
References: <cover.1683875389.git.mazziesaccount@gmail.com>
 <9dd75817886fbb2a0cc58e2248dbba52d8a6d908.1683875389.git.mazziesaccount@gmail.com>
 <20230513194003.5a27a841@jic23-huawei>
From:   Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20230513194003.5a27a841@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jonathan,

It was somewhat busy "Mother's day" weekend for me but now I'm back in 
the business :)

On 5/13/23 21:40, Jonathan Cameron wrote:
> On Fri, 12 May 2023 10:53:00 +0300
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The fwnode_irq_get_byname() does return 0 upon device-tree IRQ mapping
>> failure. This is contradicting the function documentation and can
>> potentially be a source of errors like:
>>
>> int probe(...) {
>> 	...
>>
>> 	irq = fwnode_irq_get_byname();
>> 	if (irq <= 0)
>> 		return irq;
>>
>> 	...
>> }
>>
>> Here we do correctly check the return value from fwnode_irq_get_byname()
>> but the driver probe will now return success. (There was already one
>> such user in-tree).
>>
>> Change the fwnode_irq_get_byname() to work as documented and according to
>> the common convention and abd always return a negative errno upon failure.
>>
>> Fixes: ca0acb511c21 ("device property: Add fwnode_irq_get_byname")
>> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Whilst the docs don't contradict behaviour for fwnode_irq_get()
> unlike the byname() variant, it does seem odd to fix it only in this
> version rather than modifying them both not to return 0.

I think you're right. I think I overlooked this because the whole thing 
started as a documentation fix :)

> Is there clear logic why they should be different?

Not that I know of. I'll re-spin this with fwnode_irq_get() modified if 
no-one objects. Thanks for pointing this out!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

