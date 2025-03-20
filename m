Return-Path: <linux-i2c+bounces-9957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 326F4A6AF97
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 22:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A136A7B101D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 21:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E3E22687B;
	Thu, 20 Mar 2025 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0XidKpA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A451F46B5
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742504804; cv=none; b=RcFYimi7D0F/hZHm7p74xT2S5ycjsn8lCLu0MVBEQwOHECZ3yVlhUAbfGAxwTfAU+O/Mb+YiV3fSxwaJScTpU0JlCmf1VMpBGX4zxzgr2/CECEXIkUrBh73ZVDRvMccHegCWWITADuJ4IdQURvJIFpu/wZfErJZ1ybxie8+0B+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742504804; c=relaxed/simple;
	bh=WligMYJKveW8VSIckTAvf8U+ycnG0Ud2rI+4XnQ23PA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QK4I/HBOuKqKcS1VA6D175TO4x4uDkGO6rUYDdyz+G/hkg1d4NXiQ4TFbzzNFRuCEs2hTKGn+7ed0gNr+IePkOMEcBmnwOrGkxQFT/L0r3oReG6Sf8WSSNjG1R8S7kLoUQaLrn83c8PHGUWqZiyekqO7BQlLhAACaUrYbRfdkSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0XidKpA; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac3b12e8518so281249866b.0
        for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 14:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742504801; x=1743109601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WligMYJKveW8VSIckTAvf8U+ycnG0Ud2rI+4XnQ23PA=;
        b=H0XidKpAtGW+6eX04f/SbCBqhov4Oxo14CUCnJMc18iatxDWRf/TUXRi6A3GcsnkR8
         L2IwtXVgGgIZEBFzc25ESWUEAV4FPiAutrLkIN+CPQPs581aW+vO68s8HErQzsOlIUIS
         KtbYG8RVQqiEV2l/wswYYJFLM5Lge3F0/rnp2O7T2D0dtkkvlGbYXdDhyadkkRt6TBbU
         BDc0Fwlifiu83pYxTMMmJ2e3JxxFLhW4J6+FFB9ckzZnJvPoMxVULhEwd9QiQptbpS6A
         IAUjVsW5MlUt2Z26h6REiGGTR225IB283d6XTDCrie+neFH2Rh4m7hyEiWHWsDqBDCAI
         a6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742504801; x=1743109601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WligMYJKveW8VSIckTAvf8U+ycnG0Ud2rI+4XnQ23PA=;
        b=edueWHbpY6Fk4Jy8Rdl+EmEQuS23YckFz3n4ZqtzoJtBOpO4UVz07VdrHuqGV+Mp7j
         h8hwzOM6MWbo1LBEafJeEPQ7eVhg22YbGWEzENtEyL66g0olKgaHU3p2JAUKr6MJCbth
         DMn/iVnb+lLA5rW5k2xXe965ZrcbcdEstVA1aszmBdnB6TZ9WCM1LE3w7ZBBrgV1R1UE
         rV+bPXH4q3NP2EKPUYIAjFpDs57MH22W3r4fd4v2A7EGXA4mFEhmAJIgt9pbkrlR2Ttp
         o6k26+QQXdjLB3Yb88UPhn9lqhCQ3HiP1NGb33wP7mcTGTeP2MjVWmdmizrcbKFsP+Ae
         KsYA==
X-Forwarded-Encrypted: i=1; AJvYcCXn6h4DyzfUQ8bSoCkM1pfXnELbrfcw+U+Qfsb31jKVxehpIA/vQ2P3y7l999veXwbaadXP61w/NXk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw34LPJTKkpfeXFQZj0HOZN22eIDKgKwL3TpmOyP1G1wQ+haOBe
	3gxkSA7lCpuSL5095xNExkOmz/1birVKd1XSQPLmK5LEVIl6JTsGCQgY9IJX2f4IzZLIXsidQof
	v7A+S/c1Vu+fzUhXS9VWJvMGV7w8zWGr7iA8=
X-Gm-Gg: ASbGncsor6v89RRUfdoyGBoYaYepKoqdNDOPeQVQs9+nhBI85z4buguYtTTS0K/ZFgI
	zTHv0eKsODOcZ3gwW/m/kS93rTLGmZAZxGchgDZfmiEf3nN67Au6X3b9VGxddPvAsitxzVzFsl1
	WdehvIE6JFa6yFzSkmyAOUNNnUHAVpz/nhgRTq
X-Google-Smtp-Source: AGHT+IEZZ79U9GH905dFtztF3CNQtqu9U7SJIZa+MX+Yoa1LFgDQx5Wb0CGQdsNRMw16s24EeoODNVdg6UBalCwWxD0=
X-Received: by 2002:a17:907:2d14:b0:ac3:8895:2776 with SMTP id
 a640c23a62f3a-ac3f20805b4mr75658066b.5.1742504800618; Thu, 20 Mar 2025
 14:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
 <67535b17-c3fb-4507-b083-9c1884b4dd7d@gmail.com> <Z9nxRwoeLEriKP84@surfacebook.localdomain>
 <6brcnuejsoor5ejbudtd4wxdrgjzntjat6hqwardxgxierujkg@qvswqhafv36y>
 <22641e59-8e70-46f4-b01f-5cc6c0b9d23e@gmail.com> <CAHp75Vdem-DBERs18=VqO+MUh=5Nyg9XLp8Jg-NuQ1Zk7cjFeg@mail.gmail.com>
 <74d8af68-88f5-484a-9854-e00f4b0e33c1@gmail.com> <CAHp75VcskbS7mxQxFwhqdSH-KMKLG6E8oeRDV8VhmK=FE2NiXA@mail.gmail.com>
 <f47ebf6f-4cae-4868-98de-7c6a1d2634c9@gmail.com> <22rlfg3yhjz6pshwirss3qgen2egl3qinftjshfhbiq7gu3z5u@lttl44appp7y>
 <84ea8650-53d8-4ab9-bcdb-af35960a9beb@gmail.com>
In-Reply-To: <84ea8650-53d8-4ab9-bcdb-af35960a9beb@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Mar 2025 23:06:04 +0200
X-Gm-Features: AQ5f1Jq-rwKeZ21igNfUm_1vPehEy7BFWfpYoRVWFASVD8L110e7Sihf-YklqNA
Message-ID: <CAHp75VedKA1Nj-qGWKk-YFSnzfn5qDJU3mFCGznXQ5wH+fe8wg@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: i801: Switch to iomapped register access
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 10:06=E2=80=AFPM Heiner Kallweit <hkallweit1@gmail.=
com> wrote:
> On 19.03.2025 22:53, Andi Shyti wrote:
> > On Wed, Mar 19, 2025 at 09:26:35PM +0100, Heiner Kallweit wrote:
> >> On 19.03.2025 20:48, Andy Shevchenko wrote:
> >>> On Wed, Mar 19, 2025 at 9:33=E2=80=AFPM Heiner Kallweit <hkallweit1@g=
mail.com> wrote:

...

> >>> Cool! So, can we just put a summary into the commit message of all
> >>> findings, worries (or their absence)?
> >>>
> >> Sure. Would be a question to Andi how this should be done technically.
> >
> > yes, please do and I will update the commit. You can even provide
> > the new commit message in reply to this email and I will update
> > the rest.
> >
> Updated commit message for d4ac3f93ff23:

Thank you, LGTM!

> Switch to iomapped register access as a prerequisite for adding
> support for MMIO register access.
>
> This changes replaces the delayed inb_p/outb_p calls with calls to

inb_p()/outb_p()

> ioread8/iowrite8 which don't have this extra delay. According to

ioread8()/iowrite8()

> Documentation/driver-api/device-io.rst the _p versions are needed
> for ISA device access only, therefore switching to the non-delayed
> versions should not cause problems. However a certain risk remains,
> which on the other hand is significantly reduced by the fact that
> recent systems will use MMIO instead of PIO. ICH7 datasheet from 2012
> mentions already that SMBus register space is also memory-mapped.
> So all systems from at least the last 10 yrs should be safe.


--=20
With Best Regards,
Andy Shevchenko

