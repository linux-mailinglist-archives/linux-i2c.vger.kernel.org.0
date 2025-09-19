Return-Path: <linux-i2c+bounces-13059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A88B8AB63
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Sep 2025 19:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27E021CC50A2
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Sep 2025 17:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CA0321F43;
	Fri, 19 Sep 2025 17:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nATsoh4y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cgEi5Ff1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nATsoh4y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cgEi5Ff1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F713164D0
	for <linux-i2c@vger.kernel.org>; Fri, 19 Sep 2025 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758302047; cv=none; b=jqIDyoDwuRaSr3ywK4QON6QFsRfjv72H1v50Gz24sfXgsatypEip8Ti1tB2bqUi5NPWnJu8vK9H5otKub1JbDXfyVU+8r/GD7KbkOqHi0fAC/BrU9dt7/dR97+LMyFKAfWl0/EUxRWwEKZ7kpBxSSbf4B2YGYT/tTTKz1HOKmqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758302047; c=relaxed/simple;
	bh=S7jB5xWG/4n+zHOzgJuWUUCLSVn8s6e8CRoXanWOqVE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RX9L5kYFXYvr6TYJYo1sLT3EF+suZkS7k9wGljrYdYD6PyVV9OPTybxcpEPqebEz0HyLLtQ+KVKPas5UCpfjvQnzKTL5a3I99537YpzZAh0jxH6PdT+xMoccFtoFLU7Z1iyVsoMIQdEZ+5NI8OTlM89XYvTnR1xLkk6L+pwMpt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nATsoh4y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cgEi5Ff1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nATsoh4y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cgEi5Ff1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6CBB71F7CB;
	Fri, 19 Sep 2025 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758302043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wc07zo59FwS5khg8tTCcKfGWNWOP8mDY3+wv1UWxIzA=;
	b=nATsoh4yjKL8F3oheTOcXxgPVREpSMrqB1sCf4Ak+l6kvx5JFrEDRKprW8I+sAsJgVgh4P
	42hxByLlPN/3YX8L03aiJboWnnhCLiwJzMaPxU2BD3oBqS/64AJzzkaRRhXPKP7bi2gF5X
	PjBYPpevmSX6lReQ37+4YEFO2sWRCKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758302043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wc07zo59FwS5khg8tTCcKfGWNWOP8mDY3+wv1UWxIzA=;
	b=cgEi5Ff1Ug8nEGfja/+fS9lII75q43r+vc4uUynK8PPYugKuOgae+KO/GJN8uo85XYZZ64
	Jg4/RnSAO5rzPIDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758302043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wc07zo59FwS5khg8tTCcKfGWNWOP8mDY3+wv1UWxIzA=;
	b=nATsoh4yjKL8F3oheTOcXxgPVREpSMrqB1sCf4Ak+l6kvx5JFrEDRKprW8I+sAsJgVgh4P
	42hxByLlPN/3YX8L03aiJboWnnhCLiwJzMaPxU2BD3oBqS/64AJzzkaRRhXPKP7bi2gF5X
	PjBYPpevmSX6lReQ37+4YEFO2sWRCKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758302043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wc07zo59FwS5khg8tTCcKfGWNWOP8mDY3+wv1UWxIzA=;
	b=cgEi5Ff1Ug8nEGfja/+fS9lII75q43r+vc4uUynK8PPYugKuOgae+KO/GJN8uo85XYZZ64
	Jg4/RnSAO5rzPIDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C44413A78;
	Fri, 19 Sep 2025 17:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DLDvBFuPzWg3XwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 19 Sep 2025 17:14:03 +0000
Date: Fri, 19 Sep 2025 19:14:00 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 2/3] i2c: designware: Extend check for mixed slave
 addresses
Message-ID: <20250919191400.29274d5d@endymion>
In-Reply-To: <20250918161054.7d650d2c@endymion>
References: <20250918160341.39b66013@endymion>
	<20250918161054.7d650d2c@endymion>
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
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.80

On Thu, 18 Sep 2025 16:10:54 +0200, Jean Delvare wrote:
> The i2c-designware driver only supports transfers where all messages
> use the same slave address. This condition is currently tested in
> i2c_dw_xfer_msg(), with 2 limitations:
> * The code only checks the address value, not the 10-bit address
>   flag, so it could miss an address change.
> * For the AMD Navi GPU devices, the driver uses a dedicated function
>   instead of i2c_dw_xfer_msg(), so the check is not performed.
> 
> Move the check to the common code path, and add the 10-bit address
> flag comparison, to catch and report early if a given transfer is not
> supported.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---
>  drivers/i2c/busses/i2c-designware-master.c |   28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> --- linux-6.16.orig/drivers/i2c/busses/i2c-designware-master.c
> +++ linux-6.16/drivers/i2c/busses/i2c-designware-master.c
> @@ -429,7 +429,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  	struct i2c_msg *msgs = dev->msgs;
>  	u32 intr_mask;
>  	int tx_limit, rx_limit;
> -	u32 addr = msgs[dev->msg_write_idx].addr;
>  	u32 buf_len = dev->tx_buf_len;
>  	u8 *buf = dev->tx_buf;
>  	bool need_restart = false;
> @@ -440,18 +439,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  	for (; dev->msg_write_idx < dev->msgs_num; dev->msg_write_idx++) {
>  		u32 flags = msgs[dev->msg_write_idx].flags;
>  
> -		/*
> -		 * If target address has changed, we need to
> -		 * reprogram the target address in the I2C
> -		 * adapter when we are done with this transfer.
> -		 */
> -		if (msgs[dev->msg_write_idx].addr != addr) {
> -			dev_err(dev->dev,
> -				"%s: invalid target address\n", __func__);
> -			dev->msg_err = -EINVAL;
> -			break;
> -		}
> -
>  		if (!(dev->status & STATUS_WRITE_IN_PROGRESS)) {
>  			/* new i2c_msg */
>  			buf = msgs[dev->msg_write_idx].buf;
> @@ -806,10 +793,23 @@ static int
>  i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  {
>  	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
> -	int ret;
> +	int ret, i;
>  
>  	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
>  
> +	/*
> +	 * This driver only supports I2C transfers where all the messages
> +	 * use the same address.
> +	 */
> +	for (i = 1; i < num; i++) {
> +		if (msgs[i].addr != msgs[0].addr ||

Note, I found meanwhile that some drivers (i2c-amd-mp2, i2c-mlxcpld)
use unlikely() to limit the performance penalty incurred by these
tests. Sounds like a good idea?

> +		    (msgs[i].flags & I2C_M_TEN) != (msgs[0].flags & I2C_M_TEN)) {
> +			dev_err(dev->dev,
> +				"Mixed slave addresses not supported\n");
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
>  	pm_runtime_get_sync(dev->dev);
>  
>  	switch (dev->flags & MODEL_MASK) {
> 


-- 
Jean Delvare
SUSE L3 Support

