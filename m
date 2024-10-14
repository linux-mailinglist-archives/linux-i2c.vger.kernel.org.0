Return-Path: <linux-i2c+bounces-7357-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1157999C23A
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 09:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1F2D281FB9
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 07:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9852155753;
	Mon, 14 Oct 2024 07:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlzAo8NO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBEE14D444;
	Mon, 14 Oct 2024 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892540; cv=none; b=MiwEyg+DznfqKdhlL+CNIj70CNUCKOUKB9Dt/AOyHn1fdNX+BmDwSwdaS9RYTuUx73sjmf/BktyKDJA9byAo2aGMb6Ohelmq8XjBhUBH03fqGos6DQ4wD7kvsRDRUg0lOGeIGIN6hFThMlpwtvya5wi2XSFxG8JM0FD61ff/M0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892540; c=relaxed/simple;
	bh=dA2IneD8kRvzg3poRH4eotGjefUz41K3QrIAfu+sz4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H02w9NY9+CRCxRuDP4ZG64nx5zPj+dTuyYIu8rUW0vxGuJ6W3muKrS+YimmEMsR/J1JuFFQS91S/oEnGg+kubvY+8oSNaKiiLfilLUnBIyOJQywUbYN4ZngU5aO+W0VgocWCMpcCrxqqshQOknVc2S6vkCNipUuW0+vmF5aTFPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlzAo8NO; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so5091453a12.2;
        Mon, 14 Oct 2024 00:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728892537; x=1729497337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WpR+CN6uEEu6EeTwqUSFj9u8VTqS2qMOuFsh7BuOiM=;
        b=OlzAo8NO12yAGbVOAVSxFxTz529t4SSH8SOZJDcl4WvJuaM+cigmvDI9lYgruApFnu
         Fie5UqqtF29+wEmUDFH8RPInxe16jbsTchtII/tEqMP/EWkjvGl6iSNSnVgwIAOx0mC4
         5WYptjnjrdXZokYdp+KXS/8t1DUp8QyoqCf9UCIOkHKam9iTjxHyCiVK/EuHxaPS2di+
         bvaKvYyQC6d0fFsixF1o/PP8R93dZV8kDZY/E864Cd/ZOYcbsd2hI7iix47LdAbiauDz
         h/go78bThx8dcUiRzkZsUtDK5/SeMqzNu16cJxgWykgOS/duY7p1QS06CI7W5ggt09CD
         RRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728892537; x=1729497337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WpR+CN6uEEu6EeTwqUSFj9u8VTqS2qMOuFsh7BuOiM=;
        b=Q++mEZqJCfQ4m6KGJhcUsaXcsPZcnHm+/AxN3feDvS4WI31L5GKfwAo5OOqYFFCZeg
         Zb036kLC1IBfvetrOY7GcV7w3gPcNq/UpzHXeSqNe9xdtBDJYA0CQpkA7NN0by4cbe5k
         WqQzp2gotmgYKuAzzk1my8xUftjfQuVdyOxHOQ8KYronR34Y7ZdVqypFYAQZEGMj4vJe
         WepObUOxN3CQK3r6RKk2TXL+AzO58KxqEGHGOXtXe8qvvqFs7R0OSDCJarK9/uxa5wTx
         XZyuH+Zs7UuF7cwDtwqQ9g8AoN9N8tYNrWa1yg8mW2dpo92lvFhRKYFKeP6lRh+Y8C4f
         vU0w==
X-Forwarded-Encrypted: i=1; AJvYcCU2vEtLe6vNcPMXQB0kiB68y8GSAOLIM4Ss1chk8JfJvKAnTASXyLfYvC2RZsms9lTuH6rJwjIxhvE=@vger.kernel.org, AJvYcCXgEjUJD04Ki2bqDKTOCWt+Hg+dQ6a2ml50Cf132NW5OJRmyyIvxlz0l+rqS3g5yV2wLy+vhQITSu49X4Lq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/EAH2bcgwfr8mN3kgws99Ma52kUghGSY/CxKqFtuq+fSYracd
	E2ikGyksJd7KZCK02ltkVQ1Q27MMbrAAf42VTf2Nu9h1oGnEQ3v/vgmwQFOvhuH3RF2VEQsQmq1
	BkJkRAAEx1Fijq3Oib0T+d3OabdF48RM=
X-Google-Smtp-Source: AGHT+IFcctVyNJkG1tiXJDJMAL32ITizXtIvBW2QMDcgKBM8PHI0UeAsniLAG3tGyewO4GbuKOAYmEj2MGLx6KzVxdg=
X-Received: by 2002:a17:907:3e21:b0:a99:5278:ac93 with SMTP id
 a640c23a62f3a-a99b95badfamr828775266b.51.1728892537111; Mon, 14 Oct 2024
 00:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011055231.9826-1-kfting@nuvoton.com> <20241011055231.9826-5-kfting@nuvoton.com>
 <ZwkFwABviY8ClyUo@smile.fi.intel.com>
In-Reply-To: <ZwkFwABviY8ClyUo@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 14 Oct 2024 15:55:25 +0800
Message-ID: <CACD3sJbw8QVsfNW=Rz4WfzQ3-+d=Y_=U1kpkneSNmfDcGugChQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] i2c: npcm: Enable slave in eob interrupt
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Charles Boyer <Charles.Boyer@fii-usa.com>, Vivekanand Veeracholan <vveerach@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=887:02=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Oct 11, 2024 at 01:52:31PM +0800, Tyrone Ting wrote:
> > From: Charles Boyer <Charles.Boyer@fii-usa.com>
> >
> > Nuvoton slave enable was in user space API call master_xfer, so it is
> > subject to delays from the OS scheduler. If the BMC is not enabled for
> > slave mode in time for master to send response, then it will NAK the
> > address match. Then the PLDM request timeout occurs.
> >
> > If the slave enable is moved to the EOB interrupt service routine, then
> > the BMC can be ready in slave mode by the time it needs to receive a
> > response.
>
> ...
>
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +             /* reenable slave if it was enabled */
> > +             if (bus->slave)
> > +                     iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR=
_SAEN,
>
> GENMASK()?
> But why do we need it? Do we expect this to be 10-bit address or...?
>

0x7f is going to be removed in the next patch set.

> > +                              bus->reg + NPCM_I2CADDR1);
> > +#endif
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone

