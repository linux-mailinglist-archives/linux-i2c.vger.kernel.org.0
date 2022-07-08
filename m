Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59D3156B905
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 13:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238185AbiGHL4i convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 8 Jul 2022 07:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238162AbiGHL4f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 07:56:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964E09A6B9
        for <linux-i2c@vger.kernel.org>; Fri,  8 Jul 2022 04:56:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o9mac-0004SH-AX; Fri, 08 Jul 2022 13:56:06 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o9maV-00594R-9U; Fri, 08 Jul 2022 13:56:02 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o9maY-0007je-2Q; Fri, 08 Jul 2022 13:56:02 +0200
Message-ID: <165cf7fa3ca88f195828648aa2a680c7b3b7c0c5.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/2] i2c: Add Renesas RZ/V2M controller
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date:   Fri, 08 Jul 2022 13:56:01 +0200
In-Reply-To: <20220708100350.12523-3-phil.edworthy@renesas.com>
References: <20220708100350.12523-1-phil.edworthy@renesas.com>
         <20220708100350.12523-3-phil.edworthy@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fr, 2022-07-08 at 11:03 +0100, Phil Edworthy wrote:
> Yet another i2c controller from Renesas that is found on the RZ/V2M
> (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>


Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

for the reset handling.

regards
Philipp
