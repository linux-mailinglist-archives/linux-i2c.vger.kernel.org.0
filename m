Return-Path: <linux-i2c+bounces-10962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F00AB58B6
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 17:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0A70189636E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 15:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A1E227586;
	Tue, 13 May 2025 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s2SGipzf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zVtV7ROT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s2SGipzf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zVtV7ROT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8A91DED53
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150545; cv=none; b=nww6JEtreqL20U2kzxEkBEF6QnLi/mcLH1OoqnzQy63QTbar9a0UIEcUjefSJoouDGTWuOlmxc6EqN89QtdgHvSEmN8mQnUlcUExN0i/Htazx6GmGymO4noNZ1j2A8qtjCn8G3S2pFvarh2sW8+Urda2J7ecE2oehw1dLV2/UAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150545; c=relaxed/simple;
	bh=bWT/BCdw+qUm34nC5rKnvG+Gl0FHRQ8vj5wiihVhGWk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VY3ZMFBAfMKGc3tNbWObt6a3QXnZtLKEFGvZtDKznmJdo1LchwpMI8oNTbzvgkle2g3gQLltaP/pEM280a+bMcrr2g1vooqN3WZsY4ufspRZxAh17WO4JCwa58Ov2Joazt98iK6dVgEGCPL7SwX8Uzdm4lwGuEhZeQi8/tx9+1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s2SGipzf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zVtV7ROT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s2SGipzf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zVtV7ROT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5A55D211E9;
	Tue, 13 May 2025 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747150541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4sMfc3Z8ZfLTRq8dlnMaka00/076dE5KCuFbO7GJezw=;
	b=s2SGipzf4i6vsjaZMZr+kwLIV6wK2EHfkD3YiIcnhyVJRpEpMivVOC0veaFd0IKAMu4Ecf
	1gieLVZ2i7PhvfYX1xJjdnbuDQ1E3jdZKk8iNE02jFTdXzaJWumH7wMkmC4XH1qYKLT1VF
	tssFDCnsDNuLYE2+DJIPvs6rbUWZ8Bg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747150541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4sMfc3Z8ZfLTRq8dlnMaka00/076dE5KCuFbO7GJezw=;
	b=zVtV7ROTw3kmrL1Zhe2Ywr+bdTcj3S5QckIzIF329nrNt0OMOJ2f2Pbd2j/GAEDR63ALi0
	0ijOWjjQ5ae0csBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747150541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4sMfc3Z8ZfLTRq8dlnMaka00/076dE5KCuFbO7GJezw=;
	b=s2SGipzf4i6vsjaZMZr+kwLIV6wK2EHfkD3YiIcnhyVJRpEpMivVOC0veaFd0IKAMu4Ecf
	1gieLVZ2i7PhvfYX1xJjdnbuDQ1E3jdZKk8iNE02jFTdXzaJWumH7wMkmC4XH1qYKLT1VF
	tssFDCnsDNuLYE2+DJIPvs6rbUWZ8Bg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747150541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4sMfc3Z8ZfLTRq8dlnMaka00/076dE5KCuFbO7GJezw=;
	b=zVtV7ROTw3kmrL1Zhe2Ywr+bdTcj3S5QckIzIF329nrNt0OMOJ2f2Pbd2j/GAEDR63ALi0
	0ijOWjjQ5ae0csBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 361C21365D;
	Tue, 13 May 2025 15:35:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NrJAC81mI2gMCgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 13 May 2025 15:35:41 +0000
Date: Tue, 13 May 2025 17:35:39 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] i2ctransfer: Zero out memory passed to ioctl()
Message-ID: <20250513173539.39952965@endymion>
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
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.80

Valgrind complains that uninitialized memory may be passed to
ioctl():

== Syscall param ioctl(I2C_RDWR) points to uninitialised byte(s)
==    at 0x499382B: ioctl (in /lib64/libc.so.6)
==    by 0x401957: main (i2ctransfer.c:343)
==  Address 0x1ffefff94c is on thread 1's stack
==  in frame #1, created by main (i2ctransfer.c:144)
== 
== Syscall param ioctl(I2C_RDWR).msgs points to uninitialised byte(s)
==    at 0x499382B: ioctl (in /lib64/libc.so.6)
==    by 0x401957: main (i2ctransfer.c:343)
==  Address 0x1ffefff956 is on thread 1's stack
==  in frame #1, created by main (i2ctransfer.c:144)

Zero out the i2c_rdwr_ioctl_data struct as well as the msgs array to
guarantee that no uninitialized memory will ever be passed to the
kernel.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
This one is not strictly needed, I can't see any actual bug. However
making valgrind happy seems to be a sane goal, so that we can keep
using it when debugging other issues without getting distracted.
Wolfram, what do you think?

 tools/i2ctransfer.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- i2c-tools.orig/tools/i2ctransfer.c
+++ i2c-tools/tools/i2ctransfer.c
@@ -149,8 +149,7 @@ int main(int argc, char *argv[])
 	enum parse_state state = PARSE_GET_DESC;
 	unsigned int buf_idx = 0;
 
-	for (i = 0; i < I2C_RDRW_IOCTL_MAX_MSGS; i++)
-		msgs[i].buf = NULL;
+	memset(msgs, 0, sizeof(msgs));
 
 	/* handle (optional) flags first */
 	while ((opt = getopt(argc, argv, "abfhvVy")) != -1) {
@@ -334,6 +333,7 @@ int main(int argc, char *argv[])
 		struct i2c_rdwr_ioctl_data rdwr;
 		unsigned int print_flags = PRINT_READ_BUF;
 
+		memset(&rdwr, 0, sizeof(rdwr));
 		rdwr.msgs = msgs;
 		rdwr.nmsgs = nmsgs;
 		nmsgs_sent = ioctl(file, I2C_RDWR, &rdwr);

-- 
Jean Delvare
SUSE L3 Support

