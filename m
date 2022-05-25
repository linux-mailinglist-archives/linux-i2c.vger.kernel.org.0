Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C96095337B5
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 09:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241937AbiEYHsu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 03:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbiEYHsp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 03:48:45 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0FC77F3F;
        Wed, 25 May 2022 00:48:44 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id er5so25906442edb.12;
        Wed, 25 May 2022 00:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qj2qVWqqLCW4wt2qnLg7N/C1U3pSsjcBWbFI/p2DKxo=;
        b=iMCw1g8NbI+EJvFWr/N4GGCYOCmtfzEYCbFiBjG20E7Y3KUNy+YCDeJ817+zWQ/nv3
         6XvytPmWARu0mNA9ZOGXu8ugQ9BIn8L1AO2HT/5Wz3ZEAZPBfG5SxKpYfZbJChHpXomx
         ROPlVZtwqoIZdlXJNtJOhiYxd63dcZlXKI0AW/vDWHkB0d27h5Wr9pTg0dD0SD2znIFo
         IGUxoQiy53lPRE2RftdN///o7+G6m1WfpOl6d2eL/Zp/Zt4X3pDSVwZ69pVPZTq5Hysm
         Z+x7jddj/5yRnlAlKtnBCkL1G7MKEhcLLXyIX+oByDKYVwNnXucf014S5zTu+RMHtDwE
         Rouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qj2qVWqqLCW4wt2qnLg7N/C1U3pSsjcBWbFI/p2DKxo=;
        b=QcYW/Tv8RWnP4zpxUyAj9lc6TkAdPOr5wdBLtG0nf+pAYwm9miuwHDighsYxWg6J1y
         3IZ7J2u1DK9H+P7TSMMhoQZcRpTvPKscZmZENRvg/3VXUjRmeUAC8+5VfeMySSWqyqTk
         GK6Ld+kx4q133Ny5k4/Y35mMRf3o9GsDOn1KAYgVSPMDnwQz7k6gskGosRKm/WbS1A4s
         jW2Ox0sDafUWldMfAM61AstTl/5MbAa+QUN+9LsrjEcj9H6TBkXoawJMYRzBZbZX0lqS
         v+OcXNZUv6rT3mOvuUI4IplVkcdPT4pWJjDj75VdifhkguPz4gwCyD0/uRJKx+vkEEZL
         9iEw==
X-Gm-Message-State: AOAM5312cOVKUPODVLmc+j0e3dC6UhSAD0sRYpQHBNLLHKrjCs+IF+Dq
        p4upwj6TDJ5JZ0uOLKC5x7Q=
X-Google-Smtp-Source: ABdhPJz26cECGka/7zgeIiSFkCp4S4KgagTzg/c1mQ/039Cm0lhzI0oaQemXIJvbRE7ioTqpmneJ4Q==
X-Received: by 2002:aa7:d94b:0:b0:42a:b93b:c54f with SMTP id l11-20020aa7d94b000000b0042ab93bc54fmr32766944eds.246.1653464922551;
        Wed, 25 May 2022 00:48:42 -0700 (PDT)
Received: from localhost.localdomain (109-186-136-71.bb.netvision.net.il. [109.186.136.71])
        by smtp.googlemail.com with ESMTPSA id v1-20020aa7d641000000b0042acd78014esm10230533edr.11.2022.05.25.00.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 00:48:42 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, champagne.guillaume.c@gmail.com,
        mathieu.gallichand@sonatest.com,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v1 1/5] HID: ft260: ft260_xfer_status routine cleanup
Date:   Wed, 25 May 2022 10:47:53 +0300
Message-Id: <20220525074757.7519-2-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525074757.7519-1-michael.zaidman@gmail.com>
References: <20220525074757.7519-1-michael.zaidman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After clarifying with FTDI's support, it turned out that the error condition
(bit 1) in byte 1 of the i2c status HID report is a status bit reflecting all
error conditions. When bits 2, 3, or 4 are raised to 1, bit 1 is set to 1 also.
Since the ft260_xfer_status routine tests the error condition bit and exits
in the case of an error, the program flow never reaches the conditional
expressions for 2, 3, and 4 bits when any of them indicates an error state.
Though these expressions are never evaluated to true, they are checked several
times per IO, increasing the ft260_xfer_status polling cycle duration.

The patch removes the conditional expressions for 2, 3, and 4 bits in byte 1
of the i2c status HID report.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 79505c64dbfe..a35201d68b15 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -313,27 +313,17 @@ static int ft260_xfer_status(struct ft260_device *dev)
 	if (report.bus_status & FT260_I2C_STATUS_CTRL_BUSY)
 		return -EAGAIN;
 
-	if (report.bus_status & FT260_I2C_STATUS_BUS_BUSY)
-		return -EBUSY;
-
-	if (report.bus_status & FT260_I2C_STATUS_ERROR)
+	/*
+	 * The error condition (bit 1) is a status bit reflecting any
+	 * error conditions. When any of the bits 2, 3, or 4 are raised
+	 * to 1, bit 1 is also set to 1.
+	 */
+	if (report.bus_status & FT260_I2C_STATUS_ERROR) {
+		hid_err(hdev, "i2c bus error: %#02x\n", report.bus_status);
 		return -EIO;
+	}
 
-	ret = -EIO;
-
-	if (report.bus_status & FT260_I2C_STATUS_ADDR_NO_ACK)
-		ft260_dbg("unacknowledged address\n");
-
-	if (report.bus_status & FT260_I2C_STATUS_DATA_NO_ACK)
-		ft260_dbg("unacknowledged data\n");
-
-	if (report.bus_status & FT260_I2C_STATUS_ARBITR_LOST)
-		ft260_dbg("arbitration loss\n");
-
-	if (report.bus_status & FT260_I2C_STATUS_CTRL_IDLE)
-		ret = 0;
-
-	return ret;
+	return 0;
 }
 
 static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
@@ -376,7 +366,7 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 			break;
 	} while (--try);
 
-	if (ret == 0 || ret == -EBUSY)
+	if (ret == 0)
 		return 0;
 
 	ft260_i2c_reset(hdev);
-- 
2.25.1

