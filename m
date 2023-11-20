Return-Path: <linux-i2c+bounces-335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2719B7F1A11
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 18:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5C9C2819E6
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 17:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0686720328;
	Mon, 20 Nov 2023 17:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XuyA/wyd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21AA11A
	for <linux-i2c@vger.kernel.org>; Mon, 20 Nov 2023 09:32:31 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-548f0b7ab9eso301576a12.3
        for <linux-i2c@vger.kernel.org>; Mon, 20 Nov 2023 09:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700501550; x=1701106350; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ObGB9aqfCaCmROEd5HBVW5NBm+BS50G0iVX32TIItAM=;
        b=XuyA/wydqSjsHq/iZiLwEpNo17UnscBQiC0qik2ya7xEbzXatDudy2EcS23CanyhQh
         C97xzHXwdh89cY9r2kpRzh3UVkV1K53yslFyQoi5I3qfur3WkAZ5B5UWPViDhKG9VHsR
         DdRrdpAZqHgXATWXK8+cE09TRwXiSBIH1FKhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501550; x=1701106350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObGB9aqfCaCmROEd5HBVW5NBm+BS50G0iVX32TIItAM=;
        b=XmQXreb1s9QAKCDbxBWhorHrET9ubFyoNntH2iqbWOFYyZrcva55LwsQhkOHvSKFVy
         lHZKPq/6XlAwv2MOoeDSCCiMUoNoughgw0kMohSqAXHf1/YwqUUcOEBD6qTZL0K8sxLv
         m2RGPyd9O6friG3vSiOhJ5ib9h20MZZ14/bfrA9Kc4M1xRP4v1kwhVCgBiQ91NJdmhSX
         gmqp3tHkgAs2iPm9oRS3gMY+GGKrfsh5xgq5qVQXqf1Gt+HYqwu/7rBC21rp1FBLubXu
         fW+vosmQHGKcEj66TsvAquioygptCdCKzmX3W33rDjBbY1o4TlKiBp5CzgS4a5ZUTU/g
         Afng==
X-Gm-Message-State: AOJu0YxO69yv5iHkfHKLmRDUv6MD7GMawkIIAqTF8b9Dd3JOX5ngw/z9
	SKvyYbixcYdNPy7SSokFbrXfPkY6ONsPAsmszgKYdw==
X-Google-Smtp-Source: AGHT+IF5djiY6VA8w45zQ5H3riOtih3/0i3n3GtB+TmyZtCSI9UCn+w3A3EulvlGTrCyHzZxfZuESw==
X-Received: by 2002:a50:aad8:0:b0:548:e994:be with SMTP id r24-20020a50aad8000000b00548e99400bemr39421edc.35.1700501550296;
        Mon, 20 Nov 2023 09:32:30 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id g22-20020aa7c856000000b005487d3fb436sm2451490edt.90.2023.11.20.09.32.28
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 09:32:28 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso6656305a12.1
        for <linux-i2c@vger.kernel.org>; Mon, 20 Nov 2023 09:32:28 -0800 (PST)
X-Received: by 2002:aa7:cccf:0:b0:53f:6ed5:4dab with SMTP id
 y15-20020aa7cccf000000b0053f6ed54dabmr62888edt.24.1700501548302; Mon, 20 Nov
 2023 09:32:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZVf/pqw5YcF7sldg@shikoro> <CAHk-=wi9a9u+1cAxxHw7KxXsfPvdWCbhatK7enFSjgwjrovCZA@mail.gmail.com>
 <20231120150515.GA32570@willie-the-truck>
In-Reply-To: <20231120150515.GA32570@willie-the-truck>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Nov 2023 09:32:11 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgKAVyPtoQELWC-9DCwXQnZv+oVSOfPQtn237VT9h9A0Q@mail.gmail.com>
Message-ID: <CAHk-=wgKAVyPtoQELWC-9DCwXQnZv+oVSOfPQtn237VT9h9A0Q@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.7-rc2
To: Will Deacon <will@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Nov 2023 at 07:05, Will Deacon <will@kernel.org> wrote:
>
> and I think the high-level problem was something like:
>
> 1. CPU x writes some stuff to memory (I think one example was i2c_dw_xfer()
>    setting 'dev->msg_read_idx' to 0)
> 2. CPU x writes to an I/O register on this I2C controller which generates
>    an IRQ (end of i2c_dw_xfer_init())
> 3. CPU y takes the IRQ
> 4. CPU y reads 'dev->msg_read_idx' and doesn't see the write from (1)
>
> (i2c folks: please chime in if I got this wrong)
>
> the issue being that the writes in (1) are not ordered before the I/O
> access in (2) if the relaxed accessor is used.

Ok, then removing relaxed is indeed the right thing to do. Because
yes, it's an actual ordering issue with the IO write, not some locking
issue.

Thanks for filling in the details, that patch looked iffy to me, but
it does sound like everything is good.

             Linus

