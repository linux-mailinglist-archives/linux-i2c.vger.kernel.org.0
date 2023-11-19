Return-Path: <linux-i2c+bounces-253-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A847F04D4
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 09:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9C0AB2098E
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 08:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C15146B4;
	Sun, 19 Nov 2023 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2RKkF2RM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TOc2xSAW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A954A2
	for <linux-i2c@vger.kernel.org>; Sun, 19 Nov 2023 00:39:05 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D35E0228B8;
	Sun, 19 Nov 2023 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700383143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VfAceHUWlJwBfoe48AJnPOJCRJwPYKNQdgDMr91G+Cc=;
	b=2RKkF2RMUktWBscXOisL68kZDjyeoLrrpLr/TowuwCKsxrnL6OSH2QXR1Hg+KUfUmvo6dq
	h80qECVefwcEVFQJaqtBpqCJzFOEe26TBgjUQhG0PKFzfFWT0F97/YyQFV8uF/x1s3vOet
	Xg3tWIGJHY+IZJ+PfCY3S06eBYY/RCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700383143;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VfAceHUWlJwBfoe48AJnPOJCRJwPYKNQdgDMr91G+Cc=;
	b=TOc2xSAWpKrR4tPLWVVZWfdu/yZr4Vi0oXkZ7bjPvge8B3nmzifiEeVe2Yq/ojJvu+8NvH
	rBPnDZtN+XL8jgDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC188139C4;
	Sun, 19 Nov 2023 08:39:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id rKl8KKfJWWX2FgAAMHmgww
	(envelope-from <jdelvare@suse.de>); Sun, 19 Nov 2023 08:39:03 +0000
Date: Sun, 19 Nov 2023 09:39:02 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH RFC] i2c: i801: Add i801_register_jc42, similar to
 i2c_register_spd
Message-ID: <20231119093902.739b4602@endymion.delvare>
In-Reply-To: <5f2ed562-319c-4439-a235-c1a01373c1fe@gmail.com>
References: <79977020-69c3-4f87-b861-b043c7fb9077@gmail.com>
	<b9a832d6-f7a8-4a9d-b639-181e074b4e9a@gmail.com>
	<20231114150001.6823e277@endymion.delvare>
	<37aa2c39-8192-42be-8021-a2147252f27b@gmail.com>
	<5f2ed562-319c-4439-a235-c1a01373c1fe@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.76
X-Spamd-Result: default: False [-1.76 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 HAS_ORG_HEADER(0.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWO(0.00)[2];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.46)[79.09%]

Hi Heiner,

On Wed, 15 Nov 2023 12:00:18 +0100, Heiner Kallweit wrote:
> After thinking once more about it I think we have to do it from the
> ee1004 driver for DDR4. For DDR3 from at24. Only this way we can read
> the "temp sensor present" flag from SPD. E.g. for ee1004 the SPD EEPROM
> may be switched to the second page and we have to switch it to the first
> page first.

We indeed need to read the EEPROM data at some point. My initial
thinking was to instantiate the at24 or ee1004 device first (from
i2c-smbus), then read the value from the EEPROM and instantiate the
jc42 device (still from i2c-smbus). This requires an internal read
function. I think we already have that in at24, because it uses the
nvmem framework, but ee1004 lacks it as far as I can see.

But anyway, if you have another approach which works, that's equally
fine with me.

> I'll send a RFC patch for this. Unfortunately I have no RAM with temp
> sensor to test it.

Neither do I :-(

-- 
Jean Delvare
SUSE L3 Support

