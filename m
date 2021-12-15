Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 124804757CE
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 12:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236701AbhLOLeN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 06:34:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236693AbhLOLeN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Dec 2021 06:34:13 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6CFC061574
        for <linux-i2c@vger.kernel.org>; Wed, 15 Dec 2021 03:34:13 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id v11so37596610wrw.10
        for <linux-i2c@vger.kernel.org>; Wed, 15 Dec 2021 03:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=42R8HQT1LUvujP8Fmwd0cWD/ZyVvMePdUGtFy6fTXpw=;
        b=Ox6JV/dTrrzrTZVu73OtIE5mHDu79kd4TctBwcfU17pRFSiYUv5ElTDobvOxve1jnz
         u3nx8Hm+3V4TxZEbJdIqp+VNyTjUABbaxfGfnQW//13pThESdfQGPxYTu91hAyrnXSn/
         b7QnQD1fACvBfVSZlrbBeWLy9N7RIe8JKNlDovsJPjbeMMk6TpxKwD47jAGqniGIw8Bh
         ukTCxLzxcCJ44OkQXyNcmHTRooQTxIkCKPMPFmQpI5cXv440W20ljwSHUkkOLmeQkfjd
         t9syLrat2rSmpx55okSKLK7sINrEEAj26D3ev5a269rndH9E72sntwHqaybs2pyuEYYK
         Foqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=42R8HQT1LUvujP8Fmwd0cWD/ZyVvMePdUGtFy6fTXpw=;
        b=DoNI+okvH8Cr0e2zQ7k+Q8YRahBqDRkRgoY+vG9BFifElO3Kiir7aBkq8JYZkiKg4m
         5DzXSfc5FHMf7CzQsU/bIcCBmrBGnxae7rF7tfYLBmbTNBN5dj2WMVcaynO8oENvm3i9
         D5Sbhm1os2oeShd+8vf3bLASTzBToSFacDEoVmlKuK7rLF7nLWIisGBoIsc+nlgThBDZ
         vSzoEeAYBrOuLc7m5dwO+8W6r/SvNuGKgzHus3w32WGonhW8WeJsHPS4oauvBc3TEjKe
         9mDxEKBM6bAO4vqh9Fu63TRf1eA5P/eLxLKIlqbyLegXeYPdUg9z+cgDXZ8NmLJNimnt
         KMnw==
X-Gm-Message-State: AOAM531Om5nFH44vFrFMPB037DqXZHRAZ3bvL0RHT2uGEkdEcrUrOahH
        RNBsLXk3n15NpAB6cedUB5eb+kIBzs4=
X-Google-Smtp-Source: ABdhPJzwZ0S8PDUB+C2uuvou4XaJnBX0SKSWTXGg66h26jNN0YMqZiXg/jBf6i+zjeVDL9ei3uGdGQ==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr4150995wrd.362.1639568051485;
        Wed, 15 Dec 2021 03:34:11 -0800 (PST)
Received: from w7700.local (sgyl-45-b2-v4wan-163690-cust138.vm6.cable.virginm.net. [77.99.130.139])
        by smtp.gmail.com with ESMTPSA id h15sm5687099wmq.32.2021.12.15.03.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 03:34:11 -0800 (PST)
From:   Bruce Duncan <bwduncan@gmail.com>
To:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Cc:     trivial@kernel.org, Bruce Duncan <bwduncan@gmail.com>
Subject: [PATCH] Fix typo, add markup, fix URL in i2c-piix4 docs
Date:   Wed, 15 Dec 2021 11:33:56 +0000
Message-Id: <20211215113356.62982-1-bwduncan@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

http://lm-sensors.org no longer exists,
https://github.com/lm-sensors/lm-sensors/issues/3 suggests using
https://hwmon.wiki.kernel.org/

Signed-off-by: Bruce Duncan <bwduncan@gmail.com>
---
 Documentation/i2c/busses/i2c-piix4.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/i2c/busses/i2c-piix4.rst b/Documentation/i2c/busses/i2c-piix4.rst
index cc9000259223..abe6358ffade 100644
--- a/Documentation/i2c/busses/i2c-piix4.rst
+++ b/Documentation/i2c/busses/i2c-piix4.rst
@@ -64,7 +64,7 @@ correct address for this module, you could get in big trouble (read:
 crashes, data corruption, etc.). Try this only as a last resort (try BIOS
 updates first, for example), and backup first! An even more dangerous
 option is 'force_addr=<IOPORT>'. This will not only enable the PIIX4 like
-'force' foes, but it will also set a new base I/O port address. The SMBus
+'force' does, but it will also set a new base I/O port address. The SMBus
 parts of the PIIX4 needs a range of 8 of these addresses to function
 correctly. If these addresses are already reserved by some other device,
 you will get into big trouble! DON'T USE THIS IF YOU ARE NOT VERY SURE
@@ -86,15 +86,15 @@ If you own Force CPCI735 motherboard or other OSB4 based systems you may need
 to change the SMBus Interrupt Select register so the SMBus controller uses
 the SMI mode.
 
-1) Use lspci command and locate the PCI device with the SMBus controller:
+1) Use ``lspci`` command and locate the PCI device with the SMBus controller:
    00:0f.0 ISA bridge: ServerWorks OSB4 South Bridge (rev 4f)
    The line may vary for different chipsets. Please consult the driver source
-   for all possible PCI ids (and lspci -n to match them). Lets assume the
+   for all possible PCI ids (and ``lspci -n`` to match them). Lets assume the
    device is located at 00:0f.0.
 2) Now you just need to change the value in 0xD2 register. Get it first with
-   command: lspci -xxx -s 00:0f.0
+   command: ``lspci -xxx -s 00:0f.0``
    If the value is 0x3 then you need to change it to 0x1:
-   setpci  -s 00:0f.0 d2.b=1
+   ``setpci  -s 00:0f.0 d2.b=1``
 
 Please note that you don't need to do that in all cases, just when the SMBus is
 not working properly.
@@ -111,4 +111,4 @@ of all affected systems, so the only safe solution was to prevent access to
 the SMBus on all IBM systems (detected using DMI data.)
 
 For additional information, read:
-http://www.lm-sensors.org/browser/lm-sensors/trunk/README
+https://hwmon.wiki.kernel.org
-- 
2.32.0

