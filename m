Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510851A25E0
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 17:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729799AbgDHPrH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 11:47:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:49522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729703AbgDHPqd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Apr 2020 11:46:33 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11229221F9;
        Wed,  8 Apr 2020 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586360792;
        bh=i3VqmDuLd/n3AsiTO35YTokWcu5+ERCRSqkQNYVNlZI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s54V+P4U6AAJxn0p6r1WqQYfUIE1T58epdBzP5oK9nRBv/+MAyHmm8dIJ69bxmJin
         vthRrKVqPsOUGhuVaOriG7p9hYmdOaeAZS7NbxJqbayuN4MYDU/p1dXIwLueHuZoXc
         dLudP9OXO5v3WeTrka8UJdbAdgxLP0zA9PxWinCM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jMCuM-000cCt-9g; Wed, 08 Apr 2020 17:46:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: [PATCH 33/35] docs: i2c: rename i2c.svg to i2c_bus.svg
Date:   Wed,  8 Apr 2020 17:46:25 +0200
Message-Id: <bb72db28b4b7d867555b345a49703fdca484957e.1586359676.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586359676.git.mchehab+huawei@kernel.org>
References: <cover.1586359676.git.mchehab+huawei@kernel.org>
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

