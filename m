Return-Path: <linux-i2c+bounces-5138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1AB947683
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 10:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9604E281A89
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 08:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50CF149E05;
	Mon,  5 Aug 2024 08:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="13uQIKv7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mvv4jGto";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="13uQIKv7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mvv4jGto"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4E25FBBA;
	Mon,  5 Aug 2024 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844914; cv=none; b=iy/htWHSHP0k3SxJB5lGOi4iq10Osnj1apdqEWL5VLhudkssDN5+YwLCJwXIy4oE9h4G/YW3BU6Do/10e1OkuRk9nNt7CyFK9ZQucvq3rdiUFJjRJc/80f6LdbstcHxdeF7mYfOfz41VpaSMvUDNa+5GP9vf/lhLHB7YOLaz410=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844914; c=relaxed/simple;
	bh=Pg+7SCzJv6OtadhTgZlGWpeTcW5bKG3kPl2otJbqWTE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BEzGj+iiYyrTQTl+tDFrCRwiaRXbpDVQh1aZtu2VskucmGKv8jXQf1c4jH0tpm/w/LUeFCV6h6RthSTQ4lLEIN8fAwu3+m9V8C/g38bmUi1CN2TsITqNtDuYYOSQFmtmZq4Z/IHAGyda978sZZylnNxeY8FvVViiObqOEIX0eMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=13uQIKv7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mvv4jGto; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=13uQIKv7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mvv4jGto; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2820921B7A;
	Mon,  5 Aug 2024 08:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722844911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WQBFVLgbh9yJT96vQAG+eO99zw3cCJbZ3algJD+xE/o=;
	b=13uQIKv7d1dNkvZCmT5gr8jAnXEuMvmdAcaUIIpX/+awQCbkCdV6gMFEXkmMAcA5i3FKcj
	4+8wyaVyNq5xPVcjfSc2XOH8I8bKha6+bvZq2bqh2yOvnvMan2A8T4si3ka25DRsAC6og4
	gQiWtachLx88Hrb3IiaFE57qoUU2Txk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722844911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WQBFVLgbh9yJT96vQAG+eO99zw3cCJbZ3algJD+xE/o=;
	b=Mvv4jGtoW+6+fZIl8xR45GIUtSZN01lix1fCLNr+IhWLBItdZFRDF6AkVTqxb9WfmVZvUv
	rb6MENY80v0uChDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=13uQIKv7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Mvv4jGto
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722844911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WQBFVLgbh9yJT96vQAG+eO99zw3cCJbZ3algJD+xE/o=;
	b=13uQIKv7d1dNkvZCmT5gr8jAnXEuMvmdAcaUIIpX/+awQCbkCdV6gMFEXkmMAcA5i3FKcj
	4+8wyaVyNq5xPVcjfSc2XOH8I8bKha6+bvZq2bqh2yOvnvMan2A8T4si3ka25DRsAC6og4
	gQiWtachLx88Hrb3IiaFE57qoUU2Txk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722844911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WQBFVLgbh9yJT96vQAG+eO99zw3cCJbZ3algJD+xE/o=;
	b=Mvv4jGtoW+6+fZIl8xR45GIUtSZN01lix1fCLNr+IhWLBItdZFRDF6AkVTqxb9WfmVZvUv
	rb6MENY80v0uChDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2D7F13254;
	Mon,  5 Aug 2024 08:01:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3BVEMu6GsGZiVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 Aug 2024 08:01:50 +0000
Date: Mon, 05 Aug 2024 10:02:29 +0200
Message-ID: <8734njl7my.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>,
    Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
    <tiwai@suse.com>,
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
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2820921B7A
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

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

Hm, the 3rd patch requires both patch 1 and 2, and now those seem to
have been applied to two different trees, which makes hard to apply
the 3rd one.

Mark, Wolfram, will you guys submit PR for 6.11-rc3 including the
patch 1 and 2?  If so, I can apply the patch 3 later on top of
6.11-rc3.

Or, I'd need to pull from both of you and apply the patch 3.


thanks,

Takashi

