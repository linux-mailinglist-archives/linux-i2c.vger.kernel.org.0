Return-Path: <linux-i2c+bounces-9523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64656A400CB
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 21:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08AE33B82FD
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 20:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18296253B62;
	Fri, 21 Feb 2025 20:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acAJ9OhE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435E1253F05
	for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2025 20:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169580; cv=none; b=IlXfx2De/AlVz6fRDVKEss9dfSptn0wZpugVG6ldv7hIrfJqsuDheKgvswttNPwwLZs4IKNo0Lget/SvopBYO57o2y2jSIYat7krjzE1ogt8AQIBahJwg4v+kZgWAIU5wVKgqrAQUkfKcMABclPLU+4fxfAj6HhoXbQQytWlL68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169580; c=relaxed/simple;
	bh=65n/0FsSNCfEuk7/zWvznr+BbXFjVzFpTznDej39TX0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=f5bI891uSYpnDO/TVskECyJZjqYIotdL4garCps8Wxq4N9uLSLraCOOn/O6JVbhm4rBhi1yi/vFpSzTSk9hUo+0xjhiRxOs1yzEZWSKSgs/HNR6AgnOI77Gb6gXqVzfFXtUMl4yFNQ42J895bdnQuYQvvZWeSRIx+dkmKASpN5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acAJ9OhE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f2b7ce2e5so1460010f8f.2
        for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2025 12:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169577; x=1740774377; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J63flhZUL0lxtAviQ17z0r//eaR1dq+zIGVKMtfmI8M=;
        b=acAJ9OhEey3KMeSXZCfKpo4Ov6BIH3D3LCtQE1RIfuHUarRMahq5VpoXkk0eQGxsP5
         +VYRhA47u4KcPCRUwJj2KPhn7kk3hNpB1KFxmf0HBEBqdUYtJovubSDUrvUi+u5MzVVi
         JsFvu5CMeaY+CuIX7DodImxbxwMsNFvKOdVJnNsjSjHOPEOJ4ol0bS4uL8rdKZ+yLkB2
         E/RFVLu8riWYcp+wjqIgNdq1B2Hf1JkVW7TNVuXte7vg4XIDzZzHsVNO6M/rvZzRhYat
         DPJN8E+2j6S6YkiZPQuAX6NVdnC42lDsef2HSw9zg5BwDjHnl7r02sKeI1EXj2vHkwn9
         tmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169577; x=1740774377;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J63flhZUL0lxtAviQ17z0r//eaR1dq+zIGVKMtfmI8M=;
        b=gr2zZhgAdN5k6tneZXr151d/IFuTTs5BTvNWtb28lVW2Y3ziN2Yk84t0u0VR5RPeXZ
         FUq2H+zbqxAAd3ly2mapQl756dujYiGwbB2OccsBzUNQPt+PeY1ktq+GkeC4wMVv4w0d
         QxlGT90xsWhhfxJ6R9wUIbEyR+39YhP52+nimiki1QW0Pk9H7I8ZM6F60xtTcAf1z1vL
         UhMlSUKce3tFsGuMXhELflfrw9c0bzlXzx7Nk0wUqtjA0UJVbkm0+sc1WK/k4vNUr4sN
         Np3huuExQStBUEhWltkd5GAGNBSUR+h/UERO2pVL3gkRB6guBm+BRoyP/O9a98/azj0e
         kjYQ==
X-Gm-Message-State: AOJu0YzoN1ZdYwK6++ko45B7lhL/H8Ou6+nnF0mV21EkYgAP7H3xOTlV
	HNpSwJe/7SRwYIm48vWmI4HCi5vJL8UbsrgXBsQmQbPbx6v1BDk6
X-Gm-Gg: ASbGncvduw+TNhU25YrFtAcMAFQQN7ii4JWM8GzRcpSanJWUQ6FHGdhM8aFTqcCD6Qs
	q8tYOdnq03AciGCKSHZxXHqmavx6VqDpp4vl9ViOp0S30eS3AtbonRsbZSYyCTsQ7wGqbHDdCa2
	Qh1p/Y3UPrnQ4ia11pM9WuWVwurSZfk6NDVGVAUI0ELPtDYMKZ+bxNVNfskQG14SDW0HIJibtXC
	FH393qyy23ozPkVLQFvigo+xZ1M4PH12jpZ420osokD1T/jBAy0BWU+ncybHVPRilEvwA+G8kQT
	/dmApvYU8osqAeoPyefhI0PiE5WR4R5eftcnVTOsYiHd2TyICZBDa8D0utsnHovpIziJQACzp8l
	mb3oZhSePeBLfPU1yeet238uSPE1Xc3DmjNP2ujJL6/ChJDUdUIqX9uN6RY46Q/B+AQ1RdiRKhs
	qJV0rYaf3i1QLm
X-Google-Smtp-Source: AGHT+IHnQvBmyMb+XNY09SO9srF3/sGY58I/A7X459CqbrK6/SDuwoU8AzNrwvfTdKUVTf4WaEJajw==
X-Received: by 2002:a5d:648a:0:b0:38d:e420:3984 with SMTP id ffacd0b85a97d-38f6f095a58mr5005658f8f.39.1740169577361;
        Fri, 21 Feb 2025 12:26:17 -0800 (PST)
Received: from ?IPV6:2a02:3100:b29e:900:9dc2:647a:dfc:6311? (dynamic-2a02-3100-b29e-0900-9dc2-647a-0dfc-6311.310.pool.telefonica.de. [2a02:3100:b29e:900:9dc2:647a:dfc:6311])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f259d9be9sm24638721f8f.79.2025.02.21.12.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 12:26:16 -0800 (PST)
Message-ID: <f620328f-1e0e-4875-916b-544181a13f0b@gmail.com>
Date: Fri, 21 Feb 2025 21:27:06 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 0/3] i2c: i801: Avoid potential issue in i801_check_post
 and cosmetic improvements
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series avoids a potential issue in i801_check_post() and
includes smaller, more cosmetic improvements.

v2:
- rebased

Heiner Kallweit (3):
  i2c: i801: Cosmetic improvements
  i2c: i801: Move i801_wait_intr and i801_wait_byte_done in the code
  i2c: i801: Improve too small kill wait time in i801_check_post

 drivers/i2c/busses/i2c-i801.c | 120 ++++++++++++++++------------------
 1 file changed, 55 insertions(+), 65 deletions(-)

-- 
2.48.1


