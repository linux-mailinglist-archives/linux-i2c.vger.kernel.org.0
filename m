Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9CA14CC5DD
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 20:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235966AbiCCTSo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 14:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235944AbiCCTSm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 14:18:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6CBE0A24
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 11:17:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E200CB826B4
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 19:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6CAC340EF;
        Thu,  3 Mar 2022 19:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646335073;
        bh=Bn6yM2yCazQaD8A1n65vFEXUE6/ICsJ38pFbK9aUJgI=;
        h=From:To:Cc:Subject:Date:From;
        b=iTjVwt4UqIgbxWTLRvkngGpAVSCYS4YNcN0Ygvp+LrmbbiXUrG8GPGRTpIQ/nZiAk
         d1MHXXwqxSwpd06CmwvYhhRsGXr4aa23ggt+UPFlEHqD/F8sSsig79trxNwADEJadw
         3sTzXVZHAQBK44KrEXduhJmsotTNW2XEPMXawuYAhbT4Z5D2hlj/qysTU2cxAOZ/+G
         YipNczILWzwjJOGKUw0F+xtrAOOIpvBhQ3TVH2kNWlrl4zyYejm+UdiIA0m7F19JZq
         1lwrQkKP/x9lryPXAnhl9wG/IBQHWellN4WMcAQ8Lv5/2R3DOw8d1PQFGT6uTWmdgq
         d0VT82ezc9Gfw==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-i2c@vger.kernel.org, patches@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH -next] i2c: designware: Mark dw_i2c_plat_{suspend,resume}() as __maybe_unused
Date:   Thu,  3 Mar 2022 12:17:13 -0700
Message-Id: <20220303191713.2402461-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When CONFIG_PM is set but CONFIG_PM_SLEEP is not, two compiler warnings
appear:

  drivers/i2c/busses/i2c-designware-platdrv.c:444:12: error: unused function 'dw_i2c_plat_suspend' [-Werror,-Wunused-function]
  static int dw_i2c_plat_suspend(struct device *dev)
             ^
  drivers/i2c/busses/i2c-designware-platdrv.c:465:12: error: unused function 'dw_i2c_plat_resume' [-Werror,-Wunused-function]
  static int dw_i2c_plat_resume(struct device *dev)
             ^
  2 errors generated.

These functions are only used in SET_LATE_SYSTEM_SLEEP_PM_OPS(), which
is defined as empty when CONFIG_PM_SLEEP is not defined. Mark the
functions as __maybe_unused to make it clear that these functions might
be unused in this configuration.

Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the suspended flag")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 116a297d1f6b..70ade5306e45 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -441,7 +441,7 @@ static int dw_i2c_plat_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int dw_i2c_plat_suspend(struct device *dev)
+static int __maybe_unused dw_i2c_plat_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
@@ -462,7 +462,7 @@ static int dw_i2c_plat_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int dw_i2c_plat_resume(struct device *dev)
+static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 

base-commit: 1d366c2f9df8279df2adbb60471f86fc40a1c39e
-- 
2.35.1

