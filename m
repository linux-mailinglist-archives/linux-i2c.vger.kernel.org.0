Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E07F61796
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2019 23:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbfGGVEn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Jul 2019 17:04:43 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44262 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfGGVEn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Jul 2019 17:04:43 -0400
Received: by mail-wr1-f66.google.com with SMTP id p17so3699918wrf.11;
        Sun, 07 Jul 2019 14:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DBueUHntfn0T3K902ce+VP9uxZXuwwzpiWWyCqaqkMY=;
        b=E/acIBVv+O7DIqeSgSobR09IwsRFSPuPb6AlEgXvTXxdRKX7LrE+5mZIjWDQ73aLu1
         h/nGAv0v3qCXSnUgBQ2IgW6fS4Q7Yld14e6PQurb8bCkkSUYQ6T38vJZ82kOSrOV8BFQ
         O7cA1lSPhAuAEGYq8RfJ3CKIJu1UxmQQ6i20vIWJPTpasJ1rdzsOaARlllfM887lHr8Y
         JZOrIY2hzAVxeaG0OvZFH1qG4FM8vgdYaDvIo2KZxHqihLuZLecGzLJmq9oPRD3urxaC
         jBXiTf7h0img+19yrrpEV4yOnb5AOkIztyHIlfBJ1gvej6DK3cXu6orubwGaYd3K06e5
         Ua8g==
X-Gm-Message-State: APjAAAXBV7NINnog4D3ZY2VuL5oZe8TkBNVYGfZqkXWInMYkax9w2sbl
        1yuKP0wQirxfzOoyf16pggoWkvuTv5Y=
X-Google-Smtp-Source: APXvYqzHhP4XJHRtSGw+tnvtArbU2usPj0kQ1SiieMSGEXC8+uW7HRkNiafHqvNfEHB4m1VUbIczvA==
X-Received: by 2002:adf:eb49:: with SMTP id u9mr15287835wrn.215.1562533481065;
        Sun, 07 Jul 2019 14:04:41 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.googlemail.com with ESMTPSA id x129sm13225632wmg.44.2019.07.07.14.04.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Jul 2019 14:04:40 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Denis Efremov <efremov@linux.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: core: make exported functions non-static
Date:   Mon,  8 Jul 2019 00:04:19 +0300
Message-Id: <20190707210419.14868-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The functions i2c_new_client_device and i2c_new_dummy_device are declared
static and marked EXPORT_SYMBOL_GPL(), which is at best an odd combination.
Because the functions were decided to be a part of API, this commit removes
the static attributes and adds the declarations to the header.

Fixes: 7159dbdae3c5 ("i2c: core: improve return value handling of i2c_new_device and i2c_new_dummy")
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 drivers/i2c/i2c-core-base.c | 4 ++--
 include/linux/i2c.h         | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9e43508d4567..7792fa40fc32 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -721,7 +721,7 @@ static int i2c_dev_irq_from_resources(const struct resource *resources,
  * This returns the new i2c client, which may be saved for later use with
  * i2c_unregister_device(); or an ERR_PTR to describe the error.
  */
-static struct i2c_client *
+struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
 	struct i2c_client	*client;
@@ -887,7 +887,7 @@ static struct i2c_driver dummy_driver = {
  * This returns the new i2c client, which should be saved for later use with
  * i2c_unregister_device(); or an ERR_PTR to describe the error.
  */
-static struct i2c_client *
+struct i2c_client *
 i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
 {
 	struct i2c_board_info info = {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 1308126fc384..fa42f6f594ce 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -436,6 +436,10 @@ struct i2c_board_info {
 extern struct i2c_client *
 i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
 
+extern struct i2c_client *
+i2c_new_client_device(struct i2c_adapter *adap,
+			struct i2c_board_info const *info);
+
 /* If you don't know the exact address of an I2C device, use this variant
  * instead, which can probe for device presence in a list of possible
  * addresses. The "probe" callback function is optional. If it is provided,
@@ -457,6 +461,9 @@ extern int i2c_probe_func_quick_read(struct i2c_adapter *, unsigned short addr);
 extern struct i2c_client *
 i2c_new_dummy(struct i2c_adapter *adap, u16 address);
 
+extern struct i2c_client *
+i2c_new_dummy_device(struct i2c_adapter *adap, u16 address);
+
 extern struct i2c_client *
 devm_i2c_new_dummy_device(struct device *dev, struct i2c_adapter *adap, u16 address);
 
-- 
2.21.0

