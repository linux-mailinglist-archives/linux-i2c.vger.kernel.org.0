Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F233E30DF
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 23:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238108AbhHFVTe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 17:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238016AbhHFVTe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 17:19:34 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D70C0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 14:19:17 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso9854893wmq.3
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 14:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=As+NizC8ogF5PNDbWVSg8efY2szqjKrHpPIO1Ppqotk=;
        b=AkElhC9XLwQaciNvd30dIlE8pHDIRZ06Hsz9pbdSrT0KZGLMS6bAW23CKrCwWEEn2Z
         /IOV/GQDBsLmZGPPl7KGV671A8eOiYQtx6Vx23yBq/ivxmDPRSukDzkLNKIB50PBJsMy
         l58bUGi16xFMUsbrLyo3CNehsPCEPpE064B9TeXX2+F556avYqliIpRd3REswFBnUPG8
         oXLcuxq1cCbAywzhUdq3fhCsj+Vs8aGl4u/hHjB/m5GRMjuDhYbdDE/OVzTFnaUHGHQ2
         C2LjvBi+pjnKfhQCcbjmqFtqQSZO94ypo/X1N3Ac6H15d6WcMxPrXtuPjAYKXhjbjvQS
         YyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=As+NizC8ogF5PNDbWVSg8efY2szqjKrHpPIO1Ppqotk=;
        b=YfhTOM6N5rpE56EgnlSn7TRQRbbabSxLTxIGUjJgoq6TGdVxJD/7Ki+ws3Fiz4AVvO
         Hvdhf7wLfr0KIDXsWWD2DrZ5jPAsAxkdJ8TNHFSEQ0hgQHkQahybmiegiESaBj8pgs/X
         CZG/bRExsaiadKk6rrFyXcKbXjtfaui4QIK0iYGFuFirIA+w190JxShsfR+ovfKXjJXz
         X+KzaonuSpsilAY/vczZmvV6npPbhR2MKbtM8iAFQ57tUZ8tBv7ZxxRKKc4E2IRjOXyC
         JSaYcSg7bwPyh3JI5U6AahJR7AF7Vw1zgK8gRsGYnOsFhaGOwh7L6zjZSvLj2LvCAh7r
         WY9w==
X-Gm-Message-State: AOAM531JtRU2uVhPgpKOVdKa0Eli69Xa7jueA6Qk/QNwKqCEwKN9oh05
        jeB7hwZ6zEKF/BWemVtM5U1zB4XEezug+A==
X-Google-Smtp-Source: ABdhPJx9erCZ6Z7xUUdCMrPfggFCC0XBwJdfW+TmnizHCVYMmXB0G/Oe1hCKA4+LsR7dSp2zPs8vlA==
X-Received: by 2002:a05:600c:41d3:: with SMTP id t19mr22108491wmh.157.1628284755630;
        Fri, 06 Aug 2021 14:19:15 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id k17sm10801005wrw.53.2021.08.06.14.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 14:19:15 -0700 (PDT)
Subject: [PATCH v2 5/9] i2c: i801: Remove not needed check for
 PCI_COMMAND_INTX_DISABLE
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Message-ID: <9ac8ff4b-3e2a-278d-f7f6-65534b43eec7@gmail.com>
Date:   Fri, 6 Aug 2021 23:15:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

do_pci_enable_device() takes care that PCI_COMMAND_INTX_DISABLE
is cleared if a legacy interrupt is used.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index f56060fcf..7fa06b85f 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1827,19 +1827,12 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		priv->features &= ~FEATURE_IRQ;
 
 	if (priv->features & FEATURE_IRQ) {
-		u16 pcictl, pcists;
+		u16 pcists;
 
 		/* Complain if an interrupt is already pending */
 		pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
 		if (pcists & PCI_STATUS_INTERRUPT)
 			dev_warn(&dev->dev, "An interrupt is pending!\n");
-
-		/* Check if interrupts have been disabled */
-		pci_read_config_word(priv->pci_dev, PCI_COMMAND, &pcictl);
-		if (pcictl & PCI_COMMAND_INTX_DISABLE) {
-			dev_info(&dev->dev, "Interrupts are disabled\n");
-			priv->features &= ~FEATURE_IRQ;
-		}
 	}
 
 	if (priv->features & FEATURE_IRQ) {
-- 
2.32.0


