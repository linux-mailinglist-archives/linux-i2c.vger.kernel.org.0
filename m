Return-Path: <linux-i2c+bounces-1680-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7D584FE23
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 22:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D10A328819A
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 21:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A0A18AFB;
	Fri,  9 Feb 2024 21:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xkE/m40j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5D7179BA
	for <linux-i2c@vger.kernel.org>; Fri,  9 Feb 2024 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707512754; cv=none; b=VJpNU1Uzq0g24kZjbXwW0y/SNsslste8uTGxdPAZQXrml/cZaQl+7HdZ0Wk2FXXILKfj+VcqHUan0vqBxR/wgwcnQwB+phsru39Z+IvzSHN1h5CD87jwiR1RUhpel5UVkjqq20s4amXhzt85qIby6tVF52GO6X4DJrW1ygvLufg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707512754; c=relaxed/simple;
	bh=fWX8AY1UCsAO7A9Rl5Srx2ebyrVS3CEaNUQK2IZKBWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRy5tQG4qjEILBdN+Ej5BVt0+uG9I1vk9fsBqVgQ1nCke96oLV7+3mAQ7cCt7h3gIVJ3Y0JBk5n8iZBqmJVSb7/cUxjw+pkkzoFmUGowyuTU/VFiP2s/Bumd5hDlslHay8rzYAHiO4525BwQiaxk0jmFixkG4atnEHh+livpOuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xkE/m40j; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-68cc9061c73so6605386d6.3
        for <linux-i2c@vger.kernel.org>; Fri, 09 Feb 2024 13:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707512751; x=1708117551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWX8AY1UCsAO7A9Rl5Srx2ebyrVS3CEaNUQK2IZKBWw=;
        b=xkE/m40j0myteCeuAXkuUT8lnEN4ct8CDu7mmbTDAT1CMQe3r8is3167wYTJir800a
         R9UEZtfTDZiHt0/ODAi5VOq3Yc8qvvj2hrWM0CbENgWjHiJrWUxT/eHp8lYE6/XfqpHJ
         WkuxnKVBcpgvMMpQNICP4WP0PqNZuiVNU6AyEgzk2uYlwxb/Jit5huKkYxsjbtYFKgNO
         R8UB/BB8BfvKb21FK253U3NJiSyfJjddJySGbHFoU1KDKAznofeogDLpWLzQ5yOVedoG
         m8+cx6f20TCO8lyhoop27z4JFeHtNMSPCj/LJDufWD9yTCSI+kiunMtlPP8onE6zn53b
         k6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707512751; x=1708117551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWX8AY1UCsAO7A9Rl5Srx2ebyrVS3CEaNUQK2IZKBWw=;
        b=sOGJNe5JbvZB+XpzK9nLgMSNPWA0rRoKpDiiYvzrXY4O3lqIwed3iAhsYdoCTB6lZ6
         qSC2rb1EiJgbrjvm9qr4lxDVM4X+V5TCGvM2KfpAnUvO44d3p3y5apyCQkTnLa/3WpZb
         M4LWNNTLMIejIDCnVBx5E7WfbJNo91Ql3SJrZQNxBQNNgOCbon3etdUYn9XvG+IQAYGo
         MTowYe/IxRfhKfnsCYuTYAxlrcbqLpCTshf7sSDBDjN1iKdDHVEuwRc5z3eDw0dajWqW
         hTWHQ26Qyh6fjINLDrZgsLoghCQobz+bojvCVvm4s3fqwaRNxBGnu7/CibBfTUTDR/M7
         MQ7g==
X-Gm-Message-State: AOJu0Yxve788y5N7BSf2usF6lidGenjDjv194gEWFzEtmOLUvbkhBfpP
	vZNDiZXNLi84r+DFmwXxmbeHNOM+EFPIYA61R3rfDlDUNKNV8eucC0i8H2WfYYdBrnxLzDQlw7n
	/W1w0IeSwoOINs8O2+wF4NjjXgalxAOIN43rF
X-Google-Smtp-Source: AGHT+IGs5gOcnQQd2dq5dd2RpG8BY/CC0Qys6/UWioQgwTa/o34PsoRm6jC/jXHj8ljZ3lVgAqg4J2Flc7+R3ljGXEQ=
X-Received: by 2002:a0c:e351:0:b0:68c:bf1d:70ca with SMTP id
 a17-20020a0ce351000000b0068cbf1d70camr354954qvm.43.1707512751398; Fri, 09 Feb
 2024 13:05:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201044623.374389-1-aahila@google.com> <ZbuEsltcMLNn4SyF@smile.fi.intel.com>
In-Reply-To: <ZbuEsltcMLNn4SyF@smile.fi.intel.com>
From: Aahil Awatramani <aahila@google.com>
Date: Fri, 9 Feb 2024 13:05:39 -0800
Message-ID: <CAGfWUPxLVzziWmwcfqDCfWuVM_Gjya4AzTmoqs1xTcGMXsRorA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: designware: allow fine tuning
 tuning waveform from device tree
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Dillow <dillow@google.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Andy and Krzysztof,

I think you are right and I can use the other DT counter, I am
currently trying to test if they work for me.

Best,
Aahil

On Thu, Feb 1, 2024 at 3:49=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 01, 2024 at 04:46:22AM +0000, Aahil Awatramani wrote:
> > The Synopsys i2c driver allows a user to override the parameters
> > controlling the waveform using ACPI; this is useful for fine tuning whe=
n
> > needed to make spec compliance. Extend this support to the device tree =
to
> > allow non-ACPI platforms the same capabilities.
>
> DT has different counters from which one should derive these ones.
> Can you explain why existing bindings may _not_ be utilised?
>
> Without this very justification, NAK.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

