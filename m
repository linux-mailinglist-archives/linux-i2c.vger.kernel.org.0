Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65FF4FDC2C
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Apr 2022 13:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234928AbiDLKPV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Apr 2022 06:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351665AbiDLJmd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Apr 2022 05:42:33 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD6552B17;
        Tue, 12 Apr 2022 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649753455;
  x=1681289455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m7ImfCfxJIsEMM5gANs7JbpEv6ku2oKMej68m8jLN2A=;
  b=WkwK7RDKsReVLoTLNkeBcj3WXipVJKxJfbYw7cFEWYTbVSxCo3a5Yyhz
   4d1H30sJdFmVUm9U5YdJ/3YLo/D//nq4DHCYQQsEjNnRREeSmuePDi1EE
   uaPzDSAbDX54DFbGwfwcwqqdbLIUqE2nIrVxhOJdh7OE4NirAqoja41Pp
   lYxETcMe7PIj7qWLE7azvE6J3cnexNUD6NzW7E0a15lihjWbt+QJxYpnL
   yCMeQpB6Mp1nfKUCkeTjU3NhAJlEMSCltGDcn9Co0Zz6YGUBF3yl56f29
   GOwbwRPCayLl4OcfSjLBGRgd7x/1dFpnLUnR9A7lM4cFjKv4lj3YWVAJP
   A==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] i2c: Allow disabling auto detection via devicetree
Date:   Tue, 12 Apr 2022 10:50:44 +0200
Message-ID: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v2:
- Change subject prefix of bindings patch
- Reword description of property in bindings patch

When a driver with a ->detect callback (such as lm75) is loaded, the i2c core
performs I2C transactions on the bus to all the addresses listed in that
driver's address_list.  This kind of probing wastes time and as
Documentation/i2c/instantiating-devices.rst says, this method is not
recommended and it is instead advised to list all devices in the devicetree.

However, even if all the devices are listed in the devicetree, there is
currently no way to prevent the core from attempting auto detection short of
patching controller drivers to not pass the I2C_CLASS* bits in adap->class.
The latter is not always possible since generic drivers like i2c-gpio set these
bits.

To avoid this unnecessary probing and reduce boot time, this series adds a
property to the devicetree and support in the I2C core to allow this feature to
be disabled.

Cc: linux-i2c@vger.kernel.org

Cc: devicetree@vger.kernel.org
Cc: krzk+dt@kernel.org
Cc: robh+dt@kernel.org

Cc: linux-kernel@vger.kernel.org

Vincent Whitchurch (2):
  dt-bindings: i2c: add property to avoid device detection
  i2c: core: support no-detect property

 Documentation/devicetree/bindings/i2c/i2c.txt | 4 ++++
 drivers/i2c/i2c-core-base.c                   | 8 +++++++-
 include/linux/i2c.h                           | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.34.1

