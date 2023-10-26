Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 028B27D89A5
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 22:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbjJZUW0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 16:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbjJZUWZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 16:22:25 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1148E191
        for <linux-i2c@vger.kernel.org>; Thu, 26 Oct 2023 13:22:24 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6ce2bcb131fso869625a34.1
        for <linux-i2c@vger.kernel.org>; Thu, 26 Oct 2023 13:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698351743; x=1698956543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITV7DfUrBErTol4ZaiZ+WFwhsF5OaCUltzrNUsSzGsY=;
        b=bE3aJsPHZnRNogsIbyNMl2B8/xAwlFWyPENlorEIChIbJt6gkiUTdr7duJIayLquj3
         gYPSqFoHD7C4XDU8K3TfOGGnYq6KKIIuMt6bHulaA6Vc+Uf1fEIJPHbMJGOpjNwuHEVN
         ua1l4uvP2NvEP3ErPOk5a+cIuZ0Q0q+qP7uPC1aynd3gfiJYMlOtQXYNM9LJZVXPweIs
         KsN2hhez/qWj02gR49NXu0+NWhS5p9gbYI8SnDuA2pCPsieSdA2eNXvoorP1/ihdZQJ9
         En9PWDEGT84mOuGSWNN6cuJ9jZ2RyfB6+1WpwwY8TUJfDLxwV6JSluNNDaaRsH35eeUy
         /EZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698351743; x=1698956543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITV7DfUrBErTol4ZaiZ+WFwhsF5OaCUltzrNUsSzGsY=;
        b=W3RPM7vF+FqVhKTaBtPcb0kJPpJX1FYWg5ohShgR6R0twpjysoRMbxvITjowLRCj5T
         0fGTiHLi4CB/StJ6pJ4+rLOwT5PQy7dwcNwOI5UN80vjDwHlkYhkwMDwoF4TXSWlw24w
         cQQtPVnHMlgAxfj4Q2Ud3AVMxGU3deD3BBMmRfH+zeW2MM6TkaqjBCY5yhgQyKkZvDON
         v6YIGJZD4IbZ3WaUWsRR0ni6BEjEmibX4ThilwmUinrLMeokyVHdrryt3po6MgBaGVZd
         9tA9Rr+K2tFsBOzOjXzxLaMGJ0k7KBbQr8d9nl/amPD95tYu81vE3us6PPI3JJcPXzYh
         NiWw==
X-Gm-Message-State: AOJu0YxxvZQQcDZy7FyrrNJQWDAy+KbNK/8KoCqGDgefJS9XRCEuA1fJ
        q3GRJy6V0vYmMec69gB147iPMV9yPfE=
X-Google-Smtp-Source: AGHT+IGP2uRqgOLMw/KzmYgN8tLHP2jFEDSY3mkVlOZXHQANxpmbJ4tp1uuG78U7TXuA4AkfgJuOZA==
X-Received: by 2002:a05:6830:61a:b0:6bf:12:5189 with SMTP id w26-20020a056830061a00b006bf00125189mr497589oti.26.1698351743127;
        Thu, 26 Oct 2023 13:22:23 -0700 (PDT)
Received: from ?IPV6:2a02:3100:95bf:4b00:95bb:38e6:4df0:e5c4? (dynamic-2a02-3100-95bf-4b00-95bb-38e6-4df0-e5c4.310.pool.telefonica.de. [2a02:3100:95bf:4b00:95bb:38e6:4df0:e5c4])
        by smtp.googlemail.com with ESMTPSA id i22-20020a9d68d6000000b006ce33ba6474sm2899oto.4.2023.10.26.13.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 13:22:22 -0700 (PDT)
Message-ID: <6e50ca17-18bf-4bcb-a69b-c9e7736ce677@gmail.com>
Date:   Thu, 26 Oct 2023 22:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: Mark I2C_CLASS_DDC as deprecated and emit warning if
 adapters declare support for it
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5c521229-18be-47dc-baa9-cabd78420cad@gmail.com>
 <ZTqj6BKcNYzEkZpp@shikoro>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZTqj6BKcNYzEkZpp@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26.10.2023 19:37, Wolfram Sang wrote:
> Hi Heiner!
> 
>> With removal of the legacy eeprom driver the only i2c client device
>> driver with I2C_CLASS_DDC is gone, so it's time to mark I2C_CLASS_DDC
>> as deprecated.
> 
> OK, but I will need to wait until the eeprom-removal hits mainline.
> 
>> Use pr_warn_once, because graphics adapters can have several i2c
>> busses and we may see the warning multiple times otherwise.
>>
>> Note:
>> Driver staging/olpc_dcon declares support for classes HWMON and DDC,
>> but only HWMON is used with the scx200_acb adapter driver on olpc
>> devices.
> 
> And why don't we remove its DDC declaration here in this patch?
> 
OK, will submit this as follow-up.

> Thanks for cleaning this up!
> 
> Regards,
> 
>    Wolfram
> 

