Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1C45849A
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2019 16:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfF0OhO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 10:37:14 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41873 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfF0OhO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jun 2019 10:37:14 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so2850367wrm.8
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2019 07:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DhsLfhTWsyDWo//t2Z979VREbqU1ZrHPbonaF7h6di0=;
        b=JoRIpnbu13rh1iH96DED1EQ38niclplOq5aNQ6kNqah2FS/xoGqdsLWnb3J2mF7uqK
         6F3ll3he9KrH/rP1DcGHBE2El8IVnpwYHzQnIp2YcQxmAA2FwLLKHDnIrrxtkKB2X8Jo
         vNtUN3RiZNBocKCrMhJLxNkYbLbsEDiGWW+EDPa6mSNzPdzbdUwALkzMP/r1nbd2tOID
         cep8d/FaYXI1selWH5cTsJqjuZOWzAztw2oUlelo+JqIswwmuQl3ruKhVtP7BfTx4Ibx
         9txa1V1iq3zQrQ9MMY/zLp4iDpDAzHnksDnEf34p1fls0UQMjgTvfBT+v3gajJyiVPK2
         HsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DhsLfhTWsyDWo//t2Z979VREbqU1ZrHPbonaF7h6di0=;
        b=uUZDSkhq2M9YQvrlwm+JcqfQSrqIC0uBlXwZAXhN2Dyul9g4vfJgbXONHKJOeVq9ws
         bR85YuPwA3h+UK4n7loY/Cwkctv8ZhXTS41lSt+E/75Xjg1H7OApkD3q+sFlRycZtL3Y
         fEHM2CBRw0v8LXJEBWF8xSxVLEh3JH90JcGoEvbeQV54r8TUr/2m6WrZVLx0WuZ1Odcb
         ROefX+FU0Mn7XBamAfu8iHMZBmMJfAsU6B6uLG+n9q6euG8cMXxAJ1OX9FcOQ0BYNCRu
         Qcmidwk/4cYmEnPu4TP2IVyTohRySv0G+5GaEO4gJB8HM1CAW8HkHMh9+qxagwk7o0PE
         8lTw==
X-Gm-Message-State: APjAAAUySCsisKAtUODptYQ4RuRoA7bAxGvryHzmFEBESSbP4rjG+CN4
        c/s/0UVZZ+8Xkob+nbR2ZI6nz/CXx0o=
X-Google-Smtp-Source: APXvYqyGUN/Nclf9nV6BJ2yxsIIjxtGWTryq0S7GjgtmCcsx+iPhZ0/CGhXpsTMO6GWa+CO49oxPMQ==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr3648217wrw.345.1561646232081;
        Thu, 27 Jun 2019 07:37:12 -0700 (PDT)
Received: from debian-brgl.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o20sm3558321wro.65.2019.06.27.07.37.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 07:37:11 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] at24: updates for v5.3
Date:   Thu, 27 Jun 2019 16:37:08 +0200
Message-Id: <20190627143708.10135-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Wolfram,

please pull the following set of updates for at24 for the v5.3 merge window.

Best regards,
Bartosz Golaszewski

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-v5.3-updates-for-wolfram

for you to fetch changes up to dce91ba39c765b2b90d07c717683abcdd9891592:

  eeprom: at24: modify a comment referring to platform data (2019-06-27 15:55:08 +0200)

----------------------------------------------------------------
at24: updates for v5.3

- simplify the probing code by using devm_i2c_new_dummy_device()
- simplify the code further by moving the code around a bit
- use struct_size() instead of calculating the required structure size
  by hand
- remove any references to now removed platform data from comments

----------------------------------------------------------------
Bartosz Golaszewski (3):
      eeprom: at24: use devm_i2c_new_dummy_device()
      eeprom: at24: drop unnecessary label
      eeprom: at24: modify a comment referring to platform data

Gustavo A. R. Silva (1):
      eeprom: at24: use struct_size() in devm_kzalloc()

YueHaibing (1):
      eeprom: at24: Remove set but not used variable 'addr'

 drivers/misc/eeprom/at24.c | 86 +++++++++++++++-------------------------------
 1 file changed, 28 insertions(+), 58 deletions(-)
