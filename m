Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9679B70981A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 May 2023 15:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjESNTs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 May 2023 09:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbjESNTr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 May 2023 09:19:47 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173D4F5;
        Fri, 19 May 2023 06:19:46 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d3fbb8c1cso177703b3a.3;
        Fri, 19 May 2023 06:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684502385; x=1687094385;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNZa4ZUMMTvbUod6znd3wvg9/UWL/p4a2pQAi7M2zVw=;
        b=Tjrk99BRY28Fy8/OjZNMP8CiMQ6zmFrMXQL10thchpXS9detrOCrK1IGYiRrbYzhVO
         zZWgRORL6Vo1JuL8ToPXNHE1MQdRgSzbz0oBKJN7O6RKsuuZyf4iknt3hNShh77400Vw
         np77K8+ficWm8RlwW5j/sLMxK6G9akwUPWOlvZNDitIzXEavwnEDe5HBI8YkAKvX8R2c
         /na81XIjC1Yd8QxLI0blip5op5dSEIwITsZXugLcZbgVk/3n8z5/fCaOOogmhU3Jxico
         Or2/5SdX91MIyP/MLUT2hiljx0TfEp3RoeDIiobBmQ1QLOkZd1LPqlSXbyjCj4PTObs2
         5Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684502385; x=1687094385;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PNZa4ZUMMTvbUod6znd3wvg9/UWL/p4a2pQAi7M2zVw=;
        b=Xaa4vqHspQbklD+k73oMU6WmxqWM/mFyOvC6qhNNjT6ZD/nf7+24kC48uxgk1ZB0HH
         Yua75tSQgEb7RXYw6CZ5rs2c/c8dcXJk9zu8HrUbsjliv6se6Xmi6MvTipUd1sDLgk71
         jD0Xd0sV/PIj4vkFOWdTKBg+dV7qqiJ+xe1qFu83/NzRpLFT12BCoUFYWbvgdNDEfMLI
         GpQvHvAg0hSOUxeUbjyD9mcVxR47qvMUUmYUjBoJQo7Ilnitxpt9++frouSnpguFgOF7
         6E1ohG1aeQzJfUtllX4QPeSvgQHTKcygfBWWxY6qA2lbCtp/wLvv3VuiaobMHp5CZ0Ak
         n5qw==
X-Gm-Message-State: AC+VfDwycigIb/qgCflep4MpbXqoSdTB9h5bM0TTQ8G7KwDwk2vY40GO
        ExFnrjXhAIHTc+2uD/q4N5XzkKVX9OE=
X-Google-Smtp-Source: ACHHUZ5QF8RST84gVY23LOwTXUDqa2rVOApCMeiJNnggae4EC8S0ssgapsdL48wiE9f2cSirgy7pXw==
X-Received: by 2002:a05:6a00:15c7:b0:64d:2e8a:4cc1 with SMTP id o7-20020a056a0015c700b0064d2e8a4cc1mr3149325pfu.27.1684502385276;
        Fri, 19 May 2023 06:19:45 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-19.three.co.id. [116.206.28.19])
        by smtp.gmail.com with ESMTPSA id f18-20020aa782d2000000b00571cdbd0771sm2981023pfn.102.2023.05.19.06.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 06:19:44 -0700 (PDT)
Message-ID: <73883c7d-42db-7ac6-fa43-b9be45cdc795@gmail.com>
Date:   Fri, 19 May 2023 20:19:39 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Regressions <regressions@lists.linux.dev>,
        Linux Input <linux-input@vger.kernel.org>,
        Linux i2c Devices <linux-i2c@vger.kernel.org>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: ThinkPad L540: suspend not working (deep / S3 / standby,
 regression Linux 4.19 -> 6.1)
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kolAflash@kolahilft.de
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> ThinkPad L540 failed suspend deep dmesg output - Linux-6.1.27 from Debian-12
> 
> Since updating from Linux-4.19 to Linux-6.1.27 suspend deep is not working anymore.
> (a.k.a. S3, standby or suspend to ram)
> 
> Notebook: ThinkPad L540 20AU-S00N00
> OS: Debian-12 "Bookworm" (was Debian-10 "Buster" before)
> Kernel: Linux-6.1.27 from Debian-12 (was Linux-4.19 from Debian-10 before)
> 
> Can I provide any other helpful information?
> Do you need a test with a vanilla Linux-6.1 kernel?
> Should I perform any other tests or maybe try out boot parameters?
> 
> Full dmesg output attached.
> Excerpt:
> rmi4_f01 rmi4-00.fn01: Failed to write sleep mode: -6.
> rmi4_f01 rmi4-00.fn01: Suspend failed with code -6.
> rmi4_physical rmi4-00: Failed to suspend functions: -6
> rmi4_smbus 0-002c: Failed to suspend device: -6
> rmi4_smbus 0-002c: PM: dpm_run_callback(): rmi_smb_suspend+0x0/0x40 [rmi_smbus] returns -6
> rmi4_smbus 0-002c: PM: failed to suspend async: error -6
> sd 4:0:0:0: [sda] Synchronizing SCSI cache
> sd 4:0:0:0: [sda] Stopping disk
> PM: Some devices failed to suspend, or early wake event detected
> sd 4:0:0:0: [sda] Starting disk
> OOM killer enabled.
> Restarting tasks ... 
> rmi4_physical rmi4-00: rmi_driver_set_irq_bits: Failed to change enabled interrupts!
> psmouse: probe of serio2 failed with error -1
> 
> 
> 
> Maybe related:
> 
> 5.17-rc regression: X1 Carbon touchpad not resumed
> https://lore.kernel.org/lkml/YgF%2F0QGFN4SppLKg@shikoro/T/

FYI, I guess the regression is also introduced by 172d931910e1db
("i2c: enable async suspend/resume on i2c client devices") and
should have been fixed by 7b1f781f2d2460 ("Input: psmouse - set up
dependency between PS/2 and SMBus companions"), but it doesn't
fix the reporter's issue.

Anyway, I'm adding this to regzbot:

#regzbot introduced: v4.19..v6.1 https://bugzilla.kernel.org/show_bug.cgi?id=217462
#regzbot title: psmouse suspend failed on ThinkPad L540

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217462

-- 
An old man doll... just what I always wanted! - Clara
