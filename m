Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47218494C28
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 11:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiATKwJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 05:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiATKv4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 05:51:56 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3104CC061748
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 02:51:56 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id n8so11147030wmk.3
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 02:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0mEqvDNu9Zk6sTqlde6UJTd4iKTAhS2ZsSWCjtjL8Js=;
        b=IbMaG71swN4sg6h7akifeOkgqmBmzGXKACVQZ7YeIkKLuvwtXX6p+6UctVNQY/APfF
         bQqm3tf1/cVG4tduVkPRsNK0yY6hBpMXqtmBMl+cteiTxRv6AEClmvr74ai7lRU76R27
         3U88OB7w/lEDblM5xJGdIi02EnnM6d2kY/MojR4TSfmNCbsVEUCVsO9fFo0hfM/B6Uvl
         eeJNrt99WTtMoPozJa45ASMZicDTzwsh8BZkL0q8+S6jBl7Lx9BUo04suJkGEb2gT9g1
         XVIDjgSG3Ad0UDwiLL+X6gg9rE3VO4BvA/h1Pgcp6OJRlgivxq/eMqUpWh7ANX6Vp4U5
         7yTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0mEqvDNu9Zk6sTqlde6UJTd4iKTAhS2ZsSWCjtjL8Js=;
        b=52F6mLZzxpnsOGc080sdzoSLrj4SiNIEVwdHRNwQIDvlLM7NNPC7g9XqttmL2VsE/b
         S1/ZfEP2v4zVmjfMEj7w44zQMIw6vSwy101UxHT2euN1MVG2YdzESFcbMjYv7UoBdedz
         pjLZjpDa4+DXbXSZQKZOJ0ZeJakg9eBalYONFR09KlPVataejB6fu27w4sPj1F/sFaFB
         1UVmvt9CnjYCn6W3rFhZss6R/V+/i9LygUh5TJeA4Vh5jgwbybdq+oSojuSMHlxitr80
         vqAGB53w7hK3MTteSk2TxM4u/roVhGAF3kGC+sTJv9f/v/atpho/ta8qIDNYIsPuvkdh
         ItIw==
X-Gm-Message-State: AOAM532Ivc0BP1SXavSeTMXGA1QxLqMcK/Xpq08/ojntgH+nMZuwyf2r
        TKlnqOAXVKjsIF0kyiYHNMTgAQ==
X-Google-Smtp-Source: ABdhPJxCmfCA/1jlhXZWdxR9sWvgeiXVFA3T8nw7/QKA41S71Chv5KYtJpjPG5UiXpySFQYrnJk1dQ==
X-Received: by 2002:a05:6000:1d84:: with SMTP id bk4mr31790024wrb.708.1642675914618;
        Thu, 20 Jan 2022 02:51:54 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ced2:397a:bee8:75f5? ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
        by smtp.gmail.com with ESMTPSA id b62sm1834642wmb.16.2022.01.20.02.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 02:51:53 -0800 (PST)
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: drop Enric Balletbo i
 Serra from maintainers
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Simon Glass <sjg@chromium.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a370a74a-2548-fc20-20b0-89e48645086f@baylibre.com>
Date:   Thu, 20 Jan 2022 11:51:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/01/2022 11:40, Krzysztof Kozlowski wrote:
> Enric Balletbo i Serra emails bounce:
> 
>   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
> 
> so drop him from the maintainers, similarly to commit 3119c28634dd
> ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").  Add generic DRM
> bridge maintainers to Analogix ANX7814.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7814.yaml  | 4 +++-
>  .../bindings/display/bridge/google,cros-ec-anx7688.yaml       | 1 -
>  Documentation/devicetree/bindings/display/bridge/ps8640.yaml  | 1 -
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> index 8e13f27b28ed..bce96b5b0db0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> @@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Analogix ANX7814 SlimPort (Full-HD Transmitter)
>  
>  maintainers:
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> +  - Andrzej Hajda <andrzej.hajda@intel.com>
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Robert Foss <robert.foss@linaro.org>
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> index 9f7cc6b757cb..a88a5d8c7ba5 100644
> --- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> @@ -8,7 +8,6 @@ title: ChromeOS EC ANX7688 HDMI to DP Converter through Type-C Port
>  
>  maintainers:
>    - Nicolas Boichat <drinkcat@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>  
>  description: |
>    ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
> diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> index cdaf7a7a8f88..186e17be51fb 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> @@ -8,7 +8,6 @@ title: MIPI DSI to eDP Video Format Converter Device Tree Bindings
>  
>  maintainers:
>    - Nicolas Boichat <drinkcat@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>  
>  description: |
>    The PS8640 is a low power MIPI-to-eDP video format converter supporting
> 

Let's wait for Enric's response, but in any case (removal or new address):
Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Neil
