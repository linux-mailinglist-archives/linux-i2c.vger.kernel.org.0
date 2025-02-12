Return-Path: <linux-i2c+bounces-9384-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C12A325D9
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 13:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07AA8188BE9D
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 12:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204592046BD;
	Wed, 12 Feb 2025 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hji31lk2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA6D271829;
	Wed, 12 Feb 2025 12:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739363255; cv=none; b=alakIo9eoGchydMIuiw6EfXeO931ojXle5GHMyBjLEKU+8vSz4l2PwHPHqQnQKw8CaJU2u6Nv3Pygll68Hsmf0L/QZSsfWoA45dWJwIjCCMtAGV/qXXDW2gggU+xk+i1I6RNW/xRKl5/zjxcdEN5zsLrhAe4oSVAZtmZO9tPi8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739363255; c=relaxed/simple;
	bh=zQEf2olQ1Jcj5lNd6Krkr2ncPzxEVM6LuKTf1NcxDx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGK4qkEyxze89J2VAQlx+SdHjPv23fFVXrTb35u2vU1z5ezKMF66N6b2/OsmehUrxP3ibCc8AptAV1ivNVFZ02AF3PIgKU1VLFkr2nX6iugxT4S9uTjs2Xhe1gHSVKht2kYQODFOyrWLhnW5aCxwUuh5lh6UkYazgRsu1/lgBOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hji31lk2; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86703c58149so1675428241.0;
        Wed, 12 Feb 2025 04:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739363253; x=1739968053; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zQEf2olQ1Jcj5lNd6Krkr2ncPzxEVM6LuKTf1NcxDx4=;
        b=Hji31lk2RBzvSZyu2m1Yr3byG8NYtZ3qhwQ0Dhb1wNVEUyUNsfLD9cXgLxectDeaZQ
         nO7bfNv6FwhJ5BYq+yDsAj6mU8a3UFqZ+3kKT+yho+96yi/0UblXGceSddrOw42cIU5d
         rW6FXOWYEP4Umgs+wAntFi1DAnrda1P6CMRseaXqtei0KBbdaHr/fv6WBNIoxWn26pt5
         Khy9MG12fYkOIOHjMazq4S68lbnnOjbAnERLsGpepclIWOiQfp6jaFz3TgpRRa9u0bPE
         chLegtOC8jmjEmmMFCsqqXRjpwIjSWdzOqYn0ThMumk7F8JyRLBq2vxC42GoDI9HZYir
         6T6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739363253; x=1739968053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQEf2olQ1Jcj5lNd6Krkr2ncPzxEVM6LuKTf1NcxDx4=;
        b=FhLv3XG/LDG5dHqS4Klzupvcr8BOzOphFv++Zc8XFbavywqx+9OPgQ4MT6Znhysnhv
         zCDQiImlBZofp96Ii9PfrQw2CG6FhL+CscPGSBmbmH0wOXqZhlC0Z5hoGRdKyg1jrEYm
         yThjBPOrfHVQJOFB/UzAs3t09d4yk/DLsUH4iJXxxjHJZfPvyvNZkvXfSesWz2aFAWL3
         NUe11KUK/Lt6MdDFtKDM9mpvPwOefVQ1iCDRm3w+OBah7S5XQiCLUdIWDEN9Ygof6I/I
         6WaOKdEysX2L2SDMH/zgXQN+nE9ghul9j9WmKNnQ++WCgZ3sT9eEvd0Vf5goAQNBswJR
         kR+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0Wb/1PiJ+WpIIoY3WYmF+gRF52tzVVV4gjypDYP7yIdi9R6Gmo6sGP0TkBJOkJ+pd//kvco6CRpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLQ4bo/WnsZ2kDI6q1yzFVGRYag4ZHrWJtQPzlkpGMz3PoyKAa
	nNH5H+WE6+vBNBG75O6zXkTlF187oBp5AEJcIXB2DysM6r4IbDnlb0F7JenzMAXuW/CuQYnmhKd
	LEx8ybmQJmYBG5jlxX9nBIe/Z6NsIqSdB
X-Gm-Gg: ASbGncs7dnWWw+HgvklNAgNJPimp/Yuh7iafK3juSA5A96fXnYE5I3xk2I+rZENXRCR
	GhO4y9XInfiI9krzOoqZJ+YNFsOh7V0H96LN7iTLaMnoN96ocSkNEnQegg1vULLKJ0hfS1KaA
X-Google-Smtp-Source: AGHT+IGZXGza3vn7YrkGfLhFS86qNCb+O7jKBwwFKAfZkfbKe4zrUl1SmexnPHpmRsW8fOy1yWOdU7XI8Vhke8tcL0c=
X-Received: by 2002:a05:6122:65a2:b0:515:4b68:c37f with SMTP id
 71dfb90a1353d-52067cfe3b1mr2097803e0c.6.1739363253282; Wed, 12 Feb 2025
 04:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACSj6VVNFZWJZVk4k98QYGdCQ=u5TzyfRE9NC_3xAKMRoPGzJA@mail.gmail.com>
 <Z6yBGoUeoNQGZHVn@smile.fi.intel.com> <CACSj6VWkDnQj2=tOPMsbTo0uerNSR6sGSMO9c1FxWbEfYFz7Lg@mail.gmail.com>
 <Z6yO1wJ12FuiEVdf@smile.fi.intel.com>
In-Reply-To: <Z6yO1wJ12FuiEVdf@smile.fi.intel.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Wed, 12 Feb 2025 15:37:22 +0300
X-Gm-Features: AWEUYZm9dSQ5KbrrrQUa8Z0DL_JUb0PNEiv4lZ7k-zsLCTJ5XtNILEBS6khRKHc
Message-ID: <CACSj6VUV7XjYMnu482tVsS2Sb1XrxzBA5h+AAkt1K-FU3Dy=Hw@mail.gmail.com>
Subject: Re: Assigning fixed numbers to i2c buses via ACPI code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Don't get me wrong, I'm not trying to defend a solution with aliases.
It is just there is existing code that relies on fixed i2c bus
numbers, and I was just trying to understand if it can be ported to
x86 easily.
Apparently it can't.
Thanks for the answer!

Best regards,
Konstantin Aladyshev

