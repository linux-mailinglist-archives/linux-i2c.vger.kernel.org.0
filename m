Return-Path: <linux-i2c+bounces-11642-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF8AEB461
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF1F13B5CA4
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82972C08CD;
	Fri, 27 Jun 2025 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XFQxEul5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB141298987
	for <linux-i2c@vger.kernel.org>; Fri, 27 Jun 2025 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019520; cv=none; b=ZINem+njcM95jY0JoqqmC4OhZNR8og5tFGe+HlOUuFyHuWBaVQfN++v7hl/jZMtu9iHKNz8tiZ+NSfwkj79YXhWVMMVMB3HsUrtXNi9BduLA7BTTH0Q+RfIEg+9lCRy4lIP6GPktQL2wzgn+1Tdar41xjw2gQUvTuVYnSEtzuqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019520; c=relaxed/simple;
	bh=0GY6aONwAr6c7sd/X7oSatTiD5oHv8fL1LQKf6N0TNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1SaoeZXRw48sOOAolMqT9YVQVec1QJD4ZTubsSUE931/J4s092Z7GWhPvdkhe8sjgan/Y3coP1AB3jw4S+gdRr2C0AlhLL1rt1wsPDf1ZFsKmvkBuer+jV8/rqQ8GGeGDIjhO6TOlGl1OfMNBPwOhWb/l7rWAlb1lT0khVj6Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XFQxEul5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=HZDMQLpmMIOALwQfw1z/xNIzHVRMECB6xx1dxrf84
	HE=; b=XFQxEul5Tz7MEuaDL5srRmyrW+L3IM1IEG7+at3phmsOS/+ILLi6qVFLW
	rSt0atktbDU+DwuZHLQoqK7Xua3ee+JaDEjITSAT/a+Mzy5HC5DK/KWLqfhpTchD
	bniRG3L0QqRO9cx7R/eNbbNPdBnTD6h/GIyl9OLXXSb1P9YRXGrNgZ6ddlzeQQqf
	P+s1WqgS795R2Ne31JiU5KLGD+SDsLstOTioOHjQMdkYPIXePBlXjf01G0nMEQNR
	9MYPOVinBE+B9bsPwLRtbANZ0g7BoHbHBMKvRHfVGBaKpZVMMIhaDP8eR9E0F/O1
	zgmYfZqwinrhaXWJuEWoXli1feVQw==
Received: (qmail 1421777 invoked from network); 27 Jun 2025 12:18:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2025 12:18:34 +0200
X-UD-Smtp-Session: l3s3148p1@LoIhAIs4FuggAwDPXzuUAOCQSK0rM+sw
Date: Fri, 27 Jun 2025 12:18:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Jim Cromie <jim.cromie@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: scx200_acb: add depends on HAS_IOPORT
Message-ID: <aF5v-dEVBsQGnmit@shikoro>
References: <20250615183659.902110-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250615183659.902110-1-rdunlap@infradead.org>

On Sun, Jun 15, 2025 at 11:36:58AM -0700, Randy Dunlap wrote:
> The scx200_acb driver uses inb()/outb() without depending on HAS_IOPORT,
> which leads to build errors since kernel v6.13-rc1:
> commit 6f043e757445 ("asm-generic/io.h: Remove I/O port accessors
> for HAS_IOPORT=n")
> 
> Add the HAS_IOPORT dependency to prevent the build errors.
> 
> (Found in ARCH=um allmodconfig builds)
> 
> drivers/i2c/busses/scx200_acb.c: In function ‘scx200_acb_reset’:
> include/asm-generic/io.h:596:15: error: call to ‘_outb’ declared with attribute error: outb() requires CONFIG_HAS_IOPORT
> 
> drivers/i2c/busses/scx200_acb.c:224:26: note: in expansion of macro ‘inb’
> include/asm-generic/io.h:542:14: error: call to ‘_inb’ declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
>   224 |                 status = inb(ACBST);
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: Jim Cromie <jim.cromie@gmail.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-i2c@vger.kernel.org

Applied to for-current, thanks!


