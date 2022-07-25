Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC7B6580825
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jul 2022 01:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236893AbiGYX0U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Jul 2022 19:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiGYX0T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Jul 2022 19:26:19 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BAD25EBA;
        Mon, 25 Jul 2022 16:26:19 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id r13so14965435oie.1;
        Mon, 25 Jul 2022 16:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zMYKmg3DAgHswSnZfMr2gBGIoygNaDxX5GR31HzIjN8=;
        b=vBLgSNXsyqUpq2IMKPz9S4e7VVnIyOFXj55Dbv0CRiR+ppeLMHVQSj9MvlBIsPIMge
         DsMANFQqgrS7xRvn33HFmIH0zIjo67w2ay3hWp+n505PxO2vo0d/nZMyzLikSM9AbbhN
         dngfqQ0FBYa2wGc+7QB3cvkTL2kvfcY7DXQHjb8h8sjrXpXOR2NcfpgwH42I9iDI8hxV
         /vWxsNwm700Pps8zHXKx8zUjcrW6jMtJ8rcIaKXFo7zuiJgo674X6pEajiRuR9Yodn3R
         ja9patK4B9/4PDN0TdaK3mp4nRw9eVR6nGK6MQj79Ta3YBCTFPHG9eTYeys0vhW5fTjw
         PIpw==
X-Gm-Message-State: AJIora/2wwOSp8kxSlLA/qIjtYhPlLyWAQYO/QW0f3KkkmW6AHpPZepY
        VTDptuv+ywQFOhmHRsUV7A==
X-Google-Smtp-Source: AGRyM1tlZY1uWwUwZ760qz8S55x8WYR+KBfAL60hoioz/HxI3kq4KzVtzg4bKTPvkbNFz2wI8WkEjg==
X-Received: by 2002:a05:6808:d47:b0:33a:ef87:9271 with SMTP id w7-20020a0568080d4700b0033aef879271mr1812047oik.6.1658791578678;
        Mon, 25 Jul 2022 16:26:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l7-20020a9d4c07000000b0061c4c925c87sm5554686otf.78.2022.07.25.16.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 16:26:18 -0700 (PDT)
Received: (nullmailer pid 2952618 invoked by uid 1000);
        Mon, 25 Jul 2022 23:26:16 -0000
Date:   Mon, 25 Jul 2022 17:26:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jagan Teki <jagan@edgeble.ai>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-rockchip@lists.infradead.org,
        Kever Yang <kever.yang@rock-chips.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 13/22] dt-bindings: i2c: i2c-rk3x: Document Rockchip
 RV1126
Message-ID: <20220725232616.GA2952569-robh@kernel.org>
References: <20220723204335.750095-1-jagan@edgeble.ai>
 <20220723204335.750095-14-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220723204335.750095-14-jagan@edgeble.ai>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 24 Jul 2022 02:13:26 +0530, Jagan Teki wrote:
> Document compatible string for Rockchip RV1126 SoC.
> 
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
