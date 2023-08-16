Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9E277EA51
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 22:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345523AbjHPUE0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 16:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237492AbjHPUEY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 16:04:24 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A19E55;
        Wed, 16 Aug 2023 13:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692216259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=0QjcSWERrvlydgwZfM2ctqBNZ+6TXFZnAAhKEjv9P6M=;
        b=HPFxFrFagO06p3gelWZM5mfgZdRRAZNqK2YFuIlYqBYx43p1pz18GDu+ruxmbs1Eg22Y3o
        N142k6tRNMsMHqc6cjE+ECwUQL2vv9GBsvA95BmPe/n0RMvD+rwEucmKWj2p2sNix2hU5h
        JAsmw/RmnMYls0OzDliWE4i9rDdjZ50=
Received: from fallen-ThinkPad-X260.hotspot.hub-one.net (<unknown> [37.169.176.143])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id d6809c2a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 16 Aug 2023 20:04:18 +0000 (UTC)
From:   Yann Sionneau <yann@sionneau.net>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Michal Simek <michal.simek@amd.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Yann Sionneau <yann@sionneau.net>
Subject: [PATCH 0/4] i2c: devm_pinctrl_get() usage fixes
Date:   Wed, 16 Aug 2023 22:04:06 +0200
Message-Id: <20230816200410.62131-1-yann@sionneau.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Most of the patches just remove the check for NULL for devm_pinctrl_get()
return value since it cannot return NULL.

One patch also sets back rinfo->pinctrl to NULL when devm_pinctrl_get()
returns an error instead of a valid pointer and the driver does not bail
out.
This last change prevents core i2c code to dereference invalid pointer
because it checks for rinfo->pinctrl validity with "if (rinfo->pinctrl)"
before dereferencing it.

Yann Sionneau (4):
  i2c: mv64xxx: devm_pinctrl_get() cannot return NULL
  i2c: at91-master: devm_pinctrl_get() cannot return NULL
  i2c: i2c-cadence: Reset pinctrl to NULL in case devm_pinctrl_get()
    fails
  i2c: imx: devm_pinctrl_get() cannot return NULL

 drivers/i2c/busses/i2c-at91-master.c | 2 +-
 drivers/i2c/busses/i2c-cadence.c     | 1 +
 drivers/i2c/busses/i2c-imx.c         | 2 +-
 drivers/i2c/busses/i2c-mv64xxx.c     | 2 --
 4 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.34.1

