Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A145343300A
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 09:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbhJSHte (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 03:49:34 -0400
Received: from smtp2.axis.com ([195.60.68.18]:3156 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230365AbhJSHte (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Oct 2021 03:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634629642;
  x=1666165642;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gvQqvgRehd1oxV4E9VaOG353OV8xOewLauaUhLvPf5E=;
  b=X9m13WolxCPlaBUFaA5aoeXQOFhDP4tGNO3PtFOxNH1osTQfb1xxGIcw
   vduncGO5WPlaYZjynRtVDm31MyssqucePezVWM33XWBLlhh1x9dZ+b3Qn
   ItxeAUPbpTHUUGq3HzZYBoi6391F233UToOzNAgXQcJnLAfB8jzoh2Ziy
   GOTIKQTdgHe7wA9KSjUqy1CWLRtFHyf7HcikPB92QKIoSxTiNDHaBJC6E
   Lcu7W9+KT350tCq2DS96cEVFzIjg3L+do3C1y+3kBKoy0qIYjF+jyWDn6
   o4KF/wv1/2mg9fcXnbzjBi/I1MbBYQ5Bhpard1krveaC8z5q/1P5UxzYt
   g==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <wsa@kernel.org>, <jie.deng@intel.com>, <viresh.kumar@linaro.org>
CC:     <virtualization@lists.linux-foundation.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH 0/2] virtio-i2c: Fix buffer handling
Date:   Tue, 19 Oct 2021 09:46:45 +0200
Message-ID: <20211019074647.19061-1-vincent.whitchurch@axis.com>
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

Vincent Whitchurch (2):
  i2c: virtio: disable timeout handling
  i2c: virtio: fix completion handling

 drivers/i2c/busses/i2c-virtio.c | 46 ++++++++++++++-------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

-- 
2.28.0

