Return-Path: <linux-i2c+bounces-9479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470BA398AB
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 11:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60D8918832DD
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 10:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD1B233D8C;
	Tue, 18 Feb 2025 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V21BwTbv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE43233155
	for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 10:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874113; cv=none; b=jRZsy1sJXHsw/WF+urmvDZDgN5/VzjnZKTLaHsttH85HxWP56UsI8JcfLUxV2UYhqhyFK2c+HZPbyhxpfONH3u0dNA8wE8sGP17FmJqjHZiI6+i37YCBIRtOii5PY060/LQa2YEyAsjgHlMpAoov9gv6hV+sYdZLMUElBi89mOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874113; c=relaxed/simple;
	bh=pRUJthAKfP9tLszdfp6BPLNFPaUKzw3uTGrep1pcK6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=oJMFYmgb3P0eM35SNXXDITr1gwKDyT5arrZjFPhO9PP80fSyWr+lxDo7zYZ+6njuydbWhhVKCoJgSWhmIN0CId4fDwWOfEKlyzWdj1zxNVA3Eo0FqiRMRrpe4jzfEID+arUPwMfKlz/u9haN0cGMueKyYoynywVNJ4bbNw51gio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V21BwTbv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22114b800f7so41425325ad.2
        for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 02:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739874112; x=1740478912; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRUJthAKfP9tLszdfp6BPLNFPaUKzw3uTGrep1pcK6w=;
        b=V21BwTbvIsEBcyLBfsdjAY0MLD+V9n4N+DfetpyATVWjzKrl1bLGfNpXXmYVQnmGql
         5qmNJvwTMObijnPUD8f+ydZREf2TTbmf6exxn5fZfhHIW8vJPgAJZxKRmolb1kIcus8b
         wiu4zJRpaqwoymrUdoB/uSxk1Zw4WjZX1LARKEGgIAEN+ZcnS7vjioOVYq/FP4xoFj7G
         T+XFM1rMjgWIvi5AHGFbigbQ/vmOtzztpuG3P08BSHZa10XsrUmELQCVBLBDOQnVF/ty
         K42m+ag8WTYdGssSwa4TPPVP7qlshyctKFX3olqTcdT/hiu3XZ1qPw48AtloUrQ1BBEh
         9O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739874112; x=1740478912;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRUJthAKfP9tLszdfp6BPLNFPaUKzw3uTGrep1pcK6w=;
        b=JWAvrFthFYCptHsyp43r3EtI5hc3FfEtEW7aJ2vJ78axTxaFAEN9I/P4se3I81KIb+
         dKmK020okJtgEedvuwdjF1oGSCqIzCcdtuqzniDchsNJ5NIlJkf9LnA8r7n/nCPXxw6T
         BVpoVB2Insb8fjlnXdxpkoZVkgeJ0143HEVzDp4ZXqEENOCBYxpqXtDjreNxmCAYzVpw
         r2+hByRKwGbhc1LL4ZWx2C8q/kHAn8mgULzLWxM7jJAQstMvpg0yVaUCifn2r8qw8DyB
         KbxX962KfwblTMyq8YJeExERidGB4aXZ2Jv12xmb1w6KEhPIjDXtOMsEob7vXR7BgVAV
         AguA==
X-Forwarded-Encrypted: i=1; AJvYcCWOD/qYpTVlhMzDPnI+HtsLJKBPGkBviZ0Dp+RXD20SJqHC7MDQeChtm7M6tZmGaRMQ2OP3iIu1RPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQcF6YXckSGgSYZIrtcsx7Vn8o44l5ckVMJrmqygptHcErj3DZ
	yGrcJAsxl2lRADZP+31fMS35nT3qf0k2ysEpCBXdaKGg3AxwidLuDaSFfpL2WTZhaf0ixMub4IP
	/3kwhjgHuzMzCJLQR+xr0Q+GZzBs=
X-Gm-Gg: ASbGnctcPHtazkhlcdNgqTPsufIw4hW1V7FGuCT7gTGz9Ue5cbKEihb75/Ywqi0jH7g
	467tX5kZeja9BGE9H/v3qkow10H+Gw4PSHGZvaxCFp4tfer6qtZ2VL2Co5PpbkAjzqJj3Tpmy
X-Google-Smtp-Source: AGHT+IELIoblzkC3maWIBUgIBhvuDsTn4rF6Pj+wg9MbdqOO5a66AseLTDmlyfkj978/KAEVVVttt7oQnF+Gcpi6Lss=
X-Received: by 2002:a17:902:f546:b0:220:e63c:5b13 with SMTP id
 d9443c01a7336-221040c092bmr156794345ad.46.1739874111717; Tue, 18 Feb 2025
 02:21:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJs94EaOtgzVnPArj27Vupobr1jgDF3-tS_+29_RfumL7TO2BA@mail.gmail.com>
 <Z7RWcBxOvNpSPmWN@ninjato> <CAJs94EaBRDkx5grA2yC=e_Zgut4RK0ZGQnUS2Vc0fABTC9UJSw@mail.gmail.com>
 <Z7RavX4Ro26AZJir@ninjato>
In-Reply-To: <Z7RavX4Ro26AZJir@ninjato>
From: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Date: Tue, 18 Feb 2025 13:21:40 +0300
X-Gm-Features: AWEUYZnHkr5Y-OHxFn0U2V1WKqQbUN6cVRXyKO9prXV59EeALMkm6_Z6EOVtsFs
Message-ID: <CAJs94EYuYVdr+3Fr+sq3ge+D=hZipvTzdLHOrG4qBW_o-tnndA@mail.gmail.com>
Subject: Re: i2c-slave-testunit over i2c-gpio bus
To: Wolfram Sang <wsa@sang-engineering.com>, 
	"Matwey V. Kornilov" <matwey.kornilov@gmail.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 18 =D1=84=D0=B5=D0=B2=D1=80. 2025=E2=80=AF=D0=B3. =D0=B2 13:0=
2, Wolfram Sang <wsa@sang-engineering.com>:

>
>
> > Thanks. But isn't it possible to attach an interrupt handler to SCL
> > GPIO? Or do you mean that the latency for IRQ handling is too high?
>
> Way too high for most systems. I made the in-kernel sloppy GPIO logic
> analyzer. From that experience, even with constant polling using an
> isolated CPU core, you would need at least a dedicatded 300MHz core to
> monitor 100kHz. With interrupts, it will probably be a magnitutde more.
> I scrapped that idea for the above analyzer, too slow.
>

Thanks for sharing this. Initially, I didn't realize this.

--
With best regards,
Matwey V. Kornilov

