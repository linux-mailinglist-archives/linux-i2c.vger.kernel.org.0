Return-Path: <linux-i2c+bounces-5161-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B998D948DDB
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 13:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6FC1F25011
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 11:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27B51C37A3;
	Tue,  6 Aug 2024 11:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gB1m/UP1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KJGFkoMA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gB1m/UP1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KJGFkoMA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E091C2324;
	Tue,  6 Aug 2024 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944479; cv=none; b=m2KAzFzCT3lea9zLIKbET3QQOs/ECzD5ex+ZjPC/n6l5iH8KwqR8rr/GMvRbBuTLLGUoKoQSc/nRa2LLUwOxUftXs5y2O2bGpWQt9N9JWE/IV4MfAabTjZwym8dCqH8RgcaqsE/XeWDJ0IyVzKh9EjvaNBky7RxOjJyYeIrudXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944479; c=relaxed/simple;
	bh=osiUu56Pden8wvlw/UtWgVtSmmDZoylOq6KwUOSfIQI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gjgxh+HhyR/6jkw+DMh5+vrPorWNmVlw/JWlDQnMOakbMkFoxKKMstgfgxdnhDjDDnKkzhy6DulDVCopVVtK6tB6N4o9fb4yTwgK+76QjfubSZ9qekkY503JsIMRQeNzgvg2RrOhQH6tE7aDLlz92c4IkbQtApd7sPc4uKvRWZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gB1m/UP1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KJGFkoMA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gB1m/UP1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KJGFkoMA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0A62D1FB44;
	Tue,  6 Aug 2024 11:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722944476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WjVHrdHo0zVqIEtFcBxDFXDNQccZA09P2VUyPQEiu4Q=;
	b=gB1m/UP1d/kyYziphMWQiPexH6ysBUudfrYnNAqRrtsFuYqbFKS31JH3r5QCU8CQl/D8Y+
	+thGwfvBplnIE1xGDFIMX0pMxlZkMyZ+D9U9yInwBMTg3Qg0WGi5lUGkbFf7lbkMKu8Asa
	y96OeXZRUzmPkdWqHEYL2eDNYWenlv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722944476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WjVHrdHo0zVqIEtFcBxDFXDNQccZA09P2VUyPQEiu4Q=;
	b=KJGFkoMAlJBBOxE/BEqzFOXBLZk8kfCKknxcDmA2Xvr0OQEg+yIqLoATBC86ulHSRM+E8s
	W9dvBbaJpsqdvkBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="gB1m/UP1";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KJGFkoMA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722944476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WjVHrdHo0zVqIEtFcBxDFXDNQccZA09P2VUyPQEiu4Q=;
	b=gB1m/UP1d/kyYziphMWQiPexH6ysBUudfrYnNAqRrtsFuYqbFKS31JH3r5QCU8CQl/D8Y+
	+thGwfvBplnIE1xGDFIMX0pMxlZkMyZ+D9U9yInwBMTg3Qg0WGi5lUGkbFf7lbkMKu8Asa
	y96OeXZRUzmPkdWqHEYL2eDNYWenlv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722944476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WjVHrdHo0zVqIEtFcBxDFXDNQccZA09P2VUyPQEiu4Q=;
	b=KJGFkoMAlJBBOxE/BEqzFOXBLZk8kfCKknxcDmA2Xvr0OQEg+yIqLoATBC86ulHSRM+E8s
	W9dvBbaJpsqdvkBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8CC513981;
	Tue,  6 Aug 2024 11:41:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hcdPNNsLsma5JwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Aug 2024 11:41:15 +0000
Date: Tue, 06 Aug 2024 13:41:50 +0200
Message-ID: <87bk25anep.wl-tiwai@suse.de>
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
In-Reply-To: <ZrIJBUJfgiKPCKXv@shikoro>
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
	<8734njl7my.wl-tiwai@suse.de>
	<554660e1-01ea-4bb4-877f-fd8deb527ce7@opensource.cirrus.com>
	<87frrhaofs.wl-tiwai@suse.de>
	<ZrIJBUJfgiKPCKXv@shikoro>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[renesas];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -1.01
X-Rspamd-Queue-Id: 0A62D1FB44

On Tue, 06 Aug 2024 13:29:09 +0200,
Wolfram Sang wrote:
> 
> 
> > Wolfram, has the patch been merged for your branch for 6.11?  If yes,
> > can I pull your change, so that I can apply the patch 3 together with
> > the SPI change?
> 
> Yes, you can pull i2c/for-current. Maybe I can also retrofit an
> immutable branch for you. I'd think, though, that it is easiest to wait
> for 6.11-rc3 which will include the I2C part of this series. Or?

Yeah, it's fine, I can wait for 6.11-rc3.


thanks,

Takashi

