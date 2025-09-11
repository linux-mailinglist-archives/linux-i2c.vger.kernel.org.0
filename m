Return-Path: <linux-i2c+bounces-12871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C31B533AC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67F2FA821F0
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C5132ED2E;
	Thu, 11 Sep 2025 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FIfIOjPk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F232CF6C
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597116; cv=none; b=pprffLbNFXtWc6hxzTP+8p9RnxVha6yE1gcLu5TjmtykR7Wx1QQ7sQj2Irvp4gbCZz+GlCAfUHloQqexpgvuhhXJck6JgDbCca0Fjd5j3/Fm20bcOL22rhoQQ5etgwVtlL8R5bL0HROngAHtJ5W2FtSo/mV6i8068dHX7naFk9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597116; c=relaxed/simple;
	bh=tvHtynkzdv1a6/2GIDVhvXbYgP7ctogGxu+SLDsFVek=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uv+5Q4eZc116jQEkccwb3VSizHouYwGdupdbUeyNdq+g40EWuAHf/LvFnQNPbzeea2sL0r83vIXI2kIXJknkMPoxbby31kjFZEYSBFFK8kUebdDClPb815Z3P4l0xr6W7oXER6UO1tFwV/q5Q53kLjDj5mKqEBXsM/rpU677uGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FIfIOjPk; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso792791e87.0
        for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757597111; x=1758201911; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKH9Tq5JpqAq1HnW1xohkQd88Pw1g4E8ukSxiOhM484=;
        b=FIfIOjPkSwlc6EbFu6WXdlEpy4VWaKnLjZR6H/dP1XwFlkg+C2xUgxtbIOc1g7yz7M
         GJVAZPqabKe1lAheW1Q+c9zQ2lV18QjU0DIbNJMMk7mVeT9dWXagRHkRqCMbFEAp1L9e
         ejOYM2V75YUgzrxWHgptill6ER5hots1aOG1mrlrP6UUL9RzTQfRpCBKqQLurGZG5aEa
         Jo3yGr7g5ANpqubCjx0vo3xFiN7IFMa+jUikcTnIkfgDdqRVjf9yi6RZmP8BvsoDvQol
         cXlP123VceslaCUvdMGv3JzT2H//oIcQfYpvbh+2O84RpMJeaTtmPhuPkZPOyoCfRglR
         pnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597111; x=1758201911;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sKH9Tq5JpqAq1HnW1xohkQd88Pw1g4E8ukSxiOhM484=;
        b=aZ/AA/zJFL8vAIP14EH2A2oUcCwVUeQc330Wm7WjgWdxPhjmRnpJNSK1wYvMOQQASv
         GB9n4mkkLRAlEzLJd/votpdQq0rphmnyUCtxXuD6FCXdnaAvyBGS00NIQViggaLuPRG/
         n+HbLhDIZoVQosEwEItgma8nfJn3YJ7zUmDKMe29iKdhT1pt/NFSVOE60O8LsNTyriev
         tpOKKIycjmy4vHUjTMIQ/T3YnziHiyaAhoR+gvrZNNjyqC+2aVVEDhjSqGIfZOP4dnxA
         rHbC/MhJ+TUk2gVcEOfpA1PIiYjGRv2qeyZcdOw+rSzCdzbJ1yV6kh+Hi6J+utt+HV1t
         ONkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnkiaESHWBG6epx3268g7/noRZOZ5TNuoGCNVtxYxjHgTixK8AgtGEo7Pee/tp1i0o9B/E6cKr8No=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi/4qpuB/lKTAXqFLOkCrTCQMvk9FZq3hZhe5EC3ln7YI4L5y1
	qxBUl11brK5MsbtvyRrUUyKDkcR6gauIui0VTeKK+qCD0i0SuAI7dl3VUNfqbTXE7BUvT8GQ21Y
	ujQGjwzPhwQwFASuRY0KLYVQXUSPrUYz2phEnAe4MYg==
X-Gm-Gg: ASbGncvnArcAb1iCwBjKMTvPQeoAm01WJAfj/rfB+0qoHCbhdRN9AGnfbAvPeXwlBYb
	MsaSa7nFgyKNRMaaCwH1uQRtMObd4fk4q/LvSpkXhKeEKGFwVI18bsAO+5A5uGgJPzSe2KSEH5Q
	LlbmLCk3dy8r/cbNyOG8pRZjZ2EI8ueItdxbPZNgqlP/Nn0hAWPbPyVNvLDta3ys2Azg9vAAXLr
	SzGS4YtVIKLcS5bueIQ4IWBxLwYNXJbCcWSj24=
X-Google-Smtp-Source: AGHT+IFsA5ZOyU9tpTag4iQY+UEBWc1v4AgFQ6DjU2UnALeCrswvvm+lEztT+M/sSG35UIi0IcRGR77vi6rw6ChMafc=
X-Received: by 2002:a05:6512:33cd:b0:55f:489d:7bd with SMTP id
 2adb3069b0e04-5625d28e732mr6154709e87.0.1757597111174; Thu, 11 Sep 2025
 06:25:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 08:25:10 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 08:25:10 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250908-lemans-evk-bu-v4-4-5c319c696a7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com> <20250908-lemans-evk-bu-v4-4-5c319c696a7d@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 08:25:10 -0500
X-Gm-Features: Ac12FXyxL1zBhnbmQPIz3eBGCsQd9d-c4NEoyZ66twALqJFT9m4E9c429dd_4HA
Message-ID: <CAMRc=Mf8P=4vucch0sAtPNZ7DBB0Kw1hgvP1YLgZ5ZRfusFG-w@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O expander
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sep 2025 10:19:54 +0200, Wasim Nazir
<wasim.nazir@oss.qualcomm.com> said:
> From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
>
> Integrate the TCA9534 I/O expander via I2C to provide 8 additional
> GPIO lines for extended I/O functionality.
>
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

