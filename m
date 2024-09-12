Return-Path: <linux-i2c+bounces-6616-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 222B2976964
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 14:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4AEE285D4C
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 12:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA2A1A704B;
	Thu, 12 Sep 2024 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qiSsE8CM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YWt7QByZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qiSsE8CM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YWt7QByZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4211A4E8C
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145109; cv=none; b=LX78Lp0/YG0CJ6EegkR8vy2CCL+AglQwXTUOiIAM0SK3yOSvwDJ1wIdlYYE/pF8KswPJL/xzi90UAudgyfWq25NcLhQWIznEXdHVQCq6HJUX0iIRUyCiF7wZsdjSO0JlcFT/cK7/EvFlbSaz4DFlWZz2a3DWJIqTKa8l8PjPAbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145109; c=relaxed/simple;
	bh=k9cFfu1epHSLUN5Gg66txgn3nRUco6mkMnxYWmqZ+6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=b49Ko48zmNH0uvquV7QCD7Md3JViSqfVyI6bL3zztnobe5k7AlWn8jSXZDSoR5esiOQh8XTXPtmasWDwgmPc0CMCEbCYaJgZaWJkX4Hb0PD+f8N+f4divHJRDBr3ZxDN9sFNgx/x0rgo0+FUBCYDzbvbyg4EHgIuanEHFYpJSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qiSsE8CM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YWt7QByZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qiSsE8CM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YWt7QByZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C5BB921B17;
	Thu, 12 Sep 2024 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726145105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=36wkEHdHobgoEC2Da66uDCMFQBWKu7mArVg4pTmWiUQ=;
	b=qiSsE8CMzcmqlnwqejq+vnkRqb1XPAjAYxTCMsCNnTIwyUGmllb0p/3c233sfAOWbu4Nhc
	GWaLk7/8hLluyUNNnxlCzuL/1lCYOECE0gMJWxwVeZq42T3pSs7aKUPYxdG9FSy4hMRg/l
	C2tpNivexLxs7ZpL51NMWsWX7ItLWms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726145105;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=36wkEHdHobgoEC2Da66uDCMFQBWKu7mArVg4pTmWiUQ=;
	b=YWt7QByZ78HJu/4xPozbaKf0w+7XvhhbIREUK5Bw2oSqxWIDBR806teGMyYfelu5HsPiyL
	mEUjEP95/AXTsOCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qiSsE8CM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YWt7QByZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726145105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=36wkEHdHobgoEC2Da66uDCMFQBWKu7mArVg4pTmWiUQ=;
	b=qiSsE8CMzcmqlnwqejq+vnkRqb1XPAjAYxTCMsCNnTIwyUGmllb0p/3c233sfAOWbu4Nhc
	GWaLk7/8hLluyUNNnxlCzuL/1lCYOECE0gMJWxwVeZq42T3pSs7aKUPYxdG9FSy4hMRg/l
	C2tpNivexLxs7ZpL51NMWsWX7ItLWms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726145105;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=36wkEHdHobgoEC2Da66uDCMFQBWKu7mArVg4pTmWiUQ=;
	b=YWt7QByZ78HJu/4xPozbaKf0w+7XvhhbIREUK5Bw2oSqxWIDBR806teGMyYfelu5HsPiyL
	mEUjEP95/AXTsOCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A151813AD8;
	Thu, 12 Sep 2024 12:45:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dslyJVHi4mZFYQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 12 Sep 2024 12:45:05 +0000
Date: Thu, 12 Sep 2024 14:45:04 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] i2ctransfer: Drop redundant variable arg_idx
Message-ID: <20240912144504.278d302b@endymion.delvare>
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
X-Rspamd-Queue-Id: C5BB921B17
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

arg_idx has the same meaning as getopt's optind global variable, so
drop the former and use the latter. Once getopt() is done parsing the
options, there should be no problem using it for ourselves.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Changes since v1:
 * Rebased to make it apply again.
 * Fixed typo in my SOB.

 tools/i2ctransfer.c |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

--- i2c-tools.orig/tools/i2ctransfer.c
+++ i2c-tools/tools/i2ctransfer.c
@@ -143,7 +143,7 @@ static int confirm(const char *filename,
 int main(int argc, char *argv[])
 {
 	char filename[20];
-	int i2cbus, address = -1, file, opt, arg_idx, nmsgs = 0, nmsgs_sent, i;
+	int i2cbus, address = -1, file, opt, nmsgs = 0, nmsgs_sent, i;
 	int force = 0, yes = 0, version = 0, verbose = 0, all_addrs = 0, binary = 0;
 	struct i2c_msg msgs[I2C_RDRW_IOCTL_MAX_MSGS];
 	enum parse_state state = PARSE_GET_DESC;
@@ -173,13 +173,12 @@ int main(int argc, char *argv[])
 		exit(0);
 	}
 
-	arg_idx = optind;
-	if (arg_idx == argc) {
+	if (optind == argc) {
 		help();
 		exit(1);
 	}
 
-	i2cbus = lookup_i2c_bus(argv[arg_idx++]);
+	i2cbus = lookup_i2c_bus(argv[optind++]);
 	if (i2cbus < 0)
 		exit(1);
 
@@ -187,8 +186,8 @@ int main(int argc, char *argv[])
 	if (file < 0 || check_funcs(file))
 		exit(1);
 
-	while (arg_idx < argc) {
-		char *arg_ptr = argv[arg_idx];
+	while (optind < argc) {
+		char *arg_ptr = argv[optind];
 		unsigned long len, raw_data;
 		__u16 flags;
 		__u8 data, *buf;
@@ -323,7 +322,7 @@ int main(int argc, char *argv[])
 			goto err_out;
 		}
 
-		arg_idx++;
+		optind++;
 	}
 
 	if (state != PARSE_GET_DESC || nmsgs == 0) {
@@ -361,7 +360,7 @@ int main(int argc, char *argv[])
 	exit(0);
 
  err_out_with_arg:
-	fprintf(stderr, "Error: faulty argument is '%s'\n", argv[arg_idx]);
+	fprintf(stderr, "Error: faulty argument is '%s'\n", argv[optind]);
  err_out:
 	close(file);
 


-- 
Jean Delvare
SUSE L3 Support

