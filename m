Return-Path: <linux-i2c+bounces-2848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA689E793
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 03:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C33E8283CA5
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 01:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260D31854;
	Wed, 10 Apr 2024 01:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j+KtM6pv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F779EDE
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 01:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712711235; cv=none; b=t6hKSuRk3kvVRjUMNBUlFkww6TL3skjUREiXlibmIJ00inIbANbrZsYJJ9FIx8A2NTYnTzhFxF+CsghS3Onz1GnqyCtMBaGCoor3waw1t3tU7n1qBB2XDqvxACrjsl8fOsm3u4O1ZVrTtzcMtWlZprYK8rwy7CqLrnN0rTaGZoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712711235; c=relaxed/simple;
	bh=qLm+VnepHhI+0yQ/tu/mdPDhXXh30RnD3IF2V76MbZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMRNqhV2TIS1+xqsbRMdMnLPOhgEEPTF31QYVO9GWHblBEYJEQZZC3h/BpfhX/MM8vt1n9FzB7ADBiCXMHJDDc50NnxsiHe4pQYaijVXp+gr0Z4UZa14ucWRwzqodIlz9GXXf4uQgjiccqH6nosHTImvqr9+BRSf5WSsCWrqMDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j+KtM6pv; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43477091797so90991cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 09 Apr 2024 18:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712711233; x=1713316033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnUy9Dgxuu/dnE4qVLvSmNOrCGCLASYP8tq9YkPoGpw=;
        b=j+KtM6pvp+EHNopINMD2RJAGceIlIoI0FdTMk772kYHAizd0+R9dNEMM0LwpwieEjf
         j7ZN14mjgh69kNoGQJ/WApv7N//BaIIxsOez/nlX4QNS4SGAIH6r90Cn+WR8JsxqHlu7
         TFuBRS4AxSPV48tTsHwVpSptISB2WCtyHctDYYcS3/UkvHTzPZKXLWog9dJ96DQgzGch
         9bT7rR3dRKOcDN40aGeb7xFydQSt6FmHdzDuLVBtwQqLqAcfILGdz7KVMIVtKZvkaZq6
         MVe+HvHFnfJJvCLDSRu+b9th4T3aJ9dRG91+xREQpyuxivkDbOZg4KhnpbBjf3XAU5WZ
         FcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712711233; x=1713316033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnUy9Dgxuu/dnE4qVLvSmNOrCGCLASYP8tq9YkPoGpw=;
        b=kHdQOw0bAKhArlw/syaOrqqIwSqa5iWDPKFf8nZCWBA9gZsflKCEgpepERqOlKM805
         Fvspik5L3PDEIuouaUDjP8wQYWwM5CbQHxk1vpNygbR5CzkfTZ7/xD9g73rST6kOqHDH
         4wv1Bh4adPULh87EQSYoO8AyioQKHzOEOGTuCP2zNOQ36IuFbNFmm0ZFOF3zl2p2Kz5Z
         +mkiBrwQDb5sVIULkaoD2rsopWkhFOIQR2V7+o8SyQymb6X2Ap7HDPlXNTXsdNuSjFhJ
         JSS+vdYX0B9rqIAkmX9jZbYiZR3c5A/VaJ8iuHKBItl/9HRLta2SmUiT15uVsh5GRpxP
         ouDA==
X-Forwarded-Encrypted: i=1; AJvYcCXB88zbAAhJkCJ6DZoErEa3A36at6jJEL3wETZM5ivDfgCz8LWytc0it/WbHAashsQ8pdycd+ofBVVt6mE/vbC6I9CKZCGV3JWF
X-Gm-Message-State: AOJu0Yw5xxXWRAnqfcr9pSbuhXFEQVG61t469LHPxtgepXziCmwjeLQY
	V6afgX1WmXd04ZnVnAI2xrweqhk36pvZXS+XzNc7WEhQyHIrQJaIu2sxcW5FH/G+y3YSOWQd3kN
	t2LmR2p31Jy3GGBrgWGwkVz2UxFWvl0yfPl0s
X-Google-Smtp-Source: AGHT+IEnYGYE7m3kixf85CnlpYGzZvRPhp8krudkLaSycG1wisGydnCUIvWGp+zYdJGwFxhq8++4pWL/y3KX54K3Dyo=
X-Received: by 2002:a05:622a:22a8:b0:434:a690:e328 with SMTP id
 ay40-20020a05622a22a800b00434a690e328mr77260qtb.17.1712711232788; Tue, 09 Apr
 2024 18:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409053704.428336-1-saravanak@google.com> <20240409150247.61e30a86@bootlin.com>
In-Reply-To: <20240409150247.61e30a86@bootlin.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 9 Apr 2024 18:06:33 -0700
Message-ID: <CAGETcx-Yxtkdfytsota3AciS6M9UeOaKSRtaHfH5pm60KWVmJA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] fw_devlink overlay fix
To: Herve Codina <herve.codina@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 6:02=E2=80=AFAM Herve Codina <herve.codina@bootlin.c=
om> wrote:
>
> Hi Saravana,
>
> +CC Luca and Thomas
>
> On Mon,  8 Apr 2024 22:37:01 -0700
> Saravana Kannan <saravanak@google.com> wrote:
>
> > Don't bother reviewing this patch. It needs to be tested and possibly
> > refactored first.
> >
> > Geert and Herve,
> >
> > This patch serious should hopefully fix both of your use cases
> > [1][2][3]. Can you please check to make sure the device links created
> > to/from the overlay devices are to/from the right ones?
> >
> > I've only compile tested it. If I made some obvious mistake, feel free
> > to fix it and give it a shot.
> >
> > Cc: Rob Herring <robh@kernel.org>
> >
> > [1] - https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8=
x6=3D9F9rZ+-KzjOg@mail.gmail.com/
> > [2] - https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> > [3] - https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> >
>
> I tested your patches.
>
> Concerning my use cases, they fix the issue described in
>   https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/

I went back and looked at the example. I'm not even sure I understand
that example. In that example at the link above, are you saying
without any changes to upstream reg_dock_sys_3v3 was listing it's
supplier as i2c5 instead of tca6424_dock_1? Why wasn't Geert's
existing changes in of_i2c_notify not sufficient? Looking at it, it
does:
rd->dn->fwnode.flags &=3D ~FWNODE_FLAG_NOT_DEVICE;

Which should clear the flag for tca6424_dock_1. Can you help me
understand why it's not getting cleared?

> But not the one described in
>   https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> A link is still present between the i2c@600 and the PCI device.
> instead of the i2c@600 and the pci-ep-bus.

What do you mean by PCI device here? You say the same thing in the
link, but I don't understand what you mean. Can you clarify what
exactly gets added by the overlay? Please use the fwnode name in all
the descriptions, even when talking about device links. That should
help avoid the confusion.

Also, if you can show what the target node of the overlay looks like,
that'd help too.

> Adding the patch clearing the FWNODE_FLAG_NOT_DEVICE in device_add() avai=
lable
> at [1] on top of your patches fixes the link issue.
> With this additional patch applied, the link is present between the i2c@6=
00
> and the pci-ep-bus.

I know the problem with this patch series. But to fix it properly, I
need to understand the root of the overlay node in your examples and
the target it's applied to.

-Saravana

>
> [1] https://lore.kernel.org/lkml/20240220111044.133776-2-herve.codina@boo=
tlin.com/
>
> Best regards,
> Herv=C3=A9

