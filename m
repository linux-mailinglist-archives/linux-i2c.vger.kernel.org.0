Return-Path: <linux-i2c+bounces-14326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16994C8E57B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 13:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B67E3AED79
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 12:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214A8315D25;
	Thu, 27 Nov 2025 12:52:18 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7BE30B52E
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 12:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247938; cv=none; b=tQbiK0VKMZgVMtaEYPK0J7/VNG8dScYWMXjicWqiDZvwpyUPBZuvj0RRoga7uh3M2GbtYi9kkHj32yLs82YSm0zefR2xefX+wp6nWMjPc4xefHTKosgpWYmtcAtbslmFdrj4wjMg/taq4bEH9ByvXwjzt3IR7aPnReO4UVFE+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247938; c=relaxed/simple;
	bh=FJM1n7JsAk9/dOgmQTcvpABhbLk73QPoGdPDbWfqDIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOf14CvfDHoByH7dy6ByhI3cSXoSerKXSTiZ+rm/CzNhF9WeuoLnU9J0U6HjEA9M7KFPZOXGndx9ZYYZ3HprHMa+7Yc/qnUX1yuBnlZiYMJaq7IP7GTOLsU+ebOapKMXEQtvyKtmSYe4KQw04hNeV6arRbPqq5P6vqtzs/u7FTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55b22d3b2a6so533026e0c.1
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 04:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764247935; x=1764852735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjYT7JRJe3Gqrk9ZtGCdcYVgPeOXASFBXLgUHTdPheE=;
        b=drZYSmKZyHdtjcv5iaiKIMvDPRXsGiC9se+YhToPDUaNa1kKZf0dlpOG7IMhuqgrOc
         8cc5iZDnP3iO5VZSQ35xjg0HWyXCK06Fc9PdykzhatH0UAuvKoUjrAgz0oyvyS5F3xEh
         yp8cIKI8mqZq5XGnTDgRjJ92A1jdfsAa/q6nanXFfyGbuvpKtvxWRp1rs7AbOYoyPlpO
         efsBpcU8Rd9dw9TMVBg4TPqpfdGVHQme/RndBDigvXfz1dtRwLAvlKKWxjga/wucKpYN
         sZUCR3aBCIiaZ5FhcTmEnDWIpS1699EysnqqHfIidRXE/rpCjA6B0AQfE/q1WZ8LSKuw
         M8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1K+LQa1A2lq5Strmkkg5yABLjZR6uCs6iXFt3WEm2YkIfzo+5jCKHckbFWoY+BXYigAgUfRe+rRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjcY/7H9C1eZcGXcPm2nyjrtjWGQ8VNNYzMuoWjV7pz9Q012uc
	X9qhzSekjHcDQmCJQqQtYSuQloy7tHZP+KTt2i/NrLokA1rXPgZQIrE2INWEPTbY
X-Gm-Gg: ASbGncsTBxchZduK/vxqiYCytjyVIaYNJvsOkXlS3kuqe/sYItg4GozHXcH01RG3ihy
	JALFiuHlh+leXBshUd1zFmkpdFsqA22mTDp6COj5DSsJOO6UhWoNzJyuLEtG5SWbCYURv0kVaHe
	y3yxqy8U9fP1pMyK20jj/o7pUuOuueP3MOQA2uwi5YXSSRDpUUMGvvuQS0ZrXWMtKoglZhv3QMD
	SLeUcftY0556/GIiEFQPJp450hVwwHyQgOFfifCnt/QcfT4dTypSN/DcPavyqpxZwabkNuQTCb1
	XKmqtA8pVEtveRBWxsNnHLd063JI6+g6SdRNEKknRdZG3pufMGxh2PtPkZ1QsW60y1jmAAiov+I
	ZEiykP1PJriPFCCVltIMoBGGB/niH9FbS7HRDMzmWf78/5wC5sbtm+c1gvc49r4iOd3Hj+DfjI3
	ItcUCGMmMqlB2Rz9PYSAWOfjJgkYd/QKvwZZc/++euUpHMbQ1a
X-Google-Smtp-Source: AGHT+IEoHC5NVycMiGZJ9Z/ltHQ7SCRIFRtLb8KLu5G+IxjgVG+4sYBUl+rpjP1Tz0QLlTdDYKaAsg==
X-Received: by 2002:a05:6122:d1e:b0:55b:9bef:2530 with SMTP id 71dfb90a1353d-55b9bef4661mr7094311e0c.6.1764247934665;
        Thu, 27 Nov 2025 04:52:14 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf4e1d575sm529494e0c.3.2025.11.27.04.52.13
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 04:52:13 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso703006137.1
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 04:52:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVW6noALQtU3ugC/tOtcANXkmeokVKwl2k5su9dEoPAJSNezkm5ocSlLnulYXdDdsJaJIBuRzIeTUk=@vger.kernel.org
X-Received: by 2002:a05:6102:4492:b0:5db:dad4:840 with SMTP id
 ada2fe7eead31-5e1c40dc2ffmr11440563137.12.1764247933503; Thu, 27 Nov 2025
 04:52:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
 <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com> <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
In-Reply-To: <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 13:52:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com>
X-Gm-Features: AWmQ_bkZiOzXPS0HFic3DjDBZhimEkCswEaupj15K-zH3plFs36PgNAI9kUlDvg
Message-ID: <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 27 Nov 2025 at 12:48, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 27/11/2025 12:42, Krzysztof Kozlowski wrote:
> >>> --- a/drivers/i2c/busses/i2c-rcar.c
> >>> +++ b/drivers/i2c/busses/i2c-rcar.c
> >>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
> >>>         if (IS_ERR(priv->io))
> >>>                 return PTR_ERR(priv->io);
> >>>
> >>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
> >>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
> >>
> >> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
> >> The former seems to be the least common option.
> >
> > As I wrote in the first patch, because to my knowledge it is the

I don't see that written in the first patch; it has the same patch description
as the other patches in the series (mutatis mutandis)?

> > preferred form for holding driver data which are in general pointers. We
> > do not store pointers as unsigned long. It is also already used for the
> > driver data types - see include/linux/mod_devicetable.h.
>
> ... and in case it is still not obvious: I do not cast here to final
> type, because that cast is the reason for the warning.
>
> I cast to an intermediary type to help compiler suppressing the warning

I know...

> - to integer representing the pointer. Unsigned long is not representing
> pointers in the kernel. Integer type representing the pointer is

"unsigned long" indeed does not represent a pointer, but in the Linux
kernel, it is guaranteed to be the same size as a pointer.

'"unsigned long" is superior'
https://lore.kernel.org/CAHk-=wj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVLMXHe7A1d-g@mail.gmail.com
(he doesn't seem to have said anything about kernel_ulong_t)

> kernel_ulong_t, I think.

include/linux/mod_devicetable.h:typedef unsigned long kernel_ulong_t;

IIRC, it was introduced originally because "unsigned long" might have
a different size in userspace.  Nowadays (for x32), uapi uses
__kernel_ulong_t, though.

> Once you have integer type representing the pointer, you do not need
> further casts to enum.

True.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

