Return-Path: <linux-i2c+bounces-15201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9B5D27F13
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 20:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 380D6300A37D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 19:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62B126F293;
	Thu, 15 Jan 2026 19:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Y73TXF4k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56854261B96
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768503892; cv=none; b=uwC9Irkky/ffv/gQp+zSYAlEVRpiEf5E8iBdy6uvYndbmlGfAVtxaL+hhhrcRE09VWcvfvWhM+sj1h/STp+lIOP45xt2EQqMSaDBJvOxI/NwjODgW0tNtwGVFOtjf8xwJm4TU/CnFGBJyaNB+I92QWB11LjbYzPErA0oyn5vG88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768503892; c=relaxed/simple;
	bh=TY6+mcqHk7xjhCE/b0bPaxc9FBiNY5VldG7mLqQyFoY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=C4+gFUPrYpFnxcfr+P3XXg7eN8ab24iBolQv25KC7RX1NOOhvy7Qvs8Wrp47E9t7A/ktahmIkHlbIet/Zu3L/W76F4cmQLOL/WVT4djYOJmnn5vQxNCNKd1ZiQLKellsCIpmUCkhN0g8BIPoEwi0m2R1uV7SHyDc+uXrH+E9Gnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Y73TXF4k; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d67f1877so8420245ad.2
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 11:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768503891; x=1769108691; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr2uuRVZLqUYSrynWXRUh0/8+Ov/0sGQjhqLxsdA/sA=;
        b=Y73TXF4k4juDkjv2tnYtL4mjrQftxxS+gnEvb771tOlCbV4Q68AlfXFjW6kYbzW1qC
         +naYtKch86ol2epM/0y8543L5U229GllpCZzxE7ZPm1/qqgCSJ6aeVyI0GaDcRoqg5mB
         s0GJaSTQggkrlSla7kKryyoEVyBqUz2yYWA3b+C7l3Iu/iggCK9kG/kLy/3YY63QWP38
         2m5UWVg3bwqyZx2XEFzPDqOrgAJrvSWnMT1lnS7Pb1CYTY2f3ryzP+HAC3rO9LC1fHLo
         EoBvBqT6uOBBa1lzUYV1eUULBhEGsSgGmK/WQJ7H5Pbx9ZFQm7zg9cGY4WXOMmRVwG5L
         vCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503891; x=1769108691;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rr2uuRVZLqUYSrynWXRUh0/8+Ov/0sGQjhqLxsdA/sA=;
        b=L/jR9Izsj/eM/MEurXAMHTCsCa3ETDXEn/Uyfz1th8i0jgehph5naLVOoR1+d5Bd8N
         KDoVRB1WhgVqjtGG7em2hY4DthuvAU8zU97qiiQtFMNSJqKm2IbwRkKaMER7FWlwC29X
         ylyg1CduyOSdVf+RdjzkGRk0WCFfHH3iWsRHLvFGFHIv0kfVoUeqBbwPhqJoQzaYsAY6
         gt38/rCOPKL7cf5OHsoEtDin7qfbHBr3MohFlgnEL7whxLeK23IsrM+rlhtImPi+Vbx0
         /tFHUUHndal6YETr1HLMPGBqyWzELl+m0Z1tkwnWV4hnD3WRTXbLt8qQmNwx8Iw7hpaD
         g9pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzN9X/ecY7j0oMtcYYjnS/kdi/7jqa9MO0yp4A0HnTBHmGjPYNQGo9YbkG496RvWSnmwYdczY9QDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRVXW1EP6J5jOs3PDWUEattagmYj7hCjLf4ZmKSh+DzcP23teg
	CtgZ/3+6HxiuuY41zfPRvcEDOPgVlUJE7AF2NAF6rN6xWFjX+HhUoAzGyjcPqCDC7hE=
X-Gm-Gg: AY/fxX4BezbDepi1BnDNI8BWm3JAKxJv/Yk9MlZ6jt9GQORHEU3ccgOnu7FTYEm18GV
	GEq55gu3j7GiWXZ1/bO6yXRp+vB1pVgdQqJ0qN1PCeE6tHBJa7qYJvDlx6ByasBBZ6uw8INM1kc
	c8R+3kZzNiNxBQRZrCzPpQF65sD5jQP8PQo/DIagTPa+GLGmcT17AzXL2k+LTLQfnYEr/Vw7hUh
	uVT+7AndwO1ob05Z5ZlQa1nBjG+FDTKJBjxOoN1HuJv1Igb1moPTdUTxOyIfakLghY/v8f5W8oJ
	Xb1pfJLK7UIpVUmEZC5TZHQQEqFUYpJrbDs3NQeFeSiEI23epYCWOgHps6dd0Q4TCppqQAO5LxS
	Kvi8ky8EKRnym0moybAKjXKWXmXoD1mMOaJWY4naGZcte0jKYyxw+1nk/VxVoWcTBHZQUOF2ZB7
	Z13ZDL6RY5Yvn91Q9/cr5DiGOMEUPeM1nL6xrPp0+JSGQLo2tmUeXrzebsemDgR/08Gw==
X-Received: by 2002:a17:902:ccc7:b0:2a0:d5b0:dd82 with SMTP id d9443c01a7336-2a718a743e4mr2047095ad.61.1768503890626;
        Thu, 15 Jan 2026 11:04:50 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd19asm480895ad.59.2026.01.15.11.04.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jan 2026 11:04:50 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] i2c: xiic: add ACPI support
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <aWjlTKrM34lfDsfC@shikoro>
Date: Thu, 15 Jan 2026 11:04:39 -0800
Cc: Michal Simek <michal.simek@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AAB5CE7A-9264-4CE1-8A49-2FD3043B0A80@nexthop.ai>
References: <20260115002846.25389-1-abdurrahman@nexthop.ai>
 <aWjlTKrM34lfDsfC@shikoro>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)



> On Jan 15, 2026, at 5:02=E2=80=AFAM, Wolfram Sang =
<wsa+renesas@sang-engineering.com> wrote:
>=20
> On Thu, Jan 15, 2026 at 12:28:46AM +0000, Abdurrahman Hussain wrote:
>> Use generic device property accessors.
>> Make the clock optional assuming it's managed by firmware.
>>=20
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>=20
> On which hardware has this been tested?
>=20

This was tested on nexthop.ai data-center NH-4010 switch with Xilinx =
based FPGA.

The following ACPI ASL fragment was used to describe the device:

            Device (I2C2) {
                Name (_HID, "PRP0001")
                Name (_CRS, ResourceTemplate () {
                    Memory32Fixed (ReadWrite, 0x80a40400, 0x00000200)
                    GpioInt (Level, ActiveHigh, Exclusive, PullNone, 0,
                        "\\_SB.PCI0.GPP5.FPGA") { 10 }
                })
                Name (_DSD, Package () {
                    ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                    Package () {
                       Package () { "compatible", "xlnx,axi-iic-2.1" },
                       Package () { "single-master", 1 },
                    }
                })
            }=

