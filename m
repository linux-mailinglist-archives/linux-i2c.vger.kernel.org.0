Return-Path: <linux-i2c+bounces-9890-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F8EA67F9F
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 23:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD93418984BD
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 22:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA531F8756;
	Tue, 18 Mar 2025 22:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dygKBtNA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F9F155753;
	Tue, 18 Mar 2025 22:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742336374; cv=none; b=ijCOIN84drmhI3JbDDRZPgt7YbAyw99C+4F/iE56nuKjfCnIiuzKkfoKHPwE+v13YUcwz9xuLuN/K2STTQ9kThIFoD2th7PZNbkNnm5GNtg2kZxrcNn6DWrfwhME2I9cOpBnCUJRTR+Vn3aJZQJmn0te5bsRGj4PMPuexLDNqSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742336374; c=relaxed/simple;
	bh=u7b0EopUBIIvvpkNpfDzrd4hzh3ed8l6dHIQADUl/9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpj/J1uydqWMomdqMvrlbTp5bN/PHpD3WN/MChIN9Z9R5aR8oQCdYy9Ve+EoERVwiCpy6haR7dO0l/G7QKxlTGrFIyRnd0XWrxzE2mD1dVlVtihcMLQ1NM97EZw24QzDqImwrNHOLwEZw6dDyE2Ae/wEbJvKtcJbqsV5J5RjZZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dygKBtNA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC25C4CEEE;
	Tue, 18 Mar 2025 22:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742336373;
	bh=u7b0EopUBIIvvpkNpfDzrd4hzh3ed8l6dHIQADUl/9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dygKBtNARW6ykDxVZ3qdWvoc10u9IKvdjo2DF1N3cCz0j9hL8QkReosLG3bCbYMa+
	 e00/lop0BDmwpeGZq7P92T9JMFCb6VSww2TpVH/Pcc/S250sN9IgKklqWtu5rCmhZk
	 FP5OsYM9gPn3vXAlQSpOmFu1ZCAr7HzOUEpA+ysHoTAFFrxi06l3NynjaukSuPaE24
	 eM15tBXHwwjYTPnRNQjfcTF6Jm9RKpjpdLI45vccyW4zgxQGOMc/k66I/y19+aLK6M
	 6OZ6Qp1lFNrWVeU1M0rG7oYVX5V/aoM5pTwBBU+VJfrucN3h9sVekBeWQOhhz+v/Ta
	 REiblcTLHX5ag==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so9440457a12.0;
        Tue, 18 Mar 2025 15:19:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEvSY7USb8YKGrCEQDM5dPUfKdR5uuEjv1NjsZK0+53ShbdE3YVMMAyYcrIqUDbqUqGXZNhxccWjMjTFA8@vger.kernel.org, AJvYcCWrhOnPjxuhgXvraYfVbveVmiasUGvWRQ6ZMHOCrPGc1E1P3oBgJecsdRuYtWar81p87gkK1xdzL8aE@vger.kernel.org, AJvYcCWsDSgxLWMtWk4wMDLrnDzQ5Gz2/+dcUoTkvuM0l6CedB60Sii20y7+nFQLDkdJXMgKNM7SziZKLT9U5A==@vger.kernel.org, AJvYcCXPCEOOIOO3rpfIwU/jZYtnj55ABNmdRpN85rfhwQn6h5jNN77mOV4nJ394nJyV5cPkeyWCsZUguGmx@vger.kernel.org
X-Gm-Message-State: AOJu0YysXn6WLkOzwKeNCebU5iy6LLZyR8c5xia/v2DhCF9J7utjjXTp
	d+ttbys7BtLSp1dzH5SUG+gN0Kz8tuOEpnZ76wCpgmO2eaeUI75d21utPKPdx1PIQRccaJ8cmLS
	dTx2OX4d5Mu4XmWg6SrqqytECjA==
X-Google-Smtp-Source: AGHT+IGcMwYyO/POFMpTDFuIa2YqQWZAf278mdK5WfrUj18LXPSX+gWXwda7EIroobdoIYm7mMlPyGivS3yrEr8u7Rs=
X-Received: by 2002:a05:6402:50c7:b0:5e5:b53:fd49 with SMTP id
 4fb4d7f45d1cf-5eb80cc9af4mr343848a12.3.1742336372205; Tue, 18 Mar 2025
 15:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318103622.29979-1-j-choudhary@ti.com> <20250318103622.29979-2-j-choudhary@ti.com>
In-Reply-To: <20250318103622.29979-2-j-choudhary@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Mar 2025 17:19:20 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+L3Swkw5-8CcAC6++22k1irv2igoQBv8dTt+0pfonX-A@mail.gmail.com>
X-Gm-Features: AQ5f1Jq0_JS7Y_H8njv49p8y_dpSwaJETWwZSkOw0KDF3rMauYXRpelek25NB9w
Message-ID: <CAL_Jsq+L3Swkw5-8CcAC6++22k1irv2igoQBv8dTt+0pfonX-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: omap: Add mux-states property
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: vigneshr@ti.com, andi.shyti@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi, 
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org, 
	tony@atomide.com, jmkrzyszt@gmail.com, linux-omap@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 5:36=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> Add mux controller support for when the I2C lines are muxed after
> signals come out of SoC and before they go to any client.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

