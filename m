Return-Path: <linux-i2c+bounces-5294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F5294E757
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 09:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73BB81F230FF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 07:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7680314D294;
	Mon, 12 Aug 2024 07:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XyePbD2f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fg1ufNhU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XyePbD2f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fg1ufNhU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2662B2DA;
	Mon, 12 Aug 2024 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723446206; cv=none; b=TBuHuyj+Iu3b00c/4I0t/veOX9LUj6ii1X2GPS89K+GgTHfA0upW/sCJINKjCnF9nIeVkIC1Li3k3ztYP1Y/QyjQg0IYmg9IY8B82XsBSFf2rBCcR+sZ6lMLhYYjuHtBTSupyGUbVN0icczDDBIrBv3XdF1VR3pWnn27O/sHILk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723446206; c=relaxed/simple;
	bh=zkBXWMV96/rt3Ce6Bg/cPds+d5wyzfo+UX1M6Zt48fE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ArwKpaj0IODMR6VHhPZyhTvxlcShEEbpP8pcb0q2nAch2iFEBTIy7mtOUojGwChS7AfLllRnLV89G9LmHMgaj7I4wZwBf5rPWiZ5+3VxesMLqs+4MbEvmjBQUl1HUP2KsaG17vybYyfZgw34SHd6DuJyHQWlioDxs51Uj540dng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XyePbD2f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fg1ufNhU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XyePbD2f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fg1ufNhU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A476D2241A;
	Mon, 12 Aug 2024 07:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723446202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3au8BSiNR/MT5RpLjVZFkYNqL6iE7NfwhlfKk6k+PMU=;
	b=XyePbD2f268HzRQ6XJa2S8uAOziL5YjnfF7KtIlAsGxLM3dGXguOiNwcEdz0SvNgUI3y+4
	ezTIs45tp8sDeG0W7qKtFaWUElwrpQI6bYCX5PEX/2SKSJPomIYLhBm39oZaMh3vQA2hiv
	DOoHZfdvg+f8eoqphQPMQuWPUbmTljk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723446202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3au8BSiNR/MT5RpLjVZFkYNqL6iE7NfwhlfKk6k+PMU=;
	b=fg1ufNhUvHZyXbKjS7ekzY70EYLFVm8C/qASAYMYzfSNvmmaHSAtzYhOnfe5wJw/4PQAJQ
	jmUyRNJ4ICTy/BBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XyePbD2f;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fg1ufNhU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723446202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3au8BSiNR/MT5RpLjVZFkYNqL6iE7NfwhlfKk6k+PMU=;
	b=XyePbD2f268HzRQ6XJa2S8uAOziL5YjnfF7KtIlAsGxLM3dGXguOiNwcEdz0SvNgUI3y+4
	ezTIs45tp8sDeG0W7qKtFaWUElwrpQI6bYCX5PEX/2SKSJPomIYLhBm39oZaMh3vQA2hiv
	DOoHZfdvg+f8eoqphQPMQuWPUbmTljk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723446202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3au8BSiNR/MT5RpLjVZFkYNqL6iE7NfwhlfKk6k+PMU=;
	b=fg1ufNhUvHZyXbKjS7ekzY70EYLFVm8C/qASAYMYzfSNvmmaHSAtzYhOnfe5wJw/4PQAJQ
	jmUyRNJ4ICTy/BBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D6D7137BA;
	Mon, 12 Aug 2024 07:03:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZU+fFbqzuWbPBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Aug 2024 07:03:22 +0000
Date: Mon, 12 Aug 2024 09:04:02 +0200
Message-ID: <87plqe2pel.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	tiwai@suse.com,
	mika.westerberg@linux.intel.com,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v2 0/3] ALSA: Add support for new HP G12 laptops
In-Reply-To: <ZrmxYB4zsOpOP2eG@shikoro>
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
	<8734njl7my.wl-tiwai@suse.de>
	<554660e1-01ea-4bb4-877f-fd8deb527ce7@opensource.cirrus.com>
	<87frrhaofs.wl-tiwai@suse.de>
	<ZrIJBUJfgiKPCKXv@shikoro>
	<87bk25anep.wl-tiwai@suse.de>
	<ZrmxYB4zsOpOP2eG@shikoro>
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
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Rspamd-Queue-Id: A476D2241A

On Mon, 12 Aug 2024 08:53:20 +0200,
Wolfram Sang wrote:
> 
> 
> > > Yes, you can pull i2c/for-current. Maybe I can also retrofit an
> > > immutable branch for you. I'd think, though, that it is easiest to wait
> > > for 6.11-rc3 which will include the I2C part of this series. Or?
> > 
> > Yeah, it's fine, I can wait for 6.11-rc3.
> 
> Done. Said commit is included in rc3 now. Thanks, guys!

Thanks!


Takashi

