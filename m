Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8246FC9EB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 17:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234838AbjEIPJ0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 11:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235430AbjEIPJZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 11:09:25 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB23640D5
        for <linux-i2c@vger.kernel.org>; Tue,  9 May 2023 08:09:23 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-965e93f915aso918463366b.2
        for <linux-i2c@vger.kernel.org>; Tue, 09 May 2023 08:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683644962; x=1686236962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bpRKDonr4DEZQtbv/y5vpB5C6FTS7DxEwpmgWjKNxM=;
        b=P4CltB87AmAZUePMykq8Io05E+V0eaKKHObrJK80qABsIwn3KusN3ca7fvw5mnxMKS
         +MmTtsn3Q8I8ydBr9MDYjo0tmG3ssJpVKIRdtLFmoeafMs5ogjyKNchHWwf0nWZVwu9I
         STQjMfjO0cRmLqvIn/GbO4Eee1mM1xthT50EPgoD3ca9INfMfNv+EYxi+8MkT7GXknVB
         qAl/QsAB/5HcMSgmoLQSB9mFXewnKRidpqPKLqEOC0o9c8sPQx/Ix8bmabPG7ZT8Tc8o
         3RKd2eUNhXxmmg52kqYa8TbpVjXiI1kcmY/otDRqmCoUfTU+QZlhpqTT/Hv0SY3nJ9PX
         apiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683644962; x=1686236962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6bpRKDonr4DEZQtbv/y5vpB5C6FTS7DxEwpmgWjKNxM=;
        b=e0kk6XOC7MnxFq3oHEusf7ZT4P7/ZjQpgofI8wt05sdD6lTlHh7O1eQJuvhioiRiWO
         X71+LFkCrrO/uEMtAJtK96RPMFMwhHZ18MzbHgHLhqNpu9clVYGb4b6fVPqRuMVaY3ZG
         2YbbSZoD1ot9qAGyqc8icdYiWoDFXhmlgjEKLT/G6tS+FrygKt6cpXP0pGjYRwAQEZG7
         0QJb5nWe+brFz9UPvUOUiDmnn2VuEWhJD6He3ePcFHufyv3v1o1sgD9/B+d/a5FTst/a
         Tebq92e3q+/mhk1LJMafvSZ0PQbCnxnyorJ5WfXqkuGH69k8h346ytJikL5imgSbQj73
         YZww==
X-Gm-Message-State: AC+VfDy4C6mPs3QeEfmOqxpQhFvNqMwbwQoVBN0TBmtonFM5iYDaRnOE
        vQyvr3g3uPpGfUT3X34BtZUMZXH0Gv60vHSKmOc=
X-Google-Smtp-Source: ACHHUZ6bCpQ2QS8rv0XKLPfBEd9iVcVkxSTGu/qYma6OBTIGxH0m03mhCkbgP2k+8hlTu4av/nSh7g==
X-Received: by 2002:a17:907:25c2:b0:969:f3b4:89 with SMTP id ae2-20020a17090725c200b00969f3b40089mr2096356ejc.49.1683644962409;
        Tue, 09 May 2023 08:09:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id hu7-20020a170907a08700b00969fa8a3533sm659395ejc.165.2023.05.09.08.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 08:09:21 -0700 (PDT)
Message-ID: <894287ab-fee9-1e3b-dc14-cff44a752412@linaro.org>
Date:   Tue, 9 May 2023 17:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 15/89] i2c: cros-ec-tunnel: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Benson Leung <bleung@chromium.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Guenter Roeck <groeck@chromium.org>, linux-i2c@vger.kernel.org,
        chrome-platform@lists.linux.dev, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-16-u.kleine-koenig@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508205306.1474415-16-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/05/2023 22:51, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

