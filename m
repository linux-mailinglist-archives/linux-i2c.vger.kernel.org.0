Return-Path: <linux-i2c+bounces-7435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 481919A1459
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 22:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE6D5B214DF
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 20:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDB618D634;
	Wed, 16 Oct 2024 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOZGpYcS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B1F4409;
	Wed, 16 Oct 2024 20:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729111538; cv=none; b=MmBnAlJ+U/WnHafWE0+mkpd/pTJOk9jwO/cGulEYC9+QXllRmo47IvClcSxCEyZFOvAHEgnMEhO+KuOrC8u+RjerS35DwLTZfS8vu0k/LvjqrZbBC7zxrT45MwcXd0CuUjQ24RQCSSXEe0BSTCB4VE+TOtMklou1MHfORpGA7g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729111538; c=relaxed/simple;
	bh=HTN1aX0iCRWLHdhQYQwh7wNhVXm98bjeZq4ig32OZhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxgL36IqO9Rpso/55xEUJAYK5aanoAVoLcHy2Iim/ySoOLzwfu8xMIW7CfKFmF+BTPmwlqwo2CG4fWOMoUt+y0oaku7vXp9MpUdJuVWXRk+i7EH5TZRCttk5OalLMurgvSz+oJ7UE43ErUCNyqOEMpSJjC41Ra3RuDqWbF5pA0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOZGpYcS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EC4C4CECD;
	Wed, 16 Oct 2024 20:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729111538;
	bh=HTN1aX0iCRWLHdhQYQwh7wNhVXm98bjeZq4ig32OZhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IOZGpYcS9DDmidYUVsNRz7Ob8bIPiPbft1b0jDcP4pDi5HTLUs70GJRzkiotkaA3E
	 lT192FTvhx/ct/f2FB/Tfs4h6ixli8cYHpHVU8woUl+JMKDa7mjaGyfE80imyryStS
	 hADN5G+1SOU8IvRnsYZZrN9G4XOUB1pBOp7fdBnyPzTaGkOoInx5T/di88t+dDp+fx
	 mtQqqTg+FM9QZBpQ/SjpAXLUQR+taVIK82l9eQK5E9+Zl1xBgCGnV5AIuVmdikX2JT
	 GWNUMTDSiZm2YrDIhB40o/YYlDpoJu0YyYFb4UOBKJTDquI/nux82PP0iEA358mtA+
	 sNGSy3azpYWeA==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2887abeefbdso103689fac.0;
        Wed, 16 Oct 2024 13:45:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTU9L9lWlDiN52qTnelhoPk75tCVEV5M00WEo9c1WKsYE2i8cUs4tTWiOcxkpfID00t5M588iPYAZk@vger.kernel.org, AJvYcCXpIXSqUsQBoqHYaZ9dzGmt78qFTDHw0G6/ZbOUMvox9LC9f5Fhu7zgNXVowRe/Wop8Ae0iA089gkKq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd4rEvBs3170IPYsY5ecTzI40hfh0sf4RwsO8fk18hC8Wn0ZfG
	rGkThovINvnZR6Lo8SnECxyam/5ADVSqzOSFUs9pt0pQoP1tGAQIvcGnhBugpwevTMHqPUR5NJX
	/vQbq9JrO1VAkJ4O0/6bBRWqIymQ=
X-Google-Smtp-Source: AGHT+IHnvxFOuvwkbLt5ZZeObK29bzvFlik017921hRFJc2kA0DwwcyPRlQKa98ZBpCWnAnc9fHY+2CBLGaAfrawFMg=
X-Received: by 2002:a05:6871:3326:b0:278:64e:c5ef with SMTP id
 586e51a60fabf-288edfcbf0fmr4515245fac.37.1729111537814; Wed, 16 Oct 2024
 13:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926024026.2539-1-hunter.yu@hj-micro.com> <20240926024026.2539-2-hunter.yu@hj-micro.com>
 <pmbvhdaz4qt57gxemuxoyb6xjrcmvusm2jzl5ps3o5ga52edo5@qabu6rcbdipp>
In-Reply-To: <pmbvhdaz4qt57gxemuxoyb6xjrcmvusm2jzl5ps3o5ga52edo5@qabu6rcbdipp>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 16 Oct 2024 22:45:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gSyMYerPqH9LOA77EWdBEOL7kHrc1+P1R=8Epn77gfNw@mail.gmail.com>
Message-ID: <CAJZ5v0gSyMYerPqH9LOA77EWdBEOL7kHrc1+P1R=8Epn77gfNw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ACPI: APD: Add clock frequency for HJMC01 I2C controller
To: Andi Shyti <andi.shyti@kernel.org>, "hunter.yu" <hunter.yu@hj-micro.com>
Cc: andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com, 
	lenb@kernel.org, rafael@kernel.org, jsd@semihalf.com, 
	linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, andy.xu@hj-micro.com, 
	peter.du@hj-micro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 12:13=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> On Thu, Sep 26, 2024 at 10:40:05AM GMT, hunter.yu wrote:
> > I2C clock frequency for HJMC01 is 200M, define a new ACPI
> > HID for it.
> >
> > Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>
>
> Do you want your name to be hunter.yu or Hunter Yu? I prefer the
> second and if you browse the git log, you can see that everyone
> uses Name Surname.

It must be a real name as per submitting-patches.rst

The S-o-b is meaningless otherwise.

