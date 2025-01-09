Return-Path: <linux-i2c+bounces-8998-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE363A0734B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 11:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C6513A1EE0
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D948F215F5B;
	Thu,  9 Jan 2025 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoxR9UQS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100732153FA;
	Thu,  9 Jan 2025 10:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418792; cv=none; b=iFTNKsh+xlcoHnylAa2yM+Hs/PJW+nnT9epZnptofrmdPgKUe2uqmzXcdWFF/ehqE1zwRdeyQGaXQBQ3U7wLs8nfuD1KqJ5veGhCoUpEQlmK08/xizq/me4enByXGbMsuubtN9OmuSKLF9m50p38HJmv8maWVPDf81vJYh+opPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418792; c=relaxed/simple;
	bh=a7qcg93OhQ+zNJsluI0msRMawdFayKjdUoZOyaVKtJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/0F2kySAFyc6HTxeuIu44QngWTFIhLuKczsJBgHaEu5RimwmrKmBravH94us8el13q9nSa0j2I1rUkMCixQNqVqbki5C1wZvdDwV9Kfi6M+ajiLdq/5reIEAqJfy3CXPZUR8oRUJpgppLSoHgydpEOqgTn78TLaRO7zNJpIDP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoxR9UQS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so453143f8f.0;
        Thu, 09 Jan 2025 02:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736418789; x=1737023589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a7qcg93OhQ+zNJsluI0msRMawdFayKjdUoZOyaVKtJ0=;
        b=LoxR9UQS6L23fPWogGIE17/ans1F1obs9uxkzPPCt5GedWgUdeMeJh6Zl+8Tm7zdfC
         7jLZ5evxWSnm78W24QvgkTuMbQ1Gbq5ixEhMISEgbPWdDh204EiE6pep/8M6EGHhlUlw
         DxqwUrxFBg1Rr+tcZSyjZvsXoxfYrk2zLT1TUuHTLSq6dqdFtMtpdBF7GcHcQWgTJQJh
         DoCdtowmryfuqdKU2aecuszL0vpIRp/GMnoJPggOBUowvrqfTRMaLrulaiwzFibGTC5B
         2gsNssiDr/M0C90BizzuCsH7Nyzn3ylmXm7ttHzwEUtyjhJ4ErK/rLk8GO9GLukcbhmp
         xVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736418789; x=1737023589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7qcg93OhQ+zNJsluI0msRMawdFayKjdUoZOyaVKtJ0=;
        b=bJbHvPmgKmNoGnDaedsx1OeFaZv2i3jjGQWlyhnCQwi8mZDut152eR4/94aOzM/eeV
         78SV8m73z6G7hhBf5+SAgJTbMGzTEUahBTrfY7P2hB1E4p+Ks+DreML4AxXTwgiSsrex
         E6I0ADlpfkW213YY17xMPP9IFjulvccDFOoX30ulqbsQ/nUutlUsAX5BsSINFVqNxwo4
         6h0IdCMHOKjh8emmt3iC6IDgo1+BBHsJFc++xoKgLGOasasaOqwElf9Dv1r1WbX73Znp
         mSQ8L1UhCyC48E4wtxNNMsoJbciobxgmV+juX8tSbzW1XGvLOLOlEHChOAPmIl7ca+Yu
         GwZA==
X-Forwarded-Encrypted: i=1; AJvYcCUd1a/KjC3L1MqjkKOSk9sRWf0lORmCtUiGLOoDkRrIhVpRJfUenubwBycaki/LoR5MhWeH1CrWpTMqsSSg@vger.kernel.org, AJvYcCVvGBU2MdL1LuKvCliuwaQLSF/pfF90TN2pK6LBkLyf4XWyuSqRO2QQIkQrIepBXPdt085KXSijYMki9rs=@vger.kernel.org, AJvYcCWv/ctca5pnzfyP/b12489dQoYoTbhPw+Q8m6U9jUQbsw3fM6yLnNVLLpM7+KP5fnyHlMWaQfiyve62@vger.kernel.org, AJvYcCX9jg4DeHfUGArpmMxcbOZu0ETzsUA4YRYa8X2rKO0i7Ns9RuVxzVG/pvU/CxvEFtsuwb1Q66L13pzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyHmlPOt7lNo7eH/LXm3qU8YQUiGv8i/uHNeQTFSBw9ijueVODD
	bItipK0jvMRxQkTmzRJBdvZ3Uc2eW30gI+FJwU6h+MS2XRrJ1iDd
X-Gm-Gg: ASbGncsCUsbsT3/6qchiK68YUjNaBeGgCoMZ77FlvC6LYApYWeebA6jx3Y/RIw1N7EL
	h8Hl7keDd14KY9ZQ7n/qRLeLVL87ZunKQJVOuFwnnyB/1bhsn7yyS4qOg1QrbucnwEqReUAPmYr
	m1C3PwsG67ELdnIe/QaPpS/KoikBKYjl3vwvnNUjj7RduKp5pibLx5C22UdG/a95E4LzUPcP3V2
	Q0G7GSwinMOCWVVLgX9142TbpBjP2OV1oWhC5dEAoZVIy84pm43H9oyAwGVuVBUEGnIOl7DA0A+
	Ir/lpSHYS0chkLQAjCTXEEilObyc5nsVfnZcT0QkAwk=
X-Google-Smtp-Source: AGHT+IGwn2m6Tf5WdRT0HDRe5utpGm1g3cyrfBCIktqPRstoWSLFzpg4IqCR0LgrXXyTk414FTZR7A==
X-Received: by 2002:a5d:584b:0:b0:388:cacf:24b0 with SMTP id ffacd0b85a97d-38a8b0b8003mr2196012f8f.2.1736418789063;
        Thu, 09 Jan 2025 02:33:09 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddcda3sm50528895e9.22.2025.01.09.02.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:33:07 -0800 (PST)
Date: Thu, 9 Jan 2025 11:33:06 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: akhilrajeev@nvidia.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jonathanh@nvidia.com, ldewangan@nvidia.com, 
	digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] i2c: tegra: Do not configure DMA if not supported
Message-ID: <ty3ctkatywnq6ukrcgkqrzstch2k5qymjfgntnyi23riapytkg@7vzjyszmq3ml>
References: <20250108110620.86900-1-kkartik@nvidia.com>
 <20250108110620.86900-6-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pe34vgl73jfyvhjp"
Content-Disposition: inline
In-Reply-To: <20250108110620.86900-6-kkartik@nvidia.com>


--pe34vgl73jfyvhjp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 5/5] i2c: tegra: Do not configure DMA if not supported
MIME-Version: 1.0

On Wed, Jan 08, 2025 at 04:36:20PM +0530, Kartik Rajput wrote:
> On Tegra264, not all I2C controllers support DMA, this causes failures
> when function tegra_i2c_init_dma() is called.

What exactly does it mean when you say "not all I2C controllers support
DMA"? Do they not have the necessary interface to the GPC DMA or are
there not sufficient DMA channels to support all I2C controllers?

Thierry

--pe34vgl73jfyvhjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmd/peEACgkQ3SOs138+
s6G68Q//YnJCeJL2lR6v4vEQGSeJy5kUmbhjGd4nyLqYgeQlxzbC0IEiAC05bv9s
IPC3t/1WXSiYEqabJAUJ6vjPydb5/u8ZZcoGkAaywdrgTKbZUnZNGojfcKUfeewF
32ee7sQi8nlS6JM/O9C6+nU078uz8pyNRhLNnHhesqW0Te/jCd51ErxX+dMIgD0D
GkBcJQsXu/agMSo7/vre/t5KLwcPGs2RpP7s8h+4+nFVmwwcTCDUwi8ysMF8A54r
4Z6ozhYIaDIgeR977JeE+mcC7i+PpX/yMjyZnWeY/8m1FPtjNxRGS5ZUKGralU+g
jfEimaKp3cvbiKV5B822SsL22pt0IaQz1GUM4hEte/cawKRB62XDWKS9pmx1vrr2
MbszDV7DOq8ucOTtCKfab0b4GIFhx29UvRXs+bJByY4B7ppac4RZNLbtrxlLxyNZ
W6A9HRDgGgGqLEoGVJci65xDuJdmbAfBIskL1g5ChpScxUSqbEakPPCdqI3y7woA
B/jebMRWOL1DpZsu5WmEFJ95XlLXZlD7PJ1N6eHoyBnjekOtxAqXVVW6oaWbBGH3
+WEibCqMzHdH1q6fhDeoL+SIjsQv6icXsA8HXRlbQ/KAFigvq83/V5o//KhOBkVV
1QAsJoV3bEcIhlCUkS2WcJRRuKw/uRS1krZl3rwPvXFlL4Y6Yd8=
=g66i
-----END PGP SIGNATURE-----

--pe34vgl73jfyvhjp--

