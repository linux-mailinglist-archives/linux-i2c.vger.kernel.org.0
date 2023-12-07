Return-Path: <linux-i2c+bounces-645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46714808487
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 10:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE374283A1E
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 09:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2929A33CD8;
	Thu,  7 Dec 2023 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=friendlyarm-com.20230601.gappssmtp.com header.i=@friendlyarm-com.20230601.gappssmtp.com header.b="jxZvrCWi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691651AD
	for <linux-i2c@vger.kernel.org>; Thu,  7 Dec 2023 01:25:57 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-54d712c254aso916276a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 07 Dec 2023 01:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=friendlyarm-com.20230601.gappssmtp.com; s=20230601; t=1701941156; x=1702545956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56T1M3RkgkEvFsKEJLHWcohTkirOLnD7I3rdsoTC1yI=;
        b=jxZvrCWikWieZRTpVZsMw0cQ03wEvaQTxcNTvw4DfWpvkIt9LPDYqZX2Wb3g92JuuW
         SmEA+Q2Z7utaNpoVC/HUjbKqMtAIvz/tJ5bTQyLXI74t2r31cg+JKAUJsSmTcJ1bTMfB
         3+JffSCf4FmOOuDxrSddrGTe4hyF5PP6T/+9pvxzo6VOYj8NrlSpj0Uz+mkdT5DlwXSH
         0B9wdmRFjwx3DVSKVr37rYdKIaQzQv3EndZlS/7kR6fQ7sB0lALLALBf/F0hckoY4a7s
         UhYycfhYxt/LQ1FlWrzdLUiphRZKk5T82+ymkKOf6lmnZOw4452GNPzjY97yGINvTnfV
         3Qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701941156; x=1702545956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56T1M3RkgkEvFsKEJLHWcohTkirOLnD7I3rdsoTC1yI=;
        b=jjFiQDg3GJ42n0xsZQYda0uv3/chxY0J+mimBj08Q5eLSt7EDXVB7rDdkvRow+I1hA
         vKialuK5ulPqYzLQwf0xKjw3cUNK31v5x6q1W+MvkDGdTsmiMz1D0PJgMaIh+2TXKan3
         uCCEU/zODsCBWrLojA/E7nhLPEqCknXAQLZDs4/MZhGMLX7osAC+iWS08HLmmCWfLNur
         cpv71SBk+70fm3IHM8HUmfEVMZtY47aH0x9+NnZ+eosydeAIMH4C6K/1Sn7YAcNGOXNj
         bOiRuBpiuzFRCahSRwosXYRc9kT7l1kDPLoiEsZRu5uaScbPbwWS9XjNtoaOSkqFeG2C
         bjvw==
X-Gm-Message-State: AOJu0Yy8GX8HVxWLduyucCYVNF4dOnc01zda3S43Pd0+PSbkttAVyYjy
	L8kNji98zcJeDgVXniSwQ9E8E5elnIgXc+ohWaMyPA==
X-Google-Smtp-Source: AGHT+IFtB80x1RKWaoiFQnsZTz44KpZp+e8iynF5WtfXkFTzjLVGH8RiUrf6aQvX2/TyBvWbzs9E6CfhsZ3FrmAGZcc=
X-Received: by 2002:a50:8a97:0:b0:54c:d8f6:3f with SMTP id j23-20020a508a97000000b0054cd8f6003fmr1476412edj.56.1701941155885;
 Thu, 07 Dec 2023 01:25:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207082200.16388-1-jensenhuang@friendlyarm.com> <ebf6cf8ec3b5befd673d295061fa2738@manjaro.org>
In-Reply-To: <ebf6cf8ec3b5befd673d295061fa2738@manjaro.org>
From: Jensen Huang <jensenhuang@friendlyarm.com>
Date: Thu, 7 Dec 2023 17:25:44 +0800
Message-ID: <CAMpZ1qHUnTDQ78gdrQF9Sx_-XfLM-B+H-0bL1-+twKsno+JOvg@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: rk3x: fix potential spinlock recursion on poll
To: Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Benjamin Bara <bbara93@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 4:37=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> wr=
ote:
>
> On 2023-12-07 09:21, Jensen Huang wrote:
> > Possible deadlock scenario (on reboot):
> > rk3x_i2c_xfer_common(polling)
> >     -> rk3x_i2c_wait_xfer_poll()
> >         -> rk3x_i2c_irq(0, i2c);
> >             --> spin_lock(&i2c->lock);
> >             ...
> >         <rk3x i2c interrupt>
> >         -> rk3x_i2c_irq(0, i2c);
> >             --> spin_lock(&i2c->lock); (deadlock here)
> >
> > Store the IRQ number and disable/enable it around the polling transfer.
> > This patch has been tested on NanoPC-T4.
>
> In case you haven't already seen the related discussion linked below,
> please have a look.  I also added more people to the list of recipients,
> in an attempt to make everyone aware of the different approaches to
> solving this issue.
>
> https://lore.kernel.org/all/655177f4.050a0220.d85c9.3ba0@mx.google.com/T/=
#m6fc9c214452fec6681843e7f455978c35c6f6c8b

Thank you for providing the information. I hadn't seen this link before.
After carefully looking into the related discussion, it appears that
Dmitry Osipenko is already working on a suitable patch. To avoid duplicatio=
n
or conflicts, my patch can be discarded.

--
Best regards,
Jensen

