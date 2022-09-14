Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 521145B834B
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Sep 2022 10:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiINIxH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Sep 2022 04:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiINIxG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Sep 2022 04:53:06 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78EB45F7F6;
        Wed, 14 Sep 2022 01:53:04 -0700 (PDT)
Received: from [89.101.193.68] (helo=phil.sntech)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1oYO8L-0004ae-5u; Wed, 14 Sep 2022 10:52:37 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org, vkoul@kernel.org,
        vigneshr@ti.com, linux@roeck-us.net, ulf.hansson@linaro.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
        zhangqing@rock-chips.com, linux-pwm@vger.kernel.org,
        jamie@jamieiles.com, krzysztof.kozlowski+dt@linaro.org,
        linux-spi@vger.kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, kishon@ti.com, richard@nod.at,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        robh+dt@kernel.org, linux-mmc@vger.kernel.org, broonie@kernel.org,
        wim@linux-watchdog.org, linux-serial@vger.kernel.org,
        miquel.raynal@bootlin.com
Subject: Re: (subset) [PATCH v1 01/11] dt-bindings: serial: rockchip: add rockchip,rk3128-uart
Date:   Wed, 14 Sep 2022 10:52:33 +0200
Message-Id: <166314554237.197444.11513118217413767473.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
References: <20220909212543.17428-1-jbx6244@gmail.com> <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 10 Sep 2022 00:01:28 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-uart compatible string.

Applied, thanks!

[08/11] dt-bindings: arm: rockchip: pmu: add rockchip,rk3128-pmu
        commit: 9c2f4521344f3b14fa0be050100ef726edc36cbc
[10/11] dt-bindings: soc: rockchip: grf: add rockchip,rk3128-grf
        commit: adc4f190260a6c004f950992d8c9ee3aec8da38b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
