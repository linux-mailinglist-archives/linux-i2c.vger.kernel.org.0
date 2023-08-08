Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98590773FF8
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 18:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbjHHQ5v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 12:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233830AbjHHQ5F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 12:57:05 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DB619433
        for <linux-i2c@vger.kernel.org>; Tue,  8 Aug 2023 09:00:05 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fe0fe622c3so9232222e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 08 Aug 2023 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510384; x=1692115184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AV7pYGODgs/vswsM71s7yBSPT97U68gXTdayAu9iSYw=;
        b=SK7EF8irX26ZL05JdgFF1yB8kkEK1uXsZgpdmViSUHGg7dpioaudoLqQUTY26rJIoh
         AXcGjTrdQp1BZGMyQLg8yv/6ufxwJu9LocicnZuhwR14oEHCNsEmwdg9JXJ8e56BWEoR
         wr+kjOOrzD7BdUFLHtP1DhQYd1tGuhoMGdIL0ySLe9QKdbUxpT0u4Lb9ecgYY7ZE/1BQ
         Ve5XVYY9CxHTamGwzPbhx2Cp9cRlPNDYANWz84Bj35AOOq1cA8WIP8020CnsTKdyz54c
         UddK4IY1b3bVkbDHhD9TLxRtedq7z6YeTnKy++9NywQj0cg8bA+HK83DNRkz+zS/+gdj
         PbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510384; x=1692115184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AV7pYGODgs/vswsM71s7yBSPT97U68gXTdayAu9iSYw=;
        b=UZhZptvljl/OzJhriUf1F2yHNVUdU7eCaWuexgjNWwyKraud+dQAW2wNWiIYcmpGWa
         XWRHIPl+GFI6Tbv26DXIRtMjLIFWQkpHBxoLDTAhaYxAdehklotWmd5sW99OuLD0TaE7
         MgLSQrZbQXuGOGVsVGM5Oj0AsPDvbnjXXC6FtS3mU70Dbl5rmn1Yd0j+uWMzQfIw9dfA
         P12+/ay2vsi75Qa6IuSSHZs6OTZmmhwWMy2SMB1TjszGG+aUOwMkzbdhmVzWSx2UBtPQ
         khKXg+JN7J0bU1y58tjJMARyo2zix7qTqPHWu1IhFgSynqewSrZYLjlswX8bKN6LlNtO
         giWA==
X-Gm-Message-State: AOJu0YyUzOFCuQRyYSkOZY+nW3rCoJg1Bu5UQqGnOnetLjAoSpmtOrRh
        BVLwdv0GirE4khrxWve9nvZtOEvbDa5la7CxNiU=
X-Google-Smtp-Source: AGHT+IHi6Yp+yRsRwvN5aEzHBHFgm8hd5a3fbcIKHC1dwK0+H3FWM+RobNVM6FnNwNpUNH5BDqly7w==
X-Received: by 2002:a17:906:e:b0:99c:7134:ab6d with SMTP id 14-20020a170906000e00b0099c7134ab6dmr10266806eja.41.1691483828332;
        Tue, 08 Aug 2023 01:37:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id l17-20020a1709060e1100b009944e955e19sm6302110eji.30.2023.08.08.01.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 01:37:07 -0700 (PDT)
Message-ID: <c589a82d-3011-d437-7343-b52308cbc185@linaro.org>
Date:   Tue, 8 Aug 2023 10:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 8/9] i2c: imx-lpi2c: Use dev_err_probe in probe
 function
Content-Language: en-US
To:     Liao Chang <liaochang1@huawei.com>, andi.shyti@kernel.org,
        florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-9-liaochang1@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808012954.1643834-9-liaochang1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/08/2023 03:29, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 

>  	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
>  			       pdev->name, lpi2c_imx);
> -	if (ret) {
> -		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", irq);
>  

I don't think this is needed:
https://lore.kernel.org/all/20230721094641.77189-1-frank.li@vivo.com/

Best regards,
Krzysztof

