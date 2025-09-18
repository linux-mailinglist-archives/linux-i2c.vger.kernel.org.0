Return-Path: <linux-i2c+bounces-13051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 146E9B8531E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 16:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD673483AFA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 14:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698762236F0;
	Thu, 18 Sep 2025 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K5fEUSsv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AiUWbluD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rB9fkcer";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vXp80AOC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D08A31
	for <linux-i2c@vger.kernel.org>; Thu, 18 Sep 2025 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204788; cv=none; b=pJ4ogNveDSEDePmeP3v9VlsVqtuheyis4J8TqMhG7szAbrBT8c4T1AssLUUy/GRVfaN+1H/CpajYSMM/S1WX9Kpz1U2LN7jpHY+0qyfSg2tuXRwAxWgDNwyHxoFNiAi5CxSaUzUA7N+g21mgqOT3XHxosIeCTA1ilJJg47gg1Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204788; c=relaxed/simple;
	bh=lEMOI3jnHR53b+X5wRoFo50IivBP0iW+CZQz2xkqn88=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ji6R2UQGaL+GORIATbfxkQ2fjthWd1hdVUljRPVeEXjaVmIR1mEZrh3k3JWbEz7NkUPA8SBAMWo0F6JlqJc7iUERdKR1mTU5mIzP0ICNscLfq8bRrjNk6GUg7+HTen8dBrD+bwX0HLuNWhf/wVRuMIWzgwQVvi6PFBDuZDKOXbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K5fEUSsv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AiUWbluD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rB9fkcer; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vXp80AOC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A7B0F336DB;
	Thu, 18 Sep 2025 14:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758204784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kcmxoxc46EOxCUpTmlV5vA+6uur1FGz3KQThPD2co9g=;
	b=K5fEUSsvad50QXvX+9LTvWHF5uSYi3UxdUoi/8KoC6/g5o0NgpTOSHiisGjFiIV5hXOOQ7
	bM+rO+MVvHGZt1cmJIVLdQeOxF2iR+Bs100JY56ikxAkz7igBTIUvUCA0AA7iGVzSWZrNp
	XGz2GkQPnECoYm5G5R0L6hlRuUpX2kk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758204784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kcmxoxc46EOxCUpTmlV5vA+6uur1FGz3KQThPD2co9g=;
	b=AiUWbluDk0wlSeX7Xt/N/6wlyPx905JGvRswNQMfNKqM20py4gP6/pixIuig1MP2BjK9bk
	sjhFxV+8LpV9wMCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rB9fkcer;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vXp80AOC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758204783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kcmxoxc46EOxCUpTmlV5vA+6uur1FGz3KQThPD2co9g=;
	b=rB9fkcerreinoGicv+/bUHCNbAFwD4OehC4qEa20A0iADMMpQrjwzKmMBkus393HuZO5ul
	cQLhPlwRhidtm1X8SMmajBXXGDtl+/rotK70YYDhMYaTjLzyH4SCja5w/JszsOHGaTKDO0
	H8uYafLy/p1ikIgNjgMptBJowNleEv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758204783;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kcmxoxc46EOxCUpTmlV5vA+6uur1FGz3KQThPD2co9g=;
	b=vXp80AOCf9AOhZsg06c1yTfBhTbAKGweFtzu5QmK4tG+tCEasxnaRThLtjGlWfPh07nyCy
	iaUdOL5wi63YbqAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62BD313A51;
	Thu, 18 Sep 2025 14:13:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2dMtFm8TzGg/QAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 18 Sep 2025 14:13:03 +0000
Date: Thu, 18 Sep 2025 16:13:01 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti <andi.shyti@kernel.org>
Subject: [PATCH 3/3] i2c: designware: Turn models back to enumerated values
Message-ID: <20250918161301.5405b709@endymion>
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
X-Rspamd-Queue-Id: A7B0F336DB
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01

There are 4 flag bits reserved to store the device model. All
accesses to this information is properly masked with MODEL_MASK to
extract only these bits and compare them with a given model value.

However the model definitions isn't an enumeration as you would
expect. Instead each model uses a separate flag, meaning that the
reserved space is already exhausted with the 4 models which have been
defined so far.

The error seems to originate from commit a5df4c14b9a9 ("i2c:
designware: Switch header to use BIT() and GENMASK()") where:

define MODEL_MSCC_OCELOT      0x00000100
define MODEL_BAIKAL_BT1       0x00000200

was erroneously converted to:

define MODEL_MSCC_OCELOT      BIT(8)
define MODEL_BAIKAL_BT1       BIT(9)

While numerically equivalent, conceptually it wasn't, and it caused
the models added later to get bit-based definitions instead of
continuing with the next enumerated value (0x00000300).

Turn back these definitions to enumerated values to clear the
confusion, avoid future mistakes, and free some space for more models
to be supported in the future.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-designware-core.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-6.16.orig/drivers/i2c/busses/i2c-designware-core.h
+++ linux-6.16/drivers/i2c/busses/i2c-designware-core.h
@@ -312,10 +312,10 @@ struct dw_i2c_dev {
 #define ARBITRATION_SEMAPHORE			BIT(2)
 #define ACCESS_POLLING				BIT(3)
 
-#define MODEL_MSCC_OCELOT			BIT(8)
-#define MODEL_BAIKAL_BT1			BIT(9)
-#define MODEL_AMD_NAVI_GPU			BIT(10)
-#define MODEL_WANGXUN_SP			BIT(11)
+#define MODEL_MSCC_OCELOT			(1 << 8)
+#define MODEL_BAIKAL_BT1			(2 << 8)
+#define MODEL_AMD_NAVI_GPU			(3 << 8)
+#define MODEL_WANGXUN_SP			(4 << 8)
 #define MODEL_MASK				GENMASK(11, 8)
 
 /*

-- 
Jean Delvare
SUSE L3 Support

