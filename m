Return-Path: <linux-i2c+bounces-15186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9272FD24C68
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 14:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68A323048EDE
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 13:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF071376BE1;
	Thu, 15 Jan 2026 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sevenlab-de.20230601.gappssmtp.com header.i=@sevenlab-de.20230601.gappssmtp.com header.b="zVuaaYXY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B2B334C14
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768484390; cv=none; b=jY8uSGNYtZD21fciR7JAE8uql3te96I3rSP52b6eV9RkxHtymABkIr/vhWMrndi2v4SDl4mgvLb6PmDkCf4sqNtT0hsPsrol9H0GC56UePJceD6o7jAn5ST90/ExrRue88GcmEIX6ER+YfrS4MYi8K1TIRUK8SB25zW8j7P79gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768484390; c=relaxed/simple;
	bh=ttUrWF5Yy8NlteK90gn1B4LBQLQ7IuXpJIAwJWQeBkg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=LWuPf7mOApnm477k09QuQRP2SmWK556Oe9uofLjTj/0XVzj9XK38APyDaFHBsgrkaJIYvi5AyeJ7K9TOCrph5HSk4/TPjLTxNmhZJGQU8plY8z3Gg3LGNkd3tXJFd/j5ewULYOj7boTakyO3B2EdhCoPRQVnvUGvHw1bGpsULeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sevenlab.de; spf=pass smtp.mailfrom=sevenlab.de; dkim=pass (2048-bit key) header.d=sevenlab-de.20230601.gappssmtp.com header.i=@sevenlab-de.20230601.gappssmtp.com header.b=zVuaaYXY; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sevenlab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sevenlab.de
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b86ed375d37so123963766b.3
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 05:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sevenlab-de.20230601.gappssmtp.com; s=20230601; t=1768484387; x=1769089187; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zw5GHn+xllnurg1foWoqrPaoDHupvhAUrTC/zMdEzDA=;
        b=zVuaaYXYxN2IwyuQ2bjhT3BeD2eXqDRIAAOnzV9l3eWNjDtbgp7KQkHqXeWFjyljss
         aorE0J/cKPFHDMurE8v4aT8l+WErFzD9nvDFO8JtS+TLw/ob70cF1wMlbHZMCWoim9/Z
         Uc7KeFD5U7u9f968XF/UREWeU2WrzY3jZNsnQhVoY6sRAOgJ45Khzaw7oC9MlM/f2eu8
         a+I1LoaF17HpzZ+yMvMENsxzooeg6o1Fifb9cBtD3qFAdzsbtIKy/Y3NiyeMRONSO9nn
         JpB+uMvO4FBzq2zWyLVP4T/PCx9vq1ZIBI+Y3Zqa7MOTyHDdXFRW6RXAlaECRL21+Ole
         WL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768484387; x=1769089187;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zw5GHn+xllnurg1foWoqrPaoDHupvhAUrTC/zMdEzDA=;
        b=JufGEDWzQztjZzcGJNtLgyI7XJ90Qevy3fZ0sINiu+T8Xsy+p+0R2lt6Nbt3l3Nzfd
         q+rGEs38psAIgnWGsUTUnRCbVWygU0ZQrm5obDib+kqwmkDAWdL6DYIzPJ9W/lAdCM6j
         GnonfiGvUc5LnM+w7l7WIXlYWfGTuiep5oU0KXV/jC3EfWpRlaGWPFpS4gb4oADPw66d
         Pm/WNDp21c60oekNQbHEYbl4ducoMfdJtUIwKriR/zVqvxmMdaId3p4I7N4nBixiJwOi
         y5xVI1IUJNPcqXxPyL+gSALxKn5055PsY8sRsxoXdajtTVuA6S0Oy54rf6TgXwDaxxNb
         kY/Q==
X-Gm-Message-State: AOJu0Yx7fza79CIHbvVawhshfkY/7/1TxYEP7Jj7Lz0VLrciXur2Mm0S
	DG43wKXn/JNQgkdgd0Qi8ERBlxi0YmOE85EfV8v8hjOY1CjgCI/Hcto73ve6HZBJFQ4=
X-Gm-Gg: AY/fxX7H26DeK33IdVQp5CruEk65j1HAuSDQVumi1ZlqkGJol6pPaTxbaztO4ziyQF2
	QdFJHJilp04/2W92JjR9t7MpWCiTXrcIskLV6g/woJU0qGAUv+a+IChB1GekIHymIDFebTlS3Ai
	6EKwhFC+q9LNYxbVHtzgGvMjZfQSLvcvSdmjNWK+jdDaBv8zPz5L3zevzhKn//AS5oCGIXqyDvX
	8ZhxJt5dQReZ/AsIhleSSD9pyIdlazgzTYK3CEqhE3q4C4SYUlU1qFKI3biiozRfL345mDbuI/O
	zg3M6FMEYI2N53zmC+JLsOtFzRw9v+OS9yJZci9FHFrkeAGuuas2AWrdRsN2EhmWxZTtFt9h8lW
	0l09lQ9iMrk/i9mfmCL69dvMak/G2ipSScznS9+Ux+wBu4YoybwDwQFyNIKjGiWvVpc3f9Zy4Kw
	q9SxB4vL2I8ExUfNPNtd8BC2j3AlRt9eAMzw==
X-Received: by 2002:a17:907:6eab:b0:b87:34e3:a795 with SMTP id a640c23a62f3a-b8761028880mr531174966b.26.1768484386904;
        Thu, 15 Jan 2026 05:39:46 -0800 (PST)
Received: from localhost ([2a02:8109:8a91:de00:3860:4306:f616:8f87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f9a9103bsm1458424066b.30.2026.01.15.05.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:39:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 14:39:46 +0100
Message-Id: <DFP7E7BGWMP0.T3BHEX68KHFJ@sevenlab.de>
Subject: Re: [RFC][i2c-tools] Accept device-node path as alternative to bus
 number
Cc: <linux-i2c@vger.kernel.org>, "Jean Delvare" <jdelvare@suse.de>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
From: =?utf-8?q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
X-Mailer: aerc 0.20.1-26-gcbffbc9ac803
References: <DE53PTBTBBBY.24N093ZM03IKQ@sevenlab.de>
 <aRIPsOOgs5jtxv9D@shikoro> <aUAUAG3KwQHHqgKq@shikoro>
 <aWaDBzAOm86XSZgP@ninjato>
In-Reply-To: <aWaDBzAOm86XSZgP@ninjato>

Hi Wolfram,

On Tue Jan 13, 2026 at 6:38 PM CET, Wolfram Sang wrote:
> Hi Gero,
>
> On Mon, Dec 15, 2025 at 10:58:24PM +0900, Wolfram Sang wrote:
>>=20
>> > > I'm working with multiple hotpluggable I2C adapters and have the
>> > > following proposal:
>> >=20
>> > From my side, this all sounds reasonable. But we need Jean's opinion
>> > here, too.
>>=20
>> Seems Jean is busy. So, from my side, let's go. I can apply it if all is
>> well...
>
> Did you have time to develop this?

thanks for following up on this and sorry for the late response, I'm
currently occupied with other work, but I have this still on my TODO
list. I intend to tackle this once I find some uninterrupted time.

Best,
Gero

>
> Happy hacking,
>
>    Wolfram


