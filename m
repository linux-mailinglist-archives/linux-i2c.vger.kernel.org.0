Return-Path: <linux-i2c+bounces-8303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F979E147A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 08:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1339F1648B0
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 07:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1775192D8E;
	Tue,  3 Dec 2024 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YWptD1HG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D121F17BB25
	for <linux-i2c@vger.kernel.org>; Tue,  3 Dec 2024 07:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211697; cv=none; b=VusnBqLZ+Nj2kLR/IDf435J9YK6KiBcNI1gS2W6f8SzGuhX+3K6flJOB0MoHLgsfBDPnBlr6abE4tfmkvPxH/kyh2GLulWtb0QfPH1pfEk0gpGJyLGd3gUDkKtpRvFRJX8wY4z4oRRyHvkCPz8syLbE00+uu+UImp/CF4Sz0qnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211697; c=relaxed/simple;
	bh=8/MeihlYKEjbtYq7yjGOiPXZ8SPSiHsjEmNh5LnyysQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XCXbEdOQZvyHPTNBn4USi0s+FAR+HSdKV3LUEi3Erj7en03oWqw71x9Tk7TZXxHJqE5bcR9yQoEQBbwDfnenUeZU9pNtdo/eA+ocSZs3q2vY86Y7jzAqSfcj2ujH73DguMJXxLyox5Apcw3Grgo14c2Xas1K3opvpU39Pn/NLsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YWptD1HG; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e0844ee50so2471106e87.0
        for <linux-i2c@vger.kernel.org>; Mon, 02 Dec 2024 23:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733211694; x=1733816494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/MeihlYKEjbtYq7yjGOiPXZ8SPSiHsjEmNh5LnyysQ=;
        b=YWptD1HGN2U4nz/1/wkBJb5gJK8F4orww9bCWkanmqrLrjDnfly9Pel/7CqEevARyp
         TWXHT1YfeFS5BOxWfiPSNQrjCKklSpgz93HC+vv0fv2x81McfaCvoZa0f9RiTa1cd1UP
         QJSzNEWhabTuUOjLrF33Uk0kmQ8AD0SqvAqTugUk3iJmGI5jd0wPLfjCs2I9B3H5UBZd
         SUUXquwAVpKvmz8p9A2WkEWLY6+9IqqFpUgeeJ5gERpxhT1vtH5YhCOcUBM9b0bqnf6f
         yvGfCAfGFyazCflwJnlAIUw+RRhS6VYTTOTNy3NPp1+/RqD797MrObRKFU2PoPoL6ZP2
         8yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733211694; x=1733816494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/MeihlYKEjbtYq7yjGOiPXZ8SPSiHsjEmNh5LnyysQ=;
        b=WqtlZmTr7tc7QfI5CzWJu3OOmuGc4pxMQa1Zq33+9azPM9Ov8d6e8dDHQkbJLor/rb
         gkFuToPgW3tSu4hd+ohRF9o1MpBHLgAeo0X4/kBX0LzCzlf7Nux53RsXjzMuMGBv9ZR7
         PyxMOx5x4rzV6dAeofm3Y5171fx3+7YozNPMZxy9Oj4l7Zk7LzaKv1cuukJHKEfrqd3X
         3uYvWTdOqKTVN3EbSnnfNxHAWfAs1S1qFsSBUOJ2UnES6+plxWpcPFywWFASGSt6B1GJ
         9d3EdQwcvksO3YDdy6TAkdW5E2ZcGO/mWaV3lwsWaA7T7C1R1b+lWaqh6Jlp8ccXWYJS
         n2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf9oD0SBYv0BYzzfakdMYeOAOrgkaHEXHCznoZbkSv9nkOA83ZlSfRZ/JmTpnqExxScm26xgoBPcs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe5RWV5XF5OoGemlXAt5OvMno+nAgQKD2xOCNVbzOPjzAu0Hud
	SSiny2IVWeEJuqKTH9b6djFHQ2Rd53vjcxNRmlET1V2wuBYQ0kIDNDOLwyIfag40WOIypfl6iVX
	ac4G2uqnOJl4zbsPwFdKNZA234Uv5BmQFTSQ+BA==
X-Gm-Gg: ASbGncshDC2xKK5Y5m9UFUpLn1XlKxl329gXv0ZN71gO0MTREuaJv/+pctSekQN2L91
	hBdbg4oN3qpUbCL552On13G1y/Okoq2Y=
X-Google-Smtp-Source: AGHT+IGXEhBq6wns3RLJUvyfVAD0UpLJ7elXsJY/o8pbtWMWxfMKmXusm0f4mIT7tIPT6ikD0FqI/k4l6ADmK8tOoXY=
X-Received: by 2002:a05:6512:ea5:b0:53d:dda4:8b0c with SMTP id
 2adb3069b0e04-53e129fdc50mr718667e87.18.1733211693822; Mon, 02 Dec 2024
 23:41:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008160947.81045-1-brgl@bgdev.pl> <h57xw6en4bb7gxsqq7qwq4z5yakavmn26jda36uh34r3ve4kbt@vj35tpjd7d2f>
In-Reply-To: <h57xw6en4bb7gxsqq7qwq4z5yakavmn26jda36uh34r3ve4kbt@vj35tpjd7d2f>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Dec 2024 08:41:22 +0100
Message-ID: <CAMRc=Md081Y1PGdmdSWuwsw7z++MM-jtDttRE-CU9RzP9autYQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 11:53=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
>
> Hi Bartosz,
>
> On Tue, Oct 08, 2024 at 06:09:47PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There's no reason for this driver to use OF-specific property helpers.
> > Drop the last one in favor of the generic variant and no longer include
> > of.h.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> this whole thread has gone off my radar, I'm sorry to have missed
> this. Thanks Wolfram for bringing this to my attention.
>
> Merged to i2c/i2c-host.
>
> Andi

Hi Andi,

This now shows up in mainline as commit 50b9d43e6ceaa ("i2c: qup: use
generic device property accessors") and in next there's a duplicate
commit 6f5f581b577b4 ("i2c: qup: use generic device property
accessors"). I think you should drop the latter from your branch.

Bart

