Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADFEB6FC9E7
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 17:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235639AbjEIPJE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 11:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235628AbjEIPJD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 11:09:03 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABCE40C4
        for <linux-i2c@vger.kernel.org>; Tue,  9 May 2023 08:09:01 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so11245689a12.2
        for <linux-i2c@vger.kernel.org>; Tue, 09 May 2023 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683644940; x=1686236940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaDKR2p0zdD0a8lDQ+qgslyRKn6YdLmPD51VkEeDKAc=;
        b=KuL0yASY3bc++1Cmpya2xQBB78bMZRak/YYVD4G21lex1qhHm/1iozQK/eDO94POwC
         2sOWITHhdxlrHmWTS3bog9gG3tK4vwAe5BWS5dSQdJytCZ+h7Bc/RKLf05hYZypNkNPk
         eblegBknq3xbqGceIG3dtKtbtTOF/aYIQuhFNb4YjNT4Yg2OR+P9xDvwIlu+Z7lHn1gt
         5sQYIDQfiOZ8Nb1QOV15yhbVlROS/fVFHtA2zzzseMy1O9MLj3eMQCr2iql41/vTKtSO
         FJhBtIWkqypV99zTPa6araVU2L79d12WdCBEARdfgkhk1BF1vUchqy3G4TIvn1XGOq+z
         BkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683644940; x=1686236940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaDKR2p0zdD0a8lDQ+qgslyRKn6YdLmPD51VkEeDKAc=;
        b=Icl2PebUbbaNqD6+TFNW5eFuyD29EO3FgLv0XZy5zRAG+SpHnDKmRfXYaE/jLO5PIA
         28kg+IX9lN3hCJb0Mpt8kLkJV43x+XX6AraIhosCVCu8cBKWX7Nh1t+iC+HR3p1/MePc
         R8EApreQuFLdeK9rlL3EUSIn5UYL5AHibAhMLbXemgSA0QEhMyFz5OpG7LMzo9c06Joa
         wcMmZH5ouCjram0EdGHlwdHqDtVk7pP6yQz4doW/WRY4v1Ji4vtkYwRwYpX66rJcIpa1
         XKT96Z1/rwChngHoBxqWBLoulmhd7zJwyefs/Xr6kWlLw7KGvc52jhtJUcS/Yd4xD8dD
         mY3A==
X-Gm-Message-State: AC+VfDzoCTiic8i+BuD1hG3eqgBpXKWDp4DSQTiP5LyfgTEZ0WIO2wnw
        IA4Iz+P7aq09PdkL397/3keuIm5uem9zSrWL+IQ=
X-Google-Smtp-Source: ACHHUZ4reaMeugK6lmbJwrnWedEAAIPOuQ87Q5Gf1Q0snLoezHMiV0+lbh2RxpqSF13T/+sPmM9tzQ==
X-Received: by 2002:a05:6402:1116:b0:506:bda9:e063 with SMTP id u22-20020a056402111600b00506bda9e063mr11385485edv.16.1683644940324;
        Tue, 09 May 2023 08:09:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7da17000000b00506987c5c71sm868416eds.70.2023.05.09.08.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 08:08:59 -0700 (PDT)
Message-ID: <e40efd68-b110-f301-5fd8-cbb9a59c8be0@linaro.org>
Date:   Tue, 9 May 2023 17:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 22/89] i2c: exynos5: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-23-u.kleine-koenig@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508205306.1474415-23-u.kleine-koenig@pengutronix.de>
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


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

