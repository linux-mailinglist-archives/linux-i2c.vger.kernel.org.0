Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 006997DC6AE
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 07:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236646AbjJaGn6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 02:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236529AbjJaGnx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 02:43:53 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141DBC2
        for <linux-i2c@vger.kernel.org>; Mon, 30 Oct 2023 23:43:51 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-540c54944c4so10874981a12.1
        for <linux-i2c@vger.kernel.org>; Mon, 30 Oct 2023 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698734629; x=1699339429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W6TH+DS+2O21PO4QnbC57PMdwdi1XFBWz9bZo2oi20M=;
        b=a0ht48+hvLMxP6ZwH6kV9FTrOhiqdqd6jhtJ6ny8g6fnIZ7cl53B6HRLgL+arVUSro
         MCCOWWHqwVTR4dbCvOc08f1GNeIbzfD+20G0orkUztD7gZlz3QvRdPqmrjhBiUL2XZLX
         +joEd8VDhlj64B9Dr8FMZkmIk2f7Icd/dlml2t6CxdtlG8vhudehEC6RVPbGb042W2ul
         V0BzKTYF5aS/tT60onFtUv+0hsrMwXVsyPLhCsjYhalxStk5HgADhKkgev8j8/xYBq84
         wz3GOxrEvpjWVzaqlrTwsbV+9wcxH3ibFO0lmBd6cTNGFUkrUIH6dNgGdioiXij7hhSf
         9OzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698734629; x=1699339429;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6TH+DS+2O21PO4QnbC57PMdwdi1XFBWz9bZo2oi20M=;
        b=CCflWwOmkkbKsa/Ut3/qaDefDu/cGtZCAH15r2AxIn+yVhC7xzR0FTvYqNp8/jr1l3
         D9PhPE781aoDlzKAiZz6KP4KrmNr38/8Vldy4QmSU/+6dNmEQ9r26n4dLjpBPTb05iKs
         lOmPprZCt6wCpkwSDOlAtOAIykfgfn/1jPyk9XvPIk7f6kMf7ebWq9l2cIhVyLJF09+/
         RDGO3nAC086ZKKKyxXznNZQ7FvF0M4LYlwW1RA16pud1lGvFDZsognMjyxvAe4lOVCbH
         zsUERhhlhd7QtwcLxGP+fUtaDRaK1j8YF8YZAwQITLzBMu6OBwv1/rm9mYdzw2G9+GdT
         hHBQ==
X-Gm-Message-State: AOJu0YynxbVWJ/On5m6rmzJONXtQEjxFrJS1xMcv06QF1r+z3ixPrQyF
        2k7dIdVDEnB3217Q5KKtX3hEDLG4hpE=
X-Google-Smtp-Source: AGHT+IH0NapHpL5a0QvhDkYw9SS9ArtTjgZRxDOlXTPBh/kf8JiXYjAXUhWn+hRbJNJb+qhjoEng9g==
X-Received: by 2002:a50:d757:0:b0:53d:fd46:41ce with SMTP id i23-20020a50d757000000b0053dfd4641cemr1428559edj.19.1698734629145;
        Mon, 30 Oct 2023 23:43:49 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c07e:7700:2529:656e:7134:eeeb? (dynamic-2a01-0c23-c07e-7700-2529-656e-7134-eeeb.c23.pool.telefonica.de. [2a01:c23:c07e:7700:2529:656e:7134:eeeb])
        by smtp.googlemail.com with ESMTPSA id e9-20020a056402088900b0053f9578ec97sm567537edy.56.2023.10.30.23.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 23:43:48 -0700 (PDT)
Message-ID: <704b82a3-4532-4aef-964e-75a9c700b5df@gmail.com>
Date:   Tue, 31 Oct 2023 07:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: Mark I2C_CLASS_DDC as deprecated and emit warning if
 adapters declare support for it
To:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5c521229-18be-47dc-baa9-cabd78420cad@gmail.com>
 <ZTqj6BKcNYzEkZpp@shikoro>
Content-Language: en-US
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

Both changes should reach mainline in the next days.
0210a684cdb2 ("staging: olpc_dcon: Remove I2C_CLASS_DDC support")
0113a99b8a75 ("eeprom: Remove deprecated legacy eeprom driver")

I reactivated my rudimentary Coccinelle skills and think I'll prepare
a series that removes definition of I2C_CLASS_DDC and all its users.
Means you can drop the patch introducing a depreciation warning.

> Thanks for cleaning this up!
> 
> Regards,
> 
>    Wolfram
> 
Heiner
