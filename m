Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE80272835
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 16:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgIUOlb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 10:41:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:50906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728054AbgIUOla (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 10:41:30 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9535023718;
        Mon, 21 Sep 2020 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600699290;
        bh=2J1U52HG8jrWz3udJJtL9XCRofpGjS9y2Yu9OK3s4UE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dsS/vIEH9Whsbi0OAVuFT0vI13i95njjHV3D60BW71AP4chWEPcdOaVdAKknUtivw
         8hG0FSJzt9QrGQvblS8gNAYcIVO3fiqsBjBmyYVHZQx3z925VxzRPkFmEjDZHWC4Sx
         lTbelL/9M/lSXT7dvyljyHsB5Ibc90k/4e7XgpCk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Sasha Levin <sashal@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 2/3] i2c: core: Call i2c_acpi_install_space_handler() before i2c_acpi_register_devices()
Date:   Mon, 21 Sep 2020 10:41:26 -0400
Message-Id: <20200921144127.2135896-2-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921144127.2135896-1-sashal@kernel.org>
References: <20200921144127.2135896-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 21653a4181ff292480599dad996a2b759ccf050f ]

Some ACPI i2c-devices _STA method (which is used to detect if the device
is present) use autodetection code which probes which device is present
over i2c. This requires the I2C ACPI OpRegion handler to be registered
before we enumerate i2c-clients under the i2c-adapter.

This fixes the i2c touchpad on the Lenovo ThinkBook 14-IIL and
ThinkBook 15 IIL not getting an i2c-client instantiated and thus not
working.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1842039
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7b961c9c62eff..9f2aa45560e62 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1280,8 +1280,8 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 
 	/* create pre-declared device nodes */
 	of_i2c_register_devices(adap);
-	i2c_acpi_register_devices(adap);
 	i2c_acpi_install_space_handler(adap);
+	i2c_acpi_register_devices(adap);
 
 	if (adap->nr < __i2c_first_dynamic_bus_num)
 		i2c_scan_static_board_info(adap);
-- 
2.25.1

