Return-Path: <linux-i2c+bounces-14198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF01C752B5
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 16:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 389604EB0FB
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 15:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69722DAFAA;
	Thu, 20 Nov 2025 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5PhNxTL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DC035B127
	for <linux-i2c@vger.kernel.org>; Thu, 20 Nov 2025 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763653334; cv=none; b=oEy2I0gQHnyMcTL5ZCG8XTR6SVI/S1gFtCjj3IUWil7Bka4PE/SpdyljLEh38Y02hdhjX35OSvL1TDIo28lH0UZp2h9UveKN+6NAFbTuE4mjs5+eWmxUOx8zV/KkS+IwDjw3QTHzH9HWWjPuW7QqLfHfaTkt8G2savNLhsI2dDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763653334; c=relaxed/simple;
	bh=XI1JWpCqYD5Dylk+P5KdFZ+Pv79k5e45g/kGhs+pl9k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=XxzFtnvVtOgnDYW+RFVCVHCM8wfpRqrpxR70Ji43lXMZTmW3FrniSDANoK/VD6o+kMkl4eFuCdKwexRNUVdpl5No46TNCvrhIT7tsXDQcyqEOv3/aA3zO0KiUqM8RauMiiUXqDuf603Vq36nbW2x8euGuTetQPoCei0WArSRe50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5PhNxTL; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so1711018a12.1
        for <linux-i2c@vger.kernel.org>; Thu, 20 Nov 2025 07:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763653330; x=1764258130; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XI1JWpCqYD5Dylk+P5KdFZ+Pv79k5e45g/kGhs+pl9k=;
        b=Z5PhNxTLauJ8qjySa2ndakNI74D+WpJnfFtsvXSEkuNyoWmLHm2Om87EhWq+rSHxym
         3HxRV71mQmwPTQxBR9H6y52Ntewo5H069f47MFXKj6UEyxODkYDW7XuJDf9CRNd2/RVC
         HweCR9V8vX0AYWB0Z0osL+S6XFHoCf6Pyo8P0rhhCkba6DZZKbazn/nKMr0nXlGTYNm5
         mBoNGuc973ju0SmuzG3OxIehK3+McHRTYDEr2JtyenVkNQAPfg2uDosjfHEtuImtEYeT
         PtirwQdcY5MKf3ICJNkLB9NJoM790etazzi2GZoavxPVQPCt6aJMmkpA+U2bqQWJNDTz
         2rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763653330; x=1764258130;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XI1JWpCqYD5Dylk+P5KdFZ+Pv79k5e45g/kGhs+pl9k=;
        b=PUVrw02AtUcv+F5nHI0sfb292kD1lSBHAYwRZ8rBm45Bj5EHcabR7fT0HdsvNCJTwi
         6qvw3eNWmuURRFhC19WUkdvHUkoLunl2N01cH2pHZFmvoe3FiUgZ4QEXq9jK0o1bEuER
         VXL/3W3Ll5bHMpAmDyefZo1eDy64APistkCTpg4yWJwLFdiPUP+IQrKQFElhZek9CQLz
         5xbi/Uc03NeOfjDCv3cxuTbbfiHEnZe6gbF0PbGQxf68QRuv4xKy5/KLI4VG56xu06rU
         m2OUbEbihG4AIL8PvFAkY6CElBi59dyjadFFKDHfgd2N17DxhPrwNKucoHT/GBK+582X
         6Q9w==
X-Forwarded-Encrypted: i=1; AJvYcCVBIozdJ6xe9eIbtBQDJxIF2Hy9+LizmWsoCPOOGgYNm6fZHkEhIPNcO5bTO1+9TZ6Ikx6ggrQqy/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaoLEYuozSh3PII3UzEOys2SwtWgKSS+Cn5yfubE9xTRAyP1K2
	EWb5/HcmkuFsbLHAJ5sYKZS/Uati9+jIwHXwEQgbrDlA/n532SvBdljNcJyTLZmLTd7/cLfib6J
	YpC6AyNRbL6oHchRcjUeHEto9fCITl9I=
X-Gm-Gg: ASbGnctYyjw/jh76INOvkXqY/1qoaJwZB83PBKQvv3i0suc8nBi00IdMGSV3KsJVCJK
	XUxjLPNGmcr5ImAxq1tItPKooqMOyFwwPF6Iwn1W15lu1t+N6A1+z67hIi55jJPDdbci+c1YuFa
	G46POy+D9VRfZxzVHrSSzsf/aGKUj5ZpXbScKLGjLHmMtpVLLdxj/eTDdpVAKr1t0HSPKWSytF0
	TlyQSq8czvmJzCN64uu2XsASmC4bzvJZP+pD+pXC86RRxuIYlQvdb2ugX2AMYcZvu1ovZklTMq9
	VFDOyT8=
X-Google-Smtp-Source: AGHT+IG9wP+C+F62AlkxKvQ8suan9EXseXD06UZ7wfrKN8YkAH1EOnehAY7vrUiZ+Z0mv8MP7kiEe7eiUYrlsHtMf10=
X-Received: by 2002:a05:6402:40d5:b0:641:72a8:c921 with SMTP id
 4fb4d7f45d1cf-6453647b255mr2928720a12.23.1763653330282; Thu, 20 Nov 2025
 07:42:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 20 Nov 2025 16:41:59 +0100
X-Gm-Features: AWmQ_blYO9ZpqHUSMUUEWfDpxwgLVgfkcnBDaEZBafKF0WipmhdkiDKwlezjCkM
Message-ID: <CA+=Fv5T4PqVOFHnad_aLoMcYRZpg4Oenrmn0XYvb=Gjt1+5L7g@mail.gmail.com>
Subject: lm75 on i2c-elektor.c
To: andi.shyti@kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I was playing around with lm_sensors on my UP2000 Alpha board and things work
pretty well, right out of the box. I noticed that the i2c-elektor.c
stuff gets disabled
when building a SMP kernel, does anyone know why that is?
i2c/busses/Kconfig says I2C_ELEKTOR BROKEN_ON_SMP.

Regards

Magnus Lindhom

