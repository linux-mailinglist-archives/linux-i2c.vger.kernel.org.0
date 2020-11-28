Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808CF2C726C
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Nov 2020 23:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729884AbgK1VuH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Nov 2020 16:50:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:45756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733170AbgK1SLz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Nov 2020 13:11:55 -0500
Received: from localhost.localdomain (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B1CE246CF;
        Sat, 28 Nov 2020 17:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606584947;
        bh=XUbGegC6h14gbbGkEv2Y2Cvz0Swvml2kOPxl4U52PvQ=;
        h=From:To:Cc:Subject:Date:From;
        b=1/9uGtrajDDQlpbfwwgZEYFJNDFkEibybUmLCk3tpzLkmgzZ+anVycab0/bCHCYL7
         dGeO38T5/jpQCRS7J5HMOQFAFKzaBs3fygdmrxqUIIVz23z+YzFtig8ZK2YDGS8VCE
         /IlMAzDcQdlXbVaP1mdcR+69OcLA3wvqs+SOk7VI=
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 0/3] dt-bindings: yaml conversion of i2c-gate and IIO users
Date:   Sat, 28 Nov 2020 17:33:40 +0000
Message-Id: <20201128173343.390165-1-jic23@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Part of general move of all IIO bindings over to yaml.

Chances since v1.
As Rob suggested, I've move the 2 users over to directly referencing
i2c-controller.yaml.

For the i2c-gate.yaml patch itself, I've kept it on the basis it provides
some central docs of what an i2c-gate actually is.  Now it basically
just provides the node name and reference to i2c-controller.yaml

I've retained Rob's Reviewed-by on basis changes were ones he suggested and
fairly minor in scope.

Now the two IIO patches are separate from the i2c-gate one we can
take them via diferent trees without any problems so unless any issues
come up I'll pick up the two IIO patches in a few days time.

Jonathan Cameron (3):
  dt-bindings:i2c:i2c-gate: txt to yaml conversion
  dt-bindings:iio:imu:invensense,mpu6050: txt to yaml conversion
  dt-bindings:iio:gyro:invensense,mpu3050: txt to yaml format
    conversion.

 .../devicetree/bindings/i2c/i2c-gate.txt      |  41 -------
 .../devicetree/bindings/i2c/i2c-gate.yaml     |  39 +++++++
 .../iio/gyroscope/invensense,mpu3050.txt      |  45 --------
 .../iio/gyroscope/invensense,mpu3050.yaml     |  70 ++++++++++++
 .../bindings/iio/imu/inv_mpu6050.txt          |  67 ------------
 .../bindings/iio/imu/invensense,mpu6050.yaml  | 103 ++++++++++++++++++
 6 files changed, 212 insertions(+), 153 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-gate.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-gate.yaml
 delete mode 100644 Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt
 create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml
 delete mode 100644 Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
 create mode 100644 Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml

-- 
2.29.2

