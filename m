Return-Path: <linux-i2c+bounces-6615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E0976950
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 14:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE480B21095
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 12:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF2C1A3AAF;
	Thu, 12 Sep 2024 12:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uUecJTXO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RxdfoKui";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uUecJTXO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RxdfoKui"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9351C1A304C
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726144945; cv=none; b=AjeU6UCcS+CYnQg3LWjv8tAK4hmFpyQxvJzV6k7Sm8L2BR7kFanvuUvYEVuwUQ9p3EMbcGiOwqh11qFzB64wHirvcruLiBjAUVZIn7Z100zNjrkDJROX7hdzp5lTcMLStvBBwrIIwLtkvYA0uvcKlj1EXxV8kUMJ3Y5FZjYmZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726144945; c=relaxed/simple;
	bh=GGUBcvztPyZoge/Yc5oF9sIvpupfiWlgt43rI11emvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJxbcal38C9qIcjgGtWB3Qe4MFSbC07jPTdb50FcUoQZ6mjlo8XfcJ7Bd3UcqUuECKv+N9MlLQzAPQp0OQTVFQOTp0DConxT8uk4LWPuQ0ts+YjojlMDLElI6lXd/9fCZ8EoWbrG7UTCUBXExuiY+SDNjgxhbuK+IRihL6yhJoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uUecJTXO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RxdfoKui; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uUecJTXO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RxdfoKui; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B886D21B0F;
	Thu, 12 Sep 2024 12:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726144941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQyWHbagZKYBD06j3AXEKnS5Rr/ZdbhBmaRd53ENaOg=;
	b=uUecJTXOS930egRB42pi01mBxjQ90BMuQkaRC1rh/xkNFcIdnBqQbrko13JWQQdH94e1rs
	ZuZ/HxAxAyGCzSSbhpuFkNqhoOkrsmZVA/ULDtGlGU4iXSGD3hWuI6KMoqzz7a8swv9k45
	48U1E5MXIvgZLiE52xlBJnN8Rxi53L0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726144941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQyWHbagZKYBD06j3AXEKnS5Rr/ZdbhBmaRd53ENaOg=;
	b=RxdfoKuiCGRxMb8e/EPEKgmf1BUTxr4mf2WKuz67b13RPnJAxq6sd7zAgbgMZ4JD0c3Uo5
	fF3jnyWbQGaGsRBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726144941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQyWHbagZKYBD06j3AXEKnS5Rr/ZdbhBmaRd53ENaOg=;
	b=uUecJTXOS930egRB42pi01mBxjQ90BMuQkaRC1rh/xkNFcIdnBqQbrko13JWQQdH94e1rs
	ZuZ/HxAxAyGCzSSbhpuFkNqhoOkrsmZVA/ULDtGlGU4iXSGD3hWuI6KMoqzz7a8swv9k45
	48U1E5MXIvgZLiE52xlBJnN8Rxi53L0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726144941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQyWHbagZKYBD06j3AXEKnS5Rr/ZdbhBmaRd53ENaOg=;
	b=RxdfoKuiCGRxMb8e/EPEKgmf1BUTxr4mf2WKuz67b13RPnJAxq6sd7zAgbgMZ4JD0c3Uo5
	fF3jnyWbQGaGsRBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9397F13AD8;
	Thu, 12 Sep 2024 12:42:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UUr/Ia3h4mZHYAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 12 Sep 2024 12:42:21 +0000
Date: Thu, 12 Sep 2024 14:42:19 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools v2] README: ask for DCO in contributions
Message-ID: <20240912144219.3b1b4089@endymion.delvare>
In-Reply-To: <Zrzy2zW8zXTGyphQ@shikoro>
References: <20240807112835.14346-1-wsa+renesas@sang-engineering.com>
	<20240808112746.42fa8590@endymion.delvare>
	<Zrzy2zW8zXTGyphQ@shikoro>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[renesas];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

Hi Wolfram,

On Wed, 14 Aug 2024 20:09:31 +0200, Wolfram Sang wrote:
> > > the 'i2ctransfer' improvements I just sent out, I think we could aim for
> > > a 4.4 release soon, or? It's been 3 years and the updates are small but
> > > still neat, I think.  
> > 
> > OK!  
> 
> I just pushed the 3 commits I had pending for 4.4. From my side, we are
> ready to go. Do you still have something to be included for 4.4.?

Well there's one pending patch which I posted to the linux-i2c list in
May 2022 but never got feedback:

https://marc.info/?l=linux-i2c&m=165338543312881&w=2

There were some changes meanwhile so it must be updated to apply again,
but this is trivial to do. I'll post the updated version, it would be
great if you can test it and we can include it in version 4.4.

Thanks,
-- 
Jean Delvare
SUSE L3 Support

