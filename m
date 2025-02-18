Return-Path: <linux-i2c+bounces-9477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31CA397AF
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 10:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 379023A619D
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 09:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15DB2451F4;
	Tue, 18 Feb 2025 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMDnFiNH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0492B24339B
	for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739872006; cv=none; b=lQgUEY22+e+azd2Wr6AYj1OKBFc/EsHXNQzkzjfWvpPiv6bgr95X4DcGmEBSmHl5L0I1FP4oItAql7X9SE0xNV8iZJeGTBepSoRPtZDmqtxypnZnPG7AZQWK/VsMY29UPI6TCQ8SNxSlwA/OOKv3ddy+z1uknjBQFgMvSCH5ACA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739872006; c=relaxed/simple;
	bh=LYC5hpOzdKMPIBEKlmPWsOvydZSU8qXdrpA2nZcaq4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=mYLZXKWP3LVihsaj1i3Qntm28998JG/6pLVPp70uITFRizjyea2p6Dfc8VFpO73zLpXBVikfXEtGfdTSCTOFby6vWJpHiZQOd3fYNxKYLboBa671uwIs6NQugraSDMXBQCYkuwGxTY1dfbcv5mIr/uF6tqsYyQQZ53DvzrSoM1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMDnFiNH; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so7490392a91.2
        for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 01:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739872004; x=1740476804; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wU0oTujtAvYMo+L1gvjielexIuI5lQPGJSa9SNyZ58=;
        b=lMDnFiNHcrKK9+CooiMybvJVpwfd2KNH1If+GHiACtbKtLzZL9dmtk6ZcUalzHKNwf
         iQq13MOMcFLv4UkDtnGqwebBVyuMQrIfNl/4qyPXU/HPaX0+wntsQco0wxmOkG3QauMW
         rCjz1TfBBb2Amf91FYIM3sO7dLL2qdhoqBfrQhAoIrowTDcmRw60cMPGqz4dcAVn+koQ
         4/0P9r7XKrNahnY6ByVtneG3TpGTq1nAzfUwQkZbnP/7C6tWZ5yL7NhdMiazqa+EYJ3N
         gC5Tu0bm72CdtdQwOwCW/EDWygO5t6vc3ZaL1jtW8en5Zyq5tEjMys8Z/6hOAGGOhxu6
         wWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739872004; x=1740476804;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wU0oTujtAvYMo+L1gvjielexIuI5lQPGJSa9SNyZ58=;
        b=FGtYOLgg56ThU4xXOKmHbeDY1xADIGCm8mZ4nQKO1JT5p5G5ofyZ0kEkXB27vWP88o
         RKHCjfx09LB/4kAmLFNrGM4dVyN+X64ZIcMG9vTTE9OmkevYxUyo0zP90UeZ+STfSvR5
         Ar7TcRE5ucb1rBYzZkdeW3B0H+qnkEiVzqMWMFRCFj882Hqa9AViN+HUwJZz4qv4Usm5
         gSogzO15iSvtzmPYt97VktlMWKxr+09Dy/XmsOCdJ1y8BZIAi2lcpRls+AE6NcAKQagE
         iiEVvN2Sb3uULau9jBoNRbTu9EriCfSUmr22ZbCGdHIhuI3P/OQmvLYknEKLwdOi8/Oo
         RFbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZMpTERjJHDQRPDuRtc7ueEAckDlr/gu68eUu5ry4TqDjRJEa/OecOj9M88CUdt93d9XSmH8jfuqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YykETk658x10P7OjrmEBKSWC1ixMV8eQziz7SrahqabE+sXiTO/
	r1YuCU3Rd214VBc1B+Tq36RYmV+1rKwmKl5cuR07YqSFnIo4W21RtP2G5hROiGATggZrBRv1mtE
	FTdSpgIxuDVHhauKKDjzLt/5BS/8=
X-Gm-Gg: ASbGncsdD8UHqq9CdYvocLYumjPOV509vDg3wpPEPXodOxxVihEp3djY0Zu6XA/21yg
	WjcsmxT1wMTPqkg5otea1INAGIWpzmlH7cHky6QGD9cpVbzpUP19820UCCY9cRVgDjP9igzvt
X-Google-Smtp-Source: AGHT+IHOcc2j3KOImgx1OwgOnQnqP6BYvtwuPVcWhTMejh/p4QZmCmeRKCs1/7DpNf0BjiTO0u7lQx36rqGHi9wBrqE=
X-Received: by 2002:a17:90b:2d07:b0:2ee:a76a:830 with SMTP id
 98e67ed59e1d1-2fc410493bbmr22103832a91.24.1739872004090; Tue, 18 Feb 2025
 01:46:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJs94EaOtgzVnPArj27Vupobr1jgDF3-tS_+29_RfumL7TO2BA@mail.gmail.com>
 <Z7RWcBxOvNpSPmWN@ninjato>
In-Reply-To: <Z7RWcBxOvNpSPmWN@ninjato>
From: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Date: Tue, 18 Feb 2025 12:46:31 +0300
X-Gm-Features: AWEUYZlr6ZziUsPD8qQ0L8kTH70CIExze2oBix9SqzOAT-MxS_x4ulfV3HvbZ0E
Message-ID: <CAJs94EaBRDkx5grA2yC=e_Zgut4RK0ZGQnUS2Vc0fABTC9UJSw@mail.gmail.com>
Subject: Re: i2c-slave-testunit over i2c-gpio bus
To: Wolfram Sang <wsa@sang-engineering.com>, 
	"Matwey V. Kornilov" <matwey.kornilov@gmail.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 18 =D1=84=D0=B5=D0=B2=D1=80. 2025=E2=80=AF=D0=B3. =D0=B2 12:4=
4, Wolfram Sang <wsa@sang-engineering.com>:
>
> Hi,
>
> > As far as I learned from the i2c-gpio source, the module doesn't
> > introduce itself as i2c slave compatible. Do I understand it
> > correctly? If so, would it have any sense to add i2c slave support for
> > i2c-gpio?
>
> No, i2c-gpio is not suitable for this. It would mean Linux had to read
> the GPIOs constantly to not miss anything, e.g. the remote controller
> starting a communication. With all the latencies involved in running the
> system, this cannot be guaranteed. You need dedicated HW for that.

Thanks. But isn't it possible to attach an interrupt handler to SCL
GPIO? Or do you mean that the latency for IRQ handling is too high?

>
> Sorry for no better news,
>
>    Wolfram
>


--=20
With best regards,
Matwey V. Kornilov

