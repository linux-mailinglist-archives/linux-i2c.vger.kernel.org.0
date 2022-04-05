Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 921584F48F6
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 02:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377059AbiDEV4g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 17:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1455144AbiDEP7l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 11:59:41 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C568C108BD6
        for <linux-i2c@vger.kernel.org>; Tue,  5 Apr 2022 08:11:25 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id b17so16136123lfv.3
        for <linux-i2c@vger.kernel.org>; Tue, 05 Apr 2022 08:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=knadBC5/9Dlj8rbZddGyUUv9/Z5ol7Dtv9U1ioqP9jA=;
        b=4WXxBwXx7EL1bnbBadqVFwnRXzEoKBnMCPyQY1ZoY51R3YnPyJSrpchjfB6SICDwsJ
         5alKgXGkZ0+I2dyFvgJGXRqq9S7J0CWijdEsqtbZyqcsb9/kzsafqkVrI8xVxcY72nkg
         UGCEDmkItzRH77RJhiDAiVZmPMq9iBdIfg9uaN8BHGlPsTQynByp4OpSEyaEevxlFS77
         Qef8G+zninZ7IFRAGP9u/2MlkCD19bQzY1o2vc3fSvDaAeHrUE7NH83wxI08mKsTZK7G
         sJ5I+oQd+gn/b/mCW4Ct/uXiaXcZ1hOSLpsU3SjMOep+xv/JHCQbkqq7/lg9kEhzrpAK
         li0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=knadBC5/9Dlj8rbZddGyUUv9/Z5ol7Dtv9U1ioqP9jA=;
        b=aP60CSIDh4ZvrfbywO2+uenkf/RJZDQk/bofa9ZnSsOq4TJQk5l52GILrHqU+aYsBp
         2t0az3bf0tZekLwPl6Z/GapN8ZtZYFeXnoLfjAKQV8QvIXFMPeywIiFJw/N6MQBKkIWo
         E3z8CTVt4vwp+XLdJ6dz1/jp2UL8shF805pwgL6pP6NqVNZJqZAPOtFRK35DaBL7O6hn
         PsoiPSc3MYh5GX7dvZrRQhLrPuhJ58VaM4sPOwYNbDw5CIDFgjf2lrVJdwBZl21QW8ki
         1dyvDEcy1sfpYgQRSFdMJD093ItnkBJRpmgodcKGp6JQ+FWKhnwrh57XjyIamSSVmnfa
         dOeg==
X-Gm-Message-State: AOAM531PpfiUAOZL1Cst5hePpxVa6q7Zgb0X7KsgT4Pz1CEZtCLWwTJd
        5pHthMN9YkXAxqm43Y3e9mAzjA==
X-Google-Smtp-Source: ABdhPJzACQiDfI4qUdkgsvTX0RPVvPl+IFhGVEeH45oKkhd6o7WfMVVtWugGdQVsuaBLCEHNpE0Tsw==
X-Received: by 2002:a05:6512:3a83:b0:44a:5878:24d6 with SMTP id q3-20020a0565123a8300b0044a587824d6mr2899935lfu.426.1649171480237;
        Tue, 05 Apr 2022 08:11:20 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5cd5:d9c8:ef4:b0ed? ([2001:861:44c0:66c0:5cd5:d9c8:ef4:b0ed])
        by smtp.gmail.com with ESMTPSA id x23-20020a056512047700b0044a3c53e12dsm1533643lfd.169.2022.04.05.08.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 08:11:19 -0700 (PDT)
Message-ID: <a27da359-3922-e4ee-16d2-b4cb6fc06ca8@baylibre.com>
Date:   Tue, 5 Apr 2022 17:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
Content-Language: en-US
To:     tanure@linux.com, Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220326102229.421718-1-tanure@linux.com>
 <7hee2lu82n.fsf@baylibre.com>
 <CAJX_Q+1Y5pO_AGaFSXfo-J3EdGQeM2XYXzvsUtjtAFEXdwKEdQ@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAJX_Q+1Y5pO_AGaFSXfo-J3EdGQeM2XYXzvsUtjtAFEXdwKEdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 28/03/2022 23:51, Lucas Tanure wrote:
> 
> 
> On Mon, 28 Mar 2022, 21:37 Kevin Hilman, <khilman@baylibre.com <mailto:khilman@baylibre.com>> wrote:
> 
>     Hi Lucas,
> 
>     Lucas Tanure <tanure@linux.com <mailto:tanure@linux.com>> writes:
> 
>      > The default duty cycle of 33% is less than the required
>      > by the I2C specs for the LOW period of the SCL clock.
>      >
>      > So, for 100Khz or less, use 50%H/50%L duty cycle, and
>      > for the clock above 100Khz, use 40%H/60%L duty cycle.
>      > That ensures the low period of SCL is always more than
>      > the minimum required by the specs at any given frequency.
> 
>     Thanks for the fixes!
> 
>     This is going to affect all SoCs, so ould you please summarize how your
>     changes were tested, and on which SoCs & boards?
> 
>     Thanks,
> 
>     Kevin
> 
> 
> Hi,
> 
> I only tested against vim3 board, measured the bus with an saleae logic pro 16.
> The measurements were with 100k, 400k and a few in between frequencies.
> 
> Is that enough?

I did a few measures on the Libre Computer Le Potato S905X board:

i2c_AO:

Before the patchset, I got:
- 100KHz: 1.66uS HIGH, 6.75uS LOW, 20%/80%, Freq 118KHz /!\
- 400KHz: Unable to decode, clock line is invalid, Data line is also invalid

With the patchset
- 100KHz: 4.25uS HIGH, 6.58uS LOW, 40%/60%, Freq 92KHz
- 400KHz: 0.33uS HIGH, 3.00uS LOW, 10%/90%, Freq 300KHz

i2c_B:

Before the patchset, I got:
- 100KHz: 2.25uS HIGH, 5.41uS LOW, 29%/71%, Freq 130KHz /!\
- 400KHz: 0.42uS HIGH, 1.66uS LOW, 20%/80%, Freq 480KHz /!\

With the patchset
- 100KHz: 4.75uS HIGH, 5.42uS LOW, 46%/54%, Freq 98KHz
- 400KHz: 0.66uS HIGH, 2.00uS LOW, 24%/75%, Freq 375KHz


So this fixes the frequency, before they were invalid.
And it fixes 400KHz on i2c_AO...

I do not understand why behavior is different between i2c_AO & i2c_B, they
are feed with the same clock so it should be the same.

Did you check on both i2c interfaces ? can you share your results ?

Neil

> 
> Thanks
> Lucas
> 
> 
> 

