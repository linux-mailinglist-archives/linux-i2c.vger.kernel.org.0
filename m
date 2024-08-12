Return-Path: <linux-i2c+bounces-5295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F894E79C
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 09:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 365321C215A7
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 07:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DBE1537D0;
	Mon, 12 Aug 2024 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TDmw3Bhn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TbsAkVDi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TDmw3Bhn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TbsAkVDi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB1B45C0B;
	Mon, 12 Aug 2024 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723447162; cv=none; b=Z7AUUh9ihH9ol1RXtpO12OHpcdMZaJ/r/beGwOxTL45HFsuzuP01HB84dWTvuzbv9l36oumlX1Me8Q3uPMLslYYxUihMaeRMoB/F/gToigYeiTyqRcQA9YKqu6ORpSCOmTXy78kiiEh5+YjLU3rV2zoo79Jr+j4W3kqnStaOwqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723447162; c=relaxed/simple;
	bh=sRUXMwjSmi1GkAra9w2iwkY9tk6v4iLnR2fzKyJxasc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLxJtnNm/CM5ZIdqKGEP46uqKltHfw1ACtJ9QzFH0H65XlfBuqB6TrY4MJs0u1DQpNYMjTF4kspFcGq1kU6QKL8zPYmPV6NmHzJ9GLGTXcoAdkzqYEhj+7imu/cOvfYx15nTThRdoVOf2yMcP3RX/UV+kUgEXGmauP/2fiyI3Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TDmw3Bhn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TbsAkVDi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TDmw3Bhn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TbsAkVDi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2D57722495;
	Mon, 12 Aug 2024 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723447159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BV21c6aJPFZaXXV+r6TlWq1+Q933CkTAH8jiaaihV5U=;
	b=TDmw3Bhn6g9gITzgODfixa23LNOoUEgHoglLP9p5xxoTWkrifJrtgDsb+tTfx2F3Pi8KLY
	Mb/nm8zH/7l/V19aU4lHkc+XHfBIuN7WY+oqC5XPiI234ALp7k747qrSx65YRkmG9U5vU0
	BKbELgI7uuHK5QDbGILpFp7/srT04+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723447159;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BV21c6aJPFZaXXV+r6TlWq1+Q933CkTAH8jiaaihV5U=;
	b=TbsAkVDiEsfhPIrS6kJmpwQBbJ3anhhHpyJhqvkFC4K8+k59jEJDBzj7YK3XoJu9U4xYRf
	9fRBIyGW3MXY2ABg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723447159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BV21c6aJPFZaXXV+r6TlWq1+Q933CkTAH8jiaaihV5U=;
	b=TDmw3Bhn6g9gITzgODfixa23LNOoUEgHoglLP9p5xxoTWkrifJrtgDsb+tTfx2F3Pi8KLY
	Mb/nm8zH/7l/V19aU4lHkc+XHfBIuN7WY+oqC5XPiI234ALp7k747qrSx65YRkmG9U5vU0
	BKbELgI7uuHK5QDbGILpFp7/srT04+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723447159;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BV21c6aJPFZaXXV+r6TlWq1+Q933CkTAH8jiaaihV5U=;
	b=TbsAkVDiEsfhPIrS6kJmpwQBbJ3anhhHpyJhqvkFC4K8+k59jEJDBzj7YK3XoJu9U4xYRf
	9fRBIyGW3MXY2ABg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D78EC137BA;
	Mon, 12 Aug 2024 07:19:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MEfqMna3uWY6CwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Aug 2024 07:19:18 +0000
Date: Mon, 12 Aug 2024 09:19:59 +0200
Message-ID: <87le122oo0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	tiwai@suse.com,
	wsa+renesas@sang-engineering.com,
	mika.westerberg@linux.intel.com,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v2 0/3] ALSA: Add support for new HP G12 laptops
In-Reply-To: <c2dafdd5-64c5-4184-9b19-da4988993195@sirena.org.uk>
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
	<c2dafdd5-64c5-4184-9b19-da4988993195@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: *
X-Spamd-Result: default: False [1.20 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: 1.20

On Mon, 05 Aug 2024 21:40:05 +0200,
Mark Brown wrote:
> 
> On Fri, Aug 02, 2024 at 04:22:12PM +0100, Richard Fitzgerald wrote:
> > Add support for HP G12 laptops that use CS35L54 or CS35L56 amplifiers
> > with Realtek HDA codecs. Some of these use the same SSID for models with
> > CS35L54 and models with CS35L56 so the ACPI entries are examined to
> > determine which amp is present.
> 
> The following changes since commit a0c04bd55a467aee3eb647555343ad6971106e86:
> 
>   Merge tag 'kbuild-fixes-v6.11' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild (2024-07-28 14:02:48 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-acpi-lookup-dummy
> 
> for you to fetch changes up to 90ec3a8a7fd0d43026fcca979713e077d4883b56:
> 
>   spi: Add empty versions of ACPI functions (2024-08-02 18:51:59 +0100)
> 
> ----------------------------------------------------------------
> spi: Add empty versions of ACPI lookup functions
> 
> A patch from Richard Fitzgerald adding dummy versions of the ACPI lookup
> functions for SPI:
> 
>     Provide empty versions of acpi_spi_count_resources(),
>     acpi_spi_device_alloc() and acpi_spi_find_controller_by_adev()
>     if the real functions are not being built.
> 
>     This commit fixes two problems with the original definitions:
> 
>     1) There wasn't an empty version of these functions
>     2) The #if only depended on CONFIG_ACPI. But the functions are implemented
>        in the core spi.c so CONFIG_SPI_MASTER must also be enabled for the real
>        functions to exist.

Pulled now.  Thanks.


Takashi

