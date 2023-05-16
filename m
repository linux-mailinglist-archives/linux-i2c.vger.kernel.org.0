Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B6A7044B1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 07:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjEPFaJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 01:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjEPFaI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 01:30:08 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883CF3588;
        Mon, 15 May 2023 22:30:07 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ac7462d9f1so146877061fa.2;
        Mon, 15 May 2023 22:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684215006; x=1686807006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tScch3vM9yjN7IkXBZXndtJvKhAlbmhByTtRNRsl82o=;
        b=aVdPof7CuKQ1PM8AtiShK/xXyFJgqUy+JaaXJSI2GMl0Ns4LQzDT0F8vZooGSinwrN
         1TkUrn+ngU8Rzv+093p2UHPJQ4m8+oBQz01ioy9lVoJMyImR8S/TsJQR4XlP5tRIngAV
         X/gOy0h+cHlR2QmsY0Pvw9GZ8MWv40aWG0iPEgOFui0cV4yMcKJio4ccwNFXeeHy5JQJ
         +h7nXEVI2LX3CDw1Xg0c85SpMPcI8AH2h+oJygT5SmTdocV9NKNJa5fOwss4Kkyz1DbI
         b0wRYrLMABAGppb+Er/4LoNYJXUk5/fo15hMY0RecSs8bWkayJhvN6XyHsu0h2mTceQ/
         C4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684215006; x=1686807006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tScch3vM9yjN7IkXBZXndtJvKhAlbmhByTtRNRsl82o=;
        b=O3s2s5ZG7aXEhm+Tp7AIa5Nh5jPNrQWq7gs0YV08lVJBKRWhKYtiTG+md3iq/gLb8N
         2AIkJiF4Xn4T22vTA3FWMCddkGziH38Q3ur/tLD77Q3i4HNsCIHMOg1MFpZ5EXGBr+f/
         sfDZdZAoFlzYrUBoTIOYpE7eRFZXvUMY7netDrQRoSKOzn14YyRFEwOGs8ZvrfVmhuMM
         bLOJscgOAIBskp0CncpuNOiCf+Jhig5WCnkyjlTZuuG1R4Ky9SqCvuBswZ8RBcnC2LLQ
         Fm/dqhrWfjRoTs2khhYXfmU1uVW9wA3cPy1F6ugP2WxMMABlvw5GvGRtZsOfW/BQ8Se5
         NgDQ==
X-Gm-Message-State: AC+VfDwtnUWg9fGzfQ6qJb9Jji+b5ksQcoja+lfgBTnTDBV+sbeLnQJF
        9at9D514DXbb106Vosuy3Gs=
X-Google-Smtp-Source: ACHHUZ71m/9pOxyYBvVh8mxfhyPiM/bP/wdJ3ylgdP3znusrgrfBibR18YvgwaG3zCkRE41Ip51D7Q==
X-Received: by 2002:a2e:8051:0:b0:2ac:91c5:76c with SMTP id p17-20020a2e8051000000b002ac91c5076cmr8186052ljg.18.1684215005486;
        Mon, 15 May 2023 22:30:05 -0700 (PDT)
Received: from [192.168.1.126] (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id w5-20020a2e9985000000b002ad8fc8dda6sm3412572lji.17.2023.05.15.22.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 22:30:05 -0700 (PDT)
Message-ID: <7d6712e4-ae37-4e31-6087-5df89980a5c1@gmail.com>
Date:   Tue, 16 May 2023 08:30:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 3/3] iio: kx022a fix irq getting
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
 <b45b4b638db109c6078d243252df3a7b0485f7d5.1683875389.git.mazziesaccount@gmail.com>
 <20230513194403.234b4e3f@jic23-huawei>
From:   Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20230513194403.234b4e3f@jic23-huawei>
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

On 5/13/23 21:44, Jonathan Cameron wrote:
> On Fri, 12 May 2023 10:53:41 +0300
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The fwnode_irq_get_byname() was returning 0 at device-tree mapping
>> error. If this occurred, the KX022A driver did abort the probe but
>> errorneously directly returned the return value from
>> fwnode_irq_get_byname() from probe. In case of a device-tree mapping
>> error this indicated success.
>>
>> The fwnode_irq_get_byname() has since been fixed to not return zero on
>> error so the check for fwnode_irq_get_byname() can be relaxed to only
>> treat negative values as errors. This will also do decent fix even when
>> backported to branches where fwnode_irq_get_byname() can still return
>> zero on error because KX022A probe should later fail at IRQ requesting
>> and a prober error handling should follow.
> On that basis I've picked this one up directly for the fixes-togreg branch of
> iio.git and marked it for stable.

Thanks for picking this up Jonathan. Although, the commit message is 
slightly misleading w/o the previous patches in this series because the 
fwnode_irq_get_byname() is fixed in the first patch.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

