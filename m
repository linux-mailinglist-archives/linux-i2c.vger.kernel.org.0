Return-Path: <linux-i2c+bounces-12109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517BBB1872C
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 20:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12171AA07CB
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 18:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8728627C15A;
	Fri,  1 Aug 2025 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbzEz2t+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC41188CC9;
	Fri,  1 Aug 2025 18:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754071807; cv=none; b=nnY6itK2KSgdTHizQo0dkmxuKMbHc9Vk5RFRYxH3nvPRN22z1FPmsYNfkBpTLMcO/a/JdEkU2G0eMAa+D03VV+NectftkmIBUVNUJtqLENWFQnKZSWmZaFkG6AI5c+Aq7bnyJapop2oWtG+B33xf13kPVH3ev2zx4uYlyy/Fxl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754071807; c=relaxed/simple;
	bh=Gvasecl1j+vZklWoLagG0CgLtJclQwQBokOZMstnbQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1Y8UvQ4r7WQCrPUrSn0g87PlAcWqNZP2nv1to7JaO7lhtawfUtKRuV7p6A5gSpxu6Js9Dy46KmWl+byzkp7HTeHSHUsErYS1EXLhKd3j7CWBF18jh/yEuztBhiEZZ6x/Ci/PzTv0aoYeuS5xiHqnLRCXcu9XY1j8549AO2t1Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbzEz2t+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE208C4CEF8;
	Fri,  1 Aug 2025 18:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754071806;
	bh=Gvasecl1j+vZklWoLagG0CgLtJclQwQBokOZMstnbQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lbzEz2t+osusLbrCDjhXPGDSl4Be6FPW/n6O837z199K0iSiaiaUQ4pEJzK27Cb//
	 kWakTKN1BIXkRfxh2CVi/H6hLHjjD5AqcurDDqGc9JG2qUW+2A+aroLuAzRE9WwB3z
	 IlPnL98XFaA6pDTI2DCZ/mkNr5iTQgpYfS8KwnLRwFKO/mXuSlQvWvk2LwhHOngwmC
	 UUUXqz2jJkLHxoxyXz87EZQo3j0LbnXXtesZabdUM7OPqDok5wcyp/ASWwOaHBqqpH
	 +3gIC0Z2YBABkgjVmyLEDqwWaQFxk6/wRY+JR9yNwIPo9sTATi4Zril+I90N0Hy54+
	 9Tug62/FIz5cg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-af9180a11bcso480669266b.0;
        Fri, 01 Aug 2025 11:10:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdWUDD4hLRdiA35txeMcMxY0Ww/cKr0VI1ANT7mj/6iYaOZ3DVGDIIdMI40g6Cgwgns87LSXPmgllz+1L7Cuo=@vger.kernel.org, AJvYcCWNVYDsLfyNPw9x07Ld1aqJ2xHK/q86Q8b7wfbtvObOigVC1mDAflDamgSIFS60dtfhtdj9wvZtjW3xDLQk@vger.kernel.org, AJvYcCWQVkwfxjuwI9LYJrDqY1g1Vz/xt9SeXfPm/KQIiPki/NYnn+eQMqNnX+R0f0/T8ZDu/1bBCrIJjd8R@vger.kernel.org, AJvYcCXY2kvajsCk8a4O/54ExVXjFZUahqnGk6olnsZ9vl9KKKzaByNwuCoVxCUDKSRp63sWZvk1pLcmGP2P+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0TLyuIlGK9JgF62Jm3noZjRvLQBANEfXN9W/XS08avb+8Yvrb
	/hBndM7iY9hnJYk1efqdob79Z+tRjHxuUMUbbTb1y4/c6N0/wqj+4egOQr3H+jwr/vlTK45jZc7
	WrOyJNzV3q+2KQSQxe9xIK7GjrXAanA==
X-Google-Smtp-Source: AGHT+IEOZjY7/v0CLBnxcrJdKlxiNQUiV/2WX97mH4Fg8teaaqzX8PxYfFhCm14UySL1h/i3m3TzRz4x9INodldCP2M=
X-Received: by 2002:a17:906:730f:b0:ae2:3544:8121 with SMTP id
 a640c23a62f3a-af9407b825fmr70487266b.9.1754071805337; Fri, 01 Aug 2025
 11:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618082313.549140-1-herve.codina@bootlin.com> <20250618082313.549140-2-herve.codina@bootlin.com>
In-Reply-To: <20250618082313.549140-2-herve.codina@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 1 Aug 2025 13:09:54 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ=jmXVwjtNCjRpUKj02dnJEz4GHMX2wMRaWw=M+sZQ0w@mail.gmail.com>
X-Gm-Features: Ac12FXyZOFsU_8sFtIcKv6WyIEy-XVGWoFMOuKgE21jTygmocn09boIL1KPbUwc
Message-ID: <CAL_JsqJ=jmXVwjtNCjRpUKj02dnJEz4GHMX2wMRaWw=M+sZQ0w@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] schemas: i2c: Introduce I2C bus extensions
To: Herve Codina <herve.codina@bootlin.com>
Cc: Ayush Singh <ayush@beagleboard.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:23=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> An I2C bus can be wired to the connector and allows an add-on board to
> connect additional I2C devices to this bus.
>
> Those additional I2C devices could be described as sub-nodes of the I2C
> bus controller node however for hotplug connectors described via device
> tree overlays there is additional level of indirection, which is needed
> to decouple the overlay and the base tree:
>
>   --- base device tree ---
>
>   i2c1: i2c@abcd0000 {
>       compatible =3D "xyz,foo";
>       i2c-bus-extension@0 {

This is at I2C bus address 0? No. You are mixing 2 different address
spaces. Don't do that.

You could solve this with just a property in the parent. If there's
more than 1, then it's just multiple phandles. However I don't think
you need this at all. You can just search the DT for 'i2c-parent' and
find phandles that match the i2c controller node. But why does the
controller driver need to know about connectors? Shouldn't the
connector driver drive this and tell the controller there's more
devices?

Rob

