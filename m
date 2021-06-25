Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E7D3B4672
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 17:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbhFYPU0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 11:20:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:55610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229531AbhFYPU0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 11:20:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0736616ED;
        Fri, 25 Jun 2021 15:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624634285;
        bh=gdi4ohvimJrWt9+iKpz6fWdLfTmFpyRNjfQ0SfLkpNs=;
        h=From:To:Cc:Subject:Date:From;
        b=KfqpqGHz+3T0f+zR3CHkfjozZ+B/Bl4nTyahbv5vJ2re0Pfb39kl7SLkc5PLmUxzO
         zW3r9uwLwoz73KlFvoBrq+zXAS77qp7VoLw6N/7e3NSEou1/gisnEzHQBeJYEJLHjY
         ALCijjENcTjbZeED4LrKs47rOxzsJV/1JvBwBV1ttFklcZgHSmK+YezqB13a9GDtmO
         00rbxTFnqvTvkBdfG+X2W1wuJ9GVRN3J2flgLAQQw8tvtg/F0zEQPlx0CzWV1LVz8F
         YiceX6AT2mk4NEfQ0KZPyNLqPT3FWYfEfgrP48ETCadSEvQu5Gc9zcfOxbIegw8YHx
         4nY8c1j+/KsxA==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] i2c: ali1535: mention that the device should not be disabled
Date:   Fri, 25 Jun 2021 17:17:58 +0200
Message-Id: <20210625151758.12180-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The comment from the i801 driver is valid here, too, so copy it.

Reported-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/i2c-ali1535.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index fb93152845f4..ee83c4581bce 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -508,6 +508,11 @@ static void ali1535_remove(struct pci_dev *dev)
 {
 	i2c_del_adapter(&ali1535_adapter);
 	release_region(ali1535_smba, ALI1535_SMB_IOSIZE);
+
+	/*
+	 * do not call pci_disable_device(dev) since it can cause hard hangs on
+	 * some systems during power-off
+	 */
 }
 
 static struct pci_driver ali1535_driver = {
-- 
2.30.2

