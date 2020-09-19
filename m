Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B72A270D92
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Sep 2020 13:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgISLZr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Sep 2020 07:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgISLZr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Sep 2020 07:25:47 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A854DC0613CF
        for <linux-i2c@vger.kernel.org>; Sat, 19 Sep 2020 04:25:46 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w2so7626231wmi.1
        for <linux-i2c@vger.kernel.org>; Sat, 19 Sep 2020 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1DD3p2InLpuc1wZ6+ArMyt2jtw02/u4MJluFtFegrEw=;
        b=gTwa8afSUvU9hYVm25e8bTxFk8cwpK81K+DidtbkYO89iBSHHyR/GIwwcI2jI/icij
         A6/kXqxyXGjBqbWqczg7y3pl6t6dHXLJZQCdIVOUyW8tLWz5b1hMAiuMFgiUCgaJ7N3v
         139DYyKaGI0R/ANXO1O1LXdogdyg9d9xBt3uvFv4w84GLY3oukI16YzcwV1dTNZwnG2y
         WddNukhTiNaf3Iv/SKpKDZVnXf0CK4uComulK2a24yN56vXuHh707XIS05ceKKCZjbdG
         Py/GmWOu5hhdmP0Q47tu/Nbgc4dpNu7o4laDoHGNQFhHO1HQxi0oYJsExxCGju+McK7l
         MnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1DD3p2InLpuc1wZ6+ArMyt2jtw02/u4MJluFtFegrEw=;
        b=eQESi9uFepWTzuSPUXgLNr17UqFxD46Khc7pHpUzEzR1qqYf1DPO318dFo106mgvtd
         lUIipmGU6Mzs1n5idi7cA9sppzwF4F1kOZUkDIjQwAnYPsYLGi55VKox1jTRllc8Yk8V
         H97psU3ocHyUJEpnr/c0drYsYU+FhGvYodFrXG16V5dlux0agGDDu+blKV5XS2uRdby+
         Q2NgRACBLvpWPWkCcWscGcOq2SnpAeZXQF8zs1TyE6uUo5QznEmVs8AAqvA1qz6HmerA
         IDCfoCPOJutyMSIruCmpQnWrvaA/oE1KHJSbMrD1frlRAGti2VCUxU7cA9qlvhNs3yUU
         y9PA==
X-Gm-Message-State: AOAM533MHMWVrKwrQkoCNvuBriZRHmK8sGTsIO+U1z1n7jaWQF41uTHP
        bKm10ms7FGkpFCIL8VcAGhKs5g==
X-Google-Smtp-Source: ABdhPJyF1kBWHNq5hH1sVEgtu3Qk1xgHZAzNNJKdql79su8qhtMOz0aVE29ME9G064v4G9FJtGlgVw==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr21318770wmi.105.1600514744986;
        Sat, 19 Sep 2020 04:25:44 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9142:20e7:201d:cd11? ([2a01:e34:ed2f:f020:9142:20e7:201d:cd11])
        by smtp.googlemail.com with ESMTPSA id x2sm11083178wrl.13.2020.09.19.04.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2020 04:25:44 -0700 (PDT)
Subject: Re: [PATCH 02/20] dt-bindings: thermal: rcar-gen3-thermal: Add
 r8a774e1 support
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-can@vger.kernel.org,
        netdev <netdev@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>
References: <1594811350-14066-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594811350-14066-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vwhtTWjaoXkfMBjKx90WkcoejD5ryPkXnQNEbtgnJGXQ@mail.gmail.com>
 <CA+V-a8tzELW-F3GLqq+M3pKoYZwfsc28K-PVVQq-sxJN0pL73Q@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <39217547-dc5d-b84f-e709-dbf3a9d688e1@linaro.org>
Date:   Sat, 19 Sep 2020 13:25:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+V-a8tzELW-F3GLqq+M3pKoYZwfsc28K-PVVQq-sxJN0pL73Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19/09/2020 13:05, Lad, Prabhakar wrote:
> Hi Niklas/Zhang/Daniel,
> 
> On Thu, Aug 27, 2020 at 5:52 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>>
>> Hi Zhang,Daniel,Amit,
>>
>> On Wed, Jul 15, 2020 at 12:09 PM Lad Prabhakar
>> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>>>
>>> Document RZ/G2H (R8A774E1) SoC bindings.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>>  Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>> Gentle ping.
>>
> Could either of please pick this patch.

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
