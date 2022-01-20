Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EA149553C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 21:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377567AbiATUHt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 15:07:49 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:41630 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347187AbiATUHt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 15:07:49 -0500
Received: by mail-ot1-f48.google.com with SMTP id a12-20020a0568301dcc00b005919e149b4cso9006343otj.8;
        Thu, 20 Jan 2022 12:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A7A03fobW8KrhhrAYsRR6uBEmk1aUXQHP9DOBsxx+q0=;
        b=tKAsifwi+v89Idylq5U8UuoOKdSNSapynjreywcSa+mkZ59Xx3yNady/E53PY+GE30
         OkHOF6YsZtEv5edaH9NcMNCm3YRqcWeWBN2molhAK3/KmuqQXDEqfRUYgR3ymWDgy07Q
         iXZIoO1s2vdFgnUbqb8LrsIG/syqYIqrmHXux27z+GwoByJW4f8n5UN5u7cVK1xrsXKH
         BOySItZ7PEiwQ3ljIJvdxpZp8OjQGyFUpBaOJezJtjb/PnuiJSIHUkO/fQCDE41DaplD
         61e6n3iAVMEdbkkTIvWT0pxOufmqq4OtPf/Md9hBwIjyjJwK9l+JD3JxdX14Kq1FgyO+
         rU3A==
X-Gm-Message-State: AOAM5322mKd2L19jJj36G6i9WkndHoECLkOqvzCEF/JzrBqHtRI5YgYB
        Wstv6lLNCCT6o3vyE6xwrw==
X-Google-Smtp-Source: ABdhPJxbxIflcch5R4oxGHShBE6tJfUiV1UbfNjqHTtYf43uNivgQHODfl34Q6F+PyYBwVlIKKujFA==
X-Received: by 2002:a9d:5a01:: with SMTP id v1mr304431oth.337.1642709268550;
        Thu, 20 Jan 2022 12:07:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o22sm74120oor.34.2022.01.20.12.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 12:07:47 -0800 (PST)
Received: (nullmailer pid 1858977 invoked by uid 1000);
        Thu, 20 Jan 2022 20:07:46 -0000
Date:   Thu, 20 Jan 2022 14:07:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Simon Glass <sjg@chromium.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
        linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jonathan Cameron <jic23@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-iio@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: drop Enric Balletbo i
 Serra from maintainers
Message-ID: <YenBEq1Gqpw8GJNQ@robh.at.kernel.org>
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 20 Jan 2022 11:40:08 +0100, Krzysztof Kozlowski wrote:
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

Applied, thanks!
