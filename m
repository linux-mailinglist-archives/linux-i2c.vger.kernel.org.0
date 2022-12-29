Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7E6658811
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Dec 2022 01:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiL2A0C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Dec 2022 19:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbiL2AZ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Dec 2022 19:25:57 -0500
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC72DF22
        for <linux-i2c@vger.kernel.org>; Wed, 28 Dec 2022 16:25:54 -0800 (PST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-14ffd3c5b15so8681196fac.3
        for <linux-i2c@vger.kernel.org>; Wed, 28 Dec 2022 16:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4z7su8JLCr+WEMAOcRD/TJjPQxer9cvyEinC2cEcpEA=;
        b=WOsVnKySm1dPaQ+OUHHGP2Mo2pnSqhAaw7FyhrSxU4xot5vHp3XaGLZlqUvyunOqcC
         hhRqYgPizPh6sjTTjUxV0UPmciL/HmmeWxWuSq0JzoNa9tBekwu5gLKdcrHW73vsEgCF
         VyX7LNABFjrGTetP7xJh3m576mcNMEdwKHv9GDywe5qPj45AccBwLvRv2iCVXFyOr3eB
         QlNivg4Mau5RH8/77hedji3z/0e1h6t33pLSOD4yf/ZYM9jqL2zyZtFyJRXwpo4yQQBh
         V00diaPyhaT1CCCKVUrmAfDPhh2uGLD56uEfZwdEf3hxj8uK6vcMuJiIdbsXIrp43x6A
         2wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4z7su8JLCr+WEMAOcRD/TJjPQxer9cvyEinC2cEcpEA=;
        b=NPQBcztifqUvxGKBte4rQAC7VdCmdOHR94fG4gu/mmSlsvAFnxdveScgKupAoh2Tjz
         PHAOHNBJr938Z885M6Q5rJEtJtaL6Fnvk1ybXgalJyCJXw3k97YWIIZI4Npgaqp9y8+f
         UMSEmWtaFnUUm6cMSnWeA7IOZrRBTcq90KzzBkD7oVQKmJmNjCyEGdC0icAsYEbI9/L6
         3YaHW9IfbTjRML9RFfwjGkqdicFcTlR34g2e2Z1hs0K+7Yk50Fk6r0gRpE66CE0epGbt
         Ifo1pKEVnCsGUH847TyPz5CruVcUJPdjFbyU5cs0ggyD/wsTj87+1Y6StpDl8jt29UXo
         3hoA==
X-Gm-Message-State: AFqh2kpyBrhmI4fFFWeMnBkWHIRLk8owIvzXWM9QpdKaoJiI+ao3AutG
        c0jiFoHT7XIDNcOG2iIT0Jj+Yz4ZGkCbuN1XwQEyV83LZTNTHXLD
X-Google-Smtp-Source: AMrXdXvtA4A2I7vBmgLv0lniVshAKvFxUktjFX60O3tUq/e4JRl19sQ0+mjGG9Ps32UaXfk6Wb+QY6Np7hBc3LMs2+4=
X-Received: by 2002:a05:6870:6c0b:b0:13b:96fc:18c1 with SMTP id
 na11-20020a0568706c0b00b0013b96fc18c1mr1767887oab.291.1672273553335; Wed, 28
 Dec 2022 16:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20221228164813.67964-1-hhhawa@amazon.com> <20221228164813.67964-2-hhhawa@amazon.com>
In-Reply-To: <20221228164813.67964-2-hhhawa@amazon.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Dec 2022 01:25:41 +0100
Message-ID: <CACRpkdZSXUE=Jw2SUEL03RL5MRCJJRvSAqowoONEWevfsXVtTQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pinctrl: Add an API to get the pinctrl pins if initialized
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     andriy.shevchenko@linux.intel.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 28, 2022 at 5:48 PM Hanna Hawa <hhhawa@amazon.com> wrote:

> Add an API to get the pinctrl pins if it was initialized before driver
> probed. This API will be used in I2C core to get the device pinctrl
> information for recovery state change.
>
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Okay then:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
