Return-Path: <linux-i2c+bounces-15308-lists+linux-i2c=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-i2c@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAURFaW4b2kOMQAAu9opvQ
	(envelope-from <linux-i2c+bounces-15308-lists+linux-i2c=lfdr.de@vger.kernel.org>)
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 18:17:25 +0100
X-Original-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ADD48681
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 18:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 34A0F7C803C
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 15:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97DF43CEC3;
	Tue, 20 Jan 2026 15:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xhWvpWzd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YefCRv2v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xhWvpWzd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YefCRv2v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B229247AF62
	for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921624; cv=none; b=l6pFGjjBaTHRkBKM9A06M8l5SkdqUtRxiHFP0d9+W24t+FAqcZUDLF47X/usmdy9zsOCkQUeTKS8Fc+1GDrg6138Zbl+B+WOE2NLXpiqZ3oYKbMp7I7zvy0XKWTWb8X6rMb4GMQHbkYmgvfD6ryjtI7yRhMQCiMazYd9fYp03/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921624; c=relaxed/simple;
	bh=plK+gAN0m0VKi3uopbkrojYHlPXr9tBbb4XLAeO4Kv4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RNi78uOoywVXT1eaDayKvubLwF3cti8odDpjfwqhELLZpvUA7e8Ya017ODr3jZbq3pa65wRTttPZq7FyseYmqyEzKjPJieJtuJRu3xUSScRFS5p9l2wkBHpe+1w/DnbtSnczUCdNbH7yde1syHSUY/wG5gtfkhlem58aUc9ibTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xhWvpWzd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YefCRv2v; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xhWvpWzd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YefCRv2v; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A87E033827;
	Tue, 20 Jan 2026 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768921620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1K5h56s/CfzlRREuzhnG8PfEqtupKSszeyCzoWLfIp8=;
	b=xhWvpWzdlNJLVVkPdp9X5v6M4s7Px+tazgtEirVd5WTotWDbCH9HtaHoashiKNPV2C+heo
	Gajr3ZY6AsCVpFG9QUBCnOlIc8hjQBUJ1QNxOw38bdRWEjY1MdblZ7UrfVwWECG2nXfkEe
	e/5f7GVLi/CiYEZ6mCN5TxXUCdPn1CQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768921620;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1K5h56s/CfzlRREuzhnG8PfEqtupKSszeyCzoWLfIp8=;
	b=YefCRv2v+c1pNGQbopbqVhpC719/lOOB6lxeHSVzMJhAnQmgI5Sz3gvNhWtBmcmAK6TzEn
	y1mCzBV74v8bhHCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768921620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1K5h56s/CfzlRREuzhnG8PfEqtupKSszeyCzoWLfIp8=;
	b=xhWvpWzdlNJLVVkPdp9X5v6M4s7Px+tazgtEirVd5WTotWDbCH9HtaHoashiKNPV2C+heo
	Gajr3ZY6AsCVpFG9QUBCnOlIc8hjQBUJ1QNxOw38bdRWEjY1MdblZ7UrfVwWECG2nXfkEe
	e/5f7GVLi/CiYEZ6mCN5TxXUCdPn1CQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768921620;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1K5h56s/CfzlRREuzhnG8PfEqtupKSszeyCzoWLfIp8=;
	b=YefCRv2v+c1pNGQbopbqVhpC719/lOOB6lxeHSVzMJhAnQmgI5Sz3gvNhWtBmcmAK6TzEn
	y1mCzBV74v8bhHCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71B873EA63;
	Tue, 20 Jan 2026 15:07:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Pty8GRSab2n5BwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 20 Jan 2026 15:07:00 +0000
Date: Tue, 20 Jan 2026 16:06:57 +0100
From: Jean Delvare <jdelvare@suse.de>
To: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i2c@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH i2c-tools v2 2/2] i2ctransfer: Add optional message
 modifier flags
Message-ID: <20260120160657.63de969a@endymion>
In-Reply-To: <2768446.lGaqSPkdTl@benoit.monin>
References: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
	<20251223-msg-flags-v2-2-8d934a4366e2@bootlin.com>
	<aWaCAV4preoIPcih@ninjato>
	<2768446.lGaqSPkdTl@benoit.monin>
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
X-Spam-Score: -3.80
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
	TAGGED_FROM(0.00)[bounces-15308-lists,linux-i2c=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,suse.de:dkim]
X-Rspamd-Queue-Id: 12ADD48681
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Beno=C3=AEt,

On Fri, 16 Jan 2026 14:01:57 +0100, Beno=C3=AEt Monin wrote:
> On Tuesday, 13 January 2026 at 18:33:53 CET, Wolfram Sang wrote:
> [...]
> > >  		"  DATA are LENGTH bytes for a write message. They can be shortene=
d by a suffix:\n"
> > >  		"    =3D (keep value constant until LENGTH)\n"
> > >  		"    + (increase value by 1 until LENGTH)\n"
> > > @@ -202,12 +209,21 @@ int main(int argc, char *argv[])
> > >  		case PARSE_GET_DESC:
> > >  			flags =3D 0;
> > > =20
> > > -			switch (*arg_ptr++) {
> > > -			case 'r': flags |=3D I2C_M_RD; break;
> > > -			case 'w': break;
> > > -			default:
> > > -				fprintf(stderr, "Error: Invalid direction\n");
> > > -				goto err_out_with_arg;
> > > +			for (int done =3D 0; !done; ) {
> > > +				switch (*arg_ptr++) {
> > > +				/* optional flags */
> > > +				case 'i': flags |=3D I2C_M_IGNORE_NAK; break;
> > > +				case 'n': flags |=3D I2C_M_NO_RD_ACK; break;
> > > +				case 'p': flags |=3D I2C_M_STOP; break;
> > > +				case 's': flags |=3D I2C_M_NOSTART; break;
> > > +				case 't': flags |=3D I2C_M_REV_DIR_ADDR; break; =20
> >=20
> > Brainstorming here: maybe a macro could help:
> >=20
> > 	case 'i': add_flag_if_supported(flags, I2C_M_IGNORE_NAK);
> >=20
> > ?
> >  =20
> I am having a hard time coming up with something here. There is the
> __is_defined() macro in the kernel source[1], it only returns 0 or 1, not
> the value of the define.
>=20
> Maybe defining as zero the flags that are undefined would be acceptable?
> E.g.
>=20
> #ifndef I2C_M_IGNORE_NAK
> #define I2C_M_IGNORE_NAK 0
> #endif

I don't think that's a good idea, because then you would simply ignore
the flag that was passed by the user if it's not supported? If so, this
is bad user experience. If the user asks for something unsupported, the
tool should report the lack of support, and fail.

> Or you have another idea?

I honestly think that a bunch of ifdefs in this part of the code would
work just fine and be acceptable. We don't plan to add more flags in
the future, and I think that's better than preprocessor magic which may
work or break depending on the compiler.

Something like:

				/* optional flags */
				case 'i':
#ifdef I2C_M_IGNORE_NAK
					flags |=3D I2C_M_IGNORE_NAK;
#else
					fprintf(stderr, "Error: Unsupported flag '%c'\n", 'i');
#endif
					break;
				case 'n':
#ifdef I2C_M_NO_RD_ACK
					flags |=3D I2C_M_NO_RD_ACK;
#else
					fprintf(stderr, "Error: Unsupported flag '%c'\n", 'n');
#endif
					break;
				case 'p':
#ifdef I2C_M_STOP
					flags |=3D I2C_M_STOP;
#else
					fprintf(stderr, "Error: Unsupported flag '%c'\n", 'p');
#endif
					break;
				case 's':
#ifdef I2C_M_NOSTART
					flags |=3D I2C_M_NOSTART;
#else
					fprintf(stderr, "Error: Unsupported flag '%c'\n", 's');
#endif
					break;
				case 't':
#ifdef I2C_M_REV_DIR_ADDR
					flags |=3D I2C_M_REV_DIR_ADDR;
#else
					fprintf(stderr, "Error: Unsupported flag '%c'\n", 't');
#endif
					break;


That being said, I think you also need a second level of support check.
The above only checks if the flags are defined in the kernel headers,
which should generally correspond to the flags being supported by the
kernel. But just because the flags are known to the kernel, doesn't
mean that the i2c adapter you are operating on, supports protocol
mangling.

So I believe that you also need to extend check_funcs() to return the
supported functionality, and then check for I2C_FUNC_PROTOCOL_MANGLING
and I2C_FUNC_NOSTART after parsing the optional flags. If mangling
flags are passed by the user but the adapter's driver does not support
protocol mangling, the tool should report the incompatibility and stop.

--=20
Jean Delvare
SUSE L3 Support

