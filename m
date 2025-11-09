Return-Path: <linux-i2c+bounces-14022-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAF7C446BD
	for <lists+linux-i2c@lfdr.de>; Sun, 09 Nov 2025 21:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 180554E12BA
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Nov 2025 20:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BA01D63EF;
	Sun,  9 Nov 2025 20:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VE6dVacQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HZqHc/pK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VE6dVacQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HZqHc/pK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E86118C008
	for <linux-i2c@vger.kernel.org>; Sun,  9 Nov 2025 20:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762720005; cv=none; b=exzmrfSu0Oxu5ehTZqY7dxf093ak6F/eO+S/zsYaRvjeyvLdMZQq6OiUgNlWaLFvsljhsDd5TEOTYMHuugoVxGi51/Yw22b4LMH0rxjnIIL6tM9RNu/UKuos08Glenuktqp0bO4if7+hqMOoWFCIH6RTu54DLQmp/NwTJesXtTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762720005; c=relaxed/simple;
	bh=AziFf2R9Mo5kNwTjidCP+lCHoXk3MBXVRbCR11TbWJw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NcBuuqDkolIVi/qgTgXlEUY7bX1nsS2zD/3PKxkyHJ43rMbwmDBWNk4g9GLaeAWP8MN6HTzbmYvwhL2P93KNu4Rn+fqwwn20xA+VUpc4yGac09nt8525e87Gun+bzNqjNw4xwA8hKNOxOzEdkeWkuZHib/I90yQNm8FunOMiaL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VE6dVacQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HZqHc/pK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VE6dVacQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HZqHc/pK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 81333219EA;
	Sun,  9 Nov 2025 20:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762720000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Odsf+zzjD7md0XsYxXNdo7BOpW5aRnoJkOBX9SHch+4=;
	b=VE6dVacQ2LPBWf2RHGvxnOQGQ1sYG/HkBBOVXRTQ/ZXSMcsrEmyHQHbPBCSnMaYF7Nlcj0
	a30/UOUfMF0MJbxOkK2MrQ1wsCkogd8/ynNnBKyJMIgkPzyc2danbo5ewUf2HIfXzyXuKI
	x2IGt5G25KbEYEfi4YeI0CRBTeep+CU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762720000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Odsf+zzjD7md0XsYxXNdo7BOpW5aRnoJkOBX9SHch+4=;
	b=HZqHc/pKhuFovgU9ggMWQTq0oDdtiKYLQckJEzVizHvZSQatOm+IjTJ2aM2GAV+auY1aRN
	qBBYJejRHLVa3ZDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762720000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Odsf+zzjD7md0XsYxXNdo7BOpW5aRnoJkOBX9SHch+4=;
	b=VE6dVacQ2LPBWf2RHGvxnOQGQ1sYG/HkBBOVXRTQ/ZXSMcsrEmyHQHbPBCSnMaYF7Nlcj0
	a30/UOUfMF0MJbxOkK2MrQ1wsCkogd8/ynNnBKyJMIgkPzyc2danbo5ewUf2HIfXzyXuKI
	x2IGt5G25KbEYEfi4YeI0CRBTeep+CU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762720000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Odsf+zzjD7md0XsYxXNdo7BOpW5aRnoJkOBX9SHch+4=;
	b=HZqHc/pKhuFovgU9ggMWQTq0oDdtiKYLQckJEzVizHvZSQatOm+IjTJ2aM2GAV+auY1aRN
	qBBYJejRHLVa3ZDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53DEB140F7;
	Sun,  9 Nov 2025 20:26:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MjZ7EgD5EGm0HAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Sun, 09 Nov 2025 20:26:40 +0000
Date: Sun, 9 Nov 2025 21:25:01 +0100
From: Jean Delvare <jdelvare@suse.de>
To: "Blacktempel (Florian K.)" <florian.blacktempel@gmail.com>
Cc: linux-i2c@vger.kernel.org, "Blacktempel (Florian K.)"
 <Blacktempel@hotmail.de>
Subject: Re: [PATCH] i2c: allow ddr5 ram page change with active intel spd
 write protection
Message-ID: <20251109204759.203ad2f2@endymion>
In-Reply-To: <20251011123154.2020-1-Blacktempel@hotmail.de>
References: <20251011123154.2020-1-Blacktempel@hotmail.de>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 

Hi Florian,

On Sat, 11 Oct 2025 14:31:53 +0200, Blacktempel (Florian K.) wrote:
> SPD of most Intel DDR5 systems is write protected.
> The write protection also includes changing page, via MR11 register, and prevents reading data.
> 
> This patch allows page changing with write protection active via a I2C_SMBUS_READ on PROC_CALL.
> That is a, publicly undocumented, Intel specific way to allow page change.
> 
> Link: https://github.com/Blacktempel/RAMSPDToolkit/issues/4
> Link: https://github.com/Blacktempel/RAMSPDToolkit/blob/9b2aeab9b7637be1874520c74c9873e174fe4947/RAMSPDToolkit/SPD/DDR5AccessorBase.cs#L237
> Link: https://github.com/namazso/PawnIO.Modules/pull/19/files#diff-43cf449eaf4b834c447bc85ad039882fbd4fc883be00447908b94eb9cc8a9c36R481
> Signed-off-by: Blacktempel (Florian K.) <Blacktempel@hotmail.de>
> ---
>  drivers/i2c/busses/i2c-i801.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index cba992fa6557..9d8eda8b3287 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -788,7 +788,7 @@ static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data
>  		xact = I801_WORD_DATA;
>  		break;
>  	case I2C_SMBUS_PROC_CALL:
> -		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
> +		i801_set_hstadd(priv, addr, read_write);
>  		iowrite8(data->word & 0xff, SMBHSTDAT0(priv));
>  		iowrite8((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
>  		iowrite8(hstcmd, SMBHSTCMD(priv));

This looks similar to the workaround we applied for AT24-based SPD
implementations many years ago:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ba9ad2af7019956b990ad654c56da5bac1e8b71b

Because all datasheets since the 82801AA explicitly say that "for
process call command, the value written into bit 0 of the Transmit
Slave Address Register (SMB I/O register, offset 04h) needs to be 0", I
would prefer to have a similar implementation for the SMBus Process
Call: check SMBHSTCFG_SPD_WD and only apply the workaround if that bit
is set. This will avoid risking a regression on older chipsets.

I checked the spd5118 driver (which implements DDR5 SPD EEPROM support)
and it is NOT using the SMBus Process Call. So the above change alone
isn't going to allow accessing DDR5 SPD data on Intel systems where SPD
write protection is enabled. And the spd5118 driver is built on top of
regmap which is a generic register map access implementation.
Convincing it to use the SMBus Process Call transfer type for page
selection won't be trivial, if possible at all.

Are you using a modified spd5118 driver? Or are you accessing the SPD
EEPROM from user-space using the i2c-dev driver?

I must confess I'm curious how using the SMBus Process Call for the
purpose of switching the pages could work safely. This transfer type
will write 3 bytes on the bus, while page switching only expects 2. The
third written byte could have unexpected side effects, such as writing
to the following register (MR12). I'm not sure that's a risk I would be
willing to take. Then the process call will attempt to read 2 bytes
from the SPD, I'm not sure how the SPD will react, but that should be
less of a problem.

If Intel messed up their Write Protect implementation for the DDR5 SPD
standard then they should really fix it in future chipsets.

-- 
Jean Delvare
SUSE L3 Support

