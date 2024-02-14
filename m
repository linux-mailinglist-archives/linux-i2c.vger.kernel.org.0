Return-Path: <linux-i2c+bounces-1707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9BF854C01
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 16:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A24EB1F215AD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 15:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3805B5B8;
	Wed, 14 Feb 2024 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SnYtJkbz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zdiEosid";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SnYtJkbz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zdiEosid"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D9B5B1F3
	for <linux-i2c@vger.kernel.org>; Wed, 14 Feb 2024 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707922795; cv=none; b=VfqhLRnC3o0fHLQArJ31DdpSkXA/bp0EPSPIh6xg++Qz6oIxipOG4gYaOjnwlVuKj1sBQly9R/QuQUogTCPqOOKV9v2GYgjnK29U/cyqaBnv+CJNJywn7DEMfKub/Y2xZUaCc7B947tZUxKcZyDaull1iBWk6L3fyy3ONlh7G4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707922795; c=relaxed/simple;
	bh=8FlFDJGiyuDb1lJSRuKdK2vunWD4iTZGSovNJiT4uGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IMnIRq0anXGvM5HQoC9CdQeRHEFoBtRK2OXRPygh3KQF9RCg6mGPmxnqKL+AOCJYUqfgU/LNe4AhrplwhL8T9g4gL8jTU3ANqGJQy7hKYUbQ4dirtoWJ5ek1iZIXTfYC5qBkBZqf7pRpGlTPW1zbgJk7GUFO5t7zpyAokOLHfRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SnYtJkbz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zdiEosid; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SnYtJkbz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zdiEosid; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE388220DD;
	Wed, 14 Feb 2024 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707922791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uc3eKSwIvZYbIsASQi8LYx4CaydUYSN+6/MnArSQt6g=;
	b=SnYtJkbzEl2Yv5SWsWPUI+HgaXHF8LK4pvPsXNPx8hWPD/NLvUR/1WHuLaJQcm+6rm994u
	ZGY0AozOSwqoV4rE9cqvWMTC475RTj0C0RgWNT+3EvpwmEv54cDLHc2gZ9GEM4Jid+sNQ2
	wANRjZjox1KDjkwBc/aPOG7uI+5iys8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707922791;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uc3eKSwIvZYbIsASQi8LYx4CaydUYSN+6/MnArSQt6g=;
	b=zdiEosidBa7dnFcf88VbGScKNBVIkyDsspFqDvxnbwKp9lVqQ1/MXtmynz4QYmKKACsRei
	95AxQ2O6Ue3PnpAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707922791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uc3eKSwIvZYbIsASQi8LYx4CaydUYSN+6/MnArSQt6g=;
	b=SnYtJkbzEl2Yv5SWsWPUI+HgaXHF8LK4pvPsXNPx8hWPD/NLvUR/1WHuLaJQcm+6rm994u
	ZGY0AozOSwqoV4rE9cqvWMTC475RTj0C0RgWNT+3EvpwmEv54cDLHc2gZ9GEM4Jid+sNQ2
	wANRjZjox1KDjkwBc/aPOG7uI+5iys8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707922791;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uc3eKSwIvZYbIsASQi8LYx4CaydUYSN+6/MnArSQt6g=;
	b=zdiEosidBa7dnFcf88VbGScKNBVIkyDsspFqDvxnbwKp9lVqQ1/MXtmynz4QYmKKACsRei
	95AxQ2O6Ue3PnpAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88EFC13A72;
	Wed, 14 Feb 2024 14:59:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IBmoGmbVzGXBGwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Wed, 14 Feb 2024 14:59:50 +0000
Date: Wed, 14 Feb 2024 15:59:39 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Piotr Zakowski <piotr.zakowski@intel.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	andi.shyti@kernel.org,
	"Shepon, Oren\"   <oren.shepon@intel.com>, "@imap1.dmz-prg2.suse.org,
	Kozlowski@imap1.dmz-prg2.suse.org, Pawel@imap1.dmz-prg2.suse.org,
	" <pawel.kozlowski@intel.com>,  "@imap1.dmz-prg2.suse.org,
	Usyskin@imap1.dmz-prg2.suse.org, Alexander@imap1.dmz-prg2.suse.org,
	" <alexander.usyskin@intel.com>, "@imap1.dmz-prg2.suse.org,
	Radtke@imap1.dmz-prg2.suse.org, "Jakub\"" <jakub.radtke@intel.com>
Subject: [PATCH] i2c: i801: Fix block process call transactions
Message-ID: <20240214155939.728155bc@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [3.38 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.02)[52.28%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_SOME(0.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,imap1.dmz-prg2.suse.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 FORGED_RECIPIENTS(2.00)[m:@imap1.dmz-prg2.suse.org,m:Kozlowski@imap1.dmz-prg2.suse.org,m:Pawel@imap1.dmz-prg2.suse.org,m:Usyskin@imap1.dmz-prg2.suse.org,m:Alexander@imap1.dmz-prg2.suse.org,m:Radtke@imap1.dmz-prg2.suse.org,s:alexander.usyskin@intel.com,s:oren.shepon@intel.com,s:pawel.kozlowski@intel.com]
X-Spam-Level: ***
X-Spam-Score: 3.38
X-Spam-Flag: NO

According to the Intel datasheets, software must reset the block
buffer index twice for block process call transactions: once before
writing the outgoing data to the buffer, and once again before
reading the incoming data from the buffer.

The driver is currently missing the second reset, causing the wrong
portion of the block buffer to be read.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Reported-by: Piotr Zakowski <piotr.zakowski@intel.com>
Closes: https://lore.kernel.org/linux-i2c/20240213120553.7b0ab120@endymion.delvare/
Fixes: 315cd67c9453 ("i2c: i801: Add Block Write-Block Read Process Call support")
---
Piotr, does this change make your tests succeed?

Alexander, I don't suppose you still have access to the hardware on
which you were using block process call transactions back in 2019, but
maybe you remember having to do the same change to make it work?

 drivers/i2c/busses/i2c-i801.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-6.6.orig/drivers/i2c/busses/i2c-i801.c
+++ linux-6.6/drivers/i2c/busses/i2c-i801.c
@@ -500,11 +500,10 @@ static int i801_block_transaction_by_blo
 	/* Set block buffer mode */
 	outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_E32B, SMBAUXCTL(priv));
 
-	inb_p(SMBHSTCNT(priv)); /* reset the data buffer index */
-
 	if (read_write == I2C_SMBUS_WRITE) {
 		len = data->block[0];
 		outb_p(len, SMBHSTDAT0(priv));
+		inb_p(SMBHSTCNT(priv));	/* reset the data buffer index */
 		for (i = 0; i < len; i++)
 			outb_p(data->block[i+1], SMBBLKDAT(priv));
 	}
@@ -522,6 +521,7 @@ static int i801_block_transaction_by_blo
 		}
 
 		data->block[0] = len;
+		inb_p(SMBHSTCNT(priv));	/* reset the data buffer index */
 		for (i = 0; i < len; i++)
 			data->block[i + 1] = inb_p(SMBBLKDAT(priv));
 	}


-- 
Jean Delvare
SUSE L3 Support

