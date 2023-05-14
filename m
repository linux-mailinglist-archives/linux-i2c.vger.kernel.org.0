Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31C5C701CDF
	for <lists+linux-i2c@lfdr.de>; Sun, 14 May 2023 12:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237348AbjENKhP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 May 2023 06:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237327AbjENKhO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 May 2023 06:37:14 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AABF1715
        for <linux-i2c@vger.kernel.org>; Sun, 14 May 2023 03:37:12 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4QJzT51PsDz9sQZ;
        Sun, 14 May 2023 12:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mariushoch.de;
        s=MBO0001; t=1684060617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=8baYsZfID1cDBWsKQ+Tl9JvjVfWku8D961NRVTSlUC8=;
        b=ZadC+9t9TgwNFdyPDJs52Nh3Db7XuQ2MUO0dApPLjBgxaXfAq90jZ79cXUuhmRXjR7w/x1
        dt5VmcR8JYnx/RfCpMA6oidIRYqwXaCUPsvFqfRtvmXxQMNxNh7OLwuPz3BIjfSE9XPr57
        7UImYbkhp6aVRL+I3jmzPPOCw1Q7WakzlBl+K4nV2DqviLpdaORigx3yPxijgpgjfofKFP
        ExFOwYi5C/vS0ptJdtR9bpLG8uJaGegVb20zwff/s8Wuu2G0pXnV9lPzy+Hl7QOkKl3G5J
        zSEajznveG7jhl5nESHsPVvqqiaDOEggk75B0AKGjmhxTiseQNFwSb59CD72OA==
From:   Marius Hoch <mail@mariushoch.de>
To:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marius Hoch <mail@mariushoch.de>
Subject: [PATCH 0/2] i2c: i801: Force no IRQ for Dell Latitude E7450
Date:   Sun, 14 May 2023 12:36:32 +0200
Message-Id: <20230514103634.235917-1-mail@mariushoch.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4QJzT51PsDz9sQZ
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,NO_DNS_FOR_FROM,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Dell Latitude E7450 uses IRQ 18 for the accelerometer,
but also claims that the SMBus uses IRQ 18. This will
result in:

i801_smbus 0000:00:1f.3: PCI INT C: failed to register GSI
i801_smbus 0000:00:1f.3: Failed to enable SMBus PCI device (-16)
i801_smbus: probe of 0000:00:1f.3 failed with error -16

Force the SMBus IRQ to IRQ_NOTCONNECTED in this case, so that
we fall back to polling, which also seems to be what the (very
dated) Windows 7 drivers on the Dell Latitude E7450 do.

This was tested on Dell Latitude E7450.

I chose to explicitly list all affected devices here, but
alternatively it would be possible to do this programmatically:
If the initial pcim_enable_device fails and we're on (any)
Dell Latitude, re-try with IRQ_NOTCONNECTED.

Marius Hoch (2):
  i2c: i801: Force no IRQ for Dell Latitude E7450
  i2c: i801: Force no IRQ for further Dell Latitudes

 drivers/i2c/busses/i2c-i801.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)


base-commit: cc3c44c9fda264c6d401be04e95449a57c1231c6
-- 
2.40.1

