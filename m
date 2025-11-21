Return-Path: <linux-i2c+bounces-14209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E16C77A77
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 08:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 825D54E835E
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 07:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307573321D8;
	Fri, 21 Nov 2025 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXtBGALn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2982F1FD1
	for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763709084; cv=none; b=a/Qk9tPFQaQdZ60HJx8G7I19OhO85sp1e44z7yrDWMKBeTmXFF7TlXWFCqqjcZec8Ry7UHRlo+oKIWJGPA2DgrYgSgCMauPGG7CzFq6YGInvvMqQZ+AoERNLJOhJ+erDoUiVmZwfm49O8Brqr2NqH+xakchg+nrPIvGMMmOdKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763709084; c=relaxed/simple;
	bh=pllflPuOLjylWdOmv00MGgqG9AbYppsmNnOJ25rfG70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MGqjdvM1kUx8TKnyh51l0826fIUUgmKcD52S62/woInlsy+slM07ztSxPR0BnB7qpicO/CTw3be95+/UDjcyqzP/0aB2Mv+X4g0U+MjYqe1h5FpL2uGqoVGQMg5WWt7CK+rc3YbgIoSPIGyWFBtxkMnbfePZv8TP+jqeUheI8EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXtBGALn; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so2673400a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 20 Nov 2025 23:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763709081; x=1764313881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pllflPuOLjylWdOmv00MGgqG9AbYppsmNnOJ25rfG70=;
        b=dXtBGALnT4R3L2sFOnEVkzVNSUuE0fGbpkUXSpvua5G8DrWXEFtPH/OsRImqifG01E
         XpLXEDPhR+u4KyeN8ryp6nh4sSEGfRV5p0iEpogZNh1p5S91T1RnKKPT338MHg9gVeQq
         diQI1153azdakJFKL1eb7XTmjWPAVsiZrfxLnSllrxdIC1zdoL8xP0TJWy4IUaHPJe7o
         e/qKuCfEngvOWzCLtzHI7TRlyVs90yg5qSP6VhKW+GPCKfw6p27LTMnA1SaS/rE6MGXR
         j7cBPs3P+C/YoKPfdv0tCUDq5JwyaNVLrMH3Q0Vkw3r1fjyyuTtG1N9uQTbDU8T38jEG
         9EnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763709081; x=1764313881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pllflPuOLjylWdOmv00MGgqG9AbYppsmNnOJ25rfG70=;
        b=TZa8wmODzEnlH4h9i/OJOLviHA96BWvb8j8Ohy6i1gyoWzhkTHLRIdU8TV+9Kmpe9p
         WwAt8xSGv40qKKbbM3iUCJw4/FSj0GjrF8/cbTydC5zGr1/3VYzTAAsF6bVquqLP0YHU
         jPJ1h8JQpm4ddOmWZmiK1oQggYDaGiOTS7F36nKiOp7Vh/2fgoTFkv/N8shbAuY4tVAJ
         DYA3QauKAl9UOkU/Mk5Z+EzqsgXxbU5n60WW1h7Eta+9c9ZISx7eFavFKUw0O0/B69Xg
         vID+I2UtJTSzQ+b3tXo2FEtMsesSEDpVGweKqBhaTe6sIJ48EZkAt6JPgGU6d+nHO5qr
         WIyg==
X-Forwarded-Encrypted: i=1; AJvYcCW8CtP+tbFl3ys3sIuGaAP89zlPU3I6lBevhH3UjJ1E3xZbffwfadJ10UPB9Yoqd2RIYNlDbAi55So=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuz1oj2+R75rDQZKC9v3iMzuxngswXBgln0OZ08Aro8HMgBxv1
	L9FL5dl6wIU3BDd0CzdNeXjowiPeKakYk+0LUTmYdhNZrmZ3KorG+q0gjN5iqUyRF/v9cgfr9lz
	8T/s2JmgGyU5ZySJwySfjxTYtGGZC47q7yg==
X-Gm-Gg: ASbGncuM3wwIn0xnCS+SL2s8nohCOnaDNaOkrkXoGMLOhaf7dJjt9xBlIYROaQI6AzG
	b8O7JPTfWjAiKwLZpCs9/6OTz3vologdz39A1yemaMSSI/OUmR677AQw2qeD0qRE1B1LjuN1WX4
	oS7w5J5V2Q+RJSJIbddKyqdrpcbCY1Xna+QLFkkmHRw79mFzepjy/RC2KkqzuGLGM4y6poKtZmU
	x6UQ0fUF5PQVmUOohrpylH43ZP/4HD19j2GWQ883f5qPy3NlQtPodpSLm6NxHh0wQS/3kbZ
X-Google-Smtp-Source: AGHT+IHUpmYmOI+ZZD5lqUWU8u1FxRVvOErC2dLH6lZpIYb078ByAOYqD6y3v1JvdV3QwAXMLW47Uh7wAlLfn98VWXU=
X-Received: by 2002:a05:6402:520d:b0:640:ca0a:dc1c with SMTP id
 4fb4d7f45d1cf-64555b86cf0mr843905a12.7.1763709080608; Thu, 20 Nov 2025
 23:11:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+=Fv5T4PqVOFHnad_aLoMcYRZpg4Oenrmn0XYvb=Gjt1+5L7g@mail.gmail.com>
 <aR-U3kr-IyXlgYdV@shikoro> <CA+=Fv5QbDy_2G3KiXF=asX2+61BWMWE70tz3nr9XE8_KhwRNmg@mail.gmail.com>
 <aR-dktlDxOem6mOX@shikoro>
In-Reply-To: <aR-dktlDxOem6mOX@shikoro>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 21 Nov 2025 08:11:09 +0100
X-Gm-Features: AWmQ_bm6aLeF3DZPSwS6C9IzE36M0raSJwiG2SsaB5QE5tgQCZtyv_j0s7pAR4k
Message-ID: <CA+=Fv5TN6JQJY2gOmjxPA8VPZto1+dxqtfYvDTL-dEnoNnVDpQ@mail.gmail.com>
Subject: Re: lm75 on i2c-elektor.c
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

It's running stable so far, Wolfram, the git history references that
you mentioned,
they are not in torvalds linux git repo? I could only find history
there dating back
to 2005.


/Magnus=C2=A8

