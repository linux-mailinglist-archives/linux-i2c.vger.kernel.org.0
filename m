Return-Path: <linux-i2c+bounces-6943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663AF9839D2
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 01:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A121FB213E2
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 22:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20698563E;
	Mon, 23 Sep 2024 22:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gy+uzQTG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8EB7DA7D
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 22:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727130256; cv=none; b=rIOsEOtRK88JKhML7r+LyHmo16ibGKZCsiVOLzCKv7ehVxV4uUAZrKWRCuNws+JjYNfCtg9RG5DUwQSZ7wfoeaEhwd8pVOl8F864iGr5eufaJJteTgKmdiRkDQ6CMJYRPPcjJJVi9pZg5hspIWfW48LMFDZfi5QamJxrpAj5j64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727130256; c=relaxed/simple;
	bh=nWv5jkxsYGb6BH8f1B+XxElW8yEexPiQUWRgqJ2atn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=TqtEHvaVH/D4xsYueGgLedYGwEdVjxrtHKfEWS+fp8mASRZrB90gBam40PvtG/82QBqyM1MlcXtU7+9tzp0S/c3k3QEMuP3O7Dx2G+I81Ij4h697Ks8qDCsVh0zbDxg1V0vz4cha6Nm0oc69FL0KLVserzSeczjWMNTSGmhxiFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gy+uzQTG; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so7383455a12.0
        for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 15:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727130253; x=1727735053; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEtwfj2Zun/Vxwsgf+psjJ2+i16O146ctHz5aKhwNu4=;
        b=gy+uzQTGEGhZaZ/QngiTBovzaASJGewMusHXAhQToqV8Qm103hzSyUQrxoKzn1KU3X
         LZlbL/vRp9b1ixsdUsOQQdlKkHtM/DEwzz1CRBe9AC9jEzgrnUbr93atm7JGF1abqbY6
         6ePhTjVcAKPoCsOzupmEnr5wbbZ/OUUfQLwbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727130253; x=1727735053;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEtwfj2Zun/Vxwsgf+psjJ2+i16O146ctHz5aKhwNu4=;
        b=LHHVC4DzqvAlZKsGYgDTS3GXriAQxrBmS6POhT9PJ98RHyGNJcJSK3HnfvNtyfcCMz
         oqZ0EnhH4nD/zQn8UiUPjKY1A0Uq9XbJ1SClN2o+q7x75kInOOFb6b0BLxDouqvSTOL8
         kwjgwIv/uS214DmwKjwyebLgw/GVXvJGUV27aYWZwti0W/Vo6OCRcWGodiCz1+1QwVnU
         FICvU4CqtQkKg1V5I/SeGCcSWdtm5zcNLqJdvxJ/uu5+6dseMedcWnr6f1jtqcUzfzlZ
         fBqWLhyYt2m8DCP9aM24B41lr49k+9F2J7cDsj7ySQ3YDGD7VV882zetFd2wlyk9mnjQ
         h68w==
X-Forwarded-Encrypted: i=1; AJvYcCWx+Cd627551M/2B+YR4ZjDU1SEqsZrR3LgXU+3Unxwz4pngMSio247YzyRPClltZRaG6FpT7cf+Lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YywcR7u/FGq9ZoqK5a7+gYYxvRNa1C/5CMg3cxIB6wqCHIy6kHw
	gLk5eWW3E0gDxsK7wutOG6H8+trvmXn3H6K3t88M62ShYSOnFVZNihkkd2cH/J8p9+JQdYx/vnP
	/Uvc5dw==
X-Google-Smtp-Source: AGHT+IEzkdmCcpJHhin16CmUbxL66F+aP8Lsq5WTAbxpKHLK+us0nBXOnbjw8cBDCOjfQ4aDraUrdw==
X-Received: by 2002:a05:6402:42c5:b0:5c5:c444:4e3a with SMTP id 4fb4d7f45d1cf-5c5cdf0d4f3mr1088804a12.0.1727130252962;
        Mon, 23 Sep 2024 15:24:12 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf48c243sm101336a12.3.2024.09.23.15.24.11
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 15:24:12 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso129902966b.0
        for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 15:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzpAYNCBwbxNue2FOHfEQBZCGIq3SjGIao47YloUtCiwxlpHSjbGjcl/FQlCfCJ5AMSOzB65hMLvc=@vger.kernel.org
X-Received: by 2002:a17:907:1b27:b0:a8d:5f69:c839 with SMTP id
 a640c23a62f3a-a92c4857d58mr115908566b.15.1727130251376; Mon, 23 Sep 2024
 15:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZvEaHWH0IndyeMvs@shikoro>
In-Reply-To: <ZvEaHWH0IndyeMvs@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Sep 2024 15:23:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wghWmpCT9Drh6wLXW04THfr=ZrHonRLDUdy=ou2Cmv9gA@mail.gmail.com>
Message-ID: <CAHk-=wghWmpCT9Drh6wLXW04THfr=ZrHonRLDUdy=ou2Cmv9gA@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.12-rc1
To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Sept 2024 at 00:35, Wolfram Sang <wsa@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc1

What is it with people this merge window?

> The Intel LJCA driver loses "target_addr" parameter in
> ljca_i2c_stop() because it was unused.
[..]
> Still in the iMX/MXC driver a comma ',' has been replaced by a
> semicolon ';', while in different drivers the ',' has been
> removed from the '{ }' delimiters.

Stop describing pointless noise. The pull request - and the resulting
merge message - is about USEFUL INFORMATION.

The above is just pure noise. You're literally hiding all the useful
stuff by overwhelming people with totally uninteresting stuff that
matters not at all.

I edited things down a bit, but I shouldn't need to wade through this
kind of pointless verbiage.

I want a useful *summary* of what has happened, and what I'm getting.
Not some line-by-line "I changed a character".

Is this some broken attempt at AI summary? Because it sure isn't real
intelligence.

               Linus

