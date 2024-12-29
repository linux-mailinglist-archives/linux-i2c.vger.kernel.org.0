Return-Path: <linux-i2c+bounces-8806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D639FDE02
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 09:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7961882584
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 08:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDD7347CC;
	Sun, 29 Dec 2024 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfV3tnJb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11731F94D;
	Sun, 29 Dec 2024 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735460729; cv=none; b=DcvXMuifwfJ0iGqGcHiBYdv62/Cuc/MW4GxrIUqOoWVjUpHPVM3E+cR8PgQYtSRppUUvja30tEpY0vNWdTrMjzoq00wi6pWlyNuZ05fY2BSm4e6X0txfTawBHUzoEdWlwd/W3NeeSJPWCQq8rkh/WKrWYOYC9sw/NKA0/arR3dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735460729; c=relaxed/simple;
	bh=jhqMKmcbBrXpkYRBIUIKeDArx0ylUnza3bfnuY4cNZo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rC4wjGXMvi4LWpHOIat5VlRgUDAh+aSGrMmoIXObQk8uW8njUB8N6Kp88tFoNDKI2wxPjgkJwsXjj37P1T/y5KK9/VTImbYSlNwS4gCI2fQCC250b7m8VUX230FIcqUbvf6U+170NC8b5ZDEzMbQyZ3u33yAOKchQ8eyqg3DkOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfV3tnJb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso7131612f8f.1;
        Sun, 29 Dec 2024 00:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735460726; x=1736065526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0/zSKIavJ+yDSlBkUWHvpQE4DV9OrAVClKn2PvpTRY=;
        b=VfV3tnJb5b0gLBGwnZN+AAcY+rBz/qYZAzBMAOt7ZgIM1Vep56yDpen1Rt3+OijlaN
         JsH63/Mi2HAufPDGYAuTkZ6/Q6ByWlK8ARNsNNRFrbVg0CV2YvWi687lttTC1r0dKPtM
         ytYpjPEjltFK+raNwQ/J4toykme/qliCFVYGwwuxTadnkSVSI3HvU4fJ8j2j3tRPgHmS
         JbAYH5djKsXqf1AkNSIkIrX3WoudUDkikOZ54H2rg3anYB7TJPKMyQzJaOG4MhDA/0yJ
         27sPK1dCoBDce1Besnyb46GehE+3ZhTnqYlEnbVBBGX2wrq6ul63Z4P1xgivsceOgUT2
         DEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735460726; x=1736065526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0/zSKIavJ+yDSlBkUWHvpQE4DV9OrAVClKn2PvpTRY=;
        b=dZzsSPUAio07uATKcX6NbGnJ90uCOE1mYw5wiE/f6FYTSID7BCsnzNni0hgIKuzWGj
         AGiuGjIpI047+2WsS28xv2wBE8K0dfNhJb1K1LnhIdhuW/farUl5YhjllFDi9W+Ikx+U
         sl3g50USFNNN6BlKdk3BfVobaO5361LznmuRcz3vsfMaYXH8n9wBRMY6s7tEY2e+njHR
         nGGQXBfQ5ZnW8DnU5gGJlL+JBDuTJNnKGUL9/sftmp1gTb4Eabf2JM+ws6KePwNYwGG2
         sT6cGkI5/OcqlbW6qeRnuGunFw+nZWLXxOBSbv88y62tREnuTW6QCxjRdcYwYW9cZ9Pp
         6eFg==
X-Forwarded-Encrypted: i=1; AJvYcCW5tmj4JodNfEwghHlRM2cTr0LKcFTmCR9GsUKSebv7/nc6R5/UU+hd8CfC5HB227CrvfoqO12pRAk=@vger.kernel.org, AJvYcCWae66g8zbw46G480fe7gxWYNaaaz/pAl+HkAH0MgLGLBhxwX9uvdzQnClDT8I+dWcYILVbgEMDAc2/PWQy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzli9wQ8CQEcfxlx1Vj4HSXXcRN0cm9LEfOW8XhYgL0aeN8tnlh
	SwymbUHSDHnSUf5P+ACfEUe8gLIMt++D3NoFifLFhUR+9irtyI1U
X-Gm-Gg: ASbGnctpvXqAmqTYShBKudJOTq2yOlqC08TZ6sDLV5xdzE/qBrmKB91eloPNeUJvWtR
	OlU7hhgh4G3CI6UH4vxvN6vJKkgfW18W2AlCKa4Ij7H1HtT3NougTVY7YK1zUDMueMRPlnsam/H
	swr9nriCC3J1ZN9qh7iJgjZOXsvZ8Yq03TbT6fv0trpueLy3dDTQu2yAbvvh1+ebWwOhA+L8v2A
	KKcxnGul98Gd6dEoaze9H5lJRgs8crwW8wj7A9L1vm6mQMoWqHDH/9P0+yboGM39ZuW7cR7v+xT
	QlHMEGybK3OSsJXjoaIkJ6I=
X-Google-Smtp-Source: AGHT+IGqTuLbENhjoe8PXOuxdXq27b+7IEIcj0mx+DgTzlWhcj7pPh+nsi7nSb37gAM0B6z0ZrHbmg==
X-Received: by 2002:a5d:5e09:0:b0:385:ddd2:6ab7 with SMTP id ffacd0b85a97d-38a2240874bmr29239583f8f.52.1735460725599;
        Sun, 29 Dec 2024 00:25:25 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm26463152f8f.30.2024.12.29.00.25.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Dec 2024 00:25:25 -0800 (PST)
Date: Sun, 29 Dec 2024 08:25:24 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: andi.shyti@kernel.org, masahiroy@kernel.org,
 u.kleine-koenig@baylibre.com, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
Message-ID: <20241229082524.41494308@dsl-u17-10>
In-Reply-To: <Z3Bv6YhZMAzSLcyg@smile.fi.intel.com>
References: <20241228184328.5ced280b@dsl-u17-10>
	<Z3Bv6YhZMAzSLcyg@smile.fi.intel.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 Dec 2024 23:38:49 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Sat, Dec 28, 2024 at 06:43:28PM +0000, David Laight wrote:
> > Commit ceb8bf2ceaa77 ("module: Convert default symbol namespace to string
> > literal") changed DEFAULT_SYMBOL_NAMESPACE to be a string literal.
> > However the conditional definition of _EXPORT_SYMBOL() was left in.
> > 
> > Instead just default DEFAULT_SYMBOL_NAMESPACE to "" and remove the
> > extra _EXPORT_SYMBOL() wrapper.
> > 
> > This lets DEFAULT_SYMBOL_NAMESPACE be defined after export.h is included.  
> 
> > Fixes fd57a3325a779 ("i2c: designware: Move exports to I2C_DW namespaces")  
> 
> Incorrect format, and this should be a tag.

Except that it doesn't want to be picked up by the back-port bots.
At least not in this form - since the changes to export.h that remove
the __stringify() don't really want back-porting.

> 
> ...
> 
> This patch in a different form had been already submitted by Uwe.

Did that move the DEFAULT_SYMBOL_NAMESPACE define to the top of the file?
That can be back-ported provided the " are removed.

The simplification to export.h (which is what I was trying to do)
can then be done after the other patches.

> So, guys, fix
> the documentation or clarify it and when you agree on the approach, choose the
> patch to review. No Ack till that. Andi, FYI.
> 

I had another thought overnight - which is more changes.
Instead of using DEFAULT_SYMBOL_NAMESPACE in EXPORT_SYMBOL() use it as
a default for EXPORT_SYMBOL_NS().
So you have something like:
#define EXPORT_SYMBOL_NS(sym, ...) _EXPORT_SYMBOL_NS(sym, __VA_ARGS__, DEFAULT_SYMBOL_NAMESPACE)
#define _EXPORT_SYMBOL_NS(sym, ns, ...) __EXPORT_SYMBOL(sym, "", ns)

That requires that all the EXPORT_SYMBOL(sym) in files that define DEFAULT_SYMBOL_NAMESPACE
be changed to EXPORT_SYMBOL_NS(sym).
But it doesn't require a default definition of DEFAULT_SYMBOL_NAMESPACE and lets
it be defined in a more obvious part of the source file.

	David


