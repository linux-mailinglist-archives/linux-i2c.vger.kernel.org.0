Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFA739C25E
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 23:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhFDV35 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 17:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbhFDV3z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 17:29:55 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27CEC061767
        for <linux-i2c@vger.kernel.org>; Fri,  4 Jun 2021 14:27:54 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id s14so7475472pfd.9
        for <linux-i2c@vger.kernel.org>; Fri, 04 Jun 2021 14:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k6+JhCiXHMPptaq8dstrlpJoFisp6qwsWO9lqwpe7Ns=;
        b=JbgRSycJNWnTQTpB1DrYHX598c2UPc0fYDleVX7zCHOXHb9zRZYWferfq+RmtREbVu
         VDI26Ka93DxZ83ESmPBNcdSwPYz8EHR8a5/MVYxG/1Pyev5RSgR4qHWUAEJkEwMGpsU1
         kIfswNPeAdZlSJiNrZrVtqpA8hXVb20upxqU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k6+JhCiXHMPptaq8dstrlpJoFisp6qwsWO9lqwpe7Ns=;
        b=Z8ufjxabC4N/YtcU93g5WsJBqLLJjyXehyBZYM73OKXBhq+MdV55Rr1aPUkfOSlKuL
         7IUd7vfSitLaP/+0rmkL7UFB6USnAIM587T0TnysFJzetKnfRFKNuDbc3IIb2Af+g0Pj
         aRqpvxcEKv1A1gfVkU4nmp0Y2gyDbwisv0RV3DSpcnBqOiTS9XDkEj4CRxHs29P2bzuJ
         Ib16yXwTxX2fubpdR9pr9l6yTtFRagMjWX2R4F3dY8BJQkVCVtBXluRaDzJZbeLy7YNi
         G+UYmI2VrVZCswRP498I9InRbeb5m4K2rjUgli1GiGS9X8r8cnBqt1SzkQ4DqQlq3une
         6EZA==
X-Gm-Message-State: AOAM531ofxrlnuRyE7x/Q/VIjni7754Biyc+Np+icRiNzI757mYEC1Ow
        a/1rXJPxbSlV+gE1mKHMala+WQ==
X-Google-Smtp-Source: ABdhPJxO29hLqt+Eq3Gcu/LLFVxKElptcm5ZWMw2pb+oePPV6ODRTZmOr92ZkhMXQu8JWYbFLy1FUg==
X-Received: by 2002:a63:fc11:: with SMTP id j17mr6749649pgi.355.1622842074427;
        Fri, 04 Jun 2021 14:27:54 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:fb56:4f6a:ea47:556b])
        by smtp.gmail.com with ESMTPSA id k15sm5768043pjf.32.2021.06.04.14.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:27:54 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: core: Disable client irq on reboot/shutdown
Date:   Fri,  4 Jun 2021 14:27:52 -0700
Message-Id: <20210604212752.3547301-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

If an i2c client receives an interrupt during reboot or shutdown it may
be too late to service it by making an i2c transaction on the bus
because the i2c controller has already been shutdown. This can lead to
system hangs if the i2c controller tries to make a transfer that is
doomed to fail because the access to the i2c pins is already shut down,
or an iommu translation has been torn down so i2c controller register
access doesn't work.

Let's simply disable the irq if there isn't a shutdown callback for an
i2c client when there is an irq associated with the device. This will
make sure that irqs don't come in later than the time that we can handle
it. We don't do this if the i2c client device already has a shutdown
callback because presumably they're doing the right thing and quieting
the device so irqs don't come in after the shutdown callback returns.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
[swboyd@chromium.org: Dropped newline, added commit text]
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Dmitry, please add Signed-off-by

This supersedes https://lore.kernel.org/r/20210510220012.2003285-1-swboyd@chromium.org

 drivers/i2c/i2c-core-base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5a97e4a02fa2..7ea5d7cc5974 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -627,6 +627,8 @@ static void i2c_device_shutdown(struct device *dev)
 	driver = to_i2c_driver(dev->driver);
 	if (driver->shutdown)
 		driver->shutdown(client);
+	else if (client->irq > 0)
+		disable_irq(client->irq);
 }
 
 static void i2c_client_dev_release(struct device *dev)

base-commit: 8124c8a6b35386f73523d27eacb71b5364a68c4c
-- 
https://chromeos.dev

