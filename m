Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0004C2D7C
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Feb 2022 14:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234840AbiBXNoq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Feb 2022 08:44:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234942AbiBXNoq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Feb 2022 08:44:46 -0500
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D742927790C;
        Thu, 24 Feb 2022 05:44:15 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id y7so2515426oih.5;
        Thu, 24 Feb 2022 05:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DJaCkmpyl7WN5zxMWv0jhGKd+KkN9y5UoA8z60hGkaE=;
        b=hB+izTTyQSFAwXHy6wz9120LzWQDp4i2qWBjz64T6MHsMlifOLmjatrtALkXURS9QK
         Ihq8zny/7kXF+RuDbylxCObV5lo+AQgC7Xn76VjW100RpDurh9omAAUKeq9UbTybsp1i
         Afb+g2T9X1djF9bPQqzrluVqLVjcIdOxG9FQgFVTIWidB9/7e1A54OrBZraxNzL/jcq0
         xU5Y8PjpIJuNik3Pfrc1a12LuBojPVkyfAZpi51XXzo9Wh9c071zyEvEhb4OkQuhYy30
         tTLQoRr9Bek1MvsKIECkZmctAh3qZoHb9GpqZItiVxO87v2pbfUTu6cxF1f/0zRB8Afh
         XXGA==
X-Gm-Message-State: AOAM530m5FvrCwVu4+piqWhi49P4dgk8VhlB6+SX0kEsBpNaHv+5iEAF
        lDtO5s/7bd0V8ogK5vxDSg==
X-Google-Smtp-Source: ABdhPJys835v4LU0JrZHk0HesTzIy9UfEcGCwgt5A7l5zQlujtwo6NQJbVGXMKOPke2txS9Icv9htQ==
X-Received: by 2002:aca:d88a:0:b0:2d3:96f8:6cf0 with SMTP id p132-20020acad88a000000b002d396f86cf0mr7044750oig.338.1645710255130;
        Thu, 24 Feb 2022 05:44:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l14sm1094680ooq.12.2022.02.24.05.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 05:44:14 -0800 (PST)
Received: (nullmailer pid 2901790 invoked by uid 1000);
        Thu, 24 Feb 2022 13:44:13 -0000
Date:   Thu, 24 Feb 2022 07:44:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of
 compatible items
Message-ID: <YheLrYJuNu0SxYY4@robh.at.kernel.org>
References: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 24, 2022 at 01:31:21PM +0100, Geert Uytterhoeven wrote:
> make dt_binding_check:
> 
>     Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> Fixes: f1bd6661946b20d1 ("dt-bindings: i2c: add bindings for microchip mpfs i2c")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
