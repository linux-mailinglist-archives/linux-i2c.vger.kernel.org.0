Return-Path: <linux-i2c+bounces-3202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B94218B3120
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 09:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD5C1C21751
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 07:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB54E13BC1C;
	Fri, 26 Apr 2024 07:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYMhTAqo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A8326AE3;
	Fri, 26 Apr 2024 07:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714115592; cv=none; b=LpEBvfhHLyumK3a85MkQE+FjPNZli/pwOegEANpcdY+95rD21JTe6Hzz7iXeClwUMHWg5P5rnuEas+DKn7ulWRKTeMKFlSL96fakTxWAIcUwXUo67Zid9d73NWvTCByK/QuMrpiVXobj1iMW2e4Dj/jdUk18O0aQTVsGSPXehAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714115592; c=relaxed/simple;
	bh=sFhaHOLcmDllXTSZg6+C5j785TZxx9YJrqSgUoHLafo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mF2980BAaP33MKNpZ7g4IKgP3GkgCWzFX/DxNylc5XLb4cxlKMj0yYP950PnIvMahBuO3Rqj3gP4Q2VfQtCqLZ29Bcxu1B6kd2ZeFxECwfx1WmhwVGWThXHXpGGSj/mgCQ3jPHzLxXZCYkUUVTdui99HuzMI8dS7D5q4uiDW9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYMhTAqo; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2db7c6b5598so22510531fa.1;
        Fri, 26 Apr 2024 00:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714115589; x=1714720389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFhaHOLcmDllXTSZg6+C5j785TZxx9YJrqSgUoHLafo=;
        b=lYMhTAqooCcBg8P/xeHrppajBIRYTqHghMzO4aA/2ShF84H9MOIuFgQ33EkcZEWMnq
         dbzRggWL3d9bqMk5fX/2gdjrA+LVsbK8IvPL1EpuWZsMK+6UzAwjNClNW7AkNwBBBEpR
         HzNjAr3RiXk0ZyodGWm69RqOthK8f+0PuUEwSLzLk3ukqh322DZ7gjOYUseeQU+1fqBX
         5YeSiN9OEqVAcIeQvc31vUXk4POjBZ1gYywbt/rZKy2OXrx8icmtglSGz77WlqtXgT0q
         /laJ07g8D8g29S4hnaJEd4pFg8CwCq1rpEuqx39/9h3Aq+wKO4YjlgEMRViJvEvA/0Z7
         UYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714115589; x=1714720389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFhaHOLcmDllXTSZg6+C5j785TZxx9YJrqSgUoHLafo=;
        b=mklMjEEJ7lfE4Jbxn7+jscaWGTA1MmQaJjr3fMhe+yH/DhAZ0jHt5NcXKMolKDSOKe
         BXDBL3rRqeL0s9jbePvbOIO8PEcnpk0PQfEqjqmhONoxsInaIFfeHtg++9kcnXsoK+iC
         tYwB3TsEIG/LAA3+b6m9KWsTsyJVop/1/tL7edz6oOlq7nrXCBbD66vlITw1apNZeSKr
         n/ap7JJX9ftdDlJXzFJ0hz3LV6bnzoWLaE1e4qSo9f4N5hjQSmm+NFGaQXwwcMmVYQfx
         cpB333s8Tu11WZgMB1+fgYhqZZddK1tNt6IPM3Fi0ncCYRZYc9wmNGzSdVWwmeh2vW8J
         8c9A==
X-Forwarded-Encrypted: i=1; AJvYcCVGzeiNhDnJCkBT0kho+qjJNHxeeGfJV+1aEby37k4INYLQUwRDJ/yThYXsBuMN6aP0hQv7249cg+329ZbWKTpbXW6H+Syq02hP83OeCB+8gjpucNdhpXW1j82RuIOzHTXJqpek6/oP9Hx5vu06zw3LaOt2Dv6CNxdLSU1EVaql9zjF1hmdGfDAlkgdp9wO/LGbWAS88iUkuoxOlgD6XulJFmmzGP7MiyckEmXZGE8vxfJRl5I60pAoYUxA
X-Gm-Message-State: AOJu0YzqOCL63nrgk8mJrAPBkdoH6o8vqBEXlxIGB51tqKGVjqgSZeub
	9xD7HaKEVqg+rrXR+GUvtUp/MT6Ci72hQqbsr4Qw3wMX14U/iwtyBB/2UPXUDtA9cGFv3q5miZm
	VjXa8wIlf9VfkKF+2D5Ng3UHKzDd2LA==
X-Google-Smtp-Source: AGHT+IF+jwxiGnk7SLvXkvdKC9ou42iN+pIjSlgZEuLsJB2Hp2M4N+skA+TcxbZh6MZquCN2YFivItkTlGo/yBZAHtU=
X-Received: by 2002:a2e:86c7:0:b0:2dc:b1c7:514e with SMTP id
 n7-20020a2e86c7000000b002dcb1c7514emr1088930ljj.8.1714115588956; Fri, 26 Apr
 2024 00:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425153608.4003782-1-peteryin.openbmc@gmail.com>
 <20240425153608.4003782-3-peteryin.openbmc@gmail.com> <4e329d1b-fad5-416f-b0ca-55e8c6c3394c@kernel.org>
In-Reply-To: <4e329d1b-fad5-416f-b0ca-55e8c6c3394c@kernel.org>
From: Chia Hsing Yin <peteryin.openbmc@gmail.com>
Date: Fri, 26 Apr 2024 15:12:57 +0800
Message-ID: <CAPSyxFQcKvpvO2-U7QPjrVTqam_bQ6OP8VoomnSbmEj4g7uDVw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: Add infineon xdp710 driver bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Charles Hsu <ythsu0511@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lukas Wunner <lukas@wunner.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I use b4 download and apply it, I think it is a tool issue, I can fix
in the next version.
Thank you for your feedback.

On Fri, Apr 26, 2024 at 2:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 25/04/2024 17:36, Peter Yin wrote:
> > Add a device tree bindings for xdp710 device
> >
> > Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
>
> That's not the tag you received. Please do not modify the tags. Quotes
> are not needed.
>
> Best regards,
> Krzysztof
>

