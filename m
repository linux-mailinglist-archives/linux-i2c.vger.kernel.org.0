Return-Path: <linux-i2c+bounces-3805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC688FC790
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 11:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B0B42841C6
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 09:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B85418FC85;
	Wed,  5 Jun 2024 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NdNp5wTv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UoIs5Twn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NdNp5wTv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UoIs5Twn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3974718FC68;
	Wed,  5 Jun 2024 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717579264; cv=none; b=irv8HDx42oRL6PTcFiuGjWPsv/Uzk/9r8v5/KF07/al1J01Ll5+0hx3mXxRSjoa5Tqg6kWDJRIaowXL+mmDQ58m9ZuhIrAmm4LaoRZwYlopm7qpJS+WG8HpTD/otRAyH0LFW7YD9EJvOex0PHfD58prHpmVVQBiycjYrQ1IV0b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717579264; c=relaxed/simple;
	bh=3dD+DPEZQhGugyGqo62gS2c3dIvl2v9D29Io6wzlEXI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gWBytm5tM+idpApoje2zKgA9/P3qnbkhRoqEC3stf6QC5I//sIz5OXU0HQVIH2k6gx4Ylxi24VLcApb2ctfc7NuPOEtUxjxYbqWOyUm7m5L74XZ6D5B+3EWOvWNSWM9qHZCBK2rphRTJNusU2tV8QGSr1P0ondJpoSHrGuR4DtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NdNp5wTv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UoIs5Twn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NdNp5wTv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UoIs5Twn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 53B802198F;
	Wed,  5 Jun 2024 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717579260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrADoXy+bcW3CggAAUu4f0wqlTejDtKqOk7V6ynGtGg=;
	b=NdNp5wTvjmYo4GDz1XcffVPTefSwoc/I9XnU4D1sHIdrZaG4UAQnAD7aZFJW9jyNs+Necm
	TcRpA0T1bdhbNODqXXSqMkTP5V6wsvWxgL1xo4sgotxtOc3vwOUandMiAG8cijcoDSX7nK
	5IKy2odNKN/Vo71NnRCp7FPDGa9p/1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717579260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrADoXy+bcW3CggAAUu4f0wqlTejDtKqOk7V6ynGtGg=;
	b=UoIs5TwnzhUAAgIB1TPCf44vHd8ZvAyfQleTlW2+PvxOureEpLao51Qjf95q0PAz72yY7q
	f+3tC2aTxYmzvIDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717579260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrADoXy+bcW3CggAAUu4f0wqlTejDtKqOk7V6ynGtGg=;
	b=NdNp5wTvjmYo4GDz1XcffVPTefSwoc/I9XnU4D1sHIdrZaG4UAQnAD7aZFJW9jyNs+Necm
	TcRpA0T1bdhbNODqXXSqMkTP5V6wsvWxgL1xo4sgotxtOc3vwOUandMiAG8cijcoDSX7nK
	5IKy2odNKN/Vo71NnRCp7FPDGa9p/1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717579260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrADoXy+bcW3CggAAUu4f0wqlTejDtKqOk7V6ynGtGg=;
	b=UoIs5TwnzhUAAgIB1TPCf44vHd8ZvAyfQleTlW2+PvxOureEpLao51Qjf95q0PAz72yY7q
	f+3tC2aTxYmzvIDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64DF113AA1;
	Wed,  5 Jun 2024 09:20:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hk3VEfstYGYbSQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Wed, 05 Jun 2024 09:20:59 +0000
Date: Wed, 5 Jun 2024 11:20:55 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin
 <peda@axentia.se>
Subject: Re: [PATCH] i2c: smbus: fix NULL function pointer dereference
Message-ID: <20240605112055.7f057e46@endymion.delvare>
In-Reply-To: <bk6rgqfcn5op5iuojoisogvtrp24ldblgkq4g62ffr4z7wnzug@xlp3ce5bx7bs>
References: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
	<1e626d93f4220cc348300bbc61089de32300122d.camel@suse.de>
	<b2tnimag62ty6wndyjsy7u5fay6y52zn47vvifw6rh5abeqzpu@pqyyczutxcwu>
	<20240604171113.232628f9@endymion.delvare>
	<bk6rgqfcn5op5iuojoisogvtrp24ldblgkq4g62ffr4z7wnzug@xlp3ce5bx7bs>
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
X-Spam-Flag: NO
X-Spam-Score: -2.72
X-Spam-Level: 
X-Spamd-Result: default: False [-2.72 / 50.00];
	BAYES_HAM(-2.92)[99.65%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[renesas];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

Hi Wolfram,

On Tue, 4 Jun 2024 22:08:41 +0200, Wolfram Sang wrote:
> > > gracefully because kicking off I2C transfers is not a hot path. Maybe we
> > > could turn the dev_dbg into something louder to make people aware that
> > > there is a bug?  
> > 
> > My previous message initially had a suggestion in that direction ;-)
> > but I first wanted your opinion on the check itself. dev_dbg() is
> > definitely not appropriate for a condition which should never happen
> > and implies there's a bug somewhere else. A WARN_ON_ONCE would probably
> > be better, so that the bug gets spotted and fixed quickly.  
> 
> So, are you okay with keeping the check where it is now and turning the
> dev_dbg into WARN_ON_ONCE? I am.

Yes I am.

Thanks,
-- 
Jean Delvare
SUSE L3 Support

