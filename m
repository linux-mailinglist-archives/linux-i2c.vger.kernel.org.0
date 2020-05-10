Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCC91CCD61
	for <lists+linux-i2c@lfdr.de>; Sun, 10 May 2020 21:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgEJT6a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 May 2020 15:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728071AbgEJT6a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 May 2020 15:58:30 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056A1C061A0C;
        Sun, 10 May 2020 12:58:29 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f23so2862959pgj.4;
        Sun, 10 May 2020 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=uZKTxfpf4WQr90XnNhuD3ishpnxGhqgOmhIo+H3Laqk=;
        b=AUzjo9sLPuAvRnXdzPT3Kc8NUOsQm0jfrAF2blkwHrYFPsROHcqXpscXzY8hV4qEMz
         LpLZXkSZeY/9Owsl0ForKL4OFUhfLlR76RI6fXK1tFpU9j4F6nkvqZ13XRPmNAIEf2my
         dKhvYfa43cJZQHGmKS5f5n65SwkGFJWgxqA1LKrRFhWGdFDz8zcOVGa0M0/9ZguD8YvL
         kW6bPJtRgvIyxTzKJD+Xv0H89DXWsPw/HHxrLedaD2VIgmBIME5gIjEsK4pZeSYv0OTK
         iE38BK0zmG0sZpOym6T4S5W+K+s5lKPmmPf1IWkkjO/AQXUWTaHjAvl9DSd8MCDWbacH
         sLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uZKTxfpf4WQr90XnNhuD3ishpnxGhqgOmhIo+H3Laqk=;
        b=Y0xFsx4ZmuXyQNhA+n7DT/73hWWpGMMmYY2KYcGr2z9BJDY/y+5a+TRJCidjhWFsQi
         exinOYgNRM93IlevkAbFBgxGzxg5JI0A2wFbbHhIPNjyQm6Eedo3xjxSWOSm4HfAvpCh
         OwSg/+YbSeG7zXvYM5394zm+ku7mIvprmDRW8CyQhLqtJ6WYyB5yxB25a2vIsa6wJxzq
         LuuUGZoZHJzjwZ5W/QURIiuQ1346YuvRRYEeLfES5dYXksEWhg1zv/0sM6f0cZMmXE2q
         i6W96TEoxjKfsnCUezBRtfKIYhIfCyuE4Us+9gOmhNasKlLQtOfGjzfQzfX7QYIPd07S
         48UQ==
X-Gm-Message-State: AOAM532LQXDbv+3eJtXpvcGcmbu7uA7R+IGSO/eBgtd0NopdrCy3cHAy
        KDfhFGgvYKx2Ae1iqta87XI=
X-Google-Smtp-Source: ABdhPJw467vS/5Fwn2AHn/9SElCumBSYBKYSMDLeemhy0DbS1zmRMM9peKvlD8YgUaRsNutWVKj56Q==
X-Received: by 2002:a63:3342:: with SMTP id z63mr1479172pgz.49.1589140709345;
        Sun, 10 May 2020 12:58:29 -0700 (PDT)
Received: from pr0gr4m-ubuntu.localdomain ([1.240.193.107])
        by smtp.googlemail.com with ESMTPSA id u9sm7320289pfn.197.2020.05.10.12.58.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 May 2020 12:58:28 -0700 (PDT)
From:   l4stpr0gr4m@gmail.com
To:     trivial@kernel.org
Cc:     nsaenzjulienne@suse.de, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kangmin Park <l4stpr0gr4m@gmail.com>
Subject: [PATCH] docs/devicetree/i2c: brcm,bcm2835: fix node id in example
Date:   Mon, 11 May 2020 04:58:21 +0900
Message-Id: <1589140701-7516-1-git-send-email-l4stpr0gr4m@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kangmin Park <l4stpr0gr4m@gmail.com>

This is a trivial patch to fix node id to match the reg in example.

Signed-off-by: Kangmin Park <l4stpr0gr4m@gmail.com>
---
 Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
index c9a6587..a8a35df 100644
--- a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
@@ -13,7 +13,7 @@ Recommended properties:
 
 Example:
 
-i2c@20205000 {
+i2c@7e205000 {
 	compatible = "brcm,bcm2835-i2c";
 	reg = <0x7e205000 0x1000>;
 	interrupts = <2 21>;
-- 
2.7.4

