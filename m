Return-Path: <linux-i2c+bounces-181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D60F37ECA88
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 19:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EDB9B20B51
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 18:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEEF364BB;
	Wed, 15 Nov 2023 18:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lJ+NA2Sx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="17UUgl2S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73619E1
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 10:27:28 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2190F2291E;
	Wed, 15 Nov 2023 18:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700072847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8skgncQQ3NnMmAVI8L6lJhNd4yb2r/3QARVioJqwHk=;
	b=lJ+NA2SxvpqwTzv6UZtEIWr+nZW6XYUNXJ8ZgkP9LGwqyoXRvzFk4uQ4tEFF5RroMkWYrh
	bnV6yS5xY9Le9T7pVPkYK5pPEo17YIQL1dDTkqfmUqghAmgv5Mha7kS3lERrYl7HsKabXJ
	iXlC37MSYlW7ypQI6lxGPEfiOgDm9PU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700072847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8skgncQQ3NnMmAVI8L6lJhNd4yb2r/3QARVioJqwHk=;
	b=17UUgl2StHZBDfIibZcE62wfTxpSXkCdRYj2rFiPl5x+vtlBFPbUSBt6t4TDwaHRelXzUu
	She8xKu08OO59sBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2B1E13587;
	Wed, 15 Nov 2023 18:27:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WnRWOY4NVWWuagAAMHmgww
	(envelope-from <jdelvare@suse.de>); Wed, 15 Nov 2023 18:27:26 +0000
Date: Wed, 15 Nov 2023 19:27:25 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH RFC] i2c: i801: Add i801_register_jc42, similar to
 i2c_register_spd
Message-ID: <20231115192725.4a650d58@endymion.delvare>
In-Reply-To: <37aa2c39-8192-42be-8021-a2147252f27b@gmail.com>
References: <79977020-69c3-4f87-b861-b043c7fb9077@gmail.com>
	<b9a832d6-f7a8-4a9d-b639-181e074b4e9a@gmail.com>
	<20231114150001.6823e277@endymion.delvare>
	<37aa2c39-8192-42be-8021-a2147252f27b@gmail.com>
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
X-Spam-Score: -3.10
X-Spamd-Result: default: False [-3.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWO(0.00)[2];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]

On Tue, 14 Nov 2023 15:44:36 +0100, Heiner Kallweit wrote:
> On 14.11.2023 15:00, Jean Delvare wrote:
> > On Wed, 08 Nov 2023 11:28:45 +0100, Heiner Kallweit wrote:  
> >> From a maintenance point of view the easiest solution would be:
> >> - set flag I2C_CLASS_DEPRECATED in addition to I2C_CLASS_SPD
> >>   to encourage potential users to switch to explicit instantiating  
> > 
> > Bad idea. That's just going to spam a warning message on millions of
> > systems while there's just nothing most users can do about it. That's
> > not helpful, we are already aware of the problem, and we are the guys
> > looking into it.
>
> I'm afraid I wasn't precise enough when writing this. What I meant is
> adding I2C_CLASS_DEPRECATED for the mux'ed child segments in i801.
> So it should affect users of the few Asus systems only.

Oh right, should have been obvious actually. Nevertheless, my point
still stands, the purpose of I2C_CLASS_DEPRECATED is to draw the
attention of the developers, and in this case, the developers would be
us, so we are already aware.

> i2c_register_spd() isn't used there, so I'd assume these users don't
> miss the temp sensors on their RAM modules.

i2c_register_spd() only deals with SPD EEPROMs. The fact that it isn't
called for mux'd Asus boards only means that the users have to manually
declare the at24 devices from user-space (which is a regression from
earlier when just loading the eeprom driver would automatically create
the devices).

Users of these boards can still load the jc42 driver and the thermal
sensors on the memory modules will be supported, as long as
I2C_CLASS_SPD exists and is used by both i2c-i801 (for the mux'd
segments) and the jc42 driver.

> > (...)
> > I think the steps to follow are:
> > * Extend i2c_register_spd() to support up to 8 memory modules (I'm
> >   already working on that, patch is coming).
> > * Call i2c_register_spd() on the mux'd SMBus segments on the Asus
> >   boards.
> > * Extend i2c_register_spd() to also instantiate jc42 devices in
> >   addition to at24 (or ee1004) devices. I think this is better than
> >   writing a separate function as I initially suggested. The reason why
> >   I think so is because the SPD EEPROM does contain the information
> >   about thermal sensor presence. So the code which instantiates the at24
> >   or ee1004 device could also read from it to figure out whether a jc42
> >   device must be instantiated. This removes the need for probing.  
> 
> I miss some insight here on which type of memory modules we can expect
> jc42-4 compatible temp sensors. I saw DDR3 mentioned (including LPDDR3?),

The LP prefix is for low-power. For most practical purposes, on the
software side, you can consider these modules as equivalent to their
standard version, and treat them alike.

> not sure about DDR4. In case of DDR4 we would have to read the EE1004
> data structure to check the "temp sensor present" bit. So I wonder
> whether instantiating the temp sensor should be in ee1004 driver.

I wasn't sure so I looked up the technical literature. The Microchip
MCP98244 datasheet mentions use on a DDR4 memory module, and the NXP
SE97B and SE98A datasheet mentions use on DDR2 and DDR3 modules.

-- 
Jean Delvare
SUSE L3 Support

