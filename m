Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB37760714B
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 09:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiJUHkA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 03:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiJUHj7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 03:39:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF1421818
        for <linux-i2c@vger.kernel.org>; Fri, 21 Oct 2022 00:39:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd7-0006Mh-3v; Fri, 21 Oct 2022 09:39:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd3-000TRO-5K; Fri, 21 Oct 2022 09:39:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd4-009WB7-Bu; Fri, 21 Oct 2022 09:39:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v1 0/5] i2c: Convert drivers below drivers/i2c to .probe_new()
Date:   Fri, 21 Oct 2022 09:39:30 +0200
Message-Id: <20221021073935.165158-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=759; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LbyrI41No4LHbXq82DyIsHgZMdN0qCpVyeGlYF5GddI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUkydtEo9fla/u4cXixW2kSnH4Lbijk47uFTIw2D5 7d0223SJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1JMnQAKCRDB/BR4rcrsCbMzB/ 9B9C8gcZYqar78VtjB8l4zuvVQWcIlXzPsNY6YDBVOOO+WnGLTiraSohzVitb6m4HQn5NBqxEbY6Q9 Zb2zESn8rpCoXEG+EBtin6w27zJ+2gj66tRuFoP5w6KHzwWSulBj8y03fjDt1UapFrhSARUUOKSF1G JbGhQXbSkwhMretPHFyTcsxrH1mbUMgwOQ40nGDbqni0ANH/IXxuv7ZMVnpYrSvIa3RgAEqtDd/saD ylDOKp5t9S5xv0XsoQ3vZjL4P/3XMudGRVhJb2q/nAPsrwj65qDmSGRPWDwJ4sFwbbk7Lxyj9N+GKO ynE1ID6DzzLqCGybShh9sYY3Ukzkod
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

A set of 5 simple patches to get a bit forward in conversion to .probe_new().

Best regards
Uwe

Uwe Kleine-König (5):
  i2c: Convert the dummy_driver to .probe_new()
  i2c: slave eeprom: Convert to .probe_new()
  i2c: smbus: Convert to .probe_new()
  i2c: mux: pca9541: Convert to .probe_new()
  i2c: mux: pca954x: Convert to .probe_new()

 drivers/i2c/i2c-core-base.c         |  5 ++---
 drivers/i2c/i2c-slave-eeprom.c      | 31 +++++++++++++++--------------
 drivers/i2c/i2c-smbus.c             |  5 ++---
 drivers/i2c/muxes/i2c-mux-pca9541.c |  5 ++---
 drivers/i2c/muxes/i2c-mux-pca954x.c |  6 +++---
 5 files changed, 25 insertions(+), 27 deletions(-)


base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.37.2

