Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2C7234490
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 12:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfFDKpM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 06:45:12 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38720 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbfFDKpJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 06:45:09 -0400
Received: by mail-wr1-f65.google.com with SMTP id d18so15275277wrs.5
        for <linux-i2c@vger.kernel.org>; Tue, 04 Jun 2019 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MkGVFZY1XhtlH3EXbDSeWCPiZrbaYk4zwPdOeyiIsNc=;
        b=hljw8RsTFEcbuplHCj6D4tq/5nIpPFTXoAK24WDaO16R2lM4A4tkIl52AnrPf6JXw1
         gT3EjpICXK9lQrDnqMtsHhdKD3i45MO0tlSwTZkOGsLnygeqnS1GEq42hVT5+HlqpNGw
         T+gYf8t0vIU7HSEAEdNBmet5opXalvHQjYcEdfz/km30EDtQQfXPpL8nTAL5/46rMhak
         gMuexpRELw1yz4AqSHcBpII97mOzlQXjdBv9q9uxJg0vY4L2Wkz4mWfTGT41kUyPjWyf
         oCCUVzTVMMLzv8BuVscDTyHO0HMHqetsCPsptCOLxfHbS+xv6PqNZFqqiN1cTF5Ezas/
         RETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MkGVFZY1XhtlH3EXbDSeWCPiZrbaYk4zwPdOeyiIsNc=;
        b=l8YR4Yzxs/JzpSBOfbFx7A7ffoxGq7t8cdtHP83RtuA6teZQae3npavkhukqlzOYeT
         MVrbgX4+TkkL1a002qtTWMBUIVXCd16C+AG/H9NpfZZHNju02HJgKxzCxanm14Ku9D1g
         YJMGX31l8UUhf8tbNp2iDQMNNzEr2cEiOZUV2Rbei5kV4TRPXMNc/n2FaIw+yrCgM8GG
         p8B7ivggAS4Pz/lnhUIwdpAroYs0y19UATXd2dqwutrMbBuIIshET3/3i90au0Tq/Q/a
         4xLns+Zmxpm8uQa4AsSMoIIUPArzEGgXwaX0G5NRk7CVQa3ntbOb17+imnF7nurTBHIv
         fGXg==
X-Gm-Message-State: APjAAAWb6+Eb9dvZrlbQi06/V0SoFW7Y+5mYtr90BsOpxojNy16D7GB/
        kreWlmh/yMXE49+jEHrrSYkrksp1UUw=
X-Google-Smtp-Source: APXvYqyK+bgytdW+OPwhr0ZBevMVV7NDVd58ezc6owb6wL4UOd2DK/LWci6dPsr3n48XMl5sTrJS0w==
X-Received: by 2002:adf:a38d:: with SMTP id l13mr13613323wrb.187.1559645107190;
        Tue, 04 Jun 2019 03:45:07 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.45.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:45:06 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 8/8] usb: dwc3: qcom: Improve error handling
Date:   Tue,  4 Jun 2019 11:44:55 +0100
Message-Id: <20190604104455.8877-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604104455.8877-1-lee.jones@linaro.org>
References: <20190604104455.8877-1-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dwc3_qcom_clk_init() is called with of_count_phandle_with_args() as an
argument.  If of_count_phandle_with_args() returns an error, the number
of clocks will be a negative value and will lead to undefined behaviour.

Ensure we check for an error before attempting to blindly use the value.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f21fdd6cdd1a..633482926497 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -419,6 +419,9 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	if (!count || ACPI_HANDLE(dev))
 		return 0;
 
+	if (count < 0)
+		return count;
+
 	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
 				  sizeof(struct clk *), GFP_KERNEL);
 	if (!qcom->clks)
-- 
2.17.1

