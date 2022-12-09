Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775F7648A11
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 22:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiLIVar (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Dec 2022 16:30:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbiLIVaq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Dec 2022 16:30:46 -0500
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EE18326C;
        Fri,  9 Dec 2022 13:30:45 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id s30-20020a056830439e00b0067052c70922so3569228otv.11;
        Fri, 09 Dec 2022 13:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewLB7CeyI5QsTj06wtKaXsFBCCUhvHw52ANJlJLG8tQ=;
        b=4EA9PTLVPpsppfA/GrtEXOvduzFXu7nzi2uOO7srN0m9aTCPiD6OR6yHuFawVO+G4T
         KTzBOD6UhCk/f68ylGJXQ81p3DH1p/2OMEWmN2MOMImxu4OEd5cKg/fVVPhNdNThx9pQ
         PXnZgA+J8JFwvHd/CPAc5GU0aagFg/5zbQ0dX1USBewgTueXuJKYuSiMKRmJcziytwKb
         8yZQxp0IiIjAmrR9KP26pTOI8kCtmt2wsGyKWqc6ojcXaUok2/CVWA+Bm/bVWSYCquo6
         v5QXTBeQ8aJDX2XVHvOyZSC74Ma9//C8tp8TVl/NSWazT6jcb59rQynty6Znw9qaXrlS
         tQCQ==
X-Gm-Message-State: ANoB5plL6PDy2ufTxzLoIMbNdC6L9OzZ24So2m5CTSeN2enG5yV96Wl+
        YB7D0GHbz1tGFUvl9+TYN97oKnz17A==
X-Google-Smtp-Source: AA0mqf6y34/bA2QivZ89Ga2TCf5TcE/BeThJZCSaocDyITgLJsdQfzI5ctavi7KU/PY6LvxGn6464g==
X-Received: by 2002:a05:6830:6005:b0:66e:2a04:f6fc with SMTP id bx5-20020a056830600500b0066e2a04f6fcmr4751797otb.29.1670621445185;
        Fri, 09 Dec 2022 13:30:45 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b24-20020a9d7558000000b0066c39c99ae5sm1048365otl.25.2022.12.09.13.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 13:30:44 -0800 (PST)
Received: (nullmailer pid 3879980 invoked by uid 1000);
        Fri, 09 Dec 2022 21:30:43 -0000
Date:   Fri, 9 Dec 2022 15:30:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Marek Vasut <marex@denx.de>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Peter Rosin <peda@axentia.se>, devicetree@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Mike Pagano <mpagano@gentoo.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 5/8] dt-bindings: media: add bindings for TI DS90UB960
Message-ID: <167062144328.3879923.8602019128941161978.robh@kernel.org>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208104006.316606-6-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Thu, 08 Dec 2022 12:40:03 +0200, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB960 FPDLink-3 Deserializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub960.yaml      | 358 ++++++++++++++++++
>  1 file changed, 358 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
