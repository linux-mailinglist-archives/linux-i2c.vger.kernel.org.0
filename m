Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A21E7A3E8
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2019 11:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbfG3JWr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jul 2019 05:22:47 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43726 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfG3JWr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Jul 2019 05:22:47 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so64910184wru.10
        for <linux-i2c@vger.kernel.org>; Tue, 30 Jul 2019 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZB30ikpmvUH342s0WczV3x/mE9MH1qk5ePvWq53/sUg=;
        b=XoShbxn0Jo2Gxgx50uyDZmiLwRI9kwXAktKZbO9V6BuzbEV9JqXxJa0EaX5KqNltVT
         6HK/h2Ok/Dh6JbD3mFaK6tIXqmFgSVvGSdBG/Q5FD9Q5fwp8Xk5USnd3OaMYaQrxLI5X
         QzLWRbK6VIRwd6xBMJ5M7bOSYkQNyOdWVECkZm/6YXvIdMvYold/covEUrvRdT6jgAyY
         tiBSgehZb514qht0142tjVDbRYMKpHPk5N7a9Mp2t5OnIILk8ldHdMwwrRJ9al2J8wqo
         /+J+F9TH8eFVK6nQA85nq9Z9rb+SthvQR4g2hau+aUAY/5HOrxiJcuDrh8HF75F3/Q3J
         paNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZB30ikpmvUH342s0WczV3x/mE9MH1qk5ePvWq53/sUg=;
        b=YFIDl0kDqCJ5MQKHbXCVlElJHrNGK4Gh/rXRzNOFTynMQlBEc0QEqoYWWMfISkqSSC
         5pbvlAAZjQJJvp6anDTiOnXOvJzP80K/FlzKdYyk1FwSGdIHrbQ0GdgvM1K42lKZFwSZ
         aCJK+4mbq5Asdft5yjFrdt9tKjeo4gsp0KdVYgRvpWA+9JlBMiGkjctefbp+SnWBGjd3
         orr4d0Nk2eHwzZGBfEvn6zrib0SY7xs84/Vad0R6DXAuG2XyDnhRKndlOvrCqwwmSnYB
         fQuHklbh1XA6FaPlYBZI5Ojuur/Rgq1J0MTcM34SCtxgRErKQHAYAoHqwBbUlACfteKu
         g6gQ==
X-Gm-Message-State: APjAAAX5d6kFUbCeuHbYmqCEFhqu6kTGupYcgE4ZWC/DVYQJQXhFRC4r
        G9ipcSeopDG55Yv3/tKJ6Mk=
X-Google-Smtp-Source: APXvYqwSbhAblUn0yS0plIpEq3kwlU1mnkUOfiCodhNjvfxBiH1kBDBzL68JtO1ZfkDTulECSfSKAg==
X-Received: by 2002:adf:a299:: with SMTP id s25mr118979691wra.74.1564478565212;
        Tue, 30 Jul 2019 02:22:45 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id k124sm105870811wmk.47.2019.07.30.02.22.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 02:22:44 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] at24: fixes for v5.3-rc3
Date:   Tue, 30 Jul 2019 11:22:41 +0200
Message-Id: <20190730092241.30185-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Wolfram,

please pull the following fix for at24.

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24-v5.3-rc3-fixes-for-wolfram

for you to fetch changes up to 25e5ef302c24a6fead369c0cfe88c073d7b97ca8:

  eeprom: at24: make spd world-readable again (2019-07-28 18:49:20 +0200)

----------------------------------------------------------------
at24 fixes for v5.3-rc3

- make spd eeproms world-readable again

----------------------------------------------------------------
Jean Delvare (1):
      eeprom: at24: make spd world-readable again

 drivers/misc/eeprom/at24.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
