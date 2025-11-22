Return-Path: <linux-i2c+bounces-14233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE398C7D1E5
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 14:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F3704E3518
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 13:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A518A22578D;
	Sat, 22 Nov 2025 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBgYlREB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB86E1CAA92
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763819521; cv=none; b=FZP6nK9IxEp0wSaZgQqzn5Dv+2CD/viW7j6C7qqiq0AJZqshA3L41kJcB+6DymMGtJ71KS2e32eq0WXocpCDafIEiAy/HABBYHcY/3H9ctV7+FXLB/eePNmczEoDTnmJH0hTKV/ovz+UPHzLXzCM9EIGlN/Xm1mYfYOOtUVuUtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763819521; c=relaxed/simple;
	bh=FU95ul7WLUdfEve/z2mx9jyjSzxRVFNgLyWQZQyCPEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abMXgpZEq1X1/J/wd3D1kBYAIRhk7A9R7WvrlOOGFtQMKUynCCO2GjmN6mHw7maOW3hAKZXyq3g5o8QdCY19A764KKGiP5rb0PR0h35kbsHhT7LKublVRg6UxKM5jgGyqIvuuKjz1TVxcJm1hk0DVH4Sklg7fTfUDON4p9oWoEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBgYlREB; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-787eb2d86bfso29139677b3.2
        for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763819519; x=1764424319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FU95ul7WLUdfEve/z2mx9jyjSzxRVFNgLyWQZQyCPEk=;
        b=lBgYlREB4ztYceJUPaDPPVYfcDKuZ3qhhaVtoX2b/IwezDiIuTsQ+uIbPUmgfI8+wE
         cvQk3Z1q8w1s6PCYjJPcdVw0yg9nEplA6qLumhAFyRKfndWFf6kh+HDOsZ+Nx7iKEylc
         /zkOCSu0/Q+BO9oQmFYjm/WTnVFvpmTOej1cUL0Z4U7qd4cioVL4/nEeWWEac3G2SGrJ
         SHAlV4YkdBbkIh1aHDP4gcaa2p1n8V+T/3vXQ/SZZaiO119pSitBezjxBsPhhPJ/Umei
         YBdyLfc7fmHVsh/EjBurvM2ApW6+SDEOEvpMy/PEnR7sU1VZgh9IeUEX8sfKRfEZKFMF
         mTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763819519; x=1764424319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FU95ul7WLUdfEve/z2mx9jyjSzxRVFNgLyWQZQyCPEk=;
        b=K4tMY//eoOineDZuJX9NNuXW9cO2LQB9SKIxfbgHwCfYT8U6o3o91FO2a+QFUIUW89
         /XgHgXZU93sGmld8X/ipP3SGC7koC9Czxxz5/46p0GFm6q3y/XtogR1+VbG3Ap1Ehk7J
         6Hza1m4rCErjy5TkO6OU2ODn7lQP3oKGMwHtiQ9bO1PmWVwXeX9ixVGDsRMh0ZTH5VkP
         n1Tumabm8/+hXYCCx3qHFX99eeP6yVdRjIbFHU0gvt6BkVGDg0f6Au621bl6zVprWuzU
         zDTpE7/rWGNx4TQjnp3GP7saEhjxo9cuaMa9Lr10Pmfeebfy2GSTEiBa0WhW8w8C5VbT
         7NFA==
X-Gm-Message-State: AOJu0YwJx83NmZdpZY8lmMriB4PGCgWzezc3YZfh/5kgilKuNEe/8FmJ
	30Hs8lv3sfQSBYrwK+0o4bv1eADjqkxbEj7nwNiou1y3puKiqCOVzC9q+PxagRsWqstXtp9cyzW
	R0LlHNhW+fQ9EU8lTkkH8hv5NdsVd98QjYGTB
X-Gm-Gg: ASbGncsn2j32rY8Cg2Ep/+luGnftU6DgpCcV9yfOgWW9DsBksnZI0WZOvCJS7GQwNY/
	F5gAFdFb/NoFtI7AtVNdGHR92HLar1WXkBuZAgcOR+66IvBWGvY95nBULwIieJuSl+gzKfIsF98
	EQ49jbB+u874gFgGRXItSCPnMWc/OnDLPL7iW/mTBkZCgwSzsHYTn++Ongj2aSE74ZefcP/IpyF
	xcc9ZveDloV8wmrNyJVHEFC2Nxs0pMXjforHwOaZmcNvnHQgUeUbZ6lA3/UidVOjGlinMhh
X-Google-Smtp-Source: AGHT+IFIkS/IF5O0/U6/cEos9k49ldqGXjodqGBC4GOKGmXA2fGkcb5b47fg048KVLB1+DwoI8UUQMs4PWgdRjnkUnU=
X-Received: by 2002:a05:690c:9b07:b0:788:1cde:cae2 with SMTP id
 00721157ae682-78a8b570246mr48883927b3.67.1763819519056; Sat, 22 Nov 2025
 05:51:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122122846.28493-1-linmag7@gmail.com> <c468dc2e6f5c4ea132f2bf25e6d6976e0c317005.camel@physik.fu-berlin.de>
In-Reply-To: <c468dc2e6f5c4ea132f2bf25e6d6976e0c317005.camel@physik.fu-berlin.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 22 Nov 2025 14:51:46 +0100
X-Gm-Features: AWmQ_bnp70ndIYjCi8iTCTH61fUlRzCCEu1aB6EMzDmt0SNEgLG9EC4VmPsuiKU
Message-ID: <CA+=Fv5R4_kAd4kxq-fR-2grY408FTC0hBkFURAZhgxAtbVrxPg@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-elektor: Allow building on SMP kernels
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, andi.shyti@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 2:29=E2=80=AFPM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Magnus,
>
> On Sat, 2025-11-22 at 13:26 +0100, Magnus Lindholm wrote:
> > It the past the i2c-elektor driver has been broken on SMP, as it seems
>
> Typo: s/It/In/ and I think there should be a full stop after "SMP".
>
> > there has since been some fixes/cleanup work to get rid of cli/sti and
>
> s/has/have/
>
> > rely on spinlocks instead (as pointed out by Wolfram Sang). Tested this
>
> The sentence just ends after "instead". I think you meant to say "instead=
,
> let's allow building the driver on SMP kernels again." or something like
> that.
>

Thanks for quick response and feedback, I'll send out a v2 right away

/Magnus

