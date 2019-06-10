Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 122703B105
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 10:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388315AbfFJInF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 04:43:05 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:32893 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388262AbfFJImT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 04:42:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id h19so8493899wme.0
        for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2019 01:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mEH54ZZbXqjz3IZT5KkSbAecLvKUPwRnXivpNaH2j5c=;
        b=a2GG33XgJn18Yol+PHCleaS0zfozddU3pDxE1VGccaW5e5KeVgXCQOZG45tjtfIcaC
         Lxh5LFI6v+7mSVN/0absvabDtYraYaClMC0Tox8yizarBHRZs5MMT7o+bwZAkx+UYwjc
         gn+dIt02WuGoIQ96ZxrJl58wiP7WJ81xUZFPZPNaBg1wxnoIeEYCAxMT/iFUVXuCYnHx
         bgfE+tWRBOGSJHQBya+sXoyJclZs/lcZZa354GRxGDtOM/PZh/447J170T9AjMgOaYBB
         +XsGQbBGjNMw9PD2U4ouSEzKgUYuRFUJi8Zjv+NXPiv+HQ26SXZwRdLnAsvct3gWghyD
         Ugfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mEH54ZZbXqjz3IZT5KkSbAecLvKUPwRnXivpNaH2j5c=;
        b=g7SiMmiwCSWidGGuklh9q9JQ1XWtLa+XYLaUMFEr4R96s0eTyPmatL6MWrT58dhiiU
         HgfgpSEO9QFg6vSrUjV146TNpm2F34q1ovTAbzNzX9VWy1p8ADW4QQb1f8THOia0tGbf
         WUR9B+68aYJnfNjtBumgRNiTLux095AmNR+ESf10IJ5uHz7mGr2vK3gO3UO0Gc+4n/eX
         adlzDFuFSJRO6ehjdo41DrsHGUHQCPSDJLOyA7E1XecyItbJ7y7w+R3/6qv+yykx20c3
         G0HUGhF3JoRhCbJrf/sPlvsEwHSKZgEpCiZBc59obkFrUtPmDWCfl1J7/nWjPcIec7pc
         OpqQ==
X-Gm-Message-State: APjAAAU1LHw25eRy8+8PC37E9aSlcALvCbzf/zu5bH7DXLItN1vEXnuo
        0/91q5d4o15vzp1D976IdfMk+w==
X-Google-Smtp-Source: APXvYqy3EzeyzafpMZj28AeifpAxvXD7SUfAmQ4kAAkAt5yEYM9MwQsajAgi24GxBfJLBR5Hah0Qrg==
X-Received: by 2002:a1c:e356:: with SMTP id a83mr13188870wmh.38.1560156137485;
        Mon, 10 Jun 2019 01:42:17 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a125sm9929670wmf.42.2019.06.10.01.42.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 01:42:17 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Date:   Mon, 10 Jun 2019 09:42:07 +0100
Message-Id: <20190610084213.1052-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610084213.1052-1-lee.jones@linaro.org>
References: <20190610084213.1052-1-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Qualcomm Geni I2C driver currently probes silently which can be
confusing when debugging potential issues.  Add a low level (INFO)
print when each I2C controller is successfully initially set-up.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 9e3b8a98688d..a89bfce5388e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -596,6 +596,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dev_dbg(&pdev->dev, "Geni-I2C adaptor successfully added\n");
+
 	return 0;
 }
 
-- 
2.17.1

