Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1947D228C8C
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 01:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgGUXOJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 19:14:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:34654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgGUXOJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jul 2020 19:14:09 -0400
Received: from embeddedor (unknown [201.162.241.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D318620709;
        Tue, 21 Jul 2020 23:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595373249;
        bh=C7wzDzmy7tK7XLkxQA5wmAAt93j25OvbzqbVQTXvaCU=;
        h=Date:From:To:Cc:Subject:From;
        b=1hm/A+1EB2Q6ed0WBkxvJe0fG/v6fWwqzQFbmCew3uy+GAfGHA90IVtVwCKs3G+zs
         q1DrWExNlJ0oTN/bOFK+km0f0sKShEh2sO5QsxkarI1Z8wWyROQUXSTz+HQ1vT29Xh
         thZQpY19kvU8hsxKkrK4XLz4mnxr6DWGQ9cax7c4=
Date:   Tue, 21 Jul 2020 18:19:46 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH v2][next] i2c: busses: Use fallthrough pseudo-keyword
Message-ID: <20200721231946.GA1705@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1].

[1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Update URL. Use proper URL to Linux v5.7 documentation.
 - Add Jean's Reviewed-by tag.

 drivers/i2c/busses/i2c-amd8111.c | 2 +-
 drivers/i2c/busses/i2c-i801.c    | 8 ++++----
 drivers/i2c/busses/i2c-viapro.c  | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd8111.c b/drivers/i2c/busses/i2c-amd8111.c
index 2b14fef5bf26..34862ad3423e 100644
--- a/drivers/i2c/busses/i2c-amd8111.c
+++ b/drivers/i2c/busses/i2c-amd8111.c
@@ -381,7 +381,7 @@ static s32 amd8111_access(struct i2c_adapter * adap, u16 addr,
 			if (status)
 				return status;
 			len = min_t(u8, len, I2C_SMBUS_BLOCK_MAX);
-			/* fall through */
+			fallthrough;
 		case I2C_SMBUS_I2C_BLOCK_DATA:
 			for (i = 0; i < len; i++) {
 				status = amd_ec_read(smbus, AMD_SMB_DATA + i,
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 1fc7ae77753d..638e7f7c66cc 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1765,19 +1765,19 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	case PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS1:
 	case PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS2:
 		priv->features |= FEATURE_IDF;
-		/* fall through */
+		fallthrough;
 	default:
 		priv->features |= FEATURE_BLOCK_PROC;
 		priv->features |= FEATURE_I2C_BLOCK_READ;
 		priv->features |= FEATURE_IRQ;
-		/* fall through */
+		fallthrough;
 	case PCI_DEVICE_ID_INTEL_82801DB_3:
 		priv->features |= FEATURE_SMBUS_PEC;
 		priv->features |= FEATURE_BLOCK_BUFFER;
-		/* fall through */
+		fallthrough;
 	case PCI_DEVICE_ID_INTEL_82801CA_3:
 		priv->features |= FEATURE_HOST_NOTIFY;
-		/* fall through */
+		fallthrough;
 	case PCI_DEVICE_ID_INTEL_82801BA_2:
 	case PCI_DEVICE_ID_INTEL_82801AB_3:
 	case PCI_DEVICE_ID_INTEL_82801AA_3:
diff --git a/drivers/i2c/busses/i2c-viapro.c b/drivers/i2c/busses/i2c-viapro.c
index 05aa92a3fbe0..970ccdcbb889 100644
--- a/drivers/i2c/busses/i2c-viapro.c
+++ b/drivers/i2c/busses/i2c-viapro.c
@@ -228,7 +228,7 @@ static s32 vt596_access(struct i2c_adapter *adap, u16 addr,
 			goto exit_unsupported;
 		if (read_write == I2C_SMBUS_READ)
 			outb_p(data->block[0], SMBHSTDAT0);
-		/* Fall through */
+		fallthrough;
 	case I2C_SMBUS_BLOCK_DATA:
 		outb_p(command, SMBHSTCMD);
 		if (read_write == I2C_SMBUS_WRITE) {
-- 
2.27.0

