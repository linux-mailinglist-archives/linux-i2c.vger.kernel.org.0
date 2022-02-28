Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660624C65F8
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Feb 2022 10:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbiB1Jrp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Feb 2022 04:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbiB1Jrp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Feb 2022 04:47:45 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD336A00F
        for <linux-i2c@vger.kernel.org>; Mon, 28 Feb 2022 01:47:04 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 871023F1D9
        for <linux-i2c@vger.kernel.org>; Mon, 28 Feb 2022 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646041623;
        bh=EpgoMOR6UC3l3nQ7gCKRaGHrh4PEexWfIMc6Exi5PTY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=oy3Vmdxb5GAIsP79rJx7ozgGMITlUSQPJsw6Q/B6qY6A3Nl9ObBkEKyiivzvuH0lD
         sSEpC7Wzs1q4GN/YHXftXY2iLo/HB2JNpmwvLRzUT9BNiuxE1bdrpmvCX0pjLUeGQw
         F74gFHuFd56fbqhxen8UMJ98f1BnT68SokhGanu19+1UuLf3P7K/P/Pod+xg78j/I8
         yepZThQU8+cqXAaer1wvHK1G+ypeLM5jpXyM2em+D1fSwfwRbtp1SngZ8cDnCdZM0e
         UcjHS3LpjL2tFADllQmI68p4gtW1jbW0ncSCpCDjfT7uastRT05Oe3Yyhn1E+Ds7QJ
         B6MzIwpW9sTXQ==
Received: by mail-wm1-f69.google.com with SMTP id q17-20020a1ca711000000b0037be98d03a1so6196173wme.0
        for <linux-i2c@vger.kernel.org>; Mon, 28 Feb 2022 01:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EpgoMOR6UC3l3nQ7gCKRaGHrh4PEexWfIMc6Exi5PTY=;
        b=7jZnJXBq5qHDJtT/7f+62i1+qZCfnVDtcqWNMAjUJBXT5jA0hmh7N1rN/l4RS1Wp9L
         U51jVHbeuU5UaV3lpU86gx3rE84VvHYqjDGfoGAumnNTyUIDKgH7zHJz2xrc2zDaYhsD
         Ho/+jsAzRAEf+XyTNxsibtWZYsIU/Qb/iGTR1I0r+7M0nsgc5DWx46k53lxt3EtVS8EK
         OUitksZs8VlLGhCcsuEhBxp2DgCv2gcCiK6HeF5vz+K9DEeVAjvduTNaSdkwXzqONk7L
         mjgXQHaoNg4RwP1XKfZ8pNXQeeoO0+3r+lO3He68iIHMRBwo8CHvPw+HBM2PaKjleCmS
         127A==
X-Gm-Message-State: AOAM531KlijXhNnFLfLUd53li2w///XhFWOhdOoDYxhOJzAFV8akwf4h
        vB+eRivl5m7Mk0Sa2gqeskQUjUpuTDPvhEE2Fj20mqq6IytJUhYpTFgnWQ17D1lf5ATbLdzafTi
        NAz4VQ533n+dscgSUTpY3deY/BRqwJtV7QFOxLg==
X-Received: by 2002:adf:c188:0:b0:1e6:8ecb:ea5a with SMTP id x8-20020adfc188000000b001e68ecbea5amr14682245wre.711.1646041623218;
        Mon, 28 Feb 2022 01:47:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1MQrmxE/R+HSmU+JGaqJA8OjgOG3SQPiDIMSEoBZ6fjSsDIfcUwdI70YoFS/spyArSqyQFQ==
X-Received: by 2002:adf:c188:0:b0:1e6:8ecb:ea5a with SMTP id x8-20020adfc188000000b001e68ecbea5amr14682238wre.711.1646041623070;
        Mon, 28 Feb 2022 01:47:03 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id v5-20020adfe4c5000000b001edc1e5053esm9854945wrm.82.2022.02.28.01.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 01:47:01 -0800 (PST)
Message-ID: <0d605f73-aa26-58dd-6bb4-674764baadb6@canonical.com>
Date:   Mon, 28 Feb 2022 10:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/V2L SoC
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220227214747.24819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220227214747.24819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27/02/2022 22:47, Lad Prabhakar wrote:
> Document RZ/V2L I2C bindings. RZ/V2L I2C is identical to one found on
> the RZ/G2L SoC. No driver changes are required as RZ/G2L compatible
> string "renesas,riic-rz" will be used as a fallback.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> DTSI changes have been posted as part of series [0].
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> patch/20220227203744.18355-6-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
