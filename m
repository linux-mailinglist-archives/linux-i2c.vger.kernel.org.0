Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC8B44D9C1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 17:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbhKKQHI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 11:07:08 -0500
Received: from smtp1.axis.com ([195.60.68.17]:62896 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233892AbhKKQHH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Nov 2021 11:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636646659;
  x=1668182659;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=11EZ2ZPkaqpcts1rfIERfLSJBeembwtvoHHKNE3fh48=;
  b=KK/9vavd3ZWeUmALc1Dk0b89gHQq1mdyMm4X8LmEs6rAMsslrE/7+3ec
   cw7S7xIF69Mizoc3sb0LDNw7KxcAQoZ+ycROaWISYHI9P8D/0T447s2Hd
   XTlHVA5HT3Sblsusistfgd5e0l9P9t/urZ0FYkA9c5u80Ecm+QVC9h7sa
   krIEPvSyCo1Y1oB9CgIRQo7JK15WS1zn2toKvOTdjLnjP22xIwjmjVcTE
   lFMNJiX4eexOV7Rwibaslux60/ql1ATS/sPrgHtH3Sfuc5ThWM+QTH+F8
   GFcxOAGTGymEom8fCQxNV2D4JSHGJXy0hvWbohIRavBOpMH4HEdi+wmGM
   g==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>, <jie.deng@intel.com>, <viresh.kumar@linaro.org>
CC:     <conghui.chen@intel.com>, <mst@redhat.com>,
        <virtualization@lists.linux-foundation.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH v2 0/2] virtio-i2c: Fix buffer handling
Date:   Thu, 11 Nov 2021 17:04:10 +0100
Message-ID: <20211111160412.11980-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This fixes a couple of bugs in the buffer handling in virtio-i2c which can
result in incorrect data on the I2C bus or memory corruption in the guest.

I tested this on UML (virtio-uml needs a bug fix too, I will sent that out
later) with the device implementation in rust-vmm/vhost-device.

Changes in v2:
- Added Acked-by and Fixes tags

Vincent Whitchurch (2):
  i2c: virtio: disable timeout handling
  i2c: virtio: fix completion handling

 drivers/i2c/busses/i2c-virtio.c | 46 ++++++++++++++-------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

-- 
2.28.0

