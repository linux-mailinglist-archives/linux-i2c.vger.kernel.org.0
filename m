Return-Path: <linux-i2c+bounces-5383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B734951C14
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 15:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3E41F262B3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 13:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9E01B1432;
	Wed, 14 Aug 2024 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="COfGEDOw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TBTx0kkM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bl8kmKoe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FkzcDe9+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F0B1AE031;
	Wed, 14 Aug 2024 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723642969; cv=none; b=O8m36Hsxs34jb8dvi1VOAOCKa17S2dZDMfCh2Zkus87LSMmdEsT0zANH5ZlDHezeBDEmecX+euwCQZmuoerYhw2TaU72T1b4kqE1VHdzxvh5dwNZBC9CywehCgCZO+aKcPYAF8NRM/gWQWzgugKcYxO7FpP9hq1QPSKvRsENXqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723642969; c=relaxed/simple;
	bh=WElS3mfli0DGQioQOaCr4m+G9dLQ0kce+kM7l+R5D0w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jG7O5al/LxzuFk2WD6D4HMp662UpT4I87KMpatSQduFz4/7haG94yVZxl9VuV68mHCTV2AAIuXE2M//CLpZt/QqoMYR96OllDEaJq+dG39lB5EAeGfDQACjgBoesIdgRr8KJz4M7ELQ129DaIRVB5uub7QvnUv1cxNENMhseIS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=COfGEDOw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TBTx0kkM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bl8kmKoe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FkzcDe9+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7FE93227FA;
	Wed, 14 Aug 2024 13:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723642965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2mvAsYeij2YEDtYX9o/Yq3K/UyNb/EsAUSLAOJHofjM=;
	b=COfGEDOwKmywxLSIe8/65Mr/6iyMx1AlfhjTK0i4SEYCONQeT10mITVn/fYDZklZyRt827
	19i4MpL3RZAO0kepms3x75tlA8ne9X8ws9y3fwxTRrCrAvoB8jxYq5st5Cfo9u3FBgWzeb
	s/VRlZ4rkHDRwKwPClyZt3EClaZyvKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723642965;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2mvAsYeij2YEDtYX9o/Yq3K/UyNb/EsAUSLAOJHofjM=;
	b=TBTx0kkMkZCEsUsopLSvuksfAGS7N6tmY29M80Po/ieHcmIGihxSj7NpHL888cnf5aVruF
	4X1/4reYFuO/Z7Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Bl8kmKoe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FkzcDe9+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723642964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2mvAsYeij2YEDtYX9o/Yq3K/UyNb/EsAUSLAOJHofjM=;
	b=Bl8kmKoebd5bcmLeHUbOWkrakPknvXWs/0+a/qyaoKHn74sbc4FW+zbE+D8IxzYNVPv2H4
	gefXFBIw2oQ+yV2GrAMAV6X69a0Zx+eD87Xo4ISe0vfLVWK6qDi5OWQ+PZcuOYIGGMOqT7
	kbMf1W73/iMJ2n/vHMcKCWTNkBmdcUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723642964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2mvAsYeij2YEDtYX9o/Yq3K/UyNb/EsAUSLAOJHofjM=;
	b=FkzcDe9+HStoKw3iF8EzIeaKXvcVwqW4ODJLUXE8DrfA45wum0UPD34zkN1mVsAtrwp+Cx
	R6IZpTy/kLruROAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 430EB1348F;
	Wed, 14 Aug 2024 13:42:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AEYMD1S0vGZcRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Aug 2024 13:42:44 +0000
Date: Wed, 14 Aug 2024 15:43:24 +0200
Message-ID: <87mslfjk3n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <wsa+renesas@sang-engineering.com>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	"kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] i2c: Use IS_REACHABLE() for substituting empty ACPI functions
In-Reply-To: <20240814121649.261693-1-rf@opensource.cirrus.com>
References: <20240814121649.261693-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[renesas];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,cirrus.com:email,intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 7FE93227FA
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Wed, 14 Aug 2024 14:16:49 +0200,
Richard Fitzgerald wrote:
> 
> Replace IS_ENABLED() with IS_REACHABLE() to substitute empty stubs for:
>     i2c_acpi_get_i2c_resource()
>     i2c_acpi_client_count()
>     i2c_acpi_find_bus_speed()
>     i2c_acpi_new_device_by_fwnode()
>     i2c_adapter *i2c_acpi_find_adapter_by_handle()
>     i2c_acpi_waive_d0_probe()
> 
> commit f17c06c6608a ("i2c: Fix conditional for substituting empty ACPI
> functions") partially fixed this conditional to depend on CONFIG_I2C,
> but used IS_ENABLED(), which is wrong since CONFIG_I2C is tristate.
> 
> CONFIG_ACPI is boolean but let's also change it to use IS_REACHABLE()
> to future-proof it against becoming tristate.
> 
> Somehow despite testing various combinations of CONFIG_I2C and CONFIG_ACPI
> we missed the combination CONFIG_I2C=m, CONFIG_ACPI=y.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: f17c06c6608a ("i2c: Fix conditional for substituting empty ACPI functions")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408141333.gYnaitcV-lkp@intel.com/

I suppose Wolfram will take this?

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

