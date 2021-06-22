Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C943B0156
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jun 2021 12:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhFVK3d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Jun 2021 06:29:33 -0400
Received: from gloria.sntech.de ([185.11.138.130]:42046 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229807AbhFVK31 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Jun 2021 06:29:27 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lvdcE-00030O-By; Tue, 22 Jun 2021 12:26:46 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     jay.xu@rock-chips.com, "cl@rock-chips.com" <cl@rock-chips.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, jamie@jamieiles.com,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        jagan@amarulasolutions.com, huangtao@rock-chips.com, wens@csie.org,
        jbx6244@gmail.com, wim@linux-watchdog.org, uwe@kleine-koenig.org,
        david.wu@rock-chips.com, jensenhuang@friendlyarm.com,
        linux-kernel@vger.kernel.org, maz@kernel.org,
        zhangqing@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux@roeck-us.net, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, ulf.hansson@linaro.org,
        robh+dt@kernel.org, cnsztl@gmail.com,
        linux-arm-kernel@lists.infradead.org, shawn.lin@rock-chips.com,
        linux-watchdog@vger.kernel.org, gregkh@linuxfoundation.org,
        michael@amarulasolutions.com, mail@david-bauer.net
Subject: Re: (subset) [PATCH v5 0/4] arm64: dts: rockchip: add basic dtsi/dts files for RK3568 SoC
Date:   Tue, 22 Jun 2021 12:26:30 +0200
Message-Id: <162435742917.99007.5058927510330896859.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210622020517.13100-1-cl@rock-chips.com>
References: <20210622020517.13100-1-cl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 22 Jun 2021 10:05:13 +0800, cl@rock-chips.com wrote:
> v1:
> 1. add some dt-bindings for RK3568 devices.
> 2. add core dtsi for RK3568 SoC.
> 3. add basic dts for RK3568 EVB
> 
> v2:
> 1. sort device nodes by some rules.
> 
> [...]

Applied, thanks!

I've dropped the pwm and watchdog nodes as their binding changes
haven't been applied yet - see followup patches I'll post in a minute.

I've also droppen the debounce clocks from the gpio nodes, as Jianqun
is still working on that.

That way the yaml dtbscheck is pretty happy with the result :-)

Let's see if this can still make it into 5.14.

[2/4] arm64: dts: rockchip: add generic pinconfig settings used by most Rockchip socs
      commit: ef0bff8ba8dfa53780fca0fd5c369f9c78fc30cf
[3/4] arm64: dts: rockchip: add core dtsi for RK3568 SoC
      commit: a3adc0b9071d880dcceb78b5e921843502f272bd
[4/4] arm64: dts: rockchip: add basic dts for RK3568 EVB
      commit: 01610a24cefa182b155a17e38cd0b84f8a3f0529

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
