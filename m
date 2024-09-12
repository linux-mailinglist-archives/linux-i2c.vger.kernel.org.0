Return-Path: <linux-i2c+bounces-6626-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF94D976E69
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9861E283D2D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 16:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5975013DDB9;
	Thu, 12 Sep 2024 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaMLsxCx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763913D50A;
	Thu, 12 Sep 2024 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726157221; cv=none; b=YcpdzYNQu+7E46TpO79nAGKlpSyaVmBr2H+IeBqaMdl45NFLlB/qLZ101lPjeyv6ca3GWCT19zqPGkXPjinuJsDBxRv1q+AbB+JwWGYxk0H3qfp4E6Id/A8PHcypXOI3i9eNFutvzEyTk/gY07a51gUpKGD+dQfYs8wrMX5HFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726157221; c=relaxed/simple;
	bh=GiY28vIjzbF4ncraCjSTkI0n9+bZEJ/i0HDL5G8MzJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irO/U1qkXkK+44xTgsoeDVemiKm1RdTTHDTbXoftKULMlPRCR6cg2mPUoPbujf2NH9NJv8XF+HZ4uKKIHEzcEkpDZ4ZZMJqfggOAIvbrmHUZpv2vAIfes6MNfnMXbd0h6me0NWw3+6kUh/BdSqrHdyExok7nctKpGnMXFayKrmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaMLsxCx; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f761cfa5e6so432171fa.0;
        Thu, 12 Sep 2024 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726157216; x=1726762016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GXnsTeAKkPt+GHGD/GSPgaQmYiEQrEuj2ihhdaJntU=;
        b=jaMLsxCxRU0jBlyR+6hVxeK3thQqEXo3YPnswD51Sg40OoqVSYkiA3x6MlkNvD7uvg
         aeAd4nqXncutreDrcZrlcv0OD1fBQwmiUCJMt0ORoJW0ZkuyMut476TvPgz+mJaK4O+b
         4LxaZmnh9CL2p7AFGvfF3nuvXhAsE5yVpB/Lc0mrpqmpjxwu4gjgQre1LASLIIIs4kuv
         KvgIWRLNvbNYpLypgC/KzfzRY3iOuHOTf38gUE1NKZrr7l4DyQc94WVFj6fb7hK/aHJf
         bbgCwo0ClJ80tHd9u+oQ+C4VdJqdPucO/HV6cNqVLIPSenXvGHAM4lMMtqveRQjfVcnz
         CzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726157216; x=1726762016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GXnsTeAKkPt+GHGD/GSPgaQmYiEQrEuj2ihhdaJntU=;
        b=g7T4YpSsesa+KSuQVCOSZS0jFhA+OtSA+kmawI1HbvDOltWTdlf0N7HEzJwWRM1rcf
         YtrTK0YU+DP4uRky5VQ3axWu2V31Y2gryPO2gA8UCVGKFjBP7cAG5hns/YZ1w5rmLL1P
         NiEeq9nHc0ru/frDL+unRIlBKC5iM2mz7RIvS3lLzZCUW2dZvPpAxW85ymlXtjitIKLr
         eoP8lVLpQD4qSvu7QB7vXCtEK4ZeB1lYC1mkV9OootXTP089FUBudARRYc/DoBV+8rGM
         cUEs8hiF1rIctrbYhQoxbBOdu8xXu3roIlqIbzdEToIYGvwwShfgrb5x5SiSAoHTujbN
         EU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8AIIMRLHw8bh+b2Nmb746BvcevIGg0UpOr8YyWR+GG3wIXynjZ3cyzdL4nwhSSTNY1WzptSLb5z4=@vger.kernel.org, AJvYcCWHYUa0JUu+ghY2qeRDuJBkmqGGEQHiiQL/DvrJ6szYyg2aylzA6EHKkgguLmoG4lYHcmhU1fQIaP8ZJ8GL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+7pDcOG4DACdwdL0sFf2y52jwkslF4eSmjLMmyr8om3MXKioh
	8xpL+AQX5au+ahIlxzjeEwamXIMJVXV0e11iUxGvDrLPAqC9aKtkm7wYJlQdm40rzqSm2Hs0pZJ
	CfC6nEzcizpBZN8Ynq8wqcYXSDlY=
X-Google-Smtp-Source: AGHT+IGWjX10mXNlOA8trM27GN3WdkMlh7d8GXkVJH2ocngxy8iAwvqfcT6QIP3cF4Wm0Y2DMa0xcWaVibkPhnOcuiQ=
X-Received: by 2002:a05:651c:2125:b0:2f7:528f:421e with SMTP id
 38308e7fff4ca-2f787c81976mr23687661fa.0.1726157216147; Thu, 12 Sep 2024
 09:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
 <20240911154820.2846187-9-andriy.shevchenko@linux.intel.com>
 <pwvhzkxeniutopyxczvimkau3elchfy5x32cimlqwjnmqjzv42@zpojd2lxs3o4>
 <ZuMKUnY58Blm7UX-@surfacebook.localdomain> <zuijrzur6htcg4dhccfydl4gb4rj62jq5co4ege6fkggaceesg@3kkujnlrgbye>
In-Reply-To: <zuijrzur6htcg4dhccfydl4gb4rj62jq5co4ege6fkggaceesg@3kkujnlrgbye>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Sep 2024 19:06:19 +0300
Message-ID: <CAHp75VeC1Gw8PvJCRGxKKzHGJCaSvsh3JbPnPhDCNsLDF5OaFw@mail.gmail.com>
Subject: Re: [PATCH v1 08/12] i2c: isch: Use read_poll_timeout()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 6:55=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
> On Thu, Sep 12, 2024 at 06:35:46PM GMT, Andy Shevchenko wrote:
> > Thu, Sep 12, 2024 at 09:29:38AM +0200, Andi Shyti kirjoitti:

...

> > > > -         sch_io_wr8(priv, SMBHSTSTS, temp);
> > > > +         sch_io_wr8(priv, SMBHSTSTS, temp & 0x0f);
> > >
> > > there is still a dev_dbg() using temp. To be on the safe side, do
> > > we want to do a "temp &=3D 0x0f" after the read_poll_timeout?
> >
> > Isn't it even better that we have more information in the debug output?
>
> I think not, because:
>
>  1. It's information that we don't need, and we intentionally
>     discard in every check. If we print a value we ignore, we
>     risk providing incorrect information.
>
>  2. It=E2=80=99s more future-proof. In future development, cleanups,
>     refactorings, or copy-paste, temp can be used as is
>     without needing to continuously & it with 0xf. This
>     avoids unnecessary operations being repeated later on.
>
>  3. It maintains the original design.

Okay, but where do you see this debug message? I looked again into the
code and do not see that _this_ value of temp is used in the
messaging. What did I miss?

> In any case, these are small details, and the patch is already
> good as it is.

Thank you for the review!

--=20
With Best Regards,
Andy Shevchenko

