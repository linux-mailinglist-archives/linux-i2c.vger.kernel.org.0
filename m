Return-Path: <linux-i2c+bounces-13018-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18756B7F277
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 15:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 355241C815F3
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 13:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C3B1F4181;
	Wed, 17 Sep 2025 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1GSh/3Mg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RiK1G9NP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v0aNbAdH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6A8EcvsF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F0C330D49
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758114475; cv=none; b=MyIlWrftwCNYyJJBXxXZnhmXwNjPINhxl8DYJDV3WwPoA3xh1JA0ZEbfCsraOy0LrPw9+UWlwJwHfyuR1/byJSxqY6mThbyqfL5lph5Wu2PyykDlD3nZu55a2K7SRwivdrwSdmvWYIke7EwIImISbbpiN/GujP0Mcn9a4Mi7ezc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758114475; c=relaxed/simple;
	bh=Nsxr39D8izwLeLQkpiAXhuW7mBIQeC1Fk9V1lyfbGRs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jmVnOiib3F9HIhBWYhGMjenlqWvEa4UFT1grAZF1yAj30kglG+3jyRKXGVSdwqc4kVEWra/TkSPEe2Lfn+ZtbOKcJ95yxyC6kf7G+BHlxR4XoIL4RmBCP3IODiA/CL02vfQhYOqEB5YLBlIB6lNMUxyA6G2J2O6IB8yfD2e51L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1GSh/3Mg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RiK1G9NP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v0aNbAdH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6A8EcvsF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B996F1FE2C;
	Wed, 17 Sep 2025 13:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758114472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DMzzHWUBNNzJ+ICYcimlxqXykYjYEfHku8kQeKXL7c=;
	b=1GSh/3Mg0f+Db3n7bqomRyLnqr5O14aoyBdTwdX/IV6r0ZrwUPREqwXty8xIEB8TX0LK8p
	eR71KVH7/wDSG8BgTpDGSqXtWJhtaG6NRHiYBppYzhZxAwVfNE+68+GgfDPai9pqlpJ2T9
	JDlO9ouE6czz+5d5/IxrTu6jFAGgl7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758114472;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DMzzHWUBNNzJ+ICYcimlxqXykYjYEfHku8kQeKXL7c=;
	b=RiK1G9NPAGPXuHneUqyaeVhc4AoLNSzKewVExgmTYen9tz0KLSD2k15nV2ezp/IJ53hKfX
	67P6C7d0PtcWWqCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v0aNbAdH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6A8EcvsF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758114471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DMzzHWUBNNzJ+ICYcimlxqXykYjYEfHku8kQeKXL7c=;
	b=v0aNbAdH+ZEaWYMdHPGEUOPZJ5d9h06zywlrMwbQ4kWqCaAaPwSgeQvf50dHtXD/tivP+F
	DxJs2uCEAesYCC5c0vJqve9qm3x0ML9YES5psJaL93bWe8pkl+l/FRt3uM93u588zz5Iyv
	+1rhMfDXZIt+9vtooQuJ8siDWqVT2kc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758114471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DMzzHWUBNNzJ+ICYcimlxqXykYjYEfHku8kQeKXL7c=;
	b=6A8EcvsFVlNb2Fz7flk/n3xVuY0HOns/l/4bkJrlDeIQ004UC5Anxq/HxakWHCPj1XXXs0
	l95E+0ll/vSFVwAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A88F13AAF;
	Wed, 17 Sep 2025 13:07:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6LYPGKeyymhGbQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Wed, 17 Sep 2025 13:07:51 +0000
Date: Wed, 17 Sep 2025 15:07:48 +0200
From: Jean Delvare <jdelvare@suse.de>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andi Shyti
 <andi.shyti@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 "Mika Westerberg" <mika.westerberg@linux.intel.com>, Jan Dabros
 <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: Recent i2c-designware initialization fix
Message-ID: <20250917150748.1f5195a8@endymion>
In-Reply-To: <IA1PR11MB64188C2A7BC8ADEE6A6AED3BC117A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250917130450.50ff0db3@endymion>
	<IA1PR11MB64188C2A7BC8ADEE6A6AED3BC117A@IA1PR11MB6418.namprd11.prod.outlook.com>
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
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B996F1FE2C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[semihalf.com:email,intel.com:email,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01

On Wed, 17 Sep 2025 12:46:32 +0000, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: Jean Delvare <jdelvare@suse.de>
> >Sent: Wednesday, September 17, 2025 7:05 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Andi Shyti
> ><andi.shyti@kernel.org>; Jarkko Nikula <jarkko.nikula@linux.intel.com>; Mika
> >Westerberg <mika.westerberg@linux.intel.com>; Jan Dabros
> ><jsd@semihalf.com>; linux-i2c@vger.kernel.org
> >Subject: Recent i2c-designware initialization fix
> >
> >Hello Michael,
> >
> >I have been looking into your kernel commit 3d30048958e0
> >("i2c/designware: Fix an initialization issue"), as it received a CVE
> >number (CVE-2025-38380), I was asked to evaluate the severity of the
> >bug.
> >
> >I was not familiar with the i2c-designware driver so it took me some
> >reading time to form an opinion on the matter. But after a careful
> >review, my conclusion is that there was no actual bug in the first
> >place. If I'm correct then CVE-2025-38380 is invalid.
> >
> >My reasoning is as follows:
> >* struct dw_i2c_dev is allocated per-PCI device in i2c_dw_pci_probe()
> >  using devm_kzalloc(), therefore all its members, including
> >  dev->msg_write_idx, are initialized to 0.
> >* The supposedly problematic code path is only taken if (dev->flags &
> >  MODEL_MASK) == MODEL_AMD_NAVI_GPU.
> >* The only place where dev->msg_write_idx is set to a non-zero value is
> >  in i2c_dw_xfer_msg(). This function is only called by i2c_dw_isr(),
> >  which in turn is only called if the device is not in polling mode.
> >* The flags set for the AMD Navi GPU devices are:
> >  dev->flags |= MODEL_AMD_NAVI_GPU | ACCESS_POLLING
> >  so these devices are always in polling mode and never use an
> >  interrupt so i2c_dw_isr() is never called for them.
> >
> >If my reasoning is correct, then for the AMD Navi GPU devices,
> >dev->msg_write_idx is implicitly initialized to 0 at allocation time
> >and its value is never changed after that, so the explicit
> >initialization to 0 which has been added in amd_i2c_dw_xfer_quirk() is
> >a no-op.
> >
> >What do you think? Am I missing something?  
> 
> You are correct.
> 
> This is a preventive fix to have a common init path for the common data structure.
> 
> The concern being that if the code is updated to use this idx, without this additional init,
> the code will behave unexpectedly.

OK, I understand the rationale, thanks for clarifying.

Next time this happens, I suggest mentioning in the commit message that
the fix is in anticipation of future changes and not fixing an existing
bug. This will make it easier for kernel branch maintainers to decide
whether the fix needs to be backported, and for the security team to
decide whether or not to attribute a CVE number.

(As a side note, I don't think i2c_dw_xfer_init() should be using
dev->msg_write_idx in the first place, I'll submit an alternative fix,
but this should be discussed separately.)

> I am not terribly familiar with the CVE process, but from my understanding, I don't think
> that this is an issue that warrants one.

Unfortunately (from my perspective) kernel fixes can get a CVE number
automatically based on a some keywords. Your commit message mentioned a
potential out of bound array access, which falls into that category.

I'll let the kernel CVE team know that this CVE is invalid so that they
can cancel it.

-- 
Jean Delvare
SUSE L3 Support

