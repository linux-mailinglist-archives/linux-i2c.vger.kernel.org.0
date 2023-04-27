Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336A46F0A11
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Apr 2023 18:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243788AbjD0QlP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Apr 2023 12:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243188AbjD0QlO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Apr 2023 12:41:14 -0400
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60DA10CA;
        Thu, 27 Apr 2023 09:41:13 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-18ef8aa1576so1500257fac.0;
        Thu, 27 Apr 2023 09:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682613673; x=1685205673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoXqR9PZ1avs7kHu6enGgrMVEUhKlRL5vCXLIEppgEU=;
        b=X2+ME7girxyn4pvt6nK9ZLfO4bKdUW4QdaZYYpCvhSVcNxo+TQ0Syk/l4yd7b4nWJw
         zGqEUkW/E7XPU4xRffDEbEqK9b40nnoRNSx3NuG3MaTKI78h2eKCApVG1hKXcn7egwDQ
         XPyZbZYzJCYdrw/2Fno31M0di4Ri3okIioeLFFjFSs3yP3D94FRNRcGMpvXc7IIrKQA1
         T7FRL8JXOvtn45u4siJZ+zzqiwbu9IR8e3V475kmvJo9yZO1VrGVRkta4txTxE8dQG5J
         vPDrsiyPzskgmcl5A1NCWWaNem+EGRY8sDqFYJo1F7JxoE1c5XVzpBDDIwaQXDv3D9Dx
         4RuA==
X-Gm-Message-State: AC+VfDxFQ6llp8lWePfL+Nzubdf/0hZxcXgYkVMQ1xWbkKmVNIHHp3Fn
        6NhnwvjlEfOWhzXfRiddLw==
X-Google-Smtp-Source: ACHHUZ47DpFglUjiNAiLzj4XPOkbZQyF8LG/aBk2IROhfxLcGGCmwToIqKVopX4wpr2ibJU2hZAaig==
X-Received: by 2002:a05:6870:5b26:b0:18f:df5:af8c with SMTP id ds38-20020a0568705b2600b0018f0df5af8cmr1278402oab.51.1682613671610;
        Thu, 27 Apr 2023 09:41:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dy14-20020a056870c78e00b0017197629658sm7789831oab.56.2023.04.27.09.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 09:41:11 -0700 (PDT)
Received: (nullmailer pid 3144653 invoked by uid 1000);
        Thu, 27 Apr 2023 16:41:10 -0000
Date:   Thu, 27 Apr 2023 11:41:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Mark Brown <broonie@kernel.org>, Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v13 1/8] dt-bindings: i2c: Add I2C Address Translator
 (ATR)
Message-ID: <168261366946.3144600.7666973312286797211.robh@kernel.org>
References: <20230426115114.156696-1-tomi.valkeinen@ideasonboard.com>
 <20230426115114.156696-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426115114.156696-2-tomi.valkeinen@ideasonboard.com>
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


On Wed, 26 Apr 2023 14:51:07 +0300, Tomi Valkeinen wrote:
> Add bindings for I2C Address Translator. Only one property is added,
> 'i2c-alias-pool', which can be used in the bindings for the device that
> supports ATR.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> ---
>  .../devicetree/bindings/i2c/i2c-atr.yaml      | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-atr.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

