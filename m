Return-Path: <linux-i2c+bounces-4348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FC99172D2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 22:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE21E285BD7
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 20:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF9A17E460;
	Tue, 25 Jun 2024 20:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PY+9dGnl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2385017DE0D;
	Tue, 25 Jun 2024 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719348892; cv=none; b=S6PJwAM4tX8/qBOuRIZI4TfCoL0kXu/Ll8SFKDApwBOjYOADAbgq9AJTHabs+vlzTx2F29eSSwhg40Eul8MhejMa7/lBk0StJXsAD7TB1S4ZJQbCCc3m0ZbxyIvG1DN7KS2hVvYxG4yfa3twfLNbSMe+2QKYYb1ld4IuLPJMnAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719348892; c=relaxed/simple;
	bh=90JxXMwAQdEoqPTBZdjiAQkPsbYbs3lEK4ueZuV6rfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fX8LWiq7webCID3bswWlWRpp6AUUSfsEo089VY1MC5jOEwq1AbtbYJwnfWWQvnAZI7wq6eW/iBv1feIsfZ9SHTbYdvAr5nqokL+eKmdMGUvKDJH7maqrhxh1v8oh0w+zuzTnj7V26MAuvOnYNm/N4TP5ynoC3nooIbk8vWEmjVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PY+9dGnl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB0AC32781;
	Tue, 25 Jun 2024 20:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719348891;
	bh=90JxXMwAQdEoqPTBZdjiAQkPsbYbs3lEK4ueZuV6rfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PY+9dGnlpf02927QxtxB7T4yvM26377X0yz3E70G4INuslxnpUh9z0t/odCZPo/mX
	 qHYaC+a18d6N/N5+xP+7ox3qC1/ZlBrN7IAtObI7LPUAvJ+jd8qJ4QVLT56N2mIyCl
	 QmTzUxiMZttAJXz2kSmiTh2e62AoMk7r2y1D9KFjOSs9c2ddbujz/lpv4ku0b4SXZ6
	 t1AheFnJbpI76SyRs4ZrnesPHu9irZSJHTkHGC6QuDktMbY6iU+fWTRs7N/wFY8hTh
	 kY/1Exl+bEh2lBZ2NNX0/HpSjyF2ggF+pf0koPpwZtx1hkKaJSDRD6oX87tlO5JCTd
	 reQTorBnqFVqQ==
Date: Tue, 25 Jun 2024 22:54:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] dt-bindings: i2c: nxp,lpc1788-i2c: convert to dt
 schema
Message-ID: <fkycdpk7wstgnkmdlp4upkzqpasc4xjcrgwj6zfckj6megg3om@qn2stul7fcxx>
References: <20240625065939.6146-1-kanakshilledar@gmail.com>
 <03174142-a2c0-4f9f-81ca-2aeb7f57ab79@kernel.org>
 <329ef10f-14d1-4346-8496-906aaf91ccfe@kernel.org>
 <CAGLn_=vWxoHJivPgLHov8h7wHxmTH0y19twN=Xhyh_rZEmjbOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGLn_=vWxoHJivPgLHov8h7wHxmTH0y19twN=Xhyh_rZEmjbOg@mail.gmail.com>

On Tue, Jun 25, 2024 at 04:37:47PM GMT, Kanak Shilledar wrote:
> On Tue, Jun 25, 2024 at 12:33 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On 25/06/2024 09:02, Krzysztof Kozlowski wrote:
> > > On 25/06/2024 08:59, Kanak Shilledar wrote:
> > >> Convert the NXP I2C controller for LPC2xxx/178x/18xx/43xx
> > >> to newer DT schema. Created DT schema based on the .txt file
> > >> - added maintainer from the MAINTAINERS file.
> > >> - added resets property required by the corresponding DTS files.
> > >>
> > >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >> Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> > >> ---
> > >> Changes in v3:
> > > you already sent v3 so this is rather v4. What happened here? Why are
> > > you resending this?
> >
> > Ah, I see the changes - you dropped the incorrect tags. It's fine but it
> > should have been v4. Not sure how b4 or other tools will handle this.

why should b4 complain? I fetch it from the mail-id. And even if
b4 complains, good old git-am still works :-)

> I thought there is no need to bump up the version just for changing tags.

You should increase the version number for every single change,
even trivial changes in the commit log. If you are sending again
the same patch (which means that you are git-sending the same
.patch file without any change), then you should tag it as [PATCH
RESEND].

> Shall I resend it as v4 and update the commit message with the change
> log to include
> the removal of kernel bot tags and addition of your review tag?

No need, your patch has been added to i2c/i2c-host.

Thanks,
Andi

> > Best regards,
> > Krzysztof
> 
> Thanks and Regards,
> Kanak Shilledar

