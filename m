Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71C5A745E0B
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 15:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjGCN70 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 09:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjGCN7X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 09:59:23 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A14FE54
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 06:59:22 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98e011f45ffso421028566b.3
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688392760; x=1690984760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X80ysD/F6wvgJKG8ztSCHOsfQgFC0oL2m6OimzpJAHE=;
        b=xTlawRSml3QjxxqYZhVn+T6lwHkX+LmDoaoGwDF4hdysxEQOSi8mjnnsbImPtglyjv
         +ueYNV2paUwXBQ/3g83aN6gYENvfk733tRTvOo0wmNGy7lqUwIRKTvCmRzjxq0In0lW2
         yaNlNGu2TD8uPiYRncw7dSXirI/BcZc/aIq81+eCdTP1Ve5oz30koqDmcvX1NnpVJ2z2
         FD50Py6puVy3JN6WomELAUvSb4oGicviRNggW+lOCIV8fWgQWZIZJ3SL2vKYR8GzAE0o
         aguWBV3nO+LXRycWErSpsSmQXimW/FUnKhiBQIJ4G5w+FRI1cS5L1stPC3bdnhFdlE3n
         GaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688392760; x=1690984760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X80ysD/F6wvgJKG8ztSCHOsfQgFC0oL2m6OimzpJAHE=;
        b=kVJ1YaK7IPVXy7bMoiVvBftZqPSDe2WmMfffXFDHPaO0ODiYTpmpmaIK6+aYG48CyB
         uWz7Yj9in1Dt4d5Zqz+UX3TxBv3gmNNWUojgBu+5EM9WsOHoSeEcs6XYOB2gPCd5lleN
         BxIhNIC7z2TXCUyD87z6em8zzOUfhnc4vydH/PJUQVyxc8stBzdAyBChqxBXe9BeM7M2
         Lscm1Lz9DJ5MM5dvE5RFjVRApcyIGD+pIWoSi9g2LR1eh0brjen67j4E4uSP8YzV0aAd
         c8bX0D+SygSpJnvgoCyHWa9lFkVXr6E8ji8V+dPhp59J0bNQSHfTg1KN3r4SuYaZ5Z10
         nxsQ==
X-Gm-Message-State: ABy/qLYNPvX1MEwN6tm3hl2KgAoXYIkfgbQYE8dTunQ8crlHI15CW6xT
        dZTkit3a/q4WPWw4TnHrKcBb0w==
X-Google-Smtp-Source: APBJJlHWOpmp0L5iU4aJ3V1Luyx61WADzk04WlLGpK/8sKUeSlzfLcnuvKA4rHqVN4V/eGDHm6iOWQ==
X-Received: by 2002:a17:907:76ab:b0:992:d013:1132 with SMTP id jw11-20020a17090776ab00b00992d0131132mr5768360ejc.1.1688392760602;
        Mon, 03 Jul 2023 06:59:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709060e8b00b00993159ce075sm3726148ejf.210.2023.07.03.06.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 06:59:20 -0700 (PDT)
Message-ID: <14253982-da00-ceaa-4fe9-c2561258b014@linaro.org>
Date:   Mon, 3 Jul 2023 15:59:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/5] dt-bindings: spi: spi-geni-qcom: Allow no qup-core
 icc path
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
 <20230703-topic-8250_qup_icc-v1-1-fea39aa07525@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230703-topic-8250_qup_icc-v1-1-fea39aa07525@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03/07/2023 15:31, Konrad Dybcio wrote:
> Some SoCs (like SM8150 and SM8250) don't seem to provide a qup-core path.
> Allow such case.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/spi/qcom,spi-geni-qcom.yaml       | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

