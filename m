Return-Path: <linux-i2c+bounces-5158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A7948D8C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 13:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81BB4B24654
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 11:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08BA1BF323;
	Tue,  6 Aug 2024 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n9l23a5/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rjt6OuJX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n9l23a5/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rjt6OuJX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B718913B2AC;
	Tue,  6 Aug 2024 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722943140; cv=none; b=tYZ3oZtAeyW637Nh3avEsNzCJPWYuNcw/FSxJWFnB0xWCEw9gz6KveqT3PJPykOUwtKxQXNbAQUGU0CWiouIXI1Q7dpv1lpPPmrdBTwMZcXSjYRV7RozGKUUYmgWNM+N7h4ryz6vae9dyuwxNHeNjljdrjiSTiSQhdE7JBzu5mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722943140; c=relaxed/simple;
	bh=8BUzzRru+/43DuQKPnhbK2LPG1G0P3g23DddT18Kpcc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SQoJcLm1EwnAjzrHlK3bYkCi12GVHnRewF67B1y3reu7y98YkJvuEbYWnTD29gWdBCzh9y1HGXJZDJEPF8fSFB9wsQx2P59TIgLa7yRe/CKjEEXlIfEVlPOu6Z6ZFbJleTDy8EJWCLAehhtBZmauEwQrF4+URtDYLgWMkGON4SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n9l23a5/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Rjt6OuJX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n9l23a5/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Rjt6OuJX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE2B921A62;
	Tue,  6 Aug 2024 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722943136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1kLy9/h0D2rS5CxemLFm3ND3dOyCK9OpFA4lmDW1s3s=;
	b=n9l23a5/FgEisL2yXRMX66LjOdQW3cDDdJIs3f68r51UucXbOlBmpC4sVcQ3tEFlk1pyN4
	BT4xyMttIvdjymcMAm/4QS3XxnHj2npiZFrof8abx1ZR/6PU4zR0UK9ANZP1QoEH/+oqyT
	mnXjPeM3i2yvRuu1h740qr0S7dXkuY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722943136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1kLy9/h0D2rS5CxemLFm3ND3dOyCK9OpFA4lmDW1s3s=;
	b=Rjt6OuJX7kXh4HD/Q93PGGO3UGur80L5NQAzhw71DY/nvlPnNAxTKBiSasQR3S+OySwMTp
	ukuwMIyDCr6ZlMBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="n9l23a5/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Rjt6OuJX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722943136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1kLy9/h0D2rS5CxemLFm3ND3dOyCK9OpFA4lmDW1s3s=;
	b=n9l23a5/FgEisL2yXRMX66LjOdQW3cDDdJIs3f68r51UucXbOlBmpC4sVcQ3tEFlk1pyN4
	BT4xyMttIvdjymcMAm/4QS3XxnHj2npiZFrof8abx1ZR/6PU4zR0UK9ANZP1QoEH/+oqyT
	mnXjPeM3i2yvRuu1h740qr0S7dXkuY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722943136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1kLy9/h0D2rS5CxemLFm3ND3dOyCK9OpFA4lmDW1s3s=;
	b=Rjt6OuJX7kXh4HD/Q93PGGO3UGur80L5NQAzhw71DY/nvlPnNAxTKBiSasQR3S+OySwMTp
	ukuwMIyDCr6ZlMBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CDA213981;
	Tue,  6 Aug 2024 11:18:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GEu9JaAGsmYNIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Aug 2024 11:18:56 +0000
Date: Tue, 06 Aug 2024 13:19:35 +0200
Message-ID: <87frrhaofs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	<tiwai@suse.com>,
	<mika.westerberg@linux.intel.com>,
	<linux-sound@vger.kernel.org>,
	<linux-spi@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/3] ALSA: Add support for new HP G12 laptops
In-Reply-To: <554660e1-01ea-4bb4-877f-fd8deb527ce7@opensource.cirrus.com>
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
	<8734njl7my.wl-tiwai@suse.de>
	<554660e1-01ea-4bb4-877f-fd8deb527ce7@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.99 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[renesas];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: BE2B921A62
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 0.99

On Tue, 06 Aug 2024 13:06:25 +0200,
Richard Fitzgerald wrote:
> 
> On 5/8/24 09:02, Takashi Iwai wrote:
> > On Fri, 02 Aug 2024 17:22:12 +0200,
> > Richard Fitzgerald wrote:
> >> 
> >> Add support for HP G12 laptops that use CS35L54 or CS35L56 amplifiers
> >> with Realtek HDA codecs. Some of these use the same SSID for models with
> >> CS35L54 and models with CS35L56 so the ACPI entries are examined to
> >> determine which amp is present.
> >> 
> >> To avoid having to #ifdef around this code we've fixed the definitions
> >> of SPI and I2C functions that were not correctly supplying dummy functions
> >> when the real functions are not in the build.
> >> 
> >> Changes since V1:
> >> Added I2C and SPI patches to provide dummy functions.
> >> 
> >> Richard Fitzgerald (2):
> >>    spi: Add empty versions of ACPI functions
> >>    i2c: Fix conditional for substituting empty ACPI functions
> >> 
> >> Simon Trimmer (1):
> >>    ALSA: hda/realtek: Add support for new HP G12 laptops
> > 
> > Hm, the 3rd patch requires both patch 1 and 2, and now those seem to
> > have been applied to two different trees, which makes hard to apply
> > the 3rd one.
> > 
> > Mark, Wolfram, will you guys submit PR for 6.11-rc3 including the
> > patch 1 and 2?  If so, I can apply the patch 3 later on top of
> > 6.11-rc3.
> > 
> > Or, I'd need to pull from both of you and apply the patch 3.
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> We've just noticed that the SPI patches have gone into for-6.12.
> We really hoped that we could get the main patch (G12 support) into
> 6.11 (yes, I know, I didn't actually say that we were targeting 6.11 -
> sorry).

I also planned for 6.12, but fortunately didn't take it yet, so it's
no problem :)

And, I see Mark's PR is based on Linus tree, so that's fine to take.
The remaining question is about the i2c patch.

Wolfram, has the patch been merged for your branch for 6.11?  If yes,
can I pull your change, so that I can apply the patch 3 together with
the SPI change?


thanks,

Takashi

