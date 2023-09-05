Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B80C792F2D
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 21:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbjIETnR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 15:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240954AbjIETnO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 15:43:14 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303BFE43
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 12:43:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdbwy-0006MC-JS; Tue, 05 Sep 2023 21:43:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdbwx-004GYd-LS; Tue, 05 Sep 2023 21:42:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdbwx-00FcPp-1T; Tue, 05 Sep 2023 21:42:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Lee Jones <lee@kernel.org>
Subject: [PATCH 0/2] i2c: Finalize the .probe_new() quest
Date:   Tue,  5 Sep 2023 21:42:51 +0200
Message-Id: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=QO9ON+ctkXdcYCXPmBa1eGfunGxlwUnum+GnVIDn+a0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBk94S2af1Z4jcIlwC2A1GQs2sG0r/gL+uzj73EL 9TYSjSsCxiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZPeEtgAKCRCPgPtYfRL+ TkflB/9M0bg7RfoPqNDK+sh17pE2KifP7PGojVL7nDLB6p9YL2aOI9dxm8skNoRYMr0XeReobjp Mdm10u5Er7eJqX6aU+Flgq2UO2EPRcsxB+VQNYngwwFiiRYUFsNnGmmOVP8LBDPpGB8fOYABiha slMt2REYv063eWEoJoOX4a2B5SUcGZ+pdNdCh0Gz2uy2cIAm2UxKImfLDjP+nmS01F6za8R7j1R 4gQZw2CH6OkzLB+ztakurivDdcQtgxGxO6g66HzbKc/VYe+o6sCAe98ZD68rqeukfxX1aOclADH 5d+XOC+lzOhqsXDtzKGnrT/WpTw8QkOsQu/AwqBRprsMiv+m
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

this patch set finally drops .probe_new() from struct i2c_driver after
it was "temporarily" introduced in 2016 with commit b8a1a4cd5a98 ("i2c:
Provide a temporary .probe_new() call-back type")

Since commit 2be6bc48df59 ("Merge tag 'leds-next-6.6' of
git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds") all users of
.probe_new() are gone from Linus's tree apart from
drivers/w1/masters/ds2482.c. Krzysztof as w1 maintainer asked to take
the patch converting drivers/w1/masters/ds2482.c back to .probe() via
i2c together with the patch dropping .probe_new(). 

@wsa: Both patches have a Link: footer, I was unsure if I should keep it or
not. Feel free to drop them if you like it better this way.

In next are no new usages of .probe_new() and also I handled all
submission listed on https://lore.kernel.org/all/?q=dfb:probe_new to
prevent new usages. I'll continue to monitor the incoming patches for a
while.

According to

	git lg -S.probe_new --author=Kleine-König b8a1a4cd5a98..3f86ed6ec0b3 | wc -l

this quest needed 695 patches, thanks to all maintainers and reviewers for
caring about these, and sorry to all recipients of the patches for
filling their inboxes :-)

I suggest to apply this series on top of v6.6-rc1 in Wolfram's
i2c/for-next. I expect that a stable branch for merging into other trees
won't be necessary, but if it's applied directly on top of v6.6-rc1 we
have the option to create such a branch if and when the need arises.

Best regards
Uwe

Uwe Kleine-König (2):
  w1: ds2482: Switch back to use struct i2c_driver's .probe()
  i2c: Drop legacy callback .probe_new()

 drivers/w1/masters/ds2482.c |  2 +-
 include/linux/i2c.h         | 11 +----------
 2 files changed, 2 insertions(+), 11 deletions(-)

base-commit: 3f86ed6ec0b390c033eae7f9c487a3fea268e027
-- 
2.40.1

