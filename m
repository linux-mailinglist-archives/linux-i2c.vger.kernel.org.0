Return-Path: <linux-i2c+bounces-5725-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB1595C6EF
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 09:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB00E1F220CD
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 07:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C331213D24C;
	Fri, 23 Aug 2024 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZKstxGDp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1bwrtLbV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZKstxGDp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1bwrtLbV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1691B13C827;
	Fri, 23 Aug 2024 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399357; cv=none; b=FDTngPADhajbgch/05rRknVyXo/bpBI1eqwEVhrXl/CqL9iDhwHleQ6C4dQMMiq1EtsvXzPgQhLRQZUpYgOMuAuY8S56j7ZbCTYtQJXSI/C8GDWAS5UD64O2DP2CovBEA60OIribb5ocKdZmdoiUN3iV5/CzKO6RObYQtoBjBv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399357; c=relaxed/simple;
	bh=uB9MIrtV5CCbfByxUHjm5wjhKM7tDehR5RPZyFu0Rns=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ywo8H1An6YnQErtWPk8lqy1dT90p3u0txDy9LjMnfXUF0o3KVz8ORxRHPJzKHIUATEUSKZ2nkY4J4FyUwNGR09f0DbvExNnfb8Bhfx87Hgi+05g1LhK/fnMOQ4DxC2wGU492Bg99/r8lnhkohotoY8QH0SX0w38EBZVhNUH5wm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZKstxGDp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1bwrtLbV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZKstxGDp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1bwrtLbV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1249222632;
	Fri, 23 Aug 2024 07:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724399354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uMvy6bZBNoghRg6zotXEJiMkuVUMVTphBQBtrxP62w0=;
	b=ZKstxGDp4Qb+JPGu5y92MUZQSdBj4aFmEtmJLJBvEIb3xR1CJ4wZ5SSARvSfKzlbXvG0fP
	kgMt/KiGNYgfy4XEJDqTzv8/jpo0rkmQfzXNVMK/NsWB3WvaH1wG6ZkfDorv2N7FW3fvPr
	XvDDN9IZys4GGD8EeawtiC3L9m7r6UM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724399354;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uMvy6bZBNoghRg6zotXEJiMkuVUMVTphBQBtrxP62w0=;
	b=1bwrtLbVGlEer3d2y1D85y3tx+ZJIVprUtlq/gLY1EHv63fsMgQMGb6i7FmWs5HJ9xW9uG
	ZEeiOE9/3m/Rb4AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZKstxGDp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1bwrtLbV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724399354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uMvy6bZBNoghRg6zotXEJiMkuVUMVTphBQBtrxP62w0=;
	b=ZKstxGDp4Qb+JPGu5y92MUZQSdBj4aFmEtmJLJBvEIb3xR1CJ4wZ5SSARvSfKzlbXvG0fP
	kgMt/KiGNYgfy4XEJDqTzv8/jpo0rkmQfzXNVMK/NsWB3WvaH1wG6ZkfDorv2N7FW3fvPr
	XvDDN9IZys4GGD8EeawtiC3L9m7r6UM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724399354;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uMvy6bZBNoghRg6zotXEJiMkuVUMVTphBQBtrxP62w0=;
	b=1bwrtLbVGlEer3d2y1D85y3tx+ZJIVprUtlq/gLY1EHv63fsMgQMGb6i7FmWs5HJ9xW9uG
	ZEeiOE9/3m/Rb4AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8A271398B;
	Fri, 23 Aug 2024 07:49:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XcK5M/k+yGa5fgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Aug 2024 07:49:13 +0000
Date: Fri, 23 Aug 2024 09:49:57 +0200
Message-ID: <87seuvllui.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/4] ALSA: ppc: Remove i2c client removal hack
In-Reply-To: <55cab333-c9ca-4edd-a002-1e2b650a9f5a@gmail.com>
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
	<55cab333-c9ca-4edd-a002-1e2b650a9f5a@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 1249222632
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Thu, 22 Aug 2024 21:47:18 +0200,
Heiner Kallweit wrote:
> 
> The i2c_driver.clients list is internal to I2C core and is going
> to be removed.  No driver should access it. Unregister the
> i2c client explicitly before deleting the i2c driver.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

