Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3243A7848
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Jun 2021 09:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhFOHvO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 15 Jun 2021 03:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhFOHvN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Jun 2021 03:51:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AA8C061574
        for <linux-i2c@vger.kernel.org>; Tue, 15 Jun 2021 00:49:09 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lt3oW-0003jU-7f; Tue, 15 Jun 2021 09:48:48 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lt3oR-0002jp-To; Tue, 15 Jun 2021 09:48:43 +0200
Message-ID: <2935959198e4c40c49623f2e5f161392e76d6add.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] i2c: riic: Add RZ/G2L support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Bence =?ISO-8859-1?Q?Cs=F3k=E1s?= <bence98@sch.bme.hu>,
        Mike Rapoport <rppt@kernel.org>,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Tue, 15 Jun 2021 09:48:43 +0200
In-Reply-To: <20210614193253.10011-3-biju.das.jz@bp.renesas.com>
References: <20210614193253.10011-1-biju.das.jz@bp.renesas.com>
         <20210614193253.10011-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2021-06-14 at 20:32 +0100, Biju Das wrote:
> RZ/G2L i2c controller is compatible with RZ/A i2c controller.
> By default IP is in reset state, so need to perform release
> reset before accessing any register.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
>   * Changed to devm_reset_control_get_exclusive API for reset_control_get.
>   * Updated KCONFIG to enable RESET_CONTROLLER only if it is RZ/G2L SoC.
>   * Filled .data for RIIC_RZ_A.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

> ---
>  drivers/i2c/busses/Kconfig    |  1 +
>  drivers/i2c/busses/i2c-riic.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 281a65d9b44b..17bd15ad8761 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -941,6 +941,7 @@ config I2C_QUP
>  config I2C_RIIC
>  	tristate "Renesas RIIC adapter"
>  	depends on ARCH_RENESAS || COMPILE_TEST
> +	select RESET_CONTROLLER if ARCH_R9A07G044

I would have expected the select RESET_CONTROLLER to be placed under
config ARCH_R9A07G044. Since this is a pretty architecture specific
driver, I'm ok with this as well.

regards
Philipp
