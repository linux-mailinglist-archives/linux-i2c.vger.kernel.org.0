Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3FC35B6EF9
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 16:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbiIMOGP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 10:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232457AbiIMOGE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 10:06:04 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAA825E9B;
        Tue, 13 Sep 2022 07:06:03 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1279948d93dso32312634fac.10;
        Tue, 13 Sep 2022 07:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=QVFIfgOtjiiqBqGuqPoOB28Jgr9wt0ctc+fKksUA9E4=;
        b=nky7FtsgRz5ZsoyQU1J1r3BM9ETzVRgeRyuMmGRSyTf/M7w5NJWYUYrAQ6R90xB9ta
         RwfOPm6XsBrvZ2Yrg5sT+VL6NN6of/0ajiB1rXtPnVVMvnBV1qWrx02bGnH6PkTc4gIO
         r5XsMkomXZjoVNQTOJ+pQYVzSW8Dqy1dqX08vhi3Fq8EKXWmSXZTxj2b9C2GUeeJeWcX
         jgXDOyN1VVU5MNqATk/BvcZtPEKRxIuKHE7+yj6c2DRbko73Bu3MxZ7LBZ9iCkyP+49B
         nd3hzul2/PqgK6azoCvbN5fqNjOtNCe7mM3Ph/el0O+e9bwZ5RkI1BXqaFCfoumvJh15
         tZNA==
X-Gm-Message-State: ACgBeo1HayFheWw0g3dZUMPU/ySttQnNr8gYWtwT9KDuK1PlSXsnXwmV
        UjRLY+yWdKNyQzIC5/cCYA==
X-Google-Smtp-Source: AA6agR6Uh59tIqrYv6buS6ERBDFSApg5dMrnLMNOGP6F5OslqNg/DHtvwnxKsAIOrvT5pI93PeWyJA==
X-Received: by 2002:a05:6870:d146:b0:127:76fd:382 with SMTP id f6-20020a056870d14600b0012776fd0382mr1815303oac.257.1663077962897;
        Tue, 13 Sep 2022 07:06:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l2-20020a056808020200b00344f28a7a4csm5155623oie.22.2022.09.13.07.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:06:02 -0700 (PDT)
Received: (nullmailer pid 3592015 invoked by uid 1000);
        Tue, 13 Sep 2022 14:06:01 -0000
Date:   Tue, 13 Sep 2022 09:06:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
        miquel.raynal@bootlin.com, kever.yang@rock-chips.com,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        jamie@jamieiles.com, robh+dt@kernel.org, kishon@ti.com,
        thierry.reding@gmail.com, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org,
        linux-spi@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        broonie@kernel.org, philipp.tomsich@vrull.eu,
        devicetree@vger.kernel.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, ulf.hansson@linaro.org,
        sjg@chromium.org, heiko@sntech.de, zhangqing@rock-chips.com,
        vkoul@kernel.org
Subject: Re: [PATCH v1 10/11] dt-bindings: soc: rockchip: grf: add
 rockchip,rk3128-grf
Message-ID: <20220913140601.GA3591983-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <fddc23ff-0c87-4998-1bdf-4dbfa4c74046@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fddc23ff-0c87-4998-1bdf-4dbfa4c74046@gmail.com>
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

On Sat, 10 Sep 2022 00:01:39 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-grf compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
