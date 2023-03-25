Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F18F6C8D49
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Mar 2023 12:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbjCYLLT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Mar 2023 07:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjCYLLS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Mar 2023 07:11:18 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E56CF956
        for <linux-i2c@vger.kernel.org>; Sat, 25 Mar 2023 04:11:16 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id er18so6137254edb.9
        for <linux-i2c@vger.kernel.org>; Sat, 25 Mar 2023 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lV1rN1wo2nRvAaYZdkTrOyIvGW+U6VCRJq/I81taaAs=;
        b=u8pAzvSNyQOfu/k+Wa7LHyQPVT2Db4PS1oVigeauzeXlkidjTWyuJMR5qGv7CdnL9L
         T6e6kOVVbXuKNRtbG3DqdEthhneYNCrORCPZBP4Hn8iCiz+5w0Xo70VxcuXbc+1A8aO8
         NyBYo5W1AR1xUMhh/oXNc2iRAZEtSdLqoZKg9qpLE7uSv7YipYMq0VQ3TuOadJCIQczf
         BshrbnzxWSMy3+THqWRstUa8++0b0nTbOp7LtmSr8u2ZkQEhlC63tNWccUd7NazsLdRz
         q64/MD3SsWU/kb+6rTSbvvKgz0p8XF8ekvxVlsEcQ9k2ZTAKxu1DXhTC7EXp9HI63h2M
         8R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lV1rN1wo2nRvAaYZdkTrOyIvGW+U6VCRJq/I81taaAs=;
        b=LFF+YVMgnx+SPxrHPVJoAHMsR8JSlFk2z38AYvg/mGOQbDA/7UhlUgOLvZN3XCpao6
         n16tGGexjKFFFKijJ9MCz4c4Xb/L1xmMwpMdt0/aTkthT+CYRKP7iWBGvH0O4eMdhdDy
         bYp8qRt7UMJ1OWVvjEuxIadHoyKPeuKJbUXrsrFdYzbNfFl80E3DZbkDtDOeVWZw+acl
         4oQYr0McwL+3ooUi2K7rldcRusNoEP+rnSgOX65yKfv9rg1XkXgPXEtrU05LskOvjPiv
         oAO9ClKEvVRNZ63/DM7tCjebCE9lXHNIHiBPD9zgbTz4a7ymeQ0+Kq/wuot/JKINiXMX
         kZpw==
X-Gm-Message-State: AAQBX9d1IcOihXaIBxq05pbwoCFQ/uxNbw7IlcMVE9WUO8M5EYpnaZ8f
        v2enStiBDl/5O1C9Wjbi9UzZ3Q==
X-Google-Smtp-Source: AKy350ZYdSBcRBYiIJQzjnskMU+XdPaRhHfBGxv/yx5cWwiqBHUiNFoQLxPIHqYNeUu4uxUxNT2A8Q==
X-Received: by 2002:aa7:d658:0:b0:4bc:f925:5dbe with SMTP id v24-20020aa7d658000000b004bcf9255dbemr5679118edr.42.1679742674721;
        Sat, 25 Mar 2023 04:11:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id a13-20020a509e8d000000b00501d73cfc86sm7043075edf.9.2023.03.25.04.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:11:14 -0700 (PDT)
Message-ID: <9b2280fc-4619-d748-cb79-eae11a767549@linaro.org>
Date:   Sat, 25 Mar 2023 12:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 04/18] dt-bindings: i2c: i2c-mt65xx: Add compatible for
 MT6795 Helio X10
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, matthias.bgg@gmail.com
Cc:     qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-5-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324175456.219954-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24/03/2023 18:54, AngeloGioacchino Del Regno wrote:
> The MT6795 SoC uses the same I2C controller parameters as MT8173:
> add a new compatible string for it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

