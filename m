Return-Path: <linux-i2c+bounces-1165-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE84825AEC
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 20:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCEBB1F23316
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 19:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1F435EF3;
	Fri,  5 Jan 2024 19:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akrPoQZV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB2D35EF1;
	Fri,  5 Jan 2024 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bbbc6e51d0so1239241b6e.3;
        Fri, 05 Jan 2024 11:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704481536; x=1705086336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoIySbgur5au7bf7Os/eUGAz/3/safLAx4scAQRRWyg=;
        b=akrPoQZV6pK0TtLPRMqZgCfBuvqckUFxxZonZknqbf72N83Zv7avKPySkm+UiHisZA
         CATzL9/ltfHuFYMDTtgLq27eOjpLreKJ05n364NayuP9C2kwE8Xii8jW/h+8j+HYlkhI
         hoHKpTUzD5ANBMGLz5fPSrkwUlFgX7vTZ57Z19iAASXjsjtzfSMMWjpYWl2PuHLgSIDV
         GEDh0CNu9XEbdj00PKmM1/lRNeQo1XbVDpy8LsY9KQInJUQdz0LOPkfoeK1gB6FbM3jH
         /pn0MdSRDu1XVRHNFFPex38+4Wz3sPYP6y0bon+8/e9ExFTZGBWV0bcDyAS1RAfHKHoU
         Dj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704481536; x=1705086336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoIySbgur5au7bf7Os/eUGAz/3/safLAx4scAQRRWyg=;
        b=BO28kLndiwFzDRCopNBgwwrUVkslfjZ1flGN2dGJ23MzhpGOHFp0lMp/90ACtC/oAg
         j0259QVnA72qLE6D6qdTBE0fQ/05w4mu5KzwRRXQ699bbADNX4MTbiUed5ZH7ET2o2Mj
         hKfNbwdj2ZTZCl2cx3vSs+DxiW5lGAWtFEsKiHwBpthwg5uMp574NptzDvFzU+zGtyDz
         HbtccbzlXlb0QFzsy8MG1PFHFvboLz9G4fuhmbj20+4jpDZlRhEkP38vXZnNSIYTg0Sq
         L2S5w8arPDg6Je3hmdp4IZ3z31JwPZRrzXRIHkifeq7rqg5uNq6C+B5wKgTjUxVtXy6O
         uciQ==
X-Gm-Message-State: AOJu0YzrofFPoEtRNB6lOf0m294Lrq8hNyL5gdU0T0YGxIDnJYadwrqW
	aAkjpDKxhmKnLHZQ6HuBkoM89Dyr3pjx7cvn2kQ=
X-Google-Smtp-Source: AGHT+IG7X3Evrd25pfUhTKr9zscwWaY+pGR6hYN241EUxHMvpW0ILrfzNEcAXCZcZeTiWPK9e2C4hIzhojBn9YVBHS8=
X-Received: by 2002:a05:6808:1718:b0:3bc:210c:551a with SMTP id
 bc24-20020a056808171800b003bc210c551amr2388466oib.75.1704481535921; Fri, 05
 Jan 2024 11:05:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231224213629.395741-1-hdegoede@redhat.com> <20231224213629.395741-6-hdegoede@redhat.com>
 <20231224220321.vqzb4q3ut3dz3rl2@pali> <c3d903e8-6611-43e9-ab31-44e92371b0c3@redhat.com>
 <CAHp75VdoSaVMkyzFdKJYu17=YZNVFubUdWAC6tm5TqN3Ccvj3A@mail.gmail.com>
In-Reply-To: <CAHp75VdoSaVMkyzFdKJYu17=YZNVFubUdWAC6tm5TqN3Ccvj3A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Jan 2024 21:04:59 +0200
Message-ID: <CAHp75VfAS=xkoLz63qozsMXyT2ByJSkwYfsYRfU69NxEyysLKA@mail.gmail.com>
Subject: Re: [PATCH 5/6] platform/x86: dell-smo8800: Instantiate an i2c_client
 for the IIO st_accel driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Eric Piel <eric.piel@tremplin-utc.net>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com, 
	Marius Hoch <mail@mariushoch.de>, Kai Heng Feng <kai.heng.feng@canonical.com>, 
	Wolfram Sang <wsa@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 8:37=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Jan 5, 2024 at 6:34=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
> > On 12/24/23 23:03, Pali Roh=C3=A1r wrote:
> > > On Sunday 24 December 2023 22:36:21 Hans de Goede wrote:

...

> > But AFAIK / AFAICT there are no actual userspace consumers of
> > /dev/freefall so removing it should not be an issue.
>
> IIRC/AFAIK there is at least one (simple) computer game using it as a joy=
stick.

Okay, I can't google for it and now I realised that it was my x60s,
which has no freefall, but another interface to it. In any case the
side effect of that googling is this (maybe more, I just took this one
as example):
https://github.com/linux-thinkpad/hdapsd/blob/master/README.md

So, dropping it will break at least this tool.

--=20
With Best Regards,
Andy Shevchenko

