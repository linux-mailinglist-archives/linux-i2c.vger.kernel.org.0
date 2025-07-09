Return-Path: <linux-i2c+bounces-11878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A51AFE1BA
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 10:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A4057B2D46
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 07:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0974217701;
	Wed,  9 Jul 2025 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBxHRdUv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC6518A6DF;
	Wed,  9 Jul 2025 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752048049; cv=none; b=Ws3oqVvNbSPCidz1PvAZWp749sLdLWIgilnjiFSG/Ps9SfEqcn64yqLZMUYmGNDpa7I+0SyYOUcVzSApsmnd8hUoOLTOPwiiMF4AvkzBdZtG6GHE9JGRvDNDB+WBVIAtxUfZdQ7sNiTRCtIqX3O+Ucg47qYiJpSkVvXNzYtQ1t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752048049; c=relaxed/simple;
	bh=FoSex0PmwKJhyDgQDC6CfH3+WNg+AARj5UYs21REUaU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fpLc15UDxbyT56GatJCekgiQyn42HT5l/CLnM1ECno4t4Gw10fI+q/oQ+rpRlgfh0xNSol0Wvz7qmMIGno4CQUoZ8xX44ASY9KwK5qslij4OO6RGswFlQDkXJcBI41XjOlIEtiAJhNSMLY2TLDnR495+xAxfFsSIpdMpN86QOQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBxHRdUv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so28460835e9.2;
        Wed, 09 Jul 2025 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752048046; x=1752652846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gqevtmSJqbTOQP3b4x9NXYdvlxGgh2UtvTcmwhzx+4=;
        b=gBxHRdUvfMvooS/bgK62AVjfHXwgca2qg9wgivVgeDWyp5tCIrc7jQ+cCek2eediey
         41+Io07yPRhCPAXSESP6mxl7ulNopuAndMtdvOp/kuwKI8ve/Lhn7ngWjpgPbHkiye+v
         PtSmO1TAvHwFn+vyYMRzFCRgtfRs0qwFVWKsbEqDXv1kjlUly+8y+EUSlfpHOwyPpLEf
         tPrdY8lkTV/yFPpCpP3va8iaKGdO8rggB5JN4D5R5bap04L+mRakbIAj6zrSo0gAzJ4O
         3tj8Uuw6CSeRwEznHcqOqKGccSCDsXsZUZFf0zGsQWsX0QOJPIC6z6CybJIuIFM+7QeL
         5N8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752048046; x=1752652846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gqevtmSJqbTOQP3b4x9NXYdvlxGgh2UtvTcmwhzx+4=;
        b=wgOb3E88dWOTur7i4DtVL0S6+VwlmVZqdpAP8IRfc1TYdU76xGvwiVP3wZtGRl3BYv
         18lpgIZ1XQ6x5N+00mye9XVkS6hOm4tbX4gR568WIU2rLL2I9hhzFrKdJt9dZdD1Tm4S
         UZcoSyxjMSN3CwiMdLrGsJ8Qiy+ej+Oget5MkmfX3mUA04J0UOr6cwlk0Hx8t7Yrcx9W
         X+euU1ATsTdPWzQoz//jHWFw9554GSCRTLQ0T3jZsiCoTtWgu1dvT4xmPYxOgBsXoB94
         ff9wYbF/SSUm8XEX4txkZUlhcqmZOfE0T7ofRqUXB306GwbammFUoc6JPMCaLuK5INK2
         D/nA==
X-Forwarded-Encrypted: i=1; AJvYcCWbaPLD6GVVzX7NncSntwcHmDylY1OJXoyzBGJDsa0nmpePWAl2//pAGz1dLNgRDLLa3qypURrwCSA=@vger.kernel.org, AJvYcCWvwTDaBQi0wW+uiBfTiBVzb4XeI3FJrNazyuPpvvPFRyYABtucq53nMuXyDNuNbIaNq+8IeOSMw95tUb1o@vger.kernel.org
X-Gm-Message-State: AOJu0YySQMPHEZ4evP85nOzf0uJ6jSKc2GIeCSK14lJcjtRa8go4bv5+
	A/7R7Pz/SCJSHHYYzkRa3CQqI3x4FegP56exSjmIP3HlGJVcJtb3lZlk
X-Gm-Gg: ASbGnct0EO9TaGJPLUG1YaKyT8rEEZqUVK0U1nZjahj9nhVB6WE+rtXxyWNMiYw5L2j
	ilxBd61aZvHILwyQiO2DXB+EzG+kMymCfmkNtrV9NXJRGEZgM2y8E7qqaCuFBzfSbSkoKE7juj7
	FgIXW5Bhd3BS6nZPV03cbyZx0jTn3a7yyJ+jIUWKJEUlxm79ge9D5oqZri3hfYWqOSD6iKmk8r5
	hPDeh14nzkylZVVF5F6SVN+YMC5BGXHvToiATJNAHEzwHQtiqmhAzW8UOD4njeFjpZG/jm9In6+
	YG9EB/kRi++aMqcK9DeI5CFhucI3ASbJkQkwY5tN9f8N5YntN69ZPCn5uYhoasVw0jX+9yOZ7yv
	C36+WCEGaQf7LUieoPbqVpECt22wk
X-Google-Smtp-Source: AGHT+IGGHxzTWiVKtUesUPIw3M4x/KqFOnRTNLp1oaILf660K643q80EA8PTrG0cC1h1pLe8dGvpcw==
X-Received: by 2002:a05:600c:c4a3:b0:442:f956:53f9 with SMTP id 5b1f17b1804b1-454d53a63dbmr11897035e9.18.1752048046096;
        Wed, 09 Jul 2025 01:00:46 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032ff4sm13954275e9.8.2025.07.09.01.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 01:00:43 -0700 (PDT)
Date: Wed, 9 Jul 2025 09:00:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v2] i2c: busses: Use min() to improve code
Message-ID: <20250709090041.26605105@pumpkin>
In-Reply-To: <e6814ec7-b9fb-4185-9929-1e463ef518f6@vivo.com>
References: <20250705114436.579070-1-rongqianfeng@vivo.com>
	<20250707104041.00006171@huawei.com>
	<e6814ec7-b9fb-4185-9929-1e463ef518f6@vivo.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Jul 2025 10:05:58 +0800
Qianfeng Rong <rongqianfeng@vivo.com> wrote:

> =E5=9C=A8 2025/7/7 17:40, Jonathan Cameron =E5=86=99=E9=81=93:
> >> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> >> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com> =20
> > Drive by review...
...
> > Given it is now one statement perhaps cleaner toput it
> > as the loop initializer
> >
> >          for (i =3D min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
> >               i > 0; i--, c->count--, c->buf++)
> > =20
> Got it. Will do in the next version.

Not sure whether that is better.
The continuation line makes the 'for' statement a bit harder to parse.
I'll move the 'initialisation' out of a 'for' statement to get it to
fit on one line.

	David

>=20
> Best regards,
> Qianfeng
>=20
>=20


