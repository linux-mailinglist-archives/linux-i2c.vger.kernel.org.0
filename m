Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59C6468AF2
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Dec 2021 14:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233990AbhLENJv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Dec 2021 08:09:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbhLENJu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Dec 2021 08:09:50 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8416C061714
        for <linux-i2c@vger.kernel.org>; Sun,  5 Dec 2021 05:06:23 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id t9so16444877wrx.7
        for <linux-i2c@vger.kernel.org>; Sun, 05 Dec 2021 05:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=VLwsMUqOj7G4ExdmWZxCn/3doJOeymh2K7GzqRcSkV4=;
        b=I7IwYai1JNS7TlQdLv8IgVEzmszgG+8aoVXe3OK8bLAgaDPX83Q83ViYVHZhJsmQTq
         KTJT2pZJkMvqVF7VDW5ZVehj89MzYjUVagRO0nnhaiG8zMs3AbS9rPFpeELaYKUtzz3A
         7pCCoybCxsnQIGQjovdAZ+1cGnHJksbMSrP4Z0gmNN1pFyyQliSJMhXGXxzGNofiFZUS
         xSsRvicYGv/1WHHGY/uOObU/Pg0jYflgKOcuMelbtyKptERCDqA4E6PPkpG8oYwNyAXX
         5madfj1iuJZRFJUrFN3H1hax2Sdf2koMQ2Aq9kb/GpPOmcL4/9HPNMf15lNDHJ4DMkt2
         RJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=VLwsMUqOj7G4ExdmWZxCn/3doJOeymh2K7GzqRcSkV4=;
        b=ZvXslz8oBKAvk8ZyJnQ2kskFN2zeT3vkjjwH2maKVlcDIeS8xX9QWe31wRe6UILQH0
         Nm/9VOvJ3mxOyJN/Pz1qbCV71HkYvVpIyg7ReezDdYkrTJjKptaKsWfXiWGqAMCSJQKb
         JJW2lodGZFv1QbUEIHy+HsBPu0hd7X2c2AvdtDC0Tk76nT5ARExngf8O8+C666u4pRyO
         jUPzOpjV8eUTXc3wOM3F9c4SBlnosDWLEsILj+95Y85z/PNSD/WYtWmix5dEFWOvikkF
         DcUDroy8ZJxC0lUAf6NwwE5K2c9iAkUHPZszngXK5/Rbg3D0XJmm5UKaRlMAxG5M61BZ
         8xjg==
X-Gm-Message-State: AOAM533oamJohv1uDRDa4YC+CWbijpF1gy+k8LIyCfNgGI0IVOhUv2Dh
        zaVVC/9mJ64wboqCKYTOQhN1YPD+IlE=
X-Google-Smtp-Source: ABdhPJzgk55leK/sI7VCRMyRqs/0LROcmssjSWOuguSIivUL8qri4Lh6rbB/n9dyG4f3qkIN46MHLA==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr35985345wrv.11.1638709582376;
        Sun, 05 Dec 2021 05:06:22 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:c00f:8db8:101c:6db1? (p200300ea8f1a0f00c00f8db8101c6db1.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:c00f:8db8:101c:6db1])
        by smtp.googlemail.com with ESMTPSA id g18sm8380982wrv.42.2021.12.05.05.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 05:06:21 -0800 (PST)
Message-ID: <dc2bccc4-9ab6-6c02-da6f-653543dfe1b0@gmail.com>
Date:   Sun, 5 Dec 2021 14:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: make FEATURE_HOST_NOTIFY dependent on FEATURE_IRQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Host notification uses an interrupt, therefore it makes sense only if
interrupts are enabled. Make this dependency explicit by removing
FEATURE_HOST_NOTIFY if FEATURE_IRQ isn't set.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 2d82d989f..5997ba6dd 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1765,6 +1765,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	dev_info(&dev->dev, "SMBus using %s\n",
 		 priv->features & FEATURE_IRQ ? "PCI interrupt" : "polling");
 
+	if (!(priv->features & FEATURE_IRQ))
+		priv->features &= ~FEATURE_HOST_NOTIFY;
+
 	i801_add_tco(priv);
 
 	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
-- 
2.34.1

