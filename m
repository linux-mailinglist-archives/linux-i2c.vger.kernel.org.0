Return-Path: <linux-i2c+bounces-3728-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E34BD8D5E67
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 11:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 121A51C20E0A
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 09:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E7313E3F8;
	Fri, 31 May 2024 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="otDAcKzb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iimwtd/Z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="otDAcKzb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iimwtd/Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C5E139563
	for <linux-i2c@vger.kernel.org>; Fri, 31 May 2024 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717148053; cv=none; b=iFinU+tp9FtNimgxTpewYi+8TdhlrN+V0VhMZJej0bqA/Vsdujjc1v5vWnU6vSNH+sRsTVntiVxWyzNaf3OltymoVOAqM8W7bARiqILb2ZnF9M1gOQWX2aQKK/a9JRoWr9Clk3FcOkcJHPmZ2u3bb6rZMUQSIN4dz9MZUdC2ito=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717148053; c=relaxed/simple;
	bh=mCWEU6YRQm46wcTZcZ4A1tujlVmtZCDWIj/vRyoxaVs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=QJGdpl5fN0aK96Y2+7oshvXJvb2NXom+wWGLYhqR7B7whncv3flia27j8sFojWubfUjfR9DudkOG7OL9B4vCog38sO6WL3GGWbUSOrenfmAF0S2NUBW+Rl2pOI9+6ze2sacd0Mf4pmXruXtxswE9G6Gp3O8BX+F4Ee75N6Fle4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=otDAcKzb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iimwtd/Z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=otDAcKzb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iimwtd/Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3C31D1F81C
	for <linux-i2c@vger.kernel.org>; Fri, 31 May 2024 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717148050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rQodELZN922dbO2W4p3hfe1ICJz3riIrGLvIW3U2ZhU=;
	b=otDAcKzbjaCXC+gG2kiaPXQnEcjgs6kLrRi3WYkLu/8jHGRe3xfXNbCAR+CaXWKKr5dtMR
	4C9d93K+CYLQLi6iYYdGFxYbZEADXud/oScEk2RVSYLep1a0gDmOZY94i4y3BMYcIWPjXM
	pQU+KGhfn3/dZCz2muX2/SdYR4sENLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717148050;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rQodELZN922dbO2W4p3hfe1ICJz3riIrGLvIW3U2ZhU=;
	b=iimwtd/ZHvcLrnnpX3awg7zdy79a0RjwUgV0Ia+s7+PP7s7hT5/TfNf+fdy0DfCCWvzIao
	KiKI0S9igwOGXwDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717148050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rQodELZN922dbO2W4p3hfe1ICJz3riIrGLvIW3U2ZhU=;
	b=otDAcKzbjaCXC+gG2kiaPXQnEcjgs6kLrRi3WYkLu/8jHGRe3xfXNbCAR+CaXWKKr5dtMR
	4C9d93K+CYLQLi6iYYdGFxYbZEADXud/oScEk2RVSYLep1a0gDmOZY94i4y3BMYcIWPjXM
	pQU+KGhfn3/dZCz2muX2/SdYR4sENLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717148050;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rQodELZN922dbO2W4p3hfe1ICJz3riIrGLvIW3U2ZhU=;
	b=iimwtd/ZHvcLrnnpX3awg7zdy79a0RjwUgV0Ia+s7+PP7s7hT5/TfNf+fdy0DfCCWvzIao
	KiKI0S9igwOGXwDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D93F4132C2
	for <linux-i2c@vger.kernel.org>; Fri, 31 May 2024 09:34:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fR1FLpGZWWZ6HQAAD6G6ig
	(envelope-from <jdelvare@suse.de>)
	for <linux-i2c@vger.kernel.org>; Fri, 31 May 2024 09:34:09 +0000
Date: Fri, 31 May 2024 11:34:07 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH] i2c: dev: Check for I2C_FUNC_I2C before calling
 i2c_transfer
Message-ID: <20240531113407.4df71f5a@endymion.delvare>
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
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.97%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[linux-i2c@vger.kernel.org];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]

It is good practice to check that the underlying adapter supports
I2C transfers before attempting them. The i2c core would eventually
return an error, but it's more efficient to fail early.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Not sure about that one, opinions welcome.

 drivers/i2c/i2c-dev.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

--- linux-6.9.orig/drivers/i2c/i2c-dev.c
+++ linux-6.9/drivers/i2c/i2c-dev.c
@@ -139,6 +139,10 @@ static ssize_t i2cdev_read(struct file *
 
 	struct i2c_client *client = file->private_data;
 
+	/* Adapter must support I2C transfers */
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -EOPNOTSUPP;
+
 	if (count > 8192)
 		count = 8192;
 
@@ -163,6 +167,10 @@ static ssize_t i2cdev_write(struct file
 	char *tmp;
 	struct i2c_client *client = file->private_data;
 
+	/* Adapter must support I2C transfers */
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -EOPNOTSUPP;
+
 	if (count > 8192)
 		count = 8192;
 
@@ -238,6 +246,10 @@ static noinline int i2cdev_ioctl_rdwr(st
 	u8 __user **data_ptrs;
 	int i, res;
 
+	/* Adapter must support I2C transfers */
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -EOPNOTSUPP;
+
 	data_ptrs = kmalloc_array(nmsgs, sizeof(u8 __user *), GFP_KERNEL);
 	if (data_ptrs == NULL) {
 		kfree(msgs);


-- 
Jean Delvare
SUSE L3 Support

