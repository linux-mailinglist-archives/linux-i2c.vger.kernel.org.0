Return-Path: <linux-i2c+bounces-3726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F558D5E4C
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 11:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 550201C20893
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 09:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513D181721;
	Fri, 31 May 2024 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="klA5yCyz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RJcQ7hUb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="klA5yCyz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RJcQ7hUb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A24A4AEF0
	for <linux-i2c@vger.kernel.org>; Fri, 31 May 2024 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717147881; cv=none; b=jH27loqtU5bbqqrZMuY8ayovxokTMe/t5W3Gc5yOiXUuqb2Th59AdAh/OhG2YsPmPWzN07u7lmNfGTdnIET5FKbzT8qnZtbSSPHDsL4yuXA0sT2TQ/2m1ylxP1phAeCxbOlLwPdIf0Ur6G/p8amzgCu30X/80KciJn+uW2QwHec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717147881; c=relaxed/simple;
	bh=+TGdPferzwnOd0m7Ck64M6BH6hudOqZB4uKk+1NtI6s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONlpkR+0Usev1jwWaGpoqzwxRZu3qqxg2Be4EnbCp16o2Gu0s+Z4iUeHAUI0QdyfrdTA2q8pAHY4ZDRITjrxw5flOZb97aT0kjexwOiCUHc15jJBrWqsvGyPG2mxQmUmSmESLZt4OdTtYB/Mx/ZZUww7e90frlRqgsySfUkOLOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=klA5yCyz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RJcQ7hUb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=klA5yCyz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RJcQ7hUb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7FA8C21B11;
	Fri, 31 May 2024 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717147877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XNz8cOwUAEfV5gSUAz1citDEvY3IzECJtSoFD9i7ML8=;
	b=klA5yCyzHROym6b6dF3MWtr2PoHx9tzZn8dIEsplHFdQLm7RlXf+bjEMgWEbZUZEiW2Vfb
	SUyCKscPRzFYTbcA3lqq7SAO3k54llk/lz7B8lnwYJn8Zgl0iK0BKOnJD4wXHKY7K26B7F
	43WIHphnlTwwi+hZuxhuegeSDWQK8OA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717147877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XNz8cOwUAEfV5gSUAz1citDEvY3IzECJtSoFD9i7ML8=;
	b=RJcQ7hUb43VDJo9kTzluPRt4/HShzmRAjYrmw3I6mLzeqKh2lgyNEbk6qHxFY9TG5uoxpF
	co/VWYxshKigbQAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=klA5yCyz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RJcQ7hUb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717147877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XNz8cOwUAEfV5gSUAz1citDEvY3IzECJtSoFD9i7ML8=;
	b=klA5yCyzHROym6b6dF3MWtr2PoHx9tzZn8dIEsplHFdQLm7RlXf+bjEMgWEbZUZEiW2Vfb
	SUyCKscPRzFYTbcA3lqq7SAO3k54llk/lz7B8lnwYJn8Zgl0iK0BKOnJD4wXHKY7K26B7F
	43WIHphnlTwwi+hZuxhuegeSDWQK8OA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717147877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XNz8cOwUAEfV5gSUAz1citDEvY3IzECJtSoFD9i7ML8=;
	b=RJcQ7hUb43VDJo9kTzluPRt4/HShzmRAjYrmw3I6mLzeqKh2lgyNEbk6qHxFY9TG5uoxpF
	co/VWYxshKigbQAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 903B0132C2;
	Fri, 31 May 2024 09:31:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6flpHOSYWWadHAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 31 May 2024 09:31:16 +0000
Date: Fri, 31 May 2024 11:31:13 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux I2C <linux-i2c@vger.kernel.org>, Jarkko Nikula
 <jarkko.nikula@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] i2c: designware: Fix the functionality flags of the
 slave-only interface
Message-ID: <20240531113113.47225d65@endymion.delvare>
In-Reply-To: <ZlmXDgHnWNvVIN20@smile.fi.intel.com>
References: <20240531111748.441a85b6@endymion.delvare>
	<ZlmXDgHnWNvVIN20@smile.fi.intel.com>
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
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7FA8C21B11
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

On Fri, 31 May 2024 12:23:26 +0300, Andy Shevchenko wrote:
> On Fri, May 31, 2024 at 11:17:48AM +0200, Jean Delvare wrote:
> > When an I2C adapter acts only as a slave, it should not claim to
> > support I2C master capabilities.
> > 
> > Fixes: 5b6d721b266a ("i2c: designware: enable SLAVE in platform module")
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>  
> 
> The below can be separated by
> 
> ---
> 
> to avoid noise in the commit messages. The effect, namely Cc'ing to people,
> will stay the same.

Noted, I'll do that from now on.

> > Cc: Luis Oliveira <lolivei@synopsys.com>

BTW, the address above is no longer valid so it should be omitted when replying.

> > Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: Jan Dabros <jsd@semihalf.com>
> > Cc: Andi Shyti <andi.shyti@kernel.org>
> > ---  
> 
> Other than that, LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks,
-- 
Jean Delvare
SUSE L3 Support

