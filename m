Return-Path: <linux-i2c+bounces-15306-lists+linux-i2c=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-i2c@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF1EGvKnb2ndEgAAu9opvQ
	(envelope-from <linux-i2c+bounces-15306-lists+linux-i2c=lfdr.de@vger.kernel.org>)
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 17:06:10 +0100
X-Original-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EC5470B2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 17:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57FBD948AA5
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 14:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677C8449ED5;
	Tue, 20 Jan 2026 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FMceTW1w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fj2heuNk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xxOknPZH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s8D0qnXS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7770F42188E
	for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 14:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918548; cv=none; b=AK4hTYkUH4Bn2kafnsXA5XtnU4QQ3kEBkEkva6M2ZSnRbDRP6wmqJC3xzX5O4nXAZyyeCdlZmF2x4obTRwX3v1ExkHCmIZZeUr3jQbCyVojY2LImHdzDSVGUaKYrY3DlKxv5pOqN+Cnci77ZVOCeSYnc1ktgcVLz+Q7vkaIu24M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918548; c=relaxed/simple;
	bh=zFcd7yMjFnmEmNDNXfoz/tqfA7edF8f1uAI1JJCLW8M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hEbFUdC1LGfGZk0JUaqvPa4H5hkKrCsUma9HO5YMVwux1pMSXUfgsW5Xi6ZCpkiDyZ/V1lomObVbEe/DpVLYLTvpQSBBa9rt2M+rgVst2scFRfHEqu46ts4NeGuUMyU2ImWvwzGowom3SN3J8SNQrz9U6ZdVpBDazeCDgpmdabA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FMceTW1w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fj2heuNk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xxOknPZH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s8D0qnXS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 904165BCC3;
	Tue, 20 Jan 2026 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768918543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zia8qI46EgB8u0dXa5r/BV0ImwNXDEE7RpEPTqPIHOI=;
	b=FMceTW1w9eJVJ4eKpc45DpwcY176XD1B9+Cpgav0Mv0YQSySEqsZqxhH+V5K87mA5zvMx2
	GCfCtKFGOBlyNOuqm1HOeER/15vCHrA2CBnfMg66vLcDAYeXgr2AV1m7iZuwkVSUWG94Bu
	WWuK1u4JcXCMw/h05kK9TlSAcBe2PxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768918543;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zia8qI46EgB8u0dXa5r/BV0ImwNXDEE7RpEPTqPIHOI=;
	b=fj2heuNkGxSfOMlfW93uA6KOvN3I8ryS4pm3Ecxrjd34kYo6SHcPhWYztw1AO9xZFr/945
	8Mf1tBCcEQqODDCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xxOknPZH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=s8D0qnXS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768918542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zia8qI46EgB8u0dXa5r/BV0ImwNXDEE7RpEPTqPIHOI=;
	b=xxOknPZHpcWNfYK7B2xo6WWwyctabeeiP1NvUJOM+TnOyBvqD3a9yh//b0Xu4mzH9MgFy3
	Fcb1xz+e2fQM0XlxmwfAJGzB3VpttNUJ4FQsonFcsgN4qyWU3S67KPSJ2CaL/GZ7F2b1h4
	cgQ2Vu4QdFI0rZS8iRvXyLeT0NuUbxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768918542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zia8qI46EgB8u0dXa5r/BV0ImwNXDEE7RpEPTqPIHOI=;
	b=s8D0qnXSrT1G2Ep7JYvhaA7En9kag8WzqCALMOrWjwTK8fQZIu9RMR1A4Acmp/rRYWyhTS
	e7gMAO+NAWG7N9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50EB33EA63;
	Tue, 20 Jan 2026 14:15:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hhayEQ6Ob2l5UgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 20 Jan 2026 14:15:42 +0000
Date: Tue, 20 Jan 2026 15:15:36 +0100
From: Jean Delvare <jdelvare@suse.de>
To: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
Cc: linux-i2c@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH i2c-tools v2 0/2] Add support for message modifier flags
Message-ID: <20260120151536.7de21098@endymion>
In-Reply-To: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
References: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15306-lists,linux-i2c=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[suse.de,none];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jdelvare@suse.de,linux-i2c@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-i2c,renesas];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,bootlin.com:email,suse.de:dkim]
X-Rspamd-Queue-Id: C3EC5470B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Beno=C3=AFt, hi Wolfram,

On Tue, 23 Dec 2025 14:22:41 +0100, Beno=C3=AEt Monin wrote:
> I2C messages can be modified with a set of flags covered by the protocol
> mangling and the skip repeated start functionalities. This series add
> support for such flags to i2cdetect and i2ctransfer.
>=20
> The first patch shows the support of protocol mangling and repeated
> start skipping in the output of 'i2cdetect -F'.
>=20
> The second patch adds the parsing of optional flags to i2ctransfer
> message description. Those command-line flags then set the i2c message
> flags alongside the read/write flag.
>=20
> I wrote these changes to test the insertion of I2C_M_STOP flag in
> multi-message transactions with i2ctransfer, but the other flags can be
> useful for various test scenarios.

Out of curiosity, did you have an actual scenario where you needed to
do this? Protocol mangling is supposed to be rarely needed and avoided
as much as possible.

> The patches use defines that have been present in the kernel since
> v3.6 released in 2012. If compatibility with older kernel is required,
> we will need to wrap some of them with #ifndef ... #endif.
>=20
> Maybe a minimum kernel version can be documented in the README?

Be careful if you do. Kernel versions are a very broad indicator,
distribution kernel maintainers keep backporting features so an older
kernel can actually support something when its version suggests it
wouldn't. A kernel version should always be complemented with the actual
feature or flag so that users can look it up if needed.

>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---
> Changes in v2:
> - Document the flags in i2ctransfer.8 man page.
> - Link to v1: https://lore.kernel.org/r/20251128-msg-flags-v1-0-6353f26fa=
6bc@bootlin.com
>=20
> ---
> Beno=C3=AEt Monin (2):
>       i2cdetect: Display mangling and nostart support
>       i2ctransfer: Add optional message modifier flags
>=20
>  tools/i2cdetect.c   |  4 ++++
>  tools/i2ctransfer.8 | 26 +++++++++++++++++++++++++-
>  tools/i2ctransfer.c | 34 +++++++++++++++++++++++++---------
>  3 files changed, 54 insertions(+), 10 deletions(-)
> ---
> base-commit: ea51da725b743da00b894dfdc4ab189f5a51e90e
> change-id: 20251127-msg-flags-3d2b2da9ae28

I have read Wolfram's review of your patch set (thanks Wolfram!) and
must say I agree with everything he wrote.

--=20
Jean Delvare
SUSE L3 Support

