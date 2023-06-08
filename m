Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3952172754B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 04:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233755AbjFHCyc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 22:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjFHCyb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 22:54:31 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3374E50;
        Wed,  7 Jun 2023 19:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=hRL53ufQNc+iuMhcj+kE/bG7v/x5YM0q+MX4eg7+/HE=; b=Cy1b1Eev0FUsLxSTCDDHeTpC6y
        5WJgEsdM6aiw4DSARwXh5a6/hzFDgcJyZU8EGZyMuC1KPpIJJij8/KyV+t2AMaD2XO6ZP6vHUkrUE
        ogvWdNez8ByVG2nEPG6f2S2klY4HnBlTr0BtpERIzG2/PyePmSuxJcYqgFyX069aQqBvti37F1IXj
        XlzNaQKsXTpdnd1CZ+F2z578OZ9Ecruy9msz7DuWikbrkfXaSMQ9TM/Rzb/vzJewVCFKojnl8Wz1C
        O1eom+yGdzhWSvMpDSJRqNg+xI8fwmID8FQzsVWCDuF8FcjKHrtT4lxMuvIJtXQqIctAgxtVGCqkx
        HIJSukiA==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1q75nA-007rlv-1j;
        Thu, 08 Jun 2023 02:54:28 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] eeprom: at24: also select REGMAP
Date:   Wed,  7 Jun 2023 19:54:24 -0700
Message-Id: <20230608025424.29033-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Selecting only REGMAP_I2C can leave REGMAP unset, causing build errors,
so also select REGMAP to prevent the build errors.

../drivers/misc/eeprom/at24.c:540:42: warning: 'struct regmap_config' declared inside parameter list will not be visible outside of this definition or declaration
  540 |                                   struct regmap_config *regmap_config)
../drivers/misc/eeprom/at24.c: In function 'at24_make_dummy_client':
../drivers/misc/eeprom/at24.c:552:18: error: implicit declaration of function 'devm_regmap_init_i2c' [-Werror=implicit-function-declaration]
  552 |         regmap = devm_regmap_init_i2c(dummy_client, regmap_config);
../drivers/misc/eeprom/at24.c:552:16: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  552 |         regmap = devm_regmap_init_i2c(dummy_client, regmap_config);
../drivers/misc/eeprom/at24.c: In function 'at24_probe':
../drivers/misc/eeprom/at24.c:586:16: error: variable 'regmap_config' has initializer but incomplete type
  586 |         struct regmap_config regmap_config = { };
../drivers/misc/eeprom/at24.c:586:30: error: storage size of 'regmap_config' isn't known
  586 |         struct regmap_config regmap_config = { };
../drivers/misc/eeprom/at24.c:586:30: warning: unused variable 'regmap_config' [-Wunused-variable]

Fixes: 5c015258478e ("eeprom: at24: add basic regmap_i2c support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-i2c@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
---
 drivers/misc/eeprom/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/drivers/misc/eeprom/Kconfig b/drivers/misc/eeprom/Kconfig
--- a/drivers/misc/eeprom/Kconfig
+++ b/drivers/misc/eeprom/Kconfig
@@ -6,6 +6,7 @@ config EEPROM_AT24
 	depends on I2C && SYSFS
 	select NVMEM
 	select NVMEM_SYSFS
+	select REGMAP
 	select REGMAP_I2C
 	help
 	  Enable this driver to get read/write support to most I2C EEPROMs
