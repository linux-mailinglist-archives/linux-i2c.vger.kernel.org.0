Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBE3858A2
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 05:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730747AbfHHDmP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 23:42:15 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44202 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730742AbfHHDmP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 23:42:15 -0400
Received: by mail-pf1-f196.google.com with SMTP id t16so43245457pfe.11
        for <linux-i2c@vger.kernel.org>; Wed, 07 Aug 2019 20:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sYG6cpuEWkiuiZSTjJ/tkE2X/s2syaTjG0yfloKLSE0=;
        b=Zqb+cgi2hDsfXgHlecgHReUK5105u+oAXv7BB+DCZY/hMGx1sxb1+EqfxhA1eSd4nU
         T8ave2YfqpukyF0QuRTjjIMXAFtg8LiYpJFs4gEXLcC3R7aRfBBZ9lVDN5XTHA7eWeAS
         SRt87N9Rucv13ptk0JnoNbOxRZx/Oixb5iacg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sYG6cpuEWkiuiZSTjJ/tkE2X/s2syaTjG0yfloKLSE0=;
        b=hi+XQZDsHrOeUmn5GEpQfs8pAFo9Y5ZDcqG8ktC4fo3+90MCbsULXi8ABD0SDV3mMN
         1ADkFcdajTCcF4ei+Wq8zWifL9PT6vsAXJ/ZEXcfFmoUa/chFLjXSkxLm27PBZmEJFRA
         XhFO1mGq/JM0XoHpZ4Kzhv2ud2TMWfnyjAvyTDLDWi5x3FT3W4pLwr71PKCxb0cr7pLk
         sVnr/tZTIKOZaRwSt2vDHXN4OeJyoMqDStCTQs7FMxWU0WZ1QH7P94w1adqZBqROeXNn
         RSBqOJRJZGXHAf/ETLAsjd4/qGpbttGk+MLX4XFkh8hLugezMXYRsKSGWx+o4N4RGipP
         vdgA==
X-Gm-Message-State: APjAAAUZLekZ69IKjKpHYjhe0Ls/p9ToZL2xDfmMkOctY2Ie82mxGNAd
        lizWrPjiB8XOrrT1VFXUxVyoNg==
X-Google-Smtp-Source: APXvYqw0VyrLw6SijXdgxWzGrWGwlkTeqgHtcpsU3gz31hb34TRSE0lX0YnaKNOSEsTbHd6OT+XIfw==
X-Received: by 2002:a63:2b0c:: with SMTP id r12mr10684315pgr.206.1565235734462;
        Wed, 07 Aug 2019 20:42:14 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id y14sm46425482pge.7.2019.08.07.20.42.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 07 Aug 2019 20:42:13 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Ray Jui <ray.jui@broadcom.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>
Subject: [PATCH v1 2/2] i2c: iproc: Add full name of devicetree node to adapter name
Date:   Thu,  8 Aug 2019 09:07:53 +0530
Message-Id: <1565235473-28461-3-git-send-email-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565235473-28461-1-git-send-email-rayagonda.kokatanur@broadcom.com>
References: <1565235473-28461-1-git-send-email-rayagonda.kokatanur@broadcom.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Lori Hikichi <lori.hikichi@broadcom.com>

Add the full name of the devicetree node to the adapter name.
Without this change, all adapters have the same name making it difficult
to distinguish between multiple instances.
The most obvious way to see this is to use the utility i2c_detect.
e.g. "i2c-detect -l"

Before
i2c-1 i2c Broadcom iProc I2C adapter I2C adapter
i2c-0 i2c Broadcom iProc I2C adapter I2C adapter

After
i2c-1 i2c Broadcom iProc (i2c@e0000) I2C adapter
i2c-0 i2c Broadcom iProc (i2c@b0000) I2C adapter

Now it is easy to figure out which adapter maps to a which DT node.

Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 19ef2b0..183b220 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -922,7 +922,9 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 
 	adap = &iproc_i2c->adapter;
 	i2c_set_adapdata(adap, iproc_i2c);
-	strlcpy(adap->name, "Broadcom iProc I2C adapter", sizeof(adap->name));
+	snprintf(adap->name, sizeof(adap->name),
+		"Broadcom iProc (%s)",
+		of_node_full_name(iproc_i2c->device->of_node));
 	adap->algo = &bcm_iproc_algo;
 	adap->quirks = &bcm_iproc_i2c_quirks;
 	adap->dev.parent = &pdev->dev;
-- 
1.9.1

