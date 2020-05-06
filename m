Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954B01C7A02
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgEFTPX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728106AbgEFTPX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:15:23 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0676C061A0F;
        Wed,  6 May 2020 12:15:22 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z6so4022767wml.2;
        Wed, 06 May 2020 12:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31+Twvpm+wJvm9CLaO1C4GGE6MTbZd0bjsYnYY8+58g=;
        b=b1t4LlVxG6SPh6niihXkG9PnYIE5j9nvU470HwvJmcepikrRIqEO8vsnew12GOWsIM
         1wkDQIRfqDcuG2EBWw4ssMqXjSV9iAiz61ughWejkcyT4kgusLqzsE+uf2D1ieMoWJ3M
         AzSmBokVQ/yUeOR0rhBGZrnnRCAMv6Cq0kSEsfNGGH40Ttng9oE35OTyt5szzGBPq5SC
         jQny6itq69wYnD4EflpolehIwd45Igu+p3yoOdjlmuS+J+NiwiZ24044rOuXuhLQPvC9
         h9jqoKHfnQ5USZnPeIDvX2tLOY0HCygP/AZFewn6WS+j6ATTJzdrD7T2dHTYMY+FK+E5
         UWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31+Twvpm+wJvm9CLaO1C4GGE6MTbZd0bjsYnYY8+58g=;
        b=lAbCAxZTyPlV04I/QGN9TiE/6GUy/CzmAUyex0nUQ2j2ylo0QWCUTwWw2nnOKpypLE
         bB48Y6fWt8VPWkRlh155hPNzUUl13RMiqk60cDY7/d+Mek8Aa19njR22vFpfO8aclf5a
         cjdsdcDBPhco1T3JZJNQ4LCygFvh0qya8HvlMcgmInevDdAJNcUw3VIRHTurpuHsLa3/
         o1GwLYFf2NFI3zUgjPzsPd5TcxVwO/8Q8kCKw1MM3RRCtUbW2KGAuTG60Q4rnzfl1YSF
         f2BfFKMuutJApF2/IX07S/4ehNVuNTOP5a++cYq3SBiLFBXUpm7Ec9x10HR10GaqX0Nh
         OF0Q==
X-Gm-Message-State: AGi0PuadShK6iSFFOWyeqrATu5b+A4k1fo0YRaRQ5fEWyfdd4iCuvJFO
        8xKQMRj13k4JOfniF951VrY=
X-Google-Smtp-Source: APiQypIjt6Euq1gPXJHlx3WKeUvq4CDqvHUzFL2CWMOiXLu69h709KCFtME3NPyYJKqOuVH49OeeBw==
X-Received: by 2002:a05:600c:2284:: with SMTP id 4mr5745336wmf.97.1588792521425;
        Wed, 06 May 2020 12:15:21 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id a13sm4139058wrv.67.2020.05.06.12.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:15:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: i2c: tegra: Document Tegra210 VI I2C
Date:   Wed,  6 May 2020 21:15:08 +0200
Message-Id: <20200506191511.2791107-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200506191511.2791107-1-thierry.reding@gmail.com>
References: <20200506191511.2791107-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra210 features an instance of the Tegra I2C controller that is
part of the host1x domain and typically used for camera use-cases. It
uses pretty much the same programming model but the registers are laid
out differently.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
index f64064f8bdc2..18c0de362451 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
@@ -35,6 +35,12 @@ Required properties:
 	Due to above changes, Tegra114 I2C driver makes incompatible with
 	previous hardware driver. Hence, tegra114 I2C controller is compatible
 	with "nvidia,tegra114-i2c".
+  nvidia,tegra210-i2c-vi: Tegra210 has one I2C controller that is part of the
+	host1x domain and typically used for camera use-cases. This VI I2C
+	controller is mostly compatible with the programming model of the
+	regular I2C controllers with a few exceptions. The I2C registers start
+	at an offset of 0xc00 (instead of 0), registers are 16 bytes apart
+	(rather than 4) and the controller does not support slave mode.
 - reg: Should contain I2C controller registers physical address and length.
 - interrupts: Should contain I2C controller interrupts.
 - address-cells: Address cells for I2C device address.
-- 
2.24.1

