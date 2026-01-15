Return-Path: <linux-i2c+bounces-15202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B95EED27FC7
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 20:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EC5A300BA05
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 19:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2632EB873;
	Thu, 15 Jan 2026 19:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="QzPo/5YE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135D01A840A
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 19:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504594; cv=none; b=mDxG27djJ/paYC2Na0id2JDbED1LfhprCpaXyLt9IBjUCt8rhAipX4/mHsaLWbw+nmWv15r/d0HfeoWnEuyfTdTxr1X+CyaOLAB/7jEgvZG5dQj8elcgwp4wjIpYiM92c1D+9+N1DWSXQPuZ6Cl1h7Q7yX57lnmzX8AtJuzYtvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504594; c=relaxed/simple;
	bh=lo79Jc+8GawfI2eDcTERJ9/Xge+CVfWIAHQ1kiPAZpk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Uu5O3qi6YwGN7RURB4Mo+VF4dwh6Al0XXEM2BIiNrFXBOSVGcJFXhtvvxpLHG13DWQLuHNcimq1uqJGBSPLuAKvNZalmemXLMLKZO0pTRJ6WJlGQ2nl/SehEd4own3f5xJM/1D/q9NkaOfcMyT/gNzvJsZZjo24km7Gewv/WebU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=QzPo/5YE; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81db1530173so623648b3a.1
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 11:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768504588; x=1769109388; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo79Jc+8GawfI2eDcTERJ9/Xge+CVfWIAHQ1kiPAZpk=;
        b=QzPo/5YEZKfDebdlsoZ4ojTCgrmlnf6ql6qWyuctj3iOaGfTLDHx7pnYIPA2bkBNbQ
         LShBq0hO0qOInPbc5FxBwaSobkQgtUaVtd59ZdRZFf0p0My4o00aPVDA3mZwX2ytCWL9
         oKpsqsADBHT+DIa7ge7h1dwKn/g01lpT1yHBA6gFWwBouU1HRqyp0D/IobcxINYXnz5g
         mFe9PVqLAWAmC9aaWaP8RgQ4agMbUjUMc3UVITR/biu5jIZ6XltiM6+lo88VClJ8MsQs
         EXccTIzfCQiPfBeEWTCcAPpPz7L705FM6KedAm6lXkvjoYqQfymDHL5KEseluPTh5wtV
         6dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504588; x=1769109388;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lo79Jc+8GawfI2eDcTERJ9/Xge+CVfWIAHQ1kiPAZpk=;
        b=lVXsbqFWuQ4lqnMFEvJ7QRKNUFXMNawzzc2KfKw8AwORY+Zk7gjSNo4PBZ1LdA9dNG
         xm624tkCluYQ/5D09YGn7x3ZDp8J4eVP4QlbmHwAnjs3pfXN8ScHIStSKikBN/GYBnDw
         LdOoJQrdvhfOwIUTdR1f/rxbw+RoxB2n6Ms/MTFhnUWl90xfGobCQm+fg54+byqORW//
         jSOEg7Gty472VyVG4IZWwFUE/1fzXWj/rMgfhoRjzJD/W8RvIIDoMUhziIH4IBFSrMwN
         KWAbkZEh67X7CYntqjQoHbHiZTm8VE6vA+ri4JOnvrpzc6bOFoRphpBV+JOJTXy111vC
         wBAA==
X-Gm-Message-State: AOJu0YyDTn5CZjLt3dJzPxAvunS6LjFh3YcrFTUZ8zhx+ds3nZug/Vrr
	g40ZzZkx3Y70Deg1xw14AW+SaFIa0fusaaLRic0fKBaYUIt4U2ZPv9TvprilgxYJ7K/xzUTyOX5
	s2K6HVu8=
X-Gm-Gg: AY/fxX7HMQibO9DcmO7Jpqz7aQi5J6DP/SrD6e4O2uGoWl/WORSCgdgYx+qyMORV+HY
	UCv8xlz8OEYQyKFA++LeDL8C1933w9F1qhpbZyZCHhd2WD1VpcmoRbFdMAb/UC+hSMl75H5yU8k
	JwVfAGr3yYfE1fp9w0LK0DKLdavvZqjh8KlJ+NMUdT2GaINvmK9pCFDXmYtxyqg8a7TG0KmRlg8
	mLfwOA8EqRHVukg7FOugGELxCSSNM3wpdRqH2t/kFER9M3er1MbGK7a933MK5eXNsIVz7JAEacj
	pSojQ0j60tPX9vDFLLYhXehvVvVibLxHqv3+nOUl8k3DAN2DF+2YjmZ2SLfOdHZZ8a880K3WUl5
	fhYGFbF6yTaTkTZOpx86sA9UONFu4DSwUVmdnx+dag3f94cdzdMTtZc4WNdVjeW2KyWqXDc5Y8l
	5HfVWbyTG/zRpQWFK45535LWFtwoU6+fDJMbxqrrA2bld9qAMEMvrsQn93AZs9kSJUpGsKnBs=
X-Received: by 2002:a05:6a00:14c5:b0:81f:3eda:9d69 with SMTP id d2e1a72fcca58-81f9f6a9ab9mr544646b3a.22.1768504587662;
        Thu, 15 Jan 2026 11:16:27 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10efc6asm135694b3a.29.2026.01.15.11.16.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jan 2026 11:16:27 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] i2c: mux: reg: use device property accessors
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <0e85c0d7-3fa1-62cd-f09a-1712ca7c03b3@axentia.se>
Date: Thu, 15 Jan 2026 11:16:16 -0800
Cc: linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1013EAA3-CA3B-4CCF-8FDA-2D5839F9C0B3@nexthop.ai>
References: <20260115003523.26660-1-abdurrahman@nexthop.ai>
 <0e85c0d7-3fa1-62cd-f09a-1712ca7c03b3@axentia.se>
To: Peter Rosin <peda@axentia.se>
X-Mailer: Apple Mail (2.3864.300.41.1.7)



> On Jan 15, 2026, at 3:03=E2=80=AFAM, Peter Rosin <peda@axentia.se> =
wrote:
>=20
> Hi!
>=20
> 2026-01-15 at 01:35, Abdurrahman Hussain wrote:
>> [You don't often get email from abdurrahman@nexthop.ai. Learn why =
this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>=20
>> This makes the driver work on non-OF platforms.
>=20
> What measures have been taken to make sure that things continues
> to work on OF platforms?
>=20
> Cheers,
> Peter

Unfortunately, I don=E2=80=99t have an OF platform available where I =
could test this.
I am open to give this a try though if I could borrow a device that uses =
the driver.=

