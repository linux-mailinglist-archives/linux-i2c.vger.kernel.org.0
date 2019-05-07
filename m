Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E7A16664
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 17:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbfEGPPm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 11:15:42 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36814 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbfEGPPl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 May 2019 11:15:41 -0400
Received: by mail-pf1-f193.google.com with SMTP id v80so8827282pfa.3
        for <linux-i2c@vger.kernel.org>; Tue, 07 May 2019 08:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:from:to:subject:date:message-id:in-reply-to:references;
        bh=hsW4nLPXM+q/uY8MZYS1nps05YO+5x2cf5Nbss6qqYE=;
        b=ClkS187gzhi/j1pAPSt6DjelbgpPXv7fjPdfzDV5qJFZvVL/W1eB6MRvaIHMkL1YlF
         pAjVyMroQ4MkU/9oeDSWhJa17pUefKXId6mr8kgz0EEGuZQFP91sS1XfCqcXs47UF9rQ
         7dEymJY2nJgMLXRvZ0fz7wBEFuXsMuNoe8NdOShlmskNuDYYeOiJ8Tzj34QdKU5d8j4r
         ENTIm4l6tM2JOx2x+Lg4mIDkpXINbB8YaavDO/p+RBL4hjLoibx0xK8XVVqWMnaC7MdM
         DOogTingeVjfEUlirlITsKl3ddLCz/Y6H7rIgtRBx0P0UXMf6Ql3bnHCqLwkJSmQ09Of
         PJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references;
        bh=hsW4nLPXM+q/uY8MZYS1nps05YO+5x2cf5Nbss6qqYE=;
        b=FwLZyaVwiWfTlWBDofDQ9fI/k4+64Lcc6APEqqEZ/hKUsYUEIX056GVD57XOdAxVar
         vQwyXcXG4SwP75qC/xOf0iC4wq4R1Rhqs3SvdDwJ+K5R8c6Tzu4FW6aSoTS4DMblpYIf
         VIKFJmKy/KGrFK3nOIs7NaXON+QFjki0AEgOSwr2y5Xu3nIjx9qKI9Cp9SwpEEC0gAZ4
         f0vdUOBxuIxPeuSfWU9wJfWg6zkM8nq7tyEkckT3iN6jKBwaIIIjTYdyhBazywzGV1ji
         9dhbbHmA12XBkO2DgFj1oSOXEYHrAJi5jLsXg56DPAPxgL3rIO8vb4gzx4ZMAHgR1dYD
         pNIQ==
MIME-Version: 1.0
X-Gm-Message-State: APjAAAUakpFrjGUcgOoa8it/mPrj7+FNlMyMS2EajWPz4EAnB/D9paiC
        /lD/DyXPEvbaoQ6YiaZq1YC5qIdV/m60zwvvk2xqthxDKj95b2KUYI1tlDwZI+U4AI3dLcPGFcu
        9MCXcx4Ih0EHmyw==
X-Google-Smtp-Source: APXvYqxmlABOO00POLT4NWe6l6j+ZCfYLjr32u7zp94znUQbwT5xkhl7TAvUrQu4mpR/mTRnSdE+1g==
X-Received: by 2002:aa7:8046:: with SMTP id y6mr42416829pfm.251.1557242140707;
        Tue, 07 May 2019 08:15:40 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id 2sm5397398pgc.49.2019.05.07.08.15.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 May 2019 08:15:40 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 v2 1/3] dt-bindings: i2c: extend existing opencore bindings.
Date:   Tue,  7 May 2019 20:45:06 +0530
Message-Id: <1557242108-13580-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
References: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
Content-Type: text/plain; charset="US-ASCII"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add FU540-C000 specific device tree bindings to already
available i2-ocores file. This device is available on
HiFive Unleashed Rev A00 board.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
index 17bef9a..f6bcf90 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
@@ -2,6 +2,7 @@ Device tree configuration for i2c-ocores
 
 Required properties:
 - compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
+                    "sifive,fu540-c000-i2c" or "sifive,i2c0"
 - reg             : bus address start and address range size of device
 - interrupts      : interrupt number
 - clocks          : handle to the controller clock; see the note below.
@@ -67,3 +68,22 @@ or
 			reg = <0x60>;
 		};
 	};
+or
+	/*
+	  An Opencore based I2C node in FU540-C000 chip from SiFive
+	  This chip has a hardware erratum for broken IRQ
+	  so it's recommended not to define interrupt in the device node
+	*/
+	i2c@10030000 {
+			compatible = "sifive,i2c0","sifive,fu540-c000-i2c";
+			reg = <0x0 0x10030000 0x0 0x1000>;
+			reg-names = "i2c-control";
+			clocks = <&tlclk>;
+			clock-frequency = <100000>;
+
+			reg-shift = <2>;
+			reg-io-width = <1>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+	};
-- 
1.9.1


-- 
The information transmitted is intended only for the person or entity to 
which it is addressed and may contain confidential and/or privileged 
material. If you are not the intended recipient of this message please do 
not read, copy, use or disclose this communication and notify the sender 
immediately. It should be noted that any review, retransmission, 
dissemination or other use of, or taking action or reliance upon, this 
information by persons or entities other than the intended recipient is 
prohibited.
