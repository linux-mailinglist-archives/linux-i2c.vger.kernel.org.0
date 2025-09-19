Return-Path: <linux-i2c+bounces-13057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A054FB88722
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Sep 2025 10:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A9D7524C9D
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Sep 2025 08:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0A62FFDD2;
	Fri, 19 Sep 2025 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VynZUpFR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pxp60Xm/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VynZUpFR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pxp60Xm/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3822FF67D
	for <linux-i2c@vger.kernel.org>; Fri, 19 Sep 2025 08:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758271126; cv=none; b=JGIBP7K8AohNh4uhngcxMPjHXfyAassfhuJMVIwjHPdhzAJfMfE5zUa/mTi3P6ExuOUhrB7lgr0/jcRoK9ooefV9rHc11Ku9mYRf1x9ol9rcr3Rl1Jwd/dv+g4LZFf8rQQkFMA3UPnpw2VTvJdRCLcwHEggo/ehoP3WxzcH57A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758271126; c=relaxed/simple;
	bh=0D3L0MRf7yxqYXaeBIomSTaysZl7Z/IVdGa+AanUGAA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MvjdY5s5JOUvUtzC1Kmm3KOm9UJg/Qpm7wvcySCpV6FA+JYzLphlgJ13NFgDJwYNEA++EtHZ180dEhEE/mEkeXKLQTcEVpwalEbfYQIDjku6B22B/42R76EA1GictNSzlYJYaSa/ON7YbJ+nhgKzfi90bFYkNY/vkxDzXjX1oO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VynZUpFR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pxp60Xm/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VynZUpFR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pxp60Xm/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B059E1F7B5;
	Fri, 19 Sep 2025 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758271122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtjFE9uDyyelh4LHIwvWzcCmAXiD7trvZN3xYdyOiRc=;
	b=VynZUpFRYzsyHhtMIGzcdwDZHNKYA1j0kPtXMYVRtvcvkr7hAwHia+SG/JNYA0E8e2eXDK
	csbmm2dbEV481Ug5iyvkH6ZsAT8NK5L6J0VDHJuQCgYNuzMh5wwx2syxVBrvp5nZ0LylPY
	n7Db7/wsiuck9Dvmc5WT4QKxMmk4xeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758271122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtjFE9uDyyelh4LHIwvWzcCmAXiD7trvZN3xYdyOiRc=;
	b=pxp60Xm/8UjquYZiF7DmGfbNQcH5fLw5fLKwy5m1LLdJiEmQGbdJrbG6DrWTdoN/m3Grg4
	qLEvlpOGWgzS7wCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VynZUpFR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="pxp60Xm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758271122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtjFE9uDyyelh4LHIwvWzcCmAXiD7trvZN3xYdyOiRc=;
	b=VynZUpFRYzsyHhtMIGzcdwDZHNKYA1j0kPtXMYVRtvcvkr7hAwHia+SG/JNYA0E8e2eXDK
	csbmm2dbEV481Ug5iyvkH6ZsAT8NK5L6J0VDHJuQCgYNuzMh5wwx2syxVBrvp5nZ0LylPY
	n7Db7/wsiuck9Dvmc5WT4QKxMmk4xeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758271122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtjFE9uDyyelh4LHIwvWzcCmAXiD7trvZN3xYdyOiRc=;
	b=pxp60Xm/8UjquYZiF7DmGfbNQcH5fLw5fLKwy5m1LLdJiEmQGbdJrbG6DrWTdoN/m3Grg4
	qLEvlpOGWgzS7wCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68F8E13A39;
	Fri, 19 Sep 2025 08:38:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r4ObF5IWzWgdKQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 19 Sep 2025 08:38:42 +0000
Date: Fri, 19 Sep 2025 10:38:39 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux I2C <linux-i2c@vger.kernel.org>, Jarkko Nikula
 <jarkko.nikula@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 3/3] i2c: designware: Turn models back to enumerated
 values
Message-ID: <20250919103839.3726a91c@endymion>
In-Reply-To: <aMxUjzuDnLKRkHva@smile.fi.intel.com>
References: <20250918160341.39b66013@endymion>
	<20250918161301.5405b709@endymion>
	<aMxUjzuDnLKRkHva@smile.fi.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B059E1F7B5
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01

Hi Andy,

On Thu, 18 Sep 2025 21:50:55 +0300, Andy Shevchenko wrote:
> On Thu, Sep 18, 2025 at 04:13:01PM +0200, Jean Delvare wrote:
> > There are 4 flag bits reserved to store the device model. All
> > accesses to this information is properly masked with MODEL_MASK to
> > extract only these bits and compare them with a given model value.
> > 
> > However the model definitions isn't an enumeration as you would
> > expect. Instead each model uses a separate flag, meaning that the
> > reserved space is already exhausted with the 4 models which have been
> > defined so far.
> > 
> > The error seems to originate from commit a5df4c14b9a9 ("i2c:
> > designware: Switch header to use BIT() and GENMASK()") where:
> > 
> > define MODEL_MSCC_OCELOT      0x00000100
> > define MODEL_BAIKAL_BT1       0x00000200
> > 
> > was erroneously converted to:  
> 
> I don't think "erroneously" is correct word here. The code before that commit
> as you mentioned starts with a bit set, rather than from 0. I would argue that
> the intention was to use a bitmask instead of plain number.

Models are mutually exclusive, so using a bit array to store that
information doesn't make sense. As a matter of fact, the driver code
which makes use of these values clearly assumes that they can't be
combined:

	switch (dev->flags & MODEL_MASK) {
	case MODEL_BAIKAL_BT1:
		ret = bt1_i2c_request_regs(dev);
		break;
	case MODEL_WANGXUN_SP:
		ret = txgbe_i2c_request_regs(dev);
		break;
	(...)
	}

> > define MODEL_MSCC_OCELOT      BIT(8)
> > define MODEL_BAIKAL_BT1       BIT(9)
> > 
> > While numerically equivalent, conceptually it wasn't, and it caused
> > the models added later to get bit-based definitions instead of
> > continuing with the next enumerated value (0x00000300).
> > 
> > Turn back these definitions to enumerated values to clear the
> > confusion, avoid future mistakes, and free some space for more models
> > to be supported in the future.  
> 
> ...
> 
> > -#define MODEL_MSCC_OCELOT			BIT(8)
> > -#define MODEL_BAIKAL_BT1			BIT(9)
> > -#define MODEL_AMD_NAVI_GPU			BIT(10)
> > -#define MODEL_WANGXUN_SP			BIT(11)
> > +#define MODEL_MSCC_OCELOT			(1 << 8)
> > +#define MODEL_BAIKAL_BT1			(2 << 8)
> > +#define MODEL_AMD_NAVI_GPU			(3 << 8)
> > +#define MODEL_WANGXUN_SP			(4 << 8)
> >  #define MODEL_MASK				GENMASK(11, 8)  
> 
> Taking above into consideration, why can't we start them from 0?

Because model 0 is every other device which is neither MSCC Ocelot nor
Baikal BT1 nor AMD Navi nor Wangxun SP. We could define MODEL_OTHER as
(0 << 8), but there's not reason to ever use it in the code
(switch/case statements simply use default if something needs to be
done for standard devices), which is why nobody bothered defining it so
far.

-- 
Jean Delvare
SUSE L3 Support

