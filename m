Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B787A3A926C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jun 2021 08:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhFPGaK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Jun 2021 02:30:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:60184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231652AbhFPG3y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Jun 2021 02:29:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EF0661410;
        Wed, 16 Jun 2021 06:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623824868;
        bh=s5phVl8oZV+l0jXJRR0YubysAsYGTgD50ZDKsIxUKuI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tRScV6M/50Olg4gS0FMkV/wbOSXS8Z7VqKNQ89m3V07EqUCwTm5LCQ/daKwmfktGQ
         m/Wh8w52HlfRnzmUJm7+P7ZaGtztc1ovhiZtKuQrB81wmEcwTF4pPzZdzHCQtc9/MU
         cLLR97HhdqfWLoWT+ZTWZzgkzMjoDH5+xWxG92jbMhtkJBjhi4NEECHupt/vuZqBNc
         YD0/Pxc8TDO7HBGn8wzu1++sfLoX6Qkb+8rLryLDCLtZYgvu64zaVLfvAIH65ybmkm
         j1vlRDb1oCRZAvve3v0LKbnK6HY0f1LrBdHPnOYhbhcQp9MfepGRpezcIcQ9schkhY
         sNQbjdXKO4KGA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltP1e-004kJS-Q9; Wed, 16 Jun 2021 08:27:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/29] docs: i2c: avoid using ReST :doc:`foo` markup
Date:   Wed, 16 Jun 2021 08:27:33 +0200
Message-Id: <569722e3f7d73d746c145ea78d2b4fbe5defee90.1623824363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623824363.git.mchehab+huawei@kernel.org>
References: <cover.1623824363.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

Acked-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/i2c/instantiating-devices.rst | 2 +-
 Documentation/i2c/old-module-parameters.rst | 3 ++-
 Documentation/i2c/smbus-protocol.rst        | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/i2c/instantiating-devices.rst b/Documentation/i2c/instantiating-devices.rst
index e558e0a77e0c..890c9360ce19 100644
--- a/Documentation/i2c/instantiating-devices.rst
+++ b/Documentation/i2c/instantiating-devices.rst
@@ -59,7 +59,7 @@ Declare the I2C devices via ACPI
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 ACPI can also describe I2C devices. There is special documentation for this
-which is currently located at :doc:`../firmware-guide/acpi/enumeration`.
+which is currently located at Documentation/firmware-guide/acpi/enumeration.rst.
 
 
 Declare the I2C devices in board files
diff --git a/Documentation/i2c/old-module-parameters.rst b/Documentation/i2c/old-module-parameters.rst
index 38e55829dee8..b08b6daabce9 100644
--- a/Documentation/i2c/old-module-parameters.rst
+++ b/Documentation/i2c/old-module-parameters.rst
@@ -17,7 +17,8 @@ address), ``force`` (to forcibly attach the driver to a given device) and
 With the conversion of the I2C subsystem to the standard device driver
 binding model, it became clear that these per-module parameters were no
 longer needed, and that a centralized implementation was possible. The new,
-sysfs-based interface is described in :doc:`instantiating-devices`, section
+sysfs-based interface is described in
+Documentation/i2c/instantiating-devices.rst, section
 "Method 4: Instantiate from user-space".
 
 Below is a mapping from the old module parameters to the new interface.
diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index 64689d19dd51..9e07e6bbe6a3 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -27,8 +27,8 @@ a different protocol operation entirely.
 Each transaction type corresponds to a functionality flag. Before calling a
 transaction function, a device driver should always check (just once) for
 the corresponding functionality flag to ensure that the underlying I2C
-adapter supports the transaction in question. See :doc:`functionality` for
-the details.
+adapter supports the transaction in question. See
+Documentation/i2c/functionality.rst for the details.
 
 
 Key to symbols
-- 
2.31.1

