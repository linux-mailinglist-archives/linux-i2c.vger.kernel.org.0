Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20AA518EB76
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 19:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgCVSUd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 14:20:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36003 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgCVSUd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 Mar 2020 14:20:33 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so7987538wrs.3
        for <linux-i2c@vger.kernel.org>; Sun, 22 Mar 2020 11:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t3apGQx/GqllZ+jV6S8DJb0vx0h2r4kehTlpy1RNFcU=;
        b=Gk0AxS+Gybm8fEoRxAq3N95E77QJRP0db6HjhqDBM6FK88AdXw6V6XcmZMwRdiL082
         zoLzPL95MC67nQWljc0pxZu5mGZxY4iToZCfsEVWXNuNxc7+49IMb8W3IyX0qzeQiPl8
         VJ0XYQhI3ROie5f1lQQjT7GmdGvzsYZ+tttc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t3apGQx/GqllZ+jV6S8DJb0vx0h2r4kehTlpy1RNFcU=;
        b=EzwDHgzKLZ+EsrrRtcUGxAFwLxBVHmSmZjNRKpfTgBI6ZKhmxRsGDpPyugjox6dA2S
         l/adc4sIvobra1Ese7NNzdL95W67fXgJN+Tg8eba9X8uX8nR8ZsgVLtutRg4QkcqRZRm
         85dr6gS/+5VXdan/t1SSN/tCWroFGWvZ8K9SN1z9tfacATA7FTvhZ4ZMdi0VVsMllYUP
         3mXrepYaME+nE1foPNFv+YEq6ILYORhnEksU+CQ7fp3A01SwiHmcl08Q+183b72MIn36
         E/F2pHU15SYGSztAk8Ui75F+7E63dtR6p7KS4sbTZDGfgFBIRZBvVivvG2eJZcUUB3T4
         9r9g==
X-Gm-Message-State: ANhLgQ3dxSC4+0HKhTvqEUc1dAA3GUQBds2xHU9QesaaHLfjdmUHZ2uI
        r0/KbzeW2SZWwHe1YGKHdrCuIg==
X-Google-Smtp-Source: ADFU+vuN11G7CO1C7OcYmWhFxSNN5VvmFXqPfJtw7+8MCIrtSg2PNhWHSoNKE+R4l3s8tIriIiP3Ew==
X-Received: by 2002:adf:a457:: with SMTP id e23mr25054213wra.21.1584901231022;
        Sun, 22 Mar 2020 11:20:31 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id i67sm20157090wri.50.2020.03.22.11.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2020 11:20:30 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Wolfram Sang <wsa@the-dreams.de>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v1 1/1] i2c: iproc: generate stop event for slave writes
Date:   Sun, 22 Mar 2020 23:50:19 +0530
Message-Id: <20200322182019.32493-1-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When slave status is I2C_SLAVE_RX_END, generate I2C_SLAVE_STOP
event to i2c_client.

Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 30efb7913b2e..b58224b7ba79 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -360,6 +360,9 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
 			value = (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
 			i2c_slave_event(iproc_i2c->slave,
 					I2C_SLAVE_WRITE_RECEIVED, &value);
+			if (rx_status == I2C_SLAVE_RX_END)
+				i2c_slave_event(iproc_i2c->slave,
+						I2C_SLAVE_STOP, &value);
 		}
 	} else if (status & BIT(IS_S_TX_UNDERRUN_SHIFT)) {
 		/* Master read other than start */
-- 
2.17.1

