Return-Path: <linux-i2c+bounces-13946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCC9C298AA
	for <lists+linux-i2c@lfdr.de>; Sun, 02 Nov 2025 23:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B94188CD41
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Nov 2025 22:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A811DF75B;
	Sun,  2 Nov 2025 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TsIMeQ/F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002301632C8
	for <linux-i2c@vger.kernel.org>; Sun,  2 Nov 2025 22:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762123806; cv=none; b=quUwJZboplyJvM/8uTnRlzaU8zZ1xTCKlyHKKSSXSvVrCn51ZjGu6aR3q8+D1sjdy9PeSdJhru+krOstqyt+pCTf+KrnN9fyW2ERUixt75EBkYHfeGO6jw1jisWzrhRkQ8kH6oZSqEQggzkJMNLLFXOZ4HJUTfhlRQTsYfsL+BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762123806; c=relaxed/simple;
	bh=fjPVo8a70nrUP3Q+tkN1iTH3Q52x5tObtzJ+y4wppGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhFvtJLMjFuoREwCPFNP9pZ8/T8tdCo9t10GEInf/Iikh25NMIff5lJ62dDGbhGKogSEgMEfslqcZb0DsGZMXo6+bzpL7bsPn3Cy3c8AxkSPeuCkGjKwAqFlhNATJucXcejuzEsWqoGZ7ZYjLfRoirMoBTzp8WeDgmrDj/ru5mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TsIMeQ/F; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fjPV
	o8a70nrUP3Q+tkN1iTH3Q52x5tObtzJ+y4wppGs=; b=TsIMeQ/Fb2khTuPOGlyS
	o10tUQHWEMXjuS2wnu5GTWZZqFrgLj+bx2t7Rj7/7h8QLk1Liw7xB3nITHEc3gk9
	PY2JyfZwR2drwiIHnrLneQLQlvZoXwEzonrJH+e2nWqcHrByXSEsO2DL4IIvHI0B
	tyd7lMbivrztnfsONFAZdGlcrAbTw6VSQVzl2PZtaE+FOEoPYZX2OWSLEQZ+wat4
	7C+vMCUpY7Zo9HB+AqFpperLHPSqnoNtnsIv5ZY7tcmVSGa15SGuSaYFif6KdsId
	QX4BOsO6uBz7woYEb6207vzPF66G8gjSk02g9y8AzOdUnpAK7Jb4TOePYsgDvpcf
	Xw==
Received: (qmail 1949471 invoked from network); 2 Nov 2025 23:49:55 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Nov 2025 23:49:55 +0100
X-UD-Smtp-Session: l3s3148p1@YhjWaqRCltAujnv0
Date: Sun, 2 Nov 2025 23:49:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Wojciech Siudy <wojciech.siudy@nokia.com>,
	linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
	daniel@makrotopia.org
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with
 i2c-mux on i2c2)
Message-ID: <aQfgEuelvU-8_2rh@shikoro>
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de>
 <aQdSVcazPQl-shR6@shikoro>
 <1144f62ad9886fed60620bce0bbed7ee@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1144f62ad9886fed60620bce0bbed7ee@fw-web.de>


> from reset maintainers as i have my own defconfig. Tested and my mux works
> now again.

Glad it works again!

> Maybe this option should be enabled by default or when the i2c-mux is
> selected?

That's what we were discussing. At least a warning will now get printed
to the logs when booting suggesting the above solution.

> When moving from specific to a generic aproach (which makes sense) imho it
> should be
> mentioned in commit description which option needed instead :)

We didn't realize this back then. Only when the first bug report came
in :/

> btw. the Authors Email seems not working, got

Yes, he quit Nokia meanwhile.


