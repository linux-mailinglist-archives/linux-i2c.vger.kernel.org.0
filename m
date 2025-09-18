Return-Path: <linux-i2c+bounces-13049-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA0B852F7
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 16:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C996188D1C5
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 14:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE5830C36A;
	Thu, 18 Sep 2025 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q2FT7Qf+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fDqZ3PaI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DHa8u24B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qpMdlBzM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4572236E0
	for <linux-i2c@vger.kernel.org>; Thu, 18 Sep 2025 14:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204563; cv=none; b=tKjyUPGMXFshuv6VWHtjpG1TsikbvQClCWAw4IrevhE6+fLFWc5WhK9hsB1+TErMNWva5fcGMdSi+hCim5NHmzKLmvmOc0KLOYo+up7PhR0w3zqUBGX2ZcORPPZoLrN41TiUIMjLdMAWHSAA2HYIKDKMNSmAHN5pYh9rt56LnAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204563; c=relaxed/simple;
	bh=WKxtgsVolj+ocCEl6HwJ/VS0q+CbeRKNYiWszIJ/o+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nKQYHZKrhNsaXgXAPEEsPeLFe6CDdmKKYwIMGfdYmniBWFZ3ZIjGi9D/0VLCuFOCGGfeVLlIR7Kq2D2k2nziiuKhakr5BmixSjL0V6t7Vu4IxvVji/lYaD44vvb52dqeDdSgOguxWl6zT0GRBdVOe4aLXF8nYgu6GOgy/pVDv8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q2FT7Qf+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fDqZ3PaI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DHa8u24B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qpMdlBzM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4BA3C3368A;
	Thu, 18 Sep 2025 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758204558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEhA07AHa1hKV8UYSTCJB7AJqn3bdV5WgUkcSVMxN0w=;
	b=q2FT7Qf+nUE06ZaFVXRPUXxHbHX3Vjf+vukhLm334EQivCrV3mRcBcLxsFIwCdxcHsdtqu
	vOOKXqI2XtGhei/giAlipUuNn4fTpnwNDyp0SP7nRJS3j/ZRIchuJn+FnsDgAoxy6GGMYH
	0K7Dyc/q99k0epqWrk9Vpxe/gJgo1Xs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758204558;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEhA07AHa1hKV8UYSTCJB7AJqn3bdV5WgUkcSVMxN0w=;
	b=fDqZ3PaIJExP3HPXXuJQnAI0ChpeF5gYXapZ3kw57PpHtdr6TeWRHKAY/x3M7jq59ECq24
	SO7gLzXvyTYQLHDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DHa8u24B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qpMdlBzM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758204557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEhA07AHa1hKV8UYSTCJB7AJqn3bdV5WgUkcSVMxN0w=;
	b=DHa8u24BwGef5E1CkELLF7REhZryUurEjnXDW9GCLC66TMYNm6elW6ddwxPdmWrI07mD57
	4eWY1nsYukKoSgNhML3pjue4bJls+JIxzAjZapop1PbP+EeuonTgF8yFm8wj7PN3Wj/XG7
	obam5pXAphjkOMJjLgDH+ySfdiKDLEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758204557;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEhA07AHa1hKV8UYSTCJB7AJqn3bdV5WgUkcSVMxN0w=;
	b=qpMdlBzMM3Ut65dbCRI9q3NFZpR5fVC77t44BeiS3+FfS2SjP7tHz9lWFkm71UhPxKeRvf
	7ODY4CRRYIX3HEAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3E5613A51;
	Thu, 18 Sep 2025 14:09:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GOiZOYwSzGjTPgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 18 Sep 2025 14:09:16 +0000
Date: Thu, 18 Sep 2025 16:09:14 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti <andi.shyti@kernel.org>
Subject: [PATCH 1/3] i2c: designware: Use msgs[0] to validate the slave
 address
Message-ID: <20250918160914.47514d3b@endymion>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 4BA3C3368A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01

Function i2c_dw_xfer_init() makes use of dev->msg_write_idx to index
into the array of messages. The purpose is to program the controller
with the slave address.

However, this driver only supports transfers where all messages have
the same address. Therefore checking the first message leads to the
same result, without depending on dev->msg_write_idx having been
initialized elsewhere before.

This function was always called with dev->msg_write_idx == 0 anyway,
so this does not change anything, only makes the intentions clearer
and the code more simple.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-designware-master.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

--- linux-6.16.orig/drivers/i2c/busses/i2c-designware-master.c
+++ linux-6.16/drivers/i2c/busses/i2c-designware-master.c
@@ -254,7 +254,7 @@ static void i2c_dw_xfer_init(struct dw_i
 	__i2c_dw_disable(dev);
 
 	/* If the slave address is ten bit address, enable 10BITADDR */
-	if (msgs[dev->msg_write_idx].flags & I2C_M_TEN) {
+	if (msgs[0].flags & I2C_M_TEN) {
 		ic_con = DW_IC_CON_10BITADDR_MASTER;
 		/*
 		 * If I2C_DYNAMIC_TAR_UPDATE is set, the 10-bit addressing
@@ -272,8 +272,7 @@ static void i2c_dw_xfer_init(struct dw_i
 	 * Set the slave (target) address and enable 10-bit addressing mode
 	 * if applicable.
 	 */
-	regmap_write(dev->map, DW_IC_TAR,
-		     msgs[dev->msg_write_idx].addr | ic_tar);
+	regmap_write(dev->map, DW_IC_TAR, msgs[0].addr | ic_tar);
 
 	/* Enforce disabled interrupts (due to HW issues) */
 	__i2c_dw_write_intr_mask(dev, 0);
@@ -363,7 +362,6 @@ static int amd_i2c_dw_xfer_quirk(struct
 
 	dev->msgs = msgs;
 	dev->msgs_num = num_msgs;
-	dev->msg_write_idx = 0;
 	i2c_dw_xfer_init(dev);
 
 	/* Initiate messages read/write transaction */

-- 
Jean Delvare
SUSE L3 Support

