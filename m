Return-Path: <linux-i2c+bounces-4033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCC2908A7A
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 12:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAA1DB24DB4
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 10:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CDB195807;
	Fri, 14 Jun 2024 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgmLQJO1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653F61946BB;
	Fri, 14 Jun 2024 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718362208; cv=none; b=Kw/Jz1FtjGpo6UP8ukzgy/rPZ13TMrO365osKVOIfRLaH1ZmHxwL4z/7sYR4lx9lsQoXn3iwUr7PPiLCjpTtW+KBxAsRqKQXUF7ntMtcz1EOCQpFoPTR95NXkgEcGk85++SUWHa4CRsKlD/Y1StRw7uYlwzF9BCQRtqAbZCFn+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718362208; c=relaxed/simple;
	bh=QXp0E+fwmVtC+dLdV29MGtpRInQu8wHVNWt3UcAzTaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwNibRdrCMuKPj5PCaqK2HAFVHe04WZYxBG7wkVOukrWGIBYcnBSmkA5x81uCYBIPST6gtMF1dFmlU3fu7d1w9gQFmbVJpWn4NYrIQsf4XarK2HM0DT8IfftLNDqeBDXyvFOpwEYMPqLMiH0RuL44FE/0++k1ZM2xjkJBuSufp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgmLQJO1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f70a87fd16so1226755ad.3;
        Fri, 14 Jun 2024 03:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718362207; x=1718967007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FN3vsCtnCbhfEWE7YOMqnwUF4qxuxOyYlc2ZbCQATK8=;
        b=bgmLQJO1SJCFM4kcPshjwqO23xIlOZkZDye5AeMajHZLHySPsw6SvYl4ycDJY881u+
         TgohWduWOskTa9PQIygyNI5uurI36idypVqNOHw1IFFLto1N1mE8CXBHInnlAI43kvc3
         0xXgmyJ5cxNCHdUo3lq0jkMLxHEp5MkssuDAOSPXSQ2z+Trb6sDAact+4VoaDnGgHDsv
         PllifQKdMVDRqiI4vP3x8lH9I6Qcn2IwS0SH2gGQXLRv4upCSIS/VwlkOO+3Xx1+oEIv
         hWnRf1seHA27Syfr9IvwpNWwvn/ZVPKZuUGpQtcgsmvfSpex9NwRGAEn4YnFMS+luQZX
         1AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718362207; x=1718967007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FN3vsCtnCbhfEWE7YOMqnwUF4qxuxOyYlc2ZbCQATK8=;
        b=SYw4ld0awjB+nwz3Qw6rLG7EzUXMKtr5eD3STUa6lZQwIvyL3r+o9UegUuYf5BU00J
         7VIgnI723Dr313sa5/Hfx74yoH2yUHpTqHOSgpo8Q/cyKGEuQjv0SHUAYL6+r5J2UZoG
         XcExBBKPk0nTNLugnQkANXqZvcS0UzmJIi03eV6UHTLHLXLvRfD8zvoYY4yfT6OJACOR
         d+fKRUpqFRvwtRk/gOlIym66S6FGfwmmcERJ6yQjXCZrPt8FVkeZ5AY7RFvtKfyjEOOv
         IUgD2kojtF70bWJXPA0nC2Mp2Wm0pNlulm1cp0mwPl7Vy4ZKLYzwv0A04MoAVekq0puw
         ZXtw==
X-Forwarded-Encrypted: i=1; AJvYcCXEynbhh8RTPTmQRJE/Njtez11bHkBOrkIJarbUjoFqfVL3TnJJ8Z3Gu12qhQwaRXfLQlfeQ9LHrIjVNKlny1n//cc2QwfzswYG+eEMbwRLknpvt8uLXWTpZ9lX/qKIdyyx9wII3gQ4mvcc5nkv4atRiIQLRK0DC8aLNaLtwSsu7/CQarK1VYNUoWCRv+Y0pqkZ7fKRzvKi5ZDHKkRvNuVPrnZNB9U5Xu/ej0a8oMBua6rsVTQG97dBdQFJdQSaUTinUfAnWdwylQhqwn3X81FohK/Fd/P25R8udGTKKrNG56ubKRXng7o7I1MlMn2uwfpfNWlT34I3gRIUoTKX2HqEhiA1aubpfL+Gxwt3aWl1YcKKN39t5NM6M+f9pcWj+cTxsPC2aesgFPvkodw21XLmEhnHUNTjdY9nhNIa7czIEviq3qeA
X-Gm-Message-State: AOJu0YwO+KYJk9DvygpILIdZ28Sq8UeQIDFkzlqZ77KL79AV7lGqtRLQ
	b5r1aq3DjWuXL2QCHdlod0HIM/iioM2E5rb6hs2K3hsNMJLRfBXE+SlcD6SgQUUkhp3fnyVepfC
	RCbuqeoRYKfaLPmAqgSgiPHWHbXI=
X-Google-Smtp-Source: AGHT+IHgArd11Sr3/cVVDrQnQwI2RDLcgIn6oK4LnKR6wQe/sXzVwQkyN3JryAftKxLHPTfJ0mLrINTYXizbakdH1hU=
X-Received: by 2002:a05:6a21:9988:b0:1b7:571d:3d02 with SMTP id
 adf61e73a8af0-1bae841ec0bmr2723114637.5.1718362206628; Fri, 14 Jun 2024
 03:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Jun 2024 07:49:54 -0300
Message-ID: <CAOMZO5Br98929LM-r8YnbFnPOUSusamMZoaMDvEHYBSmSqhGhQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Jun 14, 2024 at 6:59=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Emails to Anson Huang bounce:
>
>   Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access den=
ied.
>
> Add IMX platform maintainers for bindings which would become orphaned.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

