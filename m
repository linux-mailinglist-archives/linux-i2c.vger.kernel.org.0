Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E391D6FC9EA
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 17:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235600AbjEIPJR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 11:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235430AbjEIPJQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 11:09:16 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E1640E5
        for <linux-i2c@vger.kernel.org>; Tue,  9 May 2023 08:09:14 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9660af2499dso767616266b.0
        for <linux-i2c@vger.kernel.org>; Tue, 09 May 2023 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683644952; x=1686236952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tATEBdv4Th3DWwuFsgkk5JRRhiNVws60MF7WAh3f9OA=;
        b=LxlKoqbJvtHvqRAP+5d1Zc4WsW/fQEjxk4Zo0ePXLJUaoteB0UIVpaE6RxfEIyecVI
         yvWdL8Rmr43ob8WRJ6CnTRZBHflbusJfIe9zUouR4zrxZpJFsAWBcw2YR8C/ZSnS7KM3
         I4eze3ai0IetLTgahiZjJwzIPN/AbjDQQ/vAuAFTaxc3O+MnXNJB51gZh6X/OZ4NJVUJ
         pyqDbJR09sO+Omr/5aYLvqBXBcmRhKscfSXD6GDE0uSuxT+F9FK54O1vPBOeKHZ9NEVd
         UfLJN+eeIAEPbxNPB5yP29XfanRH82GEQD8ni5Tqpa5aIbwHt4xIY9bAJtQoAgXCS3c9
         szyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683644952; x=1686236952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tATEBdv4Th3DWwuFsgkk5JRRhiNVws60MF7WAh3f9OA=;
        b=KPC/XIxArKpmNZmj7FIDz1iXeCOsd1qUyscUcsGR0VA+Wk3tGqfGCGckU231dRjebo
         vhDQeMTis9qStjhdwXsVbKk6INIP8NtuIfB/NTPqbgPW4lxVUoP1h26JWEabbnmnu6ii
         4l0/KHpUZC3mnRwvnwBuX8V61dtIdKfxbVHfqnv8b7DR9J1SX536ZJjygTLAH0C1ZE1j
         jm7TFDve2i5MZm9XzsHc1NM3ZON9ViUJS5GUPe0yoSkCF1uqObaEiPQuFF35mA2pkNdp
         xQm06vcYlfXKaSFolKjAP6RB2BhhXYN7Gje++gT0qV48m4Bhn5BQUn24qvt0M4DBdq8Y
         45BA==
X-Gm-Message-State: AC+VfDzJj4xDvhAFqXTUarr4A+kC9OkvNJksmNZYfnrF4luNzlAL5TAn
        M+ofLaQXOFBfLnWvDM1yOFmXxg==
X-Google-Smtp-Source: ACHHUZ5AUxnY+ofHq7XE1lfTol5XodnxYeU9cTipQ0TLkFDHErn5WJkRlbVeZNQgu6/IX557sedtLg==
X-Received: by 2002:a17:906:dac8:b0:94e:e97b:c65 with SMTP id xi8-20020a170906dac800b0094ee97b0c65mr11674604ejb.60.1683644952557;
        Tue, 09 May 2023 08:09:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id h8-20020a1709060f4800b009600ce4fb53sm1424179ejj.37.2023.05.09.08.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 08:09:10 -0700 (PDT)
Message-ID: <b5f58eb5-eefd-9dc1-91bb-67326be70f98@linaro.org>
Date:   Tue, 9 May 2023 17:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 62/89] i2c: s3c2410: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-63-u.kleine-koenig@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508205306.1474415-63-u.kleine-koenig@pengutronix.de>
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

On 08/05/2023 22:52, Uwe Kleine-König wrote:
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


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

