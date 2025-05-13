Return-Path: <linux-i2c+bounces-10961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36852AB5889
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 17:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7E21631E6
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 15:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE1C1C07C3;
	Tue, 13 May 2025 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zbcEM/T8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tstyn6Gc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zbcEM/T8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tstyn6Gc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352D18E1F
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149815; cv=none; b=UVgWB323+7x4LoqhVNniyUFb1h6K2hduUME0QElyDtTDAjE1fGVGH7rzFdrqjjkWyE7nSM5pYKR5kgATzzgefnenK8PvbardxuNRDpjKlQKurEC/kwCHEilkJq/x0KYMamfvjenZW3Vgd7p40Nh0+pBPcWYqypWNtjpsp2r//v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149815; c=relaxed/simple;
	bh=Ha+DSAcYa56blV/JahUy8C9aDqMt9FdTcFAJlzgnj3o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ilI+iyMtR/dacB0v7OmP+apgvtpOGRAR5BRupxU3yE5oZeCBSQECFizxlHtZKeXCixcVM2MN2srNDih10rrfBvPNyMib6FMNliqdyD67qia5gfodoOhUpmkvldCAxei2IbWMjMKFmaW2TrWhQ2MFbvH6raDugSIYGJF/30zxSJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zbcEM/T8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tstyn6Gc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zbcEM/T8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tstyn6Gc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4452B21167;
	Tue, 13 May 2025 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747149811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3WzBCC539pTcmcSa2DGEFww1uqmpXDagzCgmSM1nig=;
	b=zbcEM/T8xcI8L6QRQREd4hwTuY2+lQbpMtPk9JTwh+CViWogtNrLHQrR211EQ9//KIcHML
	2XhkSZ9D/5PhMMEtA9xLPzOT8wbBWYBHCHuMHT/2SmpWkFUhTnFYHRZ13tvHNp1TQ9l7Tx
	i/4LDhxpD+3erEzv+supjXTfkXySHuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747149811;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3WzBCC539pTcmcSa2DGEFww1uqmpXDagzCgmSM1nig=;
	b=tstyn6GcNFV5aGay073/KeQmQdLK/lAgD0SACNZGfCAdvM2Lv/2RZPcJEnAJUZqbz0yGzv
	x+XpbbaI9IVkYHAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747149811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3WzBCC539pTcmcSa2DGEFww1uqmpXDagzCgmSM1nig=;
	b=zbcEM/T8xcI8L6QRQREd4hwTuY2+lQbpMtPk9JTwh+CViWogtNrLHQrR211EQ9//KIcHML
	2XhkSZ9D/5PhMMEtA9xLPzOT8wbBWYBHCHuMHT/2SmpWkFUhTnFYHRZ13tvHNp1TQ9l7Tx
	i/4LDhxpD+3erEzv+supjXTfkXySHuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747149811;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3WzBCC539pTcmcSa2DGEFww1uqmpXDagzCgmSM1nig=;
	b=tstyn6GcNFV5aGay073/KeQmQdLK/lAgD0SACNZGfCAdvM2Lv/2RZPcJEnAJUZqbz0yGzv
	x+XpbbaI9IVkYHAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D65D1365D;
	Tue, 13 May 2025 15:23:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LlQzBfNjI2gcBgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 13 May 2025 15:23:31 +0000
Date: Tue, 13 May 2025 17:23:30 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] i2ctransfer: Prevent msgs[] overflow with many
 parameters
Message-ID: <20250513172330.1b6897d3@endymion>
In-Reply-To: <20250513172119.09548573@endymion>
References: <20250513172119.09548573@endymion>
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
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]

There's an off-by-one bug in the message count check to ensure that we
do not process more messages than the kernel allows. nmsgs points to
the index within msgs[] which would be used for the _next_ message. If
this index is equal the maximum number of messages then we must stop
already.

This closes bug #220112:
https://bugzilla.kernel.org/show_bug.cgi?id=220112

Fixes: 9fc53a7fc669 ("i2c-tools: add new tool 'i2ctransfer'")
Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 tools/i2ctransfer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- i2c-tools.orig/tools/i2ctransfer.c
+++ i2c-tools/tools/i2ctransfer.c
@@ -193,7 +193,7 @@ int main(int argc, char *argv[])
 		__u8 data, *buf;
 		char *end;
 
-		if (nmsgs > I2C_RDRW_IOCTL_MAX_MSGS) {
+		if (nmsgs == I2C_RDRW_IOCTL_MAX_MSGS) {
 			fprintf(stderr, "Error: Too many messages (max: %d)\n",
 				I2C_RDRW_IOCTL_MAX_MSGS);
 			goto err_out;

-- 
Jean Delvare
SUSE L3 Support

