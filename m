Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB5622CAB
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 09:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729725AbfETHKr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 03:10:47 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:41685 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfETHKr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 03:10:47 -0400
Received: by mail-wr1-f47.google.com with SMTP id g12so12948781wro.8
        for <linux-i2c@vger.kernel.org>; Mon, 20 May 2019 00:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sN2cJH8aGxHGUMGlIBIdt6/B9FMCCSTgrlFf6cvH18M=;
        b=DpAUZRyGAbDyXkSFmLo+2sNoIaK/G4lsWYUu2PTrsPxZMUdwwjieCJRWdhADBypb0Y
         TSx3zUrxXa1we1Isin4rkNtlhQKVTHCg06TTVCA/vZJzVKP96PY+oswqMqaWQUTCcM5n
         ab3ZsoIjfeZBuNC+H2CSPwckZulUYc/pEGwSVTeu/AAaFbHSBN3bNF1U0ouqDkWipqqt
         G18e8DaoDasCFyKot9A6qCOX3P/L50cEr+vIDhWcHdK4Xvb0mchJi9mVU3vb7h5NXrw1
         sBmDhW2VVw6QJqJTLA3f28FpJKSIGrng916LcRiqso7NZsr3PufR1xJwSfgeeRU7ZN3d
         Zr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sN2cJH8aGxHGUMGlIBIdt6/B9FMCCSTgrlFf6cvH18M=;
        b=i8pT4aDOpdQW88BZ9fd24sPamMGgP92n1NjIJkdgLfDRdTh4xNkq2OXhBh0fquUMk4
         Pz4o9EOXK1Kzo7VDA/1XS41pzHfeddZYGu+IuX8EvngIZn9boAC3UOPUa5OLj9jglYSf
         ARGo9xfdmwzWK+8r9hCz2I1DeJIJKicsVJadeh1ilB6GQnjdilek/REZYWirpfzxD6O+
         HTuPEUHjMgOMZoGveV3a4FWhNNI9psjB1zmDYcHwofvJN6ziTKb9432y476cbtVApyPZ
         hgIf/dEr3qoDO3rdkEcbTzpScG+71iOF/UOUsmxy3D7C24FT5meKlFJxSSPQ1kSpPosF
         aQTA==
X-Gm-Message-State: APjAAAVp2RRgAlYbFsgIHtVbD3GJz4HaFF8JFVqeF+d8A+VqzbUnuHx/
        KKArW+rlpm0jSq12aTOWrkeCkNeaGtU=
X-Google-Smtp-Source: APXvYqx+MoUZgbYXBujdIkYxNyuE8NZpSbCu9C+zXBWPGGK83VTZxN6xvrpfuCRooQYL7cwPX3bYgQ==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr4989533wri.190.1558336246012;
        Mon, 20 May 2019 00:10:46 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id y132sm24017306wmd.35.2019.05.20.00.10.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 00:10:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/2] at24: use devm_i2c_new_dummy_device()
Date:   Mon, 20 May 2019 09:10:40 +0200
Message-Id: <20190520071042.21072-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Now that we have a resource managed version of i2c_new_dummy_device(),
use it in at24.

v1 -> v2:
- i2c_new_dummy_device() returns ERR_PTR(), not NULL so check the value
  correctly
- remove the no longer needed i2c_unregister_device() in error path

Bartosz Golaszewski (2):
  eeprom: at24: use devm_i2c_new_dummy_device()
  eeprom: at24: drop unnecessary label

 drivers/misc/eeprom/at24.c | 75 ++++++++++++--------------------------
 1 file changed, 24 insertions(+), 51 deletions(-)

-- 
2.21.0

