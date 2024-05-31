Return-Path: <linux-i2c+bounces-3724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 237348D5E0E
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 11:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B686B1F271DB
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 09:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B79E770FA;
	Fri, 31 May 2024 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="usvJK06G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cz3gk1XR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="usvJK06G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cz3gk1XR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9DB768EA
	for <linux-i2c@vger.kernel.org>; Fri, 31 May 2024 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717147163; cv=none; b=rXOMhQVqysJiMR6NV4vii2HM70ANer6bLaVd6dd9a0n4WeHtWD6GlisPe2lI4ye2fhGcNF1kT0oovfJNahdVfAr+eg+wcG3GxjQPOL5izx4VibxOgKguQiHdHQmk0TgAg8R5I90rtp8f5oXDHxRwOU8uqJDvw1fVEJng7Z09dZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717147163; c=relaxed/simple;
	bh=FWcVBrnnrGpiwbEuEPViSBiTvpxy5LmoBM//6ubDWQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nv/R/PFAzoJjlDZPqWeRzR8Qp7SQ1H6855OsZwrtPlbQbWommnTEXK6Rq+c1ZTBUMsGdelFfDCm3xEorip21PUThNxr3H5Co0PvTeYierhupe4Y3gD9T1ksQdxcAPYjcKfyiYNsCj4lT5yKQQXryqAznWFQQmNnB5aKXww1UiKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=usvJK06G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cz3gk1XR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=usvJK06G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cz3gk1XR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 30FA81F816;
	Fri, 31 May 2024 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717147157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qNd3gavBYzuYhSZCu5tytLI2HBsmcFWKsI7aYjoa7yc=;
	b=usvJK06G/atiuQFOo53qCw25Blly8/ECxwfmwIiyQV213duPrkifBR9ewEkPDlTW6SEYkG
	9YjNvEE50rqzUlevpTar/FocV8Wb8ZU7AzAD9WsmMu9NU7RJWKDAnZA8NyIdeTJa1/gpNf
	6CrCkXxSyzbf/Zh2I1EjKk7ymoE0HBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717147157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qNd3gavBYzuYhSZCu5tytLI2HBsmcFWKsI7aYjoa7yc=;
	b=Cz3gk1XRk+y2eLxqpdBaWA1TslVGx1JyvKXv6BWZYrT6LlitMDm8atquv9LzLZ/fUPmt5T
	9d1FLbK5rsvz5hCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717147157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qNd3gavBYzuYhSZCu5tytLI2HBsmcFWKsI7aYjoa7yc=;
	b=usvJK06G/atiuQFOo53qCw25Blly8/ECxwfmwIiyQV213duPrkifBR9ewEkPDlTW6SEYkG
	9YjNvEE50rqzUlevpTar/FocV8Wb8ZU7AzAD9WsmMu9NU7RJWKDAnZA8NyIdeTJa1/gpNf
	6CrCkXxSyzbf/Zh2I1EjKk7ymoE0HBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717147157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qNd3gavBYzuYhSZCu5tytLI2HBsmcFWKsI7aYjoa7yc=;
	b=Cz3gk1XRk+y2eLxqpdBaWA1TslVGx1JyvKXv6BWZYrT6LlitMDm8atquv9LzLZ/fUPmt5T
	9d1FLbK5rsvz5hCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B8C2132C2;
	Fri, 31 May 2024 09:19:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pYCrNxOWWWbKGAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 31 May 2024 09:19:15 +0000
Date: Fri, 31 May 2024 11:19:14 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Juergen Fitschen <me@jue.yt>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Codrin Ciubotariu
 <codrin.ciubotariu@microchip.com>, Andi Shyti <andi.shyti@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH] i2c: at91: Fix the functionality flags of the slave-only
 interface
Message-ID: <20240531111914.619ade4b@endymion.delvare>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-3.79 / 50.00];
	BAYES_HAM(-2.49)[97.69%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,microchip.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.79
X-Spam-Flag: NO

When an I2C adapter acts only as a slave, it should not claim to
support I2C master capabilities.

Fixes: 9d3ca54b550c ("i2c: at91: added slave mode support")
Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Juergen Fitschen <me@jue.yt>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/i2c/busses/i2c-at91-slave.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-6.9.orig/drivers/i2c/busses/i2c-at91-slave.c
+++ linux-6.9/drivers/i2c/busses/i2c-at91-slave.c
@@ -106,8 +106,7 @@ static int at91_unreg_slave(struct i2c_c
 
 static u32 at91_twi_func(struct i2c_adapter *adapter)
 {
-	return I2C_FUNC_SLAVE | I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL
-		| I2C_FUNC_SMBUS_READ_BLOCK_DATA;
+	return I2C_FUNC_SLAVE;
 }
 
 static const struct i2c_algorithm at91_twi_algorithm_slave = {


-- 
Jean Delvare
SUSE L3 Support

