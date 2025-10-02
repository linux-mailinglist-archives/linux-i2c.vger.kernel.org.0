Return-Path: <linux-i2c+bounces-13352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33808BB3F89
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 15:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED95217E1ED
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 13:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464D9311582;
	Thu,  2 Oct 2025 13:01:43 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D390310650
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759410103; cv=none; b=TJWF0N4NwnNByBdd3QrpB5zpIMGIij1FnPgRmFLC4+XKZS3sbm/WNJJT/mfEL2la5JvEIaMBMhb8iDMGgtnPubuVL9vNiSTmEO9OoOhtlsL3gaP46sXETohL+zbi7uzC0/xQfBs4jDPTaPgVH1qKPbKZEpKbrgbGayml3FMnAt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759410103; c=relaxed/simple;
	bh=Bzm3UVzy5UmWZcilLMKv+UlC3Okbitce2Is02Gaxtrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7EB7KebmsqHJgoltcO7drKb+BZZ5Lmg40kJ06BthRrMekEoXdLSA83bzByZ9JNV4NZMz5ZcRhjf89+8j1TYGM1iFjP+Hvli8v+5NYO9arSY3GZqLYgsnr41XNowL4Ot9soWDLK73zehRiylbqu7nXkMy6fTpT1mf5ue6ABHrmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4db385e046dso9808721cf.0
        for <linux-i2c@vger.kernel.org>; Thu, 02 Oct 2025 06:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759410100; x=1760014900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec+ndxQ3jnu1a8VNviNr06HkWUDsCBC6MfDIjOmWDIU=;
        b=RbeEqe0pEnlqtolF5zU6Q6jXNJvfzkXK0b5p6iZGJea/1+CGf48sbYnas3ijKbrAIo
         OgPBxZ02TyjmO/LekFV5+es+/+2BENPcgy8d3rC08RN/eHblON98iq0jnJGJU6KwZtcv
         cjrFGYvl/Zaq+yn4cK/w/VsGKjIx0/mXNX41/jA9xDOE8WG+MORNvTWLuPtvDNm/vMFD
         lbvyZ7xrIBpblyNLpuagfMCmdUGl6fdHiXbeRfuIPcXZWdkA/VP0qe7quT5UMaoXp1gg
         XEBrg/z/yHcmpZ2bjDAeYvWAXL32vRzTBtbh+snaWTfOfZC4dzURklxdCav1n7ayvfzV
         YWQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoQDD2sWDMnSEQ/KWlUXMDICD0qm91t+j4EUP02Z7qgfF5ejuBAtgPGEGGfJ/QsvOY20pmTKfqnak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv6CAgJWjf2j+oQKSq1W7LMYCfixA1qmZgfjSSrHCr9B4eVFy0
	4KJeFelCoBh1Waad056P+49bqXSdOKpAQKtzsus4paF3H8LHxRB5dSC7K6fDpTgF+YHoCw==
X-Gm-Gg: ASbGncspxpxgMOeLPTpbIvmeF4Ma6OVs2tjpuE0kn0o3LqxLAdseuF8oqz8vcpI56uT
	y2KPZffqqbZoiV+zD4UydlfuKejiI6dhaIg8iVfkBVpqp1Ja5PJciNN/gUZo8gH52962TCyiaSR
	2KT1YUKYBkushIaXGpB9bhv+74X1yM1KVYFPizSn+/jPZ1JYj3xfhh1+N29bVIkUU46TeX53TTU
	YKY7nHrwJR4FjqWtJkcHjVa05Jbxcc6RuMbB3JnxUQQlalXDISDoWL4zO0CFdlp5Cval2EvzAfT
	Y3IU9JzVOmRfghzTS4hnjwh0dHHnhvHAGKjZRuFQIzwGGAmSCeCSAxNHczV5oLhBN/fvEP9Xh9D
	AQ76FiSZ6FVIBbZjpShA1+ka2e33XPs7kjgVFpnV4XogmM/Y9sBGkSpu08NYZj8HJWdTHXRu7fB
	UKgwmCEJeL5CTtOivJEGU=
X-Google-Smtp-Source: AGHT+IEIq5Ep5xRNni2h3Pcm0tGSxstyqKuO0WQSN708IuXa/+JLFAQDmDBKzBk+XKBbxUAvbMYC7w==
X-Received: by 2002:a05:622a:1888:b0:4b7:a680:2111 with SMTP id d75a77b69052e-4e41c4501ddmr98995641cf.8.1759410099820;
        Thu, 02 Oct 2025 06:01:39 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55a4448desm19334051cf.9.2025.10.02.06.01.39
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 06:01:39 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-78e4056623fso9393206d6.2
        for <linux-i2c@vger.kernel.org>; Thu, 02 Oct 2025 06:01:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUj6JXMt64EiFeF85MPSU/zEBhWYhSRjMqKikrfPZHAXzoOG3AdW8lTY+8xQQoRbODBzA05fUeglfU=@vger.kernel.org
X-Received: by 2002:a67:f74a:0:b0:5d3:fecb:e4e8 with SMTP id
 ada2fe7eead31-5d3fecbe643mr2057033137.5.1759409779799; Thu, 02 Oct 2025
 05:56:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002081247.51255-1-byungchul@sk.com> <20251002081247.51255-3-byungchul@sk.com>
 <2025100255-tapestry-elite-31b0@gregkh>
In-Reply-To: <2025100255-tapestry-elite-31b0@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:56:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXuXh4SVu-ORghAqsZa7U6_mcW44++id9ioUm5Y4KTLw@mail.gmail.com>
X-Gm-Features: AS18NWCmqHU8DKNueQjpF6Ifrv2W5fzYfUTjQ8XBBt-1KrFWqeUHHsvmYo_0fpY
Message-ID: <CAMuHMdWXuXh4SVu-ORghAqsZa7U6_mcW44++id9ioUm5Y4KTLw@mail.gmail.com>
Subject: Re: [PATCH v17 02/47] dept: implement DEPT(DEPendency Tracker)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Byungchul Park <byungchul@sk.com>, linux-kernel@vger.kernel.org, kernel_team@skhynix.com, 
	torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com, 
	linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, 
	linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org, 
	joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch, 
	duyuyang@gmail.com, johannes.berg@intel.com, tj@kernel.org, tytso@mit.edu, 
	willy@infradead.org, david@fromorbit.com, amir73il@gmail.com, 
	kernel-team@lge.com, linux-mm@kvack.org, akpm@linux-foundation.org, 
	mhocko@kernel.org, minchan@kernel.org, hannes@cmpxchg.org, 
	vdavydov.dev@gmail.com, sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, 
	cl@linux.com, penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, 
	ngupta@vflare.org, linux-block@vger.kernel.org, josef@toxicpanda.com, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org, 
	dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org, 
	dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com, 
	melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com, 
	chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com, 
	max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com, 
	yunseong.kim@ericsson.com, ysk@kzalloc.com, yeoreum.yun@arm.com, 
	netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com, 
	corbet@lwn.net, catalin.marinas@arm.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	sumit.semwal@linaro.org, gustavo@padovan.org, christian.koenig@amd.com, 
	andi.shyti@kernel.org, arnd@arndb.de, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com, 
	mcgrof@kernel.org, petr.pavlu@suse.com, da.gomez@kernel.org, 
	samitolvanen@google.com, paulmck@kernel.org, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com, josh@joshtriplett.org, 
	urezki@gmail.com, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	qiang.zhang@linux.dev, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, chuck.lever@oracle.com, neil@brown.name, 
	okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com, trondmy@kernel.org, 
	anna@kernel.org, kees@kernel.org, bigeasy@linutronix.de, clrkwllms@kernel.org, 
	mark.rutland@arm.com, ada.coupriediaz@arm.com, kristina.martsenko@arm.com, 
	wangkefeng.wang@huawei.com, broonie@kernel.org, kevin.brodsky@arm.com, 
	dwmw@amazon.co.uk, shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com, 
	yuzhao@google.com, baolin.wang@linux.alibaba.com, usamaarif642@gmail.com, 
	joel.granados@kernel.org, richard.weiyang@gmail.com, geert+renesas@glider.be, 
	tim.c.chen@linux.intel.com, linux@treblig.org, 
	alexander.shishkin@linux.intel.com, lillian@star-ark.net, 
	chenhuacai@kernel.org, francesco@valla.it, guoweikang.kernel@gmail.com, 
	link@vivo.com, jpoimboe@kernel.org, masahiroy@kernel.org, brauner@kernel.org, 
	thomas.weissschuh@linutronix.de, oleg@redhat.com, mjguzik@gmail.com, 
	andrii@kernel.org, wangfushuai@baidu.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
	rcu@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, 2 Oct 2025 at 10:25, Greg KH <gregkh@linuxfoundation.org> wrote:
> > @@ -0,0 +1,446 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * DEPT(DEPendency Tracker) - runtime dependency tracker
> > + *
> > + * Started by Byungchul Park <max.byungchul.park@gmail.com>:
> > + *
> > + *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
> > + *  Copyright (c) 2024 SK hynix, Inc., Byungchul Park
>
> Nit, it's now 2025 :)

The last non-trivial change to this file was between the last version
posted in 2024 (v14) and the first version posted in 2025 (v15),
so 2024 doesn't sound that off to me.
You are not supposed to bump the copyright year when republishing
without any actual changes.  It is meant to be the work=E2=80=99s first yea=
r
of publication.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

