Return-Path: <linux-i2c+bounces-13050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE53B85342
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 16:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8930F563242
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 14:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45B030CB2F;
	Thu, 18 Sep 2025 14:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v5hv4va1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a4rDMygv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v5hv4va1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a4rDMygv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4602C2E54A8
	for <linux-i2c@vger.kernel.org>; Thu, 18 Sep 2025 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204667; cv=none; b=qfjDEy2k2Z07w+VQpiubGJyumI/F7+NGrV78PhxY/ih+nhMZ9h7INC4pCBc4CbzltbeME2JQmOBGn+vR0AuT5jYXrm080VeXgnpnC/4dDZ3LeqOnSEZ3DEiZXtNXlsgjAuGYcsdDA92ohPH7zWC8Z4BRv7GGqXnnqpC6nSYyV5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204667; c=relaxed/simple;
	bh=QCWvkPTMWCVdtLZpvsKm9jtli3Ila+jCu4wln1UubCI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UT2DKEjmvuqNZ6gbL/doGhUdyZWCzP2RQcBfMxtyRfoOeWDZWYHIxyksvKWAMpArj1Fsu/sx9IemmFXq0IVfXOnBHSbxpqzCy30UmWARiHL/ZtB3prHuziBYjr6BjOsYBql/z9s5mkDkoCPDy9/CUTPso8DHaLW36DVzRtfOsQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v5hv4va1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a4rDMygv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v5hv4va1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a4rDMygv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 489F11F793;
	Thu, 18 Sep 2025 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758204663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7NdJHBgJcYEwgTosWj0DRUatmEeQu09RfggA2/O+dP0=;
	b=v5hv4va1s6dbaSTs+LmrwwaU+k/1x7BMhX9G50u/rkeeMurYOiS/3mdp30JAfK2keZMj/K
	AJBOM4L8+05f/Fe4LbGGdLM6DtE3xNRSGIXOu43Ep1s5hCu8Qpl24mSjpSYyw7CXB64549
	JSRtH3v9CVk3nMHh1E5ayUk7Yv3UpoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758204663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7NdJHBgJcYEwgTosWj0DRUatmEeQu09RfggA2/O+dP0=;
	b=a4rDMygvPiVH8Q6TxyoEFU4co9xH9v5Mmmfjn3edpBS0Zzo1h9Jx8Tz8xSNP0BHgUVt+qb
	cDbrCoMaCVKzfPCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758204663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7NdJHBgJcYEwgTosWj0DRUatmEeQu09RfggA2/O+dP0=;
	b=v5hv4va1s6dbaSTs+LmrwwaU+k/1x7BMhX9G50u/rkeeMurYOiS/3mdp30JAfK2keZMj/K
	AJBOM4L8+05f/Fe4LbGGdLM6DtE3xNRSGIXOu43Ep1s5hCu8Qpl24mSjpSYyw7CXB64549
	JSRtH3v9CVk3nMHh1E5ayUk7Yv3UpoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758204663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7NdJHBgJcYEwgTosWj0DRUatmEeQu09RfggA2/O+dP0=;
	b=a4rDMygvPiVH8Q6TxyoEFU4co9xH9v5Mmmfjn3edpBS0Zzo1h9Jx8Tz8xSNP0BHgUVt+qb
	cDbrCoMaCVKzfPCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 031F113A51;
	Thu, 18 Sep 2025 14:11:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SgdlOvYSzGiPPwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 18 Sep 2025 14:11:02 +0000
Date: Thu, 18 Sep 2025 16:10:54 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti <andi.shyti@kernel.org>
Subject: [PATCH 2/3] i2c: designware: Extend check for mixed slave addresses
Message-ID: <20250918161054.7d650d2c@endymion>
In-Reply-To: <20250918160341.39b66013@endymion>
References: <20250918160341.39b66013@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.80

The i2c-designware driver only supports transfers where all messages
use the same slave address. This condition is currently tested in
i2c_dw_xfer_msg(), with 2 limitations:
* The code only checks the address value, not the 10-bit address
  flag, so it could miss an address change.
* For the AMD Navi GPU devices, the driver uses a dedicated function
  instead of i2c_dw_xfer_msg(), so the check is not performed.

Move the check to the common code path, and add the 10-bit address
flag comparison, to catch and report early if a given transfer is not
supported.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-designware-master.c |   28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

--- linux-6.16.orig/drivers/i2c/busses/i2c-designware-master.c
+++ linux-6.16/drivers/i2c/busses/i2c-designware-master.c
@@ -429,7 +429,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 	struct i2c_msg *msgs = dev->msgs;
 	u32 intr_mask;
 	int tx_limit, rx_limit;
-	u32 addr = msgs[dev->msg_write_idx].addr;
 	u32 buf_len = dev->tx_buf_len;
 	u8 *buf = dev->tx_buf;
 	bool need_restart = false;
@@ -440,18 +439,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 	for (; dev->msg_write_idx < dev->msgs_num; dev->msg_write_idx++) {
 		u32 flags = msgs[dev->msg_write_idx].flags;
 
-		/*
-		 * If target address has changed, we need to
-		 * reprogram the target address in the I2C
-		 * adapter when we are done with this transfer.
-		 */
-		if (msgs[dev->msg_write_idx].addr != addr) {
-			dev_err(dev->dev,
-				"%s: invalid target address\n", __func__);
-			dev->msg_err = -EINVAL;
-			break;
-		}
-
 		if (!(dev->status & STATUS_WRITE_IN_PROGRESS)) {
 			/* new i2c_msg */
 			buf = msgs[dev->msg_write_idx].buf;
@@ -806,10 +793,23 @@ static int
 i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
-	int ret;
+	int ret, i;
 
 	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
 
+	/*
+	 * This driver only supports I2C transfers where all the messages
+	 * use the same address.
+	 */
+	for (i = 1; i < num; i++) {
+		if (msgs[i].addr != msgs[0].addr ||
+		    (msgs[i].flags & I2C_M_TEN) != (msgs[0].flags & I2C_M_TEN)) {
+			dev_err(dev->dev,
+				"Mixed slave addresses not supported\n");
+			return -EOPNOTSUPP;
+		}
+	}
+
 	pm_runtime_get_sync(dev->dev);
 
 	switch (dev->flags & MODEL_MASK) {

-- 
Jean Delvare
SUSE L3 Support

