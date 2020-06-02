Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945631EBD38
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jun 2020 15:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgFBNkP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Jun 2020 09:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgFBNkP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Jun 2020 09:40:15 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8B8C05BD43;
        Tue,  2 Jun 2020 06:40:14 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bh7so1344237plb.11;
        Tue, 02 Jun 2020 06:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vmXfRiCKH+tGXZLBFkH/zfVXN3PStwPuguoHM/Th2As=;
        b=ENqSuUoq1zDtEf96m74n5Gsuj7WbjCCK8ilJdVVJJLPH8QCKTdq5gQEsccWTXTkH92
         5FJEMXmgQKULTomIf/Mte2aAED+t1GCRPltjiGhNfP9Cc5AJt84eERFWCDy79YSN31FI
         GYuDeOHhxu4mdo2UgxB3Ahquc7b/kBMSOFd+zxT2GGQdj7uixbeygfb9lvUoZNR0rYj0
         HPQyfpMFPkqWmgCJQRyf2RDu4Il3z/s6N0ZHCUr9bDoZq5a53pzEccJ5NDJiLHEH8Nz5
         AKI+nOKkYe9IUOQF9G7h1kXMnAfEoVio08xiuWbj1E0n490MAui6iOdKkmYazeNMMnQA
         UDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vmXfRiCKH+tGXZLBFkH/zfVXN3PStwPuguoHM/Th2As=;
        b=dMLJIFxzHD1XRynkbI5FKeuS0E6fq9V0BOOpV8J7VZh/J179fSw2+vcHhZMT4tKHly
         l+ZoJEoVeU2l4VTZA0nCVT4Sr0YZ9bXE/yjpwvzbnm/CAxkqHfwjmGCqZAe5+of0DVXb
         Zf9fXMa6pDI0NSmuh+AGfLLWhAlKVhbNjckjUzfnguiHIlINrWf0oWxkVPhPjEY5PkSV
         P23UEPxuwtJkBxAJ0SfCgchrlhQiY1Sv0zCQOcGxEh0OZhHl1+dchO5tZgvhaLHdmJ50
         Y+Uz4sQC0ywu690aE9rGHImhPcRj9lJvXuJ8lFEmYaNfns4YpwAI/DzkdxE8lNEuxoec
         9SmQ==
X-Gm-Message-State: AOAM5316OU4e4EFgzzOQrj5QMD772uQZdM9XC1owfnJqIzLY2sa1IXDg
        ZeYJk2gbd0FfN8WF2I9gehFm7XZn
X-Google-Smtp-Source: ABdhPJzXCEGqPEjPxGL7vxZ2EieUbQHHP/FY/S5el0iXcTubipyjOwpgxSV8rsi6bqJKORggqXlL4w==
X-Received: by 2002:a17:902:9885:: with SMTP id s5mr24303680plp.204.1591105213457;
        Tue, 02 Jun 2020 06:40:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a12sm2184382pjw.35.2020.06.02.06.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 06:40:12 -0700 (PDT)
Subject: Re: [PATCH 1/2] i2c: mux: pca9541: Change to correct bus control
 commands
To:     Quentin Strydom <quentin.strydom@bluwireless.com>,
        Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1591099969-30446-1-git-send-email-quentin.strydom@bluwireless.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1654dd95-bc94-972c-f8a0-6cf9d910189e@roeck-us.net>
Date:   Tue, 2 Jun 2020 06:40:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1591099969-30446-1-git-send-email-quentin.strydom@bluwireless.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/2/20 5:12 AM, Quentin Strydom wrote:
> Change current bus commands to match the pca9541a datasheet
> (see table 12 on page 14 of
> https://www.nxp.com/docs/en/data-sheet/PCA9541A.pdf). Also
> where entries are marked as no change the current control
> command is repeated as the current master reading the
> control register has control of the bus and bus is on.
> 
> Signed-off-by: Quentin Strydom <quentin.strydom@bluwireless.com>

I am not going to reply to your other e-mail. After all, it is marked
confidential with a lot of legalese around it.

- Split long lines in your e-mails.
- Do not just send the patch again, reply to the original patch
  with a comment such as "ping"
- If you resend (for example because still no one replied after
  more time, or you missed some mailing lists/reviewers), mark the
  patch subject with "PATCH RESEND"
- Never under any circumstances send an e-mail to a public list that
  states that "This email and any files transmitted with it are
  confidential ...".

For my part I did not reply because I have no access to the hardware
anymore, and thus can not validate if the code still works after this
change (or why I didn't notice the problem when I wrote the code initially).

Guenter

> ---
>  drivers/i2c/muxes/i2c-mux-pca9541.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
> index 6a39ada..50808fa 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -211,7 +211,7 @@ static void pca9541_release_bus(struct i2c_client *client)
>  
>  /* Control commands per PCA9541 datasheet */
>  static const u8 pca9541_control[16] = {
> -	4, 0, 1, 5, 4, 4, 5, 5, 0, 0, 1, 1, 0, 4, 5, 1
> +	4, 4, 5, 5, 4, 4, 5, 7, 8, 0, 1, 11, 0, 0, 1, 1
>  };
>  
>  /*
> 

