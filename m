Return-Path: <linux-i2c+bounces-13160-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A770EB9F0AD
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 13:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D33417AB113
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 11:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD392FC00F;
	Thu, 25 Sep 2025 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4c47W8C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F47529CB48
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758801410; cv=none; b=PGH4YL4hhKueBykftWZ5933+pMwaOt10VrvOvQ8qidHvOQk3NgutnBlxjh6JIXCvrTJS4fceL8iDf2/VNXaVTThRtLrOcfPzhuyKbnjPApWQauh/SCzoJaFYsq5u1nY4LCvwHCMBKy3nOPZAuBWxCvEs2MaQ1MVKC37GsrPWCUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758801410; c=relaxed/simple;
	bh=GJqh7hJapGBjQaVVqH90RWbwEo9sgfEH5QNd0R5I1Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLZdr4DYYjW5koYPTpLfzn8ZS5NxkxU3UpwrPcvgwciKXYtqcLKoasVo4TQoeQXcirhqnjXrkEmZrwRNpj8uMpS+gedBVecwrU9+o0TzLvBjgijGYmlyrExJz7cuaysJHDW8tL+Ki7hiT0MYaHp3iHqnSDLU91DrLrLEufqQris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4c47W8C; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d603b674aso7183467b3.1
        for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801407; x=1759406207; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GJqh7hJapGBjQaVVqH90RWbwEo9sgfEH5QNd0R5I1Z4=;
        b=J4c47W8CzN19jRSCP1kROotg1gGJpctg+1Gn06so9yWuaDGu2d0rdaFyphGI7DoQNP
         uRl4O5wPLWlb1UGg8BmZE3+S+BlPM3BTWMg2KaTeeG9ne9BhOysKTMnTpqrU4P+YQLyU
         sKOjr53gE6HehkJl/ZY457Q8XdDdtgrrDXMqDZ6NS2c44Nz1n71jasEZvS9D8xd4hEhY
         8UurttWVQ9Z17zYTJ9yG8tZy6Py0iYfbL6uXo3R5xky+fKAnYFoWISfe18D86VJzux90
         faSE1Fy1YBXxK6VjTbrjQXLM5Wv4kf5Snd3/B61HFiAFp14QdckYOIJogMPDYUXOk8AU
         1h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801407; x=1759406207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJqh7hJapGBjQaVVqH90RWbwEo9sgfEH5QNd0R5I1Z4=;
        b=Z9I6f7pFowJpkkQbDg9BrEKUSJ0ICdE665Xbojl5MOTOAALKNWMn7wfKposhntsT5t
         0Ir0Wy9vzkDVLFDPv6mRelvetMOAtAH1+he8f689VA254uTTh0Lav6q2/yZJVpIoVxxO
         A1ZEsrfJ2Ui1lipz3Es2KwP2UpKilCCUmUeNzVgsYbYl8HRC5cvYQW0ixmpR7CQe+6wD
         ocU/ETIvETXiedAARFgY7poQH55baMtWSAkoG16sfp/hVgS2kd/BudzEcMXRgLzcUbaz
         JAE1LDx8OefNg3zCnmIi33uHy2hdCLDtBRu2akZ0Q+58JnQgSK0yZ3i5AWHbgqhnkBUc
         UB4A==
X-Forwarded-Encrypted: i=1; AJvYcCWyLgifqd+8RVTf0DEYlxSAj5PzgJ1FMycWPqBATZrJTmvfAi9+nu0eQaWeT4bu1CrPC+4YhY3MwyA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5dQhS35N5kUhWBFsGDp59+ebHIvfyOYyogV2/PT97ahsCqI3F
	lnM0VZSsPgRErEtPavBm26eEHAeqxb91NUayEJUuItPKbsvNjVfNcZBBJLV1u1LxD7dNEa1zip+
	trqTJmtTjpTjOg/Ihpj2KncMqjK/ssXo=
X-Gm-Gg: ASbGncv7UXD5jyLwzRZs/jyvWtH5v03Ccwm0RJ9MrBK9r6AWEI+m7yJ1sfl2U+A2aIp
	yeozNdyZpMasdmy1kcjKBjADnskirRekp0G6ayF970E6N6X7YAlSkXhxNuyaQpEVi3t0Uug1b5F
	57kX1NFwmj0B40nu8/0CrfsMCRqO/FF5WGGV0T5Oc6EPvkfCHEXoRupNC6kcA7kPh4m4ZGnPiDF
	4tjCwAlQ/4R7orj3EA=
X-Google-Smtp-Source: AGHT+IEplHgtgh30Y5yODVkCJBqFWZlXiCiCnMqESCH3VBptjDoczSPmQ6R3E/qNth8EPp0gEWOe5B85dha6Ng7giHk=
X-Received: by 2002:a05:690c:6087:b0:721:10a3:6584 with SMTP id
 00721157ae682-763f7ce0a9cmr27606027b3.11.1758801407524; Thu, 25 Sep 2025
 04:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250907114557.15453-1-chiru.cezar.89@gmail.com>
 <20250917133524.85063-1-chiru.cezar.89@gmail.com> <20250917133524.85063-2-chiru.cezar.89@gmail.com>
 <aNUa-9HcQzyjZkvE@shikoro>
In-Reply-To: <aNUa-9HcQzyjZkvE@shikoro>
From: Cezar Chiru <chiru.cezar.89@gmail.com>
Date: Thu, 25 Sep 2025 14:56:57 +0300
X-Gm-Features: AS18NWBcWGXPf8-vty6zQqZyFzkeQoggcj9f0bDrT04xHEPfn-LMcx_PIT8Wmxg
Message-ID: <CANvS2vUHZ4zVLwhPyr6oPkAXuVcd3zn+8narVzMuoUoP+uxZDQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] i2c: pcf8584: Fix debug macros defines of if statements
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

> > -#define DEB2(x) if (i2c_debug >= 2) x
> > -#define DEB3(x) if (i2c_debug >= 3) x /* print several statistical values */
> > -#define DEBPROTO(x) if (i2c_debug >= 9) x;
>
> Given that nobody updated the code in the last 16 years, I think it is
> safe to simply remove these debug macros. Are you open to do that?

I can do the removal of debug macros. Also for the other changes you
requested I will submit new patches with changes requested soon.
Expect my work by start of next week.

/Cezar Chiru

