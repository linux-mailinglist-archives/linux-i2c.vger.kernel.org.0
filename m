Return-Path: <linux-i2c+bounces-13992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE39C3A73B
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 12:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 656F14FE960
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 11:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7372BD587;
	Thu,  6 Nov 2025 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4m31jUk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFC3280024
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426890; cv=none; b=kbreEB3N1BAyBP+kMXBQzY4W20qSzZy1v0z2/xr1cN9OUxlBam/nILrvgVFYWnZojKj3zycQ3WAnDqINOtZksvfrGieU2mGoW+SwQhQQiZDZdnSJtRDMEt/cTIiS6ERX3OvSX8yOdUq6zPxlEK3e0sZUCngnnlHnBBHL0R7eXyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426890; c=relaxed/simple;
	bh=ir//lFT9wS6wCSvmIE4K+HR90jLm5Sr1r9449X9pQYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcvcmO7c2DOUsci5JdRxV+hjgTpx7eeYh5x1kBbjyd8gJIa1Q9wvPNw8sWjLW1PH+pT6CWSP40aqqfhGKtkLKw0O/t0IeX9BfRbZgjA0gvqWJCovXv/Gq24iKHCm7LGHMj8yakMWyrLf25wSahejgvbFKZRuOV/OWR1D209h90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4m31jUk; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso1633104a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 06 Nov 2025 03:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762426887; x=1763031687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir//lFT9wS6wCSvmIE4K+HR90jLm5Sr1r9449X9pQYI=;
        b=P4m31jUkMQGtagzKYPdHFcoDDe0O3G6tpphUTiCMePdNR28d/YuWzkdD7H1ojp3CIB
         Y9bbnkby8t4Rc01y5804HlTmXS4fLQFL4suesUgNcyZ8v6oJ2Ad8HBEHMyB1yBjvSGIM
         KnvF1PwsNuGPYVSOIV1ZQ118qnuN3ZkTk2xaLngsnvGukkHu1XG3pDw1FoZdEgKKVtPS
         rzht2g8avq/MIhqtsoywQ+6OlBPNIQV/09pisKXF5LqtDla6HWJzCHlBs6+Ht8MTydYm
         Xqq/dW1YmrJVE3l7BhWq+6rMsQVB3JMnAaxZ2AnWq0F3hUlmDMtsiq1PYZeRSVSWZcKv
         gWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762426887; x=1763031687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ir//lFT9wS6wCSvmIE4K+HR90jLm5Sr1r9449X9pQYI=;
        b=ce1kGFxKuvd5BuXCSUwkjnBRODX8fhg05UBJjB6lyA6UBi3MdlWdzC6PHvWFG++OHj
         vmFaZgZQEnKZPLnYzkBsx8RamwK3ZwiZWoHBxYnq12hsvmjw2sKKcp0cJTtCXG99mQpc
         aO/IbnckEL9XkXbJ9gj6ssTh0nhQScZOWTUuBGvk6vj82FXX6aftXy2Xb+b/drhZRAVG
         i6NKo9TkfPAl3eaGXfuvzqNHylMayL5RG8K0M03HpJN/DlelUue32ZoJUpU+eytO/l++
         lwMw3SOci7xqgp/JLQnWkn3XzqDI3N+zCZKrFKvg+J7CKhUGwfMkh/0lH88qhqNCHE4w
         MyJA==
X-Forwarded-Encrypted: i=1; AJvYcCV4prGk8TjSuIBnzgQRSL1ytiizTotLdwYceHTU6Fp5M2kfsk10MdtAfIzlJzrFBlM+WiF2vPin23E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxggGU4Kd0OsJpwHUKqj1CfjrTzrJUF81t6gEyxw81U/Plph9o2
	Gu8PZjhG4Jzep43FD7QwoSZ1wIOAC99iuPfbI7UR20/9OlaATUhaT5htgHV744NM9buENAg9qgK
	Zndq3APKn6jVPqqGt9TwbTY0dh4z4fGjgs6PEo/sIVA==
X-Gm-Gg: ASbGnctNWWPasTu85Lzhgetw5sGfIdAl7lCto3DSAgzvTrYS2DHaAddSpSnFFM6+OIg
	XGAaCjZEYlQdNg7+9SFkgUR5rZQ9kWEMU9XjYATOEvrrX3ZWRjFVeFC2AvdwcQtejkeJe4l56d8
	iC79eD7trxAOjRbKymHNVSoVH/swuvel1l1pHj6ETkeXAzwq+HMvyzixQl3EEJQ2Cm8GkZpgifd
	VTSLrR9ER+HAEOwGAyLx+5NtFrob6mTf7OvGZ4AaCzo6GnyF4xJOS3t0PvfNg==
X-Google-Smtp-Source: AGHT+IE3ZLXP3+oYOCDOf8HdHiiPIx4UVriZLNHQt5QqAgQyg7lMQ1CUloE2bPCtkRDLKsQ1PmtiKY3RDXWEaZ6PDlg=
X-Received: by 2002:a05:6402:1eca:b0:640:ceef:7e44 with SMTP id
 4fb4d7f45d1cf-64105a5c99amr6575408a12.28.1762426886854; Thu, 06 Nov 2025
 03:01:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105161845.2535367-1-a.shimko.dev@gmail.com> <20251106104228.GP2912318@black.igk.intel.com>
In-Reply-To: <20251106104228.GP2912318@black.igk.intel.com>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Thu, 6 Nov 2025 14:01:15 +0300
X-Gm-Features: AWmQ_bmlkS6-iACEnyny5YPvKbBIRoPsEPwqNcbfawNSc0tFOMLrZxEL14qOOkc
Message-ID: <CAOPX745kvE-5mh8PjTzwboTR1uKijvgG72YOb4pOjXzE4+3qaQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: designware: Replace magic numbers with named constants
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 1:43=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> I think it adds too much to be honest.

Hi Mika,

Thank you for the review.

 I'll prepare v2 that addresses all your feedback.
Will send the revised version shortly.

Best regards,
Artem

