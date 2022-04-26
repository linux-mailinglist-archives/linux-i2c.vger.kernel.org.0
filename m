Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380D2510051
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Apr 2022 16:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351106AbiDZO0I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Apr 2022 10:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347196AbiDZO0E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Apr 2022 10:26:04 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B1E18E18;
        Tue, 26 Apr 2022 07:22:57 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id z8so20829165oix.3;
        Tue, 26 Apr 2022 07:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xvzda8Pfpd3wwPcLRsSY8ulA8iZIYiMmmNvBbB50ZBo=;
        b=eMtzTu+9uo5RpoE29cwdTplDs7/1J23yJE9Pfj9OMPuzbbx+2yLtEYyr2oi2JWlcwK
         JnF1dVf0VvgaeP9vlxr/bRvjQWsOJEJmffgAcFlsRagXKFtaC4gYAQfWOXV5zFRcql4a
         mS5DBqzkUxcV/eE1nRqIqtTQy2JLhO5fwkFrok57mckE6EnqUxV+mm2Q3u+vGsivyN5C
         IMkF9R+jw25h4Zdy8RRp/A5jz6dRgGOEXuspMC49uHQ3AVlX33wJ7TMdAchfHSrjYqA6
         xjArKKbB7uO1DlCn5Xlk+isirOxoN6j5U5GytQJrZGB52YbIT7nHAQsMqZPSTvBnlA7H
         eSwA==
X-Gm-Message-State: AOAM531qEZiePkPLLikWNob41Mv/KZ2XXKph6xyNORB+/3wiC+IS+8Kr
        xLTU3NJ9OqZRoLfs2g0jJmPoCn70dg==
X-Google-Smtp-Source: ABdhPJxhcjFhGIM6Fai/2gb+tvQSLuzGNZLP5mUuf7pSQ1nmqeeR538p3fZzoZhebGXVBtICKYmQTw==
X-Received: by 2002:a54:4f04:0:b0:325:3659:ee90 with SMTP id e4-20020a544f04000000b003253659ee90mr4880405oiy.199.1650982976502;
        Tue, 26 Apr 2022 07:22:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s6-20020a4ae546000000b0032480834193sm5599150oot.46.2022.04.26.07.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 07:22:56 -0700 (PDT)
Received: (nullmailer pid 1917494 invoked by uid 1000);
        Tue, 26 Apr 2022 14:22:55 -0000
Date:   Tue, 26 Apr 2022 09:22:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: eeprom/at24: Add samsung,s524ad0xd1
 compatible
Message-ID: <YmgAP5yrHWJESq8N@robh.at.kernel.org>
References: <20220422192355.2597523-1-robh@kernel.org>
 <469d7ac0-7cf6-af91-7e24-1d9df88c9221@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <469d7ac0-7cf6-af91-7e24-1d9df88c9221@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 23, 2022 at 08:44:21PM +0200, Krzysztof Kozlowski wrote:
> On 22/04/2022 21:23, Rob Herring wrote:
> > The samsung,s524ad0xd1 compatible is in use, but not documented. According
> > to arch/arm/mach-s3c/mach-smdk6410.c, the samsung,s524ad0xd1 is compatible
> > with the 24c128.
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/eeprom/at24.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> 
> The compatible - without 24c128 fallback - is used also in
> arch/arm/boot/dts/exynos5250-smdk5250.dts and
> Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml, so these
> files should be fixed as well.

The dts file I was aware of and I leave that to the Exynos 
maintainers/users. :)

For some reason samsung,s3c2410-i2c.yaml is not getting a warning. I'll 
have to investigate.

Rob
