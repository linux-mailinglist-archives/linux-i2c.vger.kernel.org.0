Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5394B543F47
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 00:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236652AbiFHWnA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 18:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234704AbiFHWm7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 18:42:59 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358C91A053
        for <linux-i2c@vger.kernel.org>; Wed,  8 Jun 2022 15:42:57 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id z17so6780357wmi.1
        for <linux-i2c@vger.kernel.org>; Wed, 08 Jun 2022 15:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5uDM6tpuJABWxtiilCsqiowJeB7LSvJ3XOBsyRBng14=;
        b=ZpV0eJIiO9NjPQhX7Pl1+84j9heHppBnLerRQ0JTcVYGIcd+V4BCwS42iTP1N7oKQB
         W7tSUdxaNseKHAZj1LTZWO6VOczeDo5mScli8jffnF99cYBFJ4fPWPro4MpfoSmbnuYs
         UDWVcmRF4Tsk9qX82xDLerieJ65qvcB+MLtqEt1G5KVMWJYO54dLxcNQLRERpDDCZhqV
         fHb9aqAQ8v1ViIltT0HzpeVJIWFRxOizwUNd/R9t57RElo8irDHrFnLQPlLrJ7ZjqLfF
         Ou1lGanFu8k16V9tWGdRh7l6ra84kf8MzsiM9yjzzuP09JlkNuYa7lVXkpgwGYe+3ueo
         7zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5uDM6tpuJABWxtiilCsqiowJeB7LSvJ3XOBsyRBng14=;
        b=ZqQiB2FzIP3Yz3+ySM5HkalFA90yh2kM6AV/x328V87KoF1TktMesNgZi8wg+OtFgz
         P2JmTQkyEXG2yif/fOuOCm2+F906IyvJx7hbZLnTKz8hb/rrDyo1PmU2DlqoS8GFWexi
         hCqbK3znD1VU1GotDP8eBGIs1epNDMqWJ4NRTZb0kAgql9rVdOJqW/Dy6xlisKC9gTTf
         Gs9Oj+ZfOMEkuD+L1ar91rGzpD6wahnMqbmeTS0LNIaHHEg5tfzIDpldbaeUArI2xhpX
         kzAsFrInjSrHXMa8XpbBlP9UK1YgM3j/6VTUUANWRREXC93iBgwiveVw/5xaRVsQatwj
         bLiA==
X-Gm-Message-State: AOAM531eBfBF3NnX0C2CnZHkmNxnfM8saJUz3XjwtBlbvLW7zeuL1IQ1
        LjTPYQiB5geY5m4YGey7AEy3tw==
X-Google-Smtp-Source: ABdhPJwWjpgU/pQzp05ZueMBa5kILkWmN28ZkUdlRmQ9I4QeDy95gollDJq8USjph7VhhJ4Hd7rl2g==
X-Received: by 2002:a1c:f314:0:b0:397:10a5:a355 with SMTP id q20-20020a1cf314000000b0039710a5a355mr204713wmq.176.1654728175656;
        Wed, 08 Jun 2022 15:42:55 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id s1-20020adfea81000000b00210320d9fbfsm27203751wrm.18.2022.06.08.15.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 15:42:55 -0700 (PDT)
Message-ID: <32299bd6-6038-4c4e-1d6f-979a438db8cc@conchuod.ie>
Date:   Wed, 8 Jun 2022 23:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 0/6] clear riscv dtbs_check errors
Content-Language: en-US
To:     Atul Khare <atulkhare@rivosinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220605133300.376161-1-mail@conchuod.ie>
 <CABMhjYq0GSEfg4T+cTqBwRdykC-rbQNEqnAZ1qM5fYbjUah5Mg@mail.gmail.com>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <CABMhjYq0GSEfg4T+cTqBwRdykC-rbQNEqnAZ1qM5fYbjUah5Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/06/2022 23:27, Atul Khare wrote:
> Conor,
> 
> Thanks for the feedback. I will rebase and send out a v2 series
> shortly (it appears that the 1024 hart context patch is redundant as
> well).

Great, will be nice to get down to zero warnings :)

> 
> On Sun, Jun 5, 2022 at 6:33 AM <mail@conchuod.ie> wrote:
>>
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Hey,
>> Couple conversions from txt to yaml here with the intent of fixing the
>> the dtbs_check warnings for riscv. Atul Khare already sent patches for
>> the gpio-line-names & cache-sets (which went awol) and will clear the
>> remaining two errors.
>>
>> Rob/Krzysztof:
>> Have I correctly expressed the mutually exclusive properties?
>> I had a look around, but wasn't able to find an obvious binding to ape.
>>
>> Wasn't sure if a txt -> yaml conversion's MAINTAINERS update was meant
>> to be in the same patch or not, so feel free to squash.
>> Thanks,
>> Conor.
>>
>> Conor Dooley (6):
>>   dt-bindings: mmc: convert mmc-spi-slot to yaml
>>   dt-bindings: i2c: convert ocores binding to yaml
>>   MAINTAINERS: convert ocores i2c dt-binding to yaml
>>   dt-bindings: mfd: convert da9063 to yaml
>>   MAINTAINERS: convert da9063 to yaml
>>   riscv: dts: sifive: "fix" pmic watchdog node name
>>
>>  .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
>>  .../devicetree/bindings/i2c/i2c-ocores.yaml   | 132 ++++++++++++++++++
>>  .../devicetree/bindings/mfd/da9063.txt        | 111 ---------------
>>  .../devicetree/bindings/mfd/da9063.yaml       | 123 ++++++++++++++++
>>  .../devicetree/bindings/mmc/mmc-spi-slot.txt  |  29 ----
>>  .../devicetree/bindings/mmc/mmc-spi-slot.yaml |  76 ++++++++++
>>  .../devicetree/bindings/trivial-devices.yaml  |   2 -
>>  MAINTAINERS                                   |   3 +-
>>  .../boot/dts/sifive/hifive-unmatched-a00.dts  |   2 +-
>>  9 files changed, 334 insertions(+), 222 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
>>  create mode 100644 Documentation/devicetree/bindings/mfd/da9063.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
>>  create mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
>>
>> --
>> 2.36.1
>>
