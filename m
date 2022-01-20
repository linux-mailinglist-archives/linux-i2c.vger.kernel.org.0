Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D65E495543
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 21:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377586AbiATUHz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 15:07:55 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:39657 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347187AbiATUHz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 15:07:55 -0500
Received: by mail-oi1-f177.google.com with SMTP id e81so10549365oia.6;
        Thu, 20 Jan 2022 12:07:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0IU04w6lXoVf2p8qlGn0KSlHKzkwLNdQp08IC4sJHbo=;
        b=afkR/fLP9KfMj2MQk0KGnuzDwVGXM0UhWaKNPW+d8C9Wyx2gRJRzg6oMNtyjYGC9mE
         Cci3xhS0frKRgql2n8csxwNtn8prDRlKsVW+RdzJ2bLdgDrM+Wan7T+2Mq3y3sWA0Bqn
         eAmO/SLB+8A11cCVxk/L+eo+AkoMMI8/vl00gKgS15o4ihZTtBVVmDC86MrUVJApCtMz
         Qs6bD7CeWZehATB4uiniHx7oAP1r7dz+tqVHG9XncqsPp4kcnbBEM7qKV4cWYSVBk4sl
         3OWiUCpEpO/AmLcEOQ8b6LCXo34ieAbRkLR/8HcEaA6rDLrf3Xcy1ZeaIefRUAj+d3/9
         qkWQ==
X-Gm-Message-State: AOAM532l7SRTpsCvrIhpBU4TefrlyIIcXlfvDbukXoElXGYiSLOfGcan
        VElZsxbfGI47EH0oSk3i1w==
X-Google-Smtp-Source: ABdhPJx04gzaTtiJD4/qo81zwd+L6nmtQ3jKG8vFtLsOLkkLlLZCH9dgBA3lT8xK8Z4bIGFl1vz3pw==
X-Received: by 2002:aca:702:: with SMTP id 2mr507991oih.44.1642709274761;
        Thu, 20 Jan 2022 12:07:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z18sm71856oot.33.2022.01.20.12.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 12:07:54 -0800 (PST)
Received: (nullmailer pid 1859159 invoked by uid 1000);
        Thu, 20 Jan 2022 20:07:52 -0000
Date:   Thu, 20 Jan 2022 14:07:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Benson Leung <bleung@chromium.org>, linux-i2c@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        devicetree@vger.kernel.org,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Guenter Roeck <groeck@chromium.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 2/2] dt-bindings: google,cros-ec: drop Enric Balletbo i
 Serra from maintainers
Message-ID: <YenBGONi2YNjyXPb@robh.at.kernel.org>
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
 <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 20 Jan 2022 11:40:09 +0100, Krzysztof Kozlowski wrote:
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
>  5 files changed, 5 deletions(-)
> 

Applied, thanks!
