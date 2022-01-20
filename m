Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 132E04950E4
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 16:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376285AbiATPE3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 10:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346210AbiATPE2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 10:04:28 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7296CC061401
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 07:04:28 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id v123so12729118wme.2
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 07:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+Aq1htCCe4J+KaYbiBgsGd/SMns1HeFPyllEeH0HLrE=;
        b=xDCfSkp4gVRyMCsNHMACNwvOjOLWGCCFvpl6FBksdSeKoOo8g6aWif0LxVqFjOA8K6
         SwgwL+uPlvH6X5/3gjhPYOvsH4UENcXKqKMQwxp9hLNBjiXf0PgD2pYGZNtl0Gm1VHL3
         WWOxhUf62gw61bEpmXA/voFCTI40ph5VuEWl+kUuds7jetvsgWyBD+vzhqGGncSGVSRI
         9QZqQzq+AOO1prrNXCDR9JIoLxWQBDBZRS2iSbsPNDuF6app0wb5qr0ONR+r9OQ1KkcN
         wViG/TyNyKD76jQEnzEXS6zldfkxblvIY691z0e8gIOaMgOGOnNPslRA/xTk6un6u4Ix
         yZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+Aq1htCCe4J+KaYbiBgsGd/SMns1HeFPyllEeH0HLrE=;
        b=2A1WfVT1tBdUtWPj3gbreuFaLFWEPvp7yFrjfzViCym0ZgmEs8fJUvlfLFs3Bpkf28
         uf94kfQUYnxv+gczWvv90rL8PAWryJfmmb5HLJYWXqLkqiwR/3ir4HSwvDoKckrjp+VD
         8llbNDnZ2oLVfPibX91KUryPdc2zb5rJDlhe3UiaeFnWnm4aeXt72BoT2H0IRgdBNRp5
         iPAzzYduOfhl1bIh9GMJZGvRWM9jrc/vTIRmqLRAql8YJbzLJ5YTEN86r4z2G7fVGrFd
         ia3scBs+NcyxwpNg3enki8HR8yPZj5ijdOqzGquRhZAais+ctB5JmEOL8n+Inl7ykvwx
         pi5Q==
X-Gm-Message-State: AOAM5335r2s35PlQ8iVEGwlyxG/R9H1LELV8zHW5/I62M0euO90DfMmc
        T+2Hut/H+Eyu9nsTCkLVnFBoog==
X-Google-Smtp-Source: ABdhPJxyBL43fH2rXCx547on3ZZXkYJE/PFoHnZpDzKy6MwUXjE0eMc+fSxR2ii4QVcAX1EUgjzuxg==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr8271022wmc.35.1642691066931;
        Thu, 20 Jan 2022 07:04:26 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net. [86.15.223.86])
        by smtp.gmail.com with ESMTPSA id bg23sm3487872wmb.5.2022.01.20.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 07:04:26 -0800 (PST)
Date:   Thu, 20 Jan 2022 15:04:24 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Simon Glass <sjg@chromium.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: google,cros-ec: drop Enric Balletbo i
 Serra from maintainers
Message-ID: <Yel5+DiQoOtV7x6Q@google.com>
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
 <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 20 Jan 2022, Krzysztof Kozlowski wrote:

> Enric Balletbo i Serra emails bounce:
> 
>   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
> 
> so drop him from the maintainers, similarly to commit 3119c28634dd
> ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml          | 1 -
>  .../devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml       | 1 -
>  .../bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml    | 1 -
>  Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml | 1 -

>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml        | 1 -

Acked-by: Lee Jones <lee.jones@linaro.org>

>  5 files changed, 5 deletions(-)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
