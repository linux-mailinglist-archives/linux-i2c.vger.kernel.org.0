Return-Path: <linux-i2c+bounces-15149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B89D1D494
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 09:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 833233068DC0
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 08:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AA537FF50;
	Wed, 14 Jan 2026 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3mbw00g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F8337F8D5
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380694; cv=none; b=RiOsHgry08yiqff9ROidrc6WS3TL+gOJndTOOkqydENhpuTeEVoZ06w2elRsMcC4I7UuJbhj9HZ0C+XE4Lcop6EwF0oLbHNIqAtHxFX4f6MmhALMwjOWnBC0ZE0Ff4MkUbzhYsViISndWzIjEWuMhhVnyayFsDPqg9BkoRmdTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380694; c=relaxed/simple;
	bh=OE9GZ1UPGg7x7F49i2t3FY2UpVoS6kq5wHMQbbxduyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V2jiVnYE4EF30xHaD8UG9gqGclSVlF6AkJ77TatwiyfS1sDdUKqiYXcE6uk4vHOUD2EUaIXKSIO3YNKv1dDQg/pR7RWnqi4JOkx3Cwfx5K4/8Xjr2eEMW6rKT91L7hHwK/YPJvlMSGxGVXRzsNhwsYmAe59Ji098rpC3+HFXTh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3mbw00g; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81e86d7ff8eso193432b3a.1
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 00:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768380691; x=1768985491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAEfI6V7TMd6SFDq7Kd7N1hzP70TqG2e4M3DDJvaCMY=;
        b=R3mbw00gYLLw44nuQc11i1E/7eT9u4cd2W/vxYoNh+xu5XuaS4N+8civsS+orTiATw
         SIa1c033rU9SUh6DP7s2HgSNuvX4Xnjcr+Jltx66HF18Hh9LljzM9z+s4qhtjwJJHmPX
         OZgpHQxsi7YYzq5p61n6wTaghmRrhQGX4AN1WZf9fp+UWAVnXAynJWqFfsqrLwErASMn
         IzezYCvAPHMCtUSj8PN2ZWhyFM/EOgtR+joNA30SMnO2K2GlEk8IB4EbApAcFHYW+zaa
         3zq94v2UXITZWb0U6D9KqWuIOcwZWhQNO6Ix5yHGBgjiA4QFOSN/rByPOPiWJGAAPXj9
         aNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380691; x=1768985491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oAEfI6V7TMd6SFDq7Kd7N1hzP70TqG2e4M3DDJvaCMY=;
        b=bXltzTdSVwYbmfM2TODm9DiywD46I/fcReMUYrMb4pmytxZIM2OYgDBUl8/MkPGVVT
         SPjiBBGarJVgfalOQvyqJYG5dZsfYiLX9EGaGW05Uug/TS/C5DxMTou5k5hvxQC2wvYr
         KNzUzpj43fB7t3eJ1MJfWUyOCFvngtPbsEzD9gYCPcnERB0d5UXZi/B0xMcsp4l4G2Pp
         RBCsUzdffa/vUSK6MbE8l9wjuC+F81SfWUF2d2HG+SZ3pPQRJquBUxfHAwpuYj5ifRHI
         Tduej6VsAZ7pV2GJJSE46oi3MDV0eZz0B5xAoNo7RiDlwZF7Ls3rTMuLtWsEoccJaaAe
         /+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVihZ/YpGbLodxEyP3QjoTIG1P9BkEEAU6R/9qgb4z01b8mbpmFaBfcV2IKzmgmsZ2hqdzSIB628Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkeeOsD3SQw2cQuBgCcmV+VLJqECoOwRuclnwlHU1Vp+bh9tq7
	M2UJWlUpp9CdTfdFnIlt+5b392tfk+IP/KfM8tMPfjQHFwDzgAJkzNcA
X-Gm-Gg: AY/fxX7lAqxbPSTzbL6mYmN8WnFqU+RkE6feZBquwf50ZtVK4nwXUJKI/Qm5zFe0IxS
	wPggnDWI6t6zojZX9T/73ygdkkXM/vReyLdeQPCIEDqOohNwoN+M1VECs75R4uCTmaQWGIlB2xL
	v71feHdxBQKOWZSN9iGj0NACL0oZ5hiIju2RYMfgiKXlI/d7cDOgcwutotqG8x9lr1+4RrIbQZJ
	Zl/1hyh1Zjzza6RgaCigTYi0xXwpfaYKpTbqTiYz6wTgOIIW2C+KugDUqYMbHwmO0B5xDsgw/VQ
	6LXw/gnC/I/6jd40AmaGC3HZsbqtaqXjusItIBNKciZ6BxC7umc/5mZJoO5BXmftTZP7HzTlznY
	tlSr/PNR7BGS/TSXJlpsFV/r7U5jZLxaXrF0exWCPn/3i9kNVymOahP0Tsn4QMgjSvuRd45d+8A
	rcFv3pa7bo3w==
X-Received: by 2002:a05:6a21:164a:b0:342:8c38:ec2 with SMTP id adf61e73a8af0-38bed0b2884mr1498192637.1.1768380691048;
        Wed, 14 Jan 2026 00:51:31 -0800 (PST)
Received: from MiniPC.. ([47.246.98.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52fc9bdsm22557474b3a.32.2026.01.14.00.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:51:30 -0800 (PST)
From: weipeng <coderlogicwei@gmail.com>
To: oneukum@suse.com,
	linux-i2c@vger.kernel.org
Cc: anna-maria@linutronix.de,
	coderlogicwei@gmail.com,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
Date: Wed, 14 Jan 2026 16:51:25 +0800
Message-Id: <20260114085125.859740-1-coderlogicwei@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8bed5082-0aef-4dee-8239-c3e8aba50f9f@suse.com>
References: <8bed5082-0aef-4dee-8239-c3e8aba50f9f@suse.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

i2c_del_adapter in i2c-core-base.c:

> void i2c_del_adapter(struct i2c_adapter *adap)
> {
> ...
> /* wait until all references to the device are gone
>  *
>  * FIXME: This is old code and should ideally be replaced by an
>  * alternative which results in decoupling the lifetime of the struct
>  * device from the i2c_adapter, like spi or netdev do. Any solution
>  * should be thoroughly tested with DEBUG_KOBJECT_RELEASE enabled!
>  */
> init_completion(&adap->dev_released);
> device_unregister(&adap->dev);
> wait_for_completion(&adap->dev_released);
> ...
> }

This issue looks like caused by i2c_del_adapter(). It waits for too long so
it may cause the hung.

Thanks,
weipeng

