Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0854F3DB2
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 22:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234302AbiDEOIL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 10:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380313AbiDENOB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 09:14:01 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0895E123BE0;
        Tue,  5 Apr 2022 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649160999;
  x=1680696999;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WGpnRbO3Pa93kFXTsPdsfO2hw74rogk5OdNNNdqKnyo=;
  b=qBNyGDzTr2KIP+FVoBPdK+IqSRK2y+sHO88HSPrcQTJTpYPYrRlKZA3A
   4i7oPzidll0KBp2wGYQb+Tv1dM80IqygUG0/WaRADq4JzvPENKFKoZ4f2
   XN4D+tU6A2MmuaJX3tTPh9o4Nkv7zxa4Wo+VHW35zfjsGqbQEph+QwLJB
   7PFdbZKiT/8BgSe58LXHBENUnis4zXxsV872CbSEaEFqkKO1Sv7WBiV3N
   Car90Lx0JUmT0tISW6w2mRWKbK1U6diWhVx4UuoVXwv5Fcuxk+mbQ+rDZ
   ukD48Fn8NRIDZjHCxjfk43o/2BtMh4QkAKtX/8foY/BAWHUu4m/xqIxqv
   A==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] i2c: Allow disabling auto detection via devicetree
Date:   Tue, 5 Apr 2022 14:16:25 +0200
Message-ID: <20220405121627.1560949-1-vincent.whitchurch@axis.com>
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
  i2c: add binding to prevent device detection
  i2c: core: support no-detect property

 Documentation/devicetree/bindings/i2c/i2c.txt | 4 ++++
 drivers/i2c/i2c-core-base.c                   | 8 +++++++-
 include/linux/i2c.h                           | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.34.1

