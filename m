Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010B667EB87
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 17:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233428AbjA0Qtd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 11:49:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234339AbjA0Qt2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 11:49:28 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442657E6C0
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 08:49:18 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso5932619wmb.0
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 08:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwxIin163802ACvSCq0jg4HlDZfjOU+b7ag/1i6mXEE=;
        b=p0bN2yAu28MNGvTlRbQWr0+f8dRrN7+Tn627u0K/x42EmNDLphayIf9NlMev0wqj8h
         /EmzHfmLQqKOVu8ZgIciDK/fUJr6PvWPKCTqRsZtsPxIDrQvOH3aJeQUvnun7rNkTSUQ
         6/KZMhpjpBCdTsrlPk0Pq1AqbefuhemfseqENDs+CCppSNm6HT2vKHwFAalheOqTayxm
         dtjoNuM92e8Dp5V+KrvfMQYfpqoVE/fUi7G9DPER5YIOirUmedqSV5KeWbBKvr23C7Je
         C0hL4yNzr1apQ8T4Xaqa5bA4xfUJep3aF5qWXf5H1dWiQl4NI8yI1oLJqFFQ+XguiBLe
         Z84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MwxIin163802ACvSCq0jg4HlDZfjOU+b7ag/1i6mXEE=;
        b=qcF6/jd+K3SC7sQmzP7Ek+pTUWMthqDC9XHkvHExr1lR+b86Sr9lRqQAucCiX7egBn
         6PanFDgdxOf16jq59FuaobDhkbTZdmQVnXiz1PwlZYikcek48En5r2N9IOGyHaWfOESE
         807IgXkCgIrkIdJXVlzCR3sryBC/V3e2M26fruhd0C2xUOOvdV4c18Ngwg8ClVU66Y96
         AMCImJ872KHevNtD/dipqK/FQAJCy1Rpg7kfoFC9Jb3DQEZKlQlb2Z6i2LjcH0ccF9jm
         paHfaBhnQSOlgq7viLZxEVwePikjhOeKUI+YcpFO7cEYKLxBFqRNWwGbSyuVhWn+V3Vq
         J8Hw==
X-Gm-Message-State: AO0yUKXMMs1fO+mHO5FkgwHGQgg1ob1zfq88xcmW6gRZqyzDjp8Clwx5
        UOZuaMI2QYnV+zxuFiRLh+5dRQ==
X-Google-Smtp-Source: AK7set91BwRn6DZssbXKyvbz30nnUQMYADbkS+Drm/RA9jZHFwp9Oe0M3rmb1c4Tgb8gUCp8+I209g==
X-Received: by 2002:a05:600c:3151:b0:3dc:443e:420e with SMTP id h17-20020a05600c315100b003dc443e420emr40585wmo.2.1674838156833;
        Fri, 27 Jan 2023 08:49:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p24-20020a05600c1d9800b003dafadd2f77sm8990779wms.1.2023.01.27.08.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 08:49:16 -0800 (PST)
Message-ID: <1e498b93-d3bd-bd12-e991-e3f4bedf632d@linaro.org>
Date:   Fri, 27 Jan 2023 17:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/6] dt-bindings: Document common device controller
 bindings
Content-Language: en-US
To:     Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
        olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
        mchehab@kernel.org, fabrice.gasnier@foss.st.com,
        ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-2-gatien.chevallier@foss.st.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127164040.1047583-2-gatien.chevallier@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27/01/2023 17:40, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the common device controller bindings for the controller
> provider and consumer devices. Those bindings are intended to allow
> divided system on chip into muliple domains, that can be used to
> configure hardware permissions.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> No change since V1. I'm letting this patch for dependency with bindings to
> avoid noise with dt/bindings checks. Therefore, it should be reviewed on the
> appropriate thread.

There was a v6 already, this is v3 and I don't understand this comment.
What do you let? Whom? If it is not for review and not for merging,
please annotate it in the title ([IGNORE PATCH] or something).

Best regards,
Krzysztof

