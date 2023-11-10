Return-Path: <linux-i2c+bounces-4-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABC67E7EEB
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9C6E2817A3
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 17:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2ABA3C068;
	Fri, 10 Nov 2023 17:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y9V1NKpK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFE1374E5
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 17:46:45 +0000 (UTC)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2653A21A
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 07:03:28 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-da2b9234a9fso2264925276.3
        for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 07:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699628607; x=1700233407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI+FAc5jUx2iUB/tuWRLdQMnq28TFVaG5me1J01BIf8=;
        b=y9V1NKpKF4d5L3P/DBn4TVIqL66A+IEcNHDf/ocQ9H7cZY8zPVSmvoe8tvcgcNI9iR
         V4mzFKc7bCNSAiFuMPJGTUH3vz0OUfuJTWqL6WDtjrDUBqo0Ysg6EOQw0TCFhQc1AJSx
         9SXmEEP8+wXWAxODqQOTD0L6lSMW+5YkNkCGGz5mxX6YgGV66N72Y61Z/hfBQmOTVsBH
         1SWt95Sr2aSYvszKNB6Vn0MrSmtN/WvBAY2yr/vUHPMVdvht5qU3jK2GM6X9Sr7B1DCq
         cG7cLDVNHb0iWNtXWhRHSI5FAkCK1LrneCA8rW1Sps4SeXtwhGH56uoV/KRy3BQtfBjl
         yEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699628607; x=1700233407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LI+FAc5jUx2iUB/tuWRLdQMnq28TFVaG5me1J01BIf8=;
        b=S+64hvDOFAmY7QKQ/+h6TeSteyZjW2J9WdWqSJENhE5DsDyJQ7Ha4Sc09hlBcs1Hm+
         jVTsswzVh0KQ/AuiKPDtxXY+impyiLcKXudqWdPNsI0XOQ4FmLcvyof2vUsVVf0tCEUg
         PIqQO4k77ffbBHbUiSs9/bDEeL6RujKngFvTS8qbWTos1WHPOvMttjafX5v4tqDr0LHD
         M4PRqhsuJIWtf/UgwkpA9guUm8ZEgeWqUtSKWST0vrOALwofeEYSg1v1KzxuAjCdAenn
         fH7eJdHaQnh40WeqCNY8LyJ6jk+A+bCS6JRVhuAXpnkyoo86f9/IujW5cvyznb3CvMNf
         +LrA==
X-Gm-Message-State: AOJu0YwypMwP4q/d3IHm9pMiGWKuRJWa9oLNnd+599xKvKkS0znaghyC
	ZjxdmCOSaGEljzfVFcN0dmEjk91aGX9wKdcaZBQMdA==
X-Google-Smtp-Source: AGHT+IEQr+nD2hM97g1wEMewiNYcV+P/h9wqI2rtiaJOKCE6z3RIk8Z4M5U5zFWunLk3FdUgIGa/re/G/hYUqKHqlxQ=
X-Received: by 2002:a25:dccf:0:b0:d81:6151:2031 with SMTP id
 y198-20020a25dccf000000b00d8161512031mr7684797ybe.61.1699628607664; Fri, 10
 Nov 2023 07:03:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231110093039.190076-1-robert.marko@sartura.hr>
In-Reply-To: <20231110093039.190076-1-robert.marko@sartura.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Nov 2023 16:03:15 +0100
Message-ID: <CACRpkdZ3UU=Zo7aqaYqZENHmEmy+hYMDNCFMw5hikMDKG1Skfg@mail.gmail.com>
Subject: Re: [PATCH] Revert "i2c: pxa: move to generic GPIO recovery"
To: Robert Marko <robert.marko@sartura.hr>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@armlinux.org.uk, wsa@kernel.org, 
	codrin.ciubotariu@microchip.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 10:30=E2=80=AFAM Robert Marko <robert.marko@sartura=
.hr> wrote:

> This reverts commit 0b01392c18b9993a584f36ace1d61118772ad0ca.
>
> Conversion of PXA to generic I2C recovery, makes the I2C bus completely
> lock up if recovery pinctrl is present in the DT and I2C recovery is
> enabled.
>
> So, until the generic I2C recovery can also work with PXA lets revert
> to have working I2C and I2C recovery again.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: stable@vger.kernel.org # 5.11+

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

