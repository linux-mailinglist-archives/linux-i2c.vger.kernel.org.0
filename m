Return-Path: <linux-i2c+bounces-1719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2586F855F07
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 11:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28961F2135B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 10:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1529069D04;
	Thu, 15 Feb 2024 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ezusqJV6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="krP2RrHN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ezusqJV6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="krP2RrHN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B1869D00
	for <linux-i2c@vger.kernel.org>; Thu, 15 Feb 2024 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707992397; cv=none; b=shtFj6h+fDMQXzsP3C08j+NncHTikaY/zcPDwPqAHnbT4fErX+7A0wu/PUq6KpYpLrEFuaz4cA0+HS+v8Kor6LuK/QqALe9xN8kzQH/jQBYQMrEuxVVbepvNp27gEBZkQKrws3CsCTga1ePyKIlC6fTPdxUGTpHX6Q6sCkpWDL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707992397; c=relaxed/simple;
	bh=zhVlv+uFJf3aTT0FZykwTxFdm7TsTEFyJuGmM5syBg4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pm5MNTm7NvQ7XqGIYX7C1HW8RWy+P5HwggFpoJ93745ZV702osok4UQlVeUnXy6Sq9EpXn9mJltPguh1I7avtHRq0bz6RiIF15pHDmSr+rbpxkBHCc65IcFKVvsXQg7diug5oeTtq3s4rPvNsiX50xnzI97Gz50cDEXjh8eafOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ezusqJV6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=krP2RrHN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ezusqJV6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=krP2RrHN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 94A6021AA2;
	Thu, 15 Feb 2024 10:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707992394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xq+JEC3Lr9IkJ8sa173IbTHxWaSKSYcoajvKlHb7PuE=;
	b=ezusqJV6YJ+Bsa35aCGim/vbw6I6VwAbiTJMQVLR5tnxb2w1iDPj5bsEhHGMmli0E4RppG
	jQXrEr+zcnByCRMQeCZc/+akzbRQMOsLOmz2iZj8SYNDBidk/jsZmieUGMjfy5hrm7fHyz
	rkXgtMptCc8B2YqeLJS6zx+Ow/3kbYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707992394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xq+JEC3Lr9IkJ8sa173IbTHxWaSKSYcoajvKlHb7PuE=;
	b=krP2RrHNw/sB0Am/jh5yMnisxsm2YcyMRQ2vOfd4euCz893k5hXIvdmZqodTHYecXVT4MV
	0/b+9Y3/mazKLdBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707992394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xq+JEC3Lr9IkJ8sa173IbTHxWaSKSYcoajvKlHb7PuE=;
	b=ezusqJV6YJ+Bsa35aCGim/vbw6I6VwAbiTJMQVLR5tnxb2w1iDPj5bsEhHGMmli0E4RppG
	jQXrEr+zcnByCRMQeCZc/+akzbRQMOsLOmz2iZj8SYNDBidk/jsZmieUGMjfy5hrm7fHyz
	rkXgtMptCc8B2YqeLJS6zx+Ow/3kbYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707992394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xq+JEC3Lr9IkJ8sa173IbTHxWaSKSYcoajvKlHb7PuE=;
	b=krP2RrHNw/sB0Am/jh5yMnisxsm2YcyMRQ2vOfd4euCz893k5hXIvdmZqodTHYecXVT4MV
	0/b+9Y3/mazKLdBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D48C913A82;
	Thu, 15 Feb 2024 10:19:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /gkZLUnlzWWYJwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 15 Feb 2024 10:19:53 +0000
Date: Thu, 15 Feb 2024 11:19:51 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Linux I2C <linux-i2c@vger.kernel.org>, Piotr Zakowski
 <piotr.zakowski@intel.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>
Subject: Re: [SPAM] [PATCH] i2c: i801: Fix block process call transactions
Message-ID: <20240215111951.25135462@endymion.delvare>
In-Reply-To: <22rwbtavuntbe77bstk3wjsdm366csa43nied6u7w4q6o6sveg@jkqor7zklayg>
References: <20240214155939.728155bc@endymion.delvare>
	<22rwbtavuntbe77bstk3wjsdm366csa43nied6u7w4q6o6sveg@jkqor7zklayg>
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
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.13
X-Spamd-Result: default: False [-1.13 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-1.33)[90.32%];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 TO_DN_ALL(0.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.org:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO

Hi Andi,

On Wed, 14 Feb 2024 22:44:12 +0100, Andi Shyti wrote:
> b4 ty failed to send the thank you letter because there are some
> addresses that were not accepted
> (Kozlowski@imap1.dmz-prg2.suse.org?)

Sorry for the mess, this seems to be a bug in my email client (Claws
Mail 4.1.1) when the recipient names are quoted and/or include a comma.
Ideally my SMTP server should have rejected the message as invalid, but
it tried its best to still process it.

I'll report the issue to the Claws Mail developers.

-- 
Jean Delvare
SUSE L3 Support

