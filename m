Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECB99A7773
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 01:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfICXLZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 19:11:25 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38418 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbfICXLY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 19:11:24 -0400
Received: by mail-wm1-f67.google.com with SMTP id o184so1322218wme.3
        for <linux-i2c@vger.kernel.org>; Tue, 03 Sep 2019 16:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O1IX4sE++65Y4ZZlb31D7PSxnB7F1eURR0p9HiU+wok=;
        b=GN1lxLL77dx6OpxYsAzcRowiCyZNoduNxno0mwMUs5BgtQA4I1tsuuVAT8pEJiIKH5
         aMMRR5iXVzB9nSZaxZCC8Fall2B9JlTkfMxyyrBN4eA3IKq7TYtxWUDC+nyAF5OdaJ+/
         A9LuEnE/5h0F2/mIen8Joti9/624aDslqpLSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O1IX4sE++65Y4ZZlb31D7PSxnB7F1eURR0p9HiU+wok=;
        b=WN07PSznytAYJ89LpyHJmVH1WmuxQml6WLvbpXtK71BNFWpwMwHF+UHfKEGsHnT2N+
         /mRCPo3tWjwvYjHIjLBOdsY1S7U/mBGkqUn46xWBflZiG6IDhTXhlq/HKCrj5E3c+33y
         48DnMvs/o6COO5sKV897VP4sgJV8NwjeTC8uS1YMDrcfh8s+odTfh54eC9gqZ7N7eep+
         ELT28L0G6uCvp0oBxiqAJ4eu+7qb3F2L8ijfKFmlCB0m2yVU1ix5IjV12LHlj4AGbBcT
         LueMocPngb/MljGMicQ/cgpPxQGKbe6gpOxSKchxQILSmyHhldgPxvNXwIRie07E5a84
         cr5w==
X-Gm-Message-State: APjAAAUr3v0h2ncVFbVSoM7ad4aFgmQcwOPiDGVRL4sQRAH4uOXNEYr6
        iuyTOrIAU9GldTOHkByjDVQtvg==
X-Google-Smtp-Source: APXvYqw0nbdYJ7kcbtwu+coOAy8z5E8zaUK+TSpgMcoATdcQSuYsagRGgIBexHatzxh6Gy5qz+Gbzg==
X-Received: by 2002:a1c:9ec9:: with SMTP id h192mr1877598wme.105.1567552282880;
        Tue, 03 Sep 2019 16:11:22 -0700 (PDT)
Received: from rj-aorus.ric.broadcom.com ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id v6sm1649818wma.24.2019.09.03.16.11.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 16:11:22 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] i2c: iproc: Add i2c repeated start capability
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Icarus Chau <icarus.chau@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
References: <1565150941-27297-1-git-send-email-rayagonda.kokatanur@broadcom.com>
 <20190830125626.GC2870@ninjato>
 <3e70fa7e-de13-4edd-2e17-b7c56e91d220@broadcom.com>
 <20190831094940.GA1138@kunai>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <540c4e2d-0dd5-5260-30b2-e1589b279d71@broadcom.com>
Date:   Tue, 3 Sep 2019 16:11:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190831094940.GA1138@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/31/19 2:49 AM, Wolfram Sang wrote:
> Hi Ray,
> 
>>> With all the limitations in place, I wonder if it might be easier to
>>> implement an smbus_xfer callback instead? What is left that makes this
>>> controller more than SMBus and real I2C?
>>>
>>
>> Right. But what is the implication of using smbus_xfer instead of
>> master_xfer in our driver?
>>
>> Does it mean it will break existing functions of the i2c app that our
>> customers developed based on i2cdev (e.g., I2C_RDWR)?
> 
> If the customers uses I2C_RDWR (and it cannot be mapped to i2c_smbus_*
> calls) then this is an indication that there is some I2C functionality
> left which the HW can provide. I'd be interested which one, though.
> 
>>
>> 1) Does
> 
> Maybe you wanted to describe it here and it got accidently cut off? >

I think you are right that the controller does not seem to support 
additional I2C features in addition to SMBUS.

However, my concern of switching to the smbus_xfer API is:

1) Some customers might have used I2C_RDWR based API from i2cdev. 
Changing from master_xfer to smbus_xfer may break the existing 
applications that are already developed.

2) The sound subsystem I2C regmap based implementation seems to be using 
i2c_ based API instead of smbus_ based API. Does this mean this will 
also break most of the audio codec drivers with I2C regmap API based usage?

Thanks,

Ray

> Regards,
> 
>     Wolfram
> 
