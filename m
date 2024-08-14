Return-Path: <linux-i2c+bounces-5386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F3951C9B
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 16:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 273A71C24EAC
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 14:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423EF1B32D5;
	Wed, 14 Aug 2024 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zNG4GnYD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8uVOulMN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zNG4GnYD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8uVOulMN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ED91B32AF;
	Wed, 14 Aug 2024 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644401; cv=none; b=Fu5BOlNzeE0C9Xk4u8ISZRkz0UZlds5jVc098+TU7iyy08rvnthz0iJGPBA72118DhrZkchZQtu4RQLe+kYClLG//kUS7AAbIeW7jGViuceOohP52CZppxX0WxX8zTGt+GGq5QdAOm3tCr+knqAdl9ss33QbxzNgC6vMHLYu4n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644401; c=relaxed/simple;
	bh=5zYF8ZsZbP7ywNXfiedDdnbPrX6y+dJUgSA7AHzkl20=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dByjylYfayGYwFfrBu9tOoq+p0J5KK4nBceK20WYDkE79GX+FtRdl4MUiok9PejLJAXnlON1HTLoeuuqzGvecl9jkTgPOoFh5j43yek3SFok9qfi1jRXqh2VRbTYv19NNNZh7MgIbqIDgLEKExblvutca35smd56bWRu5PButlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zNG4GnYD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8uVOulMN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zNG4GnYD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8uVOulMN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4997021F41;
	Wed, 14 Aug 2024 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723644397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sbk0Gwp0X7tJBl29kbtj1MoAttG+GT+BnXCwGaFVjw8=;
	b=zNG4GnYDhe+fO5SVmW/DnQqwpeFJhHz8qzZU/Af3ayh1sHi5Ne6A6ELPrBrVruucRh0sAP
	6gO5a+TI9emhShnoLUQv2xyxQgWHhUZzug2n28K1Tm0U4bAhpHtI3oLbZhdIBw5YJsF5z+
	oAM18aHCQNELtUayqRMutt4j0rp9LCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723644397;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sbk0Gwp0X7tJBl29kbtj1MoAttG+GT+BnXCwGaFVjw8=;
	b=8uVOulMNy4WQlpk4qQWcWJ2JT5MVrPQEgoY+wxh7NdSlD5zNi8vpteC47FbBNcv/0uyxfK
	TSYsnISImrlLDVCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723644397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sbk0Gwp0X7tJBl29kbtj1MoAttG+GT+BnXCwGaFVjw8=;
	b=zNG4GnYDhe+fO5SVmW/DnQqwpeFJhHz8qzZU/Af3ayh1sHi5Ne6A6ELPrBrVruucRh0sAP
	6gO5a+TI9emhShnoLUQv2xyxQgWHhUZzug2n28K1Tm0U4bAhpHtI3oLbZhdIBw5YJsF5z+
	oAM18aHCQNELtUayqRMutt4j0rp9LCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723644397;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sbk0Gwp0X7tJBl29kbtj1MoAttG+GT+BnXCwGaFVjw8=;
	b=8uVOulMNy4WQlpk4qQWcWJ2JT5MVrPQEgoY+wxh7NdSlD5zNi8vpteC47FbBNcv/0uyxfK
	TSYsnISImrlLDVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01DEB139B9;
	Wed, 14 Aug 2024 14:06:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aJTgOuy5vGboTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Aug 2024 14:06:36 +0000
Date: Wed, 14 Aug 2024 16:07:16 +0200
Message-ID: <87ikw3jizv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: Use IS_REACHABLE() for substituting empty ACPI functions
In-Reply-To: <Zry4eIOLOTwaYdaC@ninjato>
References: <20240814121649.261693-1-rf@opensource.cirrus.com>
	<87mslfjk3n.wl-tiwai@suse.de>
	<Zry4eIOLOTwaYdaC@ninjato>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.80

On Wed, 14 Aug 2024 16:00:24 +0200,
Wolfram Sang wrote:
> 
> 
> > > Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> > > Fixes: f17c06c6608a ("i2c: Fix conditional for substituting empty ACPI functions")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202408141333.gYnaitcV-lkp@intel.com/
> > 
> > I suppose Wolfram will take this?
> > 
> > Reviewed-by: Takashi Iwai <tiwai@suse.de>
> 
> Yes, for rc4. I wonder why buildbot did not spot it for the branch I
> submitted to rc3. Things happen, I guess...

Maybe because there was no user that can hit with randconfig.
It was a preliminary fix for the change I recently put after the rc3
release, and now it surfaced.


thanks,

Takashi

