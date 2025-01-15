Return-Path: <linux-i2c+bounces-9118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88240A12BD9
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 20:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEA801889E6A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 19:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFEB1D6DA9;
	Wed, 15 Jan 2025 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuwEmzNi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A520C1D63E6;
	Wed, 15 Jan 2025 19:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736969982; cv=none; b=VKHXUVuvyQ/Fvuq//Uo8V/i3tGvAu99gAfP273eeacWQ3MzWDvF4B7YXDp+uN0ZrJhAZL5HaAVt+ePry+GLc3PpMyUJD/3K+zYBSTVkrO1VZKDij+0xP3awXk1jNJdTKuZpD5S243TFo87eq4FHFm12OZGSEFNRGP3+zu+ommGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736969982; c=relaxed/simple;
	bh=VNV+PEsRw0ZO2nfjHcmLZeVzXAqYy7uSsMLEr5eyVsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=uGNMB1Z79HaP5SSE7/bAFjdUvVvxNCuXdyYV68z0vrktiBxNrh6jKYDQO+1Rt3BHUtjmKZTlvcmDfVVyCL09i0dHUqdfwDKVWzut6eGcxXJIqPXtGPvl+UulKOSnE8smtPgkTw179tqDX8WgKsihpoGyxddjHnYE5WKl3b5dg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuwEmzNi; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so253549a91.2;
        Wed, 15 Jan 2025 11:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736969980; x=1737574780; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNV+PEsRw0ZO2nfjHcmLZeVzXAqYy7uSsMLEr5eyVsc=;
        b=NuwEmzNi0QUMG80PK3Ic/nZp0yYnJBRwn54alH+x0hVqUFIrjNbZX2l1fVDBnFY3aD
         /PxxMCisStn/kdh69llzO/2w8HeU7VABzYA+ALxfxz3JdeXXN8gorvQK2t6L638ybYMq
         0joQWXMVs9h2vbXY2uq6zvfDvvCBXriDAZgvTH5t06WepXvKYB20X69Pc17pKhSiiIrZ
         ZPsaXY3+m+8YTYo/ZMbsZF9sdBCvts+S6rdMepz/7vilYqSBcuAXgi73tRWnZ8S/aghN
         q6F9ugs9b5ybHqO+QHDxVCCFRubOeOWhZdApbaBC7ujk/V61R+O6dENicDZOWfOsGAL9
         7ejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736969980; x=1737574780;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNV+PEsRw0ZO2nfjHcmLZeVzXAqYy7uSsMLEr5eyVsc=;
        b=L5tOS0gH7JQ6vMUP3NNJmQDTQw0Evkg7lueRv00K6dC9n1OWvCq045XAfOH+7IoIbX
         Ot3r8UO5BEbV4IZOBLXBbFBkkwVT9PT+RnhVAmyJR0B0Z+EUhjedAbGVduLPZm9e+/rx
         xUSEWCsuD/9uioawvfZq/uf1GuEHrYms0D37LZXDMz9oiYefoacCSGq4fQcnIu0krnQS
         Vmt4B/Of1lhZ9dHFW8d0xnLNL6Mvqtox7eaJeXXloTFrd6utvZGgj87Uj8532thN3qlN
         0XmHI25H9AhB3NX+d/iKKofugGkDn3hRCH2yFhWxotdiZoOIKrt75viVFOQcU/7XbE/5
         6kRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxDcPW82Y8MHoXROYGpk3A3xmBilg1De9yufVyOpMbz+BqlGZCS8nNaol8g2jy5XUEDyV3seh5+onN@vger.kernel.org, AJvYcCWR+3eNYfQvdMECxknlCy6WhlahlADRVQ1gk+5qzHKx2tlRmK1nWYxhliUkt0BgcoJH7O1XpQbrK623@vger.kernel.org
X-Gm-Message-State: AOJu0YzyL2vNkVL1Aqtq4GDW6HfrjosShQBMRPfE2YxTVtwCnb7RRV2K
	S75ZUeX3sbj9oe0VjXsh3Mwx4t/byqWfQuTHb88thanPxF1gmzHGLvIdi18kIx8uC9AO+oaEIt4
	ZCqpIw67ygUjfIg4h3BGAyVr9rCs=
X-Gm-Gg: ASbGncvpelZVwPyiZCt9wXzjDQHnozMsOnT0dx49s5xOZeQEc2nNvQY4v1bRHS9ZE0D
	OJwXiSQ3n7IZAjBbOI0r/CnUAqeK69Evn130KhVxf
X-Google-Smtp-Source: AGHT+IF848zy37xV+KL/On6J16UZRv/vH+VtdPGeF7EHdAgLGunOX2ASlkxUvLDH64kCrouY1ZHOsoA1X98x/ODYlXA=
X-Received: by 2002:a17:90b:4d04:b0:2ee:aa95:6de9 with SMTP id
 98e67ed59e1d1-2f548f71e2bmr46059576a91.33.1736969979915; Wed, 15 Jan 2025
 11:39:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113064802.GJ3713119@black.fi.intel.com> <20250113195308.244372-2-rha051117@gmail.com>
 <Z4ZRXo2uYZlvWI2r@shikoro>
In-Reply-To: <Z4ZRXo2uYZlvWI2r@shikoro>
From: R Ha <rha051117@gmail.com>
Date: Wed, 15 Jan 2025 14:39:29 -0500
X-Gm-Features: AbW1kvZQc5hjUL0qetMdDNp9nUBdZkAUhAHiw7C-onZ0CRgJhby3UPT26U3CsaM
Message-ID: <CACHtJB-5QNif0YQAGp19-9sM_TPhg4BVZ5AxYadJYuaT_XLUnQ@mail.gmail.com>
Subject: Re: [PATCH] Force ELAN06FA touchpad I2C bus freq to 100KHz
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Randolph Ha <rha051117@gmail.com>, 
	mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, trivial@kernel.org, jarkko.nikula@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, and thanks for letting me know.

I'll keep your suggestions in mind the next time I have something to
post. Thanks to everyone for helping debug and get my patch into the
kernel, now I can use my laptop more easily! :)

On Tue, Jan 14, 2025 at 6:58=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, Jan 13, 2025 at 02:52:37PM -0500, Randolph Ha wrote:
> > When a 400KHz freq is used on this model of ELAN touchpad in Linux,
> > excessive smoothing (similar to when the touchpad's firmware detects
> > a noisy signal) is sometimes applied. As some devices' (e.g, Lenovo
> > V15 G4) ACPI tables specify a 400KHz frequency for this device and
> > some I2C busses (e.g, Designware I2C) default to a 400KHz freq,
> > force the speed to 100KHz as a workaround.
> >
> > For future investigation: This problem may be related to the default
> > HCNT/LCNT values given by some busses' drivers, because they are not
> > specified in the aforementioned devices' ACPI tables, and because
> > the device works without issues on Windows at what is expected to be
> > a 400KHz frequency. The root cause of the issue is not known.
> >
> > Signed-off-by: Randolph Ha <rha051117@gmail.com>
> > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> Applied to for-next, thanks!
>
> Some comments for next contributions. Please send new patches always in
> a new thread. It was a bit confusing here to find the latest one.
>
> Also, while the code change looks easy, this is not a trivial change, so
> trivial@ is not appropriate here. Trivial patches are more like typos or
> whitespace fixes.
>
> Nonetheless, thanks again for your efforts in timely debugging this!
>

