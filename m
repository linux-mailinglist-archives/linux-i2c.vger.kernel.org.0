Return-Path: <linux-i2c+bounces-2915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 243428A2C61
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 12:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D51BB2846BF
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 10:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0E63D3A5;
	Fri, 12 Apr 2024 10:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C1AKa9tm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C3638DF7
	for <linux-i2c@vger.kernel.org>; Fri, 12 Apr 2024 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712918045; cv=none; b=nr0gOsHjb6oxS28gKDYqD9nyCcIH5LnyN1Ii4xAPTNhOod/609Twrrsd+5UQL5FroMh/U/6+MFi9pr3fmSKfxHj+qxbo8H8hHI1bZ95eqeYxzjEGZGZMJT6YGPWmDvOgTYb7Mok/CGpI0ZCMK0hw2V4R+x8pNtnmIHqrizyHemo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712918045; c=relaxed/simple;
	bh=aQ+0dgYl5PSPxKi0XkUYJ1LBvfFy3GUwsB3keBtJ+HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8VYAjqTEwqFrUQ1OPk/IBVZ+F/xyufmSxi17/LLucUvuOeIzgdebRSbJW2tiI2QCtRLmFfdifdYzDgZ68l06nFN1v/REdsBOSM+Rf9c7XR9t31YWp7Mgx+smxgbskV/yjexDgpsd9Hs4bv/k10N5QSwceZmMGTQv+tG/rgljwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C1AKa9tm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712918042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aQ+0dgYl5PSPxKi0XkUYJ1LBvfFy3GUwsB3keBtJ+HE=;
	b=C1AKa9tmaaiwY/XHPshIpJ1WdrKKFzzn5F5CXwcnvB7G4TVXf+Y9oD4vf3n1YfeZo8mqJw
	poO1R9x6AwEw9Dl/LMug8QizaogaM0AR2OMnfmt7OEbJN7cEzlBM3NO843CRX4xxnIOtVJ
	WpuS8HnV+305te2iKUoCVSMdne3Sm8I=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-IqSdfJTaPxSkoNETeFUZJA-1; Fri, 12 Apr 2024 06:34:01 -0400
X-MC-Unique: IqSdfJTaPxSkoNETeFUZJA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2a090878480so663619a91.0
        for <linux-i2c@vger.kernel.org>; Fri, 12 Apr 2024 03:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712918040; x=1713522840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQ+0dgYl5PSPxKi0XkUYJ1LBvfFy3GUwsB3keBtJ+HE=;
        b=rOFivYRzbd4uFwaEkWjz21gubQ7j+1LIZrcLxAOnWk7MMEI5sr+rFQOsYQkoHsGAKW
         y61+A4LXLfnjRSUjaKthbT7wNYMHk6+g3znXz1vQ+xOdW4LZDKoJ/LQPqK3yQ7buB9Hg
         9GUBMdceVpBCXtg65YTQ/xddoZIUDv/KixlXgRPnbQFy8UaA9bmUfZxgV453QqiQPope
         KMGUapYrfqMaltUw0Fm4c11/H18V/M1AEP5fZ7AjxHTE8F7GVeYFAWgsNOqalARjAyBI
         XOO/Oc57ovKGosJZ70IztUBWhPizzdzJOVWnVH5NkE4RSLz+DLHz7Qh+N1UVnk6kIK2U
         dLZg==
X-Forwarded-Encrypted: i=1; AJvYcCXgBIMzdCLRhlmvB8oS8YnPk27fwkTz7utNQocZ1aSSLPO9sUmCtjG8/y7k06nDQRy32SR+wjCwSL6h79JTtkuRwL6xudV8zUcx
X-Gm-Message-State: AOJu0YwkIDgkthS3tBXfSTwNg+uphdG8SRVs/M+hwPr+ESDOzt4IRSYV
	+LdmrnFIzaGKj5aWH2lKNywYv8e111QDXB9JVvaJvHf8LAwDE4Big9TdFMUJdAKLcQ+SKX736wB
	yoA3YYoLDnL3ybD0B5DI7PmQf8p26PAznlYz5y0V0MZtJi4uau47BNKpssjNU895cM6gnF6j5AC
	iMBs8h0QgwpX30FBPtMtSVU3WHiSHMqKMG
X-Received: by 2002:a17:90a:7146:b0:2a5:be1a:6831 with SMTP id g6-20020a17090a714600b002a5be1a6831mr7419616pjs.19.1712918040023;
        Fri, 12 Apr 2024 03:34:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmKBGYsHbd2vrqtRgYlvMbYZxsQ0Q3qtnhsNOclN1VHDo60nE7x6ha1MFRXl0o4DhGGAkDEArkejLpWG7wisk=
X-Received: by 2002:a17:90a:7146:b0:2a5:be1a:6831 with SMTP id
 g6-20020a17090a714600b002a5be1a6831mr7419601pjs.19.1712918039715; Fri, 12 Apr
 2024 03:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411050257.42943-1-lukas.bulwahn@redhat.com> <bfjccttmurk7aajps2m7gcyl532rg7rnlutfhbvupsphxjk2pa@fx5onnkr7625>
In-Reply-To: <bfjccttmurk7aajps2m7gcyl532rg7rnlutfhbvupsphxjk2pa@fx5onnkr7625>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Fri, 12 Apr 2024 12:33:48 +0200
Message-ID: <CAOc5a3P-LX0dkhLFxF-ggOxqkLqM0DJcXqccMJJqtF9U5rbEsQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>, linux-i2c@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 11:34=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
>
> Hi Lukas,
>
> On Thu, Apr 11, 2024 at 07:02:57AM +0200, Lukas Bulwahn wrote:
> > Commit 20c9819ccd9e ("dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschem=
a")
> > converts i2c-pnx.txt to nxp,pnx-i2c.yaml, but misses to adjust the file
> > entry in ARM/LPC32XX SOC SUPPORT.
> >
> > Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains abo=
ut a
> > broken reference.
> >
> > Adjust the file entry in ARM/LPC32XX SOC SUPPORT after this conversion.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> before taking this I just want to make sure the e-mail in the SoB
> is correct as checkpatch is warning me about 'lbulwahn' and
> 'lukas.bulwahn'.
>
> It's not about the warning, just double checking the e-mail
> address as often to mix my addresses up and looks also your first
> patch with the redhat e-mail.
>

Thanks for the hint. And yes, that is a stupid setup mistake from my
side or at least from the email server's side.

I joined Red Hat at the beginning of April and hence, it was my first
email with the redhat address.

lbulwahn is my 'official email address', lukas.bulwahn is an email
alias to the same mailbox. I actually want to have the commits in the
kernel carry 'lukas.bulwahn@redhat.com' and not 'lbulwahn'.

I have sent them out with 'From: Lukas Bulwahn
<lukas.bulwahn@redhat.com>' in my patch file; so, checkpatch did not
complain locally.

The gmail server however turns this into:

From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

I will see what I can do and send out a v2.

Thanks again for the hint!

Lukas


