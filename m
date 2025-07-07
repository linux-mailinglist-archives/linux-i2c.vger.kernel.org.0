Return-Path: <linux-i2c+bounces-11860-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AB9AFB199
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 12:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FBF0175588
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 10:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4B9292B27;
	Mon,  7 Jul 2025 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PR1vDgXm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F802882CF;
	Mon,  7 Jul 2025 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885293; cv=none; b=GD3diHlGdew+THAN3qJEbFgINTRLwtIqDATjHlxEPGbSU/l5P9BOLJT+dbuSPimnrZtv/GSWq0NbGJbYduwsw+RpGf7ncAia5jSsm892jmaC0ane5SIj11UqV8pYTS/CpqK/FQfUEuQAPTeqFL8MwHeU0NcrnB7O+9fkc/IW3YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885293; c=relaxed/simple;
	bh=wCM/kCwxjRQzPSCEUG82F14SRxtGiKg6sewD864KKIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhzJmE8H/UR4OStTQDwxcjdYijbP2yQhI9QBYdaFgOCaS85nBrJyNxHC5wQ6BD3o22ztJDbOljEtLFSpbQrRJ7gZ2kGGJXT4hdokbWE5lXEyBCTvwj88WolcANxOxy1K4WVCyDETPDFOMwI6RWdmZCQSqqjyd95TRUjtcncAwPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PR1vDgXm; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234b122f2feso2126295ad.0;
        Mon, 07 Jul 2025 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751885291; x=1752490091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCM/kCwxjRQzPSCEUG82F14SRxtGiKg6sewD864KKIg=;
        b=PR1vDgXmQUubOyQsQE0fU5d2Q/vZR6v7YKAwfiiYeF1Orcg9Wvf6aa6wKCeG9bpEWG
         VInvOgepx6bDQJ8KRA5re4QWkNmcIe9cOHkvCTglGNG/STW9O0FwPcqd0XqcXmbkfPUk
         xkWfQifJAV2q/VzEEaOqAXMtBX9OYHhqNubuGkbRpOUCpYF0rvYIS+/2jJkQzGJRc62b
         qHTmo0ifXIOy02hoIHSprnPTb+mtDCZVtw9PY+knTXj9FGqX93SpUKVRZPTXCLcvvooj
         hXQmzGm1HO8g09VPD64swam37/y1KPWOiR1XfYJRwdh3XVy2Vg0amEWDFA8eIk8jK5eZ
         Rx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885291; x=1752490091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCM/kCwxjRQzPSCEUG82F14SRxtGiKg6sewD864KKIg=;
        b=isqVrjogNVgbkOQ6P9fGxIkYQRC5hV4b7agftCcdLHMU7plfDN6o4jzCk3DUdj2X8D
         w5y0jHPj10gxbpPKb3Ki91AFXK3sBsFuLit2V9m5dvSwW4V3rzezNUHkpuOeTx94XBCq
         Y5QPpYtVBP4IdrgGz5gbe7pUUwOOtZJLubEpJEJhTdV9n6hgbASrMG2h1qiVLsFZFHPz
         jNg2cHaD1vnicKan1gzxt4ZwQCtgtYW6hCtlFphQ/AhyRhHWgClvWMAFv/TKRKD8htoW
         Ov/NDR9jobCkWJVvm7vroNu5H5wHXQvllfOSF1wAOKqpimS6b1MPUpISJndggPaAULiv
         2tEA==
X-Forwarded-Encrypted: i=1; AJvYcCUwHCpHoKPdKvvnhAx5jnppGsLPJZfkJRfr2evUFpaYJXonCVt1IPV2q6jvMQbvUdyGSBCcjCC9qzAH1FAY@vger.kernel.org, AJvYcCVwjo9feasmbavUymKKgEUm7GVD1UaHA9kOtBbP/pgk+a5olXOWkLxbRvCbljw2KeWC2VNSsSgS9q1Ir1Wx340=@vger.kernel.org, AJvYcCWTEsoW2SCZXHabo5FPoR0bU2giBB1BogtRji+rUFEK+NSNI9R4M1YP3RrT1BnpfJHDqZT55pzl1PU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXKA2nLWDx571+bO3HWaHEuGlmGiItNlnO6+fEJBkh3d5wz/Vd
	3z/1aG4D0H7WHuk08fCSDqwQSHqkvmkz39kcK+YKiHAX7NU+8mZ9dlxzBO8CiqnQmmObDXXdqrK
	o1pd1hA+B711sJyaXMAOkKTYAT6bDsUI=
X-Gm-Gg: ASbGnct5l2toCW2PDnpN3KFJTyseXgxg+KsFD/4YrwvVbELt6I20nuYEdo/1WnW0oaB
	PnG0S6X7g4RGOvk/l49gqM/gfafHdjiJt+3ATmdAOVRAbBpBQ2I73U/ng10zhtiSRh/minyfKnS
	61ORyupAgJAEl2aTYkAnMb3FAxo6qyB0k0CTnIhmIUG6ms
X-Google-Smtp-Source: AGHT+IE+BnObVwZvHU2ESLAEFUkF6cJUz/3N5/COE7nkxy5KubT+UWMMwCzvYd85fS6puKKmkVFwr+5pFpyFtSBwNAc=
X-Received: by 2002:a17:902:ceca:b0:235:239d:2e3d with SMTP id
 d9443c01a7336-23c873d21e9mr67574995ad.9.1751885290746; Mon, 07 Jul 2025
 03:48:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
 <20250704153657.1195687-1-igor.korotin.linux@gmail.com> <aGg2qkyrKBIPiSeE@cassiopeiae>
 <0ae92ad8-810f-4c10-a442-c403755cbab7@gmail.com>
In-Reply-To: <0ae92ad8-810f-4c10-a442-c403755cbab7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Jul 2025 12:47:58 +0200
X-Gm-Features: Ac12FXzIxa0DLEGNkW8bZVvfA7kvUA2FZ_JE7XiPrkzWlpjFOj6ZOdlkYisteAU
Message-ID: <CANiq72knUt_=vcvVqWaFz_VJEQ9W=4RiTzwSNyxwC_pyBoHB1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] rust: i2c: add basic I2C device and driver abstractions
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Hung <alex.hung@amd.com>, Tamir Duberstein <tamird@gmail.com>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 12:31=E2=80=AFPM Igor Korotin
<igor.korotin.linux@gmail.com> wrote:
>
> As for being added as a reviewer or co-maintainer, I=E2=80=99m not yet co=
nfident
> in my Rust skills. I=E2=80=99m learning Rust from scratch and, given my
> extensive C-kernel background, I thought I=E2=80=99d start by contributin=
g
> something useful to the Rust side.

At the moment, for any given subsystem, it is possible that
maintainers have even less Rust experience than you do :)

In general, it never hurts to offer to help with maintenance -- it
shows you are committed to the code you want to add etc.

Cheers,
Miguel

