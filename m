Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C06385B891C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Sep 2022 15:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiINN12 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Sep 2022 09:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiINN1Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Sep 2022 09:27:25 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3319C6AA07
        for <linux-i2c@vger.kernel.org>; Wed, 14 Sep 2022 06:27:23 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id c11so25688214wrp.11
        for <linux-i2c@vger.kernel.org>; Wed, 14 Sep 2022 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8KUXcLjtkVihtg11T3oMt0vYyGo5xNo18xehwjt6aQM=;
        b=d0YJHn4cl28LBNrFF2Jacudh0DH+lp8gvP4kqahW8yoym8X30qfMq9xOV1VrDFMtLL
         +Qp5qIAsAYCUzQDPvkkNOBJrG3yiouopMdMBUZAYieEoHCSdl4k0DjgkcKYf8pCqg/69
         OFnkAafaqoXnKOXKpwfSJDJE3HXsAZC5CYh5j8AzL3TwM/WksIx65zOSFThNRAXC57jO
         qOeZnadSPmxZ3bhrA68xOCUcERLU+r9NvOqlY6Mf61VUvqmTyoqL8b31yQRP7JLoGe0X
         fk9NM5uN8BY4HiK2qqyj1tLYHLhlwBtFunBY3cSzJRlZfq2vroy/vrIO7I6l1Ccc0Fy7
         onFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8KUXcLjtkVihtg11T3oMt0vYyGo5xNo18xehwjt6aQM=;
        b=KGe7jqlU1K3Ld8q10bP2KyJqRcWlR+Xctg4TgV0Qvle3h3tKnuhbxJ2dx39Qxpp5Bk
         7GtQm4/jU5W+7kg8iJc6/qH0FebQAeT5iGc24CMroyzChLeAfo/JwyAQzVS4lvzhkR7p
         CVb+9+oZqS1m5gIY/zFzJ4UwLGo8SY0+/j+dVDoAl7FbfretLiDh/XCOV/nL46tloigI
         sGVzZxsUpH6wMPH0hRFme1LpgwMJ+QffVhkmZZj3msSAjnAKjhRim4Fs4ntlTiRU2adY
         DmN3uvGVMmFpvZ3Q+tgcbImDHO+yzTXffTW43v7AEBssU/yznVtlZy/I3iwVpn3Gz/MB
         xamg==
X-Gm-Message-State: ACgBeo0vLV6yeQrQvc2YoOd0sCfFYDlMJE51uIvEO4ZR4eeZx+NoczM2
        K8tfNYDQ2ljmYGVmC7qhlYSS4g==
X-Google-Smtp-Source: AA6agR6TPMPPsLlhAtiQsyA/yLJqtqEhq4K5gfSRuANSt5F79zP1ztVc47OyVeBgOoCioZNHWtccbw==
X-Received: by 2002:a5d:6986:0:b0:228:60f9:b013 with SMTP id g6-20020a5d6986000000b0022860f9b013mr20518582wru.102.1663162041670;
        Wed, 14 Sep 2022 06:27:21 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c12c800b003a844885f88sm16243456wmd.22.2022.09.14.06.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 06:27:21 -0700 (PDT)
Message-ID: <bfce8af1-8826-be59-437f-0982c14f6d24@baylibre.com>
Date:   Wed, 14 Sep 2022 15:27:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 16/17] arm64: dts: mediatek: add mt8365 device-tree
Content-Language: en-US
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     fparent@baylibre.com
Cc:     broonie@kernel.org, chaotian.jing@mediatek.com,
        chunfeng.yun@mediatek.com, devicetree@vger.kernel.org,
        dmaengine@vger.kernel.org, jic23@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        matthias.bgg@gmail.com, qii.wang@mediatek.com, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, ulf.hansson@linaro.org,
        vkoul@kernel.org, wim@linux-watchdog.org
References: <20220531135026.238475-17-fparent@baylibre.com>
 <20220720131257.530168-1-aouledameur@baylibre.com>
In-Reply-To: <20220720131257.530168-1-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Fabien,

On 7/20/22 15:12, Amjad Ouled-Ameur wrote:
> Hi Fabien,
>
>> +		tzts4: tzts4-thermal {
>> +			polling-delay-passive = <0>;
>> +			polling-delay = <0>;
>> +			thermal-sensors = <&thermal 4>;
>> +			trips {};
>> +			cooling-maps {};
>> +		};
> AFAIK mt8365 has only 3 thermal sensors, therefore tzts4 should not be
> added.

I discussed this further with MediaTek. tzts1, tzts2, tzts3 and tzts4 
are used

for test-purpose only. Since they do not have trip points, thermal core 
wouldn't

register them anyway. Thus, I think we should remove them altogether. Only

cpu_thermal zone is relevant and should remain.


Regards,

Amjad

> Regards,
> Amjad
