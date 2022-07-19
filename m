Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1742578F13
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jul 2022 02:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236651AbiGSAPb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 20:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233807AbiGSAP2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 20:15:28 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7D4DF23;
        Mon, 18 Jul 2022 17:15:27 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id q5so10499351plr.11;
        Mon, 18 Jul 2022 17:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=xJfHvsXmNkSvk88Wwg2zcdtJVnrv0ckiagfsbDmYjeY=;
        b=J+Y9JFPb2k0NYleDm/soOg2MPrqEWf9ivPg5ZgyruJJ6KpCyF+mq+qe3jUqJlCm7wI
         Legs2mrArZnttzouiw2exEgWZsw10OdykxSHtn3b8/R2GkIWaRDpD2QLOvU6YUW83Iek
         p3cpfIvMyP8rvWq8JxCVKuIzgcGSiXc5JSQfy7r+zG1aG31usNJiOZ4uzn9vhS94+mSV
         lc3pxFgxcmZyEGL2SDKKvy4lfS2Oez5p9am2+MduOEMmBrGL/61EG5JRp7zWj8dBGXAQ
         cK9YqrnaRqkp57Rb/nKzYOAbMZonJowdRbjbOkgBX2PBrzDQXAiqeIOubLegjyOTGLbs
         9pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xJfHvsXmNkSvk88Wwg2zcdtJVnrv0ckiagfsbDmYjeY=;
        b=g3geRLlyJiUB4Z4Gpi9kL5mLhItFIpljBC8oGIR6Veh8qvbAYpKN7SiOZqARTDoQH5
         wX6AWnFFUM2KpkJawkR92bRPmeQwb8OHljDQMCeK6V/e1B6vE3ycAHkA8QDhKckaMD8M
         N/EkuooZtunGHfU2Ntm7ITTfjGxqvieKVjBdWl3jHwHR8K6+IaZRnw6Y7N3p/I0cZbQ7
         8E6YssbDH5EZcvZRyu6DqzI1jWKilSegdQNg2L0vOUP0aCsYgYOB7a7Qg5pLRq2Z/UIW
         kArJl1oTO5peeVqYSWU36N5tc74MQv7/P/66OH6UFQ84dmDQBowougcxUrCHjwQk+Znn
         HoTQ==
X-Gm-Message-State: AJIora895UScgOORItDEgvUjnqCiIh8fEVsmk64P02SFpfgkUZ9rQ/f3
        OpHENJYsEWJE/Gthbk4TAf4=
X-Google-Smtp-Source: AGRyM1u5epR2hRr5yPIxxo7EbLyPEfZ1aFJ7yL26mCRFUr9qf6siYO8IlqAqHlXIm1Lo2Iyy5J0UGA==
X-Received: by 2002:a17:903:32c4:b0:16c:3cab:5918 with SMTP id i4-20020a17090332c400b0016c3cab5918mr29950556plr.16.1658189727063;
        Mon, 18 Jul 2022 17:15:27 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id k21-20020aa79735000000b0050dc7628183sm4743444pfg.93.2022.07.18.17.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 17:15:26 -0700 (PDT)
Message-ID: <03065912-a9f0-6380-6f19-9db2f43be589@gmail.com>
Date:   Mon, 18 Jul 2022 17:15:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH] i2c: brcmstb: Fixed adapter named with optional
 interrupts
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BRCMSTB I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20220706172115.224240-1-f.fainelli@gmail.com>
 <YtKxpz7kiER8ydcj@shikoro>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <YtKxpz7kiER8ydcj@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/16/2022 5:40 AM, Wolfram Sang wrote:
> On Wed, Jul 06, 2022 at 10:21:15AM -0700, Florian Fainelli wrote:
>> When the adapter is registered without interrupts, we would be showing
>> the following:
>>
>>    # i2cdetect -l
>>    i2c-3   i2c             Broadcom STB :                          I2C adapter
> 
> What about switching to pdev->name here? That way you also get the base
> address for free to differentiate if there are multiple instances on the
> SoC?

I was not sure if we could change the adapter name reported as one could 
argue this is now ABI, but if we can, then using dev_name() is probably 
better. You are the maintainer you so know the rules on what is 
considered stable ABI and what is not :)
-- 
Florian
