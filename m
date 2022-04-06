Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20AD94F5D51
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 14:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiDFMMA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 08:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbiDFMLt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 08:11:49 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9769040FFAA
        for <linux-i2c@vger.kernel.org>; Wed,  6 Apr 2022 00:55:59 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id p23so1596853edi.8
        for <linux-i2c@vger.kernel.org>; Wed, 06 Apr 2022 00:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=7r2ffZ+ymB7DSx9Uk93kfN7lmzvxR8eXYAcNA9ceeys=;
        b=zxFruS8gRL4tPtU8Ut5n9NTDlAjFzRntseZuBWseA3iiTjEkVVbIBatFpgMTJbydoN
         RM+y5vY/M6WExNM9DIWWTxua06tXakZqJk0uvOu9DkFPsijYYv+NI6C/50DIFmKVa2W6
         Nf9YbvhOHYPxyhPSknarhpoLXa6M7mz3hZA79uJUnMcMuYbC/Y7mgMyRzUERjwppCZv7
         A+7eWm6Ovx4+l44bjrukgViG+oGEua7/hVvndipD5EflBZxz28tGMFpSUeKVCkdXnIA7
         2Du3YqWSjeqyoUVc3a9bykwvyf95KU2gzkx6Qq/2L/aTChNA1iGqtSXSXQ10CrSTscr2
         xR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=7r2ffZ+ymB7DSx9Uk93kfN7lmzvxR8eXYAcNA9ceeys=;
        b=WaVyXGwf/BHstZ18uvP55pOBfkyLkcZkAbuCA6+HbFwEoynwZ8C93Z/4ttVuW0qmt+
         LyvJMnvPf/6wQxgiQu9+snj2SYmAJvF5phjyZd/hZzWo8MNhne9qwteaGbYcvWDmqF+q
         RDGYmYVEBmhmOR3zFOmK65vYt2ra5GclCgxMPT2QkCeZAmJcOQl4AADi4MgUQvW1CS3o
         mGPGak4UMwZccbUTPITWG30IheTp32huOd9P5bVjcW8A5rh1Hn1J8ZfETX/JbfLBwhIE
         ZSSRtlHVHJClWuXjQq8LaZ3vSiq43P2q/i8EBXf/DeukSpXNp1V7401DQBDLI9ts/jRy
         0EtQ==
X-Gm-Message-State: AOAM531d9Zn7JRrBCPoyMZjYg/iQKMTFhxfU0Exwqr1YehA5R/Qk6ryl
        rPX/CXUvL5AVlyaLzUgG3Ji60UfJUUuC9Qci
X-Google-Smtp-Source: ABdhPJzz9acBp2KtEvdtZLSTA2T1pnx8GCYRU6b4yCNpabNmCToBUtduaSjaDpyT7qBPsD4vc0i8nQ==
X-Received: by 2002:a50:9d47:0:b0:40f:9d3d:97b6 with SMTP id j7-20020a509d47000000b0040f9d3d97b6mr7487089edk.392.1649231758115;
        Wed, 06 Apr 2022 00:55:58 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id qq21-20020a17090720d500b006e7eec5c96csm3485199ejb.0.2022.04.06.00.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 00:55:57 -0700 (PDT)
Message-ID: <ecc21772-54ca-23d5-aed5-f87dc7abed32@linaro.org>
Date:   Wed, 6 Apr 2022 09:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] i2c: add binding to prevent device detection
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     "wsa@kernel.org" <wsa@kernel.org>, kernel <kernel@axis.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220405121627.1560949-1-vincent.whitchurch@axis.com>
 <20220405121627.1560949-2-vincent.whitchurch@axis.com>
 <e3247f0f-5d3d-d981-699e-7dcedb30f881@linaro.org>
 <20220405141255.GD28574@axis.com>
 <315c957b-8d22-dcef-a5b8-36e92f0897be@linaro.org>
In-Reply-To: <315c957b-8d22-dcef-a5b8-36e92f0897be@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06/04/2022 09:26, Krzysztof Kozlowski wrote:
>>
>> I'm having a hard time drawing the line between hardware and the
>> "system" here.  The bus being completely described in devicetree doesn't
>> sound like a hardware property to me, but, yes, I can change the
>> description to say that.
> 
> Then you need to come up with better description. :) By system I
> understood here Operating System, therefore a Software piece or pieces.
> Bindings should not rather focus on hardware instead of referencing
> software.

Ah... I meant:
Bindings should rather focus on hardware instead of referencing software.

> Software actually not matter for the bindings... There is
> quite clear distinction between hardware and operating system...
> 
> Can you explain why do you think "bus being completely described" is not
> a hardware description? Bindings and DTS describe hardware, so one of
> parts of such description is whether nodes and other properties are
> present. If all child nodes are present in DT - no-detect - and this is
> a purely hardware point of view. No software here.



Best regards,
Krzysztof
