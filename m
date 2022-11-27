Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90DB5639C4E
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Nov 2022 19:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiK0SYS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Nov 2022 13:24:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiK0SYQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Nov 2022 13:24:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A0C630D
        for <linux-i2c@vger.kernel.org>; Sun, 27 Nov 2022 10:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669573393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=+RM5g/mre2ubyBOq9EMypqDVQ2vwbSLp0Ng/MbyDE7g=;
        b=XrUwWciqI7yvlBH3JgLkllTfzVPJb4AJLnJJ9EeC/DAsy17HqpRnBa+jvj5/x1OaHf0gQB
        inw+5W2NsB6G0VEUZLgsWrOPyJrjBKmaxXSHZXu2aMUK1XtZ63zZgZ+YjEIUFUbDjl9xJK
        fax8f0gbLSriH6uOlvHOM9mIMV2ZcrA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-JmXReBLAMIqJsftBW0jGlA-1; Sun, 27 Nov 2022 13:23:09 -0500
X-MC-Unique: JmXReBLAMIqJsftBW0jGlA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47FE238041CF;
        Sun, 27 Nov 2022 18:23:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.80])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3CCD749BB61;
        Sun, 27 Nov 2022 18:23:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] mfd/i2c/extcon: Add Lenovo Yoga Tab 3 support to cht-wc PMIC code
Date:   Sun, 27 Nov 2022 19:22:54 +0100
Message-Id: <20221127182257.104410-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

These 3 patches add support for the Lenovo Yoga Tab 3 Pro (YT3-X90F) tablet
to the Intel Cherry Trail Whiskey Cove PMIC code.

Patches 2-3 depend on patch 1. Since the modified files almost never see
any changes it is probably best / easiest if the entire series get merged
through the MFD tree.

Wolfgang and MyungJoo or Chanwoo, can you please give your Ack for merging
these through the MFD tree?

Regards,

Hans


Hans de Goede (3):
  mfd: intel_soc_pmic_chtwc: Add Lenovo Yoga Tab 3 X90F to
    intel_cht_wc_models
  i2c: cht-wc: Add charger-chip info for the Lenovo Yoga Tab 3 YT3-X90F
  extcon: intel-cht-wc: Add support for Lenovo Yoga Tab 3 Pro YT3-X90F

 drivers/extcon/extcon-intel-cht-wc.c |  1 +
 drivers/i2c/busses/i2c-cht-wc.c      | 46 ++++++++++++++++++++++++++++
 drivers/mfd/intel_soc_pmic_chtwc.c   |  8 +++++
 include/linux/mfd/intel_soc_pmic.h   |  1 +
 4 files changed, 56 insertions(+)

-- 
2.38.1

