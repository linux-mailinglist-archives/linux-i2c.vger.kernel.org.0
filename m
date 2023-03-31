Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7606D1CC7
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 11:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbjCaJnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 05:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbjCaJnG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 05:43:06 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8431DF9D
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 02:42:42 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id c9so17702873lfb.1
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680255754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBTbhwphhMC02OilZnY4C/PgpQhvHUGGOYxnm7T5djU=;
        b=GWuu+iaFdWWvtdQuvgFT6bO4MlDsJQq63V2NN3ytPGsC6ywqC9Od91QwF4xeKWxsiL
         Lt9K1+3Llw/24ECL28yOSqZagkKlRgOBmYDFSuVpaFjySyFDwNpbhhVvF1NooME7ZNSP
         VZ8OOWhrJsyhB89yT58YWBdsXp+PFdO8TEDySz15yC+WUA9+kdKZcETl+rPNuoFVlz0l
         n5k+4fML4f+Fku7K7nMeitlBnoYCQHXe0pj9XexZRk0su0EpkpVEHqGlA2mvRkpRvEfZ
         R15xxzO4RNHL7WJSkZ/wIDbWJl+84Hy5y6aYcbuUMZpdyzgBNh1KFbPAwWyzJdXozT61
         mosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680255754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBTbhwphhMC02OilZnY4C/PgpQhvHUGGOYxnm7T5djU=;
        b=5fUJcFo4cO5e6+fOztrGd8cIIfD84vShzIHH18q0XgaNM6AcNmK23zrskcgKMjwf4C
         1MU55yYDsW2pZAt3h9DXMTfEr664Wm8a72gK0lktDlHSQQZ+zn8N7y41iczVYKoPocrs
         8GroYwWH7qQmrp/s/4R2ne1PKYypTPIV2LtnK4PRaIl/fsVUterYt5//9LTWgeMXIzhP
         IDz9bSsA9rF8+8VNvXHWbvsf3t0Dwh67k79Hh0kigwpob0UXnTXZSeU+7TrvkCMDcem4
         74MWgrjoNb7eczotBRMRMriN2wJsgeDP8b7ROBFp9Xkbj0bZBoHieqinbny/ZzIM8Kh9
         OT/g==
X-Gm-Message-State: AAQBX9eYhoPXJTkCCxdlesCiMC0tdr57wQvqWf3Rb7BZdn+lglPUu43C
        UxN0zG3atH1yeBLCNBanpdYr7Q==
X-Google-Smtp-Source: AKy350aTu6Xih25erOjmqFeU5rATfu36S7cFx720oV8vNte5e/KOzNu3mx4mrsOc0OlfmOc4hXBM5A==
X-Received: by 2002:ac2:418a:0:b0:4e8:5cb9:3728 with SMTP id z10-20020ac2418a000000b004e85cb93728mr7202380lfh.45.1680255754562;
        Fri, 31 Mar 2023 02:42:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q1-20020ac246e1000000b004cafa01ebbfsm312599lfo.101.2023.03.31.02.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 02:42:34 -0700 (PDT)
Message-ID: <6b997dfa-1377-8d2e-ce4f-3f8f7407e6b4@linaro.org>
Date:   Fri, 31 Mar 2023 11:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c: cadence: Document reset property
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230330180448.269635-1-lars@metafoo.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330180448.269635-1-lars@metafoo.de>
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

On 30/03/2023 20:04, Lars-Peter Clausen wrote:
> The Cadence I2C controller has an external reset that needs to be
> de-asserted before the I2C controller can be accessed.
> 
> Document the `resets` devicetree property that can be used to describe how
> the reset signal is connected.

You could add it also to the example to have complete picture (and
validate your change).


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

