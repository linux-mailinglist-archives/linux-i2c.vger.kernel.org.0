Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051832FB9A8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 15:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392057AbhASOgq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:36:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405252AbhASLMn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 06:12:43 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A5BC0613C1;
        Tue, 19 Jan 2021 03:12:02 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id y187so16349257wmd.3;
        Tue, 19 Jan 2021 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vzBb5/Tv6UlBk+EMbkqMhlDzSJvMQnejvX8e7cfy6pY=;
        b=iyKbA/ref/cqKHgmpv0D2SbIRkZVdsRnvxsb1kFyMXSwCclym02NRPq2rQUaahMNWf
         fFOWZgA4hllMQSYlubBVGt3BNHoMUSYFtQXTeNCgHOdlnMMnoMIsf/ShygjQZiucVuCk
         i09fmQjHgfbGTL2MeqfkeC1iGYWKDcHtbZVopWJO62y47u2A3ZC7G5MfmrpyV8pLTixn
         U7a5PhbLQcQe3K0K8FKJ/Vax2pFtkcbfQig32ukhx9PrijsfqDUfzkcjbtJGIQdkxCMd
         ERW/P9Sg5AnY1Z5qLRkxdgA/OJsNYEN1ZVDGxEPSZGEQtcwoXxWZixH0Cf54RKs5+WcM
         NfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vzBb5/Tv6UlBk+EMbkqMhlDzSJvMQnejvX8e7cfy6pY=;
        b=nufY3A+laS7DgkUbNxdtQg9/Vj+0bGZut2jhfL160Ck8nmV0qGdLAOF4HG2eFHJk0R
         fUBzB130DMC5MQVljTfy3Jn65KX+DdOZT9CPApn4WQK3WY2ryKy8weP/Dou/zT3c7OTk
         pZ5YdxfxYZ8aZAwYQ+/4ETKtN1nBkXg8LcFY/i5KLk9hbI3FSDEBe+lyScg7J3jPXVJx
         JpfTqPiElAXtnRwyMLAB+NfOnDcQa4/iPg17lbIosxUojafYH+Hvz+/P1HhICRSQLEFm
         jZj8xAy6NASpbmM3ypogB/OUcfRuLqdGsssSRbgY4AKmeQL/JAC/0ct6kDn1y2mGvxih
         E4Lw==
X-Gm-Message-State: AOAM532fqqkdequECosTr3D7GuUu/+8IAgd9eGHdw0jcGYzNTWRl1NXh
        2OSZT+3mn26KIDHDlhggjuI=
X-Google-Smtp-Source: ABdhPJzXyvKMRBHff/3egHeqjvWcHG8JKBSU0/vF5pWK95xFgz+RG+FsjEHU51pFgAwOPbn5ONplsA==
X-Received: by 2002:a1c:24c4:: with SMTP id k187mr3693910wmk.14.1611054721747;
        Tue, 19 Jan 2021 03:12:01 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id 17sm3833428wmk.48.2021.01.19.03.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 03:12:01 -0800 (PST)
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <2d8d7072-3b6f-4ffa-29dc-51f31fe4af72@ideasonboard.com>
 <20210119111122.GU4077@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <c720ec32-b6d1-9b78-376e-4e3686878d70@gmail.com>
Date:   Tue, 19 Jan 2021 11:12:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119111122.GU4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 19/01/2021 11:11, Andy Shevchenko wrote:
> On Tue, Jan 19, 2021 at 10:56:17AM +0000, Kieran Bingham wrote:
>> On 18/01/2021 00:34, Daniel Scally wrote:
> ...
>
>>> +config INTEL_SKL_INT3472
>>> +	tristate "Intel SkyLake ACPI INT3472 Driver"
>>> +	depends on X86 && ACPI
>>> +	select REGMAP_I2C
>> I've tried compiling this as a built in and a module and on my minimal
>> config I had failures on both for regulator_register and
>> regulator_unregister.
>>
>> I suspect this needs to have either a selects or a depends upon
>> CONFIG_REGULATOR
> Valid point, although it seems no consensus on which is better to use. It seems
> to me that in this case we need to select it.
>
Yeah; it will be necessary for the gpio-regulator too anyway I expect.


Thanks Kieran; I missed that entirely.

