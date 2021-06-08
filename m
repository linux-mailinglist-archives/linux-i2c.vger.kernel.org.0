Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C950639FABD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 17:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhFHPcX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 11:32:23 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:41750 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhFHPcX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 11:32:23 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 9B0E21FD33;
        Tue,  8 Jun 2021 15:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T/knX/ZSYSUAFmHDG/AaoURfts2vyOMZPDY1Un3fuyI=;
        b=vcC+qIf9VHwDiWtHhu2V3F3KWx5U5V41Ne39gfpC/mDTTRZE/O58iKm0Rsj663iQrq5ixO
        vcSv+3BEHJ7YLXl9iyaHNyEx/gcK2zRwvGGXaIIiyn0J1Sn3fGUWQA2cz/Y7I8FA/BPAAf
        b6Ml+caIrZSh1bX+kvbUvY1L68XzpYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166228;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T/knX/ZSYSUAFmHDG/AaoURfts2vyOMZPDY1Un3fuyI=;
        b=5WBsdbFGv5llM8gl1AYfAf1+ttz1DqpTFtJsNdjVWoDn/7lNE2Jn8BpELy5OItMmETCC8K
        GWWU5MSpRob+6QDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 6A78A118DD;
        Tue,  8 Jun 2021 15:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623166228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T/knX/ZSYSUAFmHDG/AaoURfts2vyOMZPDY1Un3fuyI=;
        b=vcC+qIf9VHwDiWtHhu2V3F3KWx5U5V41Ne39gfpC/mDTTRZE/O58iKm0Rsj663iQrq5ixO
        vcSv+3BEHJ7YLXl9iyaHNyEx/gcK2zRwvGGXaIIiyn0J1Sn3fGUWQA2cz/Y7I8FA/BPAAf
        b6Ml+caIrZSh1bX+kvbUvY1L68XzpYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623166228;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T/knX/ZSYSUAFmHDG/AaoURfts2vyOMZPDY1Un3fuyI=;
        b=5WBsdbFGv5llM8gl1AYfAf1+ttz1DqpTFtJsNdjVWoDn/7lNE2Jn8BpELy5OItMmETCC8K
        GWWU5MSpRob+6QDA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id xMUNGBSNv2AHNAAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Tue, 08 Jun 2021 15:30:28 +0000
Date:   Tue, 8 Jun 2021 17:30:27 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 4/7] i2cdump: Remove dead code
Message-ID: <20210608173027.163e1eec@endymion>
In-Reply-To: <20210608172338.0cf520a1@endymion>
References: <20210608172338.0cf520a1@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Considering that we exit immediately if an error happens during a
block read, the code filling the remaining bytes with -1 so that
they will be displayed as "XX" is effectively dead code, so let's
remove it.

We might want to revisit the whole logic later, as there's in fact
little reason why block read errors would be fatal when all other
read errors are not. But I'd rather remove SMBus block support from
the tool before attempting to clean up the code.

Fixes: 7abc52d7792e ("Return the correct error code on I2C block read failure.")
Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 tools/i2cdump.c |    3 ---
 1 file changed, 3 deletions(-)

--- i2c-tools.orig/tools/i2cdump.c	2021-06-08 14:35:45.372892494 +0200
+++ i2c-tools/tools/i2cdump.c	2021-06-08 14:35:52.271986056 +0200
@@ -360,9 +360,6 @@ int main(int argc, char *argv[])
 				res = 256;
 			for (i = 0; i < res; i++)
 				block[i] = cblock[i];
-			if (size != I2C_SMBUS_BLOCK_DATA)
-				for (i = res; i < 256; i++)
-					block[i] = -1;
 		}
 
 		if (size == I2C_SMBUS_BYTE) {

-- 
Jean Delvare
SUSE L3 Support
