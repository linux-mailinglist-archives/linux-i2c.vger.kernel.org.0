Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA8349A68F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 03:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3410236AbiAYCSl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 21:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2363959AbiAXXq1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 18:46:27 -0500
X-Greylist: delayed 137 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 24 Jan 2022 13:41:19 PST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4CAC0417C0;
        Mon, 24 Jan 2022 13:41:19 -0800 (PST)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net [174.21.190.118])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id D963B1E6;
        Mon, 24 Jan 2022 13:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1643060342;
        bh=6xNUxjEcpAPXQtqj2dw1JnrsCyGZcDtUqq17fYGSuBI=;
        h=From:To:Cc:Subject:Date:From;
        b=pDmSmp2iDp20Bo3XfxuH1oDIeCI9ZF3F5yxRmW/4n42hZFQy8/EYtZryCCFfTwpu/
         jcdtrgLDBgM0PDv+h5pfjwB+0IuqWbmE+qZu41AylxmfJ7cCUJt6lkND1ELOODghQO
         cGEIDur1gXxmukKNKkhtEa648nStcWHEpwPzUAT0=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>
Cc:     Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] ic2: mux: pca9541: add delayed-release support
Date:   Mon, 24 Jan 2022 13:38:48 -0800
Message-Id: <20220124213850.3766-1-zev@bewilderbeest.net>
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
a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with LM25066
PMICs behind PCA9541-arbitrated busses, a setting of 10000 (10 ms)
reduces the median latency of reading hwmon sysfs files from 2.28 ms
to 0.99 ms (a 57% improvement).


Thanks,
Zev

Zev Weiss (2):
  i2c: mux: pca9541: add delayed-release support
  dt-bindings: i2c: add nxp,pca9541 release-delay-us property

 .../devicetree/bindings/i2c/nxp,pca9541.txt   | 10 ++++
 drivers/i2c/muxes/i2c-mux-pca9541.c           | 56 ++++++++++++++++---
 2 files changed, 57 insertions(+), 9 deletions(-)

-- 
2.34.1

