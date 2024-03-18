Return-Path: <linux-i2c+bounces-2390-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 258DC87EBB5
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 16:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D45AF28198A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 15:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D214EB55;
	Mon, 18 Mar 2024 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPH0kgji"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591894EB3D;
	Mon, 18 Mar 2024 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710774578; cv=none; b=cAvAT256DpislrBH9fbOUHF1bGkCDTu1ijkHHJM5tHRbLdvWcDeqvmh0D6glfI31ZBRx4i4MMV5YhAFtC28dzPaJ+Opk5bnRyYNOr6OmYNhQf0+8g0eQlJanORfsOYCdMNg/6El84PXYk9Bs/51fkxp0rV5KJWeacxM/JEPi4ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710774578; c=relaxed/simple;
	bh=RVZ6WcRCz0GZsj3KPodHOeWYk9mSNq77l8mgUMPuTLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXXPgpEO0+7yT57PXznX8aAxDh4HaFCaNSPczli8wbjqZjU4ab4Wj9S+nbddOXivITBVcKTpvVzrjLVJNumsW8b76Anve5Tu9o4egEmMSQtlCV4J/VrAk0i3Z2FQSyBKyF+10DR8gkgYkx1VqOzElzx+RUsXdbHgWdIcS/Kesk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPH0kgji; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-221822a7dc7so2579280fac.3;
        Mon, 18 Mar 2024 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710774576; x=1711379376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVZ6WcRCz0GZsj3KPodHOeWYk9mSNq77l8mgUMPuTLE=;
        b=SPH0kgjijJSHtfENI+H3AJRQozJrQgCBfIf5FdR60PlMmGKxamdTuxPzhvEQr4RYyQ
         TD/UhN2H5feOEskxsfpDe6x5oUh+SaY+S03LolP+urXfGYZMdekmC7+jy+cHxYB7vtp6
         GlSSg2vca4/nc1i/Mq0na77FvH4VgbuxjUvCccF8FgkvrIoGuog1VF8oAA4Q35zXc9fB
         rLMz/Z85MOvq3wZBZFr2/qSDHc8VtlugDV4INWZU6MPPJ1hFv7untk2p2LL1WsvgKi0H
         7M724iiGQNqEzjhnlQTzJI4/upQOfyM9lwJq/6GnI+I6AE8ITpIsca7zpKA+ryWHqcle
         d2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710774576; x=1711379376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVZ6WcRCz0GZsj3KPodHOeWYk9mSNq77l8mgUMPuTLE=;
        b=LyBTWTGccwYRZom4pLlgf6xhIZWAilQ+P0KoRZPkeC9uSGw/dGCzpP8VG2hE8BHeOu
         0XIYeHEMeIfktbuxzDOOIPBhMEhh2PUgH/eGRnmcPFCoI8HRj0fdUsQXblRP8G+1QX3j
         zB2So2jGuFAZOvl0u2Xai/Nu5ZLjikBNRPGkzwlnVeK1rsZGv45NP/WJlL1NDeG+Byt5
         N5Tsy+nn0wZft5xCnwonX7Ow1fV56LFCJa+iDKuMTjcTnIyiYYZEZqR3fOvLvrM8hAFK
         cXk6PXmcQ+aivqt1Tlm+NExud0CrIZnJdW631rDknFZ23HRo+e+VRdGztUxzdNGS7suW
         /Nlg==
X-Forwarded-Encrypted: i=1; AJvYcCUmpQbwXcGkVTVUvLjrCjz0Bix6Otbg/iL2X2Lw7vBo6jHuP1bldxaTHSOYW5aqQgu6I+lWqrfMOa8Tr0JMg1auAt9ZDIWGau7nHfRIrWcldjQRh4Q0slJcAhOIik4SfKC38i6lgBDDDzn0jC9H2+LC/jy1505rIEgrC71DPgMYdwfZ3g==
X-Gm-Message-State: AOJu0YxpcjX/aZFnMjJfb75wUpqt6FWtkMczaqRHXndENfTkf5PTzSwH
	kSvdIGwHVBubYNYS815BoO3KKKO18h9I/Ufq7oWab0uJq3DyBm7GDLrXYyZ4UHdX5pwl2qFe+kq
	aUsBgQ03vJQqU2qKyWje6/yVkwrM=
X-Google-Smtp-Source: AGHT+IFWRfZFllmVa+XahwIMCXQBAwA5XNnRHBjx6aEbdcdugUpjtP3x63gtCLCMbnyfk3UsJK8JAPQX47E46Yh3rSg=
X-Received: by 2002:a05:6870:3281:b0:221:b4a5:e732 with SMTP id
 q1-20020a056870328100b00221b4a5e732mr14572704oac.34.1710774576287; Mon, 18
 Mar 2024 08:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318091911.13426-1-animeshagarwal28@gmail.com> <20240318142324.GA3960676-robh@kernel.org>
In-Reply-To: <20240318142324.GA3960676-robh@kernel.org>
From: Animesh Agarwal <animeshagarwal28@gmail.com>
Date: Mon, 18 Mar 2024 20:39:25 +0530
Message-ID: <CAE3Oz81ez-d_yL4xQRS-Y707ok--3vFK5FD56m3r+PGZuUMFmw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: nxp,i2c-pnx: Convert to dtschema
To: Rob Herring <robh@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 7:53=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> Doesn't quite match the compatible string.
Will change the file name to nxp,pnx-i2c.yaml
> These 2 are defined in i2c-controller.yaml, so drop.
> Drop unused labels.

Making these fixes in v2.

Thanks,
Animesh

