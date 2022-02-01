Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F9F4A53EF
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 01:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbiBAASt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 19:18:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbiBAASs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 19:18:48 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184D9C06173B;
        Mon, 31 Jan 2022 16:18:48 -0800 (PST)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net [174.21.190.118])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 68340407;
        Mon, 31 Jan 2022 16:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1643674726;
        bh=vzPsNjZvndAyHxwYzpRfPbOzW25qWDh7MkzyvlonJCI=;
        h=From:To:Cc:Subject:Date:From;
        b=giilTykb2ELfTcPfC8n/+sJ0g9/UFXKa/W5nrtxv0TvhP63lm8znl5kNWAcGdvfNb
         qoxAzlFBuLgBsjc4UUzLMUH1V+QNdjxN9gvZ7MaHbF+fA7p1a6u/OD11gxEsUweeqe
         rdrvQvXDTuiT8d/pc9TynkRPqKeFXTQtrois/LQU=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>
Cc:     Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Date:   Mon, 31 Jan 2022 16:18:08 -0800
Message-Id: <20220201001810.19516-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

This series adds support for a new pca9541 device-tree property
("release-delay-us"), which delays releasing ownership of the bus
after a transaction for a configurable duration, anticipating that
another transaction may follow shortly.  By avoiding a
release/reacquisition between transactions, this can provide a
substantial performance improvement for back-to-back operations -- on
a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
ms) reduces the median latency the psusensor daemon's hwmon sysfs file
reads from 2.28 ms to 0.99 ms (a 57% improvement).


Thanks,
Zev

Changes since v1 [0]:
 - removed spurious #include line from dt-bindings example

[0] https://lore.kernel.org/linux-i2c/20220124213850.3766-1-zev@bewilderbeest.net/

Zev Weiss (2):
  i2c: mux: pca9541: add delayed-release support
  dt-bindings: i2c: add nxp,pca9541 release-delay-us property

 .../devicetree/bindings/i2c/nxp,pca9541.txt   |  9 +++
 drivers/i2c/muxes/i2c-mux-pca9541.c           | 56 ++++++++++++++++---
 2 files changed, 56 insertions(+), 9 deletions(-)

-- 
2.34.1

