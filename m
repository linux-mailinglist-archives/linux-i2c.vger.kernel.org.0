Return-Path: <linux-i2c+bounces-1321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0CB82E139
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 21:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10E341C2219E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 20:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918651946C;
	Mon, 15 Jan 2024 20:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qt19dkz2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E375A19473;
	Mon, 15 Jan 2024 20:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a2ac304e526so875419666b.0;
        Mon, 15 Jan 2024 12:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705349063; x=1705953863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8RSS6kBkW56tbpViMqYqGAGsyQRy2p0tJi4wBiJqmU=;
        b=Qt19dkz21V/R2GXWp7oDtra0RNPCYrhAsjD74TMAGKgGMm/fGSdwa2qEBBlAdxzwM7
         IrB9zuFEKyXZnMygfOv+7lIbLsKXX4dlSPkfqgJY3PTKCtKbaqIWKvDsXoMyq3V3FIFh
         UJyfvbqQX/rBIap5NYxHKNBLN+gzB2x3nP2+htUvbxeH0OeTgFafvDdSoHqQSzsm4UvF
         B8Ky4VDczkm3Ir6l6FN1fCsBTq81jK+gCa+rZ/qcE57sZwHsOip14PFigUrORjS3O1lk
         yNzihSk7awcmTwVncu5fleBWu2hOw59wRc2cQf38aKA88GkpGYCu5uXNL38kIY9ljScJ
         7y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705349063; x=1705953863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8RSS6kBkW56tbpViMqYqGAGsyQRy2p0tJi4wBiJqmU=;
        b=sMAkybBqbCA6BmvWPZS5g8L9ToetSGeXPp8KqUsNbo7NIYXKf7G4PAlitXIPuc3fEA
         h7guLMYGWiIVKJDdEBD1RTDDbTEbMGr8RpOtGCsgE3nu+JdcczW7XKgKHAL5z0uUdzYf
         kUjRagAGnIwB8BXtwrX4WPLsCXl/Cief52s1ZGHFcRw/FKBEm9cGxd63nAXZcL03Is+M
         /6DuoWKgH4yfGrwUziw81IO9v/hmZzsd3VVod+OT8GQh2qeG1iuKN7ajFlYpx8wrc8Vl
         zMCvEy36kS9S+ouupdoPACImWhyfEEvyZs2xg1/Udi5JWxx6ol0LhXj/MeB++IBiAiws
         ZU3w==
X-Gm-Message-State: AOJu0YzMAHJyD1tpMMXlDw4Gmm2ryRWZ2E2z4IJmveCkHM8t0UsWPRkN
	tC8Iv9WKTbpfxnuyBkLKtSiVzQJ46iKpmcJIy/w=
X-Google-Smtp-Source: AGHT+IFJ3GSf+wjuplgZ/O7AubrBpCxq5ZziDSX/b+fRkPr0IsBfvOcIfeT/L2dW0x0aOspKjHv4GueCmR/QMik45Zg=
X-Received: by 2002:a17:907:d89:b0:a27:be67:1743 with SMTP id
 go9-20020a1709070d8900b00a27be671743mr3863297ejc.40.1705349063219; Mon, 15
 Jan 2024 12:04:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com> <20240102-j7200-pcie-s2r-v1-3-84e55da52400@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v1-3-84e55da52400@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Jan 2024 22:03:46 +0200
Message-ID: <CAHp75Vcr+pSjj+27WmW5GmC_QvpJu3E81C-GjxqdhrCAByevpQ@mail.gmail.com>
Subject: Re: [PATCH 03/14] i2c: omap: wakeup the controller during suspend callback
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

On Mon, Jan 15, 2024 at 6:16=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> A device may need the controller up during suspend_noirq or
> resume_noirq.
> But if the controller is autosuspended, there is no way to wakeup it
> during suspend_noirq or resume_noirq because runtime pm is disabled
> at this time.
>
> The suspend callback wakes up the controller, so it is available until
> its suspend_noirq callback (pm_runtime_force_suspend).
> During the resume, it's restored by resume_noirq callback
> (pm_runtime_force_resume). Then resume callback enables autosuspend.
>
> So the controller is up during a little time slot in suspend and resume
> sequences even if it's not used.

Same comment

->...callback...()

...

>  }
>
> +

Stray blank line is added.

> +static int omap_i2c_suspend(struct device *dev)

--=20
With Best Regards,
Andy Shevchenko

