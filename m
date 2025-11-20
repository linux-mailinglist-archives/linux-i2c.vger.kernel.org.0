Return-Path: <linux-i2c+bounces-14194-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D647C74673
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 15:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E36C734294C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 13:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519D93451CE;
	Thu, 20 Nov 2025 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9oTTCBn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC543446C6
	for <linux-i2c@vger.kernel.org>; Thu, 20 Nov 2025 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646804; cv=none; b=OTabpDbwpmml8uPnRQ6p6quJgTMjY/sPOG/PNGmoe8eNAm9LaF4cLjKX7HclHc/f/cSnDiHJOzDsXYiLM3ESeumRjtvc2smvfuwYGm86MPzix5jhksHqosIhzfgi703DlKw04KMTm/2JR/cVMUSUHTi7J3C7YbND5u5COOtUPhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646804; c=relaxed/simple;
	bh=+ji9rJDb1MvYDh0vNEXCjFc4fTr5v97Yi6vD9q4tUfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYtFuC+CE0PnOOCj0sm8d6kxjVMH6IDNOpx9Q6RXtwRiWnOj5Mbsz79lWzg6Ti9XVE3hsrTTqsAr7cZ7NBNSjk0gZhNko/p+3BHfEebeSygzvF6ZYMHTzfcXUITIqjxYMdBAGG11SEM8KLNK+V2Ayfp0AJKyIfVV8LojdqdTiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9oTTCBn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so844521b3a.0
        for <linux-i2c@vger.kernel.org>; Thu, 20 Nov 2025 05:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763646801; x=1764251601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ji9rJDb1MvYDh0vNEXCjFc4fTr5v97Yi6vD9q4tUfM=;
        b=e9oTTCBn11vwUd9REK0TQJkAkRY63R3apyOHm6ueYypMYcRMY/BAPTaGCJ1PEEFMkH
         R9UOkiHDBrf1KKpJ6q1pVYkfCLRWz/+zfJ75wujoc8k0VJjXEXiSlpEz8Zrzln5/vO5Q
         t0lIZmBk8XKuQr5c7xMK+8cMieAfJzwgQa6zYE/sKWRgsust1IbJMF3TJ+iNAjr3bksb
         oyxHSzc4pB9z1ZvIMa2XN0keoPwBLrSG/OEL6SEJKl64dOn2+Rp7wHgHd4lS8c/AmE/1
         1iSL8fsklGDjzjVXDgVYsA/rbYhNcNBMVKpv7k76SO/YFxiBTQTaWG1wOkI4MQWv3MDd
         htAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763646801; x=1764251601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ji9rJDb1MvYDh0vNEXCjFc4fTr5v97Yi6vD9q4tUfM=;
        b=pk/H+By6PxKenUGcYEdF7cdpb57aFmkNiFt0r4tavDYhSjJPXEZhvPmZlss2BHGQLL
         pkdR9K2NR4fUypdRUAjgDNMJhzkJbKk3Rv1Rd1uK2Iu5rDhetLeC46h/XuHpvvbKonkK
         5/sTEzXmjV6jxr2Z0tPt5xAEo6hPT+rz/u2AmfMOk7Oo4Hsv3Abyu/RI680vQAlEnMO5
         IyPpvaPNswIc0ofO0h1mgYFSjd+dpqWT0WGsgA+eNrGDvfLfKomEVyHee2ZTf0PhANPI
         vzTzQYC7vxJolzfquiDxKdLDZhvKgtOfoiwkfSgoAEaYyFcZmx1UbNPRRDU1U31PS4MM
         HcjA==
X-Forwarded-Encrypted: i=1; AJvYcCXM6A4x+pGP9EyovFyCThxFpaUCNJit5j5hGSKLUKh+/V7XOaLwJtx8G3tgd9ZaqmSkan/cJwHGNrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTyBsgGCanWniYxtb5gwCVp/AuTwpOOV6tzWgROQrbXgdxOMqr
	IXCi/rO7wkMcg+ycgyB1YmJ+SqFO2UIO+CX7SaOJr3Oj589Z+SWAujkGzjn064jm8yNjf73zuUu
	jn4JwdAtxfKVEoc9+re9TuZ6Tr/pl524=
X-Gm-Gg: ASbGncuINzbdkyTWzeiSohk4J7Ol7VMB5OPkWUWnQEmN9MmHS+BpT4uW6z0hhd4CvAH
	NmEzB7UW7U3LyzydSum2OqNnjF2uQwxIESrM/6bt+7d4OWlobMRsloDj3PsZ3bqoEbLyN/AAeda
	ANd7Q90kBey+ONqWCDqwqZIaXIpcSlCfRtSzXXUyQGV5pnnvxPErT+cI61zKRAMaLnZqdzoD2Yc
	dHTyVJkKhY06ewq0yUpkBOjdc89Y7sqi5XsRYwdZVmpb4JkkQq3SEO3ejfr68bTESXwDK/mgZqH
	covLVC7oE1KxZUCgAyqe9hAeVa/wXziuzqvRCgCjeWFplqfyCrvwVaF0PPlERX2nAzoj7G5Zl5R
	yvf6oOU2jRg==
X-Google-Smtp-Source: AGHT+IHHiFdkRR2hcs7aI5ty0G7MPp6ZYGVQIosVcIdjzscilsxzXmB//cKbxOhtRhNsGf+CdA6qCE9WHN4qhmI+au8=
X-Received: by 2002:a05:7022:6714:b0:11a:61ef:8491 with SMTP id
 a92af1059eb24-11c9476aec2mr708193c88.3.1763646801541; Thu, 20 Nov 2025
 05:53:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120103039.1824209-1-carlos.song@nxp.com>
In-Reply-To: <20251120103039.1824209-1-carlos.song@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 20 Nov 2025 15:55:49 +0200
X-Gm-Features: AWmQ_bnQa7oBzAN6Aw7zvXpCjSq9C--w2oU7R6YmaimQUP4lya11WGpioKQNFS4
Message-ID: <CAEnQRZDcaWAQTLVHL1q+n2nhk3Cop2-fbOL+BqibrJHze2F9xw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, frank.li@nxp.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 12:31=E2=80=AFPM Carlos Song <carlos.song@nxp.com> =
wrote:
>
> EDMA resume is in early stage and suspend is in late stage, but LPI2C
> resume and suspend are in NOIRQ stage. So LPI2C resource become ready
> earlier than EDMA. When IRQ enabled, immediately slave will trigger LPI2C
> to read data and the length meets the requirements for DMA usage, the DMA
> will be needed at this time. Within a very small time window, EDMA is
> still not resumed.
>
> If a system-wide suspend or resume transition is in progress. LPI2C shoul=
d
> use PIO to transfer data not DMA to avoid issue caused by not ready DMA H=
W
> resource.
>
> Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---

For future patches please add here a small description of what changed sinc=
e v1:
e.g

Changes since v1:
* updated commit message as per discussion with Frank.

