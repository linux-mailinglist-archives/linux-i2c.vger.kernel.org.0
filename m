Return-Path: <linux-i2c+bounces-5009-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5834E93455C
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 02:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 942C9B21931
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 00:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD2E4A1B;
	Thu, 18 Jul 2024 00:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Di740ZIG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE984A05
	for <linux-i2c@vger.kernel.org>; Thu, 18 Jul 2024 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721262191; cv=none; b=PbAPJ0NkEZM+41M2wcVk1x1aGpd3xPIMvPF8F0t5feyTu7y158EaHIUNpxN+BDmvllx91cWYAjrOcxpeH0IxSNyuwei+GcXOV8fkVTEvmpv6mVLxgLoEhFS1vCsdK6b6wjVzOYNZplqkTz7oMx8mSWt768yS8w4jyZ/TDJQyqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721262191; c=relaxed/simple;
	bh=L3zztIlyA1ycT592luYaBx1AfG29G3i/a1u20U2mPCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=l3jK+JM/xvHMhfHERg8g+OrFkgQ6RBtzui2zBdMTmqUpCHgKPERC080bA8BDVhsd8w1aT+MbMNZLz+glDMM69OSApu3z/+R0d18mX9JVFP/oVO3/193jEuZMGihSrxjph2cfXDF1NK7WG+hm1+Hn/Woas/5Lgv9eRoteSPSjBpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Di740ZIG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52e96d4986bso293090e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 17 Jul 2024 17:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721262187; x=1721866987; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72WbVH44i/16Etq7iUNI2JboVOFCeVeL925LyzElDFM=;
        b=Di740ZIGsub01MyA2rBZUTcilWKahEV2DTI97bc8qqcMUASkA/APzYehDaEJZl7Uny
         P/U00AzzaO5bDdz2sJkY+ZKvxjpdQb5PG/DK6qF766Qw1NLbd7X1Lufx71oNCeQfDxfh
         fAEpc1dsjvra9om8DvkEk7GVtqsIhApDIdqGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721262187; x=1721866987;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72WbVH44i/16Etq7iUNI2JboVOFCeVeL925LyzElDFM=;
        b=SO28ks+Ecc4jcq+OngsTBX0xCJS0sf+WlrbUAbJ4/PNWaTbIgIfeG4YVNLE8Eab7V0
         xDeTD+rCekTm7Cj1pwsBgVQ0cRh6B6AVTVRpdEl35BHsPorf6JN+od+w7a0DcPGTS1el
         jkFfV7aZk7iJyG7lrJQfl3pCUcocuZAFJYUVE7b1oU2d7rxRaxRB1U+YH6hXcS9Zw9EJ
         W3cwU1u3O/vcZf1B5bzVmL3jIBVHnCP9It9Alinp/BYEf3p1a1Aw7PNVoCCsgLs+w0i+
         7X04m3mJ5s/C/BticrF2kbBpEloUM+iyfDjN0DWk3Bv8ZvyyJ/Z0Ksq88pBoQ0SnxZk3
         1SbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/IxCUN3l34zIA/HWGdFrNoujxMqo+VoJ1Bvh6YLVXo+5TsZB+drzG+U0s8a3G6vi7OCBpAriVweWJ59Lqibegi63ain8p/ZPr
X-Gm-Message-State: AOJu0Yw9dVaaocXRxp70MZ0kIdZr+IkTCFevjCLzntfdJeZZbXd5JumZ
	9RH2Q1IgTWxeg8/xCKU6awWrMVpDqYIhmF8l8zIRbxaCR1epMOSg/K+Jg3t57pOTXYbGMlrufyK
	bp7k7Sw==
X-Google-Smtp-Source: AGHT+IHI/pTu4i84aKQ6dts2QR7YDyx62MnQxUp4cpqPPiX9NwRGsb//OBscxEof8Svt7Xy0Jp8QYQ==
X-Received: by 2002:a05:6512:3d28:b0:52c:9e25:978d with SMTP id 2adb3069b0e04-52ee54460d7mr2136695e87.45.1721262187029;
        Wed, 17 Jul 2024 17:23:07 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc80101fsm508848466b.179.2024.07.17.17.23.06
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 17:23:06 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so237491a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 17 Jul 2024 17:23:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULAZuCW5PAW/gG/bi46s8KFVBMWMPSaD7pCua3Lj861T1kk8kxCmsXFlciE4mnwgLdW95b6/SSh8V9V9XzWmuK5LU/mGeQmkcW
X-Received: by 2002:a50:aa9c:0:b0:5a1:a447:9fab with SMTP id
 4fb4d7f45d1cf-5a1a447a39fmr127340a12.28.1721262185767; Wed, 17 Jul 2024
 17:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZpY3X1tggZC3s_1X@shikoro>
In-Reply-To: <ZpY3X1tggZC3s_1X@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 17 Jul 2024 17:22:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wigtUnqv+RXkLZ2TwqV35YQeGrYsMnrowpnmQNN6wyhCg@mail.gmail.com>
Message-ID: <CAHk-=wigtUnqv+RXkLZ2TwqV35YQeGrYsMnrowpnmQNN6wyhCg@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.11-rc1
To: Wolfram Sang <wsa@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 02:03, Wolfram Sang <wsa@kernel.org> wrote:
>
> Most changes are in the merged requests for I2C host drivers and the
> at24 eeprom driver with their own explanations there.

Please don't do this.

What's the point of saying "all the explanations are somewhere else".
That's not the point of a pull request.

*I NEED TO KNOW*.

The explanation is why I would pull - without that explanation, why
should I bother with a deficient pull request?

Because this all is the whole point of a pull request, for chrissake!
You are requesting me to pull, and dammit, that means that you should
explain *WHY* I should pull.

Not this "there's an explanation for this elsewhere" crap.

That just makes me go "ok, so what, this pull request is garbage".

I have looked up said explanations, but next time I need to go look
for explanations I'm just going to ignore the pull request as clearly
just not worth bothering with.

Because I'm not AT ALL interested in getting pull requests that
basically say "I'm not going to even bother telling you why to pull".

And if you can't see that, I don't know what to say.

               Linus

