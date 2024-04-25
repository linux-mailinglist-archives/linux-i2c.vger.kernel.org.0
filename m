Return-Path: <linux-i2c+bounces-3152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CB38B2582
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 17:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57DC01F21960
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 15:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5DC14BF89;
	Thu, 25 Apr 2024 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y4hL6NT2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hj4n6C0W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y4hL6NT2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hj4n6C0W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EA314A0BF;
	Thu, 25 Apr 2024 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714059956; cv=none; b=ZqB8TKFZFnzRaObA50j33iYmylzpewHVx+dG0G4Fl4w1MHotrN8r4ME/sdAApowGJIJWFenr4gq59dT4yDwP3cKPCynC75k+1imPiltSEsoDBg3wLB35JvDnnCQfay9j9mw9L+xiEivLK7yQUP61LqjwmJi//9vcBWZl5JBntLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714059956; c=relaxed/simple;
	bh=aLNOpU0TwtjAVJpMES4C7c9D1YU51qnuvStJZTDomSs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9RABA3+Ba8foK06orfVF+9gNijkBLfLd2U5XqtuZrDKhDtRGRrboiHCA8N/eWxy7LTzMojucT5N3vR3O+WoaczjBTBq74XIizuys5g525Mbmjg9wrdAs22kV1kkN6xiBzQCs6SQ7f11342PhUz9vPhRSxXCIGCKSBNUkFh7NLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y4hL6NT2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hj4n6C0W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y4hL6NT2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hj4n6C0W; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 22F345BEDD;
	Thu, 25 Apr 2024 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714059952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKPCz/g8F0wqv3JnYeaXQhQSP8CzjdejwZMbbBUL74A=;
	b=y4hL6NT2nKBm+Lw0yT9iuzbqw6I+9M3yfEErI6MkUHOcw/+R8y5Lk3kDncMCbjYIgyROTe
	v0Vx9cYwjsMfF392vJ3UTQBx6ai1XpFUORWrix1qp4WIjk3ZBpaJVue3VFq7O6+5ar6dp+
	Nx8QD6b++XI8FrSJnU6nGOfttmZAnzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714059952;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKPCz/g8F0wqv3JnYeaXQhQSP8CzjdejwZMbbBUL74A=;
	b=Hj4n6C0WmzL869N0tc8I6xMA3pEeUEXlu+lZ3T487I2dn65em9sqGr+vzUUcoEUWJTuO3X
	KOTIjMxciHEbIWBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714059952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKPCz/g8F0wqv3JnYeaXQhQSP8CzjdejwZMbbBUL74A=;
	b=y4hL6NT2nKBm+Lw0yT9iuzbqw6I+9M3yfEErI6MkUHOcw/+R8y5Lk3kDncMCbjYIgyROTe
	v0Vx9cYwjsMfF392vJ3UTQBx6ai1XpFUORWrix1qp4WIjk3ZBpaJVue3VFq7O6+5ar6dp+
	Nx8QD6b++XI8FrSJnU6nGOfttmZAnzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714059952;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKPCz/g8F0wqv3JnYeaXQhQSP8CzjdejwZMbbBUL74A=;
	b=Hj4n6C0WmzL869N0tc8I6xMA3pEeUEXlu+lZ3T487I2dn65em9sqGr+vzUUcoEUWJTuO3X
	KOTIjMxciHEbIWBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B2EE1393C;
	Thu, 25 Apr 2024 15:45:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l/JqE696KmamFwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 25 Apr 2024 15:45:51 +0000
Date: Thu, 25 Apr 2024 17:45:49 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] i2c: i801: remove printout on handled timeouts
Message-ID: <20240425174549.236a9efe@endymion.delvare>
In-Reply-To: <20240423121322.28460-2-wsa+renesas@sang-engineering.com>
References: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
	<20240423121322.28460-2-wsa+renesas@sang-engineering.com>
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
X-Spam-Score: -1.74
X-Spam-Level: 
X-Spamd-Result: default: False [-1.74 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.44)[78.70%];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,sang-engineering.com:email,suse.de:email]

On Tue, 23 Apr 2024 14:13:18 +0200, Wolfram Sang wrote:
> I2C and SMBus timeouts are not something the user needs to be informed
> about on controller level. The client driver may know if that really is
> a problem and give more detailed information to the user. The controller
> should just pass this information upwards. Remove the printout and turn
> the SMBus-specific termination message to debug.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index e577abc776c1..d2d2a6dbe29f 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -399,9 +399,7 @@ static int i801_check_post(struct i801_priv *priv, int status)
>  	 * If the SMBus is still busy, we give up
>  	 */
>  	if (unlikely(status < 0)) {
> -		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
>  		/* try to stop the current command */
> -		dev_dbg(&priv->pci_dev->dev, "Terminating the current operation\n");
>  		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
>  		usleep_range(1000, 2000);
>  		outb_p(0, SMBHSTCNT(priv));
> @@ -410,7 +408,7 @@ static int i801_check_post(struct i801_priv *priv, int status)
>  		status = inb_p(SMBHSTSTS(priv));
>  		if ((status & SMBHSTSTS_HOST_BUSY) ||
>  		    !(status & SMBHSTSTS_FAILED))
> -			dev_err(&priv->pci_dev->dev,
> +			dev_dbg(&priv->pci_dev->dev,
>  				"Failed terminating the transaction\n");
>  		return -ETIMEDOUT;
>  	}

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support

