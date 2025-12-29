Return-Path: <linux-i2c+bounces-14848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D9CE71D4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 793CA300E169
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9158C329C6D;
	Mon, 29 Dec 2025 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZK/XVsC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BD0329C5D
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019632; cv=none; b=cy4L7CJrJe1MATQDr/I0HNX1bRGfHJ+9L58Jr2dvh89jRoWi+KfTxOQqDFv4Gqx7Q3pkRonVaRioVCoazJZz8eyFs9TkRzNI+Nu978n09InVx6TpXtrrvTy5PE7X1F6nYpePwDvIfMlw31oKiZagbfAPdVfqxZwNJRQWZt2QI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019632; c=relaxed/simple;
	bh=0fdYin/a1kGKTO0aBJq/0xsRm45K7iupOY7iUNqRRJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPsVrcJecneSent2kkIa4CctWtCRkopZLdSoCFKgxIEno46TgMiwRQtvgn/fMI/Q4zhJ+5NPgjAFLNSHOXX1kTLn5ShTE4LDlRn0gDk2AAFBgZH8fpmH9GUJyDzXHoIrT62W6+H6STpRSeTNc/WBcMiVi8m4pAh3s0HiIbvFBIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gZK/XVsC; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6420c08f886so11087918d50.3
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 06:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767019629; x=1767624429; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hiFIGGOCel6e4RtTn/5DW6H0+gmbweG5rl/mIaIEv30=;
        b=gZK/XVsCELIw+kf+fegZRFaWFH8spENIhMsxFJA+BlEMdUeN7lmgs9xjk+xjOMu8r9
         LuMgJ12OEOjhLQCbXsljPAEAL95CE9jsH0C59xbNv5GR4wyoZrx+saA1yhMQgr+mA5SM
         ECNv+N6QlgdCRCP52QCHyZIi3QpkwWubtYi2JnIreHqCTEWYa3Mz8fHipWe+jojkeeqO
         t98ky7n+6/H/F17HzZsX5AwyKI63KX2fiCenajVFCiVpQIHnt5Kyq06SXY+gr+vH0OAK
         srIthZ7RGMnHpSLjAWxQALybXyadnZ63Iej55QQm3efWV8MyC1877OC2VyC6YRi6oEB/
         7K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019629; x=1767624429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiFIGGOCel6e4RtTn/5DW6H0+gmbweG5rl/mIaIEv30=;
        b=mHz+N8LAFk6RoPHpHaeZKkX69JdH7bbj/P5LVwxTHzQuWxKPxE0aeECskUun7nO2kR
         gpkP24NS6dVE6lH17h2b5HStNIz7bB4Qdit1DlkHGs4U/zQ3WBLuSrtAEX9Es2FASK/L
         xjU8tIqH0FbUKlBJpM8wMICs9X4PU6TkeuzBE3x8kF/veAVfSgVxMlmz9gJBtRpVuVek
         CO3+5RnEqn9z/ceCwYrJrrZSBnhbRhLkLnXOstbqJg2MdV5L8IY2emVeIt4DzWf26XrW
         jeWu4HflYtghr35TtqRWF5g6mS9Y7ixze9Luc7xeQtQ7AWmGsKgVJgXV3Eob/VaP7DLz
         y7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEB1XqhyTTpAVszPbHuStnor3EQHz7qI/ewI2dp2e55J8Cp/SdG64ypDeHyJyTxailV5XroemOyb0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6d7KbxvgqQ7KX1GtWMEMp4ABcnpzrdhXf5wdKCssgFMIK2M1I
	R6J8S6W+WCjb9HOvOH/jLVNbXbhGbzRk5EX1Vg3ui1jjH55HiuFq9vc1c2XmjYkFn3ANVcGDqhG
	YVBTX/mAjOCEUCsOBUIYz8NiZtF5yGLH42Agu4CociQ==
X-Gm-Gg: AY/fxX6cenwNs6Vq3yPbsLNh+e/DHvD/oMmcrIQsllPH+sUOMcqjT0PB/OHOGsCuFSn
	B1w0QdVevh44FAE4docxvolaGjWvj4QSvrF1j5RPJUzIg8Hlpr/dZRIxMH3FgS8kJbqM2dW4ufd
	ZIPIbm0Kmwwlc0q3DhUlH6Cc9eOV9dhtZoPHX/dPwyFDT4lU858sg3ndVCFhwdkWyKDCmwiQWxs
	qWAXG8YcWGGCioyw6R91AdkwCtlm5RZR8+5nv2bXFfW8F3TJ/6Sy2G3xcua9J5TusexOab5
X-Google-Smtp-Source: AGHT+IGO4whynDnDczZe5aUSFNc6rZ7ClmyTEypWHVE9Jxyg/qzrfMWaETUGVpcInjLrsVhW/aWOBEshOk4ENImI9iE=
X-Received: by 2002:a05:690e:1881:b0:646:7a21:f05c with SMTP id
 956f58d0204a3-6467a21f232mr21185393d50.50.1767019629379; Mon, 29 Dec 2025
 06:47:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
 <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com> <CAPDyKFoYd3WKGrjD3DEzZH8EfgZPmRkrqL=rdoKNuAADrvz3Eg@mail.gmail.com>
 <20f2128c-c6cb-4b13-aa08-b93e540f5bd9@solid-run.com> <CAPDyKFo2jsV02qSDBSZTewJjV09AMO8iETU5Uxqz+GBnd0JY6g@mail.gmail.com>
 <e8b0579d-21b9-4072-857b-5afab92c42e6@solid-run.com>
In-Reply-To: <e8b0579d-21b9-4072-857b-5afab92c42e6@solid-run.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Dec 2025 15:46:32 +0100
X-Gm-Features: AQt7F2qjavw22v0M0v4JRnBk0tlNXPSxJSyNw5ogCiPk3Bm42fj5er9DVY64ELg
Message-ID: <CAPDyKFqN1Yq0atE6YaeigzR75n1Q1BSU8JjLno=ioUBwN8=FSQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Dec 2025 at 12:30, Josua Mayer <josua@solid-run.com> wrote:
>
> Am 22.12.25 um 15:47 schrieb Ulf Hansson:
> > On Sun, 21 Dec 2025 at 11:38, Josua Mayer <josua@solid-run.com> wrote:
> >> Hi Ulf,
> >>
> >> Am 17.12.25 um 14:38 schrieb Ulf Hansson:
> >>> On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
> >> cut
> >>
> >>>>  /*
> >>>>   * Using subsys_initcall instead of module_init here to try to ensure - for
> >>>>   * the non-modular case - that the subsystem is initialized when mux consumers
> >>>> diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
> >>>> index 2e25c838f8312..a5da2e33a45c0 100644
> >>>> --- a/include/linux/mux/consumer.h
> >>>> +++ b/include/linux/mux/consumer.h
> >>>> @@ -60,5 +60,9 @@ struct mux_control *devm_mux_control_get(struct device *dev,
> >>>>                                          const char *mux_name);
> >>>>  struct mux_state *devm_mux_state_get(struct device *dev,
> >>>>                                      const char *mux_name);
> >>>> +struct mux_state *devm_mux_state_get_optional(struct device *dev,
> >>>> +                                             const char *mux_name);
> >>>> +struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
> >>>> +                                                      const char *mux_name);
> >>> Seems like we need stub-functions of these too. Otherwise
> >>> subsystems/drivers need to have a "depends on MULTIPLEXER" in their
> >>> Kconfigs.
> >> Currently the drivers that can use a mux select MULTIPLEXER in Kconfig.
> > Yes, but that's not generally how we do this. The driver may not need
> > MULTIPLEXER for all platforms that driver is being used on.
> >
> >> There already exist a few mux helpers both for mux-state and for mux-control,
> >> and they might all need stubs.
> > Correct. I think we should add subs for all of them.
> >
> >> I'd prefer the restructuring of kconfig dependencies being independent from
> >> adding mux-state functionality to renesas sdhi driver.
> > I understand your point, but adding the stubs isn't really a big thing
> > - unless someone has some good arguments not to!?
> >
> > Moreover, since the series changes the mux-core anyways - and
> > subsequent changes depend on it, I don't see an issue to fold in yet
> > another patch to add the stubs.
> Would this also cause changing all the Kconfig "select MULTIPLEXER"?
> If it is only the stubs - sure.
>
> And then in the renesas sdhi patch I can drop my change to kconfig.

Correct!

Typically, it's better to do a "select MULTIPLEXER" in the platform's
Kconfig for those platforms that really need it.

Kind regards
Uffe

