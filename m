Return-Path: <linux-i2c+bounces-3280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EFF8B4F2B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 03:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC66D1F21D38
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 01:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F63D7F9;
	Mon, 29 Apr 2024 01:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcrDkfIM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F087F;
	Mon, 29 Apr 2024 01:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714353470; cv=none; b=UnPMFt833+8NmEYxxdrGuU+B4q7KpeVj43ttxtT9PqGlmn11JzxftR2gDZlkXQC9eu0FJifm7UQVCPksG8c6eeDtWR7T0mJJQiDCUhY0906MgXq/nGuj3kwjYudi0tJuYM8wWlcJgjzc86TWbZGBBv8lkpFG19SZoS3eEaDkGE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714353470; c=relaxed/simple;
	bh=UFgBiOOmmXqHEwT+1QxPW0ZTpzeO8YmGhUJOF/GVftQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TAla8KBx+TZraO20LM0gfOEqOhAH8pzACm9EFMku/EhGDTY+BraTheQxnw3dmJoWGAH9SBkjCJJ1r/k0wcUD2wigoAE1ShaJUsRekB/80cdnAWjIr0ezUhm5IvwuDCxNHCrrPXhaw5ji8kKq69CSMezw39uK+1MRvkg044T+cAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcrDkfIM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41adf155cffso29070065e9.2;
        Sun, 28 Apr 2024 18:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714353467; x=1714958267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvYNgy5C9EMP23cxTp8gy/RloSg0mUJ8ULOX1VTrioE=;
        b=TcrDkfIMasQ52nDQGnUQrxZPXyudU+M3rNyeLff0xHs7rXqgdHV3mV0KLqtwKLfrjR
         Qge4WO5zd58ptSrlFfRfYEjwcmm5b8Z4tlMv0UO9EJ6AolWS2mhNLB2XjZ1bGgwZWWcD
         lTJ6NKJZOTXcQIyIxszCwiebq9DIVmZvOveg5AcE27OGP1DtTHJ3LMlj+EKrl8ZJsBqU
         ii40U28BNpEx5YPdLmwC0ln/Th0rhnr8ujWBJdq1IfLGtqo+fdKi1wYoD40uhi3891W7
         AZAQiShJpyJ+KAd7TCUdU0QfwAxtpx/38rFCDoShvdja0iHSERQ7Gre29rhJR101XA4E
         C1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714353467; x=1714958267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvYNgy5C9EMP23cxTp8gy/RloSg0mUJ8ULOX1VTrioE=;
        b=pJGruQwMhec6SGPL1w2CQrTq846o7jB3nB8NCfyEp81GtMtyGTPuSGoVwwPiGadcT9
         SsuIrK8heEAOMMsmxQ3PbtF7e0uQgUVlPFXZ8t8Fx+5sdkmL+WF6n8vW2VL3S6Zkr9B9
         0o742WXCBwuacuDCs//jLZwwrT4J2EEdDK0AGbr2wyKQcR72/S5es+t98FXfAHETdgaM
         X5r/oG4gKXdRgsrCQZPEdgsvLHrXnoyxm7IsbLCokncj3N+wN3JF5CtZ4T7UmAsJ/3EK
         mdPljnrGetmRk42DgMkhosEdWuVDhao704Sa2tjkjNPhCwM05SfamWtTNb9kbJ+bZ9GM
         3D0g==
X-Forwarded-Encrypted: i=1; AJvYcCWt05pIaVUWbLK5zK4CmRAqskwN+RcGPa92qsFN3pkhN9ghsEWnBKrG2YGEqtGR5UKvktAHfJGYTP2+BOqHhTD+V7A/LXGuInH+/YQpA6TOQUQQKxCiYbApsQmHXfIjqetInNAe4YBUbXgKcmd4UGS9ii0L3G7hjeeYHpY0Q4LWuirHVwVwMxVZ5C/Mgrcpy8IU0dXws0Bh07nRpgnhJiyQXjEEAwbxszVG8aJnhaXVYZ1GDsZMt5vgzWil
X-Gm-Message-State: AOJu0YxgyAuSUjdAVo8M+WYX2gADvNQmZf/DDP1RvJgEuC3LPxiPzDeJ
	6jHz3PjWOt5sciE+Ios6stmH7mTG7CKc4nd7247+kgMM7VcMgnl5Fjzy3u3G3iAFWT22elyWtfl
	vO7aYMQBFfS3sN9qcnhNSGKkiRFo=
X-Google-Smtp-Source: AGHT+IGSZmWosWs2d2fEUlOsOzZ5bfdsUkGiCtQDFYJXFBl/M/fwWvsyDyKDf/1W+727A1rvZlrgIV6Vvn05TbsZ0wM=
X-Received: by 2002:a05:600c:46ce:b0:41b:fb9b:d2be with SMTP id
 q14-20020a05600c46ce00b0041bfb9bd2bemr2636667wmo.40.1714353466878; Sun, 28
 Apr 2024 18:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425153608.4003782-1-peteryin.openbmc@gmail.com>
 <20240425153608.4003782-3-peteryin.openbmc@gmail.com> <4e329d1b-fad5-416f-b0ca-55e8c6c3394c@kernel.org>
 <CAPSyxFQcKvpvO2-U7QPjrVTqam_bQ6OP8VoomnSbmEj4g7uDVw@mail.gmail.com>
 <d1cc7b23-32e9-4326-851d-88708ba28052@kernel.org> <20240426-fantastic-charming-pheasant-64f7fb@lemur>
In-Reply-To: <20240426-fantastic-charming-pheasant-64f7fb@lemur>
From: Peter Yin <peteryin.openbmc@gmail.com>
Date: Mon, 29 Apr 2024 09:17:35 +0800
Message-ID: <CAPSyxFSAMdO3LxP4C0nJzcrmUnr-F6QoSocmWU9W7-SgE-RjsA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: Add infineon xdp710 driver bindings
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
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

Thank you for the information you provided.

On Sat, Apr 27, 2024 at 4:38=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, Apr 26, 2024 at 10:20:58AM GMT, Krzysztof Kozlowski wrote:
> > On 26/04/2024 09:12, Chia Hsing Yin wrote:
> > > I use b4 download and apply it, I think it is a tool issue, I can fix
> > > in the next version.
> >
> > Just did it now:
> >
> > b4 trailers -C -u -F '20240424095604.3425857-1-peteryin.openbmc@gmail.c=
om>'
> > Calculating patch-ids from commits, this may take a moment...
> > Grabbing thread from
> > lore.kernel.org/all/20240424095604.3425857-1-peteryin.openbmc@gmail.com=
/t.mbox.gz
> > Looking for additional code-review trailers on lore.kernel.org
> > ---
> >   dt-bindings: hwmon: Add infineon xdp710 driver bindings
> >     + Acked-by: Rob Herring (Arm) <robh@kernel.org> (=E2=9C=93 DKIM/ker=
nel.org)
> >
> >
> > And no quotes...
>
> Yes, this was fixed in b4-0.12.4 and b4-0.13.
>
> -K

