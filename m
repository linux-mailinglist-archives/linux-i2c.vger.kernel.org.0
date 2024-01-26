Return-Path: <linux-i2c+bounces-1479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A5383E421
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34196B21547
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23B624B26;
	Fri, 26 Jan 2024 21:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1sHRgpK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6C224A07;
	Fri, 26 Jan 2024 21:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706305385; cv=none; b=Vr9Na7QjitQ3aDtI2IKxWHT8KawBOW+lbmdH76Nu9QT0vIADQrZ8w4kksQT/Wt1T6H+XAGqDWFvZLRjON8e6PwA3g3VG3vc6no2tvzTJK5LLHt2aMshzLK4bFGT5+Br5UuP3SFByGEwl4knu+xYmQ6isQnm2FeX824PIXRyUvEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706305385; c=relaxed/simple;
	bh=l844N/dg8GdFFFpd9Lg/s+HDI1ZVzWfEpP4x9q44NC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ayFlDJOiNOGfUlWZlaJspN7X+EXGdeM6Gd9FhgyY1klgHMPmWYDXNdKS+f95G0l7ZvInQKRRwXU3I4joBbA7G2GWWRZdK8ZWCOQKFQoL7hdLyY7cU9UF4YIcrRncFv0rgcBaHkyiudkFu2Q+QhcIWZ6uVJIV3IgHcYnRf3HFvmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1sHRgpK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33adec41b55so804016f8f.0;
        Fri, 26 Jan 2024 13:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706305382; x=1706910182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCY7DfVxPDzCt0r7rxE9b/4fx28xL+DoQHrlqF+MZ08=;
        b=A1sHRgpK39Uq6rg8KTkxr9YA0BsM9YEh9V5p26KCfW7aNLPdq1MXk/K7pGfl1Uvh2a
         X7sOteUh/klIzaXML/yR2diledzH9jvA3dDEJIj3VH/9KQPHkA1dHjj+o7QtzTQGNGNF
         5tvoSfqZrRbmUYQe8VqdoatSnXcu1cEPy9ea9tcWknfjyuUSPbOCitugwGX9o3ViZPWl
         AU0rdKIRIGMB+T44gBpTfy3fq3KguGkHzjloXIsU8woi+10+wDHuUz+T6a6nVgwgT3Ds
         O5USX4s1vQbQFTQ/kCJUQ9d/5gUj/n9UPKpXg+WhqjgVnJpDUsK/VeD9SfP8MTvlcJ/m
         BvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706305382; x=1706910182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCY7DfVxPDzCt0r7rxE9b/4fx28xL+DoQHrlqF+MZ08=;
        b=EPhRQCnK+P8DvLNRflfTSiHyo17vmPq3uPvwEm7C9w3FmandnVzNfCYhAj6LS6z38u
         50xfTQGCGa2auboS//+ZAaeWoHrPIWpEGyq35iCyalGhCdhW1YI9l9ZjrqEJK3+YGEQ1
         EfgCJnXuCwbJIhKdWEI4Rd1MmA3mOg43Xu9+7tdrPW57bRzWPFhbCWDOS6mZrcTh9hnz
         DoNDln+Va/tx8ub4uAHt0d75tI+vzJFxI/MVnTu4Ifye5QPJl30/394uAI8i/jBUHI1e
         hzNR2JqGbyScEbw7L1NYedndxmxVmGXlPbyssAzbgfY7DfHfs5RneJnantpVW2fhZkRh
         h5Cw==
X-Gm-Message-State: AOJu0YxoMdKVTno30xI5h29YarlUi+mWyOeu6ACtKEa2T+mviLSWF8jX
	YezPBS2/kEdnRTsT50SHtb8Cex8TTRCx8k3Bmp2ySWv2U3GeXqWfYCgEd3VNEdmzzaqx2EZxS5N
	rskgPxmFDGRdSrTOUxHqOsKhhPK8=
X-Google-Smtp-Source: AGHT+IGXCFdU/1d13+ZL3B18u4Okv5jOUq1bO6J9WAzacX+znmFb/mlBJZIwMCKI9bcTP10UqXDA4vMuveB8Ugll31Q=
X-Received: by 2002:a5d:52c3:0:b0:337:be12:5846 with SMTP id
 r3-20020a5d52c3000000b00337be125846mr128038wrv.163.1706305382206; Fri, 26 Jan
 2024 13:43:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-7-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-7-8e4f7d228ec2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:42:26 +0200
Message-ID: <CAHp75Vf3HUYYkMAmRH9V_5S-HOOm7Wv+hVgRs7BbVJeSDRgDrw@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] phy: ti: phy-j721e-wiz: add resume support
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 4:37=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Add resume support.
> It has been tested on J7200 SR1.0 and SR2.0.

...

> +err_get_sync:
> +

An useless label. Just return directly.

> +       return ret;
> +}

--=20
With Best Regards,
Andy Shevchenko

