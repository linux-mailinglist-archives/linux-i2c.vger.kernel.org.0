Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE7F261F65
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 22:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732644AbgIHUC0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 16:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729876AbgIHPek (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 11:34:40 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A87DC06136E
        for <linux-i2c@vger.kernel.org>; Tue,  8 Sep 2020 05:41:22 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id s13so17125627wmh.4
        for <linux-i2c@vger.kernel.org>; Tue, 08 Sep 2020 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdfTT/sPzIY3qicOx8lLIxfdGZ/0byaMnXpkWKpo1X8=;
        b=Co9y2brFYGxX9l30TP10KW2iIHuTeusqsuWjzTzDAWLQcdc0K22TY8gdq2wUsSc1h3
         NjkOmtVjNEVO9WxjhGfH17N8H7lQvlggXeU7nRL4Vve4lRXYrBMOuax/VhCXwyzllZbf
         E4WHp6weDg/EAP097Ks0wEzzOqL0exqsFQiWtYuyk543T7X1DDrndnWMULa8GBWqZ4kU
         zAmMhcTz3Fub5pf9TBYrcwBsHaJqDvTPOb/KNcyuAKlfjrtYuC35R2Ekd1wkCP+FXOwb
         k5SrMbZhUCmj9Dmru8eN1j0tBKPRR2rFWdrvCYUy/keEA/zwJJTArXqEGDucm8Fa6HuF
         SIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdfTT/sPzIY3qicOx8lLIxfdGZ/0byaMnXpkWKpo1X8=;
        b=sqElxIhL+nzhf8ySDcTMlkBf9D4gfBDUu5CCoH8Xabg2IZLh16uY0/M7C30fqU4K7z
         71Zux/6kCWSWdHqKdbTk3v3E18jL4h7CaJlcKpPxssFuBD8zd7LCUBMVNpSbAjS8+SP4
         m+BDYSHK6Qsh1loj9cQPiFzHXuRT1S880MKafWpuAUAt9O7cZDaGGOfj10KjtRd5YIBZ
         nOcoiclBVzsmBF/3rp97jZrJDK17yWhKVHB1b1Zm8Y78SuZ5FQ2BQtE7FWS38LAshrH2
         ZPj0LnBirvRTPn3D8K1qxbx+B2IbTy9W2aJwn5qiXHxeOAxnWQPR+zX3MvuK4KP/hzgh
         zejg==
X-Gm-Message-State: AOAM5300w0PZtpVf8CbQyU5xnnQ5mcatc8ZdvR0ThnjcHtY43oPtA+JJ
        5leHdcHNgFmkQ84Ij+iIdiJUMNg3oujT5w==
X-Google-Smtp-Source: ABdhPJxgS1AoO0i0ziCax2GEUITHLfNHe7rJcXrGGe1y6zXXZZjXrFLX2w605SVBshwGG9dxpzU8nA==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr4466714wmc.112.1599568880922;
        Tue, 08 Sep 2020 05:41:20 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id g2sm33001248wmg.32.2020.09.08.05.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 05:41:20 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] at24: fixes for v5.9-rc5
Date:   Tue,  8 Sep 2020 14:41:16 +0200
Message-Id: <20200908124116.6163-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Wolfram,

Please pull the following fix for at24.

Thanks,
Bartosz

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-fixes-for-v5.9-rc5

for you to fetch changes up to 45df80d7605c25055a85fbc5a8446c81c6c0ca24:

  misc: eeprom: at24: register nvmem only after eeprom is ready to use (2020-09-01 09:49:55 +0200)

----------------------------------------------------------------
at24 fixes for v5.9-rc5

- delay registration of the nvmem provider until after power is enabled

----------------------------------------------------------------
Vadym Kochan (1):
      misc: eeprom: at24: register nvmem only after eeprom is ready to use

 drivers/misc/eeprom/at24.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
