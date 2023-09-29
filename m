Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398F17B33BD
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 15:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbjI2NgO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 09:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbjI2NgN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 09:36:13 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7722E1AA
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 06:36:08 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9b2a3fd5764so933522566b.3
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 06:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695994566; x=1696599366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dX3EzbJ03kiWTkjRF5Z0MKioiAU0uGpyTvDAMJfhWR8=;
        b=mzes1ZywjR/25gy+Ia406hFKM9n0KP+jt1U4BFerJEMcy7hCibiJxUttSNMVn51zj3
         OcBlBuxjnj+US8oGOtQsiRP/lkN10ukOGYCgeO8M/StEK7ASQr5k0i5L2LfHFtLgFzSG
         juYrGeKjrPW9mLk3Pq32ZenP3ErYA1TnZGBwyQ46qTbkfWgfAdv8fR4QpzzpX24o5tVQ
         5O3zqqmfdwkXefovdTx073hGmlG7cf0F5rP8tm8PJadjLwtyOQ/fgHbb4FHkxBMdh5Cy
         RnTi67WJnH9hYfo827Bghif27oCtpzV4BxqwhpskKCPhur871kHM26RH9kBTVfXVpxp6
         v8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695994566; x=1696599366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dX3EzbJ03kiWTkjRF5Z0MKioiAU0uGpyTvDAMJfhWR8=;
        b=V8VJqZJuXjJU+/XRIdSIoaFr6+X0U8yKG1GIZbpKqLXX6WklZADRB6dIkuE3h2B3XA
         uuIXaai+8A1bBOwyXVIBx9Pfgky8sN/VVvWYi4NRNe9rrwHppAVstlFVUuTV8sDNIOHT
         8aeWNA/0dbCqbhvNWefiNohasH2e0hvHK++pUio5RlmwbpwYLgSkZeNrOVNRH/41SEvV
         BgKOZlJYrhLNGWwuMI9+ZWOt5+EqOWM5mZVou6kBytPPTJpFYFXS+llqbY2Nd38BcfoP
         d+eH9CLp0CUZ8N+QkywFDfKxdq0NEHFoYXKOD22QfnrC4mN4Psenu2L1k70lU+Ng8r3E
         3WqQ==
X-Gm-Message-State: AOJu0YxFxAQ3m/e1zPABfnGhgzQsY02rZuQvFk2QtL7E3Fi4CbUuya1I
        6KrvOaxbAq/ZdaG9pr8FKoOZqQ==
X-Google-Smtp-Source: AGHT+IEI3AsAY5gvqlvssgXWfjMGDIL9ozYTysNBuCR2Lsgq307OmkUqGFKI5pXY7nlqcaper59rkw==
X-Received: by 2002:a17:906:29e:b0:9b0:552c:b36c with SMTP id 30-20020a170906029e00b009b0552cb36cmr4212980ejf.21.1695994566618;
        Fri, 29 Sep 2023 06:36:06 -0700 (PDT)
Received: from [192.168.0.123] (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
        by smtp.gmail.com with ESMTPSA id rf19-20020a1709076a1300b009b2c5363ebasm2289902ejc.26.2023.09.29.06.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 06:36:04 -0700 (PDT)
Message-ID: <02eb9847-62ea-e453-0745-6f6ff46f3ad0@linaro.org>
Date:   Fri, 29 Sep 2023 15:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 busses
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
 <20230929-sc7280-cci-v1-3-16c7d386f062@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230929-sc7280-cci-v1-3-16c7d386f062@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/29/23 10:01, Luca Weiss wrote:
> Enable the CCI busses where sensors are connected to.
> 
> Not covered here is the regulator used for pull-up on the I2C busses.
> This would be pm8008_l6 (L6P).
Does it make sense to enable non-functional hw then? Or is it on by default?

Konrad
