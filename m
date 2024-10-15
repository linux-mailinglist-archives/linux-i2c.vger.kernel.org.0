Return-Path: <linux-i2c+bounces-7386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C18D99E66B
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 13:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 301911C21156
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 11:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799211E6339;
	Tue, 15 Oct 2024 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vVH+oxkY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IqMKBhbL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vVH+oxkY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IqMKBhbL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B41EBFE4
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992446; cv=none; b=Jju/kDVa8Na2uYGmqm3yNyfV4l5ANXU9nwG0+2+/9GEx56OuRssv8wqCrk+a+tgl9zYFqtHKnhIaDtlVpq9qrQ/wIOBHSi8EkMHwThVCxzFRg1S2ZSQusV9ks6Z71Vl0EkORX0JabGQh3I2ptpLMSw8y5tvA9zPK52SL/WFju+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992446; c=relaxed/simple;
	bh=5+JTKa8izl+Q4keE4yJ+9Du6Dw0vgya9lsm+Pyjbwj0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I0Ax13mcDFToi8vgx8BH1qHrtyuGk2hHlkfUaGny0XhES8/PPmZV2toZHSiQhwI1dK5/9RUNDiwjMafCJNjGuk12R2QPaiG2gTfo0Z6QktUSjbvtAoSbuQkvdMAe/YcehxifO2RPgtQufgKJfXxVKs70O5IlifPhf7gaTIKt5L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vVH+oxkY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IqMKBhbL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vVH+oxkY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IqMKBhbL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BCE501F7F5;
	Tue, 15 Oct 2024 11:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728992442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcUV1YNcEfgMApfolBm6XxBFkyk0Lz8ZYseuLKIUnvI=;
	b=vVH+oxkYvD00zH0Xgr54kP78JrD+xTbOx4QPlLsLZOM53e4gs4RHEQJy64be6DirVYwqFI
	LXQAqJ6qcTEeG99JFLquleyJo+NYQfzBYwU01i2OBYPCAxuVIT0S0w42/fpdtHsybejN+z
	Lktg06ldEhvuqT9oz9DP+k3FBfp1MoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728992442;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcUV1YNcEfgMApfolBm6XxBFkyk0Lz8ZYseuLKIUnvI=;
	b=IqMKBhbL8Q1IwMahp9zQxJaeREHQj+8gRRTSfoJC7j++/uleeKE98C10HH6KV9jBGlutNu
	mOOjb4lj6BeZk2DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vVH+oxkY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IqMKBhbL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728992442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcUV1YNcEfgMApfolBm6XxBFkyk0Lz8ZYseuLKIUnvI=;
	b=vVH+oxkYvD00zH0Xgr54kP78JrD+xTbOx4QPlLsLZOM53e4gs4RHEQJy64be6DirVYwqFI
	LXQAqJ6qcTEeG99JFLquleyJo+NYQfzBYwU01i2OBYPCAxuVIT0S0w42/fpdtHsybejN+z
	Lktg06ldEhvuqT9oz9DP+k3FBfp1MoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728992442;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcUV1YNcEfgMApfolBm6XxBFkyk0Lz8ZYseuLKIUnvI=;
	b=IqMKBhbL8Q1IwMahp9zQxJaeREHQj+8gRRTSfoJC7j++/uleeKE98C10HH6KV9jBGlutNu
	mOOjb4lj6BeZk2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 854E113A42;
	Tue, 15 Oct 2024 11:40:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L+WJHrpUDmdsTQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 15 Oct 2024 11:40:42 +0000
Date: Tue, 15 Oct 2024 13:40:41 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa@kernel.org>
Cc: Linux I2C <linux-i2c@vger.kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <20241015134041.4b7ddb6f@endymion.delvare>
In-Reply-To: <ZRZ9v3GTLcH3kBnw@ninjato>
References: <20230928101655.47d3dd2a@endymion.delvare>
	<ZRZ9v3GTLcH3kBnw@ninjato>
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
X-Rspamd-Queue-Id: BCE501F7F5
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,endymion.delvare:mid,suse.de:email,suse.de:dkim];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Hi Wolfram,

On Fri, 29 Sep 2023 09:33:19 +0200, Wolfram Sang wrote:
> On Thu, Sep 28, 2023 at 10:16:55AM +0200, Jean Delvare wrote:
> > The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> > written at a time when the i2c core did not support muxing. They are
> > essentially board-specific hacks. If we had to add support for these
> > boards today, we would implement it in a completely different way.
> > 
> > These Tyan server boards are 18 years old by now, so I very much doubt
> > any of these is still running today. So let's just drop this clumsy
> > code. If anyone really still needs this support and complains, I'll
> > rewrite it in a proper way on top of i2c-mux.
> > 
> > This also fixes the following warnings:
> > drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' was not declared. Should it be static?
> > drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' was not declared. Should it be static?
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Andi Shyti <andi.shyti@kernel.org>  
> 
> Applied to for-next, thanks!

What happened to this patch? This was one year ago but I can't find it
upstream. Should I resend it?

-- 
Jean Delvare
SUSE L3 Support

