Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A52C2A1968
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Oct 2020 19:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgJaSUM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Oct 2020 14:20:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:47284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727967AbgJaSUM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Oct 2020 14:20:12 -0400
Received: from localhost.localdomain (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 20204206D5;
        Sat, 31 Oct 2020 18:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604168412;
        bh=WeJM9sqefLyTbec/MpOe67C4HqcW9wc+PbJIX8GXQqo=;
        h=From:To:Cc:Subject:Date:From;
        b=tFb3o3AbvzA/GKzWSwaSam11G2jgvfJ9gPZsU7Y89kQsIop++ogPSUAM/Nnvy6Pld
         opbjTy6WXTGOyBh+o3SgQkbeg9bNbDzWv9MZrAUL5FF3fYdSTfb7KEYILlC2MZBZhr
         U1gX6KBXBRbt/u1QB1s7E8NH2XvieHh+yQ0qykjs=
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 0/3] dt-bindings: yaml conversion of i2c-gate and IIO users
Date:   Sat, 31 Oct 2020 18:17:58 +0000
Message-Id: <20201031181801.742585-1-jic23@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

As part of a general effort to convert all IIO bindings over to yaml,
we need to handle those that specify an i2c-gate.
As such this also includes conversion of the base i2c-gate binding
which is then referenced by the i2c binding files.

Jonathan Cameron (3):
  dt-bindings:i2c:i2c-gate: txt to yaml conversion
  dt-bindings:iio:imu:invensense,mpu6050: txt to yaml conversion
  dt-bindings:iio:gyro:invensense,mpu3050: txt to yaml format
    conversion.

 .../devicetree/bindings/i2c/i2c-gate.txt      |  41 -------
 .../devicetree/bindings/i2c/i2c-gate.yaml     |  52 +++++++++
 .../iio/gyroscope/invensense,mpu3050.txt      |  45 --------
 .../iio/gyroscope/invensense,mpu3050.yaml     |  70 ++++++++++++
 .../bindings/iio/imu/inv_mpu6050.txt          |  67 -----------
 .../bindings/iio/imu/invensense,mpu6050.yaml  | 105 ++++++++++++++++++
 6 files changed, 227 insertions(+), 153 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-gate.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-gate.yaml
 delete mode 100644 Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt
 create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml
 delete mode 100644 Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
 create mode 100644 Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml

-- 
2.28.0

