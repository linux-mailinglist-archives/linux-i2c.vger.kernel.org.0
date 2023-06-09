Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04AA17292F3
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 10:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240770AbjFIIYs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 04:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240593AbjFIIY0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 04:24:26 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89B94ED8
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 01:23:07 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b219ed9915so15730231fa.3
        for <linux-i2c@vger.kernel.org>; Fri, 09 Jun 2023 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686298983; x=1688890983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yc5EfomFDC38C1bGgQ2dweTHsz+MZnL2cM4YJHhJ+qI=;
        b=ShUcwcu0r2Q2TYezpcCy+Zev5ntLYRGUENLkEw3y19vhAaSySJWaqO1f7urZBVNqL+
         FNTdtUf8KyggUV7V+sRJ91pXLbdDkamXIew1nog5gWP3WKtZVNCajxJ9kJXlM7OSVRTZ
         /FzXIf2NmXd09x8Uccr7mQdPEZmkiMJOFYtSH8OsQ+/mV7r1S+IxSQR6NzFyzkhTXS/P
         jcuQ62N5ej57WclK1mgDuteQ1nZO16op27luMy1ixbKwoHGPEP5LC9qZm5YV+6WkH0v7
         V4YcC2v9QMWqtHnG/aiH2dPN3Sh3eu19PUoJnbWzkZokF6ibLWGxHvjWcIvPrBpteGrd
         hbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298983; x=1688890983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yc5EfomFDC38C1bGgQ2dweTHsz+MZnL2cM4YJHhJ+qI=;
        b=hJhmGbthj/RbihxV+G02mDCpPRFMYfgDhPUFZA8B0EGoeO9NO96hh49bGgr//x8wAu
         scz8a0gut9WliCyPiGHCDwh5lTiSpUIXwwY3gV7e+zHgxdYTFgH8mg+UxVqQYLzJl0+R
         pmTh4ZKg5ftNvDVFSqPr41f+CNAQ03w8RQDvEazpwM6+cyU5tgD5t17CfX99Q3b1Thtc
         +Vjib610NNK4XRqie31O/G3iE3s/6XS/DaE2uqVWZD3u/2hVYdz8VGiCqSBF4+mxLrBK
         rW7Y2c2av/SGPMqd5vnphjZe5U3oA4EI8Da17F0C5P/MNi7VPG4CfzBHp2KcDU8/ZBF9
         hGFg==
X-Gm-Message-State: AC+VfDz7VOjzHQ4vRJg0YtTHfqZAV18vKl382qy/eA9j5kzX1xLR8NAi
        OTKRQAVo5de8lMjEpFieaCX29w==
X-Google-Smtp-Source: ACHHUZ7IK10gN2zFu9KeEDlxuTMjv4qgURWs76Acxq6TmVAkACLVU884Cq3Hc8NdOR/CCDHQ0uha0w==
X-Received: by 2002:a2e:800a:0:b0:2ac:8262:322a with SMTP id j10-20020a2e800a000000b002ac8262322amr680392ljg.13.1686298983618;
        Fri, 09 Jun 2023 01:23:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4900:c6d1:3dce:450c])
        by smtp.gmail.com with ESMTPSA id u7-20020a7bcb07000000b003f60d0eef36sm1834305wmj.48.2023.06.09.01.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 01:23:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] at24: fixes for v6.4-rc6
Date:   Fri,  9 Jun 2023 10:23:00 +0200
Message-Id: <20230609082300.32524-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Wolfram,

Please pull the following Kconfig fix for at24 for this release cycle.

Bartosz

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24-fixes-for-v6.4-rc6

for you to fetch changes up to 2585c430e40776557e2bd66e50d345b6c3914772:

  eeprom: at24: also select REGMAP (2023-06-08 09:58:57 +0200)

----------------------------------------------------------------
at24 fixes for v6.4-rc6

- fix a Kconfig issue (we need to select REGMAP, not only REGMAP_I2C)

----------------------------------------------------------------
Randy Dunlap (1):
      eeprom: at24: also select REGMAP

 drivers/misc/eeprom/Kconfig | 1 +
 1 file changed, 1 insertion(+)
