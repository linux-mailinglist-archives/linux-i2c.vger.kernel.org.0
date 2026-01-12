Return-Path: <linux-i2c+bounces-15032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EDFD11948
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 10:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E1953016A96
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 09:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A1634A76F;
	Mon, 12 Jan 2026 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JYBJxP5k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OfgMpio5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JYBJxP5k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OfgMpio5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF79346FDF
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211099; cv=none; b=bHToQfQWJVS8GjsQ4Ijr1fZFK1dD20ilb9xvVFMP2msavO7e5gydD335mDMCQEJBmWmCHGi8nQXwUJ38sEBKK8EGW+UdfJByDLLfkaEtwHtXWtUhht2Tt505LhZa9Y9Qc9er9K7guCs9NOYPXbpgmyslXGtWT/55whyr8Ye4H6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211099; c=relaxed/simple;
	bh=w7Qn8GXkEDRumH+VudZ8oXxCXyRZPOe4IW2zKQDeL5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OIYyIAvTlzBG3Rc1dIyKbxy0I+F64rQ1CyqaRxhFFkLt+iblWV08BLZCYDYZF2I38YPGZvyNHLm9gYiLwUaJKXw7r/S8D/8Iux1T6+6IRbCRapo2C2n6802A1vKBb+o22cp16XQBfjTEN06c7tEus45utcbJEB1yfgkE6IV8XG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JYBJxP5k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OfgMpio5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JYBJxP5k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OfgMpio5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9844F5BE07;
	Mon, 12 Jan 2026 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768211095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1SyLZmQiAADUOxtgmglTY9mZFxf0LsUqODPvblItrIo=;
	b=JYBJxP5kB5Mw+0KFKFLcl0c4kz6dP3Dcfnui8tccHCiQBS3HP90Q8NDbpYc6WFpWOZrhIB
	LOjVS0HRQaqJHoLFbtxDnkobAp9Ip0VYKIs0r/8YI54UOzdo0P34YyoHfgAMKmxMjMQppZ
	/HxIQrNKp74Ych2FpDYDBvUUyzEgDMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768211095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1SyLZmQiAADUOxtgmglTY9mZFxf0LsUqODPvblItrIo=;
	b=OfgMpio5mYV3sU8kTUmkfFsqVtxyN6fRzwwFSY/V8y7Zorg3jPxjeW7zJ+VhIo8RPv8EX4
	ylnmSaQPnTmLU+CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JYBJxP5k;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OfgMpio5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768211095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1SyLZmQiAADUOxtgmglTY9mZFxf0LsUqODPvblItrIo=;
	b=JYBJxP5kB5Mw+0KFKFLcl0c4kz6dP3Dcfnui8tccHCiQBS3HP90Q8NDbpYc6WFpWOZrhIB
	LOjVS0HRQaqJHoLFbtxDnkobAp9Ip0VYKIs0r/8YI54UOzdo0P34YyoHfgAMKmxMjMQppZ
	/HxIQrNKp74Ych2FpDYDBvUUyzEgDMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768211095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1SyLZmQiAADUOxtgmglTY9mZFxf0LsUqODPvblItrIo=;
	b=OfgMpio5mYV3sU8kTUmkfFsqVtxyN6fRzwwFSY/V8y7Zorg3jPxjeW7zJ+VhIo8RPv8EX4
	ylnmSaQPnTmLU+CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 128373EA63;
	Mon, 12 Jan 2026 09:44:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gjuMApfCZGljSwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 12 Jan 2026 09:44:55 +0000
Date: Mon, 12 Jan 2026 10:44:49 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti
 <andi.shyti@kernel.org>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Gregory
 CLEMENT <gregory.clement@bootlin.com>, Hans Hu <hanshu@zhaoxin.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] i2c: piix4: use i2c_adapter_dev()
Message-ID: <20260112104449.26a4bf76@endymion>
In-Reply-To: <20251223-i2c-adapter-dev-wrapper-v1-2-bcf960a48fa9@oss.qualcomm.com>
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
	<20251223-i2c-adapter-dev-wrapper-v1-2-bcf960a48fa9@oss.qualcomm.com>
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
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[14];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 9844F5BE07
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

Hi Bartosz,

On Tue, 23 Dec 2025 11:08:19 +0100, Bartosz Golaszewski wrote:
> Use i2c_adapter_dev() where applicable in order to avoid direct
> dereferencing of struct device embedded within struct i2c_adapter.

I will confess that I don't know what is wrong with the current way of
embedding struct device in a more specific device structure. I seem to
recall it was fairly standard to do things this way back when we
implemented this in the i2c subsystem. But I will trust you that this
change is needed now.

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index ac3bb550303fe5893822af50c385004c9292e695..4fe0c49284646a9f2910939c98b51ee6777e8b52 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -788,7 +788,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>  	u8 prev_port;
>  	int retval;
>  
> -	retval = piix4_sb800_region_request(&adap->dev, &adapdata->mmio_cfg);
> +	retval = piix4_sb800_region_request(i2c_adapter_dev(adap), &adapdata->mmio_cfg);
>  	if (retval)
>  		return retval;
>  
> @@ -859,7 +859,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>  		piix4_imc_wakeup();
>  
>  release:
> -	piix4_sb800_region_release(&adap->dev, &adapdata->mmio_cfg);
> +	piix4_sb800_region_release(i2c_adapter_dev(adap), &adapdata->mmio_cfg);
>  	return retval;
>  }
>  
> @@ -947,7 +947,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>  	adap->dev.parent = &dev->dev;
>  
>  	if (has_acpi_companion(&dev->dev)) {
> -		acpi_preset_companion(&adap->dev,
> +		acpi_preset_companion(i2c_adapter_dev(adap),
>  				      ACPI_COMPANION(&dev->dev),
>  				      hw_port_nr);
>  	}
> 

Acked-by: Jean Delvare <jdelvare@suse.de>

I see that you left one occurrence:

	adap->dev.parent = &dev->dev;

I presume we'll need a wrapper for this construct as well?

Thanks,
-- 
Jean Delvare
SUSE L3 Support

