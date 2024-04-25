Return-Path: <linux-i2c+bounces-3148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B93238B2501
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 17:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D35A281715
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 15:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E8614AD19;
	Thu, 25 Apr 2024 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SQ7oMQ3P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qR5a4rg8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vdedweDn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZpIzyEAt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B6112A17F;
	Thu, 25 Apr 2024 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714058626; cv=none; b=A334s7MO8/d6wmZXogjTu56Pb3TdkNoqNA79WDIjSDH28+//Gq5o2KdzUuru7aAkFOtEPrWVnntWJCfWypfdMVkktDtb3n2dci4xVgjDkzrtyGD0Gs9i7iNk1BU58a4opdoth5jd5jd7ZIq7DCeBqElj3nhIt/67DfYvRMl5VT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714058626; c=relaxed/simple;
	bh=Crws1QFuRruTWcCsAlVpWTy1U4pRWHAPLXwUsHKUJrI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsVkbJhKeSkxTBZx09UqWJfqMSbpt7GKf4o5wjn8EHfJVHnCFcwKBqdVOcl3NMdizrogN8I6wW0+FPfmhnAWNhWPlQopgiiqlj0ZejOGPSaKHk86Hrk7p+XR8Ay31ooDrajClf283O1hBqbFE3O2MtQ3ocdmK6Yns6AMZR0Es/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SQ7oMQ3P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qR5a4rg8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vdedweDn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZpIzyEAt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 586EF33E8D;
	Thu, 25 Apr 2024 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714058622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7EqK1SCIhTZ3puuM/z8haWSP6iphK/TZYlGssWaOq7Y=;
	b=SQ7oMQ3P2ACQQWFnP5XeY4AAn9GVUzhhXpmeyuxger0jukNEgpJIwhwCVm9JswBLrH+o7N
	ZJc/hPpIZtoK0odhoGqUWjkgGfHy7RRWHsfKyqj2zk54qadK7hZ0Yppw0bOIsLX4Ef9wN6
	4pBJypxs5lA6GxyVpAjhO5h3HSCSF18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714058622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7EqK1SCIhTZ3puuM/z8haWSP6iphK/TZYlGssWaOq7Y=;
	b=qR5a4rg8ycl5u4CbIVarLy5RAsmg4uh/wwRhs0eFrrnZBEe89aQdaVRuRN+Tlgtgl7X9+R
	9bThkUApo34CP5AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vdedweDn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZpIzyEAt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714058621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7EqK1SCIhTZ3puuM/z8haWSP6iphK/TZYlGssWaOq7Y=;
	b=vdedweDnGG/G0sIBc/I+/sxiNZJUPkRl9YzEtCLe943GancpunDa6leJijfmcLpoP8uAXO
	cqSZA8WOqlbb6Ihf5JqlJFipBh2dB/tojamQepXzqtqnt3v/w+B+hEalb01CL70TvOmSZj
	J2e5KKt6Co93dM5CHNfaWLPffsdrhVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714058621;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7EqK1SCIhTZ3puuM/z8haWSP6iphK/TZYlGssWaOq7Y=;
	b=ZpIzyEAtX2gJ2btHbkCqS2D61fYUTtKy7gUQ3+aeWLyv5PLkYVu2+W2IL/fkWvl8Fy6c0a
	LYdIHCj+lgUHEtDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83FDF1393C;
	Thu, 25 Apr 2024 15:23:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jZxuGXx1KmaEEQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 25 Apr 2024 15:23:40 +0000
Date: Thu, 25 Apr 2024 17:23:38 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Rudolf Marek <r.marek@assembler.cz>, Andi
 Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] i2c: ali1563: remove printout on handled timeouts
Message-ID: <20240425172338.2a3da10e@endymion.delvare>
In-Reply-To: <20240423121322.28460-4-wsa+renesas@sang-engineering.com>
References: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
	<20240423121322.28460-4-wsa+renesas@sang-engineering.com>
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
X-Spamd-Result: default: False [-2.87 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.86)[85.51%];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	HAS_ORG_HEADER(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,sang-engineering.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 586EF33E8D
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.87

On Tue, 23 Apr 2024 14:13:20 +0200, Wolfram Sang wrote:
> I2C and SMBus timeouts are not something the user needs to be informed
> about on controller level. The client driver may know if that really is
> a problem and give more detailed information to the user. The controller
> should just pass this information upwards. Remove the printout.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-ali1563.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ali1563.c b/drivers/i2c/busses/i2c-ali1563.c
> index 307fb0666ecb..63897a89bb35 100644
> --- a/drivers/i2c/busses/i2c-ali1563.c
> +++ b/drivers/i2c/busses/i2c-ali1563.c
> @@ -99,7 +99,6 @@ static int ali1563_transaction(struct i2c_adapter *a, int size)
>  		return 0;
>  
>  	if (!timeout) {
> -		dev_err(&a->dev, "Timeout - Trying to KILL transaction!\n");
>  		/* Issue 'kill' to host controller */
>  		outb_p(HST_CNTL2_KILL, SMB_HST_CNTL2);
>  		data = inb_p(SMB_HST_STS);

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support

