Return-Path: <linux-i2c+bounces-3286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD29F8B50A9
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 07:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B1C91F22F01
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 05:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71150DDA8;
	Mon, 29 Apr 2024 05:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGwh58Gd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DF3D515;
	Mon, 29 Apr 2024 05:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714367896; cv=none; b=Dr1Dq9UPeLUa02aXxNSd+Cwv8sHGjABsRGmgjylfLKcxWJ4C0yUPu6yKY3/77GoArHvvt5C0gilWYfz6F4Zgll7WoxGqQyzP0XR4kYgsZkAYF86kufaGsuPrLK+DTtB182wk9CcDHd70lIMk3FXK5gXxdWRj9H0IENTAvNK5FiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714367896; c=relaxed/simple;
	bh=qooaycyXcEwFMgbLaejo2Eb1UKNs1HunVbSCf0OC2Fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rt84O9ic9r8iHaf9PuDe7lZHyixO1+y0ax+1K7bbEcpcpwxH0+5sFoVYr/PAVC3maU27mMfuxoRZxmU+9nuCLbBZvZRwVGFCMCv765b96R67fC2aeefx5CzG0xccTC5vdaoKz9/kT1+43DbogM0vNV2bJ0OQc4QZDy9jEQrG+Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGwh58Gd; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-344047ac7e4so2801727f8f.0;
        Sun, 28 Apr 2024 22:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714367893; x=1714972693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwGA64C1r1xkHN72jIWxpN8Q71Ufkov+rKTRlObLNLM=;
        b=WGwh58GdErzDEudIj3HXax5XlBlLRk9u2xqBX6eyORwfxKJDGpIZJ4sWYlr/QDIhei
         95Cm7WvsnnokXBUc8YyiXxARr9BAaCNfX+el9v3t6t/xmUrViCHPm4O/07IpjC2aAzUl
         +nhEF21X1gUxqZJBZukQOiPyDRkpSm4ljZgiOgpgRT05WfcMBe7gLaqN0B06Pyi5LOSV
         xNTiKDKYdSCbqE1UQ4H41AXSzymDPapPeWDZMGk1BRaRFjLec35dMLjf/QRz4K2U4pjH
         SPuzMhp/GBfEARRIGQTxermHnD1SO640rTgahuhBcYiN6LKcejtPPk4JgP0cCdAgtplK
         qloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714367893; x=1714972693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwGA64C1r1xkHN72jIWxpN8Q71Ufkov+rKTRlObLNLM=;
        b=e2N/OYWKwG3HUWz09eJwavaU2VTo6kaD3+bA9QRdC06Y79PXWdpqmGOrxB7G4TpIil
         yuKHx8nNS43nksSP+00XU5AeQvYCZY2EE+D1/oKdnEJ3YSIRyluj/eY84wOzie3D0vVj
         dwuWdSHv3gWSh4Giq4xfOkwtLeVXnLz8NvqePxV7VO/BrNqKSSd6JFVG2otP4UdxTGDw
         Y49NsEy0tjSdz/Ubx21Z6eNUSSq305TXAZsw2wuUDgpHClU4gfUYp9A5iiNfXdefReyt
         qL54bwYnYkznk/xJuLMYQc1w+INWD1thLmW6hga/RujwFnSaecuKde7bEgqLrWI/6i26
         whQw==
X-Forwarded-Encrypted: i=1; AJvYcCWOqc4oqkX3xiH+a2OLseJ430qJbVuJVNz7wkuX66iPMKIkey6s3FoIKfyVhnQ0od4dYBdZrgkDwQmLDmO1zKuiNn/Gzz37K06S+QumPiY1Cz6UetiCvhGU/BkCvJpjU0FbyeQKizCy4looy5Zk+3enhwcRIxOXLxAhdCkOXVUjqmci92R/EbA4JzzYS1Cl5R9jNP+0SB6Y6T8NapLESopKlyyLIKQr7NkLAwkk0zzMNsnf/DjHcIgnAAx1
X-Gm-Message-State: AOJu0Yyx7+pPXdZIxJoHdoSoe8SDlPr8pETVj67b9NC9XHqnvKKOX+1v
	5Rl+c6xRjhn8G/fgPz0k4dCQsV1an5ILBdIKBg8JBgBL8TCQGtF89YbwtBVJ/r1bxXZSAOopnFq
	R+yEvEHJ3uzYKEcUdlTsekPCmqEM=
X-Google-Smtp-Source: AGHT+IEGhQp8Q/vKN8iZGdoxw5OL5JHgh7qmf1rS8+jy74QjfXfT6iSCzTaaqjQQ17BGJclMB87/EJjPCjE7hO5gNTg=
X-Received: by 2002:a5d:6592:0:b0:34d:760:f8b3 with SMTP id
 q18-20020a5d6592000000b0034d0760f8b3mr2105140wru.10.1714367892881; Sun, 28
 Apr 2024 22:18:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429033833.895122-1-peteryin.openbmc@gmail.com> <e6ba7e83-0329-4fc8-a1d6-83a8683cc812@roeck-us.net>
In-Reply-To: <e6ba7e83-0329-4fc8-a1d6-83a8683cc812@roeck-us.net>
From: Peter Yin <peteryin.openbmc@gmail.com>
Date: Mon, 29 Apr 2024 13:18:01 +0800
Message-ID: <CAPSyxFTQw6MVSwO3ab23OQHKVYZCKm1N0k8AGQXfpXGAXDVkqw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hwmon: (pmbus) Add support for Infineon XDP710
To: Guenter Roeck <linux@roeck-us.net>
Cc: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, Lukas Wunner <lukas@wunner.de>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I thought it was going to be applied after I fixed it.

On Mon, Apr 29, 2024 at 1:00=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 4/28/24 20:38, Peter Yin wrote:
> > Add support for Infineon XDP710. This is a Hot-Swap Controller.
> >
> > Change log:
> >
> > v2 -> v3
> >      - Fixed Ack quotes
> >      - rename "microOhmRsense" to "micro_ohm_rsense"
> >
> > v1 -> v2
> >      - Merged patch 3 into patch 1.
> >      - Modified comments.
> >      - Fixed the microOhmRsense array.
> >      - Improved operational accuracy.
> >
> > v1
> >      - Add support for xdp710 hot-swap device from Infineon vendor
> > ---
> >
> > Peter Yin (2):
> >    hwmon: (pmbus) Add support for Infineon XDP710
> >    dt-bindings: hwmon: Add infineon xdp710 driver bindings
> >
> >   .../devicetree/bindings/trivial-devices.yaml  |   2 +
> >   Documentation/hwmon/index.rst                 |   1 +
> >   Documentation/hwmon/xdp710.rst                |  83 +++++++++++
> >   drivers/hwmon/pmbus/Kconfig                   |   9 ++
> >   drivers/hwmon/pmbus/Makefile                  |   1 +
> >   drivers/hwmon/pmbus/xdp710.c                  | 132 +++++++++++++++++=
+
> >   6 files changed, 228 insertions(+)
> >   create mode 100644 Documentation/hwmon/xdp710.rst
> >   create mode 100644 drivers/hwmon/pmbus/xdp710.c
> >
>
> What is the point of resending this ? I said I applied the series.
>
> Guenter
>

