Return-Path: <linux-i2c+bounces-12796-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29852B4A4F6
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 10:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9DED16ADAE
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 08:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDC023B62C;
	Tue,  9 Sep 2025 08:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtmLEtRP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221661E231E;
	Tue,  9 Sep 2025 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757405906; cv=none; b=JrY0SXpR6UfOs4Qnvc80S5UYD7M8Ms72iAjuD5iwg8BDxPFrgJxd00kQLdVP4xAZ7bRu5lnu9AFQgXWppjigcW271aCvFKyYndJbhpq+5NClQerWS/qoEXEqyDsm4V0RKm+RocanaX5OAD5bzoGBYkx+F99FHjv6pRMisM1MWkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757405906; c=relaxed/simple;
	bh=ShouuRcmlT0Jj95VOKuFkiyHAoxYWLxA00N2sQSS+Mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8q6jpPS7C5oW09hYU6SvqGMKyB3h4wdzGINybt+xJazC12HwnmaaSQmgsZ1TeE3Ac5kdncCU6ELa68EHMvAQaOgHVojFmNhC+pakycR7rj7bA2nJ3dCiV7OFDZeflJwzR1M5yWCwHoABWtcXfVY7zoNozH4/+kWr8Elyeb+rNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtmLEtRP; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d6083cc69so51088837b3.2;
        Tue, 09 Sep 2025 01:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757405902; x=1758010702; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ShouuRcmlT0Jj95VOKuFkiyHAoxYWLxA00N2sQSS+Mo=;
        b=DtmLEtRPkim7oHm340Th3lbcvHFzpYLZqcMIAN+NyG9yfn4dAN7+qb0F/dSUo9IsjV
         Fpvk9EBEWGg4yUJVGUYJtZ339VDE/JTrqE+WNfx5A6nXHS4R+RpVzxivP9XfyX5/8eEp
         g7H/HaGyQfzlQ80dFkJDZTFGHmIhbQyEfcA1M7WZ6g7J5cL8s4QUHl/4mRZ5bVTstVSY
         m+G+hL22OnJ9WvAXCKdNqkM5y3iGxmXNCsoQ8BcSbf5pHXup3+8sIUPrmc5K6l1gQj1v
         LlGo1zMX0qvcqeQ2zVz62/quUln5M9/ADf8Hq/tWrz42c4e8ccEZe0KCe74HtDVHaX+h
         i/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757405902; x=1758010702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShouuRcmlT0Jj95VOKuFkiyHAoxYWLxA00N2sQSS+Mo=;
        b=kzEbi50OQzm/A4kkaKqaghpWsBbEwZz/MEn4VsFe1hbmVwWgIWg+0fEG06yxug8t2u
         Kso9vuONSIPQSTt7tssIApjdWI4P6GAHWS7o5qfntFQmuQb3szlyFd4EpF5aXLVF/eAP
         35oVHOtmc/jAoXv4eXMZ8r582u7sVNZiFY3QpKa3+/SdFLVAcwowscdF1IaUT8xzR/WD
         GTNCwy3w/HiFkHSSOUqrZqoo6d/j2m/bAvETg8Nrp2V4fDixS+HW4n22SWRRa1KbUB1W
         mkfMtM80CIzRbfTYIPMFxVfk+Rrw/cjk7G7+8azv6FakxCCyXbdBTXNGepExcnejOj+H
         kf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHAqbP92FSvRUcYJlwQupKOZw21rJ9lRny31ZKOmABbbBS1DQXm1xsHGJKs2/A89xERyzazAiZdGAhQb0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/x9ZYtHQ74Gf7oO5mD/rqU8kHb+qtj/LSSWb5JLRj2AWraGB
	8L9WEJoAfqceY7RP0tHE23VQkqSYCgITkKT3IYUi5b2LQlrOWswaCccqgozRi57uNZ0OsmSGoZr
	vxUWSMb72d9bNJ/TLESGPBUMgZFDQxtftMLL8
X-Gm-Gg: ASbGncvLZZo1RLmr9iaTIU+14iMs31Aab9Vh6jsMq8tau3/9QQjltGzgWfKAI4gpL9w
	jv3oCirU18KkoLBROpRCYrwOqukCTUQSZJAuRDb/yzDs4gN+b6XEXRlol3aWFs7KvwwyfJ3V25H
	r1l0w+CJSpNtNvXjh5YIj5h94TBZfPYJhN0hZNl7R8pHmC5twlmmg7WoctfGGIwHCvpssgZyZW0
	X5asGgj
X-Google-Smtp-Source: AGHT+IHReIMfclxr9I0y6ckmePu5mtLcLqLO2Vmjw0P2wqGPItnJeyqEbpewiMpnxUx4aQA1WTXVRXssL8AJMGERlAk=
X-Received: by 2002:a05:690c:6187:b0:724:b902:bda5 with SMTP id
 00721157ae682-727f573dd66mr102083477b3.42.1757405901763; Tue, 09 Sep 2025
 01:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <207f485f-df06-43a6-b91d-8153b8922089@web.de> <20250908175902.214066-1-chiru.cezar.89@gmail.com>
 <20250908175902.214066-4-chiru.cezar.89@gmail.com> <d81c00f2-8b77-4b5d-baf7-afcc7dc5ac9b@web.de>
In-Reply-To: <d81c00f2-8b77-4b5d-baf7-afcc7dc5ac9b@web.de>
From: Cezar Chiru <chiru.cezar.89@gmail.com>
Date: Tue, 9 Sep 2025 11:18:10 +0300
X-Gm-Features: Ac12FXy3nkmDhCXQf24N3VjXQYXgWCEobcnzvYmoKgVgY2buIgmtan79J4COiKc
Message-ID: <CANvS2vXUYdB53+uHJps=1FBfBpYhO3C30FVEc3TL7JGQu-zNCA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] i2c: PCF8584: Fix space(s) required before or
 after different operators
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

Thank you for the time to review my patch series.

> > operators: Require spaces around or before or after '=', ';', '<' and ','.
> > Add space(s) around or before or after different operators.
>
> How do you think about to refine such a wording approach another bit?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v6.17-rc5#n274
> https://elixir.bootlin.com/linux/v6.17-rc5/source/scripts/checkpatch.pl#L5090-L5399

I will refer to binary and ternary operators instead of listing them. Also I
will say punctuation signs like: ';' , ','

