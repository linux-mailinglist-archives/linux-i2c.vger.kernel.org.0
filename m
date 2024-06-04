Return-Path: <linux-i2c+bounces-3796-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC468FB6AE
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 17:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71B6CB24484
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 15:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFB413D50E;
	Tue,  4 Jun 2024 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1UKubv5G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zicZU98k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1UKubv5G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zicZU98k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9445F4C91;
	Tue,  4 Jun 2024 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513887; cv=none; b=upJMUWp2FM4xi3vsp969L4gXhuvlc+cE42loq1xXrVgdTnyfqpkjYkp/pqIzWAxlU26zxgOuP49B/m7v3jcJUvOmYDb8AOQqVMqdAesMcDNQDSWTnVXpR9FVN9mWqqMjMVvzL/Q8Wg2RYNjIbue0AzLmXzMDk08kDNNtoGSzUnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513887; c=relaxed/simple;
	bh=QEz05DuTsIvHAwj2T7TyXVgPHATwBc4k25U6wzxI1fM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKKLjOeoDSus3BevKeH1JES+pHa9mSsgsm04vFxcz509TSAdZcP/t49maLr8LGNr8fi2dGYR29VPFR6fuRbHGwlcuTYG7ue6hfkpun0pf9x+mWOUe/9opwyK4tFRmyr7Tr/gOe4Ag5PP1wizAklaRoKnfTTQICQ0Q65vDRKmA7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1UKubv5G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zicZU98k; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1UKubv5G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zicZU98k; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 94E541F803;
	Tue,  4 Jun 2024 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717513882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=suG/UwcmICtQXRCel+rkvU09OoVD7nEthrbtfU0L2LU=;
	b=1UKubv5G1QmsZNeH6WNzmwGBJahPo70aYyMUqME4cgTkgvCyQed03TyvzaQzfjGOb4Ti0O
	Mq8XnTUSkv2H+S7scAQjFJb4h1yrTNJFZuJsjLtXDQp/xaa0V8w7gdstOpQxE1HOW8EqRY
	Jo0KbjxEYi+IxlPUyzZncF5DZdF7cZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717513882;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=suG/UwcmICtQXRCel+rkvU09OoVD7nEthrbtfU0L2LU=;
	b=zicZU98kiHvP2nllYoLgmyLu5LG4Gwm5U+32RLTv2B2BhdFuzRNZZWZLEQUpBSu58b3/hm
	DYYqSDFgU2SOKdAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1UKubv5G;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zicZU98k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717513882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=suG/UwcmICtQXRCel+rkvU09OoVD7nEthrbtfU0L2LU=;
	b=1UKubv5G1QmsZNeH6WNzmwGBJahPo70aYyMUqME4cgTkgvCyQed03TyvzaQzfjGOb4Ti0O
	Mq8XnTUSkv2H+S7scAQjFJb4h1yrTNJFZuJsjLtXDQp/xaa0V8w7gdstOpQxE1HOW8EqRY
	Jo0KbjxEYi+IxlPUyzZncF5DZdF7cZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717513882;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=suG/UwcmICtQXRCel+rkvU09OoVD7nEthrbtfU0L2LU=;
	b=zicZU98kiHvP2nllYoLgmyLu5LG4Gwm5U+32RLTv2B2BhdFuzRNZZWZLEQUpBSu58b3/hm
	DYYqSDFgU2SOKdAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7499413ABC;
	Tue,  4 Jun 2024 15:11:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GQ6uFZQuX2YIIAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 04 Jun 2024 15:11:16 +0000
Date: Tue, 4 Jun 2024 17:11:13 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin
 <peda@axentia.se>
Subject: Re: [PATCH] i2c: smbus: fix NULL function pointer dereference
Message-ID: <20240604171113.232628f9@endymion.delvare>
In-Reply-To: <b2tnimag62ty6wndyjsy7u5fay6y52zn47vvifw6rh5abeqzpu@pqyyczutxcwu>
References: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
	<1e626d93f4220cc348300bbc61089de32300122d.camel@suse.de>
	<b2tnimag62ty6wndyjsy7u5fay6y52zn47vvifw6rh5abeqzpu@pqyyczutxcwu>
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
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 94E541F803
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

Hi Wolfram,

Thanks for your answer.

On Tue, 4 Jun 2024 10:50:30 +0200, Wolfram Sang wrote:
> Hi Jean,
> 
> > I have a hard time establishing a formal link between the reported bug
> > and the commit listed above. I do understand that it wouldn't make
> > sense to register an i2c_adapter with neither .master_xfer nor
> > .smbus_xfer set before .reg_slave was added to struct i2c_algorithm,
> > but there were no checks in i2c-core preventing it from happening.  
> 
> Well, yes, correct.
> 
> > It was also possible for any (broken) device driver to call
> > __i2c_transfer() without first checking if plain I2C transfers were
> > actually supported by the i2c_adapter. I would argue that such an issue
> > should have been fixed at the device driver level by checking for the
> > I2C_FUNC_I2C functionality flag before calling __i2c_transfer(). That's
> > a theoretical issue though as I'm not aware of any device driver having
> > this issue.  
> 
> In theory, checking against I2C_FUNC_I2C should happen. In practice,
> most I2C drivers do not do this. Being picky here could results in bad
> user experience because of OOPS. If we really want to enforce checking
> I2C_FUNC_I2C, then we should have this safety net while we convert all
> users. No, actually, I think we always should have some safety nets.

Point taken, makes sense.

Note that we still want I2C_FUNC_I2C to be set properly, because it
allows device drivers to optimize transfers (the at24 driver is a prime
example of that) or even just to bind to the I2C bus (for device
drivers which properly check for it).

> > The call stack in Baruch's report shows that the real issue is with
> > i2c_smbus_xfer_emulated() being called with the i2c bus lock already
> > held, and thus having to call __i2c_transfer() instead of
> > i2c_transfer(). This code path did not exist before commit 63453b59e411
> > ("i2c: smbus: add unlocked __i2c_smbus_xfer variant"), which was added
> > in kernel v4.19. Therefore I claim that CVE-2024-35984 only affects
> > kernel v4.19 and newer. Do we agree on that?  
> 
> (There is a CVE for it??) For Baruch's case, this is true. But there are
> __i2c_transfer users all over the tree, they are all potentially
> vulnerable, or?

Yes there are many, but I think we shall differentiate between 2 cases:
* Missing check in a specific kernel device driver. These are unlikely
  to be a problem in practice because (1) these devices are typically
  instantiated explicitly, and such explicit code or device tree
  description would not exist in the first place if said device was not
  compatible with said I2C bus, and (2) if such an incompatibility was
  really present then it would have been spotted and fixed very
  quickly. Arbitrary binding through sysfs attributes is still possible
  but would definitely require root access and evil intentions (at
  which point we are screwed no matter what). I'm honestly not worried
  about this scenario.
* The issue being triggered from user-space through i2c-dev, which is
  what Baruch reported. The user doing that can target any arbitrary
  I2C bus and thus cause the oops by accident or even on purpose. For
  me this is what CVE-2024-35984 is about. What limits the attack
  surface here is that slave-only I2C buses are rare and you typically
  need to be root to use i2c-dev. But this is still a serious issue.

Also note that the first case could happen ever since __i2c_transfer()
was introduced (kernel v3.6, commit b37d2a3a75cb) and is not limited to
slave-only adapters, as any SMBus-only i2c_adapter would also be
vulnerable.

So the "Fixes:" tag in commit 91811a31b68d is incorrect for both
scenarios.

> (...)
> I see the performance penalty, yet I prefer handling the buggy driver
> gracefully because kicking off I2C transfers is not a hot path. Maybe we
> could turn the dev_dbg into something louder to make people aware that
> there is a bug?

My previous message initially had a suggestion in that direction ;-)
but I first wanted your opinion on the check itself. dev_dbg() is
definitely not appropriate for a condition which should never happen
and implies there's a bug somewhere else. A WARN_ON_ONCE would probably
be better, so that the bug gets spotted and fixed quickly.

-- 
Jean Delvare
SUSE L3 Support

