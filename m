Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90BCA59882D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 18:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343598AbiHRP7m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 11:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344398AbiHRP7l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 11:59:41 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA856582A;
        Thu, 18 Aug 2022 08:59:40 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id m5so1437085qkk.1;
        Thu, 18 Aug 2022 08:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ft7syFxOrP4aJLTQXIUXbtfRGNP6T0lVtoxSFHX+FuE=;
        b=SjA4VrmdhbZiBJ+6BKxPl5jpzQrZ+lGYWk6YyFPYsjGLQ9aaCoNSUM0FCY9Ur87IET
         MsD7+KJeyB7bQ6MAR75wg7dOtq0puH05CzyhomCW67TFCvSH2emSMhYAzmBLjeJiy4ZD
         F3t+jTzTcEd/f+MZYpLwQzJCxf2UdOS2ccLtifzVHVmfgZV8/Kwwnsj816SrmNR+kIva
         XKNMvMtW4BL0feQ73R3bJl0W+QSvG8qBX96qBgdeTl1kugxuAHBqxPevmNJX9wnRuiqX
         MF0F1KwOf4E162dkNI2lGHkvDWT9NSRJ/JWzYJnmoL4ZoQ1E1zP5amq9q/1A6waeZwnx
         snxQ==
X-Gm-Message-State: ACgBeo2hqsrnr232a6yvH0aIE1PjQLtubOSqD56yd/jPfAYGenyw/AqM
        dsftklRucqMJzk8us81Atg==
X-Google-Smtp-Source: AA6agR5NvYrKQ62k6Kl+Kw3FF5Qy1VODaNH3U1iEyCrKosc4Df416Wur5ma52Q0L6bVTET9h/GP+YA==
X-Received: by 2002:a05:620a:12fb:b0:6bb:4ba4:aa85 with SMTP id f27-20020a05620a12fb00b006bb4ba4aa85mr2626845qkl.704.1660838379962;
        Thu, 18 Aug 2022 08:59:39 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:126a:8e5d:1fb3:c355:1e65:cdac])
        by smtp.gmail.com with ESMTPSA id m13-20020aed27cd000000b003422c7ccbc5sm1277320qtg.59.2022.08.18.08.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 08:59:39 -0700 (PDT)
Received: (nullmailer pid 1911722 invoked by uid 1000);
        Thu, 18 Aug 2022 15:36:13 -0000
Date:   Thu, 18 Aug 2022 09:36:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Li Yang <leoyang.li@nxp.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-binding: i2c-imx: add SoC specific compatible strings
 for layerscape
Message-ID: <20220818153613.GP1829017-robh@kernel.org>
References: <20220817205623.22104-1-leoyang.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817205623.22104-1-leoyang.li@nxp.com>
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

On Wed, Aug 17, 2022 at 03:56:22PM -0500, Li Yang wrote:
> Add chip specific compatible strings for layerscape platforms to make it
> possible to do SoC specific fix-ups in the driver.
> 
> Signed-off-by: Li Yang <leoyang.li@nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

