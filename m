Return-Path: <linux-i2c+bounces-5254-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209D294D0BB
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 15:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64ADFB235D3
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 13:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B60194C71;
	Fri,  9 Aug 2024 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iLtW4bYb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1ED2P/xX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iLtW4bYb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1ED2P/xX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B713F19307A;
	Fri,  9 Aug 2024 12:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723208362; cv=none; b=mK2tL/J19lAZnp4LZuSYzudfC+BID6Nv7NaFnaXO8pXmwpJBBp56EsoWkMIoSzH7F44VtWu/yg/EDp0SABZm5j026jpNCv+Da+HVVqBZtBXN6kA3tCEEhJcHXM5rx+7NccV66Cz7sl7450AmRlmZ6rNdldf2E+whOkaJ22A3jcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723208362; c=relaxed/simple;
	bh=t3xQ4NA+phOzj8f59GoyqEcw/Hz328ErMc0xLBjd3Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6lY9dU6+7ro3cyOATZoUoVLx3FObKAUWFdEHAwEJiOmkuCh3KmBQA7YKIaSwCXRO3dWqlnp9r6JdAxSaQ3s+JAtkI/wVFTgV4jg94a/PGVWfFFKG2G5eB48k9uupCrJFF+pRZcqDEnhlHm+WIzUXluN6CMCG3KO11vZkrnoTwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iLtW4bYb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1ED2P/xX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iLtW4bYb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1ED2P/xX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C154321E58;
	Fri,  9 Aug 2024 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723208357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vnc+WH7j7DUSFdRWJCuP1bwPsfsVy7xPQd2NtzSaUlI=;
	b=iLtW4bYbTX9VXyhDvo7F1yQph1QOx4c4/+12asbRCuSSPdIT1ehlSy2fXQre8/QOeeB3+J
	TuyRpHAh4Phe88pDsbb10PdRl+OtPJlUudeH3Sd5SKCw8L0SoGBNhPz5F9ZF1szz3k35MM
	c9/pISRVJC9gUNfJkJCxMVR/CELNvik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723208357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vnc+WH7j7DUSFdRWJCuP1bwPsfsVy7xPQd2NtzSaUlI=;
	b=1ED2P/xXrJB3fn0rQ70bR2oixNj5CO7G/wl1aojmZZhxEq4J1n2tNcDYQAU0QW49t07B+n
	0tprKaOg4IzeKpCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iLtW4bYb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1ED2P/xX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723208357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vnc+WH7j7DUSFdRWJCuP1bwPsfsVy7xPQd2NtzSaUlI=;
	b=iLtW4bYbTX9VXyhDvo7F1yQph1QOx4c4/+12asbRCuSSPdIT1ehlSy2fXQre8/QOeeB3+J
	TuyRpHAh4Phe88pDsbb10PdRl+OtPJlUudeH3Sd5SKCw8L0SoGBNhPz5F9ZF1szz3k35MM
	c9/pISRVJC9gUNfJkJCxMVR/CELNvik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723208357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vnc+WH7j7DUSFdRWJCuP1bwPsfsVy7xPQd2NtzSaUlI=;
	b=1ED2P/xXrJB3fn0rQ70bR2oixNj5CO7G/wl1aojmZZhxEq4J1n2tNcDYQAU0QW49t07B+n
	0tprKaOg4IzeKpCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E10311379A;
	Fri,  9 Aug 2024 12:59:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1oAxMKEStmacdwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 09 Aug 2024 12:59:13 +0000
Date: Fri, 9 Aug 2024 14:59:11 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, Elie
 Morisse <syniurge@gmail.com>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Baruch Siach <baruch@tkos.co.il>, Dong
 Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin
 Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony
 Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Vignesh R <vigneshr@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: don't use ',' after delimiters
Message-ID: <20240809145911.50cc327f@endymion.delvare>
In-Reply-To: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
References: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
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
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: C154321E58
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,amd.com,linux.dev,kernel.crashing.org,jms.id.au,codeconstruct.com.au,tkos.co.il,nxp.com,pengutronix.de,iki.fi,kemnade.info,baylibre.com,atomide.com,ti.com,mleia.com,samsung.com,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	R_RATELIMIT(0.00)[to_ip_from(RLx5ghmqs35ey73zpnq1znwten),from(RLoz63kdxwtinegqpbiqua)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 31 Jul 2024 00:01:59 +0200, Wolfram Sang wrote:
> Delimiters are meant to be last, no need for a ',' there. Remove a
> superfluous newline in the ali1535 driver while here.

Thanks for the cleanup.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support

