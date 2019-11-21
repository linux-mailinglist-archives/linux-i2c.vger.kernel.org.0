Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2B5105BAB
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 22:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfKUVLT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 16:11:19 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:41343 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfKUVLI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 16:11:08 -0500
Received: by mail-il1-f194.google.com with SMTP id q15so4729769ils.8
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2019 13:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JaaCoJhIAtiaGRJbRZpOo5H+WeeydykSc/pOM316fnE=;
        b=j9W+t+RhhqGREioB+OQ4YQdVQIGhvP3WBwyGcA4vwc9LYIpreG+dQ3OFFzMOvHoeKg
         wMnzuQDZ4vZtlZdzjsrJW5KJ00Um9wNNJ2n3pP/AY/1V8ulgXzNqIfXhr+insvuVvueQ
         Sg8hoiZjRai0ym7RscAaVWs4+YhrFdXxkxN34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JaaCoJhIAtiaGRJbRZpOo5H+WeeydykSc/pOM316fnE=;
        b=jv3MU6A/xaSvKHgqV0OOMTwaLH4ZHIlbLlrsksR8RXdTGWhcxsIaIRba5tfr4KX/WA
         KYPZBa4rY8SgG0rN9csJ0iWPxlMw9LxU4XE1NvEpv40SSWiB+iLSCNfaxDSc21T3+huO
         l8S9jo0pZoPOKLQ7OHSkKfjOPWUPiDH55yxuenTbexAa0/ORlmyNUIfDLGhVxqDdj/r/
         ABgzfYVz47SsNgMD19NmC1Dq7oJSTEssLTpBS/HaDx8EflrRgBV50TdBR8Utsoi074az
         cTCUyADX/TCSuRuOTl4OkQahMU9z/ErK0klhCNA1QF0ETxWrZ0tOsUfPCaicANSLk7jr
         6U6Q==
X-Gm-Message-State: APjAAAUqsd01j3JZVua/DPY3G3gDQWvMk/rKElJQCS07lE9ZKPPTVbVt
        6nOUebrT9CgvkZF2mCNypdC8KA==
X-Google-Smtp-Source: APXvYqx6f+E1fUYsCsExoeBanZoyp3t+U17P+h3Absmz+O2Vi3g8wp2lbs11yxfLT0ryA9tfwTFLJQ==
X-Received: by 2002:a92:d64d:: with SMTP id x13mr12005275ilp.54.1574370666741;
        Thu, 21 Nov 2019 13:11:06 -0800 (PST)
Received: from localhost ([2620:15c:183:0:82e0:aef8:11bc:24c4])
        by smtp.gmail.com with ESMTPSA id o184sm1718676ila.45.2019.11.21.13.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2019 13:11:06 -0800 (PST)
From:   Raul E Rangel <rrangel@chromium.org>
To:     enric.balletbo@collabora.com, Wolfram Sang <wsa@the-dreams.de>
Cc:     Akshu.Agrawal@amd.com, Raul E Rangel <rrangel@chromium.org>,
        Akshu Agrawal <akshu.agrawal@amd.com>,
        Guenter Roeck <groeck@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-i2c@vger.kernel.org, Benson Leung <bleung@chromium.org>
Subject: [PATCH 1/4] i2c: i2c-cros-ec-tunnel: Pass ACPI node to i2c adapter
Date:   Thu, 21 Nov 2019 14:10:50 -0700
Message-Id: <20191121140830.1.Iae79baaa31014e8b1d8177bcfbcd41514af724f9@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191121211053.48861-1-rrangel@chromium.org>
References: <20191121211053.48861-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C bus needs to share the same ACPI node as the tunnel device so
that the I2C bus can be referenced from ACPI.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---
I would have added a Fixes annotation, but I wasn't able to find the
hash for https://lore.kernel.org/patchwork/patch/1151436/.

 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 958161c71985..ac2412755f0a 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -272,6 +272,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
 	bus->adap.algo_data = bus;
 	bus->adap.dev.parent = &pdev->dev;
 	bus->adap.dev.of_node = pdev->dev.of_node;
+	ACPI_COMPANION_SET(&bus->adap.dev, ACPI_COMPANION(&pdev->dev));
 	bus->adap.retries = I2C_MAX_RETRIES;
 
 	err = i2c_add_adapter(&bus->adap);
-- 
2.24.0.432.g9d3f5f5b63-goog

