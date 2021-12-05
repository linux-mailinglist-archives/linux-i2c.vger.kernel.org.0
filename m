Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F0F468AF3
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Dec 2021 14:06:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233965AbhLENJy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Dec 2021 08:09:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233993AbhLENJy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Dec 2021 08:09:54 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6D0C061714
        for <linux-i2c@vger.kernel.org>; Sun,  5 Dec 2021 05:06:27 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so5715052wme.4
        for <linux-i2c@vger.kernel.org>; Sun, 05 Dec 2021 05:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=ftLAGpRv3fe507siXDqmnEHX0XMcqk9lRowMcT6UJdU=;
        b=WthmTcd2P7TR7SAeeyj4IUw94GIyIp7pkTAGCXrZWQ6s8cIpqjFh/e26VgKQzUV43o
         0d7JXlUCfYAB5eB3kQW02NPM/TW2UxWJHEPdCTXMgWdQVSz8oI2FInb+OgAwZ8GmksiL
         jPnffxRo61jNjriYZS4MJcFc63gi2BaVzAjUBT4qeFbWwjG1nnsxZ9tyPqhP4yOsmRUU
         I3Dty4Z+enHhlkXz5ETjRY+JzGDv1Dhq83+mtAsD9E4fJ/HLh3mQTUgVmEWwu16actfC
         BOg1kfFPLQF7LCP3DTmmjUIgAqV18pLIf/AYV5woaYiJjhEsSZpiguzwtZsOZ36BeY31
         bmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=ftLAGpRv3fe507siXDqmnEHX0XMcqk9lRowMcT6UJdU=;
        b=cjjwoCgpbt2ZJbMPZigQUC5up853vL0EfGu3O/Y6J1grwe8HGDUJNY4zvLcJVjZ87S
         kuCasEBCo0WAD0eLpqvde/efrKMsJvEqvcve5mteHA1uFObyVSDp5QnImoHWoAnwcwYt
         Tgf1bye4OdW+rU+En38z2OLz9mR6GlFJMD7gbcfsH+Lz6NbKOtUQLksLWlQk3lOzkjJc
         zhnPf7H/3FbsxHnUU8F5dU4hk0GT9Hr8w+p2p+tYhFaIQ4N/MK/PFihYET2qrTyJeGJk
         0ESjeiiV6O8JvCOYIXXkPosfMomO7H9LKe0ARgCKPu57eEV3LJ73rxQys+uJkJJ3zLhd
         gm9w==
X-Gm-Message-State: AOAM530dc0kkznH6ZqSv4MJDh7UGzR4EELEL8RDb/klu5QBORrcyo05P
        dMDAM6pn0dw2+mBDipG62C0YibjKln8=
X-Google-Smtp-Source: ABdhPJz+qXCk5weGK6bKMiJe0B5LQK7HBXRXbSFdRggoYbOWj2ufUlYBaiogZOcIq1ZHXjX+zy5iPw==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr31562318wmj.91.1638709585611;
        Sun, 05 Dec 2021 05:06:25 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:c00f:8db8:101c:6db1? (p200300ea8f1a0f00c00f8db8101c6db1.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:c00f:8db8:101c:6db1])
        by smtp.googlemail.com with ESMTPSA id s63sm8862338wme.22.2021.12.05.05.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 05:06:25 -0800 (PST)
Message-ID: <e1e7d400-78c7-5ae9-990e-2b375985b935@gmail.com>
Date:   Sun, 5 Dec 2021 14:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: make FEATURE_BLOCK_PROC dependent on
 FEATURE_BLOCK_BUFFER
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

According to the datasheet the block process call requires block
buffer mode. The user may disable block buffer mode by module
parameter disable_features, in such a case we have to clear
FEATURE_BLOCK_PROC.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 5997ba6dd..a3c19e887 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1684,6 +1684,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 	priv->features &= ~disable_features;
 
+	if (!(priv->features & FEATURE_BLOCK_BUFFER))
+		priv->features &= ~FEATURE_BLOCK_PROC;
+
 	err = pcim_enable_device(dev);
 	if (err) {
 		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",
-- 
2.34.1

