Return-Path: <linux-i2c+bounces-8822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F1C9FE565
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 11:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73E11882474
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 10:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231331A7249;
	Mon, 30 Dec 2024 10:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mzo6ufmo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD144DA04;
	Mon, 30 Dec 2024 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735555791; cv=none; b=VzrnBuB5oexthhCc3ZAyX+Y6H/72TFapFnv/Tw9IwuyAwaiD3o6tQIguSzolsc4Yp1EibMp2Bw+h2M7dE1/Fb1e+9QN0ULTvyqu/Muja4ynXlUVCg4MHxAW4JCX/cJlYFli14dyb6NNXmhaML91pTUoNgzvJyqFzEUBp9uWb0VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735555791; c=relaxed/simple;
	bh=DMgwXb4Pjj7hKAXdAoSl5JAgEYZwD8ycrepmMJbRInM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGjLiJZ85OtVJPOHLeT/H9T9MFPio4DrgihPEfftJPJlVZmVIJiqq6kppp5GWosAasVMMbyoqMH8IOcLMZidsYGN72zD8D1clOFjWmqc9NXPVxLs0+AAenDYbB/i7OcfslE/Y/YngWTYd00mEGOCJW1SYzRSG7Hi4bJ/U9vThIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mzo6ufmo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C18C4CED7;
	Mon, 30 Dec 2024 10:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735555791;
	bh=DMgwXb4Pjj7hKAXdAoSl5JAgEYZwD8ycrepmMJbRInM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mzo6ufmoO77/klxrGOf5m3GC0MKZcht/c0vLDiXs08zr8sTT7seJECyJQijXBh7Dy
	 4rrFUF+1NzfMUL2ltEb2KUv2aOJuRRSC8LQKQL71Jmu6oJl3bhVjJIKqLclzYlMuVn
	 4ZgS/lncJT8E9Hw7e7nYJFFuODYC7t4Oi/2hL2qYXjBSjSYq8IzbfxwSuVbxfsO+XX
	 JoQL9VrV97xgZeGZOwBLwdt0JTYebYYHn30MHay52mO3g7sOE8gSa4vHezkyOZGVMO
	 xA8pOaDxeczzclt0Tw4s1cx71iOoPLE9Ll7qDFMnd+FoYK/8EckCMP708v15hNmr2O
	 Ynnac+c3bDHgw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-540254357c8so9166791e87.1;
        Mon, 30 Dec 2024 02:49:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4IK5x6v3VevZcbs6PmP4YJ16d0kwScIWHH4+cReJcyOAiMFM8UPymLzWGCDJyw3/vDKg8+r+TL3r/hAid@vger.kernel.org, AJvYcCXTyBzuhN+3GIjxHJkVCZf5q1Iow8OtUclx0qz8UOcT2luD9WoSY0TWduaK26CSDQXoQISBnuhHciU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuKuUMw9hNT/XTbYOfa4mZbpMNYWTCVqbVjXPgVKrQSQ6vqkIR
	TGfOw/Gt8OSW1vteFy1oLpOPy35O3hYJJzoWjviB3kJxt7SIAwFlsWp3UOzZ84HUgZ9TSzIHdHF
	90JeivSXTbsUwuN59+WTVtyXUDUY=
X-Google-Smtp-Source: AGHT+IHfAHpSoP59vJKvHvXGWGxhk3q8Jir2XkG8PIuHuniZ7/VN6R2oaLxrF+86z7Dwsw0ceadfwpZN7MM0IkbG7xE=
X-Received: by 2002:a05:6512:3e23:b0:53e:12dc:e805 with SMTP id
 2adb3069b0e04-54229582252mr10640832e87.45.1735555789926; Mon, 30 Dec 2024
 02:49:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241228184328.5ced280b@dsl-u17-10>
In-Reply-To: <20241228184328.5ced280b@dsl-u17-10>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Dec 2024 19:49:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS-W_vG9wjEms4PZrPeQb710ypoxg5oK9fPHcfJBXKKhQ@mail.gmail.com>
Message-ID: <CAK7LNAS-W_vG9wjEms4PZrPeQb710ypoxg5oK9fPHcfJBXKKhQ@mail.gmail.com>
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
To: David Laight <david.laight.linux@gmail.com>
Cc: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com, 
	u.kleine-koenig@baylibre.com, torvalds@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2024 at 3:43=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> Commit ceb8bf2ceaa77 ("module: Convert default symbol namespace to string
> literal") changed DEFAULT_SYMBOL_NAMESPACE to be a string literal.

Why is ceb8bf2ceaa77 related?

Even before ceb8bf2ceaa77, this was broken.





--
Best Regards
Masahiro Yamada

