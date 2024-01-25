Return-Path: <linux-i2c+bounces-1449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F91883C173
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jan 2024 12:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F69CB22D5A
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jan 2024 11:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4732736122;
	Thu, 25 Jan 2024 11:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="KjTozkX3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9D33CC8
	for <linux-i2c@vger.kernel.org>; Thu, 25 Jan 2024 11:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706183922; cv=none; b=a98SrCMWW8EF6sqVjKztwMPE0SKpcxQDIBNhWRRky2XrAHHnF7vhf6wYubUJEJnWKmDharfNucmhiy7sC2r/t68DG6HrSm2xIeP1uoIlI9EUizmlJtviYSRyV9JeHqfQ5S71jFs64N5vedwQ4kcknFWNdUWd2pxVafp2k0XwC/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706183922; c=relaxed/simple;
	bh=c1MXNU8fBQIq7CZAvmDVQrraCezkC83dzdTmFADzH6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=NKvBBhBpY8KXf3i8Pf14fif7Npd9MIu0DiTBW6eY/MFnzjdwfmv/lHDPXSg6UPgL4CfEK6gm9+85KsKYZWCE1+iVS5nr8fgXknCZUC6PiIUx+GEHp2pnsYt0oMad3gi390Crz78RRcQHDME8gtJbLqR6BdgCZVn5TLJ8aQFarLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=KjTozkX3; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5cedfc32250so3719334a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 25 Jan 2024 03:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1706183920; x=1706788720; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c1MXNU8fBQIq7CZAvmDVQrraCezkC83dzdTmFADzH6c=;
        b=KjTozkX3byEp4c7Cm9xbyivUYjZgNidkhHhNTgnASbYgx7RfDW47rOxGp9sm2SUFsR
         0btAmWE8iK8yKT1UbrZv3CwN/Ut4n3CKY8EyVEIImjzFWK5IJ+cRoMXNuVrwR1C9TECC
         2kqe/4FW9+U4yKb8uT659zR2V4ignmtJnaOd4dx38v5mFMc+7/vVysYYyfx3zfZYW28Q
         NFQC7wAoFyz7xo8uBz+l7q2RBDHKWrUHg/i9CHBfkzH6uVKpeAbm205xOWXpQIZv4FaV
         h/c8z/02x2SkNOPBkVRaGtyMFQWrHLKjEOnhlyelNb82F+AWomQLZYPgNtK91LF6J0Db
         3MMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706183920; x=1706788720;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1MXNU8fBQIq7CZAvmDVQrraCezkC83dzdTmFADzH6c=;
        b=b0crUWTq1ynBG3ikM20MNqKTEwWMtsgkQTw+eifqvtCxX8oaHSd13eKPjmK1uR9ezQ
         x4+gri2taUGWxfrX1NqcZZ/PMImCenPt9rIa7xuG+5hU0S/HkR0bn2UOcKBNuryriv3x
         qwlyoUHbDBY3OCTfrCJLCwcdbK3QzZ0TgZg/q3rLxpPXoHLkjjPoOnePt+6GmtV7UKbp
         9Td9uKsgGIs0zvtqJGMmWHAjC6H3WBXJehqx8QEcYUdRGYdUzw+S02mXpdXXUIN3BaHh
         Y5ohNMQiDhHCGFhuxZQd2DA5wwLlgrbuM2xH3rXMCtlwIkFAfXNUf7A9bs71fv4V4eF+
         flQg==
X-Gm-Message-State: AOJu0YwdOuCdXndOkr9mT7TRR2E+MY+IEY3aA3tEJc9ZL5HHUmx1p8Ff
	WoXx6WgMWI+IHl+pHQeQfBc89/uljA54LuFxCi+BimVW9I87xVpK+ofDrDeQsbI+w09YUX7lacI
	ntjU6AeP8N1z5nn3iwXvct0d5tKrsLvfoxEpNOA==
X-Google-Smtp-Source: AGHT+IGVGqvZTn0517bIq0KM9GtuUE40zBP+m/ZFjGMQb49WTfSmNYb/qaIO9kLZQYy7D4bbUFW9PXU6IfiojJjRAd0=
X-Received: by 2002:a05:6a20:b809:b0:19c:5e76:d81f with SMTP id
 fi9-20020a056a20b80900b0019c5e76d81fmr628988pzb.66.1706183920112; Thu, 25 Jan
 2024 03:58:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220082803.345153-1-naresh.solanki@9elements.com>
 <ZYNTfKLFGrLq8qGY@shikoro> <497e6eda-a416-415a-b468-fe764c14a8aa@linaro.org> <ZYVmZXpwgHJhS8Nf@shikoro>
In-Reply-To: <ZYVmZXpwgHJhS8Nf@shikoro>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Thu, 25 Jan 2024 17:28:31 +0530
Message-ID: <CABqG17jucw00M3PxjAUrmTUuHajFT4qBjNMx5BsN59bsRrDEXQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 1/2] dt-bindings: i2c: pca954x: Add custom
 properties for MAX7357
To: Wolfram Sang <wsa@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Naresh Solanki <naresh.solanki@9elements.com>, Rob Herring <robh+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, Rob Herring <robh@kernel.org>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 22 Dec 2023 at 16:05, Wolfram Sang <wsa@kernel.org> wrote:
>
>
> > Some explanation was provided here:
> > https://lore.kernel.org/all/CABqG17g8QOgU7cObe=4EMLbEC1PeZWxdPXt7zzFs35JGqpRbfg@mail.gmail.com/
> >
> > AFAIU, these properties are board-design choice.
>
> Hey, thanks for the heads up. I agree that these options should not be
> "on" by default. I am still not fully convinced they serve as hardware
> description, though. Need to think about it some more...
Any update on this ? Let me know if I can help with additional information.

Regards,
Naresh
>

