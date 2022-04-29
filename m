Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84145514A3B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Apr 2022 15:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbiD2NLR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Apr 2022 09:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbiD2NLR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Apr 2022 09:11:17 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537445FBF;
        Fri, 29 Apr 2022 06:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651237678;
  x=1682773678;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uJsOw0YEEsJ2CEhKf3f5//UtbKJYw9da+eeqF/N/AZ0=;
  b=PX4KQlsZU5WvXDJ+45EUT/CBieEFSNyzdaJYbpS4QCDDC/lEZxWyF+Zc
   +G39Ycy6B7zyX9pwA/oRmTgGoIPaUZFUynBxJHKJvvKvLgL4VyaUCAVpn
   J0fm8yL+vPdN6Img9DT01IL0CZDh6IfotyWQF7GPl5r0AZoRvzbUd80PB
   PFhx4em/B5Z2MXsBCTyjd1DXcGICM65zNQZl6YHhb+iPthzV0r12TTSD2
   KdOYlNj6XVluZmLC8Bxlh9Iv5LHXhtp9gVRQ+crDsLHcZOQbfSRNYQJBk
   +OsPPf98LYzbh1fy7JB3OL4V7csy/MYEAVgqJB35G5PiV3Zf0KYMoqYbG
   Q==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/1] i2c: Allow disabling auto detection via devicetree
Date:   Fri, 29 Apr 2022 15:07:48 +0200
Message-ID: <20220429130749.3032462-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v3:
- Drop bindings patch since it has been merged in dt-schema:
  https://github.com/devicetree-org/dt-schema/commit/ba55f96c6d8d
- Reword commit message of i2c patch to indicate that the property is
  documented in dt-schema.

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

To avoid this unnecessary probing and reduce boot time, this series adds
support in the I2C core to allow this feature to be disabled.

Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Vincent Whitchurch (1):
  i2c: core: support no-detect property

 drivers/i2c/i2c-core-base.c | 8 +++++++-
 include/linux/i2c.h         | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.34.1

