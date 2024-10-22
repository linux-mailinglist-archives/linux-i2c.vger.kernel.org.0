Return-Path: <linux-i2c+bounces-7500-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 140139A9AB0
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 09:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A5D21C22122
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 07:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048CD1494BF;
	Tue, 22 Oct 2024 07:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JXizB/Oa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7E13D882
	for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2024 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581312; cv=none; b=JY2m+yZ0MVa0Gh1dOjiQ3aUsellp0fe1MF+e8SnAsdEdJNkxc1dSW/lPiyokbI8Ow5zgVvNyq1lnTvmR/XJ/TwfNNcO0n98GYSJyfag5KeDjjUk4BRw3xDf+CPuapAOsagk6yk5jlSxAxaZovYQjV+iL3inFpVExy9N9mpkKIdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581312; c=relaxed/simple;
	bh=BSr61Lbih3ztfBNq+FD5PNATN96oqcq+F4opEl7+bbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWhkC/T0uvp2jX4S58Qa2QbkDmZ7g+kC0YkBSWQI/s3taIbF1l0cgLtZK4Tq/Z4lKl9QhzoNQ3tGwz0Ld0ueFeYLgbe829EpKsOwKz4vzq0WpyaKkNr3hvODJzsae94gijkkwU+0mo2Le2qiuZ3C2f4Tcoyq272itIi63uFfsr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JXizB/Oa; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2e87153a3so3553053a91.3
        for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2024 00:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729581310; x=1730186110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8X/XecV8UTvLcsQtQg+izcVYgmrEzD6FxMWHenqkUbc=;
        b=JXizB/Oapjz8DjCwhKGOC1r2dT5u5jbHbGBf74KjOfz5tBxyrzYkiuGs21wiFwJmQh
         eJidGccj0+uRaYw4Uwead5UNCeeKCjTtGOnHty1p27gCqrJZIFKqw09FJDXKLUmDpGFx
         QVI6696HFO+/sjZf/LN26B+ULbqKHpjKseOi2xXVn7IyKr6LPLsoWQLHnlndNBNHWWyZ
         sS3abklPmPRI0xH6t3YmTmu5FunQi3XTmM4uXbpB80uVjPy+mNSn06+fhF+NfzonEdNb
         0BC8Qr5w78TUnX0kPBgWKEF7EAFH2OcQ51OLsyOKSuRcvRSXN3ZcixQQOUi9VT0hbWK8
         K10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729581310; x=1730186110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8X/XecV8UTvLcsQtQg+izcVYgmrEzD6FxMWHenqkUbc=;
        b=QuuvrWQf6LfERkFMBnMyun6Shem1sikI8nM9EVcezb4fkuKhWHOCSVnbZ4ta2WqeVT
         BwaDVB1Khx3Ll+vqm/CF2zLvwZ9nJFof9xPhrlnceq9OrU7iGAo/lT2lCIBu6jY2tDWj
         5PuKo2PqcPYdIlTzt8KjNkKRPLi5rUPswAapTRw+dYkTcNF2vcCLMmLdzEtsEYEVigkp
         q8AjvXJCUnO1YGYEu/s/DFZXOCKrXB6bVFmW2SGNBzdLSaRfYMJ10wP3KCSfTfJU7XJN
         LIuf4yLyF1WJnx3L+YgbwWOEmU3qll5Rx/Db9CgeJZlOSSirVSnQBYlbFX1PmmmIAkO7
         zcqQ==
X-Gm-Message-State: AOJu0YwadPo06ntYju1CZBi3MI4hx75j/irMHg1mTDtBecO7StVLSwJo
	Ui162KaXgyfXwe5i2wHdVT/lyUgo/UZ1dm7UUgbmhVDviOJbYdjoCtKRXIL1K0N/d/lWPvh1LZX
	pL0FknaBGHQTCABiRySkbMUGDh4YSTnubllo8wHheoQFCpVAT
X-Google-Smtp-Source: AGHT+IETunMDbq6jv35brOropUyt9fQGFH9KIMjjSe9mCTtFlBliffDFK8upTQ90ANTyKXCv/Oq4z92IBocn/iSsDW0=
X-Received: by 2002:a17:90b:1807:b0:2e2:bb22:eb59 with SMTP id
 98e67ed59e1d1-2e561a2791amr13451564a91.41.1729581310048; Tue, 22 Oct 2024
 00:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017184152.128395-1-marex@denx.de> <172958121344.18422.8336462727519958263.b4-ty@linaro.org>
In-Reply-To: <172958121344.18422.8336462727519958263.b4-ty@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 22 Oct 2024 09:14:55 +0200
Message-ID: <CAMRc=MdOfQhvRVyXUirZV3V+yWMLbUyXwhrx9Qb9tA6_h0h1wg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24256E Additional Write
 lockable page support
To: linux-i2c@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, kernel@dh-electronics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 9:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
>
> On Thu, 17 Oct 2024 20:41:25 +0200, Marek Vasut wrote:
> > The ST M24256E behaves as a regular M24C256, except for the E variant
> > which uses up another I2C address for Additional Write lockable page.
> > This page is 64 Bytes long and can contain additional data. Add entry
> > for it, so users can describe that page in DT. Note that users still
> > have to describe the main M24C256 area separately as that is on separat=
e
> > I2C address from this page.
> >
> > [...]
>
> Applied, thanks!
>
> [1/2] dt-bindings: at24: add ST M24256E Additional Write lockable page su=
pport
>       (no commit info)
> [2/2] eeprom: at24: add ST M24256E Additional Write lockable page support
>       (no commit info)
>

No worries about the "no commit info" I was on a different branch when
generating thankyou emails. Sorry.

Bart

> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

