Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4D04869DF
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 19:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242711AbiAFS1m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 13:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242700AbiAFS1m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 13:27:42 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1552EC061245;
        Thu,  6 Jan 2022 10:27:42 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id w7so3016786plp.13;
        Thu, 06 Jan 2022 10:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mskw7uRlhAFhUG1ieckeOXErw6hEhTea/5asqxMmxpk=;
        b=i/GcDhyaX50tOzDh3q0HK6hf76bXDlavHTpMP1l9tTv/MYIcVbDSpaK6lbV9Lw50bo
         PZk1n9aH2f04xN/8pNrmF9i1gtFdmBjJwU/cW32nSbm2RZSy3x4Izu8Iv5pNlqBgy7rj
         3PEwL6pRG9GCSOz7l1CREcgEV8ks93l/ad7kiy9UM7lWvNs0f7vTu0spcBr9xsc4rVZC
         S+lgtkpixDb8KU96kydlqPSZ7heDqYXeLXL2IyPCaBgLx4IEUumkz63L6C7or8+oEchY
         gp030+AJSvDk4mUPmz79366wP8JJ6LNTgRKLmYnt6b4A/NNesmluLZfI9joSkMqieTWf
         6PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mskw7uRlhAFhUG1ieckeOXErw6hEhTea/5asqxMmxpk=;
        b=l6lLuwChfzZGGM2Qfx0VKnrMtx3FMb4FuXDsmtnCh1mwLjhpJitGKuAjzGrt0+ZxAs
         D9sbOVSbDLTsX9kEfpocbUlB2Cs9pNDXD4/PXbFohbfSLRJi8ghf6uJGuYy4/wacaC83
         G/kYbN5OUU1dQiGyNUwMnR4dNUycELsH73AWOKiwa+BhsZplCLj2DWNCYNcIAsx6h+Yy
         WpnovHtkVf9ylFWUKypvOz7m7tcTBKGtQhNcwryQzpya5GKQPlMlcu35HwU3QJ8jZ+45
         zwfcKpwguojF37gK7GgVtn5PgeEepx3wIx0JgUDzAaX/WdkYoEY7og1Z5LBYU/tdOz21
         Kq4A==
X-Gm-Message-State: AOAM533JD+9nqtuKFfRQ0o2aGm+RvkEKdm7SRX1MQUm4yDDUayXQVfs5
        GhJ0XAUyqOcrc2LQHU1NG+V9xtAIrhFfF8wz0kDse3Hwrfw=
X-Google-Smtp-Source: ABdhPJxioa7rcwPE0lFktDCQ6DbH1RYvLWNIoLFDp+0GzCd8NClECEKzb9SGrRzq+r7SW1t8P3DUUPpAX1xAmYQNmtc=
X-Received: by 2002:a17:90b:17cb:: with SMTP id me11mr11426840pjb.28.1641493661438;
 Thu, 06 Jan 2022 10:27:41 -0800 (PST)
MIME-Version: 1.0
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
 <f8c13907-d296-baa6-7637-c5f8aa96b7ff@gmail.com>
In-Reply-To: <f8c13907-d296-baa6-7637-c5f8aa96b7ff@gmail.com>
From:   Andrea Ippolito <andrea.ippo@gmail.com>
Date:   Thu, 6 Jan 2022 19:27:05 +0100
Message-ID: <CAGhUXvCMyVD3aP7Mi+i2hz0A0FePJvPSceubXm=u+4AR+wgesA@mail.gmail.com>
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
To:     =?UTF-8?Q?Miroslav_Bend=C3=ADk?= <miroslav.bendik@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Miroslav,

forgive me if it's a dumb question, but would this also apply to Intel
platforms, or this kind of stuff chip maker specific?

I got an Intel Tiger Lake.

Thanks!
Andrea IPPOLITO

Il giorno gio 6 gen 2022 alle ore 16:03 Miroslav Bend=C3=ADk
<miroslav.bendik@gmail.com> ha scritto:
>
> Address detection does not work because cd6h/cd7h port io can be
> disabled, but
> it's accessible using mmio. This patch:
> https://lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/
> with
> modified AMD_PCI_SMBUS_REVISION_MMIO fixed base address detection.
>
> Problem with RMI4 touchpad / trackpoint remains, because rmi4-smbus
> needs host
> notify feature. I have tried implement this feature, without success.
> Interrupts
> on IRQ 7 (SMBus) are generated only for block data transfers, but not for
> trackpoint / touchpad move actions. I have looked at pinctrl_amd and it
> looks,
> that activity is signaled using GPIO. This looks promising:
>
> cat /sys/kernel/debug/pinctrl/AMDI0030:00/pingroups:
>
> group: i2c0
> pin 145 (GPIO_145)
> pin 146 (GPIO_146)
>
> group: i2c1
> pin 147 (GPIO_147)
> pin 148 (GPIO_148)
>
> group: i2c2
> pin 113 (GPIO_113)
> pin 114 (GPIO_114)
>
> group: i2c3
> pin 19 (GPIO_19)
> pin 20 (GPIO_20)
>
> After loading psmouse with forced enabled intertouch pin 19/20 started
> generating events.
>
