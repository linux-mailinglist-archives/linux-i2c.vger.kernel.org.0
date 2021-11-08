Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A339449910
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 17:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbhKHQJj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 11:09:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39037 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239265AbhKHQJi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 11:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636387614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y1FCpwnoXru8LCUd4AbjW/RHjevdkDPK2hMhE65LRpk=;
        b=EYIAf2ZWNP7cYGOtHBFD+XOv6j8eSDzivSBqQuaHMvMIgEynjerB3lg1EE/zox2ERpotiK
        eXRdhRhpilfG10ncU4btPIswAayW+l+bE08B7bp5xgU4Hep6KkMmQV0Ztx7OYdMH3Yuxxg
        bPuOWITDt8iMvZOUpGDKniVQvdjkXZo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-f_M2yCXqNTenZcFLhQO_kg-1; Mon, 08 Nov 2021 11:06:52 -0500
X-MC-Unique: f_M2yCXqNTenZcFLhQO_kg-1
Received: by mail-ed1-f71.google.com with SMTP id x13-20020a05640226cd00b003e2bf805a02so14802828edd.23
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 08:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=y1FCpwnoXru8LCUd4AbjW/RHjevdkDPK2hMhE65LRpk=;
        b=JwfDNC0XCdMwNt1L34/5P2UalhSLohwim0S6SR7aRF2eysZggpCKSRTTJ3JQaJdhOx
         EZF7U/9d0XiQHqvZEVAb4TOxoV5IaZjBfNFl9y1O14BwdxMTlpsr2NshlIgs90n2g7vL
         y3ztv6IqRcAd0R/ndjvXsMZFhkpqwdMBwfzhcwn3/Y+i7K76xdJFvQwTT/He9kZImG9K
         t5WXBfF2Ti0bt7tyDpQ0pmC+j7tOIEIEc3aB225SJ1cozN4n9wqQ0CzyOq6mr0Nv60Lk
         TjhnjSGuO9mAx6xM4dkXoH4C1dRaRiw3lyscUs1ey586KWumc31+2L8ogb/7MDasFIod
         GuZg==
X-Gm-Message-State: AOAM530rlx2qo2zVyX0pfkDw6DxfTK5sndo+FhXDHHq9w06a1XQbfhCN
        xmSclLB1s/XALcGBOYfolGccu+0AIcqx/UJeRmIyNu80pCKhA3zoS5ScQTqO6AQ/bpSoeERvRdh
        V8hwZ+q5hCEhRGx4PXrTk
X-Received: by 2002:a05:6402:42d3:: with SMTP id i19mr351685edc.82.1636387611540;
        Mon, 08 Nov 2021 08:06:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyu9/pkrAjKIXIFB1SkeQQxKCuuMdfW8j3XbHSYc37jzZgl2Op4II0m3tdXn02+xuywOMqKXw==
X-Received: by 2002:a05:6402:42d3:: with SMTP id i19mr351664edc.82.1636387611366;
        Mon, 08 Nov 2021 08:06:51 -0800 (PST)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id q8sm3675287edd.26.2021.11.08.08.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 08:06:50 -0800 (PST)
Message-ID: <6ffd2b8c-00f4-211e-de57-23d5159ae7d4@redhat.com>
Date:   Mon, 8 Nov 2021 17:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 10/13] power: supply: bq25890: Add support for registering
 the Vbus boost converter as a regulator
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sebastian Reichel <sre@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>
References: <20211030182813.116672-1-hdegoede@redhat.com>
 <20211030182813.116672-11-hdegoede@redhat.com>
 <CAHp75Vc=dZ1FPeDgaY8S+dSu8i=QUgbLN2NVOcsMz6h0uytNeg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc=dZ1FPeDgaY8S+dSu8i=QUgbLN2NVOcsMz6h0uytNeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/31/21 00:13, Andy Shevchenko wrote:
> On Sat, Oct 30, 2021 at 9:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The bq25890_charger code supports enabling/disabling the boost converter
>> based on usb-phy notifications. But the usb-phy framework is not used on
>> all boards/platforms. At support for registering the Vbus boost converter
>> as a standard regulator when there is no usb-phy on the board.
>>
>> Also add support for providing regulator_init_data through platform_data
>> for use on boards where device-tree is not used and the platform code must
>> thus provide the regulator_init_data.
> 
> ...
> 
>> @@ -1018,6 +1059,21 @@ static int bq25890_probe(struct i2c_client *client,
>>                 INIT_WORK(&bq->usb_work, bq25890_usb_work);
>>                 bq->usb_nb.notifier_call = bq25890_usb_notifier;
>>                 usb_register_notifier(bq->usb_phy, &bq->usb_nb);
>> +#ifdef CONFIG_REGULATOR
>> +       } else {
>> +               struct bq25890_platform_data *pdata = dev_get_platdata(dev);
>> +               struct regulator_config cfg = { };
>> +               struct regulator_dev *reg;
>> +
>> +               cfg.dev = dev;
>> +               cfg.driver_data = bq;
>> +               if (pdata)
>> +                       cfg.init_data = pdata->regulator_init_data;
>> +
>> +               reg = devm_regulator_register(dev, &bq25890_vbus_desc, &cfg);
>> +               if (IS_ERR(reg))
>> +                       return dev_err_probe(dev, PTR_ERR(reg), "registering regulator");
>> +#endif
>>         }
> 
> }
> #ifdef
> else {
>   ...
> }
> #endif
> 
> is a bit better to maintain (less error prone in case of new code).
> 
> ...
> 
>> +#ifndef _BQ25890_CHARGER_H_
>> +#define _BQ25890_CHARGER_H_
> 
>> +#include <linux/regulator/machine.h>
> 
> struct regulator_init_data;
> 
> should be sufficient, no header is needed.

Thanks, I've fixed both for v2 of the patch-set.

Regards,

Hans


> 
>> +struct bq25890_platform_data {
>> +       const struct regulator_init_data *regulator_init_data;
>> +};
>> +
>> +#endif
> 

