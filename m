Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083B831ECF8
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 18:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233264AbhBRRL0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 12:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbhBRPF4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Feb 2021 10:05:56 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE55EC06178C;
        Thu, 18 Feb 2021 07:05:14 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id a9so1398069plh.8;
        Thu, 18 Feb 2021 07:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HfgXzYXBFwpw+FA5Ggd2qrGjrZ5TTWoL87obfP5C5Z4=;
        b=CLxBnnZ/XGe8XizunrAEYHH/T2/Xxla3oEBSreJJ2McBImlbrrDvpShhSI+cHjC+Ev
         h/FB9VfT+I2YGR6mimtwVc27IIWRy8OOhz5rwy9iv3YhiYr29TriWVSwCuFNYCSDLPO9
         c9fNi/Is3b66Elfj93H6aDmDoKDIo9SU5DVoJszmoLETTSs/lYhQI9OP1mlva46QfUhy
         8Fe7rE05S88cu1r/WsjgS5oUP7gNO28nRAgJg3de9GUZtZqbnBpprZ+7oEA23OPxPqcb
         hBmxJSynmc9ZY/oErjFBTgNIKafbMAcB5zOg4GNrJoo1OoRkeBX091bMZcATPP7HpYxs
         5+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HfgXzYXBFwpw+FA5Ggd2qrGjrZ5TTWoL87obfP5C5Z4=;
        b=YP1nUChvuWDak3DWTAEzrk0qfQwg+Sg3OTgEEyZGIGqUflw3vS4QvjvwcYtcFoKldZ
         yFQ/EkLywGDnY9XrTTdKYcjW2Pj5eB1k0FDOexjtocHk4IDYZt71zWA9JEOLJo6HfaLf
         JjlkjbK6WYEK07BbxKWD3n7I/8nIj6WzDYPQMsPjDHyjs0RChCr8ao6LjjDEm3WZsoA7
         zNzEQ+Z+y+wLlasGxMnRNIftMXdSMjo//boaL4ZIl6XgoF6UiDYMPHWmGkPJNTVQIBK2
         uuxgAUaC5E1eRrpDsKz2D81AZl7kIKdU3H8DRt9XWNhbJ6V0t1j4Sr4uoZ08oKApmT26
         0rkg==
X-Gm-Message-State: AOAM532oV9apscKgbUxdKjn/tVkTUeM4+cRczN4A9w0K/16jcDgS1VWa
        KwosfYvjvU805cB1T1h+lD4=
X-Google-Smtp-Source: ABdhPJwUypqcCpt7WO55p8G28pXwLg5n3cdnovDqmB9PqASguOiNz44al5oQnLB+ybL2ZWp2b/0qnA==
X-Received: by 2002:a17:90b:3689:: with SMTP id mj9mr4394617pjb.99.1613660714315;
        Thu, 18 Feb 2021 07:05:14 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id k31sm6026624pgi.5.2021.02.18.07.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 07:05:13 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v4 2/4] Documentation: devres: Add pcim_alloc_irq_vectors()
Date:   Thu, 18 Feb 2021 23:04:56 +0800
Message-Id: <20210218150458.798347-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210218150458.798347-1-zhengdejin5@gmail.com>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add pcim_alloc_irq_vectors(), a device-managed version of
pci_alloc_irq_vectors(). introducing this function can simplify
the error handling path in many drivers.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v3 -> v4:
	- No change
v2 -> v3:
	- No change
v1 -> v2:
	- Modify some commit messages.
 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index cd8b6e657b94..a52f65b6352f 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -380,6 +380,7 @@ PCI
   devm_pci_alloc_host_bridge()  : managed PCI host bridge allocation
   devm_pci_remap_cfgspace()	: ioremap PCI configuration space
   devm_pci_remap_cfg_resource()	: ioremap PCI configuration space resource
+  pcim_alloc_irq_vectors()      : managed IRQ vectors allocation
   pcim_enable_device()		: after success, all PCI ops become managed
   pcim_pin_device()		: keep PCI device enabled after release
 
-- 
2.25.0

