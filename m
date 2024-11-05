Return-Path: <linux-i2c+bounces-7775-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF579BC557
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 07:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8B701F24D6E
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 06:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14191D5CEB;
	Tue,  5 Nov 2024 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDFgIUEv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37D61DFE8;
	Tue,  5 Nov 2024 06:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730787681; cv=none; b=ih3smCWuWoEbV6VlCEHO1c82ZcsLepxipfN7S03Jfuj4sO7bQNClp3cmS9pVz+zDvIpqvYNP7ZArMMp46rdwVqRnUFBI3mcwyiQTpIqTXrjAT/e6/q6iF0KyoAORF2Qsq3wcBaVohSv5/6ucUj/p+mg01i/oyuv2rrhlOqe8RDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730787681; c=relaxed/simple;
	bh=kk8dszoqp8PqiEkZB9fm5YAoTt8ToqdKlYqHvKHmOa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlJS7697aGpqVaEpgQd8jHgV0+YIKxO5wflOiHia7UFc2Hl1LUJkb5pB+ldLjNI4O6bbvH6X6jzxgOA7Vcd6hkQ3dI3Jh87RzPlUPvyzJSIbvx/wk0rnGKfKQnce0EW8LOlhYdbgGoWhyJmbgz67Wx+0NgyU6reS25ArGlqzh3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDFgIUEv; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e2e340218daso5050854276.0;
        Mon, 04 Nov 2024 22:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730787678; x=1731392478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t3wFW12/6RoBqXny0VQWOTmH5aSf+LWh0KZ4bCkVkr0=;
        b=UDFgIUEvoXQ0tOWsfZzd1cNcMKWGiquULIjrzIFwCHnkVplP2eDnjXVmcLVPlfFDMe
         KQ6qiRkSrjpLMaEM6Byr4D4Q2bh5ZZbxkXwis3FWGZWaJ8jG/tIDSX3TVXVswvjx26rw
         6IB/Ur+rmXACuoIxpa8QuGq6C6/ttJ04ATeGt9gdGLMKL8eML3RnLH3shH47tzEEwqcq
         sFct5hre/HVGudfOOMnvwuXZK1Cic4ONXk+3hWAL29PQJge7sBYozlLuDpWFsMuTFD2e
         i0D9I/9rlxwZOqEQjMM+kOhdhCbv9w9CFHJsohW36p/zQxnT0bHUjSUEgG9pMXv0moqZ
         iA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730787678; x=1731392478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3wFW12/6RoBqXny0VQWOTmH5aSf+LWh0KZ4bCkVkr0=;
        b=FtCWOynGII977DVSQlLV7a4hsKaGZpfuH/i01hoEb8OLqcsBqlQtwY/lu6W4Bzr3x/
         N/f2vO6LVxKTSsl4rDbHcGYbMbijOeIAlPvjRB7CYzUM5QD3ORt7067Byus4mDDNEyQt
         S6Fs7soDKuWK/HLQbriF0yDF3fdol3YqGj5l7lx3CammjhHRiDcQigBr6Y6Z587oLmg+
         wGZvcKXa9mMnTQm5cbJ6Oee2TbZgx0DK4gVR+ue6x7aTHtQSVXLvfQegTuFxrggFv/7l
         A8yZT19UAYmwHvlEMpWTH4DSaECgCP41sX3Jzci6m5eddsVJaIKKPcTAIqvAcuhJRIrt
         dpsg==
X-Forwarded-Encrypted: i=1; AJvYcCUi/RTmww2fBBEhsWqJ9/KHrrITWMZpj5STIQw5d9k+Ra/jL6dbQdMsEa9LQdmhUwZbHhNPuVGq598=@vger.kernel.org, AJvYcCVEMTymjrGQlbPG6Js2UUFRG1IKGf6bB1OcUm7yKQ62B8rGvZmIvkRCQxVgwYcE/dqKYCIC1L9Keg4112E=@vger.kernel.org, AJvYcCVI/7mIgZg+iIDJO74Jp/dytKeSqMLQvWNkkHClT7dcXc5ucMJpdschNYUSGFdF0c7PBIj1AbYr/L+gGJ04aHA=@vger.kernel.org, AJvYcCVQ9jkFV2yot1V4G0v7SmjTDxV1ezvqpoPZBjprZuGJJGy9Eg7uBIB+zb7Nc7dKRo0qokRR+GX71sRi@vger.kernel.org, AJvYcCVV2bUUeRfQaEnzYcTJbqP3pkZe95JvP4Dxs4qbst2psN0Iv4a0+nxczqm0sX+TL3wKmq23LZ7BqX9Ym8gY@vger.kernel.org, AJvYcCVrcpzf0qWH+i9h0n4UyAoYiN2ZMJL8QAkL8dKCirEXu9xXQHFDCCwlMDkGEbpuaeBEC/0Z7XwExPLsYQ==@vger.kernel.org, AJvYcCW5uOgORflXjroIlWko1DsoP3ZEf0u7Sjrzj0MnCMc6hRTHVxIlv2v28IPGMYukfQDsZW0tBzs9Epxk@vger.kernel.org, AJvYcCWDeBrSTQObBrgZSLyQwPtZgM2+iQYA3di0r2Zl6blPG7D5E1s6hn8KiU2an3+P/2330sjEg8Zf@vger.kernel.org, AJvYcCWcFjTndcE21ow7Scl64CaeiJgtoDLmZzmd38/JFDoTzBlMeksMZktDy0fvzmJzet7ht1HngbJ5x/wJ@vger.kernel.org, AJvYcCWrEZCgWtO8USER3+roGYiOPHQ9BYlc
 wEYOntV+6fYSQYOvzN/14gEZ75o8HLe14OjKuIcq1S330o2B@vger.kernel.org
X-Gm-Message-State: AOJu0YyWHGP4ZAPPfIcq23xAHxbqPgWVbn9m11d/au4Dyj9nnlXVY1id
	CKBvSYr6Rwq65vvv6t6JDqgncMsxdoDPj29Nk5gPCRbyc2IXgdfOtiqgQ3BD9AzuuEV74L++Lsr
	B+XnmiQu99yBFqErlyAoOeLrRHiA=
X-Google-Smtp-Source: AGHT+IHa9Wl6kaZMC2Iqh+PZ97OJD2htTC9UI9oFXhLn0ebZGsBU/q2UeprWViXbP5D6nHQs3LLDaTs6iEW2fsyU8bY=
X-Received: by 2002:a05:6902:15c4:b0:e29:24c:1d82 with SMTP id
 3f1490d57ef6-e30e5b576e7mr16882810276.38.1730787677760; Mon, 04 Nov 2024
 22:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-8-tmyu0@nuvoton.com>
 <20241026154113.66fe0324@jic23-huawei>
In-Reply-To: <20241026154113.66fe0324@jic23-huawei>
From: Ming Yu <a0282524688@gmail.com>
Date: Tue, 5 Nov 2024 14:21:06 +0800
Message-ID: <CAOoeyxXmOE5R03Gof9zXS_E+32AFaY-miPN7jNZU+2GGX+nsKQ@mail.gmail.com>
Subject: Re: [PATCH v1 7/9] iio: adc: Add Nuvoton NCT6694 IIO support
To: Jonathan Cameron <jic23@kernel.org>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Jonathan,

Thank you for your comments,
I will make changes based on the part you mentioned in the  future.


Best regards
Ming

