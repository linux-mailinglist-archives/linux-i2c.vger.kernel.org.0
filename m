Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B022EF372
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 11:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfD3Jrm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 05:47:42 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34575 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfD3Jrm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 05:47:42 -0400
Received: by mail-wm1-f67.google.com with SMTP id b67so1919186wmg.1
        for <linux-i2c@vger.kernel.org>; Tue, 30 Apr 2019 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fn5ZvF6ltaEO/lfTX4VKdpMTpkniAkIQRod6AzKe1rU=;
        b=QUjHJs1bHrjfwd8JfzsPC3JX9yrBRVJoPdAHQVnpKHjhIAzq9/sYw8OhDQUWBeLbb6
         gHtd5AjPIwI+/P5X5B5LOdedb6Fo6sPQ2ZpsN2yUJUV8mAIhViXmUGtQMONKm2m9Yv/o
         pbv5vDKLfb/PBYUGEbJ8AjW7bgOEGHzZQYsFGr1Z1Wg4my/3XM6HM502qWk6E/IBscrU
         9K8qc8pFVl6lPsbw+f4q5MCA9I0ECzKf0Mb7ly6Fl67K5Md9Jt+nFdD5Be+SzMHKcADJ
         B4uFwNH6l7H7voG02C1FK6krZoXeiXMvoz/gxK1F7YvaN0zZvoAgEfzyqkq7KwZWMjo6
         vZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fn5ZvF6ltaEO/lfTX4VKdpMTpkniAkIQRod6AzKe1rU=;
        b=uOOMLZN1FnUAeypDeyJA04InoqKMTWbBOsiSQSV4NCZtUk64fOI0QaNgQrMFpNO+vW
         0EfRrcdW97XRwRFuSvI3uXlcYp4M3vciwxc16YNCbeLQSy52GQuVewziEpFhzi9WyTt+
         8CQn3+6LyzlRyPW/AiuHDeUNJukYLEKsn0B+R7/6Wj94DCHOXXngrBm0447kJ0ncbwDT
         mEZ1Juz3jqsI9WCOf5qtA2tOpeYFzjE6j4722SRBdrAXN/TOlU73ieHE7K7v3Tu3URnM
         ekyauRaDfBzydUQ6ze6iOXCtbtwdxGUd9o7bgPa2QddoVyPj+QtD9U8XzlIkYmnpq1yx
         Ji8w==
X-Gm-Message-State: APjAAAXJwAAXp+hWo2/170FCNqcgkNStEyXqvPuFdhtVuGJkxePpB0jg
        9F+43pIhPSGLCmgZWlvqBsjDWS2TdpUEXkDi
X-Google-Smtp-Source: APXvYqyJ3bYH6x5Krc67uTAiKWx3zIrQFByJtvz/Yf/U7wAx8omfyeWY/YeCVF+O7PYEc/YQhv6yyQ==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr2437438wma.120.1556617660443;
        Tue, 30 Apr 2019 02:47:40 -0700 (PDT)
Received: from sudo.home ([2a01:cb1d:112:6f00:1ca3:6afc:30c:1068])
        by smtp.gmail.com with ESMTPSA id p17sm2235819wrg.92.2019.04.30.02.47.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 02:47:39 -0700 (PDT)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-i2c@vger.kernel.org
Cc:     wsa@the-dreams.de, masahisa.kojima@linaro.org,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH] i2c: synquacer: fix enumeration of slave devices
Date:   Tue, 30 Apr 2019 11:47:34 +0200
Message-Id: <20190430094734.21414-1-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C host driver for SynQuacer fails to populate the of_node and
ACPI companion fields of the struct i2c_adapter it instantiates,
resulting in enumeration of the subordinate I2C bus to fail.

Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C controller")
Cc: <stable@vger.kernel.org> # v4.19+
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/i2c/busses/i2c-synquacer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index d18b0941b71a..f14d4b3fab44 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -597,6 +597,8 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 	i2c->adapter = synquacer_i2c_ops;
 	i2c_set_adapdata(&i2c->adapter, i2c);
 	i2c->adapter.dev.parent = &pdev->dev;
+	i2c->adapter.dev.of_node = pdev->dev.of_node;
+	ACPI_COMPANION_SET(&i2c->adapter.dev, ACPI_COMPANION(&pdev->dev));
 	i2c->adapter.nr = pdev->id;
 	init_completion(&i2c->completion);
 
-- 
2.20.1

