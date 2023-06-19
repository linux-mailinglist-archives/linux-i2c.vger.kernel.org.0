Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 252EC735B7F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 17:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbjFSPt2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 11:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjFSPt1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 11:49:27 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0388C1A8
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 08:49:26 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f766777605so4598164e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687189764; x=1689781764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ACDERcE15xG4+xhzIKgftHezyTgiUPbMstvC//CTbQ0=;
        b=hCs7buA/k5b4wsYCGT0jTut/OtBaAhO23CKjv2ACpyfcMVzU3uJmPot65QVFn/J84A
         SlMqsK8TECZ96Otr5Q9LTH+pj9AD3DqxB+7y5MclNC20xjyBeTe3DVKTUQ/CGB5jzp4z
         b4KaWL+QN5+zzO/FPHRjapOqfEquZcqTZpjxJmCTghGe7rEaMDaX5tpJugpBVF9BV+WY
         4PuPSVVT82Mbxv0dLpiBo7H5z5+KNGKerVWJ+6vMdKZpmImr1FGDRn+X4en6p8HAw30+
         2vfuK9c2kFimVNjwCVbYs7atR39ZFYdar39k7XOiUAOICK1v02S2VTGmoHmr9A7TKTY8
         OkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189764; x=1689781764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACDERcE15xG4+xhzIKgftHezyTgiUPbMstvC//CTbQ0=;
        b=PJAep83uXIkbzjiBc0ywjdXdjWzp50+dw6uvuIGQQEwf1+GGVsxlo51CAZhEFIrt7i
         Xo2yeJM0oOHUAjvvDZt68bslsai25NBbTfyC+ji04PgolmKDYo998tOK36oPvIFomrR6
         PPUGCHlAG4B4OzJvziz1mqI9n0v/ihFSPQaCTZ4Bvbu5S4IH7Wkuj6aKNe0cbFn6WkdK
         qPhplIy77AcU44VMf9Fc/DVtIt8PMItsxu1gA4G5i3IBzeInVdbq2syeqJwl9ldsP6ng
         r97nj6RaVjfvqF4WymzqhFsEaFAqHM7mUU4iWirjwfeIyl5Hklwkjy+17oDgidybt4xi
         jUYA==
X-Gm-Message-State: AC+VfDxRWKG9I+X2CcdbakrQagU294MZozoy2jgvOg/pSl7GWed7r/Pq
        EIZcLUoPFIB5bR2+Rw9Xm7PcyA==
X-Google-Smtp-Source: ACHHUZ7E/UnlfoIhqQWY5EoVpEU2HJG7wQ6StvGgyHoQvAHqdeviDtcmIDt5DCSWoYHSs3BBlbszjg==
X-Received: by 2002:a19:7917:0:b0:4f8:477f:d47c with SMTP id u23-20020a197917000000b004f8477fd47cmr5505152lfc.6.1687189764192;
        Mon, 19 Jun 2023 08:49:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s13-20020aa7cb0d000000b005163a6c9f18sm13043672edt.53.2023.06.19.08.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 08:49:23 -0700 (PDT)
Message-ID: <30c50635-ff42-3a85-a419-673ca6d0422e@linaro.org>
Date:   Mon, 19 Jun 2023 17:49:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/2] GPIO-based hotplug i2c bus
Content-Language: en-US
To:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230619153732.46258-1-clamor95@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230619153732.46258-1-clamor95@gmail.com>
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

On 19/06/2023 17:37, Svyatoslav Ryhel wrote:
> ASUS Transformers require this driver for proper work with their dock.
> Dock is controlled by EC and its presence is detected by a GPIO.
> 
> ---
> Changes in v2:
> - adjusted documentation

This is too generic. Everything can be adjustment. Be precise what you
did here. What changed?

Best regards,
Krzysztof

