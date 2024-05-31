Return-Path: <linux-i2c+bounces-3723-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 079DA8D5E08
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 11:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85CCC1F26FEA
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 09:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5FF7441F;
	Fri, 31 May 2024 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mlhSQYLK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YO+OvM2N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mlhSQYLK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YO+OvM2N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC9B4D8DB
	for <linux-i2c@vger.kernel.org>; Fri, 31 May 2024 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717147082; cv=none; b=FCGziZzDBuwPLfrOePRfDA9RaFnqh58OktZBdIGCod4ReMinUSuz8/56AybrVxuW8g6p/rfVmXlDs8zaVjnT5YOhu5HNqc2gO4Xx+PDaI+EbILTr9onRliH/ptoxZGZegHysIdXUuJKTxtHZ5knqM+iuFBpoZLZ2ln+UreTvUlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717147082; c=relaxed/simple;
	bh=hTif2A3rNti+DOu2NNp2NwkLcKsuuNLPY4rHEMYoKSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RNUCv3MMXWzqPY313p9gXnmR+N0gVONcsJjMjJOCbYNnsj+ihxgTzbPK7BhWxV3kfewfBLhGNsSdvhtB01ZEOIUMuA+lverZnAd9nZz2oSp3IOMZGXTlymkGtN9G3Vbsey+j27P5TRnG00UOHMIVoa934MMn2fS1MhfCkntjtNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mlhSQYLK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YO+OvM2N; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mlhSQYLK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YO+OvM2N; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1499921B22;
	Fri, 31 May 2024 09:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717147073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9iMSsgUF8gSXQpMgp+PnVvcQ5dN6OxZ6ideYNnSCsp8=;
	b=mlhSQYLKSKQKpg1gBqgeHhHqhzP5iVTmJbO4DYnP0174QikD332SBm1uuJm33IJGBhtUeE
	7wo7m4x1WIzGPn2emToxTw/315JrXoK6oYodvYnvTQZpJ5anwdWEWFR6knHqTlPe2A8IhE
	1R/UtRH0Q0DQLn27wCJlFITnwM/kDIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717147073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9iMSsgUF8gSXQpMgp+PnVvcQ5dN6OxZ6ideYNnSCsp8=;
	b=YO+OvM2NXgCFFsEvBchnlH4HRY/n5+tSkFOH5fdxXFKaMcp1DmOrRz9Xppq4AsnvKRdsFT
	Sdxdp8P3c7JyUYBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717147073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9iMSsgUF8gSXQpMgp+PnVvcQ5dN6OxZ6ideYNnSCsp8=;
	b=mlhSQYLKSKQKpg1gBqgeHhHqhzP5iVTmJbO4DYnP0174QikD332SBm1uuJm33IJGBhtUeE
	7wo7m4x1WIzGPn2emToxTw/315JrXoK6oYodvYnvTQZpJ5anwdWEWFR6knHqTlPe2A8IhE
	1R/UtRH0Q0DQLn27wCJlFITnwM/kDIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717147073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9iMSsgUF8gSXQpMgp+PnVvcQ5dN6OxZ6ideYNnSCsp8=;
	b=YO+OvM2NXgCFFsEvBchnlH4HRY/n5+tSkFOH5fdxXFKaMcp1DmOrRz9Xppq4AsnvKRdsFT
	Sdxdp8P3c7JyUYBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B663132C2;
	Fri, 31 May 2024 09:17:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BI2eN7+VWWZaGAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 31 May 2024 09:17:51 +0000
Date: Fri, 31 May 2024 11:17:48 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Luis Oliveira <lolivei@synopsys.com>, Jarkko Nikula
 <jarkko.nikula@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti <andi.shyti@kernel.org>
Subject: [PATCH] i2c: designware: Fix the functionality flags of the
 slave-only interface
Message-ID: <20240531111748.441a85b6@endymion.delvare>
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
X-Spam-Score: -4.10
X-Spam-Level: 
X-Spamd-Result: default: False [-4.10 / 50.00];
	BAYES_HAM(-2.80)[99.14%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.de:email]

When an I2C adapter acts only as a slave, it should not claim to
support I2C master capabilities.

Fixes: 5b6d721b266a ("i2c: designware: enable SLAVE in platform module")
Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Luis Oliveira <lolivei@synopsys.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jan Dabros <jsd@semihalf.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-designware-slave.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-6.9.orig/drivers/i2c/busses/i2c-designware-slave.c
+++ linux-6.9/drivers/i2c/busses/i2c-designware-slave.c
@@ -220,7 +220,7 @@ static const struct i2c_algorithm i2c_dw
 
 void i2c_dw_configure_slave(struct dw_i2c_dev *dev)
 {
-	dev->functionality = I2C_FUNC_SLAVE | DW_IC_DEFAULT_FUNCTIONALITY;
+	dev->functionality = I2C_FUNC_SLAVE;
 
 	dev->slave_cfg = DW_IC_CON_RX_FIFO_FULL_HLD_CTRL |
 			 DW_IC_CON_RESTART_EN | DW_IC_CON_STOP_DET_IFADDRESSED;


-- 
Jean Delvare
SUSE L3 Support

