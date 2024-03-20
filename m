Return-Path: <linux-i2c+bounces-2415-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA78D8808C5
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 01:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCA8E1C20F52
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 00:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321E713FFA;
	Wed, 20 Mar 2024 00:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcrbJ44x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991B913AC0;
	Wed, 20 Mar 2024 00:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710896014; cv=none; b=pSe+42qq3l6Z6C12EcjhPQGI4pr4Twf2qPYRNvu/hg3ZNNjzBr8Rurn2Hgxo+CP4z+6DcaA1cl3ZKSr32sJ3agX4SWB2/EI+CV3rbIa5ipoHMZrZRtpUtTj+d2G2KQrXolLBgwlcRqrUyczGK0N3dJ0wjAJCul/FkJjYIRtKXyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710896014; c=relaxed/simple;
	bh=W9EoQO9IpogxFTyOaag+ZpO+hWXCdFYKxLuFtWjNqYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cjh0TS3MjSC1/+c9RQQDO/FmocKGmj9vX0ruckpXpwrcBuCwZ1RtEzGl8Y6HcnKQIt2IJLQwdCinJzI3ZtcVZHDgsvwVP5Lr+39QLPIwhhAnpPA4IFyyWwOhndLfgSC4NDYJgY+OVH1KUmN4MtQOntVOg1vXxzqkJAqsJ0w85Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcrbJ44x; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c3775ce48fso3335532b6e.2;
        Tue, 19 Mar 2024 17:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710896012; x=1711500812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9EoQO9IpogxFTyOaag+ZpO+hWXCdFYKxLuFtWjNqYY=;
        b=hcrbJ44xjKkyskHhCZo6khkvty6nrPMcQadGMMi+kFnwk0hwMmuEztJ1K0KfoqCKVY
         AegYsZ2nNmYeUrj4Hohi3KI3aIXeHDzx6BNSPB2IzBvV8xqc4tyT/lgnQBBkuWfqdg96
         n/AMYqJVyUb/0/GpwO6rduarVxZVHo8svza9u10Ioe2IIPM4Wx5HBNj0+QyQ/5X31rJ7
         pQ7/Lh6YOEFrfwXdzbpR+5oqWOJSqqRq2/ewcdJlQmhFrC8Wlhku4KnSXKcp8q+sqcTA
         m6saYctq1CjPvUK7Dg7Ajniui4jJPqwLIcDAtBJTsKtefQDuud397YSWrxHgIXxMyG6Y
         MfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710896012; x=1711500812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9EoQO9IpogxFTyOaag+ZpO+hWXCdFYKxLuFtWjNqYY=;
        b=JLElTiowRbziCn0aFGaUirqjq9mfj+FUY0XPxD0WDdJtj19aoB/cm/7ojuQcgo1xgV
         iOiD2FuhaVQHL2tUy7TC16RmBty6z1i/ypUTjIcTQn37uAhZnzkZQ0fwakf3VEerJCV1
         WMk+j6hUdqfKctAtA10LVFPAgsH+YQeig5QEO+MGycST3NGUrvZ6R/VY1EEeAq/dbCdG
         VNxHsQN7x/jtOE91fvLS65Xi+HY+nEcnmijMcSctAT77p/JaajwQhr5kots2lnGj0NG0
         yxWsAH6QTnqugieckIkVAGzwjqbKL2Heclfz65K13DLSXAd/g+iEZDtbDVfeU/fzoCms
         Or9w==
X-Forwarded-Encrypted: i=1; AJvYcCUqk/qD+TCY0NFehVS/GGTx3ppoMcfj6s3LC/cH+VTwO7Co4sUr5jjNCntK7knq8uO6O+apuOZGuPIlJuC28FiPFSJO+k7C5gbmLJo7r3H7wvAFJrojkj2y6fO2LbnfKYHXTjru2AsgrtEgrMdzGRj6SAFRJoKXabRFtH4koQmMUp59VA==
X-Gm-Message-State: AOJu0YyhF03NTiqozJ4FGwajYpJNUUjHILgE+PQtm+Sqhr4dImfCoyOG
	k86A6puqwVMOdAqt0c7jUI7whYCsbGrDisQym+6lV9AtCecaVZNs8/C20uQ13uPKUYzcOj98CzK
	NiYaUGFXEaducNdrF7qKCHrJC4BM=
X-Google-Smtp-Source: AGHT+IFhwu6P/LQFcryxU4n6BHn9VVJRNCJiqNX4KchWgXWytCtkYziINHDFhNcRE3tOPAgR7rCsS+UUYOR3cAMkQZk=
X-Received: by 2002:a05:6871:588b:b0:220:9862:a2dc with SMTP id
 ok11-20020a056871588b00b002209862a2dcmr16742705oac.57.1710896011726; Tue, 19
 Mar 2024 17:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318153959.30755-1-animeshagarwal28@gmail.com> <20240319-oversight-viable-4550ffbc31d9@spud>
In-Reply-To: <20240319-oversight-viable-4550ffbc31d9@spud>
From: Animesh Agarwal <animeshagarwal28@gmail.com>
Date: Wed, 20 Mar 2024 06:23:20 +0530
Message-ID: <CAE3Oz81-8tV2iJc7Jp3B-ooHvGeOSctxUAvd_1dA-3DQRUJFPQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: nxp,pnx-i2c: Convert to dtschema
To: Conor Dooley <conor@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 11:27=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:

> You're missing a space before the <, but otherwise this looks fine.

Should I send another version fixing this issue?

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the review.

Regards,
Animesh.

