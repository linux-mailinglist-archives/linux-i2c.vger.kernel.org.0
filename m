Return-Path: <linux-i2c+bounces-5296-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E932B94E7A2
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 09:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A18312812BE
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 07:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA3A155332;
	Mon, 12 Aug 2024 07:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mH+PV3TN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c7489txE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mH+PV3TN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c7489txE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA8315445E;
	Mon, 12 Aug 2024 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723447195; cv=none; b=VXUG5TYatiCkpa5lUHRlUJT0bXbVnjRfQIPtz2C9ohC0qI4WjLN8coLW8rdC8//JRHzC540ZJ+mQn9DLaID8DNXl6LM4CFY/N7sLUwM9aTuiYoqzgb7ILNVMP2h0VKm6+2juOIRRGu/NxHqkWJSFbrdReuc6DCeZviQFeg7Kvds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723447195; c=relaxed/simple;
	bh=n35+g/K0hL+AeL93ndmHWiatvePAOlaR+PPFaLxqQ3s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tEbjXlFuq03DmrAd3Q/jCsZ8NG+yiP4xLgLPzJ98irKzwJCAjeid20LcQT4sNU5Y/rBY51vSesbW8aLimwxsV+onqZ4fBkBwLx8OOJSHE6FX13JFht6RBsUe2GoifdapbESCKbsEVg2SQ1aBaVwR1kxYgwB1bgoaOINSIaURGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mH+PV3TN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c7489txE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mH+PV3TN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c7489txE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 364F52022C;
	Mon, 12 Aug 2024 07:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723447191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4nT10TNP0W3AGQ/48FklA4U3nEldmsHPKLlqqM7yFtI=;
	b=mH+PV3TNKhsMzoRv12ObTvkh+UnudKN5xXHE9i4yN2XRpwYFGZZG2z1/tFoEkj0G1s6sCA
	nJA9/4xm4puQ79BpQ7IYj0YLWEw4kFaP6eb69uwiJhNl+VRAb3utc1rwD6cF1i+G1wwfZL
	zHMzPgOnJKuovdJvHDd46zUmdvx8I/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723447191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4nT10TNP0W3AGQ/48FklA4U3nEldmsHPKLlqqM7yFtI=;
	b=c7489txEHJXViX+YOxwgtUJaEWO98/ugSUqJEuGo/AjJDOTSnabwJJ3BytBC4+nW4RmE4F
	Pbf1RfTIZIM7YhDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mH+PV3TN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=c7489txE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723447191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4nT10TNP0W3AGQ/48FklA4U3nEldmsHPKLlqqM7yFtI=;
	b=mH+PV3TNKhsMzoRv12ObTvkh+UnudKN5xXHE9i4yN2XRpwYFGZZG2z1/tFoEkj0G1s6sCA
	nJA9/4xm4puQ79BpQ7IYj0YLWEw4kFaP6eb69uwiJhNl+VRAb3utc1rwD6cF1i+G1wwfZL
	zHMzPgOnJKuovdJvHDd46zUmdvx8I/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723447191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4nT10TNP0W3AGQ/48FklA4U3nEldmsHPKLlqqM7yFtI=;
	b=c7489txEHJXViX+YOxwgtUJaEWO98/ugSUqJEuGo/AjJDOTSnabwJJ3BytBC4+nW4RmE4F
	Pbf1RfTIZIM7YhDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE395137BA;
	Mon, 12 Aug 2024 07:19:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k9YeNZa3uWZkCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Aug 2024 07:19:50 +0000
Date: Mon, 12 Aug 2024 09:20:31 +0200
Message-ID: <87jzgm2on4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<broonie@kernel.org>,
	<wsa+renesas@sang-engineering.com>,
	<mika.westerberg@linux.intel.com>,
	<linux-sound@vger.kernel.org>,
	<linux-spi@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/3] ALSA: Add support for new HP G12 laptops
In-Reply-To: <20240802152215.20831-1-rf@opensource.cirrus.com>
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.01 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[renesas];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -1.01
X-Rspamd-Queue-Id: 364F52022C

On Fri, 02 Aug 2024 17:22:12 +0200,
Richard Fitzgerald wrote:
> 
> Add support for HP G12 laptops that use CS35L54 or CS35L56 amplifiers
> with Realtek HDA codecs. Some of these use the same SSID for models with
> CS35L54 and models with CS35L56 so the ACPI entries are examined to
> determine which amp is present.
> 
> To avoid having to #ifdef around this code we've fixed the definitions
> of SPI and I2C functions that were not correctly supplying dummy functions
> when the real functions are not in the build.
> 
> Changes since V1:
> Added I2C and SPI patches to provide dummy functions.
> 
> Richard Fitzgerald (2):
>   spi: Add empty versions of ACPI functions
>   i2c: Fix conditional for substituting empty ACPI functions
> 
> Simon Trimmer (1):
>   ALSA: hda/realtek: Add support for new HP G12 laptops

Now all changes are merged to sound git tree for-linus branch.


thanks,

Takashi

