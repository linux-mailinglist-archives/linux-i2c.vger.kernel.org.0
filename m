Return-Path: <linux-i2c+bounces-10060-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7549A7496F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 12:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DEAF172C69
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 11:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DDA1DF745;
	Fri, 28 Mar 2025 11:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JxCxkECN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239C519C575
	for <linux-i2c@vger.kernel.org>; Fri, 28 Mar 2025 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162353; cv=none; b=FGMLhq/hti4dIFc0bwA27ZJuZ+YPUpKD79QcQR4mgiS0s5AGT8/H5u/ozTHok4+6w7oXskaGEzEbF+7OGCZWo9z8PrHHpnoCVq3btS81YjKwuYvamd1s4NpXZoxSYoIjJoYvr+3wvetYLzX1pMSaA+LDU8CEZ9+WjkxKeBaViEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162353; c=relaxed/simple;
	bh=KBXPAXFI5S8nRjCHw2bhn2kHL2+/Kga021Or3fQVuZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcUTuFY3ylEg+3lMs3PawQnK1dQy3WoKu6y/YF0ugOXe7ImRKgSULu+xPdUohzJmFm/ZxLv01Qt0Ad2/yOfdOS9ToMoJrDsqpCSlLd1USchcQPmEYwl50+aZAi8Cw7X53CB485DA9aNgThC15qMw4sknnWwyB/DpfiZWRqMFhFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JxCxkECN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8q6E
	WuBJEz+bcJSBMtZVf0usQkz/Arzy4058Qo25yGo=; b=JxCxkECNFJOyf45TppLQ
	aflC9rvqEZm4Vsl96haNci9z/dQoYUhD0e9A9f9BsnPUFNLWeP0LYOWl5+/Ohz3b
	SHPMfgrdQ9E0WckSXc2RAqU7ijFBWU3Upat6sfmtxt5OTAqLtXTwdv5PC5wlqBft
	bT9ueDcgpPh7Ceo4+t6TxjBm/ykCvcZvz7lpQTgH01qF8MHvL40tMmgLhBicSHpi
	vNHB7m+iqIKJS8yAeczaAV9NNG7Ajv5arZtgdCxSxlz9ytUh1tbyAiG/z+5wZWkY
	UB66iFucg3hwXryrXSwTRbXhItc5NkmL3+LrEgIFlKl8OfPz2jRRZUup2CDQyNo3
	4g==
Received: (qmail 229572 invoked from network); 28 Mar 2025 12:45:50 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Mar 2025 12:45:50 +0100
X-UD-Smtp-Session: l3s3148p1@bFGdnGUxFx9tKvIJ
Date: Fri, 28 Mar 2025 12:45:48 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-i2c@vger.kernel.org,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	David Howells <dhowells@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] i2c: tracing: Remove redundant length field in events
Message-ID: <Z-aL7IusGG5jHoN0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-i2c@vger.kernel.org,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	David Howells <dhowells@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <20250327114203.5b409786@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="We6JCgYitSgWK9Pt"
Content-Disposition: inline
In-Reply-To: <20250327114203.5b409786@gandalf.local.home>


--We6JCgYitSgWK9Pt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>   NOTE: This removes the "len" field from these events. If that "len" field
>   is used by filters or user space tooling, then this will break that. If
>   that is the case, then this patch should NOT be accepted.

I have no idea if someone uses it, or even how to find out if someone
uses it. To avoid regressions, I prefer to leave it as is. But thanks
for letting me know!


--We6JCgYitSgWK9Pt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfmi+wACgkQFA3kzBSg
KbbYkhAAsMTC0gFCM0W+W53IX6xhWHseBr76R0j/vQjGft1fzLk9lFsXgljQmyN8
1iXW+9tooSeIyVSUO7ObNvqJ2nAGOjeED2SaILyoNLs3Sk5F0iyC8s4Fl81jkTQX
HhAtZpSepeExUVDY81+Q9Hw8Mjk2GPXtMGx3Uyhbw6AXKuCZ3TvtnTknRNDvCVd6
Jl1BjL109ALbXxHdUbPdXQlu+wsv2iC5nLlOfhC/LphfJy+gOu65hW4IrN3q7JQO
TRre/HuvCtai1cX1Sl/vlak8R59uCT4EQAPpN2wl6F+AI2n92PWrvH+TsuEzb1ox
8ph+jYPthxZVDaDY53bbT16VjHxYjvqMqdbBDNR92dc4v6fGXThyG6XoaLmYaShx
ydiIlGIXSW2Dt/RqRGZckaqmq9as8nxsuzj8OmDzVW87Pj1Um6TRoWxaaEVV2oA3
aMjYQgYMV/eXN8S86OrNtaXvLpnVSf/XSUSJEYUeKZEwfV2X42ZOvnv0r2d9H8jF
ak3rSg+I7j9JIxzpP9FlS4M+Xsddfj7POTGgY1sfonsnkgqfp5dFzEfNr3OconkJ
g+XflTqCpubLiGtagyQUWnfozWhqYdeG77hauayN1Y/Es6MZ5ye4scADhNIotgFO
0g+wZHTjEdlnpwmJIyYbUtUj2kLVoJEg8m4HZquno6DgUjXzFoc=
=F7yQ
-----END PGP SIGNATURE-----

--We6JCgYitSgWK9Pt--

