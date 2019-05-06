Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D15F14A66
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 14:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfEFM5N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 08:57:13 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46219 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfEFM5N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 08:57:13 -0400
Received: by mail-pl1-f196.google.com with SMTP id bi2so6325322plb.13
        for <linux-i2c@vger.kernel.org>; Mon, 06 May 2019 05:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=UEMFuO/eOkfUtvyg6UNn5h6oENU1qFZHdaBFePFfFNQ=;
        b=AE1PXGLZJecXBOPRAwBuRMnblokvY4Q0jBYbOPQUH9ga6NW/3/iRhy1M0MHq3tbdCX
         uJsgHg/lIEiG1eqxsvpOAbsVrjZ4d1hiKTvsA8UuyG735bRdSD5cepmrQY0TJFFtEss0
         wq7sz+SKcZa17jAwJaviUSTfm9zOEbyO89WD2RPCMpoe6JGbRvL7PMlSyv7owG0Xdz61
         xJHhbCDWt6cYgJH2Om2zDxvsszmaxJ+vEwmAE/8S8yp5pJbAtvq4LzaSKyVeyIZsTkJx
         +5ewBdy38Br3/bkNF36vOwS7Calww1lDF8AYQP9HBkuEOwP44x1agCGai3klUr1BMjjN
         joCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=UEMFuO/eOkfUtvyg6UNn5h6oENU1qFZHdaBFePFfFNQ=;
        b=IL98++al94VfYx9MxCJ6jAUo1k27JZH5iOgMJjGepBoM4ZRl8aX9BNEG+3ZWCh2ntR
         gsrJpK8bhAIEUaiBSTO5xe+tY5Fl+vZg1ebjLY/XFUAeQXhsnfHK+FEl1DF+qx63fI8o
         kmRYWbgvRXLRjtDg/R4vGxP5kYfjlHKBvGyGXCLpm4FSjmzY7sifIJmd1AP1zj5YJgnx
         pXZzA/Ey+7wydKDFmM9JEre4Hb3A9PxadKfenwTfiUE6GnhOf1AfZO0dK1sUxvOBvH0B
         b64mJhEkxvXDv6eM9ZPbWcBqSIeF5XyUZxY04OV3d2xG5xf7imfq1HKxzLCXjEtEXOup
         zF3w==
X-Gm-Message-State: APjAAAXCJuhxdYEHYhYQIGkWF76NSfuEZIhX8XynojpVNDkrkobo7Hk2
        Uu+yYGtmd+BUJFCdHWN8V2GOAw==
X-Google-Smtp-Source: APXvYqwOMXzzUAwPKPtRF+CBlMJBVPfD958G5aEnOG3pjXTVVfmOZ08lmJe4WL3RA/tBI9KTIOPqug==
X-Received: by 2002:a17:902:a503:: with SMTP id s3mr31394556plq.16.1557147432852;
        Mon, 06 May 2019 05:57:12 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id p81sm18031132pfa.26.2019.05.06.05.57.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 06 May 2019 05:57:12 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, palmer@sifive.com,
        paul.walmsley@sifive.com, sagar.kadam@sifive.com,
        peter@korsgaard.com, andrew@lunn.ch, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 v1 1/3] dt-bindings: i2c: add documentation for adding SiFive I2C driver
Date:   Mon,  6 May 2019 18:23:58 +0530
Message-Id: <1557147240-29551-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557147240-29551-1-git-send-email-sagar.kadam@sifive.com>
References: <1557147240-29551-1-git-send-email-sagar.kadam@sifive.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add DT binding for OpenCore's based i2c device as found in
FU540 Chipset on HiFive Unleashed Platform (Rev A00).

The doc explains, how to add DT support for I2C devices.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 .../devicetree/bindings/i2c/i2c-sifive.txt         | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sifive.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sifive.txt b/Documentation/devicetree/bindings/i2c/i2c-sifive.txt
new file mode 100644
index 0000000..2a0fc9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-sifive.txt
@@ -0,0 +1,29 @@
+SiFive I2C controller Device Tree Bindings
+-------------------------------------------------
+
+Required properties:
+
+- compatible		: Should be "sifive,<chipset>-i2c" for a particular chip or
+			  "sifive,i2c<ver>" for a general I2C block.
+			  For FU540 chipset the supported compatible string is "sifive,fu540-c000-i2c".
+- reg			: Physical base address and size of I2C registers map.
+- reg-names		: Should contain the resource reg names.
+- clocks		: Must reference the frequency given to the controller.
+- #address-cells	: Must be '1'.
+- #size-cells		: Must be '0'.
+- clock-frequency	: desired I2C bus clock frequency.
+
+Example:
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

