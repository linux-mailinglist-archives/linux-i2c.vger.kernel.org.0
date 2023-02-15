Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20416981B9
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 18:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjBORRF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 12:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjBORRE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 12:17:04 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA2525BAB
        for <linux-i2c@vger.kernel.org>; Wed, 15 Feb 2023 09:17:00 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id s13so2177102wrw.3
        for <linux-i2c@vger.kernel.org>; Wed, 15 Feb 2023 09:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5XLERgxuwbSynt7YTpveaA/qkoWhb6rPQnxznMJedU=;
        b=eYrRsQNh5NRQP5B1MSs24CEME2fhcX1QhdjNg3wmVxkZ6Oxip+3RNQrwPmBKbFhIEq
         aYGgNFCVrOTSzeVv77Ej3Kni0t/EOHLbj/q+JrLtdx184Dw3MIYylGmLzEMETPBfFoLv
         gt1VfGJEjgoQ6zbs9GsEp8sC4YKZgZx1FmiaZqz7qWa1AbRJ3wXSUrTPWWiiNxThxE+R
         rNtAkbXSWOJIc/O5QxSG1QUyTqf7suJyUxUwcjqbwyxsweIlBxaS4wNSdrwf2/QHYMZN
         onwxhwKLwGitGfwA24b+0Srl9G582tfFhfp3p6I0MpFx/lQsrVvuwcbPTqO7CA/L+FJk
         sqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5XLERgxuwbSynt7YTpveaA/qkoWhb6rPQnxznMJedU=;
        b=bVCiPZ26Vw1t4igA3lpW3B0mpFhXNjYPGN3SNoPPHxjC9j3g5YIbeqYciO67Et0Ai6
         2vlYsUMYhug2hL4yiGnh18KbJA8im6tWIUYS/kKCZ1ok0Xgi4JKW6Mn4Dlxd+4t79tIs
         Pg76WwwDEMk+MPdQ584da/z6DagHcRjQr2WwkGGPJSKdlEHn/rBNAoKVxFMVyQlPmWZi
         xIRVlLzxnU0e96GTNQOZE1TppJnIOzRphlTd4T5xiHacHRIHgv3u6N4Xp6OPcjpQ6F5y
         l9tq2qh6xrc/ruP8M+GgcRu3A4Xlcyr6sJURUKjnwr6+Es/lYH29/S+J0IaJ1Eb5EruD
         YGNw==
X-Gm-Message-State: AO0yUKWmgUXXWeYuKdMVyL248232Np93WekXPuJDm46zRw//oiwdXxg1
        vj6kLc7Lg4iUsNkk8BMQnukwCcU/6KU=
X-Google-Smtp-Source: AK7set/EHsegXNL+2TrJ0BJN39btQbsO1UgSGRbcOhHhqUpmlYf9/IoshzVPzZovZ6n2KnULoPUGEQ==
X-Received: by 2002:a5d:6308:0:b0:2c5:5252:bc34 with SMTP id i8-20020a5d6308000000b002c55252bc34mr2110422wru.59.1676481418722;
        Wed, 15 Feb 2023 09:16:58 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9d5:9700:51ae:f799:5c0b:f7da? (dynamic-2a01-0c23-b9d5-9700-51ae-f799-5c0b-f7da.c23.pool.telefonica.de. [2a01:c23:b9d5:9700:51ae:f799:5c0b:f7da])
        by smtp.googlemail.com with ESMTPSA id d7-20020adff2c7000000b002c55ed9e314sm6447050wrp.64.2023.02.15.09.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 09:16:57 -0800 (PST)
Message-ID: <6b83d5ed-b6b0-3aff-3e1a-22a1179691b8@gmail.com>
Date:   Wed, 15 Feb 2023 18:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 10/10] i2c: i801: call i801_check_post() from
 i801_access()
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
 <0a170b74-c105-7ca3-9811-a370c81462b8@gmail.com>
 <20230215180911.329f9a9d@endymion.delvare>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230215180911.329f9a9d@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15.02.2023 18:09, Jean Delvare wrote:
> Hi Heiner,
> 
> On Mon, 19 Dec 2022 19:22:42 +0100, Heiner Kallweit wrote:
>> Avoid code duplication by calling i801_check_post() from i801_access().
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 20 +++++++++-----------
>>  1 file changed, 9 insertions(+), 11 deletions(-)
>> (...)
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> So I'm done reviewing the series. I have also tested the result,
> successfully, albeit my coverage is limited.
> 
> Patches 1-4 have been committed by Wolfram already. Patches 6, 7 and 8
> have minor issues. I can take care of resubmitting if you want.
> 
This would be great, thanks!

> My suggested changes (renaming function parameters and storing the
> original value of SMBAUXCTL) are better implemented on top of that
> later (if you agree with them) so as to not delay this series even
> further.
> 
> Thanks for your work,

