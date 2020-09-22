Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7EC274503
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 17:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgIVPJq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 11:09:46 -0400
Received: from gloria.sntech.de ([185.11.138.130]:40682 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726579AbgIVPJq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Sep 2020 11:09:46 -0400
X-Greylist: delayed 2655 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 11:09:45 EDT
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kKjEO-0000ba-S1; Tue, 22 Sep 2020 16:25:20 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Michal Simek <michal.simek@xilinx.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 7/9] i2c: rk3x: Simplify with dev_err_probe()
Date:   Tue, 22 Sep 2020 16:25:20 +0200
Message-ID: <5132531.RpnORa5Cff@diego>
In-Reply-To: <20200902150643.14839-7-krzk@kernel.org>
References: <20200902150643.14839-1-krzk@kernel.org> <20200902150643.14839-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mittwoch, 2. September 2020, 17:06:41 CEST schrieb Krzysztof Kozlowski:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


