Return-Path: <linux-i2c+bounces-149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3367EB16A
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 15:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDF651C20AA1
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 14:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10298405D3;
	Tue, 14 Nov 2023 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bBmz8xQD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JHYiMfUD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C234F405DA
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 14:00:11 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A00132
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 06:00:05 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF8B11F88F;
	Tue, 14 Nov 2023 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1699970402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxvKirbhUg1ETKxn1ft3xsjnXmjmgRlIwOhVuer7xlQ=;
	b=bBmz8xQDdhB6rFuWBDGWmY1Gvei/BM116vQ2fqbfK3aDXRFGvA91g1/m1vYAa7OGNHMQig
	vAYRw9B+KvOqprZgTuccEAD/plwko7b4OWfSEl7pn8FciJzWlUshUpPcVuRX8hJZgskKnv
	Kjxt3F5sfoqdvbnnJ5viPRnaOJ8QBjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699970402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxvKirbhUg1ETKxn1ft3xsjnXmjmgRlIwOhVuer7xlQ=;
	b=JHYiMfUDBgfhKs+vgnyjF4Lw8kt8inqINBEnKgcDuZZU5+mbI7Vbddw0cdp6B11NAOOdVG
	zmhxXJgCmoprFiDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3F4813460;
	Tue, 14 Nov 2023 14:00:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id pWl0KmJ9U2UiHwAAMHmgww
	(envelope-from <jdelvare@suse.de>); Tue, 14 Nov 2023 14:00:02 +0000
Date: Tue, 14 Nov 2023 15:00:01 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH RFC] i2c: i801: Add i801_register_jc42, similar to
 i2c_register_spd
Message-ID: <20231114150001.6823e277@endymion.delvare>
In-Reply-To: <b9a832d6-f7a8-4a9d-b639-181e074b4e9a@gmail.com>
References: <79977020-69c3-4f87-b861-b043c7fb9077@gmail.com>
	<b9a832d6-f7a8-4a9d-b639-181e074b4e9a@gmail.com>
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
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.10
X-Spamd-Result: default: False [-7.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 HAS_ORG_HEADER(0.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_TWO(0.00)[2];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]

Hi Heiner,

On Wed, 08 Nov 2023 11:28:45 +0100, Heiner Kallweit wrote:
> On 08.11.2023 08:27, Heiner Kallweit wrote:
> > As discussed, this is a RFC version of changing jc42 auto-detection
> > with the goal to get rid of I2C_CLASS_SPD completely mid-term.
> > 
> > Code of i801_jc42_probe() was copied from jc42 driver, just w/o
> > the device id check. I think it's safe enough w/o this check.
> > 
> > I don't have hw to test this, therefore it's compile-tested only.
> > 
> > Link:
> > https://lore.kernel.org/linux-i2c/a22978a4-88e4-46f4-b71c-032b22321599@gmail.com/
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com> ---
> >  drivers/i2c/busses/i2c-i801.c | 48
> > ++++++++++++++++++++++++++++++++--- 1 file changed, 44
> > insertions(+), 4 deletions(-) 
> 
> That's quite some code for more or less nothing. I2C_CLASS_SPD is
> relevant only for users:
> - having one of the specific old ASUS machines with i2c-muxing
> - having RAM with a jc42-compatible temperature sensor
> - manually loading module jc42 to expose the temp sensor

People running such systems would typically run sensors-detect to setup
their hardware monitoring, so the jc42 driver would be loaded at boot
by the lm-sensors service. This is "manual" from the kernel's
perspective, but still this is integrated and has been working for
years. If you break that, this is a functional regression.

There is nothing fundamentally specific to i2c-i801 or these Asus
boards here. The only reason why we are discussing it in this context
is because SMBus multiplexing adds some implementation constraints, and
it turns out that right now only the i2c-i801 driver has support for
PC-style boards with multiplexed SMBus.

The solution however needs to work on all PC-style systems, Intel or
AMD (or anything else that exists), with SMBus multiplexed or not.

Originally, I2C_CLASS_SPD was there, the eeprom and jc42 drivers were
using it, and just loading these drivers would instantiate all the
devices. This is the level of user-friendliness we must aim at.

Now, the eeprom driver is gone, so class-based SPD device support no
longer exists. This was replaced by i2c_register_spd(), but is
currently only working on non-multiplexed Intel-based systems. Ideally
this should be extended to non-Intel systems (I'm surprised nobody
reported about that regression yet) and Intel systems with multiplexed
SMBus (that would be achieved by calling i2c_register_spd explicitly on
these segments, possibly with a few changes, as discussed earlier).

The jc42 driver still works the way it used to. If you remove
I2C_CLASS_SPD, this will still work on most non-SMBus-multiplexed
systems (thanks to I2C_CLASS_HWMON), but will stop working on the
multiplexed Asus boards (because the bus segments which host the memory
modules don't have I2C_CLASS_HWMON, and can't have it), or any other
board using SMbus multiplexing which we would like to support in the
future. I believe there are still many such systems out there, as
server systems with more than 8 memory slots are legions and this is
the hard limit of how many memory slots can be connected to a single
SMBus segment. We could receive a request to support such recent server
boards at any time, so we better be ready for it.

This is the reason why I asked for jc42 devices to be instantiated
automatically on multiplexed SMBus segments. The function doing that
should however not live in the i2c-i801 driver, it must be usable by
any SMBus controller driver. Also, while we only need this for
multiplexed SMBus segments, we could still use it everywhere
i2c_register_spd() is used, so that jc42 devices get instantiated at
boot-time without the need for user-space support.

> From a maintenance point of view the easiest solution would be:
> - set flag I2C_CLASS_DEPRECATED in addition to I2C_CLASS_SPD
>   to encourage potential users to switch to explicit instantiating

Bad idea. That's just going to spam a warning message on millions of
systems while there's just nothing most users can do about it. That's
not helpful, we are already aware of the problem, and we are the guys
looking into it.

> - wait few kernel versions and remove class-based instantiation

Assuming you only refer to I2C_CLASS_SPD and not I2C_CLASS_HWMON, then
yes. I2C_CLASS_HWMON must stay as there's no suitable replacement for
it yet (and sadly I can't foresee any).

I think the steps to follow are:
* Extend i2c_register_spd() to support up to 8 memory modules (I'm
  already working on that, patch is coming).
* Call i2c_register_spd() on the mux'd SMBus segments on the Asus
  boards.
* Extend i2c_register_spd() to also instantiate jc42 devices in
  addition to at24 (or ee1004) devices. I think this is better than
  writing a separate function as I initially suggested. The reason why
  I think so is because the SPD EEPROM does contain the information
  about thermal sensor presence. So the code which instantiates the at24
  or ee1004 device could also read from it to figure out whether a jc42
  device must be instantiated. This removes the need for probing.
* Get rid of I2C_CLASS_SPD.

-- 
Jean Delvare
SUSE L3 Support

