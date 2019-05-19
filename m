Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 753EB228CA
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2019 22:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbfESUkW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 May 2019 16:40:22 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:36229 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727866AbfESUkV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 May 2019 16:40:21 -0400
Received: by mail-wr1-f41.google.com with SMTP id s17so12315286wru.3
        for <linux-i2c@vger.kernel.org>; Sun, 19 May 2019 13:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sg8ed2q+lhuAK9+Mk+OYXgpMTiIhPvCyFel37fn9zCY=;
        b=JlgVrj59D+Pab/X/1I4fSB0dKZMKC6agTXDLCWkLtC2ZzGD7WhjSjiuOKOyFtd0dnM
         dvfgp06ueceAPHHb2JlGDwNr8S6zWfzsthqvnTZau54enq5fV/Xr4M90HStYygRP6h/3
         OhyZ6DsoJ8Bjll9SWID1lD06RuVeEpdVHIxh0qIEk+QK+WFLEULuSFTYzGx6KZVeHCFC
         WIP4U2FGrPJBC4UUI3/AFbMpBGeoLbH4VbCQVaCWL3DGcQHyxVMG2hg3OPx3r50PV/N5
         jcsfTW19MBDNMAeO8VJ5F26C1HV5gwD6k4DPv6BtBRaTza+wllRoqIVcKMD86mC8eNoi
         H9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sg8ed2q+lhuAK9+Mk+OYXgpMTiIhPvCyFel37fn9zCY=;
        b=tcPXwvanMghBYKOe3JJ7z0gUCzWopwFfY9hq1bto2kfkk+XS2YtMnSfj1Tlbp0T9V/
         MZzCciCxkTadXvBxOKtJJS4+mN9BvfMEZlWU22FVG3Hw0z42pulef0wkT+nWhCl/aYIV
         X1mw4GwLEzH/0q1B/+LMPLBZ4CCN4FDexrF56iEVqES9Y9Tt0Y/IUKyfLGyLfLzd0cmN
         kVZ5kcpxitqbdhaYBNKsd9SzBx2/gLCIwyspHxUVUgGMKqF+NFhuL0f/bC+fsvsZq8BU
         R9C6JMi026JdebKXtRBMq9l/MygS+o6EKca5FmN94j3uy1wmj2F1e8wWaenDXlCAzjoZ
         z0Rw==
X-Gm-Message-State: APjAAAWb4wvA1CLvQ6JC5bxvZWbjhvIWUFxSgl8xjtTUMauphE0HiB1p
        WiE5823XBd1S3EITIA4JO/7sQUsEVmE=
X-Google-Smtp-Source: APXvYqza4uzMgs9BPwMCPxl1b3mfhj62LzgTH+Kd/01KnCo8mMeACSfDX+Fz/0ja55aLLwZo6yjkNQ==
X-Received: by 2002:adf:ec8e:: with SMTP id z14mr14780797wrn.198.1558298419745;
        Sun, 19 May 2019 13:40:19 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id d17sm8710814wrw.18.2019.05.19.13.40.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 May 2019 13:40:18 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/2] at24: use devm_i2c_new_dummy_device()
Date:   Sun, 19 May 2019 22:40:10 +0200
Message-Id: <20190519204012.31861-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I see Linus pulled the new helper, so here's a patch using it in at24
and also a small code tweak for better readability.

Bartosz Golaszewski (2):
  eeprom: at24: use devm_i2c_new_dummy_device()
  eeprom: at24: drop unnecessary label

 drivers/misc/eeprom/at24.c | 65 ++++++++++++--------------------------
 1 file changed, 21 insertions(+), 44 deletions(-)

-- 
2.21.0

