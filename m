Return-Path: <linux-i2c+bounces-13079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC2FB8F70F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 10:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 744A918A0386
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 08:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972C82F8BDC;
	Mon, 22 Sep 2025 08:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cf9J5l1h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qUXFT3YY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cf9J5l1h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qUXFT3YY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B49271443
	for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528850; cv=none; b=SJif+GBajHHkOWc55NO5rYTtm8tRXogJPFmTIeBufU83V/gi3s+son28oZhNUnMC64sK1URkUE5mUkN4FaFnk1OSPvPNNRNsQ3C6g1TSmcO1jgUMN+oR6UccN6iWwWCjfIwVcaWCaYw/2U1gcsIowSKLwtuKz/tbKRz8G5KdOtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528850; c=relaxed/simple;
	bh=E3tsAJsTdW25IPslm0bWgAGpDaZGdP7nYdtf0ZQdky0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbae3+ybADu/r87L+0xYtDFDkgcrUysUEVgiXWe2sngFHw9+uQZONZlhxW3RFAM57NGADBokZqetUrOHcJn7rD2bBuipJwy2c23F54Uz3w0Ef5sjtiw+gxuzsjsaKqPofKMv3HBJeqGWYPzVCTIku5QM56Lhya+YonLo1gVW5aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cf9J5l1h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qUXFT3YY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cf9J5l1h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qUXFT3YY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE68C21A5C;
	Mon, 22 Sep 2025 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758528846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYs3DhKXDug9IgkVjgaRSqU5M7HQiCMT50vzFLNahdc=;
	b=cf9J5l1hgPFmrjBWWUghi06BDlGUOomDortshIZkpR2ye2PnyrOp3CM4kAOp0hDMDYSBJj
	UAnWHMwPGZYusUpLuzQmm+eE3F6bduwPmBnZb/luOyfYnooIcDkmu4aTJaSw9Ua3Rv1VgV
	4iP32MOsbPfEBRmYbmhft6qT2b7iYoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758528846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYs3DhKXDug9IgkVjgaRSqU5M7HQiCMT50vzFLNahdc=;
	b=qUXFT3YY6N6v9U9xKU/qYb8zB2N2CoCvNmm+oo22o70hlKEQ609sw/5/PnzBYp3nY6/S3+
	I6AKvLhHmAl3YCCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cf9J5l1h;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qUXFT3YY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758528846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYs3DhKXDug9IgkVjgaRSqU5M7HQiCMT50vzFLNahdc=;
	b=cf9J5l1hgPFmrjBWWUghi06BDlGUOomDortshIZkpR2ye2PnyrOp3CM4kAOp0hDMDYSBJj
	UAnWHMwPGZYusUpLuzQmm+eE3F6bduwPmBnZb/luOyfYnooIcDkmu4aTJaSw9Ua3Rv1VgV
	4iP32MOsbPfEBRmYbmhft6qT2b7iYoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758528846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYs3DhKXDug9IgkVjgaRSqU5M7HQiCMT50vzFLNahdc=;
	b=qUXFT3YY6N6v9U9xKU/qYb8zB2N2CoCvNmm+oo22o70hlKEQ609sw/5/PnzBYp3nY6/S3+
	I6AKvLhHmAl3YCCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63EC01388C;
	Mon, 22 Sep 2025 08:14:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uADlFU4F0WjdDQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 22 Sep 2025 08:14:06 +0000
Date: Mon, 22 Sep 2025 10:14:04 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti <andi.shyti@kernel.org>
Subject: [PATCH 2/3 v2] i2c: designware: Extend check for mixed slave
 addresses
Message-ID: <20250922101404.65f2ef3a@endymion>
In-Reply-To: <20250919191400.29274d5d@endymion>
References: <20250918160341.39b66013@endymion>
	<20250918161054.7d650d2c@endymion>
	<20250919191400.29274d5d@endymion>
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
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: AE68C21A5C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01

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
Changes since v1:
* Use unlikely() to help the compiler minimize the performance penalty.

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
+		if (unlikely(msgs[i].addr != msgs[0].addr ||
+			     (msgs[i].flags & I2C_M_TEN) != (msgs[0].flags & I2C_M_TEN))) {
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

