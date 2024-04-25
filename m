Return-Path: <linux-i2c+bounces-3147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D588B24F8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 17:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E2901F22E22
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 15:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41ACE14AD1A;
	Thu, 25 Apr 2024 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CnZPwa+4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tyGDmiot";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CnZPwa+4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tyGDmiot"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB6A14B091;
	Thu, 25 Apr 2024 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714058541; cv=none; b=FLzbEPSl/GzEdCBrJTQCvlDWIzfpgLJGsAr+4hxPDIofolX/Z/UUVmpwoPl2tKyEyHd98aNDLBA1Va4Mw/yTVN8T2wHZ7RQg18c+fv+QodDb07SE+gAtIAM+LM0CiWY7wZbELd7gcE1OnhDKrD5sv0GJpzSMdBBTgUH8Zj1faWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714058541; c=relaxed/simple;
	bh=bSjS7vFRvhg18Vn5CvrSZuwzZrsRRVowjKTEqODOvXs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CzgiTadl82YCZrQGrC6fQdN5dW5ecLVVHyGGDfuET1WvyaXyd3wIKphqEXhTSNk/+1heFBkplwFg9FD1jsJessUPc8Ha390GX9c7BtJWsiB39Gej+eMRTRwUfP5WayvTuDUMFHQIl1rtAFpR+Mk6N5Cjh6zLESaI09+c1NPfOyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CnZPwa+4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tyGDmiot; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CnZPwa+4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tyGDmiot; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 40FE333E71;
	Thu, 25 Apr 2024 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714058537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwWYm2TSdOXNeK9m0m0SKDRDTUqTmYPARNYLw/hpChU=;
	b=CnZPwa+4z6k6gYIptELJJqv23h6j6DnsneScRgWC3TnrPh6s1Vuj01AsEeYxGFyorkuOsu
	H5AZ8DvLDfkMIbc7V957sknobVckaX/9nTVi6moXLpzGGCjvQQmuEe6cz08XKlDbkhYEKi
	e56R5uR4/jWSYG7D8GSNBaGyxL3CgUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714058537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwWYm2TSdOXNeK9m0m0SKDRDTUqTmYPARNYLw/hpChU=;
	b=tyGDmiotyYvPbLUytSU367yYWLBZAxwIbsfkSHn/35zHW3r7g2y5EQL75uncqMaSEtjuwl
	Xr1yC4MQFYBe6/Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CnZPwa+4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tyGDmiot
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714058537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwWYm2TSdOXNeK9m0m0SKDRDTUqTmYPARNYLw/hpChU=;
	b=CnZPwa+4z6k6gYIptELJJqv23h6j6DnsneScRgWC3TnrPh6s1Vuj01AsEeYxGFyorkuOsu
	H5AZ8DvLDfkMIbc7V957sknobVckaX/9nTVi6moXLpzGGCjvQQmuEe6cz08XKlDbkhYEKi
	e56R5uR4/jWSYG7D8GSNBaGyxL3CgUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714058537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwWYm2TSdOXNeK9m0m0SKDRDTUqTmYPARNYLw/hpChU=;
	b=tyGDmiotyYvPbLUytSU367yYWLBZAxwIbsfkSHn/35zHW3r7g2y5EQL75uncqMaSEtjuwl
	Xr1yC4MQFYBe6/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 875971393C;
	Thu, 25 Apr 2024 15:22:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +fgyGih1KmYfEQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 25 Apr 2024 15:22:16 +0000
Date: Thu, 25 Apr 2024 17:22:12 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] i2c: ali15x3: remove printout on handled timeouts
Message-ID: <20240425172212.4f002de1@endymion.delvare>
In-Reply-To: <20240423121322.28460-5-wsa+renesas@sang-engineering.com>
References: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
	<20240423121322.28460-5-wsa+renesas@sang-engineering.com>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-4.02 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.51)[80.03%];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[renesas];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 40FE333E71
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.02

On Tue, 23 Apr 2024 14:13:21 +0200, Wolfram Sang wrote:
> I2C and SMBus timeouts are not something the user needs to be informed
> about on controller level. The client driver may know if that really is
> a problem and give more detailed information to the user. The controller
> should just pass this information upwards. Remove the printout.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-ali15x3.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
> index d2fa30deb054..956e5020d71e 100644
> --- a/drivers/i2c/busses/i2c-ali15x3.c
> +++ b/drivers/i2c/busses/i2c-ali15x3.c
> @@ -294,10 +294,8 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
>  		 && (timeout++ < MAX_TIMEOUT));
>  
>  	/* If the SMBus is still busy, we give up */
> -	if (timeout > MAX_TIMEOUT) {
> +	if (timeout > MAX_TIMEOUT)
>  		result = -ETIMEDOUT;
> -		dev_err(&adap->dev, "SMBus Timeout!\n");
> -	}
>  
>  	if (temp & ALI15X3_STS_TERM) {
>  		result = -EIO;

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support

