Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7899850B148
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Apr 2022 09:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444662AbiDVHYU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Apr 2022 03:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233529AbiDVHYT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Apr 2022 03:24:19 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2DC50057
        for <linux-i2c@vger.kernel.org>; Fri, 22 Apr 2022 00:21:26 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id lc2so14557462ejb.12
        for <linux-i2c@vger.kernel.org>; Fri, 22 Apr 2022 00:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mozxGpVNThVpDxU3FVNcRd3/bjSVUfsXgVBZGesYHcQ=;
        b=dFaXJiaZInJnghQJtlvgdh4lXAnWTxUSVihj7RkPF/++bL8fVbLlZ/pLUAlKoZh/x8
         /iRlc0YIE88TB85pKs95phIGUI/VkIX6cRyEPwLOu+jObgbS6pxqnNXgPu7s+7vukl5h
         lcuad8p9vJHqQyAzwldWPyxExC36yVWvnDVof7Vbm9EN2N0axmsvQY9kU2I1T1X4XSgE
         FGiihVPBg//1Jg5T7zeEPibKuZVkjKFrMhSaB2QQBt/HGD5BAFODvxz7MQYEk95yZU1g
         +1OKDbmG2bGMtaCmlNZ68Qfq7vVUr4uQVSSjEb6KQJn9j16zS2FsiU9Xige6DKLdCv4d
         wYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mozxGpVNThVpDxU3FVNcRd3/bjSVUfsXgVBZGesYHcQ=;
        b=O2bhzf6rCfE8zMJoXlotbbKHnudA5P0NRpGdwCEzlwgILmG7MGkfSdZUSyFA2TGVSR
         ilZQdpIRY3UGyIyB5UZHJ8int0ZpwDx3KTxu949uc7mqkxQGc3odOE6aWG0uRiZFAWr4
         9l+n4haqKyURmzkOvMnFwP486tNQ2+qKG922M6+br9/01+teuTcMDtzN/AN/BVL6CdJH
         hrUuoNsJqmVKusbh2L1Wq1ftYPPOhxCSSUE2ixxvo8xv0LoH7ctYTgZOZaM5BNtwD4Rk
         2kkCZraSBsGLz6ooB9uscSCvgJNpQLIQH5p94f3ID+7ksdr3vwYtcPp0WA7xmWi0yj5X
         gJpw==
X-Gm-Message-State: AOAM531Il5p3sGt1CFFPuHFy3vyE82c/swvv8sDw1iSd83S+O4L3KVnx
        geDb3Hh2YHS0E86DzflQO9KWLK0qf2fqKQ==
X-Google-Smtp-Source: ABdhPJwijLHu2gqRX7mBCn8elSy2a/cyiAkiWa5IL9L5CDIleQFKOvKyFF0yVvaYGr/UJ2+gL0DWmg==
X-Received: by 2002:a17:906:7f02:b0:6cf:86d8:c31c with SMTP id d2-20020a1709067f0200b006cf86d8c31cmr3012426ejr.518.1650612085191;
        Fri, 22 Apr 2022 00:21:25 -0700 (PDT)
Received: from [192.168.0.230] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f5-20020a1709067f8500b006da68bfdfc7sm471328ejr.12.2022.04.22.00.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 00:21:24 -0700 (PDT)
Message-ID: <55cbbc16-5769-ecd2-e65e-c3b39a34dfbb@linaro.org>
Date:   Fri, 22 Apr 2022 09:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Content-Language: en-US
To:     Quan Nguyen <quan@os.amperecomputing.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Corey Minyard <minyard@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-3-quan@os.amperecomputing.com>
 <153da61e-dc9d-467e-221c-b48d6f54c6c2@os.amperecomputing.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <153da61e-dc9d-467e-221c-b48d6f54c6c2@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22/04/2022 06:16, Quan Nguyen wrote:
> Added Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> as I'm not aware of the email change

The email change from @canonical.com was 1.5 months ago, so it would be
better if rebase your changes on more recent Linux kernel. You get all
proper .mailmap entries.


Best regards,
Krzysztof
