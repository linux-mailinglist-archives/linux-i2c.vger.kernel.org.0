Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D84478BE21
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbfHMQVP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:15 -0400
Received: from mout.gmx.net ([212.227.15.15]:59773 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728019AbfHMQVP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713259;
        bh=dcbp9wyo3uwTgq6UFIx/2q7he00MX7X5KQnY77LIfhw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=VhqxHnO/VCxDXppsYNbwakKFGN/6gX3zR0T0aL5FXCg1MRU6CjP8pQBsJSP6kqQVJ
         lfGehUcXza5qQAWQszx4JZ7fijQ3vEjE3pWpQzhMN5LWNVedCVuSbLZc2cSd9fow/v
         pswoGLzMKer8FCm2EHf6rwGKMkLZru4xhZ6dJzBM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mr9Bk-1ibZFt1nWw-00oGiA; Tue, 13 Aug 2019 18:20:59 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 06/13] clk: bcm2835: Mark PLLD_PER as CRITICAL
Date:   Tue, 13 Aug 2019 18:20:41 +0200
Message-Id: <1565713248-4906-7-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:IHISipDPkgSEtuerZ9YeqAdbuOcqfx1WWZSpdue+ABrqodCLh8L
 WOgb+7OoOmRjx9vcoUBPxzV8jzAd+hz60S8LROQ66M2sU9RBMNpc+ez02VAYhQHxZuXHmoT
 0HIHHaQRnOFGKbENNspO17RhUFzXPwf6UUTeQxcNlK+KBSsg2ga2GI+B1xzV6XC2VAsDivu
 cq1pL8PogxkL5fO98sLQA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S/vGA3BKd6Q=:DdZMNsh5Yyf+gZY+8I2lMf
 eBujfU4NY6iid0Wp4iR3MQ4Q0WhuA2To6M2STPNgodnv3HPT0FVKDezOVz/hN4cbfAFOlMMhu
 eOQ1NHAMFV10tTFUKjqsojKhaA3WajBp/XU5BrCscsMztiDNtCwlq/D+Tv4R98gKC5F+cxoeX
 rkjepfac6Ykz5t/k58g/AMJy4UQkzbsnp253g9pnZWjNqOeJT0JsGRdZAcf9HzoUuHFy8bCP3
 tT628OxdViueKVf154hRfbfBBIT4PL4IGOs4wmKsKOPIPY6HpWJHZpXzn89CdluBBFlKReU95
 oiVcqhap50qWJn3aKeL//4BXCoKF43eI8+luLXsR8HzNsuikTSk1/wrDGFPDKDng3mLlq+6/x
 5sLngt+Js7MnXZKZUOAr0yxCXt5kCbA9KE0B973FXIenJosQ+7uYAk0kJPkA6PwagqG9E9tOx
 NzLIx1ZAlBDp5UI5uJrPeKMnpLcMyk65pItZOcHuVy/Dw1eJDA2XXHRplLgjO4GtDGhcw6gOZ
 O0qLEkOIqBeGmXRBHpwX9HDI0xZ758+qGXurphN5oqOC0tixgxxaD27VRvK/dq1K3HGb2g1da
 cX1p12pOy2Cp/NOWWrcnTUsd121smpkbD794yaWYvlt8hmGnfhrQLy7Uc8HiZtF8+7ZvOhRsm
 uCaUdLvnRjakTk27cH/YxwjfvSCcYlNDYaMzkeQ7aUI8xYsnzQkOZR5ZWVC9wHgHjhTLnIh8l
 A46MLFhD4u7R3ndrZyqnP3qoXLDGh72xnf+H1RBxkRVtO7Yh3lLevSUqFOnEUjfb5NkrLTL5j
 Jck0zb0Azl6YurGfPlIjcYwi3hFWTwrLMKWKYvQbPgsG7/YYbpD8lUdD4aE1N9hzXCtb4/+fD
 i2WBW5uOVrt0zxlp5q5BI60hCQe0u9SfNU+mFxzXfqBs1MdiTCzqKxvJGZf3mlod0b472HjvQ
 wtesTYl+JEdrRpBDnVUc3v/RPiFctz4RbX8YpCl/SXzU7WayFAGcNeO1i5LrIB/gIzu++7BnH
 2jI/IcFgiqt6JED9mP/5tYKxPtdKo6ewZLvFrg/rN4xRfy3pQWLi8QJe9A0dmwuHibZ0hOSra
 bXRiZ5UV1KSqx3Rn/BwVliK1GnDOsny/ZIKvYAfnp5jpLOrdkhC8L6RHA==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The VPU firmware assume that the PLLD_PER isn't modified by the ARM core.
Otherwise this could cause firmware lookups. So mark the clock as critical
to avoid this.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/clk/bcm/clk-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index fdf672a..b62052e 100644
=2D-- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1785,7 +1785,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.load_mask =3D CM_PLLD_LOADPER,
 		.hold_mask =3D CM_PLLD_HOLDPER,
 		.fixed_divider =3D 1,
-		.flags =3D CLK_SET_RATE_PARENT),
+		.flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
 	[BCM2835_PLLD_DSI0]	=3D REGISTER_PLL_DIV(
 		SOC_ALL,
 		.name =3D "plld_dsi0",
=2D-
2.7.4

