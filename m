Return-Path: <linux-i2c+bounces-2759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE63898306
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 10:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78DDD1F2344B
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 08:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B4E6BFBB;
	Thu,  4 Apr 2024 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MQe8ddn8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7785679F3
	for <linux-i2c@vger.kernel.org>; Thu,  4 Apr 2024 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712218724; cv=none; b=Ztuuj69fidhBC7hV//wX+RNI2PK7Qt+Cl3yg/hPR5a+ehZnhYbQE45bB1LrNnOXnoSni4iH52i8hMsvCnF4Zv33k+O42RZZQDMI1nqAct5ZTTuCYD6uUe3//FBEMndnLxtLQnpP8k8b8/lUSBAxqSjsqnW2jy3vJN5LjP6jZFQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712218724; c=relaxed/simple;
	bh=eyAd8Fm3t44gc7qEKT0d4Zv8xoYimRNogrja13Iomu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/iaX0WhAb/dzUfXH14s2KcMev/i+Jal6Nr2cVN8oW6ZO83+ltydK+mYswxFFzhDpU3uK5ON3byJNsUZGcu0YvCSzc4EvtpFbUc/WdFGN7Wb7PCHk86s+eJ9hSXg6QlyF8psQVgTMALnxXN9fQsMrYHhQhj0alkSM+y6YtoCzt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MQe8ddn8; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso848599276.0
        for <linux-i2c@vger.kernel.org>; Thu, 04 Apr 2024 01:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712218721; x=1712823521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyAd8Fm3t44gc7qEKT0d4Zv8xoYimRNogrja13Iomu4=;
        b=MQe8ddn8hPCohkddiIdfjpxUkDgJfFcLgz578s90FL1abBGWq05W/lle5UAnhJLadA
         EfqU4JIiFXsKnpC9HVNB227hiL69Yne4IdbsawEmjvi80kZuAtpopTdIccmEHVcXq+zD
         Xz56eU0Wd1xhiuampa6zSfTZruO6Q+ePOgzKMeBqKYd90Ya1ygSjImtBE4Xud0KFnvpP
         7WcL4GgiXD+SPPaH4OGUK9cdbdbMFFO9t1kK2UO2Hmp1gju0ScVA177lRivKSOCTlbl6
         UTDva2eOtgb84bZJsHelg52wi5cOf7hiYaqx4E7SRGlWv405pZZEhby72I/YMxkfeWFQ
         tauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712218721; x=1712823521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyAd8Fm3t44gc7qEKT0d4Zv8xoYimRNogrja13Iomu4=;
        b=a5kIPx9jtJ7MWqlX4vpi5qqJZJJIq9xxCT0cR1KVg8I6nKQHHGNvH/tFa0f6I/aD0B
         aZJGaIeh65LBe3ypPz5jTDCGc/RfYFMgHZF5X1c7qFYtbCrP9K+nfnfUIsXCEMw9/vwY
         vaEbXtwpwCpbfrROIPdLWYjHcvuVlsGUDLzI1fTHChTn2DFYGOiZnsys/xHL27DwZePV
         5t4epNtc4GWVn7pJyCmprMjqOdu9KdiyJIgc8pHkVRUMSDYHvIdzXTBvlzSA8oBlk9fM
         FHBG3fUYH40Om8wF9NroFyaoHb6qbgOhX7ia74TtiYuWO7SklYTqXTnWCWP1dY/h1b4Y
         BPtA==
X-Forwarded-Encrypted: i=1; AJvYcCUj8RPuBWtXvSucabttmxB3EptfumEuExHv0aT+d0FXen5buUX3yaOd6lP6HNebJKs+yRep4noGPV0vNEIme9u0YH0blawS6pYX
X-Gm-Message-State: AOJu0YzpVKQFYBT7+yxHA5Xeuuz1bb4b+1+P0Ui9sVNdYh8afrhjQr0x
	NBD/VOgFWXR7px+4ZXvAHAz01ehNwzQfBfOYL/tmhQJKjuW9RM+oQ0X/xUJuwlkjXxhHNP7eqbl
	kxCvge2p1040yvD2UdAVJdDzZKmTdf3HkQd9xtg==
X-Google-Smtp-Source: AGHT+IF10RS0Ghp5cgYZUvg6PBzUDvxfLN9KgcqveP0TSNC3zgxigAL30JAOcgZTHb+RkMpEFaPK7ZHMMNnVTswBtzY=
X-Received: by 2002:a5b:d06:0:b0:dd0:6f7:bc3b with SMTP id y6-20020a5b0d06000000b00dd006f7bc3bmr1651889ybp.10.1712218721029;
 Thu, 04 Apr 2024 01:18:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org> <20240326-module-owner-amba-v1-15-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-15-4517b091385b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 10:18:30 +0200
Message-ID: <CACRpkdZa7mszi45M72qKPM=NJtou1A5DjVVUFzChFtZwzwVZyA@mail.gmail.com>
Subject: Re: [PATCH 15/19] hwrng: nomadik: drop owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>, 
	Alex Williamson <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-input@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 9:24=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Amba bus core already sets owner, so driver does not need to.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

