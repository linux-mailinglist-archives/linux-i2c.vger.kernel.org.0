Return-Path: <linux-i2c+bounces-8182-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046369D7C4E
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 09:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB2782826A5
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 08:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5424418A93F;
	Mon, 25 Nov 2024 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CuSS+IOr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA1917DFF2
	for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2024 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732521695; cv=none; b=aEMdrHSvMp3Z9vnuUpSF8mcI/f03GBfutSeNQQN81d6ct0+gQ391Zjjg7WWdRTSoBlGo9WOqaLuiemc8vPyXncm3PMZh1yBokkGPXUuNJBYUAgtquKDaVi8W9v+hC+EXQFXnakeMehvaIMzogeVZpBjXAJesFhZfOHXdrhDedtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732521695; c=relaxed/simple;
	bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jR2Z0FpP0FODeKCozO+je6iiqqH4KB0FLlBUlOVYPLQ9odKo+YeNZVHF8QkS6nPthYdTmA0PMlxph3HG4ZPO00mfwhzSM2fBPhP/jL4W7ZHVGAz6YZrpuyhut3AoHe42AztcpUBjE9ByuAuvkbirIbpGmqxbmtiL35qZN+toJhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CuSS+IOr; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53ddeef9e4aso1916480e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2024 00:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732521691; x=1733126491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=;
        b=CuSS+IOrIQx0rIr8VG1BvtxWsRUBPsCNNWeT9ImG7exGdPZFV3WP3eatlAU2wKrtIg
         6qLtuTZG1T+NVe/Jx36Va9arXllioyLq+CKXqQypRnKxIttWIS6QmYzZVwq4xDZX2cCk
         zwXI6QzlUVd0RzaUXLgzVJpw4vD8Kx0DofHZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732521691; x=1733126491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=;
        b=WmZkDWaoGONZS2i4MohFYJDaixHLjzcGvMc0ZSGqcW4/2ewu5eYZrTVN+ZcAJJjbyP
         9eXoum0CUBWoMcfZujsUzZoX5Y6L8r8J9slrmAi7WBaImbYWk+7fHiv6OpTReim0R001
         yPN3fFS8lL3vk6KjNBFwqGIPvwRzEpgi9SCwDY56mLtUeF6j1xfiseA3kj8zIk9sfDbY
         yxD885BxfY8VNUVA4JN8lnEh3cPoaLNXgWR4wW6ypFlyPvpXZoV0uAHHhGlwQgMGG3Si
         V9qpRVAd6OJlAjBe23lKwPsVrDr4H/Mlj++T45lDbc+bXVgxQIrkkLZQNBmYqmm944Dd
         2zGA==
X-Forwarded-Encrypted: i=1; AJvYcCUoq5VLU25l0AZpdyClTX29yP/qiiiQiKUdNIMDHXMQBQOouyOklmCV7q7v7bHZFax0Tr2sOborteM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMX5KyX2P8ojjBAzP6VEDZoy5Gba8wZ26jhHg8NOuBirpqF+b6
	9wz2YPBJJ64w+M85tG1sh3WlUrNU+WTpBvhj/YwXsqJdFJhl6dZFJCXZv4EEGSqG4+0GLvy4SQO
	KdgrgGnvOOKx0im2bhBfu0b3UtjS6GeqxFSxn
X-Gm-Gg: ASbGncsskfk2VmFO27CU/nNVAfoJw8ZchNdEJWBbI4Vs5JpT0EckTFHPpbQOcX6lxjG
	Io5WxuuVJyR5Io3rjH5F7s7St8cqhjJNoXREgQk6DNR6GQqFznSioGlUxXWg=
X-Google-Smtp-Source: AGHT+IFNA2YPDB29CKBTPo3ULGX/2k8v0BktEtEySMJsHpFYreImy/VSkDo3YvLTyiyt5hYDcUA3UR4cYjWGNCVrAeM=
X-Received: by 2002:a05:6512:6c8:b0:53d:dd84:a92e with SMTP id
 2adb3069b0e04-53ddd84a93bmr3341455e87.0.1732521691043; Mon, 25 Nov 2024
 00:01:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106093335.1582205-1-wenst@chromium.org> <20241106093335.1582205-8-wenst@chromium.org>
 <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
In-Reply-To: <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Nov 2024 16:01:20 +0800
Message-ID: <CAGXv+5H8YwiTyk1eMSwPLuGw5sQxec4n8OKR-Qa5wz8QGH4h9w@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	linux-i2c@vger.kernel.org, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 6:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> > Instead of having them all available, mark them all as "fail-needs-prob=
e"
> > and have the implementation try to probe which one is present.
> >
> > Also remove the shared resource workaround by moving the pinctrl entry
> > for the trackpad interrupt line back into the individual trackpad nodes=
.
> >
> > Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to wo=
rk
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Hi Angelo,

Could Wolfram also take this patch instead of it having to wait another cyc=
le?


Thanks
ChenYu

