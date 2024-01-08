Return-Path: <linux-i2c+bounces-1205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890DC826BA7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 11:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34E12282BAA
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 10:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D116C13FF0;
	Mon,  8 Jan 2024 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlmbdrEW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6144E13FEB;
	Mon,  8 Jan 2024 10:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-466fb1cbfe9so79487137.0;
        Mon, 08 Jan 2024 02:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704710269; x=1705315069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkXZpj9IoPppjOKTWfm9hJl1kmHy1SjAqR3mOM+/XXE=;
        b=TlmbdrEW7plBnM/S5ygKmKdE3pBDeL7FfWwOXWOhrQiXem6VpPMkpuk0jiR4ONvnfg
         KegZn5trARK4MgwKErRU1jMbRK6EifE8wxP308BPhzUzeyVEW3V2ui08L4yQmtOGsFKy
         amseyCho2fEMaqohWa2EkDCy8+AbOLM133RUYJFKGrogxzKTYcAPaQbnHqh8MnPfMADN
         bQaI8547g+J76WWEVm3tbs68br37zomuST5PU/XOHmnRvTZssllozoMzwTl0QkpP//p4
         /Qh7y8FKD7Da9HFl5Up7t7Gh4G/rK1u14wehAJFaUervfrBRVNrGVhP4KfgzHONDtNSY
         qMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704710269; x=1705315069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkXZpj9IoPppjOKTWfm9hJl1kmHy1SjAqR3mOM+/XXE=;
        b=Hd7W4IMIDOrATz1gswIKS6T9/gLW2ZKvzWHq+ntJ/Ue+v94p9VD/qMGq30y8NxhCuU
         izx3wGa75aodyDdz+sWWS/ZucL6KsjM3FuCk5zL0bRfz/Y/JUJnfpJ3i6pNNqlDQHvui
         x4NZfYaTHrahyLh+okLiQu2kit1NIy203/JEqIsVRpQHHhY2VEYyVrA6TR8M2dLnloD7
         2vM6BWsQR+FvZsKy9KgfwHRTEVXOKJ4DGTObO7V0U2WAIwURlXUuIPdqWdFxetyoDH20
         NsiSQ2c40IL47P3C/klv6SBqOuxQDRuXuyCLF54NVm+XCBwY4UzJMjR+eR2m9RFK5iT3
         44BQ==
X-Gm-Message-State: AOJu0YzftxN/QkAC3QD83YvfgzNqaZk7VHUfajkeb97Svi6SgBh8RRni
	I5D+Nxs5bfIWXftp0hs0hsre6sjRuZluwzs1GuI=
X-Google-Smtp-Source: AGHT+IFNTAMeCc4HAtGA/zPMHZDW+GxuGDccVtJh4vedf8EFdatFE+mFgumfdXVcfky8EcBkOL8jGCsnJCEYQ4hDMGk=
X-Received: by 2002:a05:6102:668d:b0:467:d9f6:f96e with SMTP id
 gw13-20020a056102668d00b00467d9f6f96emr228015vsb.32.1704710269116; Mon, 08
 Jan 2024 02:37:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108062059.3583028-1-shinichiro.kawasaki@wdc.com>
In-Reply-To: <20240108062059.3583028-1-shinichiro.kawasaki@wdc.com>
From: Klara Modin <klarasmodin@gmail.com>
Date: Mon, 8 Jan 2024 11:37:38 +0100
Message-ID: <CABq1_vgw6W4OmdFqed1PpZaWSJHA-81gwR_E3FgXOECNNFcjOg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] platform/x86: p2sb: Fix deadlock at sysfs PCI bus rescan
To: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	linux-pci@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den m=C3=A5n 8 jan. 2024 kl 07:21 skrev Shin'ichiro Kawasaki
<shinichiro.kawasaki@wdc.com>:
> Klara,
>
> I hesitated to add your Tested-by tag to the v6 patch, since I modified t=
he code
> slightly from the code you tested (I used pci_bus_read_config_word() inst=
ead of
> pci_bus_read_config_dword() to avoid a shift operator). I hope you have t=
ime to
> afford to test this series again.

I can confirm that the patchset is still working correctly on my
machine with this change.

Thanks,
Tested-by Klara Modin <klarasmodin@gmail.com>

