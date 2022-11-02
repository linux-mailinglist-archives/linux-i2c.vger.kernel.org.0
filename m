Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28962616AAC
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 18:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbiKBR2R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 13:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiKBR2R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 13:28:17 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FAE32B61C;
        Wed,  2 Nov 2022 10:28:16 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id cn2-20020a056830658200b0066c74617e3dso1705261otb.2;
        Wed, 02 Nov 2022 10:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqCzEBWHfRJKOVrjvRDrbpehwYKjEu0v5b3GqzN9jbU=;
        b=1DqiHCessvZuNXokZcHprBNqBeedomKueF6ueAZelHMZIrYBVwziD153/gdBtp4Xgm
         Kbx74zCcuX/VN2aJ5S2LvCBw4TgbWshSWuDBksyQtTsUNqQOLui3HwB7OU6W05IWvOdF
         P6B7SSzoToOaD4+0KwUba/eBLlUDOiExhl1IeDQGIVl2jo5kG/sqVriVDAjL/VTMj0qJ
         qveLC1UQ5GBGRGKwwgpFhDcsKSFay5hYDOigcxaDD998c9IDophnaKU9/OnhfD2/OpMt
         LZFYBWPQUyaW51haqNPnBmXmiHzvi4WdDgEn0wE9LuzqJvPJUKmuT7y/uBy0bX5qZSxJ
         7KWQ==
X-Gm-Message-State: ACrzQf1W6nUGDLh/gynmFKP4f56g9KTMlhAjmcDwBb3wsGExVLnpN2W5
        DkmUSZIUc11SC41iKPE7jg==
X-Google-Smtp-Source: AMsMyM6GK0UM0orWhB2cZizHEHkBZ7CzAtASvxOwDdQDkf6h4WUzpMgdMQjvG7jVc/7eozWfC80ggA==
X-Received: by 2002:a05:6830:1151:b0:66c:64d6:4907 with SMTP id x17-20020a056830115100b0066c64d64907mr6315886otq.43.1667410095758;
        Wed, 02 Nov 2022 10:28:15 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z2-20020a9d65c2000000b00661946468c6sm5169404oth.31.2022.11.02.10.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:28:15 -0700 (PDT)
Received: (nullmailer pid 4191359 invoked by uid 1000);
        Wed, 02 Nov 2022 17:28:17 -0000
Date:   Wed, 2 Nov 2022 12:28:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Icenowy Zheng <uwu@icenowy.me>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/9] dt-bindings: i2c: mv64xxx: Add F1C100s compatible
 string
Message-ID: <166741009657.4191304.7658814383312560291.robh@kernel.org>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
 <20221101141658.3631342-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101141658.3631342-4-andre.przywara@arm.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Tue, 01 Nov 2022 14:16:52 +0000, Andre Przywara wrote:
> The I2C controller IP used in the Allwinner F1C100s series of SoCs is
> compatible with the ones used in the other Allwinner SoCs.
> 
> Add an F1C100s specific compatible string to the list of existing names.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
