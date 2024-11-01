Return-Path: <linux-i2c+bounces-7719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630929B92FB
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 15:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94BF11C209EA
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 14:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375221714D3;
	Fri,  1 Nov 2024 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2Z4NhUY5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84DD24B34
	for <linux-i2c@vger.kernel.org>; Fri,  1 Nov 2024 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730470838; cv=none; b=mCazCO1Nl0Aj74NOW1I3ckYF2EbyvashyBCK18Pb6ocfmf46S2Gri/EsFQSdEqsJo1DXWGWIPEmD0lxqO5UteTyqQqu3tx+3yg0jljOpY2PVNvO+hdLKL5yZ8cBqWkPRQZ9GKolLilbquvdSguRopE8t+m84TTvhS76ZQKBFKMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730470838; c=relaxed/simple;
	bh=SpczMR6nx/oWPuZT5o6+BrOM5WEoNQKWg1cEOXxRN1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPWcX//IriDtvNJ9LKH5M7QA+Moyu93Db///SxaBwUyzY3WlPd+CkWmcKJ9nditM1FwuwoOwXcY8PSyc0SI3AMPJUNkGtCkRPy8Tw2wal6PApvqseU0twekR574+xUEVw2kcIqC1T7vUraCqQYu7xm3059EO8RY5aiueN6T7fOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2Z4NhUY5; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso30982591fa.2
        for <linux-i2c@vger.kernel.org>; Fri, 01 Nov 2024 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730470834; x=1731075634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpczMR6nx/oWPuZT5o6+BrOM5WEoNQKWg1cEOXxRN1I=;
        b=2Z4NhUY53Lmil8ahX2WMKh7JnMY6kswwwQr+OXd7iWL3qgah9cJYqWRZVZl3MaTAIN
         MW9Mc5ePud6bJZwuWcmX/ktYghOEbyZWR0WKPwuTDbhM82yQpzaR40RRMLh4RzAzXC3B
         NQYQEN5QgaumydnImSVgF8q76dUKDhwLEMKeJXFaoS+Diopz42ybO9ALMjd8WrT0KCY+
         FS5RVr43qHoqbLQqNDtNkh9Vdbs17nJVvphNG/9UnPJql5gy4e6G+JVxpvHeEmfaKT5E
         /e0FB30zhPTDu9l7b9/dDsmXE+umlnfg75ZbsSfBOIYotTyrGCCcjbdEtSb2xRc+NK44
         rWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730470834; x=1731075634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpczMR6nx/oWPuZT5o6+BrOM5WEoNQKWg1cEOXxRN1I=;
        b=uMDXz3BobgCtBNM2J/MUJvUzg0cdtZnE73Cvbv/oUZpWbNV021B7W6X0AWs6EEwx86
         gV4xtRWo77PQaSII2vmdHlOvXqHbcUPuyw/tbb2zEfoqwf2DYwo1PN1uC3ATPHC3LweN
         OrNoQZnu8QbssMHJ6bPdCguMhhAGnWGNpDIio/5nUAoy4J4i5mJgt5T0K2Dk7GVdG8lH
         CkicEmX5BCgkAfHSb8YtFk443EcY/3StV7H9GSdBVeA3NAADQRjTdP556SsnKMPERsyd
         aR/THSOJxZHvxzX+eBLjo4rU3bw1J5uO1ErussF10tc1p1HzCtGl29LkHBuNoOBlaHvn
         wvug==
X-Forwarded-Encrypted: i=1; AJvYcCWCREbvsIBkSI5qxuoXax6dQ80u4RV1Xtyk8snQWYUmGA4YLDA5hyyWcu+DpGOwidRtsoH3neImBI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm5UdKyqDa5dWiqnW00DW2O30P79jKa1L78AVKIgEFSG8/gc48
	L2n6L0B8SF5GDD/eLqD0OFMw84Lxfu9pd6fL79nHeW14KCDM6l7K+KjjUWtG78KrlDqzaM95F1M
	hmYwUEajJWQvxXmJOw8xmadRCG7cGBUUgnC+elg==
X-Google-Smtp-Source: AGHT+IF2TM3oiIogWGwTtPTIHeQw0ihU8hZ8YlPTABHC0UPMTqspAY5qIJMjN3x5nVciOTAOj5hnvbrzPN/BlAYo8DQ=
X-Received: by 2002:a05:651c:19a5:b0:2fa:de13:5c34 with SMTP id
 38308e7fff4ca-2fedb7c7ad4mr31067371fa.19.1730470834049; Fri, 01 Nov 2024
 07:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008160947.81045-1-brgl@bgdev.pl> <55ecee09-196a-4c7a-b7cf-61c19737735b@linaro.org>
 <CAMRc=MeTgFaySBFya2e=CYnrXL6R7s9D1DRq+RxKcsf56xMc+g@mail.gmail.com>
In-Reply-To: <CAMRc=MeTgFaySBFya2e=CYnrXL6R7s9D1DRq+RxKcsf56xMc+g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Nov 2024 15:20:22 +0100
Message-ID: <CAMRc=MdVUtff7wLV7mxsoXEBY7pUvULuJH1GvJCJgCRj0OpCBg@mail.gmail.com>
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 10:04=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Tue, Oct 22, 2024 at 2:05=E2=80=AFPM <neil.armstrong@linaro.org> wrote=
:
> >
> > On 08/10/2024 18:09, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > There's no reason for this driver to use OF-specific property helpers=
.
> > > Drop the last one in favor of the generic variant and no longer inclu=
de
> > > of.h.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > LGTM
> >
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> Andi, can you pick this up, please?
>
> Bart

Any reason why this simple change cannot be picked up?

Bartosz

