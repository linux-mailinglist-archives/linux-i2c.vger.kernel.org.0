Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99424734D03
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 10:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjFSIFq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 04:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbjFSIFJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 04:05:09 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E03E61
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 01:05:04 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f90a1aa204so21784305e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 01:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687161902; x=1689753902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CdjqeDMnKSQW1IfW5ZYINejIjSWjK+Uo+bi0ADXlqA4=;
        b=mwQ5C8vYOlgvDd20fJ0CYQreyxJs2HgYdmnSaYv8h1Sd6eYS/fVooXsc9WesDoG+W0
         IVji4RZl52LmbpSJE1n2gb3VR43h3KmT97bxIGuwSJCIYmLGqn7XAkdiwPlT7cCjvOTA
         S1KeDStIWt2Y/K35SYd9QZlMdBYzamtEN8OLv/b324WUYnx9RQuAGnpdlpvAS6sQ2vDy
         n82Cix0tWhOCj5oFDZp6YWhGjws7G7pXYGT/HoubuM4vPGDCV7YeiVRKKhpj+PayW+q+
         MNjd7/kqytEXZ4ITLxkemHXSUPnwldcUIvL8ZnUHq0JJtf6bq0vbexjiud18fi1ZzjTI
         m1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687161902; x=1689753902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdjqeDMnKSQW1IfW5ZYINejIjSWjK+Uo+bi0ADXlqA4=;
        b=eguMdbfonXfgiICnKx73R+YH323WYqQJEO/PG3xsFLyEGF799RUHwmHCzyXcNrgNYI
         n+CwgXMwAFX7ubC06Ecc+XmIDExL1VMNdfc5V6Nj1RY3aohhuTq09P26xARzDIxwUFrv
         BOXeNHVRQR/eAIXomqFOZaWr+pzz1pZLOSIC6WdyFt7CNGiFhTMTfTVm/5Y9ndTViYzM
         NwicuZ83OZvMzk51nk+U5zReHmQ9npzjRVsW7Et3GjSG+vIrsFPJeoj3Fi+0rHCRNOpv
         Zu5VPYC7J90RLaZygmWRFu0oym0AWfbDOLDEwEaSiJAFdy0U9e9oAhlRzaXyacznARFs
         eFNA==
X-Gm-Message-State: AC+VfDz6sqBreNKopdzmqp7q7VV6ySaIjfyWRLvVSrk8KnsCU7rRnLaP
        xYAbXPAWOmy4ALLCfhidBZjiSw==
X-Google-Smtp-Source: ACHHUZ6h2MGivnGxV/xl8nsMDSFat8swTF1eYvWuzzobHEEhzGrfQe3GYpI87B/O46IxLDyx5Wk/Kg==
X-Received: by 2002:a7b:cb85:0:b0:3f9:82f:bacf with SMTP id m5-20020a7bcb85000000b003f9082fbacfmr6023301wmi.38.1687161902554;
        Mon, 19 Jun 2023 01:05:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id z25-20020a7bc7d9000000b003f8fac0ad4bsm8553546wmk.17.2023.06.19.01.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 01:05:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] at24: updates for v6.5
Date:   Mon, 19 Jun 2023 10:04:58 +0200
Message-Id: <20230619080458.24916-1-brgl@bgdev.pl>
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

Please pull the following changeset for the next merge window.

Thanks,
Bartosz

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v6.5

for you to fetch changes up to a3c10035d12f5ec10915d5c00c2e8f7d7c066182:

  eeprom: at24: Use dev_err_probe for nvmem register failure (2023-05-16 16:43:59 +0200)

----------------------------------------------------------------
at24 updates for v6.5

- use dev_err_probe() where applicable

----------------------------------------------------------------
Alexander Stein (1):
      eeprom: at24: Use dev_err_probe for nvmem register failure

 drivers/misc/eeprom/at24.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
