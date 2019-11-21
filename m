Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68609105BA5
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 22:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfKUVLK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 16:11:10 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:43581 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbfKUVLJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 16:11:09 -0500
Received: by mail-io1-f66.google.com with SMTP id r2so5166954iot.10
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2019 13:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NIYQJr9fbbCFV/H1nH1QpUbw9g4uzM3j04W5jmttbes=;
        b=n+0tWf7qmMYXXyoWrbSeA5TONUe9kSHXDlFA50uVGFGMfZfoUfk8YK7zSI1voPhvx0
         kLoXxV44CupU2IGyA2xa64Cu7xZp1YzlelbcQoN/QuU/oUzk0aU2u7VAXA0DDcrhWPAV
         lbzEEs+jomzyu79PmCxuwvWlzAxY+Llg073qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NIYQJr9fbbCFV/H1nH1QpUbw9g4uzM3j04W5jmttbes=;
        b=LmxP1/QySmZ1STq5YIu2XmuQTYn1E7jKj2k5D5sHwFDTjNs3KmYk/efpZzUebjxE3T
         kHTgbowOzMNfJwoahSkLTwHe7t8Q/C6tzxgyAhKKIxA+uYjtvymOWyyGWKMkvM1bnUMK
         3CrWp4B59kMFhPqTLpzsBjQ0kqU5eATUQSoroVUMfV9RHX5NB0mSZRK+zU10FYz/PbHE
         AzubTkICBQoPAwH7maDiv5X/9HNEdvyXCZKyY5a2PexNDVdDdCN9qnoWIfnd3O+wf6yz
         P5SiYFobqwbYzqBuLyz8NzOUtvtAP3/Hxqp/Wgx1pvoeB+m7CEv0JvmpXRH1FvU5bjVf
         E9mw==
X-Gm-Message-State: APjAAAV9/LhxTs6wQYLHiROarhN0qS9D+hVtniAlUnRPdGjQaNEfUhy2
        YG0EW9U8jRupDISX4BCY+hLq9Q==
X-Google-Smtp-Source: APXvYqwL5wSUSTRyZZJX0FYuJkGddpgdoZj4vpCojO0MGFMh43hs+qlvgGlyJf02hN9UII+WbV1GpQ==
X-Received: by 2002:a5e:a916:: with SMTP id c22mr9834748iod.177.1574370668243;
        Thu, 21 Nov 2019 13:11:08 -0800 (PST)
Received: from localhost ([2620:15c:183:0:82e0:aef8:11bc:24c4])
        by smtp.gmail.com with ESMTPSA id s11sm1710277ilh.54.2019.11.21.13.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2019 13:11:07 -0800 (PST)
From:   Raul E Rangel <rrangel@chromium.org>
To:     enric.balletbo@collabora.com, Wolfram Sang <wsa@the-dreams.de>
Cc:     Akshu.Agrawal@amd.com, Raul E Rangel <rrangel@chromium.org>,
        Akshu Agrawal <akshu.agrawal@amd.com>,
        linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-i2c@vger.kernel.org, dlaurie@chromium.org
Subject: [PATCH 2/4] i2c: i2c-cros-ec-tunnel: Fix ACPI identifier
Date:   Thu, 21 Nov 2019 14:10:51 -0700
Message-Id: <20191121140830.2.I68b9a92ed4def031c3f247d3b49996a2512d762d@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191121211053.48861-1-rrangel@chromium.org>
References: <20191121211053.48861-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The initial patch was using the incorrect identifier.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---
There are currently no boards using the identifier so it's fine to
change it.

 drivers/i2c/busses/i2c-cros-ec-tunnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index ac2412755f0a..5d91e33eb600 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -299,7 +299,7 @@ static const struct of_device_id cros_ec_i2c_of_match[] = {
 MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
 
 static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] = {
-	{ "GOOG001A", 0 },
+	{ "GOOG0012", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cros_ec_i2c_tunnel_acpi_id);
-- 
2.24.0.432.g9d3f5f5b63-goog

