Return-Path: <linux-i2c+bounces-11180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B45AC945B
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 19:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AB21A46595
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 17:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F051E0E00;
	Fri, 30 May 2025 17:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bS7wcDPV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1A91A2C11
	for <linux-i2c@vger.kernel.org>; Fri, 30 May 2025 17:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624781; cv=none; b=UBDfl6ZF0JRNd2Vt020mmv9VZZFh3e+UZo97jl0COC1XXHzNCdpano3pGopz2bJjCQBfjpjKctJAK0MQNI/mQPP+ZRtU/dl3qfwaQNSEqNDZtmBBhCU4u5AIo9mjYMGJsTxWJ1FDJUASPNr5Na+GdA5Mmstsw+mXerckf1Emt2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624781; c=relaxed/simple;
	bh=QFqRIohx+gg2gSDAWM54O7rFkDGLr0wlaiWyj59McBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=qZoRdgYncmW61FwonYq+VZowrJ9Y9NUSFaryQOxlqkMw9gS6bH0DKc/9x3DQsnzKj350pBaeQXI903TPTdec8SBC/Mna8yRqrTTsPdmnJg8CCELzfUgvL/UAkmI2Rr4Z9eCarwGO7MwMu3q77/OTLui0wbwsH1FM9hiYa8Vsdb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bS7wcDPV; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so3143037a12.3
        for <linux-i2c@vger.kernel.org>; Fri, 30 May 2025 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748624777; x=1749229577; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/o84Yr6SF+pAOxckVsdedEwv8np9xFOiTbTyVF24CE=;
        b=bS7wcDPVvFX0PuncWp2oNKfvls+ZCLjQZj/niMs81XnKmNijjSNsLNswJkpl/AhcMY
         jCq3zSEnjNGzto0qqiKXuX6Drl7aqmu+E1FfDEaHoqJXvZR5nO2TLUXGYWS0EpxBP2N6
         7Z40fgCrlEZqD2sw4yFkhiqpYJpqhpVDQDV00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624777; x=1749229577;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/o84Yr6SF+pAOxckVsdedEwv8np9xFOiTbTyVF24CE=;
        b=M3bbsbsHO4h9OJbZu382tJxK6+j3Pr1rfpjMPC+xNGqMZzqD27WkQcoRJbD9BG+VBp
         5Pfto8PgfQiE7Wgn3ghr3Zz9vIC0z6qv3fwl+K9qPDbLZlFrEjyVarw6jQmx/D9BdU9/
         iWp1QUhTf82tLKpXmtwxcLs3m3HQAG1mf0tHTtZtgc8pl83q9QT0yF0QsESs1LcSIjsV
         sbSXXaipTjBVfwHpHccsKKTd7lTYGJQ+K2mJrNyeKQxT+Uk03MvHVyP9uqMHwqfJfBUO
         ZZOAQRqYxqNuLi9lWkC8rCvsM6uu5hmEyEmiGcP85tNZEdo20kY5q6fDQIrTSYyVgWjJ
         hvSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLJOjOPB681cq0ZTU8Nn4PqKhRSCpP9y4YnyV3KWnHE/lkA+jFUB1TLQSzg7xuzvWY1EObixWELY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Jj7imXAHV1ICKVGjV6rffyk/lOvTqfq3ljkv4ZxQXq+nZJ4q
	v8zjpcBR+hW+PbXCDxsQuzVmBVIAVQzoGEY4h87nT18aVOlry4sXIoq8g51jkoW9qyqbDbQiI2P
	uboiUBFU=
X-Gm-Gg: ASbGncsyfEs7f1tIjOqbkggA6XNLDKlI10Cr++vncgNB682qdiHc3KpQC7A9vA64xE+
	pFKYpuz/ZxRGqZd2aLDvy1e6QT28cNEOD5aX5wOL/z6a9F5GC9ih5ilKLwkLghy3DqehVv+4Wmg
	R6KKhNss0utXj2pdQCYGiDClw015aC0+LQu27722K7sIElZ3MwnwLOt9rL4TSRykM4GrwqFzakp
	74zLCxEQmO6eQD/2H3vJp6qfVpWDuQi98uC1t4zSsxKlWxVhDkBAOPO1iCXH6dzvfAWWZJfvpw1
	MT/414cRkQSqAkxo5nebw7YSjJ1Gjn0DTt5UrGai+LcAkjdF1+G7hClblXbtgki0A+46s1fD4Pt
	yeYf2ssQs6a+ijWsAFACZrgqSyQ==
X-Google-Smtp-Source: AGHT+IE+p8OE77ckRAuN4I2d4+y8F8tdiDCkOqluWn8gP+ssUKtVy1z15cEFvMmEkP4M7IQ4Ubc4/A==
X-Received: by 2002:a17:907:2d9e:b0:ad5:365a:1352 with SMTP id a640c23a62f3a-adb322b3441mr445945566b.1.1748624777052;
        Fri, 30 May 2025 10:06:17 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6a77csm353054666b.166.2025.05.30.10.06.15
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 10:06:16 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso3928215a12.0
        for <linux-i2c@vger.kernel.org>; Fri, 30 May 2025 10:06:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeMx7XzSNj1WDw241MtOiCnazPs3aHBIOjHsxRPQF7H6WjWjAGtLVTWFlFo7VYGujykyJRQmuUyUU=@vger.kernel.org
X-Received: by 2002:a05:6402:254a:b0:604:abcd:b177 with SMTP id
 4fb4d7f45d1cf-6056ef01facmr3657145a12.30.1748624775458; Fri, 30 May 2025
 10:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDnYz2PB_euziA01@shikoro>
In-Reply-To: <aDnYz2PB_euziA01@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 May 2025 10:05:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiKW=BPcDvBAsVDemdWBR0uh09A_WMOCoceqj3w3doGJg@mail.gmail.com>
X-Gm-Features: AX0GCFuuCFRFZ8MrcVzGYWvM4KfXKhf8fbmrBC19F3Bg8T7nLuy_7WQutZTXu08
Message-ID: <CAHk-=wiKW=BPcDvBAsVDemdWBR0uh09A_WMOCoceqj3w3doGJg@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc1
To: Wolfram Sang <wsa@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 09:12, Wolfram Sang <wsa@kernel.org> wrote:
>
> this pull-request will have a merge conflict with the media-tree. You
> can find a resolution from the author of the I2C changes here [1]. The
> diff there is mangled, sadly. I already asked for a better version. Hope
> it arrived when you process this request.

Oh, that resolution was wrong in other ways than just being mangled.

That

                mutex_destroy(&rxport->aliased_addrs_lock);

is wrong - it needs to be "mutex_destroy(&it.export..."

                Linus

