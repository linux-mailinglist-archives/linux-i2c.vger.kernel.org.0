Return-Path: <linux-i2c+bounces-14201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A79C768BA
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 23:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 708302B7B4
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 22:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431242D063F;
	Thu, 20 Nov 2025 22:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYzWl4uu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C58283C8E
	for <linux-i2c@vger.kernel.org>; Thu, 20 Nov 2025 22:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763678962; cv=none; b=L34lP1BrTtIXoI0uRg1lk9MOEHzTLCSe5n4a3zEcYjAMBzgvnTCCS1/Gg+crMIlfN68zBZUB1yKgGdzmVm9UyQ2L4y7fAJoNiTTx0wHzLD3GtZFt07txVId6fGbs0SYwtizOWvZJ/PROqn0r4a64rZVDtYrTlQNbYd3u7UG+Vu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763678962; c=relaxed/simple;
	bh=TZTm1KdXogUuvpv8+/5svcfKByUPlJvaEZ+d+WpSheU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCGogiI61d/BxWzLGFW8H5r6AceOiyY8PRwH3gLi4PXqFQohMwK8M7FV0udZIEZSmSOZMvfSDMDAacYoZhKOeffY4lE6ysLELY6U969KQz8VxQezMrCmNXOwxF9YW4grTUJCnt3UBQ2W7uY/2cnOCXC5LnYcfCqnLJbjdUdSPts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYzWl4uu; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-644f90587e5so2240823a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 20 Nov 2025 14:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763678959; x=1764283759; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TZTm1KdXogUuvpv8+/5svcfKByUPlJvaEZ+d+WpSheU=;
        b=TYzWl4uuhligAWhKMktHJf+LYUyy0USA6fqbo5oJrPFdxIVVt9bP5QPKuIqarhX4iN
         nulFYbDkdUZh7Ebk679nvBz5kRtbBW3tFSwMksinX7jSyN4mof9ubOMEOb/J1c4x8k8X
         Pwss0mOOK7lP3iu+3NDRxVXBxTN/7lz456hrpLhzKP2CXZpPRIjANHPeRgAHSvBqjblz
         iwwFpvoXKOb6BZki/fkLAMj2tdmv3Wty4UhGMAgucGAB9OAQrlmQANGLcHwAIsWWJoOS
         cGHaNd8or9Y1u8/r/O5MQxGyecPMf2D4bRi4E6ozGvzlZwNK/4Ws6Xj+t6FobfLCL4Pn
         20SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763678959; x=1764283759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZTm1KdXogUuvpv8+/5svcfKByUPlJvaEZ+d+WpSheU=;
        b=rChgMJpiGq8LJXiu75EAdGEG+P0ztLrV+H1V5VXXCmKncdndmrgO8ZFoPWeIQkDIaJ
         zbvhFhXAUFoPl9gXvesGystric9zHs7ktEOPR6KsIriU4sYxH8fNsmr1v/okL/OV1gta
         hCl8O9M2aND0AbhOzStf1r5cOMOUe4El2CBEm7Xkx7bR+2bdSsu77U7aiu7k/17I5ry0
         NsUtamNdGJgQ1GEuw0Kb1htWBj3ckW6//NkN3vQrmelM+nX4TvGBk1jdpLBbUEK/WUs/
         OKpgxucT13bPKv11prvgJP47d8Y9eNoEFK+DxJAFv95D2K3Jb1h5sJcDn8eiWkbwxXIk
         pyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg/a+z5bvYbfgE2vpT3RuZfqimexTOf0bS35nNNCOMxKJjYZJcgtH4lXMpQsVPjs5piJfruvDRlfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnClSv6pEl0JiLofFxKknk6VZRdWvoUFU5A7M95D47pUqtyPJz
	dbqznN9SN/lYxSxQh0ZMWXYOZwqEP12BoFtEVcrs9Nb6VW3DWEUEl9jHIpn9KjP7b3lHb5XeyUo
	mjVcNCq9/mTlSffxQnmjUX5TtgMcXQS4=
X-Gm-Gg: ASbGncv5ww/Z0kvqRt01zblGytH/ko1iGL7r78KUvEzhebfbJwobhbNtItPRsh6vhqJ
	w2bMht3rO07Kec5vt8KxSc4/qVdXwRBP5xzrBw7kWBjsr7v0ECjj5PYf2pqsfIDH08vBW/lODTE
	nr1Q5DgklKgLgYVHwmDVOznMZC++ki/wVvN7+Cx2Cz90xWIalNUr1DO8FMDB92GPr8cL8Zawjw4
	sD4dzbfvykGBSC8MC42l0k5f9km/p7gO0xrosUB/S4mypfqYDS1BZN8Km1DQtI0XfKPxb3I
X-Google-Smtp-Source: AGHT+IHKwpyg+v52f+pHV5U37obFY04/64huJBo6MAD0+TDJvb08kyIiQwLSaQTEzl9foZt1tjFUqd0jDlHtf3+OMRo=
X-Received: by 2002:a05:6402:35c8:b0:640:952d:f602 with SMTP id
 4fb4d7f45d1cf-6455431cfdemr324366a12.6.1763678958544; Thu, 20 Nov 2025
 14:49:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+=Fv5T4PqVOFHnad_aLoMcYRZpg4Oenrmn0XYvb=Gjt1+5L7g@mail.gmail.com>
 <aR-U3kr-IyXlgYdV@shikoro>
In-Reply-To: <aR-U3kr-IyXlgYdV@shikoro>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 20 Nov 2025 23:49:07 +0100
X-Gm-Features: AWmQ_bkccRsVP8mo6oyvK6LSHBtKwz14nWfckkRQQ-JXtTRQd1XJ8wueWESeCwY
Message-ID: <CA+=Fv5QbDy_2G3KiXF=asX2+61BWMWE70tz3nr9XE8_KhwRNmg@mail.gmail.com>
Subject: Re: lm75 on i2c-elektor.c
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> But then again, there is also 4b16dac1d9 ("[PATCH] i2c-elektor: get rid
> of cli/sti") from 2004 which converts the driver from cli/sti to
> spinlocks. Maybe it just works now?
>

I've been running it for a day or so on my UP2000+ Alpha with an SMP
kernel and haven't seen any issues (I manually removed the
BROKEN_ON_SMP from Kconfig). I guess I can keep testing it for a
while and if everything seems fine I can submit a patch to remove the
BROKEN_ON_SMP?


/Magnus

