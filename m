Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9968616AA5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 18:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbiKBR10 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 13:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiKBR1Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 13:27:24 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7A42AE3C;
        Wed,  2 Nov 2022 10:27:24 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id v81so11214581oie.5;
        Wed, 02 Nov 2022 10:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifRIrN2+L2LydC7Ca35u4u1RwYmqQ9szqpTS0BaJOwE=;
        b=wtFreRAwHjMySS8BQTRlqyWWrXtPrfAamO38TbZQOkp27ebHqGJwJyqPUxfTa4/Fa2
         10YlXhhIR/WgyIDnbRzHHaZaksJDQ/g4PsIE4ImnNo5iNS4KIpvjXrPd9L+MLhbk70Bb
         P/uqDsUlAp+0yErjJGC5LQbpWELpoNakFUBLODXGhBUcGafFTtJZYfn4f/NVKohPtwhh
         0OfXIniAUr+/w47VjpRiVbvux1QSAPjVdW3tjfqMqDeEr9BPW2eX5dSDJxhG1xH8WM+r
         +hrLzjVavHouuVVMVCHYFTOeRfxzwol95TKL21YgDrdDYJqTC69MtwaLEmb8l97NKhKW
         yijQ==
X-Gm-Message-State: ACrzQf3LjJVsswsWFs8AmOcBsO4Zt8skGvdFPetjrLJga3UcitAiiE7L
        eRNrh8hzaH9VxQWH8o9L5w==
X-Google-Smtp-Source: AMsMyM7xrCBK0w336R2YqOXPF4takiYgAsBY+jVtwpcJgFYPp2ZdiQg4Ai6Rfwwd4fC6K/LGdGt8Eg==
X-Received: by 2002:a05:6808:308d:b0:355:4f60:c9c6 with SMTP id bl13-20020a056808308d00b003554f60c9c6mr22737474oib.101.1667410043534;
        Wed, 02 Nov 2022 10:27:23 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t24-20020a4ac898000000b0049b17794d19sm3436776ooq.20.2022.11.02.10.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:27:23 -0700 (PDT)
Received: (nullmailer pid 4190109 invoked by uid 1000);
        Wed, 02 Nov 2022 17:27:24 -0000
Date:   Wed, 2 Nov 2022 12:27:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 4/8] dt-bindings: media: add bindings for TI DS90UB913
Message-ID: <20221102172724.GA4189270-robh@kernel.org>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-5-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101132032.1542416-5-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 01, 2022 at 03:20:28PM +0200, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB913 FPDLink-3 Serializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ti,ds90ub913.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml

Similar comments for this one.

Rob
