Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51D4267893B
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jan 2023 22:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbjAWVIO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Jan 2023 16:08:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbjAWVIM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Jan 2023 16:08:12 -0500
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2687C38642;
        Mon, 23 Jan 2023 13:08:04 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id o66so11546628oia.6;
        Mon, 23 Jan 2023 13:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YolR7d3FXuk9xwUZu9ZisHcNVUGeYWG+IpYiZRqQvAw=;
        b=Snxz3+OGaMXBZs04pNNsCJRhT8NINvaLuuc6ntnVgio6Az8LYgxoK/UtRfsaT2+ptC
         HDDLs9a9zXE21ZbWd4AZT8HRYL7Y1n7cZ44DxjFUzjNIfeNChM55xSEVSdHINBWc4e1y
         CMJd4Gkj9h+GdsU/EroJ1JM23LFJ1OPPYHYKhK7a+QYSe3ENpvRVC5izyRAKH5id0vlR
         AHhpYqxEJqEhKsgqU9jNFeUdrYJm1XcVOpJM/T4KZ37Zgo1r3FFwcDkJ5OumE07Sk7oG
         sVtZPfCXA4TENdjgZCkne+7Vl11W2vvEgYG2Ljz9hmc/xKhzvIXpec52ZTHJ7UcrnE3n
         /aXw==
X-Gm-Message-State: AFqh2krCQTL9ZnuPXF6edXNHpYHeYV9HfPytlLyYiTip+Vx6BiZ4TvjD
        IYHp8PG3/Hzd+5CCrtKx1vfaF7VWgA==
X-Google-Smtp-Source: AMrXdXuUR1pXTzVST/CMo8A6Ouw7jJMZek+4Yj/7RkNirvkZDdv6JiF3FmO4PVztwBcRF6L7TBp5Zw==
X-Received: by 2002:aca:2b06:0:b0:35e:acd7:99cb with SMTP id i6-20020aca2b06000000b0035eacd799cbmr7837220oik.11.1674508083377;
        Mon, 23 Jan 2023 13:08:03 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a9d4c0b000000b00684e55f4541sm108333otf.70.2023.01.23.13.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 13:08:02 -0800 (PST)
Received: (nullmailer pid 2545442 invoked by uid 1000);
        Mon, 23 Jan 2023 21:08:02 -0000
Date:   Mon, 23 Jan 2023 15:08:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: i2c-gpio: Add properties for dealing
 with write-only SDA/SCL w/o pullup
Message-ID: <167450808169.2545202.12361144276512908643.robh@kernel.org>
References: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
 <8eb4fb92-ea53-fb4e-4cdd-daed4ad96806@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eb4fb92-ea53-fb4e-4cdd-daed4ad96806@gmail.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Wed, 18 Jan 2023 22:51:58 +0100, Heiner Kallweit wrote:
> There are slave devices that understand I2C but have read-only SDA and
> SCL. Examples are FD650 7-segment LED controller and its derivatives.
> Typical board designs don't even have a pull-up for both pins.
> Therefore add properties for not using open-drain. For write-only SCL
> we have a property already, add one for write-only SDA.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v4:
> - add no-pullup properties
> v5:
> - add checking mutually-exclusive properties to schema
> ---
>  .../devicetree/bindings/i2c/i2c-gpio.yaml     | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
