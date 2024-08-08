Return-Path: <linux-i2c+bounces-5208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C225194B9A9
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 11:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E51E91C20D55
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 09:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3FE1474A9;
	Thu,  8 Aug 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IpurLUNa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xi5sdcTo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IpurLUNa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xi5sdcTo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D88E146D55
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723109331; cv=none; b=qQIICx3Ny2nQAXyTc7ByCjm5LFHFl+DBy/6RFDL7yco/G+FQQ8+yCuel2BpZ25JCCDrEusKHmPudHuhqlPfUiX8voW3IeM94TpOVLpGSf+SWvCQXtfYVeSo+xVcrCDlfi3leLg0OXmbdoshPgEH7LObgeVpnfirruUQaXsdAs+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723109331; c=relaxed/simple;
	bh=QHmoOpDu0Y5ilpCPcfOsUBI02gpTEQVgMbjd5CETKPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LU7G0TV5b2K//O2EclgTkfVlb+DSN/eQhOLuR2olBraWMizHmwEXR4/1iAe8eIkHQ5UUL/TLr3jzImo3VjpcsIQrZMDr/r+MYGpnsipNX2rncUTctqy9Ww1pNnqwt29rFxocwjWevt+1/BywbapYJpnzay6LEbkN+beD+yukUR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IpurLUNa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xi5sdcTo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IpurLUNa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xi5sdcTo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 556FC21A0C;
	Thu,  8 Aug 2024 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723109328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7WxAMflfVPuJVKkhC7H4fLBdnlPbNL7YpmLJh9lW0M=;
	b=IpurLUNae77M4yNRUPH+HJPGL/GveXC2mGJ1UIYXzrO313p2QZ7qCqtxccmtqzKAFGOu9y
	llVHW15LT1ZwQuQZK1Pr7SsMXIDZ4kBoHzJweHkS+Re2CCOTUxCgpxtPzw5JD6/YOeOUIB
	slPxRO0NXgAfzhD8M1/prC7URft8aCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723109328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7WxAMflfVPuJVKkhC7H4fLBdnlPbNL7YpmLJh9lW0M=;
	b=Xi5sdcToi5OmUMcpvTRkPupC4GQtEWvyXNo7JkiLnHIwoAF3Z9BmgMJlJ/h6qUMJOmIpi/
	QbcyQelRtqxWSNDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723109328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7WxAMflfVPuJVKkhC7H4fLBdnlPbNL7YpmLJh9lW0M=;
	b=IpurLUNae77M4yNRUPH+HJPGL/GveXC2mGJ1UIYXzrO313p2QZ7qCqtxccmtqzKAFGOu9y
	llVHW15LT1ZwQuQZK1Pr7SsMXIDZ4kBoHzJweHkS+Re2CCOTUxCgpxtPzw5JD6/YOeOUIB
	slPxRO0NXgAfzhD8M1/prC7URft8aCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723109328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7WxAMflfVPuJVKkhC7H4fLBdnlPbNL7YpmLJh9lW0M=;
	b=Xi5sdcToi5OmUMcpvTRkPupC4GQtEWvyXNo7JkiLnHIwoAF3Z9BmgMJlJ/h6qUMJOmIpi/
	QbcyQelRtqxWSNDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D365613876;
	Thu,  8 Aug 2024 09:28:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3h6wLM+PtGY7JAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 08 Aug 2024 09:28:47 +0000
Date: Thu, 8 Aug 2024 11:28:01 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools v2] README: ask for DCO in contributions
Message-ID: <20240808112746.42fa8590@endymion.delvare>
In-Reply-To: <20240807112835.14346-1-wsa+renesas@sang-engineering.com>
References: <20240807112835.14346-1-wsa+renesas@sang-engineering.com>
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
X-Spamd-Result: default: False [-1.30 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[renesas];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -1.30

Hi Wolfram,

On Wed,  7 Aug 2024 13:24:33 +0200, Wolfram Sang wrote:
> Add some documentation we can point contributors to wrt. DCO.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Change since v1:
> *	s/i2x/i2c/
> 
> @Jean: do you agree to asking for DCOs in i2c-tools? Also, together with

Yes, fine with me.

> the 'i2ctransfer' improvements I just sent out, I think we could aim for
> a 4.4 release soon, or? It's been 3 years and the updates are small but
> still neat, I think.

OK!

> 
> 
>  README | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/README b/README
> index fb7bd03..2d342e5 100644
> --- a/README
> +++ b/README
> @@ -106,3 +106,11 @@ with Cc to the current maintainer:
>    Jean Delvare <jdelvare@suse.de>
>  For additional information about this list, see:
>    http://vger.kernel.org/vger-lists.html#linux-i2c
> +
> +CONTRIBUTIONS
> +-------------
> +
> +Contributions are very welcome. Please send them to the linux-i2c mailing list
> +mentioned above. Make sure they include a 'Developer's certificate of origin'
> +as used for the Linux Kernel and described here:
> +  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support

