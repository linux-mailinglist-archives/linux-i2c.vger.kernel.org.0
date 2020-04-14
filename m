Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B86A31A8606
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 18:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440372AbgDNQxw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 12:53:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:55400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440322AbgDNQtP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Apr 2020 12:49:15 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26E0121D90;
        Tue, 14 Apr 2020 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586882943;
        bh=v18zGgJXDcniarmFK/fb0SPUGXtE0+ENUUwwpi/DtwU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZlPZp3Hb89eeuvHOHc9kIUvGyJJFisVziUspxeE/DApQC0TMpnBh7uKbWKuh55dro
         TA6Q5dQWLmccf0srgF1M5KkVJX6cTdwgiyc5z9HpQG6AX6E2TiRff1E8TwRnI9gFqE
         zdZ9Xb2XU7HmLvedWLnT5m7IyQYjPR8b73BsHuTU=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOOk9-0068mx-D0; Tue, 14 Apr 2020 18:49:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: [PATCH v2 26/33] docs: i2c: rename i2c.svg to i2c_bus.svg
Date:   Tue, 14 Apr 2020 18:48:52 +0200
Message-Id: <ecf3d51909ce46b3e84a1df4b36f07d76989e5da.1586881715.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586881715.git.mchehab+huawei@kernel.org>
References: <cover.1586881715.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When generating the PDF output, the Documentation/i2c dir
will generate an i2c.pdf. The same happens with i2c.svg:
it will also produce a file with the same name, at the same dir.

This causes errors when building the PDF output. So, rename the
image to i2c_bus.svg.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Wolfram Sang <wsa@the-dreams.de>
---
 Documentation/i2c/{i2c.svg => i2c_bus.svg} | 2 +-
 Documentation/i2c/summary.rst              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/i2c/{i2c.svg => i2c_bus.svg} (99%)

diff --git a/Documentation/i2c/i2c.svg b/Documentation/i2c/i2c_bus.svg
similarity index 99%
rename from Documentation/i2c/i2c.svg
rename to Documentation/i2c/i2c_bus.svg
index 5979405ad1c3..3170de976373 100644
--- a/Documentation/i2c/i2c.svg
+++ b/Documentation/i2c/i2c_bus.svg
@@ -9,7 +9,7 @@
    xmlns="http://www.w3.org/2000/svg"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
-   sodipodi:docname="i2c.svg"
+   sodipodi:docname="i2c_bus.svg"
    inkscape:version="0.92.3 (2405546, 2018-03-11)"
    version="1.1"
    id="svg2"
diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index ce7230025b33..136c4e333be7 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -34,7 +34,7 @@ Terminology
 Using the terminology from the official documentation, the I2C bus connects
 one or more *master* chips and one or more *slave* chips.
 
-.. kernel-figure::  i2c.svg
+.. kernel-figure::  i2c_bus.svg
    :alt:    Simple I2C bus with one master and 3 slaves
 
    Simple I2C bus
-- 
2.25.2

