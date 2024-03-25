Return-Path: <linux-i2c+bounces-2579-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C24C88B38A
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 23:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73218B47501
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 16:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1228C5C902;
	Mon, 25 Mar 2024 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HyKVrXbA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC574E1C6
	for <linux-i2c@vger.kernel.org>; Mon, 25 Mar 2024 15:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711379267; cv=none; b=o4IdqBxDwaCsRkZKtf7nhMOtVToBAVJfsranWXNr7NDosJrHuO6ye/ZevjuIKx4ECJkZ8jL6pGlbxaBY7lEXILqxikMChzd4UBYoxt58VNvuFhJ+ZJSFK1sZO/dsq1DYEwIlv4MMygZILS3vO6AFSow6qjJDuba5fOCl1xNsiB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711379267; c=relaxed/simple;
	bh=6+wM/5Eml0jJjXbueM68ZzKT44rHBgaiZRCLtSh/Yuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUfIAfNTrAsrJB9HH9RXWk2ars/hJmxFbkiYSikBq9oLrwv6kaQjuWvvWfbPqUyFa+UqbZtrZ6kwb9J9lRMjNCkg5D41aR6GU+xQiMk6XmEKF4dKvUOyDWYUNN0WY2ObaPY0QSrJiPKZakGRB+uSPhDsJlJH6hkjc0IevnT8bUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HyKVrXbA; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d6c9678cbdso27744551fa.2
        for <linux-i2c@vger.kernel.org>; Mon, 25 Mar 2024 08:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711379264; x=1711984064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+wM/5Eml0jJjXbueM68ZzKT44rHBgaiZRCLtSh/Yuo=;
        b=HyKVrXbAJgia2qR6aWAERV8S7eWY4GME5+3qgZENTj1xEl3lwVxlHgU9KSmRBaQZ52
         vBOIk2P5KeSd2OBBaTXoHv0wleHCrpVsVdtO3ofFpsLpVMLOwlQvG1qs8G9gK0utvyqn
         L1y788i6AU2L92D68kTLsutNK8VTHjjgp1qtcchMHttp6DVVYy64K4pBGttr9wwV6QtQ
         unJXEVk54HBM27b9ZCgeRDXYeZquH0s/Di527OTl8evAWXOjOp+ZZVkoPSnWHvxnFELp
         NYMMlqnsZnFGK9fGdDW76LxuFTFsRmvKu2md7U3UFPNdEPrubSCPY2szuFkVwsbdSgCE
         MP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711379264; x=1711984064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+wM/5Eml0jJjXbueM68ZzKT44rHBgaiZRCLtSh/Yuo=;
        b=ZEsu9GviyRHO8178urubytL3YLJ5XSuqgAmc/tRvRmoGN9Bm6DJHMWRXQlySNyecEb
         nJGkQAywGxYEEOuB0bLlPc1h8o4yXrBgnFiZFdg14Mrski6XvaTa1TDs2uk8onw1kn0S
         0/HsNTahky5jYU4evh8fXS4yi2OLXxo0WsOHFjUmDkDbVhLGgq+/X1+mhFdkITBA9vXC
         qsoVLLWKyOxXyQMfi0Xdz/fz1FF5tjaW/rjZWS4mlxvecNWJnjEt/e/SKmPqdg/4h0v9
         z12hdbOlku50lfFXgU+4UefFAok1EcCcqUtEhuae+3kEo9b2KYqj2VJ+tCbQF6bNG7sY
         yEzw==
X-Gm-Message-State: AOJu0YziNHhlUbDmks7RL+PHWxSTimJrofD6bS8Yc3FPqlr0JxNASQEa
	ldEzPiJxIfF1ZGJSGTXrEiJEHFIyRFTLD01jgRsmmG1hSrc/wY/01Lg8X11sKgZj0ADe19pfW53
	VgRoL2Z+6j/znJ5glBvT+2c911OEkQS0BpCN4Uw==
X-Google-Smtp-Source: AGHT+IF/D4oCFYlUK7HSZAQYxwcFlwbDpWsdJDLKuSRu3iGVi4RXC64dlOM7/dvQhbaOtDEjTxQoWt3Cd5SxBlG6+sA=
X-Received: by 2002:a2e:2a82:0:b0:2d4:5d44:fe1d with SMTP id
 q124-20020a2e2a82000000b002d45d44fe1dmr4553062ljq.52.1711379264142; Mon, 25
 Mar 2024 08:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com> <20240322132619.6389-16-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240322132619.6389-16-wsa+renesas@sang-engineering.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Mar 2024 16:07:33 +0100
Message-ID: <CAMRc=Mf8xywzkF0cMHRC_AJeEozUhT31-gNpdT=FSmAZ+JQg8w@mail.gmail.com>
Subject: Re: [PATCH 15/64] i2c: davinci: reword according to newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 2:26=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

