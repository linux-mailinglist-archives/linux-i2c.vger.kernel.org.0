Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF21F9AB9
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 21:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfKLUbh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 15:31:37 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38615 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfKLUbg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Nov 2019 15:31:36 -0500
Received: by mail-pf1-f196.google.com with SMTP id c13so14159550pfp.5;
        Tue, 12 Nov 2019 12:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2WU8r6NpH8n/CAS7MCMpaG3QRhluQOgBbEqgwxXZR2E=;
        b=Us+JxrYyd+rY75W/J9AIM4yuTXlc0JbmG5DVkC1peMShddlgvcBQ+TtsEwwQreFGei
         Akp3nnqEhYSZ8Pd3qpGb7GnNfaISvZQGlq5ZoE84GzeytmLnXQngF7NX4/maqFkRg3TU
         sSJooTtqEPzyjeABXL9Gip+xaSbzM8StiPMP/Y/5ebEBjyhk2ia4l7IZ5h1v4wv9dD25
         U/QM4DjQaR3H+eQDxi7LxoWgOi4R3Fe2IzIYYXiRq4zqO51ahBVbcOu/1fSF9m1eg66N
         jjve6icUXHklXyJqpWp8u7AiCQBElHtjuLx1uFtfevhego5TE/tJ1xhpJTkdgACtOpHR
         Vc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2WU8r6NpH8n/CAS7MCMpaG3QRhluQOgBbEqgwxXZR2E=;
        b=H9NOxzblVmmrgeie+zzIQ50aOX6bl1bLbgZqXWpAMfzKEktcXNlXViVkDuCizzI+T9
         ya69mwU4VRisWpFj2r/cEbG5k6FNlHNQ0rtxnP2MA2uv4LMyqtLNXD2oyU5ZAE2gN8gM
         3BalD8nKUIboOfg7HeqmY7rsp7ws0ulRT86z0Ia+DpcT7E/np4aoVSbhZKOfRURuoDrs
         keX0ZdxYhm9yxAebrErAOU+TH9VE5TcWvQVAac9cQY8aQv0j94UU1ZNDIbuEE4G13s2s
         eB0yS5+98NU/W2YD6zo9qrDe+OFHGT3SewHtmctImviVH/R2ycg+yEZwuSTyKcGvH23B
         8Ljw==
X-Gm-Message-State: APjAAAV6Ol5CRen7oJ3AZUXYVRLzdibLx2u+j9+MguYg6KGr2FGHyP1n
        LXvlBvDi8FIun6MHdtwN4kg=
X-Google-Smtp-Source: APXvYqzVLDHrf3+auWD9Zfwn7HuZakoXwALGy5b2yZuKAYku2zY5xND/HTO7WI3MKhV1doF14qehEA==
X-Received: by 2002:a62:7c52:: with SMTP id x79mr38241350pfc.18.1573590695493;
        Tue, 12 Nov 2019 12:31:35 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h13sm23264084pfr.98.2019.11.12.12.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 12:31:34 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-iio@vger.kernel.orgi, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hartmut Knaack <knaack.h@gmx.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
Subject: [PATCH v3 0/3] Use void pointers instead of char in I2C transfer APIs
Date:   Tue, 12 Nov 2019 12:31:29 -0800
Message-Id: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While we indeed often deal with a stream of bytes when executing a
transfer, at the higher layers we usually work with more structured
data, and there is not really a reason to require casts to u8 * form the
callers. These series change I2C APIs to accept [const] void pointers,
and also adjust SMBUS implementation to use get/put_unaligned_16() and
memcpy() for moving data around.

Changes in v3:
- addressed Luca's comments
- added Jonathan's Acked-by
- split put_unaligned_le16 into a separate patch
- more call sites converted to get/put_unaligned_le16
- new patch using memcpy() for moving data around

Changes in v2:
- adjusted max1363 to the new i2c_master_send/recv signatures

Dmitry Torokhov (3):
  i2c: use void pointers for supplying data for reads and writes
  i2c: smbus: use get/put_unaligned_le16 when working with word data
  i2c: smbus: switch from loops to memcpy

 drivers/i2c/i2c-core-base.c  |  2 +-
 drivers/i2c/i2c-core-smbus.c | 40 +++++++++++++++---------------------
 drivers/iio/adc/max1363.c    | 14 +++++++------
 include/linux/i2c.h          | 28 +++++++++++++------------
 4 files changed, 41 insertions(+), 43 deletions(-)

-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

