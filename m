Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963641F90DB
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 09:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgFOH66 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 03:58:58 -0400
Received: from www.zeus03.de ([194.117.254.33]:49214 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728860AbgFOH6f (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 03:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=zy9ju7B6YlDDHE
        ooLxFkrGU+ZF5mtEjzYhXAsCLKff0=; b=ZJzgOZhC1+clVG+dYzuwHLtkuNQiVP
        8i/w8ENmpvV/PkIYUiMSd68dh45K9gwwZez+JRqlsGtwiuOBU5JQmHZ6QSeJyN5n
        voFrkUqBaQUygGoB3q3sAiJ4H98h2X9CmuN33PdjVxtzISc5SM4r00MoqHF1aF3M
        /HY0LWJP5rrHY=
Received: (qmail 989253 invoked from network); 15 Jun 2020 09:58:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jun 2020 09:58:29 +0200
X-UD-Smtp-Session: l3s3148p1@FhXZyhqoDrYgAwDPXwRdAFnN6pRlEuNX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] video: backlight: tosa_lcd: convert to use i2c_new_client_device()
Date:   Mon, 15 Jun 2020 09:58:13 +0200
Message-Id: <20200615075816.2848-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---

I'd like to push it via I2C for 5.8-rc2.

 drivers/video/backlight/tosa_lcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/tosa_lcd.c b/drivers/video/backlight/tosa_lcd.c
index e8ab583e5098..113116d3585c 100644
--- a/drivers/video/backlight/tosa_lcd.c
+++ b/drivers/video/backlight/tosa_lcd.c
@@ -107,7 +107,7 @@ static void tosa_lcd_tg_on(struct tosa_lcd_data *data)
 	/* TG LCD GVSS */
 	tosa_tg_send(spi, TG_PINICTL, 0x0);
 
-	if (!data->i2c) {
+	if (IS_ERR_OR_NULL(data->i2c)) {
 		/*
 		 * after the pannel is powered up the first time,
 		 * we can access the i2c bus so probe for the DAC
@@ -119,7 +119,7 @@ static void tosa_lcd_tg_on(struct tosa_lcd_data *data)
 			.addr	= DAC_BASE,
 			.platform_data = data->spi,
 		};
-		data->i2c = i2c_new_device(adap, &info);
+		data->i2c = i2c_new_client_device(adap, &info);
 	}
 }
 
-- 
2.27.0

