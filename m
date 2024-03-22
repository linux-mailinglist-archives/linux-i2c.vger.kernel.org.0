Return-Path: <linux-i2c+bounces-2484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FC98865B0
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 05:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E3B828615E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 04:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B87663D5;
	Fri, 22 Mar 2024 04:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkh5JKt4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D03539A;
	Fri, 22 Mar 2024 04:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711080252; cv=none; b=Q3qLxq+dmR0YSCFFfAPapQuG5Qqz5Kcam4Up2mFhn93FulubYWF62dd0OBxAu5D5+Ndp2bpnSwJgfsv5GLfGG/CB038Y8ZAITs0QvAf0yOTUJiKTBeG42QxxjrRHJPvWREVZrTYfdXhGhPyyGh2gRlvcOt2l2VKkRMlPgBPZTaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711080252; c=relaxed/simple;
	bh=8XsoOjRj04Rlf282vwPuGGrkCEPpbrEB6ypq7mgToQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrsNmf3GTR8aiJ+L5yhNetPfPlL3x1SadppcqaQMJwU8+DCoNn8BmguKKygsVTqHipwu/RsdtMX0LDEwUMP48l4+F3Qj0EzmI58HOyVb40xYn7BUQtcFM8ODh+HYGF3e4rkxwoODrTG64/noOo9fpvrsPfa4d7rgAvqTEXDe3Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkh5JKt4; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2220a389390so822582fac.0;
        Thu, 21 Mar 2024 21:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711080249; x=1711685049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ/izzScI1fREIZGekkyhtJcOgE3fms7DYKYprBPlpU=;
        b=dkh5JKt4z9IlmRUXsSl+4b0bPn9EwVLEO7HYzzptxJUUdof+NKVaJ772cVzV2KuUFz
         ZvKP2d2v7z8uwxko7HPGOEMXOg2flgCi2w6H4iUATwz+eyNusox0Dh/T+vdxP87OQ3qr
         vZ1n148T8YoeIYOk/B+ItHuW7B2t36vxE6ikaMnTVJSm5BapAEDtmb91We/j8JIpT6hm
         C5UkY1LY+lZRQjfQ6UasAPj6+5OeJPFQ4o+CDl7n/B3YpaQsixSSVHcNAPb6+RKMSoq/
         nNsBwkMA4dsymyzFKuIPDebZQLlmoobYYxaipBcOgfNdEcKuZgh3QqcMIzcyyKfldJzV
         oaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711080249; x=1711685049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ/izzScI1fREIZGekkyhtJcOgE3fms7DYKYprBPlpU=;
        b=EEqeC9Q2mY+aBBYPa+jrlVoYlGvB5XGwa9XwRsRs8xEsGpb2ZFQMuaMbrW8e+CpvUr
         wjim63uK68xEcC3tI70NXj1+yCqeLrhZZX1f0aTD1n1Rkj3nZGy6HrVWWlNl3zaXluZy
         aqKcfBG6ydqZfqJSGn3FPZiX+AmwZUxh/BvriL6EK0b/EPjSpCuXAx5gUSMPCD1bBt8v
         bvPCQE41B/SGlAnxxGtSbkcu907TvnaM8SP1PPiLR0p6heuZsWeh07p+704rYBKQhqPH
         fjErGb42XOk/ijtkVCSm8nyE5SG1GrXO0dLqt7Uih/2ZF5lFHcFZLtTowY/LEl9k+Jzc
         ocfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1wPEHhD7KQYjPxlvyFUniQOPrGCCYBdrT1TLoRpzf/XXyxQwKQ2SRhipS9dDxOz3WdrmUGlZ7uJ0wqdfQ/jFzokXqnqPQyqHQnHp+7haOY8uwEtx2z/vrM8AGF5+Y5aTVqcQlsxI76aLgZojv7ZjXvOW/2yE6DibJYsUVvTZn4VkE/w==
X-Gm-Message-State: AOJu0YxnKPMzR2J563/0s25JOCZetoP3gaXYFSnU3zE7SWTDarZ0AWSy
	gqXquuzovnY2BJST/t5zPEukbcNsM7qvqiqwd0zb/OXwXRuKCabXxxC7G0gS2aq2qd/hZASoQCm
	csfmic4mHcKFtu9IZsJvehga7J+I=
X-Google-Smtp-Source: AGHT+IFXFqLQdxziVcpdTOgFwwmG4wRSlRUOhdZgESPBUD/lxXD1BNATgwjB0DZTlJ3m/o+6cAMejaY09lC4yiHjP/E=
X-Received: by 2002:a05:6870:310:b0:222:4d2d:c3ba with SMTP id
 m16-20020a056870031000b002224d2dc3bamr441722oaf.5.1711080249604; Thu, 21 Mar
 2024 21:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240320084623.82248-1-animeshagarwal28@gmail.com> <171105547918.707638.11304000819202245225.b4-ty@kernel.org>
In-Reply-To: <171105547918.707638.11304000819202245225.b4-ty@kernel.org>
From: Animesh Agarwal <animeshagarwal28@gmail.com>
Date: Fri, 22 Mar 2024 09:33:58 +0530
Message-ID: <CAE3Oz805_eNoVSfxTq4Zy_kQEfsXWhcYZpvLnrcu-VCyDoBzWQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschema
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 2:41=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
> Applied to i2c/i2c-host on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
>
> Thank you,
> Andi
>
> Patches applied
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [1/1] dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschema
>       commit: e73b7060deb7da42f4e887cb726d0c7019a84cd0

Thanks Andi.

