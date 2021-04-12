Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E6435D387
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 00:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343920AbhDLWz5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 18:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343902AbhDLWzz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 18:55:55 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50370C06175F;
        Mon, 12 Apr 2021 15:55:36 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d8so7162429plh.11;
        Mon, 12 Apr 2021 15:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SD2piBdrDkHdIsFcssPgit+YzlJAswwz9oFQNtIobk4=;
        b=nZya3UXmlWe4SdNcQzNO26AY5IIgyIfTbs7gA/gcb/CXaJZAoDo4DR+FbQVywPeUkj
         5TuhLV+au/4FarSWqKc3xtL+SUVWl7fQd140edi3at5delN9UkNMBtvzGSjxgacyqajS
         pEqSpc2Ql1DmDVRk0/jLXGhr9IvUmjqfYflxLTD7fO791XHfUeDGF3XtX+/Dt8V5sP+A
         0o0ZuC27rYFdPznzyV/T9O3NSZUXXI3hZPz5kucqnq2CflhL5HLjlcXJd9EgrORrULAj
         TO4yixjCFDuHRlrTPW++hdxCdoe/JVxNi93y4zzacusfwD6TCMasv5tzhZkD0cmer14f
         37bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SD2piBdrDkHdIsFcssPgit+YzlJAswwz9oFQNtIobk4=;
        b=elFwdnpIgffzjgWRGKhmifEmxqlIXg3zqk7zQnQNG3ewKRoY4rRA0gF00Qcld3PTQb
         icwpqUsNbYZev5ZktShK7UT0vR1m8/2zlcGgaPNZw1BkGsbJln84khl/vO2k1piaqafA
         IhhYkNN2vQ3Jata6F4HWLWkVMiTQvJqwnzypAbGKpJRyt3WiIpCxax3WOF5v++FR8AqL
         Z66tnEMEpjg3S6/DJq23tywh5/DrX1bilN3J/c9b+5VwI99Kq3sgV493UOmDMUIo2Qkw
         qSDobOYaIm6Lc9lTcqJcIBCtxlEjrz7DYJJnwwOciReNG+CrDZ1PoBRgruc6/hZgKUVT
         DwNA==
X-Gm-Message-State: AOAM532xD/9GQleRtCCoML/C2P9U9OpFWzQNNm642SFRdarE8CXcX4CX
        Au1fOB3UpdqT7WyJeKtfmoipiw3+xCgFvaSZ7vM=
X-Google-Smtp-Source: ABdhPJyCQ2BQabpLB8huut11v2VL6r3i49FMlyNzf9zBO+OxJDBXiL+ud+Kkm/x3yIZuDBenoZSS2r7tcINCgoGd5AE=
X-Received: by 2002:a17:902:e803:b029:e9:1f79:2427 with SMTP id
 u3-20020a170902e803b02900e91f792427mr29069401plg.21.1618268135835; Mon, 12
 Apr 2021 15:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-6-chris.packham@alliedtelesis.co.nz> <CAHp75VfRXeeP0uQFDBUS6=n2TvG+_5=pe8rWp6BpbDNMz6=OSg@mail.gmail.com>
In-Reply-To: <CAHp75VfRXeeP0uQFDBUS6=n2TvG+_5=pe8rWp6BpbDNMz6=OSg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Apr 2021 01:55:19 +0300
Message-ID: <CAHp75VeQbtOOoK9M-bz7Phgd_k9tyB-9nnqc_9tNRXYGyB3=bQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] i2c: mpc: use device managed APIs
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 13, 2021 at 1:52 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Mar 29, 2021 at 4:54 AM Chris Packham
> <chris.packham@alliedtelesis.co.nz> wrote:
> >
> > Use device managed functions an clean up error handling.
>
> For the god sake how have you tested this?
> The patch is broken.

Looking into i2c-next and taking into account we are at rc7 I think we
must revert this.

-- 
With Best Regards,
Andy Shevchenko
