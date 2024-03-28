Return-Path: <linux-i2c+bounces-2647-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6222188FCE0
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 11:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2E9C1F27066
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 10:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8776B5FBAF;
	Thu, 28 Mar 2024 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NY3w3oeP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5A4E1DA
	for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711621394; cv=none; b=hCWNjz+ZjHtwp53htbsDW+H8/7QpVYiaoP+rdFFUzxtoyklGRE3SbxP/VyuqE6C3yRPDuy6RsBc4Gzks9h5jk7dTixFD1ZRtJuRNXv0icbO3D9Ol0yPnfe7oFhwwNCk7htlcMJjapbKehf3nluPqh/7Ocmosgg1TpVNIQk19a04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711621394; c=relaxed/simple;
	bh=VB3OdON45zL1WUR/6pu968LwSNYKj6p/csUsGlvbFyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sowL0rG/wNGsFtJgFHAWiQSIALln13mfTKifYmLNzdRdlLQ00ArjojhoQQzLSqDuqrZ/3SaxhOsi4tx+53C0NGrieZnp4u1t5DUJrZVtxHxK7/8n7N4jFTBCQZ0Fe+R87d65tmsZpU6s8zz7oWpIo1lyUyglhsyFS7BRl+gUHds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NY3w3oeP; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a474c4faf5eso83795066b.2
        for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 03:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711621391; x=1712226191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VB3OdON45zL1WUR/6pu968LwSNYKj6p/csUsGlvbFyQ=;
        b=NY3w3oePv9UVSnZ/MInlYHzCsoK+ArguBqZf7/ymEqpGZ8HimhsZnm13vVzhruVAyv
         Gs2/xRg4EwmI5EGR9wNwMRLzqd9jz+egfoJsYH98qH1u3Zgvf4/+ulwRrfoW1IUSrCFc
         e+cibDu8nuyn41mM5AXLXaOSw5TMZjM9T2XqwoAfu0uvqQyN0c447MIvJNB1UptZvxcE
         HK3WBaQSQuoGxQUIqT5FEw0IACZxvRCKh+OxHETH9+ab1Lcwpyp0/e/2QYVE6pziqseS
         tArrUHR5PW8qJ9kA+lHNZrvWP1k4OK4xDCvV2qbB7DDoCQ1PNrt1tyj5Hwwpp9HQke5m
         IXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711621391; x=1712226191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VB3OdON45zL1WUR/6pu968LwSNYKj6p/csUsGlvbFyQ=;
        b=rpPpjvgW/grzzcLRT1NWbm0jWtTHHuC1rCgy98dQDz94zSQL49IgvWF9UZiJMlV/eD
         PWGucNSmxMtOlhTvxepfhKfHuXuUv0LjRQflXMQ8TfSHQv+j9kfIkQ6Mkj3KzcstHi3l
         MKlFkBNgquvylNt1oqLX1HpTRhwsGKstWSiMTzSDdyK9MC5f6LrYon89WBN715362yXS
         61OEC5lerkCSWmh81r24y88CVyn4eI6xh54HVcxZ37jP1/zIj7XjGG4WPz7y3cS/nPpd
         340I0NIzNHdCT2BPg1nF1uwfoYEosvu6PqG5IfG8ppm3NeCUCp39Zk/gTnUTdUfVNs0z
         /Tcg==
X-Gm-Message-State: AOJu0Yx0G9nDBG9EqL2JeUJdw2dhubqw9FaFXsHsWbZqWKqu2mOnA/T4
	XIzDM+Y4mieOKL8iRRPpfbcR3LpSDfP0pl8ehZaC+aTMvpscDcsjj9RwbbKEHB+BI0PwUK1OZPy
	yOBOXOf2ctF7Gm70l9auG3iqMg+w0IlQG
X-Google-Smtp-Source: AGHT+IFKjRzfGPwCVm9Jt5TfWzY9vWBVJh8jLBxr5RM6nIiPXFoE9y9CHva9n43fPiOmKGttkkM7lCPq6c12hP34r/c=
X-Received: by 2002:a17:906:a445:b0:a4e:23bf:77e8 with SMTP id
 cb5-20020a170906a44500b00a4e23bf77e8mr678663ejb.72.1711621390853; Thu, 28 Mar
 2024 03:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+DkFDbsa2tApdHJGDos5jvD7Q3o4Px_O7RxVBqA07ffbWPiUA@mail.gmail.com>
 <20240327233319.qcst5ukbrq3j4j76@porty>
In-Reply-To: <20240327233319.qcst5ukbrq3j4j76@porty>
From: Patryk <pbiel7@gmail.com>
Date: Thu, 28 Mar 2024 11:22:58 +0100
Message-ID: <CA+DkFDa0+1sCp=+o_WghTqHwBtDvfD-MgfYc0x8XCp2YVci2-A@mail.gmail.com>
Subject: Re: User userspace access to I2C device acquired by kernel driver
To: Stefan Lengfeld <stefan@lengfeld.xyz>
Cc: linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

czw., 28 mar 2024 o 00:33 Stefan Lengfeld <stefan@lengfeld.xyz> napisa=C5=
=82(a):
> It's possible and already done to implement a kernel watchdog driver and
> combine all the functionalites (gpio expander, interrupt controller and
> watchdog) in a multi-function device (MFD)[1],
> [1]: https://bootlin.com/pub/conferences/2015/elce/belloni-mfd-regmap-sys=
con/belloni-mfd-regmap-syscon.pdf

This is even more information than I could expect, and that's totally
satisfying for me, I'll also explore MFD devices a bit more, as I have
a feeling that I've already seen something like this in the tps65086
device driver.

Best regards,
Patryk

