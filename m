Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F150364E8D
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Apr 2021 01:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhDSXW2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Apr 2021 19:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbhDSXW1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Apr 2021 19:22:27 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DD0C06138A
        for <linux-i2c@vger.kernel.org>; Mon, 19 Apr 2021 16:21:56 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id g16so10951695pfq.5
        for <linux-i2c@vger.kernel.org>; Mon, 19 Apr 2021 16:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lTXVzOlOEiCu/x5YV8po+6uFDpU/Gnvba9Ryw/CBpDM=;
        b=ZJyb1R+5bJFnqwF3bQmGCPzsnXZi3BRzYioz/NexC7553PawPQ4hN81uwcxrl5jYwh
         44KnRZxy5l3BtVmRR0fKQ1HSNamXhaz0j3rRjCXElrfWqpARK+BlLxuqng04RnupdHCV
         ouqKIYNxXJZCz7vgyumEtJwA5s3ihMYTulQ3fXYvqyuF+r6Ie1MYI1PJ+OCqoUWHAbd6
         ugeaIZlRwyE5yE81dug1aMAHGyJAODJ/C9FE3cnATcft6jMTij84CRLgxVNPYOEibWQw
         lQCsnRDNMaS2I1shMJNXZ1aq1enDKn2Rw4t96KTiGTChE000tJ7+kcEXAnsrWtw4L5n9
         CLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lTXVzOlOEiCu/x5YV8po+6uFDpU/Gnvba9Ryw/CBpDM=;
        b=rie2vdeb7WntrRu1mPHD0lhbts7oVy7TjXJFWElNPrrP79V9nY5AfMJUBHxFYjKabB
         Xnt4ZdU+c/npxuxaKu3yRV2KSAybseRJoNHCtfIQBYvJxf2nzVW+bm2LRGA+1f4MPxD6
         c3z06gL0mZ2dJhcjQ1vl5mvG+XDthIO/mF4bqQlgWdsqmNPpNJ52YyDZY/jkuQ6zlx5V
         85b4DUQDkSSLcUZDDxJlRi16DBuSgIlQvmcU7HlGAx9qZbRomNGuafd0uWuWK/rPYZvU
         DX+bP2pXahSoTJ9t4sGdavufqhSi8uFAR2XPr51lb2n8n0aPOY6VcQNjmfgoNNlkuWAf
         AUtQ==
X-Gm-Message-State: AOAM530+k4y2Z6gswPTN7h1KjVm6EaYBEMIv1YDAmmYkEH+mUJEUIxQ3
        VIMm9UnQqVXv+EFqIaJfTE3GxlU/D+nj/178u58lpA==
X-Google-Smtp-Source: ABdhPJzsPHdZ6m2OrgGWPr4K75bxd1by1RdKGIUuNZzqLN0SBU3Lr+re4qvr2NPbNXKYNUG76KA+mrxWCCSIV0F3xDM=
X-Received: by 2002:a63:b515:: with SMTP id y21mr5324980pge.253.1618874515638;
 Mon, 19 Apr 2021 16:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210407185039.621248-1-varmam@google.com> <20210407185039.621248-2-varmam@google.com>
 <20210409183415.GA3919775@robh.at.kernel.org>
In-Reply-To: <20210409183415.GA3919775@robh.at.kernel.org>
From:   Manish Varma <varmam@google.com>
Date:   Mon, 19 Apr 2021 16:21:44 -0700
Message-ID: <CAMyCerLy2bA_D=8j9C+pAUe7fDHh9DYJwXQWGgKGnD-dadnewg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: add "dev-name" property to
 assign specific device name
To:     Rob Herring <robh@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

Thanks for the inputs.

On Fri, Apr 9, 2021 at 11:34 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Apr 07, 2021 at 11:50:38AM -0700, Manish Varma wrote:
> > I2C devices currently are named dynamically using
> > <adapter_id>-<device_address> convention, unless they are instantiated
> > through ACPI.
> >
> > This means the device name may vary for the same device across different
> > systems, infact even on the same system if the I2C bus enumeration order
> > changes, i.e. because of device tree modifications.
> >
> > By adding an optional "dev-name" property, it provides a mechanism to
> > set consistent and easy to recognize names for I2C devices.
>
> So? Why do you need 'easy to recognize names'?
>

From the cover letter:

"Currently I2C device names are assigned dynamically unless they are
instantiated through ACPI, this names are based on adapter_id and
device_address. While device_address will remain constant for a given
device, the adapter_id may vary across different systems and hence,
overall, the device name won't be unique for the same I2C device."

Basically, the motivation here is to provide a mechanism to allow overriding
those names to easy to recognize names (e.g. <vendor_name_dev_name>
or <device part number> which leaves more information compared to just
device name in the form of numbers such as "2-001f").

These (device) names are further used by different module e.g. system
wakeup events framework, and hence this presents difficulties debug/identify
issues at various levels in the software stack.

So, the idea was to address it at the lowest level possible.

> Why is I2C special? If we wanted this in DT, it wouldn't be I2C specific
> and we probably would have added it long ago.
>

"Unlike PCI or USB devices, I2C devices are not enumerated at the hardware
level. Instead, the software must know which devices are connected on each
I2C bus segment, and what address these devices are using. For this
reason, the kernel code must instantiate I2C devices explicitly."

Reference: https://www.kernel.org/doc/Documentation/i2c/instantiating-devices

There are various ways to instantiate I2C devices e.g. through board_info
interface, ACPI and device tree etc.

While board_info and ACPI both allow specifying device name, I find no such
provision to assign device names for the I2C devices instantiated through
device tree interface.

> > Signed-off-by: Manish Varma <varmam@google.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> > index df41f72afc87..6fb03f464b81 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> > @@ -130,6 +130,11 @@ wants to support one of the below features, it should adapt these bindings.
> >  - wakeup-source
> >       device can be used as a wakeup source.
> >
> > +- dev-name
> > +     Name of the device.
> > +     Overrides the default device name which is in the form of
> > +     <busnr>-<addr>.
>
> What's 'busnr'? No such thing in DT.
>

Right! dev-name introduced to hold the string value for overriding
device names assigned by the kernel. Currently, kernel assigns the device
name in the form of <busnr>-<addr>.

Reference:
https://www.kernel.org/doc/html/latest/driver-api/i2c.html?highlight=i2c_board_info#c.i2c_board_info

> > +
> >  Binding may contain optional "interrupts" property, describing interrupts
> >  used by the device. I2C core will assign "irq" interrupt (or the very first
> >  interrupt if not using interrupt names) as primary interrupt for the slave.
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >

Hope the explanation provided above answers your questions.

Thanks,
Manish
