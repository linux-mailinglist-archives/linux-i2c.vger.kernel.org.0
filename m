Return-Path: <linux-i2c+bounces-9376-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D752A3209D
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 09:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5AEC3A5DCB
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 08:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436BA204C0A;
	Wed, 12 Feb 2025 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cckCizXP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AC1146A68;
	Wed, 12 Feb 2025 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739347738; cv=none; b=sAN4jwu11CY8E7wPKhpECbJPobIJU3hJtvw/01PY1qXpuTyc/gHRGDdGugE98I+5AZoj42BXawq2r1uek7M2gwUxPOjRSYFS83UbM498fHVv6Mrhnc1oszHjO7zlMDw6HBwGdzPn6c3nL9Giw+BRzFrxbH3zl5OZ3+ts5JVE6/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739347738; c=relaxed/simple;
	bh=3n3AiS8w4E0MDVQO+1aqzMTdo+6rb7zH+QU/hI+QJj4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tU6JUhjYjI/d8aSpDR95r0IdcrnoZOF3ptM9V/kFhZmAvrlbaoyvNRQ5zyCR7I5Vaikg/JkvdGc0BoBirE4yFMbZI4K2/9/gR+ew6K8wWQzudio6n6CZkBKqA2U9yRh8tdYZJqGe1SXCnc5CcKYY1BV4osZR+i4zSZuPZ4PtNtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cckCizXP; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86715793b1fso1180392241.0;
        Wed, 12 Feb 2025 00:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739347735; x=1739952535; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zXFlucBnq2P5HHPVZLlRvii387YujpzgePwriGoGZ1Y=;
        b=cckCizXP34HF+FubNyL26G1B2egqhZX8cYi8Da5PhJWwv2ShCvL2IPPvSUI1NCxQ/z
         frd5kWtffArOoxeyZt3p76GPjxamUe6Qbh2qN39uGOY7+aUPBd2/PRdyUzbj8QowIXAY
         +Mp0eXfm58mX0NB9bZC4bSl0TjQizxggIE7dxRvKeNjvh3MkmQ3pPNzGZqlOfo41v0jO
         J+EFEKXiDR5gRfC8DEG/SrX56f/Pc263FkCQhE3QDZiVTxzKBiL4LrQR4WrgP/rZTqTL
         eCLKo36belDYQhSK5KAg52+wRCGQvPgK/4Adz85fbhJOzu210hT6lQnxyC11SnLx2wZL
         RVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739347735; x=1739952535;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zXFlucBnq2P5HHPVZLlRvii387YujpzgePwriGoGZ1Y=;
        b=W2w4PyAJjxk8g8mM9DkXVVqCyXH409kRyavXy1ZNum60P2NEfAtLERCkF8cBoyYzZ6
         RxZYyOWnM956N/ed4GAj8yaDRg4MF+p6LEwCe3pjuHHOerzEM6zQVXsPSzhqW/Dd5Pu+
         G2sFtE2gycvuDx3FnEcnISEbzn8Y41u2xydYD7+gBdrrWMOXbmUKluTpzo2EJ/5smZqL
         SDYOJYU239pbBCn03O7ho39OMh3XAc5Q+2WvAfH37mei8bZ0cpMu5pdPwki2vLxitssx
         pgR4MstwySCMDVhZ4kQAhIlzEqWQu0IAz3XxkxuNtOVKvFo4CI00dNDHIv3XWcITJJ3O
         6a2w==
X-Forwarded-Encrypted: i=1; AJvYcCXgbRSa2S+ED8GE7L75o7T45pDHjVPiTXJ/1c0gqYpFSBmlGkjMr8PXGrrR4qnc6GFi0OtONka5Fy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxthcuLq6PTkvGdwfMOWwt+tTskbdaoojokNsIANftJ7N5/OI8y
	g2If6TJPnZ3ZQpB3vQdtQBmEVd9859G+sfmCzewUcakUk1JJq4IYQ1BMWHtRjJgZDkfeVgQqdGG
	JbRG4GSKyY8raxTIbslaumxm9SKCDLV2f
X-Gm-Gg: ASbGncvFGu1muN8KxjrDvKBgT9VwoLf40xuwzO1UUc1kS8e2xRFdmzxb1Dw7KkjfErM
	wISbuXcIo5lcm8/BwmrY2uG2yYnJxOHYd+hTmiXNJ8qL1z7bazfphuhYo/L3jbII18XwnDxxW
X-Google-Smtp-Source: AGHT+IFHNDP1D0RkSPacbTH+tDBi/AM2fA95i2nFPdN9s0/jsSX1a1j/V6SKmAY2TGo8ChqtX5QTBAGtvUomj9IH7aA=
X-Received: by 2002:a05:6102:38d0:b0:4bb:c24b:b63c with SMTP id
 ada2fe7eead31-4bbf22dba4bmr1890808137.17.1739347735300; Wed, 12 Feb 2025
 00:08:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Wed, 12 Feb 2025 11:18:44 +0300
X-Gm-Features: AWEUYZmoy-CD2Ff05lPynwkRv_B82hN93kgUMKX-N_CN3_mwmlxP8OD_6m0VzmY
Message-ID: <CACSj6VVNFZWJZVk4k98QYGdCQ=u5TzyfRE9NC_3xAKMRoPGzJA@mail.gmail.com>
Subject: Assigning fixed numbers to i2c buses via ACPI code
To: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hello!

Is it possible to assign fixed numbers to i2c buses via ACPI code?

In DTS code it is done via aliases
(https://docs.kernel.org/i2c/i2c-sysfs.html#caveat).

For example:
```
aliases {
    i2c20 = &imux20;
}

&i2c1 {
status = "okay";

  i2c-mux@77 {
     ...
     imux20: i2c@0 {
        ...
     }
     ...
  }
}
```

Is it possible to do something like that in ACPI code?

Best regards,
Konstantin Aladyshev

