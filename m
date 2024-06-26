Return-Path: <linux-i2c+bounces-4361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D739178EB
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 08:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E310C286926
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 06:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9578014D458;
	Wed, 26 Jun 2024 06:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7rX4V8H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C844B13A869;
	Wed, 26 Jun 2024 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719383380; cv=none; b=oaN1DMn3C3KT6Do3dsqsx6I3oSz/QrTyUbP0dUNwpoP1/Fe+94NkP1pI25nVXV4Lpch9c/LjV9WvwZ5W/g9roZ7xLgBMbBCPzTyWoP+J/RMNBRd3V4pxib7YI81/2qprp08Cj/ylS8QRoXMMjAeaRWqyen+emAP9LhiMv3JYlaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719383380; c=relaxed/simple;
	bh=/jCc9mtWvZLS16zTeecEjWi2EsgVC2iaKCws4I/LokU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3zR4y1xvW1qjfJ7CKcLqM/hvHrGvfgxV9HeMWRO7CnwhWvpsipsvk48OysTL30ELS/hQ05TWSW4WXPp4mzpv419jLPjY1n7biXemhzyUOli70t7USd0NmCakGL/sFcZ1Lyua7s1CjXXWn18/W2e7Y3hF0QUx/ycZXDz4qbs3cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7rX4V8H; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d1782679fso7754127a12.0;
        Tue, 25 Jun 2024 23:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719383377; x=1719988177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jCc9mtWvZLS16zTeecEjWi2EsgVC2iaKCws4I/LokU=;
        b=N7rX4V8HPd19FvX2DwI2mGnNldpfPu75QSgBIkmrRmwcDzD2WzmEEkAClSrDLw/EAk
         MWpCOtXtOYjnEPkMsyeZuqVI/v/m4t+d+EHw/W+9Sgp5cu2Yj9+wJ+NrIvgeUtBh1rlm
         PAOFWWUKlfOOYeNKUElN4H7iMcF4+B2yJXUAKpyE1XbhHJjW9viUFfuaeRoSnqu9Czr5
         YXdhwlB9UlB2Rz9SXi5HphcVxmP1Ti/OjLywXBWwRfhesFwmkKuBXKEK/TY6YY2nYJzR
         1uPK6BhrcbEFhRtJc2OiYPNyjE3Bmx4+d+t0OLsiDFVNJnNvhEyKwu59Xgjl6ffAkjlo
         KzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719383377; x=1719988177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jCc9mtWvZLS16zTeecEjWi2EsgVC2iaKCws4I/LokU=;
        b=hBDlDnJyfReZ7CE++xbtKXCFdW4i7wSshrM+x4lUD3afv1k4Azmh8QBr7d3nweraQ2
         7uTO1zWD9xCEXiTOwM6toDAJSUIfsGuRw4YQ9IUDwe2i9wRH8RyK5Y1FBZ5cQAYZSjlK
         TLdiqb19jQug8cPP8KuGj6sVHNILSuPqY1u6qat8f8te0WeCwNVE9xnGKqRgfEBQ4tmQ
         sE4CG2KimCYn/mrwVt6EtwARjURDmXrgNRlcjZ1YEFzOMqbit5cfPc/cP5AqI3tVIyy3
         vHdDq71BLdL0RbVGr9StLJPoRgjWqY3uG25CmnorOjrBEvWwZzFo2mWP3STFlQTL85ii
         dwUw==
X-Forwarded-Encrypted: i=1; AJvYcCXXziAKVSPJTqO2IdrcUP5LAG8gYTGW0AAQXhIa/5SpP0yOAPhiauKQj5I5/khIIssXT48PiDPLjISmT1hOIngXmaA8qyD7ePlNfEuGOuhH3sP5ekuSS5GbPk0syR22H82nd6/TtlUEeyx678e3xfBu5QZxnL/j2ckwd6KnuvM0dAMNHg==
X-Gm-Message-State: AOJu0YzpCAMvN011BfrHQARdX4sTud0ybjP6P3jkkYKo14nHo8a1Eppy
	tPNUJqiuBKbvsrKPVZe4oJ2FNs+0Ti7Cf4DaagSGm/+LKmFBz2VwXkQF8U9PpdpXMHdkLHrE0DD
	lj3F3Y8h844GbrBpsnzV4VOhtfrA=
X-Google-Smtp-Source: AGHT+IGQhJnEa1WFdNMiF5wajiiAA9kN/8m2sWv3CeaxXeeXTF72N7x1sE97BLdrMMZn+nfkOKOrbPlDNtKjTuGtkx8=
X-Received: by 2002:a50:aada:0:b0:57d:72e:5b3a with SMTP id
 4fb4d7f45d1cf-57d4bdd0061mr6864655a12.33.1719383376583; Tue, 25 Jun 2024
 23:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625065939.6146-1-kanakshilledar@gmail.com>
 <03174142-a2c0-4f9f-81ca-2aeb7f57ab79@kernel.org> <329ef10f-14d1-4346-8496-906aaf91ccfe@kernel.org>
 <CAGLn_=vWxoHJivPgLHov8h7wHxmTH0y19twN=Xhyh_rZEmjbOg@mail.gmail.com> <fkycdpk7wstgnkmdlp4upkzqpasc4xjcrgwj6zfckj6megg3om@qn2stul7fcxx>
In-Reply-To: <fkycdpk7wstgnkmdlp4upkzqpasc4xjcrgwj6zfckj6megg3om@qn2stul7fcxx>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Wed, 26 Jun 2024 11:59:25 +0530
Message-ID: <CAGLn_=vDpwy8f2XokUv4-fvwD90OhSaFoivbTe932wQ8iAbm0w@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: i2c: nxp,lpc1788-i2c: convert to dt schema
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 2:24=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> On Tue, Jun 25, 2024 at 04:37:47PM GMT, Kanak Shilledar wrote:
> > On Tue, Jun 25, 2024 at 12:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > > On 25/06/2024 09:02, Krzysztof Kozlowski wrote:
> > > > On 25/06/2024 08:59, Kanak Shilledar wrote:
> > > >> Convert the NXP I2C controller for LPC2xxx/178x/18xx/43xx
> > > >> to newer DT schema. Created DT schema based on the .txt file
> > > >> - added maintainer from the MAINTAINERS file.
> > > >> - added resets property required by the corresponding DTS files.
> > > >>
> > > >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > >> Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> > > >> ---
> > > >> Changes in v3:
> > > > you already sent v3 so this is rather v4. What happened here? Why a=
re
> > > > you resending this?
> > >
> > > Ah, I see the changes - you dropped the incorrect tags. It's fine but=
 it
> > > should have been v4. Not sure how b4 or other tools will handle this.
>
> why should b4 complain? I fetch it from the mail-id. And even if
> b4 complains, good old git-am still works :-)
>
> > I thought there is no need to bump up the version just for changing tag=
s.
>
> You should increase the version number for every single change,
> even trivial changes in the commit log. If you are sending again
> the same patch (which means that you are git-sending the same
> .patch file without any change), then you should tag it as [PATCH
> RESEND].
>
> > Shall I resend it as v4 and update the commit message with the change
> > log to include
> > the removal of kernel bot tags and addition of your review tag?
>
> No need, your patch has been added to i2c/i2c-host.

Thanks for the clarification

> Thanks,
> Andi
>
> > > Best regards,
> > > Krzysztof
> >
> > Thanks and Regards,
> > Kanak Shilledar

Thanks and Regards,
Kanak Shilledar

