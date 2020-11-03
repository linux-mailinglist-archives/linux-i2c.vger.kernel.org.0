Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF62F2A40D6
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 10:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgKCJz2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 04:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbgKCJz1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Nov 2020 04:55:27 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04CCC061A47
        for <linux-i2c@vger.kernel.org>; Tue,  3 Nov 2020 01:55:26 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id t13so18275566ljk.12
        for <linux-i2c@vger.kernel.org>; Tue, 03 Nov 2020 01:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fq4LHl5XG3kdk6dhCjgR8hNmKo1bg3Z0xwsvFLhHhcQ=;
        b=yt8AMikKSv7izXfLEON0zW5bDlX90AU3hCz+osA7iv5STprotNoYQImrr34uaO4jA5
         Yz5RCuzWH5sEIjY2rWxkaAVYRXQzEugJBhzoIYotW8evGile5TJ8vREnCCpPygnFH8yX
         D9AQdr+XTjo/8jwmvjLRO3byl21ONDHBelaSewmVKvOaQ+UnyYEyrgT4Ob0r0MfZDll7
         NrirokyNLiXt4b5ANn7sQaX8v6BkYjDFgsL/G41FFYqgB8THD5Ty02c0NjkiLaGDLD6d
         RF3jWvRKc3bDO5e1gEp4Rl4BkA6UZuvlf+NZILc4TPcuTq9h2am7qlS7HXPED43e/x3R
         uCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fq4LHl5XG3kdk6dhCjgR8hNmKo1bg3Z0xwsvFLhHhcQ=;
        b=nBsRb3K4oubUXy1RQxAq5hYj1ONyhrlKpJ7FBpzC1kbw1M8b3RH1hTjEKqQJIUhljF
         hykbD6xQ8LUkkx3y4ggnJh2dRWvcBKTCK40s+GBkuVrvMbnrEU9At0lKCwhGshl4Zj+B
         7l3rGGWERpp4PKgxne/RcjvS1pld7LN0XvOITulNkoSCuRUjzC5MSu6De5StBJJUZB1j
         7x8ZV2CSpGxQi9Q9PibXZTkHmB4qnmASBQWmsam1eeIIw+xDgNMDT2HXdPAhD4lBUj16
         jXpybcL3/TK56t3MHT1e85d9VhLtNv+tjZYsvUY0eSKHZ9e8TyToucoRgoAh/X0BO5UT
         a2QQ==
X-Gm-Message-State: AOAM5302B0WWJsvZ+XcBvJihS7OvBENLF5x65N4d9zdigOjCSf5za76x
        qgPm6eh0v0XhVwI2u2MB0+Q0Rrv+oDPZDn1fcWKDzQ==
X-Google-Smtp-Source: ABdhPJyD7BuxsFo88BjUVf4mMu3Zx2TAGm/nXsbevnm+YG/eagy5MPRrS/P+PI+uclv/SBErdlJoTld2ixsXUu88Lck=
X-Received: by 2002:a2e:86d4:: with SMTP id n20mr8764121ljj.293.1604397325248;
 Tue, 03 Nov 2020 01:55:25 -0800 (PST)
MIME-Version: 1.0
References: <20201031181801.742585-1-jic23@kernel.org> <20201031181801.742585-4-jic23@kernel.org>
In-Reply-To: <20201031181801.742585-4-jic23@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Nov 2020 10:55:14 +0100
Message-ID: <CACRpkdZaoeKR6bzQd2jWFiXdpqJRH-Rb-_miWb8Gz5Hqj=B3HA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings:iio:gyro:invensense,mpu3050: txt to yaml
 format conversion.
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-iio <linux-iio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 31, 2020 at 7:20 PM Jonathan Cameron <jic23@kernel.org> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> Very similar to the mpu6050 binding.
> Only unusual element is the i2c-gate section.
> Example tweaked a little to include a real device behind the gate.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Sweet! Thanks for the help.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
