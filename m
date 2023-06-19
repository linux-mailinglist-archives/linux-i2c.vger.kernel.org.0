Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A04D3735B9A
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 17:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjFSPyV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 11:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjFSPyU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 11:54:20 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8DB1AE
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 08:54:19 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-98377c5d53eso513222766b.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687190058; x=1689782058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1J7bpV25mzsdORD0WheH9YutL+Csmp91H5Yp7POCWo=;
        b=C1ZMiCiM7brNNjSxcGCEGNtGe2KcHEVGj56968p9lDd5Pzbw0KotRd2wza1b/rd42A
         Ek5TC2BWnSUs6We25lmtlQAgfdzE5kPzM2ru0X06CBnDLWoPfqOZ+gTpT8sD6UjHBJRJ
         br9+HFalicE7R5lhR9Vded9wJXsQw4qTzkFJ9DyK3yNl8x3pemgMI5xPj9bcLphwJcYn
         9tScTBclUwN94J8m/4dXLG6NX7G0gNOZ1gDuIHCxiQ4REFNJXi7O7TNp2TMHxFBLGqVE
         KMon7SyJzxSldo9m46RumrNBGUefQPbKnQzEmdwRSOzxTFMlqpA0LcfH5Fw/05bx9AK7
         AxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687190058; x=1689782058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1J7bpV25mzsdORD0WheH9YutL+Csmp91H5Yp7POCWo=;
        b=Lu5oJnej4s7IQ09+xOO953MDP6w/kDdyuB0YRrjFmvFqxuc262+0m2PdRjmwHwGddW
         CoB44Et6C1UsymcTcP8aRtKh9U65kSEwtBDK0T0+dmWtJRiCS0SmUyCUlea00qdB+ZOr
         eIe40hi3516i8O9Vbjp88OM+KLbDRDO1ivm8LfQFdYtkj70iIOkEZzPxZJ0DtfNobGWS
         CN3limBSRMIrFq2uq/0GhEexMNvskwEm+HfQo9soTrnk3ikzwMsM7TiwzyoeurXnZ0XJ
         4N96LmYaBo8H81IDFBj09HyfMF8G7w5vGrxgrB+EeBf2cv3OcT/nQ4WO2yh74wDHcclG
         iU1g==
X-Gm-Message-State: AC+VfDwiN10omZDeD42/h0smw8zF6uRcjgH8jtJ1TiZOc4+4FRk9c23Z
        kWMfjVwO6vUl22DrMaWxovSyb9l4PLTzOk3OsJ4=
X-Google-Smtp-Source: ACHHUZ4FBYHr0cofO/M+1tXxBvvQtPBLt8AqsAnz3EsVyaFPy1CRYm26gOhMjp8DyKfw6ZClaUvNzg==
X-Received: by 2002:a17:907:3d8e:b0:978:8925:79ed with SMTP id he14-20020a1709073d8e00b00978892579edmr8586686ejc.74.1687190058046;
        Mon, 19 Jun 2023 08:54:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bk4-20020a170906b0c400b0096f675ce45csm14802399ejb.182.2023.06.19.08.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 08:54:17 -0700 (PDT)
Message-ID: <2181d5f2-b490-7464-abb7-0e9553d9cedd@linaro.org>
Date:   Mon, 19 Jun 2023 17:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/2] GPIO-based hotplug i2c bus
Content-Language: en-US
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230619153732.46258-1-clamor95@gmail.com>
 <30c50635-ff42-3a85-a419-673ca6d0422e@linaro.org>
 <CAPVz0n1fo7EjAC-UUVawQoeP4AhwRWAg1MZyremNDHFdta+Reg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPVz0n1fo7EjAC-UUVawQoeP4AhwRWAg1MZyremNDHFdta+Reg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19/06/2023 17:52, Svyatoslav Ryhel wrote:
> пн, 19 черв. 2023 р. о 18:49 Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> пише:
>>
>> On 19/06/2023 17:37, Svyatoslav Ryhel wrote:
>>> ASUS Transformers require this driver for proper work with their dock.
>>> Dock is controlled by EC and its presence is detected by a GPIO.
>>>
>>> ---
>>> Changes in v2:
>>> - adjusted documentation
>>
>> This is too generic. Everything can be adjustment. Be precise what you
>> did here. What changed?
>>
> 
> Everything that you asked for.

And how other people can know it? That's not a proper changelog.

What changed? If you are going to ignore writing proper changelogs, I am
going to ignore patches.

Best regards,
Krzysztof

