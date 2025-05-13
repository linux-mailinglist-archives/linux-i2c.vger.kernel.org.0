Return-Path: <linux-i2c+bounces-10955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F98FAB53EC
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 13:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6B563AA82B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 11:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EED528C5B5;
	Tue, 13 May 2025 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZRAyz4U1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wpr4sh7Z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZRAyz4U1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wpr4sh7Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3D528851A
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 11:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747136157; cv=none; b=T+eq7Bn7Lahs/2ds2IT4r/2MGsONnqzfFWGSKmKqRqQupEX9rvkxpL7gJty+OBq7a3s+9nsfpCyfz4vk59IS/9tcNYAg62pOkrcwl52R64e4QYYkOrDQlZeIDX3UyfvHU2nNz91PnihTQlT/phtvSZQ42Yo5dibvDfKtJRc44u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747136157; c=relaxed/simple;
	bh=pEx+7KtEuYT6VyCiIxFaDO0Qtf4jlsyoNJBf7q99brA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=czcEtqk0y2lDMwGKfabZN3nj1iLK6Zoe2YJdQKuyUX1AW5IUXgLUZlPMEzc1U2PVEp1Uj6Ot9o0k+spKa7/3m/wepKHJbiPTEWjxx+oLECnxru7il5+DRK43PtX3G9n3u0LXqpzUgk7Zy84shZPribToNpNh2/rG8WkKluWyFOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZRAyz4U1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wpr4sh7Z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZRAyz4U1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wpr4sh7Z; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 481242119D;
	Tue, 13 May 2025 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747136153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=he3Ml/Ho3H9WICYB9GjaoX8hlot79fC2n5kwZ2hN+Lo=;
	b=ZRAyz4U1RLs+Uf11vATyzoRBafIGq2sVNh25b6f8G6g1uBZ3lphDmWbPuSjVCgulqPlsrt
	ptq0B9XnQkpD0iIl5HkLZBR0VnvrOHlq2Bsuhu8IpAD/0A3kfMkNHequTahMhtksbUdK/0
	5sdcx12ZgmpfP8aMo1QOPvbKnlMz120=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747136153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=he3Ml/Ho3H9WICYB9GjaoX8hlot79fC2n5kwZ2hN+Lo=;
	b=Wpr4sh7ZQn2TW6DlzgVDxcqoEBFUXwubofeFZHPFjCZnVLI9RAb/jE87IY81wyV705qzHa
	xXPVMn2LkfJmQeCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZRAyz4U1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Wpr4sh7Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747136153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=he3Ml/Ho3H9WICYB9GjaoX8hlot79fC2n5kwZ2hN+Lo=;
	b=ZRAyz4U1RLs+Uf11vATyzoRBafIGq2sVNh25b6f8G6g1uBZ3lphDmWbPuSjVCgulqPlsrt
	ptq0B9XnQkpD0iIl5HkLZBR0VnvrOHlq2Bsuhu8IpAD/0A3kfMkNHequTahMhtksbUdK/0
	5sdcx12ZgmpfP8aMo1QOPvbKnlMz120=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747136153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=he3Ml/Ho3H9WICYB9GjaoX8hlot79fC2n5kwZ2hN+Lo=;
	b=Wpr4sh7ZQn2TW6DlzgVDxcqoEBFUXwubofeFZHPFjCZnVLI9RAb/jE87IY81wyV705qzHa
	xXPVMn2LkfJmQeCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 194241365D;
	Tue, 13 May 2025 11:35:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NXlEBJkuI2hfNAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 13 May 2025 11:35:53 +0000
Date: Tue, 13 May 2025 13:35:51 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2ctransfer: Don't link with libi2c
Message-ID: <20250513133551.584e4366@endymion>
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
X-Rspamd-Queue-Id: 481242119D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.99 / 50.00];
	BAYES_HAM(-2.98)[99.91%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[renesas];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.99

i2ctransfer doesn't make use of any function from libi2c so it should
not link with that library.

Fixes: 9fc53a7fc669 ("i2c-tools: add new tool 'i2ctransfer'")
Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 tools/Module.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- i2c-tools.orig/tools/Module.mk
+++ i2c-tools/tools/Module.mk
@@ -36,8 +36,8 @@ $(TOOLS_DIR)/i2cset: $(TOOLS_DIR)/i2cset
 $(TOOLS_DIR)/i2cget: $(TOOLS_DIR)/i2cget.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
 
-$(TOOLS_DIR)/i2ctransfer: $(TOOLS_DIR)/i2ctransfer.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
-	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
+$(TOOLS_DIR)/i2ctransfer: $(TOOLS_DIR)/i2ctransfer.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
+	$(CC) $(LDFLAGS) -o $@ $^
 
 #
 # Objects


-- 
Jean Delvare
SUSE L3 Support

