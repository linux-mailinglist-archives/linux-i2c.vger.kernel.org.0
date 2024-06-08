Return-Path: <linux-i2c+bounces-3927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C726D900FF2
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2024 09:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB2302844D1
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2024 07:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DA6176AAB;
	Sat,  8 Jun 2024 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S1BeNESq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nxFZwjaj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S1BeNESq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nxFZwjaj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BC7167DB9
	for <linux-i2c@vger.kernel.org>; Sat,  8 Jun 2024 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717831477; cv=none; b=iL8NNWW8KZpUvv2Qc6VC2czCFlJ+n7amrFtd9Hc1XIw747GaTpRbo96w2S7amTK5RzIuT/F5sdhWAzLvDhpvdrDK/ruqYFX4ebJ6eWvEsnZLVztpx82OWrGI24MgLdVC27Y+E9/gHIi+xwqO95cSD/GC1PMNd3bVoSsjEYkIy0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717831477; c=relaxed/simple;
	bh=8cO2iOF+gGlBsEG6+8Qh7jh8NIrR6g9SMjjxG2snNXU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ok6YeyZZsyGiLKoJpC7PpxAXkFYpiI4BjwC6S2gRmfkXlztBQM/SP0Szu1Th1M7lLTkzSJ7hM9BpmnxgsiQ7MNta0Drx1V9/hnOVHfrpDuDjfSZ7e6hWTGBz2KSjscz44E7llIf2xeBKOoSekMVzoUpWpDrTHEqTxfddXSm8kPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S1BeNESq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nxFZwjaj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S1BeNESq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nxFZwjaj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 74D5A21B6B;
	Sat,  8 Jun 2024 07:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717831473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xGBimbXveqAfbNumpeuEUsO3XJh6dtipXyuSTiDTS4E=;
	b=S1BeNESq+lvThos3R7KaXWWSZKkb7xuN3snwzMQA0s7bPJo+AeviFzvxa3P0PL6A0puKIZ
	e6qj91vJt+SDtIxLOBzB4UXm3mI9YyYxF2TCjtRt/5pjF7aByWfT7J10vB+H+mxstyggVC
	toVwGtYU+99WH+fihvZOuFXnIyhPq8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717831473;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xGBimbXveqAfbNumpeuEUsO3XJh6dtipXyuSTiDTS4E=;
	b=nxFZwjaj954clgIciCNIq/Xg48ZQ3RGRzRBCFluBzWEKsUUbhXeBmdW54NBEiKVcK+gHzp
	CdJ4F6KFqaAd1TDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=S1BeNESq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nxFZwjaj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717831473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xGBimbXveqAfbNumpeuEUsO3XJh6dtipXyuSTiDTS4E=;
	b=S1BeNESq+lvThos3R7KaXWWSZKkb7xuN3snwzMQA0s7bPJo+AeviFzvxa3P0PL6A0puKIZ
	e6qj91vJt+SDtIxLOBzB4UXm3mI9YyYxF2TCjtRt/5pjF7aByWfT7J10vB+H+mxstyggVC
	toVwGtYU+99WH+fihvZOuFXnIyhPq8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717831473;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xGBimbXveqAfbNumpeuEUsO3XJh6dtipXyuSTiDTS4E=;
	b=nxFZwjaj954clgIciCNIq/Xg48ZQ3RGRzRBCFluBzWEKsUUbhXeBmdW54NBEiKVcK+gHzp
	CdJ4F6KFqaAd1TDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDB2113A1E;
	Sat,  8 Jun 2024 07:24:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2i/aMjAHZGapHwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Sat, 08 Jun 2024 07:24:32 +0000
Date: Sat, 8 Jun 2024 09:24:28 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: complain loudly if __i2c_transfer has no proper
 callback
Message-ID: <20240608092428.20e1d609@endymion.delvare>
In-Reply-To: <20240606203657.22286-2-wsa+renesas@sang-engineering.com>
References: <20240606203657.22286-2-wsa+renesas@sang-engineering.com>
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
X-Spam-Score: -3.86
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 74D5A21B6B
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.86 / 50.00];
	BAYES_HAM(-2.35)[97.01%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]

Hi Wolfram,

On Thu,  6 Jun 2024 22:36:58 +0200, Wolfram Sang wrote:
> In a discussion we concluded that having no working callback in
> __i2c_transfer is a serious bug, so dev_dbg() is not enough. Turn it
> into a WARN.
> 
> Link: https://lore.kernel.org/r/20240604171113.232628f9@endymion.delvare
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index db0d1ac82910..e5fd899c28c3 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2207,10 +2207,8 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>  	unsigned long orig_jiffies;
>  	int ret, try;
>  
> -	if (!adap->algo->master_xfer) {
> -		dev_dbg(&adap->dev, "I2C level transfers not supported\n");
> +	if (WARN_ON_ONCE(!adap->algo->master_xfer))
>  		return -EOPNOTSUPP;
> -	}
>  
>  	if (WARN_ON(!msgs || num < 1))
>  		return -EINVAL;

Then you'll have to add a check on I2C_FUNC_I2C (or
adapter->algo->master_xfer, whatever you prefer) before calling
i2c_smbus_xfer_emulated(). Otherwise using i2c-dev on a slave-only
adapter will trigger the WARN_ON_ONCE immediately.

-- 
Jean Delvare
SUSE L3 Support

