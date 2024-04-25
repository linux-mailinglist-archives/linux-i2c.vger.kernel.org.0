Return-Path: <linux-i2c+bounces-3153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B52C8B25CD
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 17:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE7DC1F21392
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 15:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F3214C58E;
	Thu, 25 Apr 2024 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eHnj5UQC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dezGulnG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gBx+i3ZL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WNnfGfMb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE7C149E05;
	Thu, 25 Apr 2024 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714060706; cv=none; b=MeZ5JqnxNjkDnG7V57Yf2RKWVZVrc1oDpf8Y8z6TrKi6EVbZWMiTH7ALJSDcUeroIzxdZFbf6e7tJqMUPrcBCitHbHWhBO7cy3LHWEw4KkodRqrvwZV3grpZQUeROb55LLxxAbJDM3MfyvJofcOIze/IUC+uVdO38cQ7UbQYrSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714060706; c=relaxed/simple;
	bh=OxG/QwOLFpTqJqioQwvBPSs3kg69DSi3qMbneBAzDeU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YsY5MbIQfPoURwFVYRxkQvUKiSspXUBQxait9NcMxWOZRBjrAmLuIKPMoYDGxo19NOKW3a3JJl7Y5GWAiBTKdM9HOFigBbaqofum3NW1HpUGxvGvecz28zwEdYYQci2fUXHmazlN3zEz1edRJayjKZMM+TGjUsy8BNyiCAS5cRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eHnj5UQC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dezGulnG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gBx+i3ZL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WNnfGfMb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3DEB95BF28;
	Thu, 25 Apr 2024 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714060703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LTL/RRFbpvk/+mxrp2TJpSluJhlsQ2v73kcoSRWVGhE=;
	b=eHnj5UQCzV0zNnpUZ924ax6ZKfd40F7KYQoI8HzJnDEDLW3gASgaxWtXN5PlMdCqrmxkGy
	emmB7ET2pkVBpLoIyXl72ypf6w7BtuGBk9Xr4OZmiw0B0pjeeVUk0fx9QdIKBN/XgooVGF
	bmOkC/+aXmCGJrXyFWk+1I6BPrcS/oo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714060703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LTL/RRFbpvk/+mxrp2TJpSluJhlsQ2v73kcoSRWVGhE=;
	b=dezGulnGTk4qBg8G8dYpBDLJyWDu5hsA8Otf+SfM2Ch3UZ6NeItmL8nbc4fLgKbQNT8LsD
	9PVMRL2Wn6s2WpBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gBx+i3ZL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WNnfGfMb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714060702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LTL/RRFbpvk/+mxrp2TJpSluJhlsQ2v73kcoSRWVGhE=;
	b=gBx+i3ZLtMmip8gNfQiPjMMQ0wKkImktVreGs+zMgnqKx8Ll/dCVKKdqU0Cs+OH8UXXgut
	V9z8G8YtyyBHqvo7K6PglFKDkK9tiriblWJt0WLuaFzE4D/09e31ZnnnTGjhRRsibRdguk
	Lzo3jy39kRGW3b4P2zjfzYKGKjpK2m8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714060702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LTL/RRFbpvk/+mxrp2TJpSluJhlsQ2v73kcoSRWVGhE=;
	b=WNnfGfMbL1lk3g5SDW720qUCxh+Lz9Md4whWA2zq5Dcwe+FfD8EqOq7FpwQ/kKRMSEb3eK
	I3uES+suPrONTuDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 887691393C;
	Thu, 25 Apr 2024 15:58:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N86UGp19KmZBGwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 25 Apr 2024 15:58:21 +0000
Date: Thu, 25 Apr 2024 17:58:19 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] i2c: ali1535: remove printout on handled timeouts
Message-ID: <20240425175819.20c1d9aa@endymion.delvare>
In-Reply-To: <20240423121322.28460-3-wsa+renesas@sang-engineering.com>
References: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
	<20240423121322.28460-3-wsa+renesas@sang-engineering.com>
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
X-Rspamd-Queue-Id: 3DEB95BF28
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

Hi Wolfram,

On Tue, 23 Apr 2024 14:13:19 +0200, Wolfram Sang wrote:
> I2C and SMBus timeouts are not something the user needs to be informed
> about on controller level. The client driver may know if that really is
> a problem and give more detailed information to the user. The controller
> should just pass this information upwards. Remove the printout.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-ali1535.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
> index 461eb23f9d47..9d7b4efe26ad 100644
> --- a/drivers/i2c/busses/i2c-ali1535.c
> +++ b/drivers/i2c/busses/i2c-ali1535.c
> @@ -285,10 +285,8 @@ static int ali1535_transaction(struct i2c_adapter *adap)
>  		 && (timeout++ < MAX_TIMEOUT));
>  
>  	/* If the SMBus is still busy, we give up */
> -	if (timeout > MAX_TIMEOUT) {
> +	if (timeout > MAX_TIMEOUT)
>  		result = -ETIMEDOUT;
> -		dev_err(&adap->dev, "SMBus Timeout!\n");
> -	}
>  
>  	if (temp & ALI1535_STS_FAIL) {
>  		result = -EIO;
> @@ -313,10 +311,8 @@ static int ali1535_transaction(struct i2c_adapter *adap)
>  	}
>  
>  	/* check to see if the "command complete" indication is set */
> -	if (!(temp & ALI1535_STS_DONE)) {
> +	if (!(temp & ALI1535_STS_DONE))
>  		result = -ETIMEDOUT;
> -		dev_err(&adap->dev, "Error: command never completed\n");
> -	}
>  
>  	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, TYP=%02x, "
>  		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",

I'm skeptical about that one, although this might be mainly an issue
with the code flow rather than your proposed changes.

There are 2 conditions which cause result to be set to -ETIMEDOUT.
After removing the messages, there's no way to differentiate between
these two cases, which could make bug investigation more difficult.

Another concern is that it is possible (at least theoretically) to hit
the first timeout condition and NOT return -TIMEDOUT. This is because
the code flow tests a number of conditions in a non-exclusive way, so
errnos may overwrite each other. I don't like this design. The
consequence is that the calling device driver may not be able to report
the timeout, while this was the reason you gave for removing the
message.

That being said, this is a very old driver, maintained in best effort
mode, I actually very much doubt it has any user left, so there's
little point in spending too much time on this. My gut feeling is that
the first "result = -ETIMEDOUT" isn't actually needed in practice and
will always be overwritten by another errno later in the code flow
(possibly the second "result = -ETIMEDOUT"). So most likely your change
is safe.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support

