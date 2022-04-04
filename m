Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 036FB4F106F
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Apr 2022 10:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242488AbiDDIDI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Apr 2022 04:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377898AbiDDIDC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Apr 2022 04:03:02 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1ABB2F3BD
        for <linux-i2c@vger.kernel.org>; Mon,  4 Apr 2022 01:01:06 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r13so13113716wrr.9
        for <linux-i2c@vger.kernel.org>; Mon, 04 Apr 2022 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Fchq955hbINLxP1mfvpxKWtqMLR29zfsjFGO0tToAUc=;
        b=3kCbDAxruWLN43MM2kRlB4Gp+rcWnHK1FlJNINZdCpVw9O5zlIrvIad52lO+tYJzIv
         xj/VH2a9SXY4/53T7yF8x/p7TtX18Bp58ouR6Kdphjc6OA6aInZhSIF0wklOprZfgjUu
         VolqyD+gBeRHMN09uVqYaH66HnemWGcVyJEYLFGPITL55dtYt9JToehywBwKCZQuqCsE
         J1yyv5mCGH8MYKKl1f0b4p9sfBv+tGrbyFjSgfI3sxlWUeA2bqi9VnTcrVsbBdu0HSNy
         CzhPFlKxpyqM+POwVHH3QqjZnJWklwkNbKm2mzmB9Fep3r2kanhWq0rH6oREg8YmblkW
         CVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Fchq955hbINLxP1mfvpxKWtqMLR29zfsjFGO0tToAUc=;
        b=WWSI0+/bEHY09zaYI19ZbYcunleIh4XXYgMUyzslIv2CMzOfMw29T68HueTXOlbkWy
         fFyRq7FzyqybiM8k75sz+OqcCJuCkDgV8g47IgaFzetUeNltkeCVE0BGSkIZ3VTZCrgl
         M4fZu/E9nkLl0JDYUG/CdPHUuPygbsBrosvnxRLD/JEjoaPwO7TBMRGiNybCaF1tbg2k
         eBPNdpWbXyjM6+qaUZ3MvAU2ucSlmwbmSmyuMDwilni9jXwIg0RYgdt/QuNtCzdLM8b/
         WpRSI9YH+pU9nEt8tjrlupEDo/cF+PjKk+K7zqWQ56lyZF2Fzr9UEDg90fuY08Wwfjcn
         0r1Q==
X-Gm-Message-State: AOAM533CuXOirAr8jBBZKbeU1TnG4+VeKrIQZElFyACkTN6+3NWhCyhh
        g7rJUTEAZrynuhlv32G+FKUDbV5+nx7L95b1
X-Google-Smtp-Source: ABdhPJw8Y+rzIATLf/wu5PrpGYSpAlB9L5KuCHMGGdLeH+iefS3uvrM9XgZfxeA/DFgCXhCdpQnV3Q==
X-Received: by 2002:a05:6000:156e:b0:206:1205:166c with SMTP id 14-20020a056000156e00b002061205166cmr2588330wrz.37.1649059264921;
        Mon, 04 Apr 2022 01:01:04 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1add:1b28:2457:eb46? ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
        by smtp.gmail.com with ESMTPSA id l3-20020a1ced03000000b0038ce57d28a1sm8563313wmh.26.2022.04.04.01.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 01:01:04 -0700 (PDT)
Message-ID: <8986ec34-616b-d497-29d1-6f7896c26e37@baylibre.com>
Date:   Mon, 4 Apr 2022 10:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
Content-Language: en-US
To:     tanure@linux.com, Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Vyacheslav Bocharov <adeep@lexina.in>
References: <20220326102229.421718-1-tanure@linux.com>
 <7hee2lu82n.fsf@baylibre.com>
 <CAJX_Q+1tz7BYL+CvXnc=zAamPiZDEFAASv9a7YoWGmzqYL+cUg@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAJX_Q+1tz7BYL+CvXnc=zAamPiZDEFAASv9a7YoWGmzqYL+cUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 29/03/2022 00:31, Lucas Tanure wrote:
> On Mon, 28 Mar 2022, 21:37 Kevin Hilman, <khilman@baylibre.com> wrote:
>>
>> Hi Lucas,
>>
>> Lucas Tanure <tanure@linux.com> writes:
>>
>>> The default duty cycle of 33% is less than the required
>>> by the I2C specs for the LOW period of the SCL clock.
>>>
>>> So, for 100Khz or less, use 50%H/50%L duty cycle, and
>>> for the clock above 100Khz, use 40%H/60%L duty cycle.
>>> That ensures the low period of SCL is always more than
>>> the minimum required by the specs at any given frequency.
>>
>> Thanks for the fixes!
>>
>> This is going to affect all SoCs, so ould you please summarize how your
>> changes were tested, and on which SoCs & boards?
>>
>> Thanks,
>>
>> Kevin
> 
> Hi,
> 
> I only tested against the vim3 board, measured the bus with a Saleae
> logic pro 16.
> The measurements were with 100k, 400k, and a few in-between frequencies.

Thanks, it's a great addition to have !

> 
> Is that enough?

A test on GXL/GXM (VIM1 or VIM2) & GXBB (Odroid-C2) devices is lacking before we
can merge this.

If I find some time, I'll have a try, but everyone is welcome testing this serie
and report if it still works fine for them.

Vyacheslav, do you think you can test on your JetHub devices ? it would validate GXL & AXG.

Neil

> 
> Thanks
> Lucas

