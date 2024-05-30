Return-Path: <linux-i2c+bounces-3713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 198D98D4C8E
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 15:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4875284316
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 13:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96014183086;
	Thu, 30 May 2024 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TNJTr5I1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5rQzeFmB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="evRYP/yB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4V9RjjSf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185F11C2A8;
	Thu, 30 May 2024 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717075507; cv=none; b=cRVcEG0DWTqR90X+RDTvL2PBqejxqI+j1O9VIa9n8D1oOVJxqx++dGHs+ljFdbO0zCS9JIK32vDpQ9StRgTtwUzhReUqonuGS4c12ooWi7ztXgnzs5N7Vmd5oVt+wRNve4u6R8nOkvLh5/JfQWb/r+RZJzgHDbDDCGWDTeW8ih0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717075507; c=relaxed/simple;
	bh=CTNp3tSmoZu517100oC9N7M79WsRcBjopPTx2HtKEXM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AKfZhyL/JKwC/tvU3/Y6VvCEiI2S+R95JqSBSHJxrTAIGGwyx4XzH5uFJotertqVZSLynlxSm4uDfLnPWNhf6Rs5YphYbLX1RmGYav2QvkZymk6ulaYObIV0U5KnayZQk2B2hH5E/AQ9vI4cCdCWaqrSd65xdDNIFtoaQJutcAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TNJTr5I1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5rQzeFmB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=evRYP/yB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4V9RjjSf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CED7B33876;
	Thu, 30 May 2024 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717075503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fTnH1k9PCe7lPHHa/LlxqVdBbmwOs57Vq5J6smfmlM=;
	b=TNJTr5I1t+cnIehLm2KgzziHKQPwH5vTSXmK33XrrgB/+8EaIyGUhr8//iLCeNWPqrrGJ6
	w+eytJ1mgt51hTeI/OAnLh7UEmnZbKbMc6DHkrss9bXVLhKKZKjgZMnXJ4WlvnU6EPDYIX
	Ohf5t0FJwfE/RaJGyCt0y2H6CHxYPOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717075503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fTnH1k9PCe7lPHHa/LlxqVdBbmwOs57Vq5J6smfmlM=;
	b=5rQzeFmBSWr15givsFXgqUzwF3ZzFjZbtftuarFvHsENz+CPkeZ2SkYcojsKFe/mNO4g+1
	rwwmUyirkftzeyAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="evRYP/yB";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4V9RjjSf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717075501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fTnH1k9PCe7lPHHa/LlxqVdBbmwOs57Vq5J6smfmlM=;
	b=evRYP/yBCgDxIgKu9Ci+mIiBD1yl4baeB8Hl8zYyDKQYs233xess4LS9eZu5OluldW5xJC
	j5//fDIDonU4cQ+MO1y2C0o8OTnaqEWR1nJ/s3VKXg9Ordk6+KzdzJ5D/L15yuX7UizRbX
	JN7VabjMw9avMuTYzscWuow2eSVRAmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717075501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fTnH1k9PCe7lPHHa/LlxqVdBbmwOs57Vq5J6smfmlM=;
	b=4V9RjjSfyyeR5QrFeTMzS4dq+FJHVbbFL2E95ay6EB+eUN6bz2GoatzZM5rxLXjeX8+dyT
	TlQ3jjBMca800fAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE5F813A83;
	Thu, 30 May 2024 13:25:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D5STLyx+WGaEVgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 30 May 2024 13:25:00 +0000
Message-ID: <1e626d93f4220cc348300bbc61089de32300122d.camel@suse.de>
Subject: Re: [PATCH] i2c: smbus: fix NULL function pointer dereference
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org
Cc: Baruch Siach <baruch@tkos.co.il>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>
Date: Thu, 30 May 2024 15:24:58 +0200
In-Reply-To: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
References: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	TAGGED_RCPT(0.00)[renesas];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,suse.de:dkim,tkos.co.il:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: CED7B33876
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.01

Hi Wolfram, Baruch, Peter,

On Fri, 2024-04-26 at 08:44 +0200, Wolfram Sang wrote:
> Brauch reported an OOPS when using the designware controller as target
> only. Target-only modes break the assumption of one transfer function
> always being available. Fix this by always checking the pointer in
> __i2c_transfer.

I was asked to backport this fix to our oldest kernel branches, so I
looked into it and I have comments and a question.

> Reported-by: Baruch Siach <baruch@tkos.co.il>
> Closes: https://lore.kernel.org/r/4269631780e5ba789cf1ae391eec1b959def7d99.1712761976.git.baruch@tkos.co.il
> Fixes: 4b1acc43331d ("i2c: core changes for slave support")

I have a hard time establishing a formal link between the reported bug
and the commit listed above. I do understand that it wouldn't make
sense to register an i2c_adapter with neither .master_xfer nor
.smbus_xfer set before .reg_slave was added to struct i2c_algorithm,
but there were no checks in i2c-core preventing it from happening.

It was also possible for any (broken) device driver to call
__i2c_transfer() without first checking if plain I2C transfers were
actually supported by the i2c_adapter. I would argue that such an issue
should have been fixed at the device driver level by checking for the
I2C_FUNC_I2C functionality flag before calling __i2c_transfer(). That's
a theoretical issue though as I'm not aware of any device driver having
this issue.

The call stack in Baruch's report shows that the real issue is with
i2c_smbus_xfer_emulated() being called with the i2c bus lock already
held, and thus having to call __i2c_transfer() instead of
i2c_transfer(). This code path did not exist before commit 63453b59e411
("i2c: smbus: add unlocked __i2c_smbus_xfer variant"), which was added
in kernel v4.19. Therefore I claim that CVE-2024-35984 only affects
kernel v4.19 and newer. Do we agree on that?

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c  | 12 ++++++------
>  drivers/i2c/i2c-core-smbus.c |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index ff5c486a1dbb..db0d1ac82910 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2200,13 +2200,18 @@ static int i2c_check_for_quirks(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   * Returns negative errno, else the number of messages executed.
>   *
>   * Adapter lock must be held when calling this function. No debug logging
> - * takes place. adap->algo->master_xfer existence isn't checked.
> + * takes place.
>   */
>  int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>  {
>         unsigned long orig_jiffies;
>         int ret, try;
>  
> +       if (!adap->algo->master_xfer) {
> +               dev_dbg(&adap->dev, "I2C level transfers not supported\n");
> +               return -EOPNOTSUPP;
> +       }
> +

Not related specifically to this commit, as it is only moving a check
which already existed before, but this looks inefficient to me.

We end up performing the check with every I2C-level transfer, while the
availability of such support can almost always be checked once and for
all in the I2C device driver (i2c-dev and i2c_smbus_xfer_emulated being
the exceptions).

I see two ways for us to reach this check:
* __i2c_transfer() or i2c_transfer() gets called directly by a device
driver. This driver should have checked for the I2C_FUNC_I2C
functionality flag before calling either function. If they did not,
it's a driver bug, which should be fixed in the driver in question.
Note that i2c-dev currently lacks this check, I think it should be
added.
* __i2c_transfer() gets called by i2c_smbus_xfer_emulated(). We should
add a check for I2C_FUNC_I2C in __i2c_smbus_xfer() before calling this
function. This is more or less what Baruch proposed initially, and I
think it would have been a more efficient fix.

And if you are concerned about functionality flags not being set
properly (specifically I2C_FUNC_I2C being set while .master_xfer isn't
set [1]) then we should add a consistency check at i2c_adapter
registration time, so again it's done once and for all and we don't
have to check again and again at transfer time.

Or is this optimization not worth it?

[1] BTW, looking at the only two in-tree slave-only I2C adapter
drivers, i2c-at91-slave and i2c-designware-slave, both are setting
functionality flags other than I2C_FUNC_SLAVE. Unless I don't
understand how the slave functionality works, this is a bug. I'll
prepare and post patches later today.


-- 
Jean Delvare
SUSE L3 Support

