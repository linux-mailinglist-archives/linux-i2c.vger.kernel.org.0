Return-Path: <linux-i2c+bounces-10958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DD3AB561D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 15:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1BB31B4703A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 13:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B87A2918F4;
	Tue, 13 May 2025 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dAt8weXh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E8228F948
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143137; cv=none; b=X1gQtgt1Mne8HoUa+ToHdP9sM+qkFlCmNo0Eyg8xrpv9sM6b2hIzmsS7dU8Ck7Hr/RYVh/ANVXVC8CmYJa6azHgcwcV1tFxlR5D2+ND2GHITbDNcdMAil5QEb2lgfNXbBF+FnNc1TWDfF6rKLTtB+/bSaN286eAAg8Ot2hghlXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143137; c=relaxed/simple;
	bh=DolSbnwhb7CK4zMm/bekFzKF/EXyrPh2OwEX9Ve2GUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qe5KWXtv8DmtRc1JSCwozsE2MKHlesf232BAPqaTTD+Cvi6WmZsLR6QLYFC/1p0QNR4EfkY/mN4DR+PeQdfCm5sEWi7ZLra3sq35WTeLsSVz2Po2Sx7QTvRBL+SPmo/eqxmleBf/gmRomzm5tXOXDfXwhE+xn97o9fEU81ho1uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dAt8weXh; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso4929643276.0
        for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747143135; x=1747747935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DolSbnwhb7CK4zMm/bekFzKF/EXyrPh2OwEX9Ve2GUk=;
        b=dAt8weXh0arOJtMNnoYiywf0sJy528l/UCJBJNqlL+htWtGJvosdcJ6rUaezvoRt0j
         x7bVBI2LxC6szHZgs8a8/xtjD3NXt4ZYxD8SsBIouGHsrWapfcp3CPSQFtWjwiR3lybK
         1OAnBozcYoZ35pQEO/oobXMxHqs98GHDFhCtpgw1IsrjG1VysLdrpjQAm3lH5ZABdSXQ
         RRPuKx+wtQs54lzZbgEusD/pvsxL8kkqyMHuy33aNRXKuWO1Av6PcdeX3wHatlKemzKs
         vuODq6t75u+v+frXUxexB5ejwe/Z5jLbNoKCchiCvRuIjXF1zZ7/vlYYfdr1KOSQ5goc
         Bcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143135; x=1747747935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DolSbnwhb7CK4zMm/bekFzKF/EXyrPh2OwEX9Ve2GUk=;
        b=cLqgrNrpBTcHa20mbZVxc3Fk1wMItoauWXeojxt+8cB4xVBM+6vBd5qssRVjfwMzLV
         xGpfTgOjG3HmK2MqmZZFGLT1/Z39zV9lB00AFpYZDa2HiRE9u+UE8wt4Iz6QqoPbf1zk
         mJBv4usyRBkM8kr90Vzs/d0oy/3SuGBoyb6vKdSlx4j5HOjhaokEc3+JcAezElk70saz
         gFOXRIu9g46EE6xPsVdGZJLHHX0yWZhV9+zCsjXTAIBtYzjCyBnaoNehJBDB8qcEzLRj
         f68FNZHnRkwVv+06dgjf8yqKKL0HxBA9a+SAf5hZqd/4OLhOHvlRLkp3WOixL07nF7tz
         gIkw==
X-Forwarded-Encrypted: i=1; AJvYcCUzcrmtF2EO4Y5pp9edW4TAM9GhhV2i1AQpg0GP9i4Hmhp0jjiR7LOV9jYy953EBbw2v/M49TEdhY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDBaC5b9PqHgLg2qMcUo1yT8xpFP9QsikwwltB+baKPTLFq7hc
	Zu1Nc5o42x46yeugWhESKR5otgzC5zJ4yAtPCuTiiuA40aOLMyJWQfG7blnG/uhnDQzBld43I4R
	IkTj/qopVLlTbLkFMnvXLis5IfRIDm+0MtzWjXQ==
X-Gm-Gg: ASbGncuIIZgSGQhli4aGpw3i8CvYf/Y4FdmJC3mcXb0h6495uVs5Kio/+BTHL6LStdx
	TnlAHV0wh4O9RkK+odcRP8iXTiuiVyvO++4a0mD0mfWaiTx51w5AojmRWiVv6gvAMnTSHfvcZ32
	iupk5M60jeveY+UVc4OkWg4pF9PI+jqzFz
X-Google-Smtp-Source: AGHT+IGiybJfQ+z5Jn7pmSBhMFaRx94JyxJ/gdqDm6nzTQPskCAu2xeEpG8J7Rdc9VcKIJc2nXp+xlFh+U2qXZzoTJ8=
X-Received: by 2002:a25:a063:0:b0:e75:607f:434e with SMTP id
 3f1490d57ef6-e78fdd2ddc1mr16588046276.36.1747143135013; Tue, 13 May 2025
 06:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com>
 <20250511-i2c-pxa-fix-i2c-communication-v1-1-e9097d09a015@gmail.com>
In-Reply-To: <20250511-i2c-pxa-fix-i2c-communication-v1-1-e9097d09a015@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:32:01 +0200
X-Gm-Features: AX0GCFtjrC7TvruGjGxJFmXvhSkIZU0U-gCg7r4ao7poGNibGwZebdwuLG5fs_4
Message-ID: <CACRpkdYB6sjp4PwHumkj1kj48oUzSZOUFQTX1i==P8V2DJBx1A@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: add init_recovery() callback
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Robert Marko <robert.marko@sartura.hr>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sz=C3=ADa Gabor,

k=C3=B6sz=C3=B6n=C3=B6m a patch-et!

On Sun, May 11, 2025 at 3:31=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:

> Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
> and modify the i2c_init_recovery() function to call that if specified
> instead of the generic i2c_gpio_init_recovery() function.
>
> This allows controller drivers to skip calling the generic code by
> implementing a dummy callback function, or alternatively to run a
> fine tuned custom implementation.
>
> This is needed for the 'i2c-pxa' driver in order to be able to fix
> a long standing bug for which the fix will be implemented in a
> followup patch.
>
> Cc: stable@vger.kernel.org # 6.3+
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Clearly, since the same problems keeps appearing on other
platforms as well, this is the right way to go!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

