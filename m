Return-Path: <linux-i2c+bounces-10960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E564AAB587E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 17:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9994D1886BE8
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 15:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00392BE0E8;
	Tue, 13 May 2025 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mm0POSRM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2qbut+cp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mm0POSRM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2qbut+cp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA0413CA97
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149686; cv=none; b=X+/tCrAirdyC2XD/X6hkFgw031JiM16sjMKzChzWFTGCAQYx5B9Bv6VZFz8PH+gn26CyuM67yW1PfGWgdw6lJ2Nyci+HexfDV2//BW62gRP0z3gmrrJ9LwvhVETky3r+qYea9by2cH/9BpJdKNU+doaWZoyis7N47gRrZ8mbEag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149686; c=relaxed/simple;
	bh=P1s8x9GNjudvfrEW8qSDaIeMQoT7+URwrjN1B0e0qok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Cyi3/oWk8YT1NAUDzVQqpazMXUncVSYn+phQq+83MbfWvNBEKIhZpLWRefIYuV5g9Vhi8nhg5XCXGu/KHFSZHI5sISR3dRmpXfH6Aitw4mk24GBOvb+3rn2lSo/XK7j5mpy4mQOmcIPjVnZCB/BOGMyY3xiZtnwGZcFIiKhZq08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mm0POSRM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2qbut+cp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mm0POSRM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2qbut+cp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 577C3211CC;
	Tue, 13 May 2025 15:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747149682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LObwxDgYv4JED/Eu+qQgbyD2QUl1nTDP//v0rlptcEI=;
	b=Mm0POSRMHxLTlKMc4yzjPQpXZvnvdqTVvQmUfoUegyRHiBo4L0w91VMrBNxkWAO7Sag8EQ
	xdMdGVo6YOYLMrdixfhsaYA6NZuKpOSStZsA2kcKkjsaKTDsKgjEhfIrf1BcCdrZ5xDVDx
	amzkbRDw3/0+GcQwfyhvywGS3sjTBw4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747149682;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LObwxDgYv4JED/Eu+qQgbyD2QUl1nTDP//v0rlptcEI=;
	b=2qbut+cp/G0u69LU8jzOLjPQJfuOv1QOj/Zd4hMrif2Smts2EBmbV1W2sYdUaNmu1WgJUN
	ZF0RgDhLowxGYrDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747149682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LObwxDgYv4JED/Eu+qQgbyD2QUl1nTDP//v0rlptcEI=;
	b=Mm0POSRMHxLTlKMc4yzjPQpXZvnvdqTVvQmUfoUegyRHiBo4L0w91VMrBNxkWAO7Sag8EQ
	xdMdGVo6YOYLMrdixfhsaYA6NZuKpOSStZsA2kcKkjsaKTDsKgjEhfIrf1BcCdrZ5xDVDx
	amzkbRDw3/0+GcQwfyhvywGS3sjTBw4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747149682;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LObwxDgYv4JED/Eu+qQgbyD2QUl1nTDP//v0rlptcEI=;
	b=2qbut+cp/G0u69LU8jzOLjPQJfuOv1QOj/Zd4hMrif2Smts2EBmbV1W2sYdUaNmu1WgJUN
	ZF0RgDhLowxGYrDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32A541365D;
	Tue, 13 May 2025 15:21:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oeltCnJjI2hzBQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 13 May 2025 15:21:22 +0000
Date: Tue, 13 May 2025 17:21:19 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] i2ctransfer: Don't free memory which was never
 allocated
Message-ID: <20250513172119.09548573@endymion>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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

If an error occurs while msgs[] is been prepared for the transfer,
we jump to the clean-up path. How many buffers need to be freed
depends on the state. If we were parsing data, we should free up to
nmsgs. However, if we were parsing descriptors, we should free
up to nmsgs - 1 only. The code was unconditionally freeing up to
nmsgs, potentially freeing a non-allocated buffer.

In most cases, it was not a problem, we would simply call free() on a
NULL pointer and that's a no-op. However, if msgs[] was full then we
would access memory beyond its end and call free() on a random
pointer.

Fixes: 9fc53a7fc669 ("i2c-tools: add new tool 'i2ctransfer'")
Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 tools/i2ctransfer.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- i2c-tools.orig/tools/i2ctransfer.c
+++ i2c-tools/tools/i2ctransfer.c
@@ -364,7 +364,13 @@ int main(int argc, char *argv[])
  err_out:
 	close(file);
 
-	for (i = 0; i <= nmsgs; i++)
+	/*
+	 * If we were parsing data, the buffer for the last message was
+	 * already allocated and nmsgs still points to it.
+	 */
+	if (state == PARSE_GET_DATA)
+		free(msgs[nmsgs].buf);
+	for (i = 0; i < nmsgs; i++)
 		free(msgs[i].buf);
 
 	exit(1);


-- 
Jean Delvare
SUSE L3 Support

