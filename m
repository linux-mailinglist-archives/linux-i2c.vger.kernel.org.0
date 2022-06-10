Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB3C054615E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 11:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348783AbiFJJQb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 05:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348143AbiFJJPS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 05:15:18 -0400
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07781BF837;
        Fri, 10 Jun 2022 02:15:17 -0700 (PDT)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
        by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1nzajJ-005MUI-G6; Fri, 10 Jun 2022 19:14:58 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 10 Jun 2022 17:14:57 +0800
Date:   Fri, 10 Jun 2022 17:14:57 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     tudor.ambarus@microchip.com, alexandre.belloni@bootlin.com,
        nicolas.ferre@microchip.com, linux-crypto@vger.kernel.org,
        kernel@pengutronix.de, claudiu.beznea@microchip.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - Remove duplicated error reporting in
 .remove()
Message-ID: <YqMLkVCB9DRr/LD6@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220520172100.773730-1-u.kleine-koenig@pengutronix.de>
X-Newsgroups: apana.lists.os.linux.cryptoapi
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:
> Returning an error value in an i2c remove callback results in an error
> message being emitted by the i2c core, but otherwise it doesn't make a
> difference. The device goes away anyhow and the devm cleanups are
> called.
> 
> As atmel_ecc_remove() already emits an error message on failure and the
> additional error message by the i2c core doesn't add any useful
> information, change the return value to zero to suppress this message.
> 
> Also make the error message a bit more drastical because when the device
> is still busy on remove, it's likely that it will access freed memory
> soon.
> 
> This patch is a preparation for making i2c remove callbacks return void.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> drivers/crypto/atmel-ecc.c | 12 ++++++++++--
> 1 file changed, 10 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
