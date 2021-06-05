Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492B839C881
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jun 2021 15:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhFENUc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Jun 2021 09:20:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:35294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230110AbhFENU0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Jun 2021 09:20:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2131461449;
        Sat,  5 Jun 2021 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622899118;
        bh=em+TQNX35+RqgCICT3ciJebeGvjixyUOJoALmFOB8Cs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P13YuJveAqmo5nmOve9dn4n4KMER/bkpRTDqeWPj16vvLWPGM5/q6oBeIuRwUOOrb
         Pu1IuLduxu3wmdD/tbYgsRfFIr9OZkuK8PGYEjKnPfxM1u/QDLginYEqi9I8EyL3cQ
         5Yu+WEhg09WUg2g+j8ASOFtqRmboZsXHtYoL52oyI6xH7Kz+1qpQhQaQyI5yDafv40
         q8tjmAZ1/6MpLgXNBq6li5ThylES0BD5KuCtGOqMK642ZglQgZRxsk29u3w19uz//A
         VylPAeiuMt1ZGejKviBmbFTujqiUeaC3Ae2QriGniOtcA6j6r23+y2tm/i8903iRmL
         7/5EmrIKLnyxw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lpWCC-008GFx-BJ; Sat, 05 Jun 2021 15:18:36 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 23/34] docs: i2c: avoid using ReSt :doc:`foo` markup
Date:   Sat,  5 Jun 2021 15:18:22 +0200
Message-Id: <88f7b2e2299cdfba4c3d00d623c852f18650d1bc.1622898327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622898327.git.mchehab+huawei@kernel.org>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

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

