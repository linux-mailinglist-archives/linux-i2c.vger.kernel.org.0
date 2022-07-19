Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D64E157919F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jul 2022 06:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235670AbiGSEHC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jul 2022 00:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235123AbiGSEHC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jul 2022 00:07:02 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8594C2F028;
        Mon, 18 Jul 2022 21:07:01 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id x21so10853322plb.3;
        Mon, 18 Jul 2022 21:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=b5C7S83LBN0Mb/XqzIaN+HXOmTIU+sTTk/HlHbA/cf8=;
        b=e+nvavFelvtf9mw5zW/PUJdv/ajQZY2dDNTRnTvLW3hbAjW0CFWY3ic2J9NlePDzwl
         0yKHSraowgnyzCiA86ZeQCxZA9aGvboqXA5O8IKlbrVtqYdRk9aRD1KYwg2ohmcLKSfi
         jUm5Ulhi+tIUwiKl0HggOKvHXc71qNleK6HaNIGY6FuWJzCLWDh2s7xma4c8r7FY4sP4
         zYJ+uX1OtGPpwIzBuqFn7MzbbHmzjxLfm6cAwi1hWCg9wWVl8NDIM5xi/xi1O5QabsHO
         RNub80uRU20xPSeSqLuwxW3tg77+wEKPGRq71y3Cey/wWGky2kF0d7fvgA5uth/2+YSF
         oDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=b5C7S83LBN0Mb/XqzIaN+HXOmTIU+sTTk/HlHbA/cf8=;
        b=kOlXP3ER1Fqfml6AqoJ4QojeEq6sb1NYb0FosPJCZY4wS+vffSkijvf0q5MZ6cwQ9+
         nkq8pozynp/VI58k0RsnwbeWTXI8QC7NTD26pikLRjyPhRbt652Cx0saOyzt5QMVxzcN
         g7mg14n0RiZKRs0j8A94TzdvUi5dBEm9tgtrgg/wwCME47ALqfmI04Q417bjtQDVOnjX
         JIlIgRnmhzhwsNPePRNAAxKSwldLSBVqB9z0qEJmVe1i8cfI1iQlZBA42JMk3msEutO9
         S3cd7W0x4CAutyazQE4XhYZXCHaPfydpJpY+4gblJPAsTH7VC/1rA200jzadH+W3KAeY
         Ar9w==
X-Gm-Message-State: AJIora8SvP9f/3czIWIHMSMZiWbUuEwwi93KTMwQ507CeZEjajAMw1XT
        UE4zEYabafBh4WuA2VcH6WA=
X-Google-Smtp-Source: AGRyM1vopXYjYWjtSk9JWUOj7czx5xa8slpPVSkutgIztzs29VFNW8c3XWSFAgJyawy46h+34AS6Jg==
X-Received: by 2002:a17:90b:4d01:b0:1ef:d39b:b140 with SMTP id mw1-20020a17090b4d0100b001efd39bb140mr36005500pjb.82.1658203621019;
        Mon, 18 Jul 2022 21:07:01 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id j24-20020a63cf18000000b0041975999455sm8995706pgg.75.2022.07.18.21.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 21:07:00 -0700 (PDT)
Message-ID: <f77038b5-93f5-1a06-c433-2086df8c3f3d@gmail.com>
Date:   Mon, 18 Jul 2022 21:06:59 -0700
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
 <YtKxpz7kiER8ydcj@shikoro> <03065912-a9f0-6380-6f19-9db2f43be589@gmail.com>
 <YtYrnlmpfRxcWMga@shikoro>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <YtYrnlmpfRxcWMga@shikoro>
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



On 7/18/2022 8:57 PM, Wolfram Sang wrote:
> 
>> I was not sure if we could change the adapter name reported as one could
>> argue this is now ABI, but if we can, then using dev_name() is probably
>> better. You are the maintainer you so know the rules on what is considered
>> stable ABI and what is not :)
> 
> Well, then even removing ":" would break the ABI :)
> 
> Please use dev_name. Other drivers changed that string, too. We never
> gave guarantees for that one.
> 

Fair enough, sent a v2 using dev_name(), thanks!
-- 
Florian
