Return-Path: <linux-i2c+bounces-12424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7EB34B1E
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 21:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E9747B32E5
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 19:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802D7286417;
	Mon, 25 Aug 2025 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HaGKZuLE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE573285C83
	for <linux-i2c@vger.kernel.org>; Mon, 25 Aug 2025 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756151491; cv=none; b=bN5eY0h3q0/Nn2gMVfS1GVn+BRx8x8MLQ3uD5bXhCctF44e9+3/0cjDx0iVuAZBASknp5FXZpwUVoq5777IpIbp/utGRmTLZ2dTD3Lkm1ugMGbat/i/CbyDXm4m+BDM6bFf+alICOHqkSNPmAa3WQ1zUrhMHzblptVmsaEZ0+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756151491; c=relaxed/simple;
	bh=y79/LUE75+gAdZKPm7Wiii17xZyHOsbF+TjITNREJtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7zWmqdX10OUvBcMvtd6RSsliUB7jnt9CAr3YD27cQ/dGwL6D3/0zvs+25ymA6fDLSpRtMD9VuGEZ0vo4KBO40UGPp0dUWovhCkS2rNroHWkOnpmo+ilBARnvTHJAZpU0+l/qzTPLLa62m8V0xcvJoKnAnK4xEHaWjnpUcpagHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HaGKZuLE; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f3533fd05so3073560e87.0
        for <linux-i2c@vger.kernel.org>; Mon, 25 Aug 2025 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756151488; x=1756756288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y79/LUE75+gAdZKPm7Wiii17xZyHOsbF+TjITNREJtA=;
        b=HaGKZuLE6ZJf5NweBqUmIuGwifT6BYS2i4BLg5mx+ZgR+ON4KD3FyeG291qmjdDpfJ
         +RoEEvKdCiiXxd6ubXNVO2mpJWzfELIb9KZAOMAKunk8HTjxaguQ2pyzhtaDrTWU91n4
         ZswiXHqVFhmkzU+40FgYuatK/oVikkgvdgbL9jh6kuZvumDtxLQUAXwRiokdo5M9ItHA
         d/SLxabybgDP2HfHgo6lu/P7iyEMaQr5wvx4VOtw3BczFU0LG/NHP0YKpuJwkYF4P3gg
         uweGCHAom57JbmfDHLpB/xFQLaFR/hRk5IkNdaoxBhAXINddVrPKkf/6U6VqwrmahyqY
         tdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756151488; x=1756756288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y79/LUE75+gAdZKPm7Wiii17xZyHOsbF+TjITNREJtA=;
        b=gbj5IhreS5e6DIQcENIqdQHzI4FrAnLwNSWEkohw1WphHiFga2cUTKLbySg3XluYtD
         jQ4zD65K2ozOiFZx+wkwJbQLYYODRotqyTuphT9VDnulJXPadioh83mRBtIJVZ+c8ZTX
         iNiYaKu8Aei0gg8cC09/mKRAsBaUnVTRpozuyK/EGXkCGN38QN8qVSikVC4zGC2gcT8A
         XTpnyXKfZGd3JYR+HgSdq57nOYXA+8cYR9PaUezvyUNs84wD/Ue/rgS/PkA+TR2GizG5
         /wQ6RmHzZ1Y7xOBr5KdJcNKr7jWHtoCf3ivPCJGHpfA2yO0vxb+ApcDdnmVcdrDr/2fq
         5agA==
X-Forwarded-Encrypted: i=1; AJvYcCWsyDo8Xlih8+j6PxBGQztgktTg+XtKN7S/MFBLQgR+vnwHUet8KCEfoqWM1oiD05LigXTZZEAh2kA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC4j1+IayMJCHLCCofSpXUb7s6I9JmtesvtBQ+Zw6Nw5AVDfJa
	44qKSERv4QUDwS8GZja++0s579DVi1FiotuBx5emFHSUwaSFxTBwaEj3/XfwBp+LAyir8XYAu6l
	w8lUFa2kuvcT/ABgxi6DFLa4IvmlyOQ8KsJXBy3VfgA==
X-Gm-Gg: ASbGnct/n2AqV7OX2pwSrrn/8RvxPfTTK4sEwkVu4+3/4qazQ/zFHXUVwE6bSwpLGaT
	yhsdnLJFKrd9iG1UpuDAIn73eueU51UI1k9akZ0R2Vv/Hld5pX3g+tNPapwHsVIFmJyea44HBPv
	iJ2nHpctnEv0dB9oJSkEak7PGXwwDgAOX/B/+iwsi1dlGJh6SOr7jIgA2NPJfC3QvNgKNTirjG0
	l+byFk4el7ClC6SxIXm4SRVO8JWvi+7PXJV
X-Google-Smtp-Source: AGHT+IHCixJ3swy46ayk8UZ8ky9sJlMNCw4ccH8gYjaEf6aBpjGfhfoC4qmGYIEYeYDaVuoFN7bhmFqiGNvLwJvOuWM=
X-Received: by 2002:a05:6512:440e:b0:55f:42ca:cc03 with SMTP id
 2adb3069b0e04-55f42cacd56mr2238491e87.56.1756151487746; Mon, 25 Aug 2025
 12:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-3-e83f104cabfc@lucaweiss.eu> <20250818155103.GA1272375-robh@kernel.org>
 <d6159eb6-7777-478a-8bb0-298bfa607c06@lucaweiss.eu>
In-Reply-To: <d6159eb6-7777-478a-8bb0-298bfa607c06@lucaweiss.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 21:51:16 +0200
X-Gm-Features: Ac12FXzo7Xcs_f8LKjnis--6Fc7OlBNtr01kDZozGbXhIE3-aXJaLXGWXFJlZYg
Message-ID: <CAMRc=Mf5+3KvKKrVJhx9_CmQ-tN69cahkHgjVgL5M7XCZHuNSg@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: eeprom: at24: Add compatible for Belling BL24S64
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Rob Herring <robh@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 7:46=E2=80=AFPM Luca Weiss <luca@lucaweiss.eu> wrot=
e:
>
> Hi Rob,
>
> On 18-08-2025 5:51 p.m., Rob Herring wrote:
> > On Sun, Aug 10, 2025 at 05:37:54PM +0200, Luca Weiss wrote:
> >> Add the compatible for an 64Kb EEPROM from Belling.
> >
> > It is generally not required to add a compatible here assuming
> > "atmel,24c64" is enough to identify the specific device (i.e. read the
> > device's ID registers). If it is not sufficient, then some details here
> > about why would be useful.
>
> I thought DT was meant to describe the hardware, and this specific
> EEPROM on the device is a Belling BL24S64, and it's software-compatible
> to this generic atmel compatible.
> That's why we have compatible =3D "belling,bl24s64", "atmel,24c64";
>
> Am I missing something, or misunderstanding how DT is meant to be written=
?
>

Right, this is what we've been doing historically which is evident by
the number of compatibles we have in the schema that are never
mentioned in the driver C code.

Bartosz

