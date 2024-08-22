Return-Path: <linux-i2c+bounces-5664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA7995B50D
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8C502890E1
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 12:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4061C942E;
	Thu, 22 Aug 2024 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STdO9ocB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96BF1DFD1;
	Thu, 22 Aug 2024 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724329940; cv=none; b=GXZR0++DXhbiWRPuiZLNvZBKXR0q5U2fEO9zGG0lJci2yUj4VPT5BOZO6waaWm2NA8RpfzT+XZvBbYagxphDaqBa6DiGou8Q+wR8j6otRMP9xv8IdMDRpAqVVOCQ9HYnci4nK+TF9D0ccGaoebJHt+0kz8WsOCkUE7tTgBFTHGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724329940; c=relaxed/simple;
	bh=3af2BVUg7wf877z1PfuGs3wFXkF2Hf6gkN6iUlwzOPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUDhnp4rB9b4gAW+yo+9wXT3m+MXKVxy8ftD+tn42H9xSU013jVliiuNJ/DR5r2UAB9gAJEIjGpK3kWTcQl2YCkDjLRWajeDANZTtoWmyIaAZPR6wKPQmjErNj2Dq7G61X4Emp5UZH8VHsNQChZwg3ltuF/w8+hZOH6ugTeRH7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STdO9ocB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF54C32782;
	Thu, 22 Aug 2024 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724329939;
	bh=3af2BVUg7wf877z1PfuGs3wFXkF2Hf6gkN6iUlwzOPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=STdO9ocBpTjzpKc8UC4eKGeTy6TjNmDSlWh9cjUoEzDxaESh2iNtis8wfxPGAkMVZ
	 76wEdNXGmhRcmra25HKud7KEnicPW4ToYN0YAxLTd2dL/3KQAUUeDwvwIykOZWnxuI
	 JbcPxtTSYjcQNngj7VufVPWLMY23zng8VmBY2tK5PX3unKNDXIoe48couPBQl97QEL
	 UWxSuEX+KkiLzxErvdzvaPx8CjgzFqIVdv6PPflokB87v+RqjmFWf3tRwfjdQdwm6Q
	 0TVKKjREqlhDcDFqtgcVtBf+qvz5vMByRv7lGQtt/IHV1A3xilmueBLcDZiEMtbIwT
	 IOQhypjKqhXPA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5342109d726so74522e87.0;
        Thu, 22 Aug 2024 05:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOcMUHOAWX1UtM0fMHEUE7/1VVKEvBEJEsiv9vjStFpanXUdHrBjc3txABWgg+b3QCpQzA0WuHJQG2@vger.kernel.org, AJvYcCWoXGjqublbXyNRytC92WAoWx0INM5FF92qDGjhtdBcL3xUxpF7K54h+xbOFLN5zbYiAiatJqYzpgDty8IV@vger.kernel.org, AJvYcCXj6Fvgm9u/Q/cxlb4XZ03QHGDA7LdirnjOdXRDmCrF5M8oAhsAnw6oFg9lLVfjxD1uCwqnkE+D+uCx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Cp5bZGmqBWXpP5Y3k2YzOo7aiYJHkFF15az2oYjVEr8Sm8Tl
	zxpwXAbvcYEPD29O9+vLhVkHH4WnzEmsx14yjSNW+iVyhvKLAs7EqUE8GpUDpPcoJOS+6k/PzhE
	w16sPsChlf8EM1OfK1rY5J9XXsg==
X-Google-Smtp-Source: AGHT+IELJMuJDkhpPsO12MEEDtrpTV6xfsgInNXMN2DkC/1JY0q8qFL3c0BlEZIxWu6oS9dghQSXPb+CLV+6LMPxZ6c=
X-Received: by 2002:a05:6512:1095:b0:533:4517:5363 with SMTP id
 2adb3069b0e04-5334cab22d9mr1028392e87.21.1724329937988; Thu, 22 Aug 2024
 05:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-2-wenst@chromium.org>
In-Reply-To: <20240822092006.3134096-2-wenst@chromium.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Aug 2024 07:32:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJuiB8+PdH9SVum4CTNb8uM7Kzt3r2Y33yNE2yMGFVbug@mail.gmail.com>
Message-ID: <CAL_JsqJuiB8+PdH9SVum4CTNb8uM7Kzt3r2Y33yNE2yMGFVbug@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] of: dynamic: Add of_changeset_update_prop_string
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Saravana Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 4:20=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Add a helper function to add string property updates to an OF changeset.
> This is similar to of_changeset_add_prop_string(), but instead of adding
> the property (and failing if it exists), it will update the property.
>
> This shall be used later in the DT hardware prober.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v4:
> - Use modern designated initializer for |prop|
>
> Changes since v3:
> - Use new __of_prop_free() helper
> - Add new line before header declaration
>
> Changes since v2:
> - New patch added in v3
> ---
>  drivers/of/dynamic.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h   |  4 ++++
>  2 files changed, 48 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

