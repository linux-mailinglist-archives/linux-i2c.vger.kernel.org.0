Return-Path: <linux-i2c+bounces-5983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E426F967D70
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 03:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8208D281BAC
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 01:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A1118C0C;
	Mon,  2 Sep 2024 01:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJRdggjc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C139F9E6;
	Mon,  2 Sep 2024 01:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725241224; cv=none; b=AB3Wp5cvcRN5BC09cQ51ZU+/H0o8fXGG33f46BctA5c9ggEhBrrWAe62bWZnlTZXnsRqJUu1ULIZnq+AisHPAcIcj3mgl20+qkLlk/qqIquRFgfu7dv9JmRXH3lVTRRdAPPE4wETR9+rGWP+rK0shEmna8ZRaX0oiKL7pr9Xo+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725241224; c=relaxed/simple;
	bh=Sr988LJMmSpwpaTQFZmYXmsxQcIC/Gf+0EbgmPQgJUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdceAhr7GYRtghDVkeAlCnktQugISLwNVwzm2HQtmtTKDnjUIH7fcUD27tT7Ne6kqzjzuS8y0pANSHcgTbXbgfM2yxzO4pHkba4IKqePsmSB+q9HVai1qJb/VXnMRea/GMHxYjOfEjWW6xEo4qQwUZFrbAHqVSvzJz3oehvdQLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJRdggjc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86cc0d10aaso397250566b.2;
        Sun, 01 Sep 2024 18:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725241221; x=1725846021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sr988LJMmSpwpaTQFZmYXmsxQcIC/Gf+0EbgmPQgJUM=;
        b=eJRdggjcPrQ/QcyZFfkMeoMFggRo0VgdpOzJBZft+GywjH/FZaFUG+4p45oVZkcLS7
         Z5pShP6YDv1f+5qNKnUIy10LQx87SdmXJ9XGy9cWhHnU/jaaGzrEQIGoeS3LQfCWHx6w
         bKvKrBjeqVepehVL/fcegcQpn32mthtE2MFKd1DZhEXlz85dxg9T40zL9hDeze52YbaG
         kaNOwWxgNuTKZw2gvBLcA0Cgef+zP+FgA0o2s8sOGB0u0sh+bqVz+B75PXn60mcQLoq0
         XzlUCQQepeBaUhXf4I6s0XyifyZUsUNLVQWRZDd/RL3ww24tzf2YqWPXgBDGKfduoFuS
         GwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725241221; x=1725846021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sr988LJMmSpwpaTQFZmYXmsxQcIC/Gf+0EbgmPQgJUM=;
        b=PB+n/6RRIMk/l8ARMKThgk4gIak0PIZQsZcSIqFM/ePdMj9LjTaxOY3Xu7HNW92QMV
         lo3WIG4dqkElSTmu88djEPLX23hSpAE7pxWmCNsF1k/nhNXg+etAtTlt6YM5HWEycdph
         Zp338yOiCVWZ4DregA4X/GcvISeQ9Utd6PGhN4KSnyaasVjfndvL4DqID7FNIafjFX/Z
         mtPT4Y260cEHwXpw1WJnwhstKQ6SbZKxScJeWh44yvUY9PAkHf5l9wubQNrqSFeob7nB
         VGkaUjsVlJ4OVap8yLEUIg9J3QgRciFUprTzt/kx+FeuIuaYnq/ovkBjYNSsEY4Z4QDG
         3lQw==
X-Forwarded-Encrypted: i=1; AJvYcCV7iUIJqc3AISKVbB0qeBL0LFcFWwE7CMGjX4Xa88RMKDMzw5qAdVwDXXRMBbrL+3bktxU/w/gx/JU=@vger.kernel.org, AJvYcCVNRlaXrwsMq9OjJzCGNkJDi3aeQ451BNrZu+XQmvbt/6W8kLKQla3nESPXufIYuzlT6yyTD2tZdo0RMMBM@vger.kernel.org
X-Gm-Message-State: AOJu0YwCmhn/bj1eZY1Ut5Qw9SJL8TPl+Rmv9gxxTxqC+vNEbg2i0vRN
	pePwn3A45HZ4eoXHBAV9Su6+Z/qr4BNTqibDupDe6Wyju/OcEZtwrS0buegCQMhPjj4OXn/8bvC
	+MdlyiWRpYIzLFGcMRCQ1WzdmKg==
X-Google-Smtp-Source: AGHT+IEYKg+WMh+0uFy7RpZjEQ1/RRNRTGcffjDPaj1tT+igkzypbb176fWskj2te1H305jk3/x2p63RLrbhRgRKOtk=
X-Received: by 2002:a17:906:478a:b0:a86:97e5:8d4e with SMTP id
 a640c23a62f3a-a897f84d685mr999740966b.23.1725241220809; Sun, 01 Sep 2024
 18:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-6-kfting@nuvoton.com>
 <ZtIaofiTqyFwNXrO@smile.fi.intel.com>
In-Reply-To: <ZtIaofiTqyFwNXrO@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 2 Sep 2024 09:40:09 +0800
Message-ID: <CACD3sJbZ-Yy3PfPWisMSiPYCbztbi1+Q+=udMG8EjNvE+xA1mg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] i2c: npcm: Modify the client address assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, andi.shyti@kernel.org, 
	wsa@kernel.org, rand.sec96@gmail.com, wsa+renesas@sang-engineering.com, 
	tali.perry@nuvoton.com, avi.fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
	kwliu@nuvoton.com, jjliu0@nuvoton.com, kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thank you for your comments.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
8=E6=9C=8831=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=883:16=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Aug 30, 2024 at 11:46:38AM +0800, Tyrone Ting wrote:
> > Store the client address earlier since it's used in the i2c_recover_bus
> > logic flow.
>
> Here no explanation why it's now left-shifted by one bit.

The address is stored from bit 1 to bit 7 in the register for sending
the i2c address later.
I'll write some comments about the left-shifted by one bit behavior
above this modification in next patch set.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone

