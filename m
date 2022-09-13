Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B02C5B789B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 19:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233586AbiIMRqg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 13:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233315AbiIMRqJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 13:46:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A99463E4;
        Tue, 13 Sep 2022 09:42:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 998F1614B2;
        Tue, 13 Sep 2022 16:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC96C433C1;
        Tue, 13 Sep 2022 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663087347;
        bh=3Q42QFQ/ngGZQQeyp7QhP6eTWM1+zQJpWZ4yQpNfCck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CxcOkubrZXQn2EQ474gG4UJo8mQX4nMBEhGTo20JqjXQk8APbj4ESssFffXLIIrHe
         EkQekGPKV6oi28uzSCB2vMMBMNbL4MG/Y5Jqo/Ck6PRg6Gf6/9R/4ETjb53/y1bDmI
         ER8i6KF9wD8A2E87VuxXZrTmY3TJJvX2uADpxHUwm4/hxI6WH3ha1O7+/zCtIQmadL
         tSaG76vGXeo3tTYJOqbp4CDh6cL8oz16K6lPvZscMq0aHIQ5cAbdBIkL0kaQ1BFzBj
         ZnFYabEV5yARdpuFbCj0JK78O4TM5SxigD6MRnGzfigOv/gp8fXAhW6xuuCQGo/mmn
         t/XgkL+PxS2DQ==
Date:   Tue, 13 Sep 2022 22:12:23 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        ulf.hansson@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, kishon@ti.com, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, gregkh@linuxfoundation.org,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        zhangqing@rock-chips.com, jamie@jamieiles.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v1 09/11] dt-bindings: phy: phy-rockchip-inno-usb2: add
 rockchip,rk3128-usb2phy
Message-ID: <YyCy7838UGnV2qcR@matsya>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <d477a077-a68f-e752-5192-807db80a9e68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d477a077-a68f-e752-5192-807db80a9e68@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10-09-22, 00:01, Johan Jonker wrote:
> Add rockchip,rk3128-usb2phy compatible string.

Applied, thanks

-- 
~Vinod
